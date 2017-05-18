
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Company_Index]'))
    DROP VIEW [dbo].[Company_Index]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
create view Company_Index ( ID, ORG_CODE, MEMBER_TYPE, CATEGORY, STATUS, COMPANY_SORT, FULL_ADDRESS, COMPANY, CITY, STATE_PROVINCE, COUNTRY ) AS select ID, ORG_CODE, MEMBER_TYPE, CATEGORY, STATUS, COMPANY_SORT, FULL_ADDRESS, COMPANY, CITY, STATE_PROVINCE, COUNTRY from Name where Name.COMPANY_RECORD = 1

GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Login]'))
    DROP VIEW [dbo].[Login]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[Login]
AS
SELECT     b.ContactID, a.FIRST_NAME AS FirstName, a.LAST_NAME AS LastName, a.EMAIL AS EmailAddress, a.COMPANY AS CompanyName, 
                      a.DESIGNATION AS Title, b.WEB_LOGIN AS UserName, b.PASSWORD, NULL AS PasswordHint, a.ID AS BEMemberID, a.ID AS iMISMemberID, 
                      CASE WHEN (b.EXPIRATION_DATE IS NOT NULL AND b.EXPIRATION_DATE < CURRENT_TIMESTAMP) OR
                      b.LOGIN_DISABLED = 1 THEN 'Y' ELSE 'N' END AS DisabledFlag, 0 AS NumLogin, NULL AS LastUpdateDateTime
FROM         dbo.Name AS a INNER JOIN
                      dbo.Name_Security AS b ON a.ID = b.ID INNER JOIN
                      dbo.Name_Fin AS c ON b.ID = c.ID
WHERE     (a.STATUS NOT LIKE 'D%')

GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Login_Security_Group]'))
    DROP VIEW [dbo].[Login_Security_Group]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE      VIEW Login_Security_Group
AS 
  SELECT a.ID,
	 b.ContactID,
         b.ContactID AS MemberID,
         MEMBER_TYPE AS SecurityGroupCode
    FROM Name a, Name_Security b
   WHERE a.ID = b.ID
  UNION
  SELECT c.ID,
	 b.ContactID,
         b.ContactID AS MemberID,
         a.SECURITY_GROUP AS SecurityGroupCode
    FROM Name_Security_Groups a, Name_Security b, Name c
   WHERE a.ID = b.ID
     AND a.ID = c.ID
     AND b.EXPIRATION_DATE > CURRENT_TIMESTAMP

GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Security_Group]'))
    DROP VIEW [dbo].[Security_Group]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE      VIEW Security_Group
AS 
  SELECT SECURITY_GROUP AS SecurityGroupCode, SECURITY_GROUP AS SecurityGroupName
    FROM Security_Groups
  UNION
  SELECT MEMBER_TYPE, DESCRIPTION + ' (Member Type)'
    FROM Member_Types
   WHERE MEMBER_TYPE NOT IN (SELECT SECURITY_GROUP FROM Security_Groups)

GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vGift]'))
    DROP VIEW [dbo].[vGift]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vGift]
  AS
    SELECT 
        Activity.ID ID,
        Activity.ORIGINATING_TRANS_NUM OriginalTransaction,
        Activity.ORIGINATING_TRANS_NUM TransactionNumber,
        max(Activity.SOURCE_SYSTEM) SourceSystem,
        max(Activity.TRANSACTION_DATE) TransactionDate,
        max(Activity.EFFECTIVE_DATE) DateReceived,
        sum(Activity.AMOUNT) Amount,  
        sum(Activity.TAXABLE_VALUE) AS FairMktValue,                                -- 2009/7/31  JHS modified FairMktValue to come from Activity 
        max(Activity.ORG_CODE) Fund,
        max(Activity.SOURCE_CODE) Appeal,
        max(Activity.SOLICITOR_ID) SolicitorID,
        max(C.CHECK_NUMBER) CheckNumber,
        (case max(Cash_Accounts.ACCOUNT_TYPE)
            when 1 then 'Credit Card'
            when 2 then 'In Kind' 
            when 3 then 'Debit Card' 
            else 'Cash' end) as PaymentType,
        max(Activity.CAMPAIGN_CODE) Campaign,
        convert(int,substring(convert(char(6),max(C.FISCAL_PERIOD)),1,4)) as FiscalYear,
        convert(int,substring(convert(char(6),max(C.FISCAL_PERIOD)),5,2)) as FiscalMonth,
        'GIFT' as GiftType,
        max(C.INVOICE_REFERENCE_NUM) InvoiceReferenceNumber,
        max(C.RECEIPT_ID) ReceiptID,
        max(C.MATCH_GIFT_TRANS_NUM) MatchingTransaction,
        max(C.IS_MATCH_GIFT) IsMatchingGift,
        max(C.MEM_TRIB_ID) MemorialID,
        '' as PledgeID,
        max(Activity.ACTION_CODES) ListAs,
        max(Activity.UF_4) RequestNumber,
        null as InstallmentDate,
        max(C.MEM_TRIB_NAME_TEXT) MemorialNameText,
        CONVERT(money,sum(Activity.AMOUNT)) AmountAsMoney  
     FROM Activity
        INNER JOIN Trans C on 
            Activity.ORIGINATING_TRANS_NUM = C.TRANS_NUMBER
        INNER JOIN TransWatch ON
            C.TRANS_NUMBER = TransWatch.TransactionNumber AND
            C.INVOICE_REFERENCE_NUM = TransWatch.InvoiceNumber
        LEFT OUTER JOIN Cash_Accounts ON
            C.CHECK_NUMBER = Cash_Accounts.CASH_ACCOUNT_CODE 
     WHERE 
        Activity.ACTIVITY_TYPE = 'GIFT' AND Activity.ID = C.ST_ID AND
        (
            (Activity.SOURCE_SYSTEM = 'FR' AND C.TRANSACTION_TYPE = 'PAY' AND C.JOURNAL_TYPE = 'IN' AND C.SUB_LINE_NUMBER = 1) OR
            (Activity.SOURCE_SYSTEM IN ('SC', 'DUES') AND C.TRANSACTION_TYPE = 'DIST' AND C.PRODUCT_CODE = Activity.PRODUCT_CODE)
        )
    GROUP BY Activity.ID, Activity.ORIGINATING_TRANS_NUM,  Activity.ORG_CODE, Activity.CAMPAIGN_CODE, Activity.SOURCE_CODE
UNION
    SELECT 
        CASE WHEN Invoice_Lines.ST_ID IS NULL THEN Invoice.BT_ID ELSE Invoice_Lines.ST_ID END    ID,
        P.TRANS_NUMBER OriginalTransaction,
        C.TRANS_NUMBER TransactionNumber,
        max(P.SOURCE_SYSTEM) SourceSystem,
        max(C.TRANSACTION_DATE)TransactionDate,
        max(C.TRANSACTION_DATE) DateReceived,
        (case when max(C.JOURNAL_TYPE) = 'IN' then sum(C.AMOUNT) else -sum(C.AMOUNT) end) Amount,
        sum(C.TAXABLE_VALUE) AS FairMktValue,                                 -- 2009/7/30  JHS Inserted a FairMktValue calculation 
        (case when max(C.JOURNAL_TYPE) = 'IN' then max(C.OWNER_ORG_CODE) else max(C.GL_ACCT_ORG_CODE) end) Fund,
        max(P.SOURCE_CODE)Appeal,
        max(P.SOLICITOR_ID)SolicitorID,
        max(C.CHECK_NUMBER)CheckNumber,
        (case max(Cash_Accounts.ACCOUNT_TYPE)
            when 1 then 'Credit Card' 
            when 2 then 'In Kind' 
            when 3 then 'Debit Card' 
            else 'Cash' end) as PaymentType,
        max(Activity.CAMPAIGN_CODE)Campaign,
        convert(int,substring(convert(char(6),max(C.FISCAL_PERIOD)),1,4)) as FiscalYear,
        convert(int,substring(convert(char(6),max(C.FISCAL_PERIOD)),5,2)) as FiscalMonth,
        'Pledge Payment' as GiftType,
        max(C.INVOICE_REFERENCE_NUM) InvoiceReferenceNumber,
        max(C.RECEIPT_ID) ReceiptID,
        max(P.MATCH_GIFT_TRANS_NUM) MatchingTransaction,
        max(P.IS_MATCH_GIFT) IsMatchingGift,
        max(P.MEM_TRIB_ID) MemorialID,
        (case when max(C.BT_ID)= max(C.ST_ID) then '' else max(C.BT_ID) end) as PledgeID,
        max(Activity.ACTION_CODES) ListAs,
        max(Activity.UF_4) RequestNumber,
        max(Invoice.INSTALL_BILL_DATE) as InstallmentDate,
        max(P.MEM_TRIB_NAME_TEXT) MemorialNameText,
        CONVERT(money,(case when max(C.JOURNAL_TYPE) = 'IN' then sum(C.AMOUNT) else -sum(C.AMOUNT) end)) AmountAsMoney     
    FROM Invoice 
        INNER JOIN TransWatch ON
            Invoice.ORIGINATING_TRANS_NUM = TransWatch.TransactionNumber AND
            Invoice.REFERENCE_NUM = TransWatch.InvoiceNumber
        INNER JOIN Trans P on 
            Invoice.ORIGINATING_TRANS_NUM = P.TRANS_NUMBER
        INNER JOIN Activity on 
            P.ACTIVITY_SEQN = Activity.SEQN
        INNER JOIN Trans C ON
            Invoice.REFERENCE_NUM = C.INVOICE_REFERENCE_NUM
        LEFT OUTER JOIN Cash_Accounts on 
            C.CHECK_NUMBER = Cash_Accounts.CASH_ACCOUNT_CODE
        LEFT OUTER JOIN Invoice_Lines ON
            C.INVOICE_REFERENCE_NUM = Invoice_Lines.REFERENCE_NUM AND
            C.INVOICE_LINE_NUM = Invoice_Lines.LINE_NUM
    WHERE  
        P.TRANSACTION_TYPE = 'DIST' 
--    AND Activity.ACTIVITY_TYPE = 'PLEDGE'                                         -- 2009/7/30 removed per Rusminah's fix
    AND C.IS_FR_ITEM = 1 
    AND
        (
            (   Activity.ACTIVITY_TYPE = 'PLEDGE' AND                   -- 2009/7/30 added per Rusminah's fix
                P.LINE_NUMBER = 1 AND P.SUB_LINE_NUMBER = 1 AND Invoice.SOURCE_SYSTEM = 'FR' AND 
                (
                    (C.JOURNAL_TYPE = 'PAY' AND C.TRANSACTION_TYPE = 'AR') OR
                    (C.JOURNAL_TYPE = 'IN' AND C.TRANSACTION_TYPE = 'PAY')
                )
            )
        OR 
            (   Activity.ACTIVITY_TYPE = 'PLEDGE' AND                   -- 2009/7/30 added per Rusminah's fix
                Invoice.SOURCE_SYSTEM = 'DUES' AND 
                P.PRODUCT_CODE = C.PRODUCT_CODE AND 
                C.JOURNAL_TYPE = 'PAY' AND 
                C.TRANSACTION_TYPE = 'AR' AND 
                P.INVOICE_LINE_NUM = C.INVOICE_LINE_NUM
            )
        OR                                                                                      -- 2009/7/30 added per Rusminah's fix
            (   Activity.ACTIVITY_TYPE = 'GIFT' AND                           -- 2009/7/30 added per Rusminah's fix
                P.LINE_NUMBER = 1 AND P.SUB_LINE_NUMBER = 1 AND   -- 2009/7/30 added per Rusminah's fix
                Invoice.SOURCE_SYSTEM = 'FR' AND                              -- 2009/7/30 added per Rusminah's fix
                C.JOURNAL_TYPE = 'PAY' AND C.TRANSACTION_TYPE = 'AR'-- 2009/7/30 added per Rusminah's fix
            )                                                                                   -- 2009/7/30 added per Rusminah's fix
        )
    GROUP BY Invoice_Lines.ST_ID, Invoice.BT_ID, C.TRANS_NUMBER, C.INVOICE_REFERENCE_NUM, C.OWNER_ORG_CODE, C.GL_ACCT_ORG_CODE, Activity.CAMPAIGN_CODE, P.SOURCE_CODE, P.TRANS_NUMBER
UNION
    SELECT 
        Activity.ID ID,
        Invoice.ORIGINATING_TRANS_NUM  as  OriginalTransaction,
        0 as TransactionNumber,
        max(Activity.SOURCE_SYSTEM) SourceSystem,
        max(Activity.TRANSACTION_DATE) TransactionDate,
        max(Activity.EFFECTIVE_DATE) DateReceived,
        sum(Activity.AMOUNT) Amount,
        sum(C.TAXABLE_VALUE) AS FairMktValue,                                 -- 2009/7/30  JHS Inserted a FairMktValue calculation 
        max(Activity.ORG_CODE) Fund,
        max(Activity.SOURCE_CODE) Appeal,
        '' as  SolicitorID,
        '' as  CheckNumber,
        '' as PaymentType,
        max(Activity.CAMPAIGN_CODE) Campaign,
        convert(int,substring(convert(char(6),max(C.FISCAL_PERIOD)),1,4)) as FiscalYear,
        convert(int,substring(convert(char(6),max(C.FISCAL_PERIOD)),5,2)) as FiscalMonth,
        'GIFT' as GiftType,
        max(C.INVOICE_REFERENCE_NUM) InvoiceReferenceNumber,
        0 as ReceiptID,
        0 as MatchingTransaction,
        0 as IsMatchingGift,
        '' as MemorialID,
        '' as PledgeID,
        '' as ListAs,
        0 as RequestNumber,
        null as InstallmentDate,
        '' as MemorialNameText,
        CONVERT(money,sum(Activity.AMOUNT)) AmountAsMoney    
    FROM Activity
        INNER JOIN Trans C on 
            Activity.ORIGINATING_TRANS_NUM = C.TRANS_NUMBER
        INNER JOIN Invoice on 
            Invoice.REFERENCE_NUM = C.INVOICE_REFERENCE_NUM
        INNER JOIN TransWatch ON
                 C.TRANS_NUMBER = TransWatch.TransactionNumber AND
                 C.INVOICE_REFERENCE_NUM = TransWatch.InvoiceNumber
     WHERE 
             Activity.ACTIVITY_TYPE = 'GIFT' AND 
             C.TRANSACTION_TYPE = 'DIST' AND 
             (C.PRODUCT_CODE = Activity.PRODUCT_CODE OR C.PRODUCT_CODE LIKE Activity.PRODUCT_CODE +'/%') AND 
             Activity.SOURCE_SYSTEM = 'MEETING'
     GROUP BY Activity.ID, C.INVOICE_REFERENCE_NUM, Activity.ORG_CODE, Activity.CAMPAIGN_CODE, Activity.SOURCE_CODE, Invoice.ORIGINATING_TRANS_NUM
UNION 
    SELECT 
        max(P.ST_ID) ID, 
        max(P.TRANS_NUMBER) OriginalTransaction,
        max(C.TRANS_NUMBER) TransactionNumber,
        max(P.SOURCE_SYSTEM) SourceSystem,
        max(C.TRANSACTION_DATE)TransactionDate,
        max(C.TRANSACTION_DATE) DateReceived,
        -sum(C.AMOUNT) Amount,
        sum(P.TAXABLE_VALUE) AS FairMktValue,                                 -- 2009/7/30  JHS Inserted a FairMktValue calculation 
        (
            case when max(C.JOURNAL_TYPE) = 'IN' 
            then max(C.OWNER_ORG_CODE) 
            else max(C.GL_ACCT_ORG_CODE) end
        ) Fund,
        max(P.SOURCE_CODE)Appeal,
        max(P.SOLICITOR_ID)SolicitorID,
        max(C.CHECK_NUMBER)CheckNumber,
        (
            case max(Cash_Accounts.ACCOUNT_TYPE)
            when 1 then 'Credit Card' 
            when 2 then 'In Kind' 
            when 3 then 'Debit Card' 
            else 'Cash' end
        ) PaymentType,
        max(Activity.CAMPAIGN_CODE)Campaign,
        convert(int,substring(convert(char(6),max(C.FISCAL_PERIOD)),1,4)) as FiscalYear,
        convert(int,substring(convert(char(6),max(C.FISCAL_PERIOD)),5,2)) as FiscalMonth,
        'Asterisk Tab Adjustment' as GiftType,
        max(C.INVOICE_REFERENCE_NUM) InvoiceReferenceNumber,
        max(C.RECEIPT_ID) ReceiptID,
        max(P.MATCH_GIFT_TRANS_NUM) MatchingTransaction,
        max(P.IS_MATCH_GIFT) IsMatchingGift,
        max(P.MEM_TRIB_ID) MemorialID,
        (case when max(C.BT_ID)= max(C.ST_ID) then '' else max(C.BT_ID) end) as PledgeID,
        ''  ListAs,
        0 RequestNumber,
        max(Invoice.INSTALL_BILL_DATE) as InstallmentDate,
        max(P.MEM_TRIB_NAME_TEXT) MemorialNameText,
        CONVERT(money,-sum(C.AMOUNT)) AmountAsMoney
    FROM Invoice
        INNER JOIN TransWatch ON 
            Invoice.ORIGINATING_TRANS_NUM = TransWatch.TransactionNumber  AND
            Invoice.REFERENCE_NUM = TransWatch.InvoiceNumber 
        INNER JOIN Trans C ON
            Invoice.REFERENCE_NUM = C.INVOICE_REFERENCE_NUM 
        LEFT OUTER JOIN Cash_Accounts on 
            C.CHECK_NUMBER = Cash_Accounts.CASH_ACCOUNT_CODE
        INNER JOIN Trans P ON
            Invoice.ORIGINATING_TRANS_NUM = P.TRANS_NUMBER
        INNER JOIN Activity on 
            P.ACTIVITY_SEQN = Activity.SEQN
    WHERE 
        P.LINE_NUMBER = 1  AND P.SUB_LINE_NUMBER = 1 AND P.JOURNAL_TYPE = 'IN' AND 
        P.TRANSACTION_TYPE = 'DIST' AND Invoice.SOURCE_SYSTEM='FR' AND 
        (
            (C.JOURNAL_TYPE = 'IN' AND C.TRANSACTION_TYPE = 'TR') OR
            (C.JOURNAL_TYPE = 'PAY' AND C.TRANSACTION_TYPE IN ('PAY', 'TR'))
        ) 
    GROUP BY P.ST_ID, C.TRANS_NUMBER, P.INVOICE_REFERENCE_NUM
UNION
    SELECT  ID, 
            OriginalTransaction, 
            GiftReport.TransactionNumber, 
            SourceSystem, 
            TransactionDate, 
            DateReceived, 
            Amount, 
            FairMktValue,                                   -- 2009/7/30  JHS Inserted a FairMktValue column
            Fund, 
            AppealCode, 
            SolicitorID, 
            CheckNumber, 
            PaymentType, 
            CampaignCode, 
            FiscalYear, 
            FiscalMonth, 
            GiftType, 
            InvoiceReferenceNumber, 
            ReceiptID, 
            MatchingTransaction, 
            IsMatchingGift, 
            MemorialID, 
            PledgeID, 
            ListAs, 
            RequestNumber, 
            InstallmentDate, 
            MemorialNameText,
            CONVERT(money,Amount) as AmountAsMoney 
    FROM GiftReport
        LEFT OUTER JOIN TransWatch ON
            GiftReport.OriginalTransaction = TransWatch.TransactionNumber AND
            GiftReport.InvoiceReferenceNumber = TransWatch.InvoiceNumber
    WHERE 
        TransWatch.TransactionNumber IS NULL 
UNION
    SELECT  ID, 
            OriginalTransaction, 
            GiftReport.TransactionNumber, 
            SourceSystem, 
            TransactionDate, 
            DateReceived, 
            Amount, 
            FairMktValue,                                   -- 2009/7/30  JHS Inserted a FairMktValue column
            Fund, 
            AppealCode, 
            SolicitorID, 
            CheckNumber, 
            PaymentType, 
            CampaignCode, 
            FiscalYear, 
            FiscalMonth, 
            GiftType, 
            InvoiceReferenceNumber, 
            ReceiptID, 
            MatchingTransaction, 
            IsMatchingGift, 
            MemorialID, 
            PledgeID, 
            ListAs, 
            RequestNumber, 
            InstallmentDate, 
            MemorialNameText,
            CONVERT(money,Amount) AmountAsMoney
    FROM GiftReport
    WHERE 
        OriginalTransaction NOT IN (SELECT TransactionNumber FROM TransWatch) AND 
        SourceSystem = 'MEETING'

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vPledgeData]'))
    DROP VIEW [dbo].[vPledgeData]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vPledgeData]
   AS
	SELECT  
		Activity.ID                                ID,
		'Pledge' AS                                TransactionType,
		MAX(Pledge.TRANS_NUMBER)                   TransactionNumber,
		MAX(Pledge.INVOICE_REFERENCE_NUM)          InvoiceReferenceNumber,
		MAX(Pledge.TRANSACTION_DATE)               TransactionDate,
		MAX(Activity.EFFECTIVE_DATE)               DateReceived,
		CONVERT(int,substring(CONVERT(char(6),MAX(Pledge.FISCAL_PERIOD)),1,4)) AS FiscalYear,
		CONVERT(int,substring(CONVERT(char(6),MAX(Pledge.FISCAL_PERIOD)),5,2)) AS FiscalMonth,
		MAX(Activity.SOURCE_CODE)                  Appeal,
		MAX(Activity.CAMPAIGN_CODE)                Campaign,
		MAX(Activity.ORG_CODE)                     Fund,
		MAX(Activity.SOLICITOR_ID)                 SolicitorID,
		MAX(Invoice.SOURCE_SYSTEM)                 SourceSystem,
		MAX(Pledge.MATCH_GIFT_TRANS_NUM)           MatchingTransaction,
		MAX(Pledge.IS_MATCH_GIFT)                  IsMatchingGift,
		MAX(Pledge.MEM_TRIB_ID)                    MemorialID,
		MAX(Activity.ACTION_CODES)                 ListAs,
		MAX(Activity.UF_4)                         RequestNumber,
		MAX(Invoice.INSTALL_BILL_DATE)             InstallmentDate,
		NULL AS                                    LastPaymentDate,
		SUM(Pledge.AMOUNT) * -1 AS                 PledgeAmount,
		0 AS                                       AdjustmentsAmount,
		0 AS                                       PaymentsAmount,
		SUM(Pledge.TAXABLE_VALUE)                  PledgeFairMarketValue,
		MAX(Pledge.MEM_TRIB_NAME_TEXT)             MemorialNameText     
	FROM Trans Pledge 
		INNER JOIN (SELECT DISTINCT TransactionNumber FROM TransWatch) tw ON
			tw.TransactionNumber = Pledge.TRANS_NUMBER
		INNER JOIN Invoice ON 
			Pledge.INVOICE_REFERENCE_NUM = Invoice.REFERENCE_NUM
		INNER JOIN Activity ON 
			Pledge.ACTIVITY_SEQN = Activity.SEQN
	WHERE
		Pledge.TRANSACTION_TYPE = 'DIST' AND
		Pledge.JOURNAL_TYPE = 'IN' AND
		Pledge.POSTED >= 2 AND
		Invoice.ORIGINATING_TRANS_NUM = Pledge.TRANS_NUMBER AND
		Invoice.SOURCE_SYSTEM IN  ('FR', 'DUES') AND
		Activity.ACTIVITY_TYPE = 'PLEDGE' 
	GROUP BY Activity.ID, Pledge.INVOICE_REFERENCE_NUM, Activity.ORG_CODE,Activity.CAMPAIGN_CODE,Activity.SOURCE_CODE
UNION ALL  
	SELECT     
		MAX(P.ST_ID) AS ID,
		'Asterisk Tab Adjustment' AS TransactionType, 
		0 AS TransactionNumber,
		MAX(C.INVOICE_REFERENCE_NUM)   AS InvoiceReferenceNumber,
		NULL AS asTransactionDate, 
		NULL AS DateReceived, 
		0 AS FiscalYear,
		0 AS FiscalMonth, 
		MAX(P.SOURCE_CODE)  AS Appeal, 
		MAX(P.CAMPAIGN_CODE) AS Campaign, 
		MAX(C.OWNER_ORG_CODE) AS Fund,
		'' AS SolicitorID,
		MAX(dbo.Invoice.SOURCE_SYSTEM)  AS SourceSystem, 
		0 AS MatchingTransaction,
		0 AS IsMatchingGift, 
		'' AS MemorialID,
		'' AS ListAs, 
		0 AS RequestNumber, 
		NULL AS InstallmentDate,
		NULL AS LastPaymentDate,
		0 AS PledgeAmount, 
		0 AS AdjustmentsAmount, 
		SUM(C.AMOUNT) * - 1 AS PaymentsAmount, 
		0 AS PledgeFairMarketValue, 
		'' AS MemorialNameText
	FROM  dbo.Trans AS C 
		INNER JOIN  dbo.Invoice ON 
			dbo.Invoice.REFERENCE_NUM = C.INVOICE_REFERENCE_NUM
		INNER JOIN  dbo.Trans AS P ON 
			P.TRANS_NUMBER = dbo.Invoice.ORIGINATING_TRANS_NUM
		LEFT OUTER JOIN dbo.Cash_Accounts ON  
			dbo.Cash_Accounts.CASH_ACCOUNT_CODE = C.CHECK_NUMBER
		INNER JOIN dbo.Activity ON 
			dbo.Activity.SEQN = P.ACTIVITY_SEQN 
		INNER JOIN (SELECT DISTINCT TransactionNumber FROM TransWatch) tw ON
			tw.TransactionNumber = P.TRANS_NUMBER
	WHERE     
		(P.LINE_NUMBER = 1) AND (P.SUB_LINE_NUMBER = 1) AND 
		(P.JOURNAL_TYPE = 'IN') AND (P.TRANSACTION_TYPE = 'DIST') AND 
		(dbo.Invoice.SOURCE_SYSTEM = 'FR') AND (C.JOURNAL_TYPE = 'PAY') AND
		(C.TRANSACTION_TYPE = 'PAY') OR
		(P.LINE_NUMBER = 1) AND (P.SUB_LINE_NUMBER = 1) AND
		(P.JOURNAL_TYPE = 'IN') AND (P.TRANSACTION_TYPE = 'DIST') AND 
		(dbo.Invoice.SOURCE_SYSTEM = 'FR') AND (C.JOURNAL_TYPE = 'IN') AND
		(C.TRANSACTION_TYPE = 'TR')
	GROUP BY P.ST_ID, P.TRANS_NUMBER, P.INVOICE_REFERENCE_NUM
UNION ALL
	SELECT  
		CASE WHEN Invoice_Lines.ST_ID IS NULL THEN Invoice.BT_ID ELSE Invoice_Lines.ST_ID END    ID,
		'Adjustment' AS					TransactionType,
		0 AS							Transaction_Number,
		MAX(Adj.INVOICE_REFERENCE_NUM)	InvoiceReferenceNumber,
		NULL AS							TransactionDate,
		NULL AS							DateReceived,
		0 AS							FiscalYear,
		0 AS							FiscalMonth,
		MAX(P.SOURCE_CODE)  AS			Appeal,
		MAX(P.CAMPAIGN_CODE)			Campaign,
		MAX(Adj.OWNER_ORG_CODE)			Fund,
		''  AS							SolicitorID,
		MAX(Invoice.SOURCE_SYSTEM)		SourceSystem,
		0  AS							MatchingTransaction,
		0  AS							IsMatchingGift,
		''   AS							MemorialID,
		''   AS							ListAs,
		0  AS							RequestNumber,
		NULL AS							InstallmentDate,
		NULL AS							LastPaymentDate,
		0  AS							PledgeAmount,
		SUM(Adj.AMOUNT) * -1  AS		AdjustmentsAmount,
		0  AS							PaymentsAmount,
		0 AS							PledgeFairMarketValue,
		''   AS							MemorialNameText   
	FROM Trans Adj 
		INNER JOIN (SELECT DISTINCT InvoiceNumber FROM TransWatch) tw ON
			tw.InvoiceNumber = Adj.INVOICE_REFERENCE_NUM
		INNER JOIN Invoice ON 
			Adj.INVOICE_REFERENCE_NUM = Invoice.REFERENCE_NUM
		INNER JOIN Trans P ON 
			P.TRANS_NUMBER = Invoice.ORIGINATING_TRANS_NUM
		INNER JOIN Activity ON
			Activity.SEQN = P.ACTIVITY_SEQN
		LEFT OUTER JOIN Invoice_Lines ON
			Invoice_Lines.REFERENCE_NUM = Adj.INVOICE_REFERENCE_NUM AND 
			Invoice_Lines.LINE_NUM = Adj.INVOICE_LINE_NUM
	WHERE  
		((Adj.TRANSACTION_TYPE = 'DIST' and Adj.JOURNAL_TYPE = 'CM') OR 
		(Adj.TRANSACTION_TYPE = 'DIST' and Adj.JOURNAL_TYPE = 'DM')) and
		Adj.POSTED >= 2 and
		((Invoice.SOURCE_SYSTEM = 'FR' and Invoice.INSTALL_BILL_DATE is not NULL and 
		P.SUB_LINE_NUMBER = 1 AND Activity.ACTIVITY_TYPE='PLEDGE' and P.LINE_NUMBER = 1) or (Invoice.SOURCE_SYSTEM='DUES' and P.PRODUCT_CODE = Adj.PRODUCT_CODE and P.INVOICE_LINE_NUM = Adj.INVOICE_LINE_NUM))
	GROUP BY Invoice.BT_ID, Invoice_Lines.ST_ID, Adj.INVOICE_REFERENCE_NUM, Adj.OWNER_ORG_CODE,P.CAMPAIGN_CODE, P.SOURCE_CODE
UNION ALL
	SELECT  
		CASE WHEN Invoice_Lines.ST_ID IS NULL THEN Invoice.BT_ID ELSE Invoice_Lines.ST_ID END    ID,
		'Payment' AS                                TransactionType,
		0  AS                                       Transaction_Number,
		MAX(Pay.INVOICE_REFERENCE_NUM)              InvoiceReferenceNumber,
		NULL AS                                     TransactionDate,
		NULL AS                                     DateReceived,
		0  AS                                       FiscalYear,
		0  AS                                       FiscaMonth,
		P.SOURCE_CODE  AS                                      Appeal,
		P.CAMPAIGN_CODE  AS                                      Campaign,
		(case when MAX(Pay.TRANSACTION_TYPE) = 'AR' 
				 then MAX(Pay.GL_ACCT_ORG_CODE) 
				 else MAX(Pay.OWNER_ORG_CODE) end) Fund,
		''  AS                                      SolicitorID,
		MAX(Invoice.SOURCE_SYSTEM)                  SourceSystem,
		0  AS                                       MatchingTransaction,
		0  AS                                       IsMatchingGift,
		''   AS                                     MemorialID,
		''   AS                                     ListAs,
		0  AS                                       RequestNumber,
		NULL AS                                     InstallmentDate,
		MAX(Pay.TRANSACTION_DATE)                   LastPaymentDate,
		0  AS                                       PledgeAmount,
		0  AS                                       AdjustmentsAmount,
		SUM(Pay.INVOICE_CREDITS)                    PaymentsAmount,
		0 AS                                        PledgeFairMarketValue,
		''   AS                                     MemorialNameText    
	FROM Trans Pay
		INNER JOIN (SELECT DISTINCT InvoiceNumber FROM TransWatch) tw ON
			tw.InvoiceNumber = Pay.INVOICE_REFERENCE_NUM
		INNER JOIN Invoice ON 
			Invoice.REFERENCE_NUM = Pay.INVOICE_REFERENCE_NUM
		INNER JOIN Trans P ON 
			P.TRANS_NUMBER = Invoice.ORIGINATING_TRANS_NUM
		INNER JOIN Activity ON
			Activity.SEQN = P.ACTIVITY_SEQN
		LEFT OUTER JOIN Invoice_Lines ON
			Invoice_Lines.REFERENCE_NUM = Pay.INVOICE_REFERENCE_NUM AND Invoice_Lines.LINE_NUM = Pay.INVOICE_LINE_NUM
    WHERE  
		P.TRANSACTION_TYPE = 'DIST' and Pay.POSTED >= 2 and Pay.IS_FR_ITEM=1 AND 
		Activity.ACTIVITY_TYPE='PLEDGE' AND
		(
		 (
		  P.LINE_NUMBER = 1  and P.SUB_LINE_NUMBER = 1 and  Invoice.SOURCE_SYSTEM='FR' and 
		   (
			(Pay.JOURNAL_TYPE = 'PAY' and Pay.TRANSACTION_TYPE = 'AR') 
			or 
			(Pay.JOURNAL_TYPE = 'IN' and Pay.TRANSACTION_TYPE = 'PAY')
		   )
		  )
		  or 
		  (
		   Invoice.SOURCE_SYSTEM='DUES' and P.PRODUCT_CODE = Pay.PRODUCT_CODE and Pay.JOURNAL_TYPE = 'PAY' and Pay.TRANSACTION_TYPE = 'AR' and P.INVOICE_LINE_NUM = Pay.INVOICE_LINE_NUM
		  )
		 )
		 GROUP BY Invoice.BT_ID, Invoice_Lines.ST_ID, Pay.INVOICE_REFERENCE_NUM, Pay.OWNER_ORG_CODE,Pay.GL_ACCT_ORG_CODE, P.CAMPAIGN_CODE, P.SOURCE_CODE
UNION  
    SELECT ID, TransactionType, PledgeReport.TransactionNumber, InvoiceReferenceNumber, TransactionDate, DateReceived, FiscalYear, FiscalMonth, AppealCode, CampaignCode, Fund, SolicitorID, SourceSystem, MatchingTransaction, IsMatchingGift, MemorialID, ListAs, RequestNumber, InstallmentDate, LastPaymentDate, PledgeAmount, AdjustmentsAmount, PaymentsAmount, PledgeFairMarketValue, MemorialNameText 
    FROM PledgeReport
    WHERE 
		InvoiceReferenceNumber NOT IN (SELECT DISTINCT InvoiceNumber FROM TransWatch)

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vPledge]'))
    DROP VIEW [dbo].[vPledge]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vPledge] 
AS
  SELECT    ID                         ID, 
            max(TransactionNumber)     TransactionNumber,
            InvoiceReferenceNumber,
            max(TransactionDate)       TransactionDate,
            max(DateReceived)          DateReceived,
            max(FiscalYear)            FiscalYear,
            max(FiscalMonth)           FiscalMonth,
            Appeal,
            Campaign,
            Fund,
            max(SolicitorID)           SolicitorID,
            max(SourceSystem)          SourceSystem,
            max(MatchingTransaction)   MatchingTransaction,
            max(IsMatchingGift)        IsMatchingGift,
            max(MemorialID)            MemorialID,
            max(ListAs)                ListAs,
            max(RequestNumber)         RequestNumber,
            max(InstallmentDate)       InstallmentDate,
            max(LastPaymentDate)       LastPaymentDate,
            sum(PledgeAmount)          PledgeAmount,
            sum(AdjustmentsAmount)     AdjustmentsAmount,
            (sum(vPledgeData.PledgeAmount)  +  sum(vPledgeData.AdjustmentsAmount)) NetPledgeAmount,
            sum(PaymentsAmount)        PaymentsAmount,
            (sum(vPledgeData.PledgeAmount) + sum(vPledgeData.AdjustmentsAmount) - sum(vPledgeData.PaymentsAmount)) PledgeBalance,
            max(vPledgeData.PledgeFairMarketValue)    PledgeFairMarketValue,
            max(MemorialNameText)      MemorialNameText     
     FROM vPledgeData
  GROUP BY ID, InvoiceReferenceNumber, Fund, Campaign, Appeal

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vActivityReport]'))
    DROP VIEW [dbo].[vActivityReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vActivityReport] 
as
    SELECT g.ID as                     Id,
           g.OriginalTransaction as    TransNumber, 
           g.InvoiceReferenceNumber as InvRefNumber, 
           g.TransactionDate as        TransactionDate,
           g.Campaign as               Campaign,  
           g.Appeal as                 Appeal, 
           g.Fund as                   Fund, 
           g.Amount as                 NetDonation, 
           g.Amount as                 PaymentsAmount, 
           0 as                        Balance,
           n.FULL_NAME as              FullName, 
           n.MEMBER_TYPE as            MemberType, 
           n.COMPANY_RECORD as         CompanyRecord, 
           n.COMPANY as                Company,
           GiftType as                 DonationType
    FROM vGift g INNER JOIN Name n  ON g.ID = n.ID
 UNION
    SELECT p.ID as                     Id, 
           p.TransactionNumber as      TransNumber, 
           p.InvoiceReferenceNumber as InvRefNumber, 
           p.TransactionDate as        TransactionDate,
           p.Campaign as               Campaign, 
           p.Appeal as                 Appeal, 
           p.Fund as                   Fund, 
           p.NetPledgeAmount as        NetDonation, 
           p.PaymentsAmount as         PaymentsAmount,
           p.PledgeBalance as          Balance, 
           n.FULL_NAME as              FullName, 
           n.MEMBER_TYPE as            MemberType, 
           n.COMPANY_RECORD as         CompanyRecord,
           n.COMPANY as                Company, 
           'Pledge' as                 DonationType
    FROM vPledge p INNER JOIN Name n on p.ID = n.ID

GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vAddressCorrespondenceReport]'))
    DROP VIEW [dbo].[vAddressCorrespondenceReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vAddressCorrespondenceReport]
AS 
SELECT   ContactKey,
         FullAddressKey,
         1 AS AddressCategory,
         PhysicalAddressKey AS AddressKey
FROM     FullAddress
UNION
SELECT   ContactKey,
         FullAddressKey,
         3 AS AddressCategory,
         FaxAddressKey AS AddressKey
FROM     FullAddress
UNION
SELECT   ContactKey,
         FullAddressKey,
         4 AS AddressCategory,
         EmailAddressKey AS AddressKey
FROM     FullAddress

GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vAdjustmentsReport]'))
    DROP VIEW [dbo].[vAdjustmentsReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vAdjustmentsReport]
AS
SELECT  DISTINCT   
IM.InvoiceKey, IM.InvoiceNumber, IM.InvoiceDate, IM.AccountingMethodCode, IM.InvoiceTypeCode, IM.Notes, ITR.InvoiceTypeDesc,
FE.FinancialEntityKey, FE.Name FinancialEntity, IL.InvoiceLineNumber, IL.ExtendedPrice, IL.ExtendedPriceHome,
BI.BatchKey, BI.BatchNumber, BI.BatchName, BI.BatchDate, BI.Description BatchDesc, BI.BatchTypeCode,
MA.Amount, AIM.InvoiceNumber AdjInvNumber, AIM.InvoiceDate as AdjInvDate, AIM.InvoiceTypeCode as AdjInvType,AIM.Notes AdjInvNotes,
AMA.Amount AdjAmount
FROM InvoiceMain IM INNER JOIN
	InvoiceTypeRef ITR ON IM.InvoiceTypeCode = ITR.InvoiceTypeCode  INNER JOIN            
	FinancialEntity FE ON IM.FinancialEntityKey = FE.FinancialEntityKey INNER JOIN
	InvoiceLine IL ON IM.InvoiceKey = IL.InvoiceKey LEFT OUTER JOIN
	BatchInstance BI ON IM.FinalBatchKey = BI.BatchKey LEFT OUTER JOIN
	MonetaryApplication MA ON IL.InvoiceLineKey = MA.InvoiceLineKey LEFT OUTER  JOIN
	InvoiceLine AIL ON MA.SrcInvoiceLineKey = AIL.InvoiceLineKey LEFT OUTER JOIN
	InvoiceMain AIM ON AIL.InvoiceKey = AIM.InvoiceKey LEFT OUTER JOIN
	MonetaryApplication AMA ON AIL.InvoiceLineKey = AMA.SrcInvoiceLineKey

GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vAgingReport]'))
    DROP VIEW [dbo].[vAgingReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vAgingReport]
AS
SELECT     AGS.AgingScheduleKey, AGS.FinancialEntityKey, AGS.Name AS AgingSchName, AGSC.Number, AGSC.Days, AGSC.Name AS AgingSchCatName, 
                      AGSC.Notes
FROM         dbo.AgingSchedule AGS INNER JOIN
                      dbo.AgingScheduleCategory AGSC ON AGS.AgingScheduleKey = AGSC.AgingScheduleKey

GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBackOrderSummary]'))
    DROP VIEW [dbo].[vBackOrderSummary]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
create view [dbo].[vBackOrderSummary] as
select	ProductKey, sum(QtyBackOrdered) as QtyBackOrdered
 from	InventoryBackOrder
 group by ProductKey

GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBatchReport]'))
    DROP VIEW [dbo].[vBatchReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBatchReport] AS

/****************************************************************************************
** This view provides basic information about each Batch on "One Row per Batch Instance Item" basis.
** This view can be joined with Orders, Payment, or Invoice - posted or unposted (work) - related views or tables to get relevant detailed information.
***************************************************************************************/
SELECT  
	BI.BatchKey, BI.BatchNumber, BI.BatchName, BI.BatchDate, BI.Description AS BatchDesc, BSR.BatchStatusCode, BSR.BatchStatusDesc, 
        	BTR.BatchTypeCode, BTR.BatchTypeDesc, BIC.ControlName, BIC.ControlFunction, BIC.ControlSelectionExpression, BIC.ControlAmount, 
        	BIC.ControlCount, BIC.CalculatedAmount, BIC.CalculatedCount, 
	BI.SystemEntityKey
                         
FROM         
	BatchInstance BI
 	INNER JOIN BatchStatusRef BSR ON BI.BatchStatusCode = BSR.BatchStatusCode 
	INNER JOIN BatchTypeRef BTR ON BI.BatchTypeCode = BTR.BatchTypeCode 
	LEFT OUTER JOIN BatchInstanceControl BIC ON BI.BatchKey = BIC.BatchKey

GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoAccessArea]'))
    DROP VIEW [dbo].[vBoAccessArea]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoAccessArea] AS SELECT AccessArea.Description,AccessArea.IsSystem,AccessArea.Name,AccessArea.UpdatedByUserKey,AccessArea.UpdatedOn,AccessArea.AccessAreaKey,AccessArea.CreatedByUserKey,AccessArea.CreatedOn,AccessArea.ProtectedAccessKey,AccessArea.IsContentACL FROM AccessArea
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoAccessItem]'))
    DROP VIEW [dbo].[vBoAccessItem]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoAccessItem] AS SELECT AccessItem.AccessKey,AccessItem.Grantee,AccessItem.GroupKey,AccessItem.Permission,AccessItem.RoleKey,AccessItem.UserKey FROM AccessItem
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoAccessMain]'))
    DROP VIEW [dbo].[vBoAccessMain]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoAccessMain] AS SELECT AccessMain.AccessKey,AccessMain.AccessScope,AccessMain.CreatedByUserKey,AccessMain.CreatedOn,AccessMain.UpdatedByUserKey,AccessMain.UpdatedOn FROM AccessMain
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoActionPlan]'))
    DROP VIEW [dbo].[vBoActionPlan]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoActionPlan] AS SELECT ActionPlan.ActionManifest,ActionPlan.Description,ActionPlan.Name,ActionPlan.UpdatedByUserKey,ActionPlan.UpdatedOn,ActionPlan.ActionPlanKey,ActionPlan.OpportunityTypeKey,ActionPlan.CreatedByUserKey,ActionPlan.CreatedOn FROM ActionPlan
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoActivity]'))
    DROP VIEW [dbo].[vBoActivity]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoActivity] AS SELECT Activity.ACTIVITY_TYPE AS ActivityType,Activity.AMOUNT AS Amount,Activity.CO_ID AS CompanyId,Activity.DESCRIPTION AS Description,Activity.ID AS Id,Activity.PAY_METHOD AS PayMethod,Activity.QUANTITY AS Quantity,Activity.SOURCE_CODE AS SourceCode,Activity.TRANSACTION_DATE AS TransactionDate,Activity.UF_1 AS Uf1,Activity.UF_2 AS Uf2,Activity.UF_3 AS Uf3 FROM Activity
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoAddress]'))
    DROP VIEW [dbo].[vBoAddress]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoAddress] AS SELECT AddressMain.UpdatedByUserKey,AddressMain.AddressStatusCode,AddressMain.IsPhysicalAddress,AddressMain.LastVerifiedOn,AddressMain.BadAddressReasonKey,AddressMain.UpdatedOn,AddressMain.FormattedAddress,AddressMain.AddressKey,AddressMain.CreatedByUserKey,AddressMain.CreatedOn,AddressMain.SystemEntityKey,AddressMain.AddressCategoryCode,AddressMain.OwnerContactKey FROM AddressMain
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoAddressCategoryPreferences]'))
    DROP VIEW [dbo].[vBoAddressCategoryPreferences]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoAddressCategoryPreferences] AS SELECT AddressCategoryPreferences.ContactKey,AddressCategoryPreferences.AddressCategoryCode,AddressCategoryPreferences.NoSolicitationFlag,AddressCategoryPreferences.OptOutFlag FROM AddressCategoryPreferences
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoAddressCategoryRef]'))
    DROP VIEW [dbo].[vBoAddressCategoryRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoAddressCategoryRef] AS SELECT AddressCategoryRef.AddressCategoryCode AS Code,AddressCategoryRef.AddressCategoryDesc AS Description,AddressCategoryRef.IsPhysicalAddress,AddressCategoryRef.AddressCategoryName AS Name,AddressCategoryRef.FormatMask FROM AddressCategoryRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoAddressFormatRef]'))
    DROP VIEW [dbo].[vBoAddressFormatRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoAddressFormatRef] AS SELECT AddressFormatRef.AddressFormatDesc AS Name,AddressFormatRef.AddressFormatKey,AddressFormatRef.Description,AddressFormatRef.Formula,AddressFormatRef.IsHandModified,AddressFormatRef.UpdatedByUserKey,AddressFormatRef.UpdatedOn,AddressFormatRef.IsSystemDefault,AddressFormatRef.CreatedByUserKey,AddressFormatRef.CreatedOn FROM AddressFormatRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoAddressPurposeContactType]'))
    DROP VIEW [dbo].[vBoAddressPurposeContactType]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoAddressPurposeContactType] AS SELECT AddressPurposeContactType.AddressPurposeContactTypeKey,AddressPurposeContactType.AddressPurposeKey,AddressPurposeContactType.AlwaysDisplayFlag,AddressPurposeContactType.ContactTypeKey,AddressPurposeContactType.DisplayOrder,AddressPurposeContactType.IsAddressRequired,AddressPurposeContactType.IsEmailRequired,AddressPurposeContactType.IsFaxRequired,AddressPurposeContactType.IsPhoneRequired,AddressPurposeContactType.IsSingleUse FROM AddressPurposeContactType
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoAddressPurposeRef]'))
    DROP VIEW [dbo].[vBoAddressPurposeRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoAddressPurposeRef] AS SELECT AddressPurposeRef.AddressPurposeKey,AddressPurposeRef.IsSystem,AddressPurposeRef.IsActive,AddressPurposeRef.UpdatedByUserKey,AddressPurposeRef.UpdatedOn,AddressPurposeRef.AddressPurposeDesc AS Description,AddressPurposeRef.CreatedByUserKey,AddressPurposeRef.CreatedOn FROM AddressPurposeRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoAddressStatusRef]'))
    DROP VIEW [dbo].[vBoAddressStatusRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoAddressStatusRef] AS SELECT AddressStatusRef.AddressStatusCode AS Code,AddressStatusRef.AddressStatusDesc AS Description,AddressStatusRef.IsSystem FROM AddressStatusRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoAddressToUse]'))
    DROP VIEW [dbo].[vBoAddressToUse]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoAddressToUse] AS SELECT AddressToUse.CommunicationReasonKey,AddressToUse.ContactKey,AddressToUse.FullAddressKey,AddressToUse.FullAddressText,AddressToUse.SeasonalRevertFullAddressKey FROM AddressToUse
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoAddressTypeRef]'))
    DROP VIEW [dbo].[vBoAddressTypeRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoAddressTypeRef] AS SELECT AddressTypeRef.AddressTypeKey,AddressTypeRef.IsActive,AddressTypeRef.IsSystem,AddressTypeRef.DisplayOrder,AddressTypeRef.AddressCategoryCode,AddressTypeRef.AddressTypeName AS Name FROM AddressTypeRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoAdjustmentsReport]'))
    DROP VIEW [dbo].[vBoAdjustmentsReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoAdjustmentsReport] AS SELECT vAdjustmentsReport.AdjInvDate,vAdjustmentsReport.AdjInvNotes,vAdjustmentsReport.AdjInvNumber,vAdjustmentsReport.AdjInvType,vAdjustmentsReport.Amount,vAdjustmentsReport.BatchDate,vAdjustmentsReport.BatchDesc,vAdjustmentsReport.BatchKey,vAdjustmentsReport.BatchName,vAdjustmentsReport.BatchNumber,vAdjustmentsReport.BatchTypeCode,vAdjustmentsReport.ExtendedPrice,vAdjustmentsReport.ExtendedPriceHome,vAdjustmentsReport.FinancialEntity,vAdjustmentsReport.FinancialEntityKey,vAdjustmentsReport.InvoiceDate,vAdjustmentsReport.InvoiceKey,vAdjustmentsReport.InvoiceLineNumber,vAdjustmentsReport.InvoiceNumber,vAdjustmentsReport.InvoiceTypeDesc,vAdjustmentsReport.Notes,vAdjustmentsReport.AdjAmount,vAdjustmentsReport.InvoiceTypeCode,vAdjustmentsReport.AccountingMethodCode FROM vAdjustmentsReport
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoAgingReport]'))
    DROP VIEW [dbo].[vBoAgingReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoAgingReport] AS SELECT vAgingReport.AgingSchCatName,vAgingReport.AgingScheduleKey,vAgingReport.AgingSchName,vAgingReport.Days,vAgingReport.FinancialEntityKey,vAgingReport.Notes,vAgingReport.Number FROM vAgingReport
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoAgingSchedule]'))
    DROP VIEW [dbo].[vBoAgingSchedule]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoAgingSchedule] AS SELECT AgingSchedule.Name,AgingSchedule.UpdatedByUserKey,AgingSchedule.UpdatedOn,AgingSchedule.FinancialEntityKey,AgingSchedule.AgingScheduleKey,AgingSchedule.CreatedByUserKey,AgingSchedule.CreatedOn,AgingSchedule.SystemEntityKey FROM AgingSchedule
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoAgingScheduleCategory]'))
    DROP VIEW [dbo].[vBoAgingScheduleCategory]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoAgingScheduleCategory] AS SELECT AgingScheduleCategory.AgingScheduleCategoryKey,AgingScheduleCategory.AgingScheduleKey,AgingScheduleCategory.Days,AgingScheduleCategory.Name,AgingScheduleCategory.Notes,AgingScheduleCategory.CreatedByUserKey,AgingScheduleCategory.CreatedOn,AgingScheduleCategory.UpdatedByUserKey,AgingScheduleCategory.UpdatedOn,AgingScheduleCategory.Number FROM AgingScheduleCategory
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoAppeal]'))
    DROP VIEW [dbo].[vBoAppeal]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoAppeal] AS SELECT AppealMain.Description,AppealMain.Name,AppealMain.StartDate,AppealMain.UpdatedByUserKey,AppealMain.UpdatedOn,AppealMain.AppealStatusCode,AppealMain.TotalRevenue,AppealMain.CostCollection,AppealMain.PredictedResponseRate,AppealMain.TargetRevenue,AppealMain.EndDate,AppealMain.AccessKey,AppealMain.AppealKey,AppealMain.CampaignKey,AppealMain.CreatedByUserKey,AppealMain.CreatedOn,AppealMain.ActualCost,AppealMain.EstimatedCost,AppealMain.ExtendedCost,AppealMain.FirstResponseDate,AppealMain.HighResponseAmount,AppealMain.LastResponseDate,AppealMain.LowResponseAmount,AppealMain.OverheadCost,AppealMain.TotalNegativeResponse,AppealMain.TotalPositiveResponse,AppealMain.TotalSolicited FROM AppealMain
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoAppealParticipation]'))
    DROP VIEW [dbo].[vBoAppealParticipation]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoAppealParticipation] AS SELECT AppealParticipation.AppealKey,AppealParticipation.AppealParticipationKey,AppealParticipation.CreatedByUserKey,AppealParticipation.CreatedOn,AppealParticipation.RespondentUserKey,AppealParticipation.SolicitationKey,AppealParticipation.UpdatedByUserKey,AppealParticipation.UpdatedOn,AppealParticipation.SourceCodeKey,AppealParticipation.ResponseTypeCode FROM AppealParticipation
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoAppealProduct]'))
    DROP VIEW [dbo].[vBoAppealProduct]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoAppealProduct] AS SELECT AppealProduct.AppealKey,AppealProduct.AppealProductKey,AppealProduct.ProductKey,AppealProduct.ProductCode FROM AppealProduct
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoAppealStatusRef]'))
    DROP VIEW [dbo].[vBoAppealStatusRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoAppealStatusRef] AS SELECT AppealStatusRef.AppealStatusCode,AppealStatusRef.AppealStatusDesc,AppealStatusRef.AppealStatusName FROM AppealStatusRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoAsyncStatusMonitor]'))
    DROP VIEW [dbo].[vBoAsyncStatusMonitor]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoAsyncStatusMonitor] AS SELECT AsyncStatusMonitor.AsyncStatusMonitorKey,AsyncStatusMonitor.BusinessItemKey,AsyncStatusMonitor.ComponentKey,AsyncStatusMonitor.CreatedOn,AsyncStatusMonitor.WorkflowQueueItemKey FROM AsyncStatusMonitor
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoAtomPanelPurpose]'))
    DROP VIEW [dbo].[vBoAtomPanelPurpose]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoAtomPanelPurpose] AS SELECT AtomPanelPurposeRef.AtomPanelPurposeCode AS Code,AtomPanelPurposeRef.AtomPanelPurposeDesc AS Description,AtomPanelPurposeRef.AtomPanelPurposeName AS Name FROM AtomPanelPurposeRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoBackOrderSummary]'))
    DROP VIEW [dbo].[vBoBackOrderSummary]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoBackOrderSummary] AS SELECT vBackOrderSummary.ProductKey,vBackOrderSummary.QtyBackOrdered FROM vBackOrderSummary
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoBadAddressReasonRef]'))
    DROP VIEW [dbo].[vBoBadAddressReasonRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoBadAddressReasonRef] AS SELECT BadAddressReasonRef.BadAddressReasonKey,BadAddressReasonRef.BadAddressReasonDesc AS Description,BadAddressReasonRef.ErrorCode,BadAddressReasonRef.IsSystem,BadAddressReasonRef.ErrorMessage,BadAddressReasonRef.IsPhysical FROM BadAddressReasonRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoBatch]'))
    DROP VIEW [dbo].[vBoBatch]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoBatch] AS SELECT BatchInstance.AutoPostFlag,BatchInstance.BatchDate,BatchInstance.BatchName,BatchInstance.BatchNumber,BatchInstance.BatchStatusCode,BatchInstance.BatchTypeCode,BatchInstance.Description,BatchInstance.PostObjectName,BatchInstance.WorkObjectName,BatchInstance.IsSystemCreated,BatchInstance.AccessKey,BatchInstance.BatchKey,BatchInstance.CreatedByUserKey,BatchInstance.CreatedOn,BatchInstance.SystemEntityKey,BatchInstance.UpdatedByUserKey,BatchInstance.UpdatedOn FROM BatchInstance
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoBatchControl]'))
    DROP VIEW [dbo].[vBoBatchControl]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoBatchControl] AS SELECT BatchInstanceControl.BatchKey,BatchInstanceControl.ControlName,BatchInstanceControl.ControlAttributeName,BatchInstanceControl.ControlObjectName,BatchInstanceControl.ControlPostFlag,BatchInstanceControl.ControlSelectionExpression,BatchInstanceControl.ControlFunction,BatchInstanceControl.CalculatedAmount,BatchInstanceControl.CalculatedCount,BatchInstanceControl.ControlAmount,BatchInstanceControl.ControlCount FROM BatchInstanceControl
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoBatchCriterion]'))
    DROP VIEW [dbo].[vBoBatchCriterion]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoBatchCriterion] AS SELECT BatchInstanceCriterion.AttributeName,BatchInstanceCriterion.AttributeValue,BatchInstanceCriterion.BatchKey,BatchInstanceCriterion.ObjectName FROM BatchInstanceCriterion
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoBatchCriterionRef]'))
    DROP VIEW [dbo].[vBoBatchCriterionRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoBatchCriterionRef] AS SELECT BatchCriterionRef.BatchCriterionCode,BatchCriterionRef.BatchCriterionDesc,BatchCriterionRef.BatchCriterionName FROM BatchCriterionRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoBatchCriterionTemplate]'))
    DROP VIEW [dbo].[vBoBatchCriterionTemplate]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoBatchCriterionTemplate] AS SELECT BatchCriterionTemplate.AttributeName,BatchCriterionTemplate.BatchCriterionCode,BatchCriterionTemplate.BatchTypeCode,BatchCriterionTemplate.ObjectName FROM BatchCriterionTemplate
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoBatchLineStatusRef]'))
    DROP VIEW [dbo].[vBoBatchLineStatusRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoBatchLineStatusRef] AS SELECT BatchLineStatusRef.BatchLineStatusCode,BatchLineStatusRef.BatchLineStatusDesc FROM BatchLineStatusRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoBatchLookup]'))
    DROP VIEW [dbo].[vBoBatchLookup]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoBatchLookup] AS SELECT BatchLookup.BatchKey,BatchLookup.LookupValue,BatchLookup.BatchTypeCode FROM BatchLookup
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoBatchReport]'))
    DROP VIEW [dbo].[vBoBatchReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoBatchReport] AS SELECT vBatchReport.BatchDate,vBatchReport.BatchDesc,vBatchReport.BatchKey,vBatchReport.BatchName,vBatchReport.BatchNumber,vBatchReport.BatchStatusCode,vBatchReport.BatchStatusDesc,vBatchReport.BatchTypeCode,vBatchReport.BatchTypeDesc,vBatchReport.CalculatedAmount,vBatchReport.CalculatedCount,vBatchReport.ControlAmount,vBatchReport.ControlCount,vBatchReport.ControlFunction,vBatchReport.ControlName,vBatchReport.ControlSelectionExpression,vBatchReport.SystemEntityKey FROM vBatchReport
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoBatchSetup]'))
    DROP VIEW [dbo].[vBoBatchSetup]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoBatchSetup] AS SELECT BatchSetup.AutoCreateFlag AS IsAutoCreate,BatchSetup.AutoPostFlag AS IsAutoPost,BatchSetup.BatchTypeCode,BatchSetup.BatchTypeName,BatchSetup.WorkObjectName,BatchSetup.DepartmentGroupKey,BatchSetup.PostObjectName,BatchSetup.BatchNumberFormat,BatchSetup.BatchSetupKey,BatchSetup.CreatedByUserKey,BatchSetup.CreatedOn,BatchSetup.SystemEntityKey,BatchSetup.UpdatedByUserKey,BatchSetup.UpdatedOn FROM BatchSetup
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoBatchSetupAction]'))
    DROP VIEW [dbo].[vBoBatchSetupAction]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoBatchSetupAction] AS SELECT BatchSetupAction.BatchSetupKey,BatchSetupAction.WorkflowKey,BatchSetupAction.BatchActionCode,BatchSetupAction.ItemWorkflowKey FROM BatchSetupAction
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoBatchSetupControl]'))
    DROP VIEW [dbo].[vBoBatchSetupControl]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoBatchSetupControl] AS SELECT BatchSetupControl.BatchSetupKey,BatchSetupControl.ControlAttributeName,BatchSetupControl.ControlName,BatchSetupControl.ControlObjectName,BatchSetupControl.ControlPostFlag,BatchSetupControl.ControlSelectionExpression,BatchSetupControl.ControlFunction FROM BatchSetupControl
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoBatchSetupCriterion]'))
    DROP VIEW [dbo].[vBoBatchSetupCriterion]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoBatchSetupCriterion] AS SELECT BatchSetupCriterion.AttributeName,BatchSetupCriterion.BatchSetupCriterionKey,BatchSetupCriterion.BatchSetupKey,BatchSetupCriterion.CriterionName,BatchSetupCriterion.ObjectName FROM BatchSetupCriterion
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoBatchStatusRef]'))
    DROP VIEW [dbo].[vBoBatchStatusRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoBatchStatusRef] AS SELECT BatchStatusRef.BatchStatusCode,BatchStatusRef.BatchStatusDesc FROM BatchStatusRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoBatchTypeRef]'))
    DROP VIEW [dbo].[vBoBatchTypeRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoBatchTypeRef] AS SELECT BatchTypeRef.BatchTypeCode,BatchTypeRef.BatchTypeDesc,BatchTypeRef.PostKeyAttributeName,BatchTypeRef.PostObjectName,BatchTypeRef.WorkKeyAttributeName,BatchTypeRef.WorkObjectName,BatchTypeRef.BatchTypePrefix,BatchTypeRef.PostBatchTarget,BatchTypeRef.BatchTypeName FROM BatchTypeRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoBillMePaymentDetail]'))
    DROP VIEW [dbo].[vBoBillMePaymentDetail]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoBillMePaymentDetail] AS SELECT PaymentDetail.CreatedByUserKey,PaymentDetail.CreatedOn,PaymentDetail.CurrencyCode,PaymentDetail.OriginalAmount,PaymentDetail.PaymentApplicationRestrictionCode,PaymentDetail.PaymentDetailKey,PaymentDetail.PaymentDetailStatusCode,PaymentDetail.PaymentMethodKey,PaymentDetail.PaymentTypeKey,PaymentDetail.PayorContactKey,PaymentDetail.ReferenceNumber,PaymentDetail.SerializedDetails,PaymentDetail.SummaryDisplay,PaymentDetail.UpdatedByUserKey,PaymentDetail.UpdatedOn,PaymentDetail.PaymentDetailBOName FROM PaymentDetail WHERE PaymentDetail.PaymentDetailBOName= 'BillMePaymentDetail'
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCampaign]'))
    DROP VIEW [dbo].[vBoCampaign]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCampaign] AS SELECT CampaignMain.Description,CampaignMain.EndDate,CampaignMain.Name,CampaignMain.PrimaryOwnerUserKey,CampaignMain.StartDate,CampaignMain.UpdatedByUserKey,CampaignMain.UpdatedOn,CampaignMain.CampaignStatusCode,CampaignMain.PredictedResponseRate,CampaignMain.TotalRevenue,CampaignMain.CostCollection,CampaignMain.TargetRevenue,CampaignMain.LegacyCampaignCode,CampaignMain.AccessKey,CampaignMain.CampaignKey,CampaignMain.CreatedByUserKey,CampaignMain.CreatedOn,CampaignMain.SystemEntityKey,CampaignMain.ActualCost,CampaignMain.EstimatedCost,CampaignMain.ExtendedCost,CampaignMain.FirstResponseDate,CampaignMain.HighResponseAmount,CampaignMain.LastResponseDate,CampaignMain.LowResponseAmount,CampaignMain.OverheadCost,CampaignMain.TotalNegativeResponse,CampaignMain.TotalPositiveResponse,CampaignMain.TotalSolicited,CampaignMain.CampaignTypeCode FROM CampaignMain
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCampaignParticipation]'))
    DROP VIEW [dbo].[vBoCampaignParticipation]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCampaignParticipation] AS SELECT CampaignParticipation.CampaignKey,CampaignParticipation.CampaignParticipationKey,CampaignParticipation.CreatedByUserKey,CampaignParticipation.CreatedOn,CampaignParticipation.RespondentUserKey,CampaignParticipation.UpdatedByUserKey,CampaignParticipation.UpdatedOn,CampaignParticipation.OptedOutOn,CampaignParticipation.OptOutSourceCodeKey,CampaignParticipation.ResponseTypeCode FROM CampaignParticipation
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCampaignStatusRef]'))
    DROP VIEW [dbo].[vBoCampaignStatusRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCampaignStatusRef] AS SELECT CampaignStatusRef.CampaignStatusCode,CampaignStatusRef.CampaignStatusDesc,CampaignStatusRef.CampaignStatusName FROM CampaignStatusRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCampaignTypeRef]'))
    DROP VIEW [dbo].[vBoCampaignTypeRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCampaignTypeRef] AS SELECT CampaignTypeRef.CampaignTypeCode,CampaignTypeRef.CampaignTypeDesc,CampaignTypeRef.CampaignTypeName FROM CampaignTypeRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCashPaymentDetail]'))
    DROP VIEW [dbo].[vBoCashPaymentDetail]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCashPaymentDetail] AS SELECT PaymentDetail.CreatedByUserKey,PaymentDetail.CreatedOn,PaymentDetail.CurrencyCode,PaymentDetail.OriginalAmount,PaymentDetail.PaymentApplicationRestrictionCode,PaymentDetail.PaymentDetailKey,PaymentDetail.PaymentDetailStatusCode,PaymentDetail.PaymentMethodKey,PaymentDetail.PaymentTypeKey,PaymentDetail.PayorContactKey,PaymentDetail.ReferenceNumber,PaymentDetail.SerializedDetails,PaymentDetail.SummaryDisplay,PaymentDetail.UpdatedByUserKey,PaymentDetail.UpdatedOn,PaymentDetail.PaymentDetailBOName FROM PaymentDetail WHERE PaymentDetail.PaymentDetailBOName= 'CashPaymentDetail'
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vCashReceiptsReport]'))
    DROP VIEW [dbo].[vCashReceiptsReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vCashReceiptsReport]
AS
SELECT     PM.PaymentKey, PM.PaymentDate, PM.Amount, PM.AmountHome, PM.CurrencyCode, PAR.PaymentApplicationRestrictionCode, 
                      PAR.PaymentApplicationRestrictionDesc, PM.SummaryDisplay, PM.PayorContactKey, CM.ID, CM.FullName, FE.FinancialEntityKey, FE.Name AS FinancialEntity
FROM         dbo.PaymentMain PM INNER JOIN
                      dbo.PaymentApplicationRestrictionRef PAR ON PM.PaymentApplicationRestrictionCode = PAR.PaymentApplicationRestrictionCode LEFT OUTER JOIN
                      dbo.ContactMain CM ON PM.PayorContactKey = CM.ContactKey INNER JOIN
                      dbo.FinancialEntity FE ON PM.FinancialEntityKey = FE.FinancialEntityKey

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCashReceiptsReport]'))
    DROP VIEW [dbo].[vBoCashReceiptsReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCashReceiptsReport] AS SELECT vCashReceiptsReport.Amount,vCashReceiptsReport.AmountHome,vCashReceiptsReport.CurrencyCode,vCashReceiptsReport.FinancialEntity,vCashReceiptsReport.FinancialEntityKey,vCashReceiptsReport.FullName,vCashReceiptsReport.ID,vCashReceiptsReport.PaymentApplicationRestrictionCode,vCashReceiptsReport.PaymentApplicationRestrictionDesc,vCashReceiptsReport.PaymentDate,vCashReceiptsReport.PaymentKey,vCashReceiptsReport.SummaryDisplay,vCashReceiptsReport.PayorContactKey FROM vCashReceiptsReport
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCertificationModule]'))
    DROP VIEW [dbo].[vBoCertificationModule]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCertificationModule] AS SELECT CertificationModule.CertificationModuleDate AS Date,CertificationModule.CertificationModuleDesc AS Description,CertificationModule.CertificationModuleKey,CertificationModule.CertificationModuleLocation AS Location,CertificationModule.CertificationModuleName AS Name,CertificationModule.CertificationModuleStatusCode AS StatusCode,CertificationModule.CreatedByUserKey,CertificationModule.CreatedOn,CertificationModule.NumberOfUnits,CertificationModule.RequiresApprovalFlag AS RequiresApproval,CertificationModule.RequiresGradeFlag AS RequiresGrade,CertificationModule.UpdatedByUserKey,CertificationModule.UpdatedOn,CertificationModule.CertificationStaffOnlyFlag AS CertificationStaffOnly,CertificationModule.CertificationModuleCode AS Code,CertificationModule.MarkedForDeleteOn FROM CertificationModule
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCertificationModuleGrade]'))
    DROP VIEW [dbo].[vBoCertificationModuleGrade]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCertificationModuleGrade] AS SELECT CertificationModuleGrade.CertificationModuleGradeKey,CertificationModuleGrade.CertificationModuleKey,CertificationModuleGrade.CreatedByUserKey,CertificationModuleGrade.CreatedOn,CertificationModuleGrade.GradeKey,CertificationModuleGrade.PassFlag AS Pass,CertificationModuleGrade.UpdatedByUserKey,CertificationModuleGrade.UpdatedOn FROM CertificationModuleGrade
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCertificationModuleProduct]'))
    DROP VIEW [dbo].[vBoCertificationModuleProduct]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCertificationModuleProduct] AS SELECT CertificationModuleProduct.CertificationModuleKey,CertificationModuleProduct.CertificationModuleProductKey,CertificationModuleProduct.CreatedByUserKey,CertificationModuleProduct.CreatedOn,CertificationModuleProduct.ProductCode,CertificationModuleProduct.UpdatedByUserKey,CertificationModuleProduct.UpdatedOn FROM CertificationModuleProduct
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCertificationModuleRegistration]'))
    DROP VIEW [dbo].[vBoCertificationModuleRegistration]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCertificationModuleRegistration] AS SELECT CertificationModuleRegistration.CertificationModuleKey,CertificationModuleRegistration.CertificationModuleRegistrationKey,CertificationModuleRegistration.CertificationProgramRegistrationKey,CertificationModuleRegistration.CustomerExperienceKey,CertificationModuleRegistration.RegistrationDate,CertificationModuleRegistration.RegistrationStatusCode,CertificationModuleRegistration.EarnedUnits FROM CertificationModuleRegistration
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCertificationModuleStatus]'))
    DROP VIEW [dbo].[vBoCertificationModuleStatus]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCertificationModuleStatus] AS SELECT CertificationModuleStatusRef.CertificationModuleStatusCode,CertificationModuleStatusRef.CertificationModuleStatusName FROM CertificationModuleStatusRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCertificationProgram]'))
    DROP VIEW [dbo].[vBoCertificationProgram]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCertificationProgram] AS SELECT CertificationProgram.AddDesignationFlag,CertificationProgram.AutoEnrollFlag,CertificationProgram.CertificationProgramDescription,CertificationProgram.CertificationProgramStatusCode,CertificationProgram.CreatedByUserKey,CertificationProgram.CreatedOn,CertificationProgram.MinimumValue,CertificationProgram.RequiresApprovalFlag,CertificationProgram.UomKey,CertificationProgram.UpdatedByUserKey,CertificationProgram.UpdatedOn,CertificationProgram.CertificationProgramGroupKey AS CertificationProgramGroup,CertificationProgram.DeadlinePeriodMultiplier,CertificationProgram.DeadlinePeriodTimeUnit,CertificationProgram.FormatCertificationNumber,CertificationProgram.GracePeriodMultiplier,CertificationProgram.GracePeriodTimeUnit,CertificationProgram.IsMultipleIterationFlag,CertificationProgram.MarkedForDeleteOn,CertificationProgram.PreRequiredProgramKey AS PreRequiredProgram,CertificationProgram.ProcessBlueprint,CertificationProgram.RequiredNumberOfUnits,CertificationProgram.StagesInOrder,CertificationProgram.MaximumValue,CertificationProgram.LastCertificationNumber,CertificationProgram.Designation,CertificationProgram.CertificationProgramName,CertificationProgram.CertificationProgramKey FROM CertificationProgram
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCertificationProgramCertificationModule]'))
    DROP VIEW [dbo].[vBoCertificationProgramCertificationModule]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCertificationProgramCertificationModule] AS SELECT CertificationProgramCertificationModule.CertificationModuleKey,CertificationProgramCertificationModule.CertificationProgramCertificationModuleKey,CertificationProgramCertificationModule.CertificationProgramKey FROM CertificationProgramCertificationModule
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCertificationProgramProduct]'))
    DROP VIEW [dbo].[vBoCertificationProgramProduct]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCertificationProgramProduct] AS SELECT CertificationProgramProduct.CertificationProgramKey,CertificationProgramProduct.CertificationProgramProductKey,CertificationProgramProduct.CreatedByUserKey,CertificationProgramProduct.CreatedOn,CertificationProgramProduct.ProductCode,CertificationProgramProduct.UpdatedByUserKey,CertificationProgramProduct.UpdatedOn FROM CertificationProgramProduct
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCertificationProgramRegistration]'))
    DROP VIEW [dbo].[vBoCertificationProgramRegistration]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCertificationProgramRegistration] AS SELECT CertificationProgramRegistration.ActionManifest,CertificationProgramRegistration.CertificationNumber,CertificationProgramRegistration.CertificationProgramKey,CertificationProgramRegistration.CertificationProgramRegistrationKey,CertificationProgramRegistration.CreatedByUserKey,CertificationProgramRegistration.CreatedOn,CertificationProgramRegistration.CurrentStageName,CertificationProgramRegistration.EarnedUnits,CertificationProgramRegistration.ExpirationDate,CertificationProgramRegistration.FormattedCertificationNumber,CertificationProgramRegistration.GracePeriodDate,CertificationProgramRegistration.RegistrationDate,CertificationProgramRegistration.RegistrationStatusCode,CertificationProgramRegistration.UpdatedByUserKey,CertificationProgramRegistration.UpdatedOn,CertificationProgramRegistration.UserKey FROM CertificationProgramRegistration
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCertificationProgramRegistrationCertificationModule]'))
    DROP VIEW [dbo].[vBoCertificationProgramRegistrationCertificationModule]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCertificationProgramRegistrationCertificationModule] AS SELECT CertificationProgramRegistrationCertificationModule.CertificationModuleKey,CertificationProgramRegistrationCertificationModule.CertificationProgramRegistrationCertificationModuleKey,CertificationProgramRegistrationCertificationModule.CertificationProgramRegistrationKey FROM CertificationProgramRegistrationCertificationModule
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoChangeLog]'))
    DROP VIEW [dbo].[vBoChangeLog]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoChangeLog] AS SELECT ChangeLog.ActionType,ChangeLog.ChangeLogKey,ChangeLog.CreatedByUserKey,ChangeLog.CreatedOn,ChangeLog.Description,ChangeLog.ObjectKey,ChangeLog.ObjectTypeName,ChangeLog.OrganizationKey FROM ChangeLog
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vChangeLogReport]'))
    DROP VIEW [dbo].[vChangeLogReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vChangeLogReport]
AS
SELECT DISTINCT CL.[ChangeLogKey], CL.[ObjectTypeName], CL.[ActionType], CL.[Description],
                CL.[CreatedOn] AS [CreatedDate], CP.[PropertyName], CP.[OriginalValue], 
                CP.[OriginalDescription], CP.[CurrentValue], CP.[CurrentDescription], UM.[UserKey], 
                UM.[ContactMaster], UM.[UserId]
  FROM [dbo].[ChangeLog] CL 
       INNER JOIN [dbo].[ChangeProperty] CP ON CL.[ChangeLogKey] = CP.[ChangeLogKey] 
       INNER JOIN [dbo].[UserMain] UM ON CL.[CreatedByUserKey] = UM.[UserKey]

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoChangeLogReport]'))
    DROP VIEW [dbo].[vBoChangeLogReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoChangeLogReport] AS SELECT vChangeLogReport.ActionType,vChangeLogReport.ChangeLogKey,vChangeLogReport.ContactMaster,vChangeLogReport.CreatedDate,vChangeLogReport.CurrentDescription,vChangeLogReport.CurrentValue,vChangeLogReport.Description,vChangeLogReport.ObjectTypeName,vChangeLogReport.OriginalDescription,vChangeLogReport.OriginalValue,vChangeLogReport.PropertyName,vChangeLogReport.UserId,vChangeLogReport.UserKey FROM vChangeLogReport
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoChangeProperty]'))
    DROP VIEW [dbo].[vBoChangeProperty]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoChangeProperty] AS SELECT ChangeProperty.ChangeLogKey,ChangeProperty.CurrentDescription,ChangeProperty.CurrentValue,ChangeProperty.OriginalDescription,ChangeProperty.OriginalValue,ChangeProperty.PropertyName FROM ChangeProperty
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCheckCategoryRef]'))
    DROP VIEW [dbo].[vBoCheckCategoryRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCheckCategoryRef] AS SELECT CheckCategoryRef.CheckCategoryCode,CheckCategoryRef.CheckCategoryDesc FROM CheckCategoryRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCheckPaymentDetail]'))
    DROP VIEW [dbo].[vBoCheckPaymentDetail]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCheckPaymentDetail] AS SELECT PaymentDetail.CreatedByUserKey,PaymentDetail.CreatedOn,PaymentDetail.CurrencyCode,PaymentDetail.OriginalAmount,PaymentDetail.PaymentApplicationRestrictionCode,PaymentDetail.PaymentDetailKey,PaymentDetail.PaymentDetailStatusCode,PaymentDetail.PaymentMethodKey,PaymentDetail.PaymentTypeKey,PaymentDetail.PayorContactKey,PaymentDetail.ReferenceNumber,PaymentDetail.SerializedDetails,PaymentDetail.SummaryDisplay,PaymentDetail.UpdatedByUserKey,PaymentDetail.UpdatedOn,PaymentDetail.PaymentDetailBOName FROM PaymentDetail WHERE PaymentDetail.PaymentDetailBOName= 'CheckPaymentDetail'
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCommissionCategory]'))
    DROP VIEW [dbo].[vBoCommissionCategory]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCommissionCategory] AS SELECT CommissionCategory.Name,CommissionCategory.CommissionCategoryKey,CommissionCategory.CreatedByUserKey,CommissionCategory.CreatedOn,CommissionCategory.SystemEntityKey,CommissionCategory.UpdatedByUserKey,CommissionCategory.UpdatedOn FROM CommissionCategory
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCommissionPlan]'))
    DROP VIEW [dbo].[vBoCommissionPlan]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCommissionPlan] AS SELECT CommissionPlan.Name,CommissionPlan.CommissionPlanKey,CommissionPlan.CreatedByUserKey,CommissionPlan.CreatedOn,CommissionPlan.SystemEntityKey,CommissionPlan.UpdatedByUserKey,CommissionPlan.UpdatedOn FROM CommissionPlan
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCommissionPlanRate]'))
    DROP VIEW [dbo].[vBoCommissionPlanRate]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCommissionPlanRate] AS SELECT CommissionPlanRate.CommissionCategoryKey,CommissionPlanRate.CommissionPlanKey,CommissionPlanRate.CommissionRate,CommissionPlanRate.CommissionRateTypeCode FROM CommissionPlanRate
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCommissionRateTypeRef]'))
    DROP VIEW [dbo].[vBoCommissionRateTypeRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCommissionRateTypeRef] AS SELECT CommissionRateTypeRef.CommissionRateTypeCode,CommissionRateTypeRef.CommissionRateTypeDesc FROM CommissionRateTypeRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCommitment]'))
    DROP VIEW [dbo].[vBoCommitment]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCommitment] AS SELECT Commitment.DateCommitted,Commitment.OrderKey,Commitment.QuantityCommitted,Commitment.OrderLineKey,Commitment.ExpirationDate,Commitment.ProductInventoryKey,Commitment.CommitmentKey,Commitment.CreatedByUserKey,Commitment.CreatedOn,Commitment.UpdatedByUserKey,Commitment.UpdatedOn FROM Commitment
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCommittee]'))
    DROP VIEW [dbo].[vBoCommittee]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCommittee] AS SELECT Product.PROD_TYPE,Product.DESCRIPTION,Product.PRODUCT_CODE,Product.TITLE FROM Product WHERE PROD_TYPE = 'COMMITTEE' AND WEB_OPTION = 1
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCommunicationReasonRef]'))
    DROP VIEW [dbo].[vBoCommunicationReasonRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCommunicationReasonRef] AS SELECT CommunicationReasonRef.CommunicationReasonDesc AS Description,CommunicationReasonRef.CommunicationReasonKey,CommunicationReasonRef.Formula,CommunicationReasonRef.IsDefaultType,CommunicationReasonRef.CannotOptOutFlag,CommunicationReasonRef.IsSolicitation,CommunicationReasonRef.DefaultOptOutFlag FROM CommunicationReasonRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCompanyNaicSic]'))
    DROP VIEW [dbo].[vBoCompanyNaicSic]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCompanyNaicSic] AS SELECT CompanyNaicsSic.ContactKey,CompanyNaicsSic.IsSic,CompanyNaicsSic.NaicsSicCode FROM CompanyNaicsSic
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoComparisonRef]'))
    DROP VIEW [dbo].[vBoComparisonRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoComparisonRef] AS SELECT ComparisonRef.ComparisonCode,ComparisonRef.ComparisonDesc FROM ComparisonRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoComponentRegistry]'))
    DROP VIEW [dbo].[vBoComponentRegistry]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoComponentRegistry] AS SELECT ComponentRegistry.ComponentKey,ComponentRegistry.Name,ComponentRegistry.InterfaceName,ComponentRegistry.AssemblyName,ComponentRegistry.ComponentEditLink,ComponentRegistry.ComponentExecuteLink,ComponentRegistry.ComponentNewLink,ComponentRegistry.ComponentSummaryContentKey,ComponentRegistry.ConfigureWebUserControl,ComponentRegistry.ConfigureWindowsControl,ComponentRegistry.DeploymentPackageCode,ComponentRegistry.Description,ComponentRegistry.IsBusinessItem,ComponentRegistry.IsTyped,ComponentRegistry.MarkedForDeleteOn,ComponentRegistry.TypeName FROM ComponentRegistry
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoComponentResourceAction]'))
    DROP VIEW [dbo].[vBoComponentResourceAction]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoComponentResourceAction] AS SELECT ComponentResourceActionRef.ComponentKey,ComponentResourceActionRef.ResourceActionKey FROM ComponentResourceActionRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoContact]'))
    DROP VIEW [dbo].[vBoContact]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoContact] AS SELECT ContactMain.ContactStatusCode,ContactMain.FullName,ContactMain.NoSolicitationFlag AS NoSolicitation,ContactMain.SortName,ContactMain.SyncContactID,ContactMain.TaxIDNumber,ContactMain.UpdatedByUserKey,ContactMain.UpdatedOn,ContactMain.ID,ContactMain.PreferredAddressCategoryCode,ContactMain.IsSortNameOverridden,ContactMain.IsInstitute,ContactMain.AccessKey,ContactMain.ContactKey,ContactMain.CreatedByUserKey,ContactMain.CreatedOn,ContactMain.MajorKey,ContactMain.PrimaryMembershipGroupKey,ContactMain.TextOnlyEmailFlag,ContactMain.ContactTypeKey,ContactMain.IsIDEditable,ContactMain.OptOutFlag AS OptOut FROM ContactMain
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoContactAddress]'))
    DROP VIEW [dbo].[vBoContactAddress]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoContactAddress] AS SELECT ContactAddress.AddressKey,ContactAddress.ContactAddressKey,ContactAddress.ContactKey,ContactAddress.AddressTypeKey,ContactAddress.IsOptOut,ContactAddress.IsPreferredOverall,ContactAddress.NoSolicitationFlag AS NoSolicitation,ContactAddress.AddressCategoryCode,ContactAddress.IsPreferredForCategory FROM ContactAddress
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoContactBiography]'))
    DROP VIEW [dbo].[vBoContactBiography]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoContactBiography] AS SELECT ContactBiography.ContactKey,ContactBiography.InBusinessSinceYear,ContactBiography.IsPublic,ContactBiography.Locations,ContactBiography.Summary,ContactBiography.Text,ContactBiography.UpdatedByUserKey,ContactBiography.UpdatedOn,ContactBiography.BiographyReferences FROM ContactBiography
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoContactCommerce]'))
    DROP VIEW [dbo].[vBoContactCommerce]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoContactCommerce] AS SELECT ContactCommerce.ContactKey,ContactCommerce.IsOnCreditHold,ContactCommerce.PriceSheetKey,ContactCommerce.SalesTeamGroupKey,ContactCommerce.TaxScheduleKey,ContactCommerce.AutoDeclinePromotionType,ContactCommerce.BillToContactKey,ContactCommerce.CreditLimit,ContactCommerce.CurrencyCode,ContactCommerce.PaymentTermsKey FROM ContactCommerce
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoContactCommunicationReasonPreferences]'))
    DROP VIEW [dbo].[vBoContactCommunicationReasonPreferences]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoContactCommunicationReasonPreferences] AS SELECT ContactCommunicationReasonPreferences.CommunicationReasonKey,ContactCommunicationReasonPreferences.ContactCommunicationReasonPreferencesKey,ContactCommunicationReasonPreferences.ContactKey,ContactCommunicationReasonPreferences.NoCommunicationByEmailFlag AS NoCommunicationByEmail,ContactCommunicationReasonPreferences.NoCommunicationByFaxFlag AS NoCommunicationByFax,ContactCommunicationReasonPreferences.NoCommunicationByMailFlag AS NoCommunicationByMail,ContactCommunicationReasonPreferences.NoCommunicationByPhoneFlag AS NoCommunicationByPhone,ContactCommunicationReasonPreferences.PreferredAddressCategoryCode FROM ContactCommunicationReasonPreferences
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vContactReport]'))
    DROP VIEW [dbo].[vContactReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vContactReport]
AS
/****************************************************************************************
** This view provides basic information about each Contact on "One Row per Contact" basis.
** This view can be used as the basis for other detailed Contact related views.
**
***************************************************************************************/

SELECT 		 
	CM.ID as ContactId,  CM.FullName as ContactName,  CM.SortName as ContactSortName, 
	CM.IsInstitute,  CSR.ContactStatusDesc as ContactStatus,  CM.TaxIDNumber,
	CM.NoSolicitationFlag,  CM.PreferredAddressCategoryCode, CM.ContactKey, CM.PrimaryMembershipGroupKey, 	CM.ContactTypeKey
FROM
	ContactMain CM 
	INNER JOIN	ContactStatusRef	CSR	ON	CM.ContactStatusCode = CSR.ContactStatusCode

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vContactDetailReport]'))
    DROP VIEW [dbo].[vContactDetailReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vContactDetailReport]
AS
SELECT     CR.ContactId, CR.ContactName, CR.ContactSortName, CR.IsInstitute, CR.ContactStatus, CR.TaxIDNumber, CR.NoSolicitationFlag, 
                      CR.PreferredAddressCategoryCode, CR.ContactKey, CR.PrimaryMembershipGroupKey, CR.ContactTypeKey, PR.PrefixDesc AS PrefixLong, I.FirstName, 
                      I.MiddleName, I.LastName, I.SuffixCode AS SuffixShort, SR.SuffixDesc AS SuffixLong, I.Designation, I.Informal, I.Gender, I.BirthDate, 
                      I.PrimaryInstituteName, I.PrimaryInstituteTitle, I.PrimaryInstituteContactKey, CTR.ContactTypeDesc AS ContactType, 
                      GM.IsActive AS IsActiveGroupMember, GM.DropDate AS GroupMemberDropDate, GM.JoinDate AS GroupMemberJoinDate, 
                      GMD.GroupMemberStatusCode, GMD.EffectiveDate AS GroupMemberEffectiveDate, GMD.ExpirationDate AS GroupMemberExpDate, 
                      GMD.TypeSpecificData AS GroupMemberTypeSpecificData, GRR.GroupRoleDesc AS GroupRole, GTR.GroupMemberBranchName, G.GroupKey, 
                      I.PrefixCode AS PrefixShort, G.Name AS GroupName, GTR.GroupTypeName AS GroupType
FROM         dbo.vContactReport AS CR LEFT OUTER JOIN
                      dbo.Individual AS I ON CR.ContactKey = I.ContactKey LEFT OUTER JOIN
                      dbo.Institute AS INS ON CR.ContactKey = INS.ContactKey LEFT OUTER JOIN
                      dbo.ContactTypeRef AS CTR ON CR.ContactTypeKey = CTR.ContactTypeKey LEFT OUTER JOIN
                      dbo.SuffixRef AS SR ON I.SuffixCode = SR.SuffixCode LEFT OUTER JOIN
                      dbo.PrefixRef AS PR ON I.PrefixCode = PR.PrefixCode LEFT OUTER JOIN
                      dbo.GroupMain AS G ON CR.PrimaryMembershipGroupKey = G.GroupKey LEFT OUTER JOIN
                      dbo.GroupMember AS GM ON G.GroupKey = GM.GroupKey LEFT OUTER JOIN
                      dbo.GroupMemberDetail AS GMD ON GM.GroupMemberKey = GMD.GroupMemberKey LEFT OUTER JOIN
                      dbo.GroupRoleRef AS GRR ON GMD.GroupRoleKey = GRR.GroupRoleKey LEFT OUTER JOIN
                      dbo.GroupTypeRef AS GTR ON G.GroupTypeKey = GTR.GroupTypeKey

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoContactDetailReport]'))
    DROP VIEW [dbo].[vBoContactDetailReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoContactDetailReport] AS SELECT vContactDetailReport.BirthDate,vContactDetailReport.ContactId,vContactDetailReport.ContactKey,vContactDetailReport.ContactName,vContactDetailReport.ContactSortName,vContactDetailReport.ContactStatus,vContactDetailReport.Designation,vContactDetailReport.FirstName,vContactDetailReport.Gender,vContactDetailReport.GroupKey,vContactDetailReport.GroupMemberBranchName,vContactDetailReport.GroupMemberDropDate,vContactDetailReport.GroupMemberEffectiveDate,vContactDetailReport.GroupMemberExpDate,vContactDetailReport.GroupMemberJoinDate,vContactDetailReport.GroupMemberStatusCode,vContactDetailReport.GroupMemberTypeSpecificData,vContactDetailReport.GroupName,vContactDetailReport.GroupRole,vContactDetailReport.GroupType,vContactDetailReport.Informal,vContactDetailReport.IsActiveGroupMember,vContactDetailReport.IsInstitute,vContactDetailReport.LastName,vContactDetailReport.MiddleName,vContactDetailReport.NoSolicitationFlag,vContactDetailReport.PreferredAddressCategoryCode,vContactDetailReport.PrefixLong,vContactDetailReport.PrefixShort,vContactDetailReport.PrimaryInstituteContactKey,vContactDetailReport.PrimaryInstituteName,vContactDetailReport.PrimaryInstituteTitle,vContactDetailReport.PrimaryMembershipGroupKey,vContactDetailReport.SuffixLong,vContactDetailReport.SuffixShort,vContactDetailReport.TaxIDNumber,vContactDetailReport.ContactType FROM vContactDetailReport
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoContactDuplicateCheckFormula]'))
    DROP VIEW [dbo].[vBoContactDuplicateCheckFormula]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoContactDuplicateCheckFormula] AS SELECT ContactDuplicateCheckFormula.ContactDuplicateCheckFormulaKey,ContactDuplicateCheckFormula.CreatedByUserKey,ContactDuplicateCheckFormula.CreatedOn,ContactDuplicateCheckFormula.FormulaName,ContactDuplicateCheckFormula.FormulaText,ContactDuplicateCheckFormula.FormulaType,ContactDuplicateCheckFormula.MatchPercent,ContactDuplicateCheckFormula.SystemEntityKey,ContactDuplicateCheckFormula.UpdatedByUserKey,ContactDuplicateCheckFormula.UpdatedOn FROM ContactDuplicateCheckFormula
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoContactDuplicateCheckFormulaTypeRef]'))
    DROP VIEW [dbo].[vBoContactDuplicateCheckFormulaTypeRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoContactDuplicateCheckFormulaTypeRef] AS SELECT ContactDuplicateCheckFormulaTypeRef.ContactDuplicateCheckFormulaTypeCode,ContactDuplicateCheckFormulaTypeRef.ContactDuplicateCheckFormulaTypeDesc,ContactDuplicateCheckFormulaTypeRef.ContactDuplicateCheckFormulaTypeName FROM ContactDuplicateCheckFormulaTypeRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoContactEducation]'))
    DROP VIEW [dbo].[vBoContactEducation]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoContactEducation] AS SELECT ContactEducation.ContactEducationKey AS EducationKey,ContactEducation.ContactKey,ContactEducation.School,ContactEducation.UpdatedByUserKey,ContactEducation.UpdatedOn,ContactEducation.EducationLevelCode,ContactEducation.EndYear,ContactEducation.StartYear,ContactEducation.Specialty FROM ContactEducation
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoContactFundraising]'))
    DROP VIEW [dbo].[vBoContactFundraising]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoContactFundraising] AS SELECT ContactFundraising.ContactKey,ContactFundraising.SoftCreditGroupKey,ContactFundraising.SolicitorGroupKey,ContactFundraising.ReceiptPreferenceCode FROM ContactFundraising
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoContactLog]'))
    DROP VIEW [dbo].[vBoContactLog]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoContactLog] AS SELECT ContactLog.ContactLogKey,ContactLog.CreatedOn,ContactLog.Description,ContactLog.OutputOn,ContactLog.SourceCodeCode,ContactLog.CreatedByUserKey,ContactLog.OrganizationKey,ContactLog.ContactKey FROM ContactLog
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoContactOffering]'))
    DROP VIEW [dbo].[vBoContactOffering]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoContactOffering] AS SELECT ContactOffering.ContactKey,ContactOffering.ContactOfferingKey FROM ContactOffering
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoContactOfferingRef]'))
    DROP VIEW [dbo].[vBoContactOfferingRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoContactOfferingRef] AS SELECT ContactOfferingRef.ContactOfferingDesc AS Description,ContactOfferingRef.ContactOfferingKey FROM ContactOfferingRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoContactPicture]'))
    DROP VIEW [dbo].[vBoContactPicture]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoContactPicture] AS SELECT ContactPicture.ContactKey,ContactPicture.ContactPictureKey,ContactPicture.Description,ContactPicture.PicturePurposeKey,ContactPicture.UpdatedByUserKey,ContactPicture.UpdatedOn,ContactPicture.Picture,ContactPicture.MimeType,ContactPicture.IsPreferred FROM ContactPicture
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoContactReport]'))
    DROP VIEW [dbo].[vBoContactReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoContactReport] AS SELECT vContactReport.ContactId,vContactReport.ContactKey,vContactReport.ContactName,vContactReport.ContactSortName,vContactReport.ContactStatus,vContactReport.IsInstitute,vContactReport.NoSolicitationFlag,vContactReport.PreferredAddressCategoryCode,vContactReport.PrimaryMembershipGroupKey,vContactReport.TaxIDNumber,vContactReport.ContactTypeKey FROM vContactReport
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoContactSalutation]'))
    DROP VIEW [dbo].[vBoContactSalutation]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoContactSalutation] AS SELECT ContactSalutation.IsOverridden,ContactSalutation.SalutationText,ContactSalutation.ContactKey,ContactSalutation.SalutationKey,ContactSalutation.ContactSalutationKey,ContactSalutation.IsDeletable FROM ContactSalutation
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoContactSkill]'))
    DROP VIEW [dbo].[vBoContactSkill]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoContactSkill] AS SELECT ContactSkill.ContactKey,ContactSkill.ContactSkillKey FROM ContactSkill
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoContactSkillRef]'))
    DROP VIEW [dbo].[vBoContactSkillRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoContactSkillRef] AS SELECT ContactSkillRef.ContactSkillDesc AS Description,ContactSkillRef.ContactSkillKey FROM ContactSkillRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoContactStatusRef]'))
    DROP VIEW [dbo].[vBoContactStatusRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoContactStatusRef] AS SELECT ContactStatusRef.ContactStatusCode AS Code,ContactStatusRef.ContactStatusDesc AS Description,ContactStatusRef.IsSystem FROM ContactStatusRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoContactTypeRef]'))
    DROP VIEW [dbo].[vBoContactTypeRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoContactTypeRef] AS SELECT ContactTypeRef.ContactTypeDesc AS Description,ContactTypeRef.ContactTypeKey,ContactTypeRef.GroupTypeKey,ContactTypeRef.IsInstitute FROM ContactTypeRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoContentChangeRequest]'))
    DROP VIEW [dbo].[vBoContentChangeRequest]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoContentChangeRequest] AS SELECT ContentChangeRequest.ContentChangeRequestKey,ContentChangeRequest.ContentDocumentVersionKey,ContentChangeRequest.ContentRequestStatusCode,ContentChangeRequest.AssignedByUserKey,ContentChangeRequest.AssignedToUserKey,ContentChangeRequest.RequestText,ContentChangeRequest.RequestDateTime,ContentChangeRequest.ReassignedToUserKey FROM ContentChangeRequest
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoContentManagerAuthorityGroup]'))
    DROP VIEW [dbo].[vBoContentManagerAuthorityGroup]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoContentManagerAuthorityGroup] AS SELECT ContentManagerAuthorityGroup.GroupKey,ContentManagerAuthorityGroup.IsMasterAdmin FROM ContentManagerAuthorityGroup
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoContentUserDefinedFieldValue]'))
    DROP VIEW [dbo].[vBoContentUserDefinedFieldValue]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoContentUserDefinedFieldValue] AS SELECT ContentUserDefinedFieldValue.ContentDocumentVersionKey,ContentUserDefinedFieldValue.UserDefinedFieldKey,ContentUserDefinedFieldValue.Value,ContentUserDefinedFieldValue.ValueText FROM ContentUserDefinedFieldValue
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoContentWorkflow]'))
    DROP VIEW [dbo].[vBoContentWorkflow]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoContentWorkflow] AS SELECT ContentWorkflowParameters.ContentAuthorityGroupKey,ContentWorkflowParameters.DocumentVersionKey,ContentWorkflowParameters.ExpirationDate,ContentWorkflowParameters.NumberOfDaysBeforeExpiration,ContentWorkflowParameters.OwnerGroupMemberKey,ContentWorkflowParameters.PublishedVersion,ContentWorkflowParameters.RecycleAtExpiration FROM ContentWorkflowParameters
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCostMethodRef]'))
    DROP VIEW [dbo].[vBoCostMethodRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCostMethodRef] AS SELECT CostMethodRef.CostMethodCode,CostMethodRef.CostMethodDesc,CostMethodRef.CostMethodName FROM CostMethodRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCostTier]'))
    DROP VIEW [dbo].[vBoCostTier]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCostTier] AS SELECT CostTier.CostTierKey,CostTier.DateReceived,CostTier.ProductInventoryKey,CostTier.ProductKey,CostTier.QuantityOnHand,CostTier.QuantityReceived,CostTier.TotalCost,CostTier.UnitCost,CostTier.UomKey,CostTier.WarehouseKey,CostTier.OriginalReceiptKey,CostTier.CostMethodCode FROM CostTier
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vCostTierReport]'))
    DROP VIEW [dbo].[vCostTierReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vCostTierReport]
AS
SELECT     
	pm.ProductKey, pm.ProductTypeKey, pm.ProductClassKey, pm.ProductCode, pm.Name AS ProductName, 
	ct.CostTierKey, ct.QuantityOnHand, ct.QuantityReceived, ct.DateReceived, ct.UnitCost, 
	ct.TotalCost, ct.WarehouseKey, ct.UomKey, ct.CostMethodCode AS CostMethod, cmr.CostMethodName,
	Uom.UomKey AS InvUom, Uom.Name AS UomName, 
	cmr.CostMethodCode, cmr.CostMethodDesc, sc.ParameterValue, 
	wh.Description AS Warehouse, wh.WarehouseStatusCode
FROM  CostTier ct 
	INNER JOIN ProductMain pm ON ct.ProductKey = pm.ProductKey 
	INNER JOIN CostMethodRef cmr ON ct.CostMethodCode = cmr.CostMethodCode 
	INNER JOIN Uom ON pm.InventoryUomKey = dbo.Uom.UomKey 
	LEFT OUTER JOIN SystemConfig sc ON cmr.CostMethodName = sc.ParameterValue 
	LEFT OUTER JOIN Warehouse wh ON pm.DefaultWarehouseKey = wh.WarehouseKey

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCostTierReport]'))
    DROP VIEW [dbo].[vBoCostTierReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCostTierReport] AS SELECT vCostTierReport.CostMethodCode,vCostTierReport.CostMethodDesc,vCostTierReport.CostTierKey,vCostTierReport.DateReceived,vCostTierReport.InvUom,vCostTierReport.ParameterValue,vCostTierReport.ProductClassKey,vCostTierReport.ProductCode,vCostTierReport.ProductKey,vCostTierReport.ProductName,vCostTierReport.ProductTypeKey,vCostTierReport.QuantityOnHand,vCostTierReport.QuantityReceived,vCostTierReport.TotalCost,vCostTierReport.UnitCost,vCostTierReport.UomKey,vCostTierReport.UomName,vCostTierReport.Warehouse,vCostTierReport.WarehouseKey,vCostTierReport.WarehouseStatusCode,vCostTierReport.CostMethod,vCostTierReport.CostMethodName FROM vCostTierReport
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCountryRef]'))
    DROP VIEW [dbo].[vBoCountryRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCountryRef] AS SELECT CountryRef.ChapterGroupKey,CountryRef.CountryCode,CountryRef.CountryName,CountryRef.DefaultShippingMethod,CountryRef.IntraStateCode,CountryRef.IsHandModified,CountryRef.MailGroup,CountryRef.SyncCountryName,CountryRef.UpdatedByUserKey,CountryRef.UpdatedOn,CountryRef.VATCountryCode,CountryRef.AddressFormatKey,CountryRef.IsActive,CountryRef.ISO3DigitCode,CountryRef.CountryKey FROM CountryRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCreditCardPaymentDetail]'))
    DROP VIEW [dbo].[vBoCreditCardPaymentDetail]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCreditCardPaymentDetail] AS SELECT PaymentDetail.CreatedByUserKey,PaymentDetail.CreatedOn,PaymentDetail.CurrencyCode,PaymentDetail.OriginalAmount,PaymentDetail.PaymentApplicationRestrictionCode,PaymentDetail.PaymentDetailKey,PaymentDetail.PaymentDetailStatusCode,PaymentDetail.PaymentMethodKey,PaymentDetail.PaymentTypeKey,PaymentDetail.PayorContactKey,PaymentDetail.ReferenceNumber,PaymentDetail.SerializedDetails,PaymentDetail.SummaryDisplay,PaymentDetail.UpdatedByUserKey,PaymentDetail.UpdatedOn,PaymentDetail.PaymentDetailBOName FROM PaymentDetail WHERE PaymentDetail.PaymentDetailBOName= 'CreditCardPaymentDetail'
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCreditTypeRef]'))
    DROP VIEW [dbo].[vBoCreditTypeRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCreditTypeRef] AS SELECT CreditTypeRef.CreditTypeCode,CreditTypeRef.CreditTypeDesc FROM CreditTypeRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCsActivity]'))
    DROP VIEW [dbo].[vBoCsActivity]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCsActivity] AS SELECT Activity.ACTION_CODES AS ActionCodes,Activity.ACTIVITY_TYPE AS ActivityType,Activity.AMOUNT AS Amount,Activity.CAMPAIGN_CODE AS CampaignCode,Activity.CATEGORY AS Category,Activity.CO_ID AS CompanyId,Activity.DESCRIPTION AS Description,Activity.EFFECTIVE_DATE AS EffectiveDate,Activity.GRACE_PERIOD AS GracePeriod,Activity.ID,Activity.MEMBER_TYPE AS MemberType,Activity.NEXT_INSTALL_DATE AS NextInstallDate,Activity.NOTE AS Note,Activity.NOTE_2 AS FollowUp,Activity.ORG_CODE AS EntityCode,Activity.OTHER_CODE AS OtherCode,Activity.PAY_METHOD AS PayMethod,Activity.PRODUCT_CODE AS ProductCode,Activity.QUANTITY AS Quantity,Activity.RECURRING_REQUEST AS RecurringRequest,Activity.SEQN AS Sequence,Activity.SOLICITOR_ID AS SolicitorId,Activity.SOURCE_CODE AS SourceCode,Activity.SOURCE_SYSTEM AS SourceSystem,Activity.STATUS_CODE AS StatusCode,Activity.TAXABLE_VALUE AS TaxableValue,Activity.THRU_DATE AS ThruDate,Activity.TICKLER_DATE AS ReminderDate,Activity.TRANSACTION_DATE AS TransactionDate,Activity.UF_1 AS UserField1,Activity.UF_2 AS UserField2,Activity.UF_3 AS UserField3,Activity.UF_4 AS UserField4,Activity.UF_5 AS UserField5,Activity.UF_6 AS UserField6,Activity.UF_7 AS UserField7,Activity.UNITS AS Units,Activity.ORIGINATING_TRANS_NUM FROM Activity
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCsActivityTypes]'))
    DROP VIEW [dbo].[vBoCsActivityTypes]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCsActivityTypes] AS SELECT Product_Type.DESCRIPTION AS Description,Product_Type.PROD_TYPE AS ActivityType,Product_Type.PROFILE_SORT AS ProfileSortOrder,Product_Type.USER_EDIT AS UserEditable FROM Product_Type
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCsAddress]'))
    DROP VIEW [dbo].[vBoCsAddress]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCsAddress] AS SELECT Name_Address.ADDRESS_1 AS Address1,Name_Address.ADDRESS_2 AS Address2,Name_Address.ADDRESS_3 AS Address3,Name_Address.ADDRESS_FORMAT AS AddressFormat,Name_Address.ADDRESS_NUM AS AddressNumber,Name_Address.BAD_ADDRESS AS BadAddress,Name_Address.BAR_CODE AS BarCode,Name_Address.CITY AS City,Name_Address.COUNTRY AS Country,Name_Address.COUNTY AS County,Name_Address.CRRT,Name_Address.EMAIL AS Email,Name_Address.FAX AS Fax,Name_Address.FULL_ADDRESS AS FullAddress,Name_Address.ID,Name_Address.LAST_UPDATED AS LastUpdated,Name_Address.LAST_VERIFIED AS LastVerified,Name_Address.MAIL_CODE AS MailCode,Name_Address.PHONE AS Phone,Name_Address.PREFERRED_BILL AS PreferredBill,Name_Address.PREFERRED_MAIL AS PreferredMail,Name_Address.PREFERRED_SHIP AS PreferredShip,Name_Address.PURPOSE AS AddressPurpose,Name_Address.STATE_HOUSE AS StateHouse,Name_Address.STATE_PROVINCE AS StateProvince,Name_Address.STATE_SENATE AS StateSenate,Name_Address.US_CONGRESS AS UsCongress,Name_Address.ZIP AS Zip FROM Name_Address
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCsAppeal]'))
    DROP VIEW [dbo].[vBoCsAppeal]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCsAppeal] AS SELECT Appeal.APPEAL_CODE,Appeal.APPEAL_TYPE,Appeal.BEGINS_DATE,Appeal.CAMPAIGN_CODE,Appeal.DESCRIPTION,Appeal.ENDS_DATE,Appeal.FUND,Appeal.GOAL,Appeal.IS_PERPETUAL,Appeal.QUANTITY_DROPPED,Appeal.TIME_STAMP,Appeal.TITLE FROM Appeal
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCsCalls]'))
    DROP VIEW [dbo].[vBoCsCalls]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCsCalls] AS SELECT Activity.ACTION_CODES AS Actions,Activity.CO_ID AS CompanyId,Activity.ID,Activity.NOTE AS Note,Activity.NOTE_2 AS FollowUp,Activity.SEQN AS SequenceNumber,Activity.SOURCE_CODE AS AssignedTo,Activity.TICKLER_DATE AS FollowUpDate,Activity.TRANSACTION_DATE AS Date FROM Activity WHERE Activity.ACTIVITY_TYPE = 'CALL'
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCsCampaign]'))
    DROP VIEW [dbo].[vBoCsCampaign]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCsCampaign] AS SELECT Campaign.BEGINS_DATE,Campaign.CAMPAIGN_CODE,Campaign.DEFAULT_FUND,Campaign.DESCRIPTION,Campaign.ENDS_DATE,Campaign.GOAL,Campaign.IS_PERPETUAL,Campaign.TIME_STAMP,Campaign.TITLE FROM Campaign
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCsCommittee]'))
    DROP VIEW [dbo].[vBoCsCommittee]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCsCommittee] AS SELECT Activity.ACTIVITY_TYPE AS ActivityType,Activity.CO_ID AS CompanyId,Activity.ID,Activity.OTHER_CODE AS CommitteeCode,Activity.SEQN AS SequenceNumber,Activity.ACTION_CODES AS Position,Activity.EFFECTIVE_DATE AS FromDate,Activity.THRU_DATE AS ThruDate,Activity.CATEGORY AS Other,Activity.TRANSACTION_DATE AS LastUpdated,Activity.UNITS AS NoMail,Activity.NOTE AS Notes FROM Activity WHERE Activity.ACTIVITY_TYPE in ('COMMITTEE','PROPOSED','APPLICANT')
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCsCommitteeCode]'))
    DROP VIEW [dbo].[vBoCsCommitteeCode]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCsCommitteeCode] AS SELECT Product.DESCRIPTION AS Description,Product.GROUP_2 AS PaidThruValidation,Product.GROUP_3 AS TheGroup,Product.NOTE AS Note,Product.PRODUCT_CODE AS ProductCode,Product.PRODUCT_MINOR AS Code,Product.STATUS AS Status,Product.TITLE AS Title FROM Product WHERE Product.PROD_TYPE = 'COMMITTEE'
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vCsCommitteeMember]'))
    DROP VIEW [dbo].[vCsCommitteeMember]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vCsCommitteeMember] AS
SELECT     
	Name.ID, 
	Name.FULL_NAME AS FullName, 
	Name.TITLE AS Title, 
	Name.COMPANY AS Organization,
	Name.WORK_PHONE AS WorkPhone, 
	Name.HOME_PHONE AS HomePhone, 
	Name.FAX AS Fax, 
	Name.TOLL_FREE AS TollFreePhone, 
	Name.LAST_FIRST, 
	Name.EMAIL AS Email,
	Name.EXCLUDE_DIRECTORY AS ExcludeDirectory, 
	Name.STATUS AS [Status],
	NA_Bill.FULL_ADDRESS AS BillingAddress, 
	NA_Mail.FULL_ADDRESS AS MailingAddress, 
	Product.TITLE AS CommitteeName, 
	Product.DESCRIPTION AS CommitteeDescription, 
	Product.GROUP_3 AS CommitteeGroup, 
	Committee_Position.TITLE AS Position, 
	Committee_Position.RANK AS PositionRank, 
	Product.NOTE AS Note, 
	Activity.EFFECTIVE_DATE AS TermStart, 
	Activity.THRU_DATE AS TermEnd, 
	Activity.PRODUCT_CODE AS CommitteeProductCode
FROM    
	Activity INNER JOIN
        	Name ON Activity.ID = Name.ID INNER JOIN
                Product ON Activity.PRODUCT_CODE = Product.PRODUCT_CODE INNER JOIN
                Name_Address NA_Mail ON Name.MAIL_ADDRESS_NUM = NA_Mail.ADDRESS_NUM INNER JOIN
                Name_Address NA_Bill ON Name.BILL_ADDRESS_NUM = NA_Bill.ADDRESS_NUM INNER JOIN
                Committee_Position ON Activity.ACTION_CODES = Committee_Position.POSITION_CODE
WHERE     
	(Product.PROD_TYPE = 'COMMITTEE') 
	AND
	(Product.WEB_OPTION = 1) 
	AND
	(Activity.EFFECTIVE_DATE <= GETDATE()) 
	AND
	(Activity.THRU_DATE IS NULL OR (Activity.THRU_DATE >= GETDATE()))

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCsCommitteeMember]'))
    DROP VIEW [dbo].[vBoCsCommitteeMember]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCsCommitteeMember] AS SELECT vCsCommitteeMember.BillingAddress,vCsCommitteeMember.CommitteeDescription,vCsCommitteeMember.CommitteeGroup,vCsCommitteeMember.CommitteeName,vCsCommitteeMember.CommitteeProductCode,vCsCommitteeMember.Email,vCsCommitteeMember.Fax,vCsCommitteeMember.FullName,vCsCommitteeMember.HomePhone,vCsCommitteeMember.ID,vCsCommitteeMember.LAST_FIRST,vCsCommitteeMember.MailingAddress,vCsCommitteeMember.Note,vCsCommitteeMember.Organization,vCsCommitteeMember.Position,vCsCommitteeMember.PositionRank,vCsCommitteeMember.TermEnd,vCsCommitteeMember.TermStart,vCsCommitteeMember.Title,vCsCommitteeMember.TollFreePhone,vCsCommitteeMember.WorkPhone,vCsCommitteeMember.ExcludeDirectory,vCsCommitteeMember.Status FROM vCsCommitteeMember
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vCsCommittee]'))
    DROP VIEW [dbo].[vCsCommittee]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vCsCommittee] AS
SELECT DISTINCT CommitteeName,CommitteeGroup,CommitteeProductCode FROM vCsCommitteeMember

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCsCommitteeMemberGroup]'))
    DROP VIEW [dbo].[vBoCsCommitteeMemberGroup]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCsCommitteeMemberGroup] AS SELECT vCsCommittee.CommitteeGroup,vCsCommittee.CommitteeName,vCsCommittee.CommitteeProductCode FROM vCsCommittee
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCsCommitteePosition]'))
    DROP VIEW [dbo].[vBoCsCommitteePosition]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCsCommitteePosition] AS SELECT Committee_Position.POSITION_CODE AS PositionCode,Committee_Position.RANK AS Rank,Committee_Position.TITLE AS Title FROM Committee_Position
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCsContact]'))
    DROP VIEW [dbo].[vBoCsContact]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCsContact] AS SELECT Name.ADDRESS_NUM_1 AS AddressNumber1,Name.ADDRESS_NUM_2 AS AddressNumber2,Name.ADDRESS_NUM_3 AS AddressNumber3,Name.BAR_CODE AS BarCode,Name.BILL_ADDRESS_NUM AS BillAddressNum,Name.BIRTH_DATE AS BirthDate,Name.CATEGORY AS Category,Name.CHAPTER AS Chapter,Name.CO_ID AS CompanyId,Name.CO_MEMBER_TYPE AS CompanyMemberType,Name.COMPANY AS Company,Name.COMPANY_SORT AS CompanySort,Name.CONTACT_RANK AS ContactRank,Name.COUNTRY AS Country,Name.COUNTY AS County,Name.CRRT AS Crrt,Name.DATE_ADDED AS DateAdded,Name.DESIGNATION AS Designation,Name.DUP_MATCH_KEY AS DupMatchKey,Name.EMAIL AS Email,Name.EXCLUDE_DIRECTORY AS ExcludeDirectory,Name.EXCLUDE_MAIL AS ExcludeMail,Name.FAX AS Fax,Name.FULL_ADDRESS AS FullAddress,Name.FUNCTIONAL_TITLE AS FunctionalTitle,Name.GENDER AS Gender,Name.HOME_PHONE AS HomePhone,Name.INFORMAL AS Informal,Name.INTENT_TO_EDIT AS IntentToEdit,Name.JOIN_DATE AS JoinDate,Name.LAST_FIRST AS LastFirst,Name.LAST_NAME AS LastName,Name.LAST_UPDATED AS LastUpdated,Name.MAIL_ADDRESS_NUM AS MailAddressNumber,Name.MAIL_CODE AS MailCode,Name.MAJOR_KEY AS MajorKey,Name.MEMBER_RECORD AS IsMember,Name.MEMBER_STATUS AS MemberStatus,Name.MEMBER_STATUS_DATE AS MemberStatusDate,Name.MEMBER_TYPE AS MemberType,Name.MIDDLE_NAME AS MiddleName,Name.MT_CHANGE_DATE AS MemberTypeChangeDate,Name.ORG_CODE AS EntityCode,Name.PAID_THRU AS PaidThrough,Name.PREFIX AS Prefix,Name.PREVIOUS_MT AS PreviousMemberType,Name.SIC_CODE AS SicCode,Name.SOURCE_CODE AS SourceCode,Name.STATE_HOUSE AS StateHouse,Name.STATE_PROVINCE AS StateProvince,Name.STATE_SENATE AS StateSenate,Name.STATUS AS Status,Name.SUFFIX AS Suffix,Name.TITLE AS Title,Name.UPDATED_BY AS UpdatedBy,Name.US_CONGRESS AS UsCongress,Name.WEBSITE AS Website,Name.WORK_PHONE AS WorkPhone,Name.ZIP AS Zip,Name.FIRST_NAME AS FirstName,Name.CITY AS City,Name.TOLL_FREE AS TollFree,Name.BT_ID AS BillToID,Name.SHIP_ADDRESS_NUM AS ShipAddressNum,Name.ID,Name_Fin.BACKORDERS AS Backorders,Name_Fin.CREDIT_LIMIT AS CreditLimit,Name_Fin.NO_STATEMENTS AS NoStatements,Name_Fin.RENEW_MONTHS AS RenewMonths,Name_Fin.RENEWED_THRU AS RenewedThru,Name_Fin.TAX_AUTHOR_DEFAULT AS DefaultTaxAuthority,Name_Fin.TAX_EXEMPT AS TaxExempt,Name_Fin.TERMS_CODE AS DefaultTermsCode,Name_Fin.USE_VAT_TAXATION AS VatExempt,Name_Fin.VAT_COUNTRY AS VatCountry,Name_Fin.VAT_REG_NUMBER AS VatRegNumber,Name.COMPANY_RECORD AS IsCompany,Name.FULL_NAME AS FullName FROM Name
	INNER JOIN Name_Fin
		ON Name.ID = Name_Fin.ID
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vNetContact]'))
    DROP VIEW [dbo].[vNetContact]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vNetContact] 
AS 
SELECT n.[ADDRESS_NUM_1] AS [AddressNumber1],
       n.[ADDRESS_NUM_2] AS [AddressNumber2],
       n.[ADDRESS_NUM_3] AS [AddressNumber3],
       n.[BAR_CODE] AS [BarCode],
       n.[BILL_ADDRESS_NUM] AS [BillAddressNum],
       n.[BIRTH_DATE] AS [BirthDate],
       n.[CATEGORY] AS [Category],
       n.[CHAPTER] AS [Chapter],
       n.[CO_ID] AS [CompanyId],
       n.[CO_MEMBER_TYPE] AS [CompanyMemberType],
       n.[COMPANY] AS [Company],
       n.[COMPANY_SORT] AS [CompanySort],
       n.[CONTACT_RANK] AS [ContactRank],
       n.[COUNTRY] AS [Country],
       n.[COUNTY] AS [County],
       n.[CRRT] AS [Crrt],
       n.[DATE_ADDED] AS [DateAdded],
       n.[DESIGNATION] AS [Designation],
       n.[DUP_MATCH_KEY] AS [DupMatchKey],
       n.[EMAIL] AS [Email],
       n.[EXCLUDE_DIRECTORY] AS [ExcludeDirectory],
       n.[EXCLUDE_MAIL] AS [ExcludeMail],
       n.[FAX] AS [Fax],
       n.[FULL_ADDRESS] AS [FullAddress],
       n.[FUNCTIONAL_TITLE] AS [FunctionalTitle],
       n.[GENDER] AS [Gender],
       n.[HOME_PHONE] AS [HomePhone],
       n.[INFORMAL] AS [Informal],
       n.[INTENT_TO_EDIT] AS [IntentToEdit],
       n.[JOIN_DATE] AS [JoinDate],
       n.[LAST_FIRST] AS [LastFirst],
       n.[LAST_NAME] AS [LastName],
       n.[LAST_UPDATED] AS [LastUpdated],
       n.[MAIL_ADDRESS_NUM] AS [MailAddressNumber],
       n.[MAIL_CODE] AS [MailCode],
       n.[MAJOR_KEY] AS [MajorKey],
       n.[MEMBER_RECORD] AS [IsMember],
       n.[MEMBER_STATUS] AS [MemberStatus],
       n.[MEMBER_STATUS_DATE] AS [MemberStatusDate],
       n.[MEMBER_TYPE] AS [MemberType],
       n.[MIDDLE_NAME] AS [MiddleName],
       n.[MT_CHANGE_DATE] AS [MemberTypeChangeDate],
       n.[ORG_CODE] AS [EntityCode],
       n.[PAID_THRU] AS [PaidThrough],
       n.[PREFIX] AS [Prefix],
       n.[PREVIOUS_MT] AS [PreviousMemberType],
       n.[SIC_CODE] AS [SicCode],
       n.[SOURCE_CODE] AS [SourceCode],
       n.[STATE_HOUSE] AS [StateHouse],
       n.[STATE_PROVINCE] AS [StateProvince],
       n.[STATE_SENATE] AS [StateSenate],
       n.[STATUS] AS [Status],
       n.[SUFFIX] AS [Suffix],
       n.[TITLE] AS [Title],
       n.[UPDATED_BY] AS [UpdatedBy],
       n.[US_CONGRESS] AS [UsCongress],
       n.[WEBSITE] AS [Website],
       n.[WORK_PHONE] AS [WorkPhone],
       n.[ZIP] AS [Zip],
       n.[FIRST_NAME] AS [FirstName],
       n.[CITY] AS [City],
       n.[TOLL_FREE] AS [TollFree],
       n.[BT_ID] AS [BillToID],
       n.[SHIP_ADDRESS_NUM] AS [ShipAddressNum],
       n.[ID],
       cm.[ContactKey],
       cm.[CreatedByUserKey],
       cm.[CreatedOn],
       cm.[UpdatedByUserKey],
       cm.[UpdatedOn],
       cm.[AccessKey],
       cm.[FullName],
       cm.[IsInstitute] AS [IsCompany],
       nf.[BACKORDERS] AS [Backorders],
       nf.[CREDIT_LIMIT] AS [CreditLimit],
       nf.[NO_STATEMENTS] AS [NoStatements],
       nf.[RENEW_MONTHS] AS [RenewMonths],
       nf.[RENEWED_THRU] AS [RenewedThru],
       nf.[TAX_AUTHOR_DEFAULT] AS [DefaultTaxAuthority],
       nf.[TAX_EXEMPT] AS [TaxExempt],
       nf.[TERMS_CODE] AS [DefaultTermsCode],
       nf.[USE_VAT_TAXATION] AS [VatExempt],
       nf.[VAT_COUNTRY] AS [VatCountry],
       nf.[VAT_REG_NUMBER] AS [VatRegNumber],
       cm.[ContactStatusCode],
       cm.[SortName],
       cm.[TaxIDNumber] 
  FROM [dbo].[ContactMain] cm
	   INNER JOIN [dbo].[Name] n ON cm.[SyncContactID] = n.[ID]
	   INNER JOIN [dbo].[Name_Fin] nf ON n.[ID] = nf.[ID]

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vContactRelatedCompany]'))
    DROP VIEW [dbo].[vContactRelatedCompany]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vContactRelatedCompany]
AS
SELECT prospect.ID AS 'CurrentId', prospect.ContactKey AS 'CurrentContactKey', prospect.CompanyId AS 'CurrentCompanyId', relProspect.ID, 
       relProspect.CompanyId, relProspect.Company, relProspect.IsCompany, relProspect.ContactKey, relProspect.FullName, relProspect.FullAddress, 
       relProspect.MemberType, relProspect.Status, relProspect.LastFirst, relProspect.Title, relProspect.Prefix, relProspect.Suffix, relProspect.Designation, 
       relProspect.Informal, relProspect.WorkPhone, relProspect.HomePhone, relProspect.Fax, relProspect.TollFree, relProspect.Email, relProspect.City, 
       relProspect.StateProvince, relProspect.Zip, relProspect.Country, relProspect.FunctionalTitle, relProspect.ContactRank
  FROM [dbo].[vNetContact] AS relProspect 
       INNER JOIN [dbo].[vNetContact] AS prospect ON (prospect.CompanyId = relProspect.ID OR
					                                  prospect.CompanyId = relProspect.CompanyId) AND relProspect.ID <> prospect.ID
 WHERE (prospect.CompanyId <> '')
UNION
SELECT prospect.ID AS 'CurrentId', prospect.ContactKey AS 'CurrentContactKey', prospect.CompanyId AS 'CurrentCompanyId', relProspect.ID, 
       relProspect.CompanyId, relProspect.Company, relProspect.IsCompany, relProspect.ContactKey, relProspect.FullName, relProspect.FullAddress, 
       relProspect.MemberType, relProspect.Status, relProspect.LastFirst, relProspect.Title, relProspect.Prefix, relProspect.Suffix, relProspect.Designation, 
       relProspect.Informal, relProspect.WorkPhone, relProspect.HomePhone, relProspect.Fax, relProspect.TollFree, relProspect.Email, relProspect.City, 
       relProspect.StateProvince, relProspect.Zip, relProspect.Country, relProspect.FunctionalTitle, relProspect.ContactRank
  FROM [dbo].[vNetContact] AS relProspect 
       INNER JOIN [dbo].[vNetContact] AS prospect ON prospect.ID = relProspect.CompanyId AND relProspect.ID <> prospect.ID
 WHERE (prospect.IsCompany = 1)

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCsContactRelatedCompany]'))
    DROP VIEW [dbo].[vBoCsContactRelatedCompany]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCsContactRelatedCompany] AS SELECT vContactRelatedCompany.City,vContactRelatedCompany.Company,vContactRelatedCompany.CompanyId,vContactRelatedCompany.ContactKey,vContactRelatedCompany.ContactRank,vContactRelatedCompany.Country,vContactRelatedCompany.CurrentCompanyId,vContactRelatedCompany.CurrentContactKey,vContactRelatedCompany.CurrentId,vContactRelatedCompany.Designation,vContactRelatedCompany.Email,vContactRelatedCompany.Fax,vContactRelatedCompany.FullAddress,vContactRelatedCompany.FullName,vContactRelatedCompany.FunctionalTitle,vContactRelatedCompany.HomePhone,vContactRelatedCompany.ID,vContactRelatedCompany.Informal,vContactRelatedCompany.IsCompany,vContactRelatedCompany.LastFirst,vContactRelatedCompany.MemberType,vContactRelatedCompany.Prefix,vContactRelatedCompany.StateProvince,vContactRelatedCompany.Status,vContactRelatedCompany.Suffix,vContactRelatedCompany.Title,vContactRelatedCompany.TollFree,vContactRelatedCompany.WorkPhone,vContactRelatedCompany.Zip FROM vContactRelatedCompany
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCsCountryNames]'))
    DROP VIEW [dbo].[vBoCsCountryNames]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCsCountryNames] AS SELECT Country_Names.ADDRESS_FORMAT AS AddressFormat,Country_Names.COUNTRY AS Country,Country_Names.DEFAULT_SHIPPING_METHOD AS DefaultShippingMethod,Country_Names.INTRASTAT_CODE AS VatIntrastatCode,Country_Names.MAIL_GROUP AS MailGroup,Country_Names.VAT_COUNTRY_CODE AS VatCountryCode FROM Country_Names
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vDonations]'))
    DROP VIEW [dbo].[vDonations]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vDonations]
   AS
	SELECT	
		MAX(Activity.ID)                        ID,
        Activity.ORIGINATING_TRANS_NUM			OriginalTransaction,
        MAX(P.INVOICE_REFERENCE_NUM) AS         InvoiceRefNum,
        MAX(Activity.SOURCE_SYSTEM)             SourceSystem,
		MAX(Activity.TRANSACTION_DATE)          TransactionDate,
		MAX(Activity.EFFECTIVE_DATE)            DateReceived,
		(SUM(C.AMOUNT) * -1)  AS                Amount,
		MAX(Activity.SOLICITOR_ID)              SolicitorID,
		(CASE WHEN MAX(Activity.ACTIVITY_TYPE) = 'GIFT'
				 THEN MAX(P.CHECK_NUMBER)   
		ELSE   '' END)							CheckNumber,
		   (CASE WHEN MAX(Activity.ACTIVITY_TYPE) = 'GIFT' THEN 
				(CASE MAX(Cash_Accounts.ACCOUNT_TYPE)
					WHEN 1 THEN 'Credit Card' 
					WHEN 2 THEN 'In Kind' 
					WHEN 3 THEN 'Debit Card' 
					ELSE  'Cash' 
				END) 
				ELSE  '' END) AS PaymentType,
		CONVERT(int, SUBSTRING(CONVERT(char(6),MAX( P.FISCAL_PERIOD)), 5, 2)) AS FiscalMonth,   
		CONVERT(int,substring(CONVERT(char(6),MAX(P.FISCAL_PERIOD)),1,4)) AS FiscalYear,
		(CASE 
			WHEN MAX(Activity.ACTIVITY_TYPE) = 'GIFT' 
			THEN 'Gift' 
			ELSE  'Pledge' END) AS         GiftType,
		MAX(P.MATCH_GIFT_TRANS_NUM)             MatchingTransaction,
		MAX(P.IS_MATCH_GIFT)                    IsMatchingGift,
		MAX(P.MEM_TRIB_ID)                      MemorialID,
		MAX(Activity.ACTION_CODES)              ListAs,
		MAX(Activity.UF_4)                      RequestNumber,
		MAX(P.MEM_TRIB_NAME_TEXT)               MemorialNameText  
	FROM Trans P 
		INNER JOIN (SELECT DISTINCT TransactionNumber FROM TransWatch) tw ON
			tw.TransactionNumber = P.TRANS_NUMBER
		INNER JOIN Activity ON 
			P.ACTIVITY_SEQN = Activity.SEQN
		LEFT OUTER JOIN Cash_Accounts ON 
			P.CHECK_NUMBER = Cash_Accounts.CASH_ACCOUNT_CODE
		INNER JOIN Invoice ON
			Invoice.REFERENCE_NUM = P.INVOICE_REFERENCE_NUM
		INNER JOIN Trans C ON 
			Invoice.REFERENCE_NUM = C.INVOICE_REFERENCE_NUM 
	WHERE        
		C.ST_ID=Activity.ID AND
		C.TRANSACTION_TYPE = 'DIST' AND 
		P.JOURNAL_TYPE = 'IN' AND 
		C.IS_FR_ITEM = 1 AND
		P.TRANSACTION_TYPE = 'DIST' AND 
		P.PRODUCT_CODE = C.PRODUCT_CODE AND
		(Invoice.SOURCE_SYSTEM = 'FR' OR (Invoice.SOURCE_SYSTEM = 'DUES' AND P.INVOICE_LINE_NUM = C.INVOICE_LINE_NUM))
	GROUP BY Activity.ID, Activity.ORIGINATING_TRANS_NUM 
UNION
	SELECT 
		MAX(Activity.ID)                        ID,
		Invoice.ORIGINATING_TRANS_NUM AS		OriginalTransaction,
		MAX(Trans.INVOICE_REFERENCE_NUM)		InvoiceRefNum,
		MAX(Activity.SOURCE_SYSTEM)				SourceSystem,
		MAX(Activity.TRANSACTION_DATE)			TransactionDate,
		MAX(Activity.EFFECTIVE_DATE)			DateReceived,
		SUM(Activity.AMOUNT) AS					Amount,
		'' AS                                   SolicitorID,
		'' AS                                   CheckNumber,
		'' AS									PaymentType,
		CONVERT(int, SUBSTRING(CONVERT(char(6), MAX(Trans.FISCAL_PERIOD)), 5, 2)) AS FiscalMonth,     
		CONVERT(int,substring(CONVERT(char(6), MAX(Trans.FISCAL_PERIOD)),1,4)) AS FiscalYear,
		'Gift' AS                               GiftType,
		0 AS                                    MatchingTransaction,
		0 AS                                    IsMatchingGift,
		'' AS                                   MemorialID,
		'' AS                                   ListAs,
		0 AS                                    RequestNumber,
		'' AS                                   MemorialNameText     
	FROM Activity
		INNER JOIN Trans ON 
			Activity.ORIGINATING_TRANS_NUM = Trans.TRANS_NUMBER
		INNER JOIN TransWatch ON
			TransWatch.TransactionNumber = Activity.ORIGINATING_TRANS_NUM AND
			TransWatch.InvoiceNumber = Trans.INVOICE_REFERENCE_NUM
		INNER JOIN Invoice ON 
			Invoice.REFERENCE_NUM = Trans.INVOICE_REFERENCE_NUM
        WHERE 
			Activity.ACTIVITY_TYPE = 'GIFT' AND 
			Activity.SOURCE_SYSTEM = 'MEETING' AND
			Trans.TRANSACTION_TYPE = 'DIST' AND 
			(Trans.PRODUCT_CODE = Activity.PRODUCT_CODE OR Trans.PRODUCT_CODE LIKE Activity.PRODUCT_CODE +'/%')
	GROUP BY Activity.ID, Trans.INVOICE_REFERENCE_NUM, Invoice.ORIGINATING_TRANS_NUM
UNION 
	SELECT 
		MAX(Activity.ID)                        ID,
		Activity.ORIGINATING_TRANS_NUM  AS		OriginalTransaction,
		0 AS                                    InvoiceRefNum,
		MAX(Activity.SOURCE_SYSTEM)				SourceSystem,
		MAX(Activity.TRANSACTION_DATE)			TransactionDate,
		MAX(Activity.EFFECTIVE_DATE)			DateReceived,
		SUM(Activity.AMOUNT) AS					Amount,
		'' AS                                   SolicitorID,
		'' AS                                   CheckNumber,
		(CASE MAX(Cash_Accounts.ACCOUNT_TYPE)
			WHEN 1 THEN 'Credit Card' 
			WHEN 2 THEN 'In Kind' 
			WHEN 3 THEN 'Debit Card' 
			ELSE  'Cash' END) AS	PaymentType,
		CONVERT(int, SUBSTRING(CONVERT(char(6), MAX(Trans.FISCAL_PERIOD)), 5, 2)) AS FiscalMonth,     
		CONVERT(int,substring(CONVERT(char(6),MAX(Trans.FISCAL_PERIOD)),1,4)) AS FiscalYear,
		'Gift' AS                               GiftType,
		0 AS                                    MatchingTransaction,
		0 AS                                    IsMatchingGift,
		'' AS                                   MemorialID,
		'' AS                                   ListAs,
		0 AS                                    RequestNumber,
		'' AS                                   MemorialNameText     
	FROM Activity
		INNER JOIN Trans ON 
			Activity.ORIGINATING_TRANS_NUM = Trans.TRANS_NUMBER AND
			Trans.ST_ID = Activity.ID AND
			Trans.PRODUCT_CODE = Activity.PRODUCT_CODE
		INNER JOIN TransWatch ON
			TransWatch.TransactionNumber = Trans.TRANS_NUMBER AND
			TransWatch.InvoiceNumber = Trans.INVOICE_REFERENCE_NUM
		LEFT OUTER JOIN Cash_Accounts ON 
			Trans.CHECK_NUMBER = Cash_Accounts.CASH_ACCOUNT_CODE
	WHERE
		Activity.ACTIVITY_TYPE = 'GIFT'  AND
		Activity.SOURCE_SYSTEM IN ('DUES' , 'SC') AND
		Trans.TRANSACTION_TYPE = 'DIST' 
	GROUP BY Activity.ID, Activity.ORIGINATING_TRANS_NUM
UNION
	SELECT 
		ID, 
		OriginalTransaction, 
		InvoiceRefNum, 
		SourceSystem, 
		TransactionDate, 
		DateReceived, 
		Amount, 
		SolicitorID, 
		CheckNumber, 
		PaymentType, 
		FiscalMonth, 
		FiscalYear, 
		GiftType, 
		MatchingTransaction, 
		IsMatchingGift, 
		MemorialID, 
		ListAs, 
		RequestNumber, 
		MemorialNameText 
	FROM DonationReport
	WHERE OriginalTransaction NOT IN (SELECT TransWatch.TransactionNumber FROM TransWatch )

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCsDonations]'))
    DROP VIEW [dbo].[vBoCsDonations]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCsDonations] AS SELECT vDonations.Amount,vDonations.CheckNumber,vDonations.DateReceived,vDonations.FiscalMonth,vDonations.FiscalYear,vDonations.GiftType,vDonations.ID,vDonations.InvoiceRefNum,vDonations.IsMatchingGift,vDonations.ListAs,vDonations.MatchingTransaction,vDonations.MemorialID,vDonations.MemorialNameText,vDonations.OriginalTransaction,vDonations.PaymentType,vDonations.RequestNumber,vDonations.SolicitorID,vDonations.SourceSystem,vDonations.TransactionDate FROM vDonations
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vDonationsDetail]'))
    DROP VIEW [dbo].[vDonationsDetail]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE view [dbo].[vDonationsDetail] as
   select max(Activity.ID)                                       ID,
              max(Activity.ORIGINATING_TRANS_NUM) OriginalTransaction,
                  max(P.INVOICE_REFERENCE_NUM) as  InvoiceRefNum,
              max(Activity.SOURCE_SYSTEM)                  SourceSystem,
              max(Activity.TRANSACTION_DATE)                     TransactionDate,
              max(Activity.EFFECTIVE_DATE)                  DateReceived,
              (sum(C.AMOUNT) * -1)  as                          Amount,
              max(Activity.SOLICITOR_ID)                      SolicitorID,
              (case when max(Activity.ACTIVITY_TYPE) = 'GIFT' then 
                            max(P.CHECK_NUMBER) 
                            else '' end)                            CheckNumber,
                 max(Activity.SOURCE_CODE) Appeal,
                  max(Activity.CAMPAIGN_CODE) Campaign,
                  max(Activity.ORG_CODE) Fund,
                  (case when max(Activity.ACTIVITY_TYPE) = 'GIFT' then (case max(Cash_Accounts.ACCOUNT_TYPE)
                            when 1 then 'Credit Card' 
                            when 2 then 'In Kind' 
                            when 3 then 'Debit Card' 
                           else 'Cash' end) else '' end) as PaymentType,
              CONVERT(int, SUBSTRING(CONVERT(char(6),max( P.FISCAL_PERIOD)), 5, 2)) AS FiscalMonth,   
              convert(int,substring(convert(char(6),max(P.FISCAL_PERIOD)),1,4)) as FiscalYear,
              (case when max(Activity.ACTIVITY_TYPE) = 'GIFT' 
                        then 'Gift' 
                        else 'Pledge' end) as                            GiftType,
              max(P.MATCH_GIFT_TRANS_NUM)              MatchingTransaction,
              max(P.IS_MATCH_GIFT)                               IsMatchingGift,
              max(P.MEM_TRIB_ID)                                   MemorialID,
              max(Activity.ACTION_CODES)                     ListAs,
              max(Activity.UF_4)                                       RequestNumber,
              max(P.MEM_TRIB_NAME_TEXT)                   MemorialNameText  
       from Trans P inner join Activity on  P.ACTIVITY_SEQN = Activity.SEQN
                            left outer join Cash_Accounts on P.CHECK_NUMBER = Cash_Accounts.CASH_ACCOUNT_CODE
                            inner join Invoice on  Invoice.REFERENCE_NUM = P.INVOICE_REFERENCE_NUM
                            inner join Trans C on Invoice.REFERENCE_NUM = C.INVOICE_REFERENCE_NUM
      Where        C.TRANSACTION_TYPE = 'DIST' and 
                       P.JOURNAL_TYPE = 'IN' and P.TRANSACTION_TYPE = 'DIST'
                            and P.PRODUCT_CODE = C.PRODUCT_CODE 
                            AND (Invoice.SOURCE_SYSTEM = 'FR' OR  
                            (Invoice.SOURCE_SYSTEM = 'DUES' AND  P.INVOICE_LINE_NUM = C.INVOICE_LINE_NUM))
                            and C.IS_FR_ITEM = 1  
   group by Activity.ID, Activity.ORIGINATING_TRANS_NUM, Invoice.REFERENCE_NUM, Activity.ORG_CODE, Activity.CAMPAIGN_CODE, Activity.SOURCE_CODE
    union
    select max(Activity.ID)                        ID,
           min(Invoice.ORIGINATING_TRANS_NUM)    as OriginalTransaction,
           max(Trans.INVOICE_REFERENCE_NUM)    InvoiceRefNum,
           max(Activity.SOURCE_SYSTEM)         SourceSystem,
           max(Activity.TRANSACTION_DATE)  TransactionDate,
           max(Activity.EFFECTIVE_DATE)         DateReceived,
           sum(Activity.AMOUNT) as        Amount,
           '' as                                                   SolicitorID,
           '' as                                                   CheckNumber,
                 max(Activity.SOURCE_CODE) Appeal,
                  max(Activity.CAMPAIGN_CODE) Campaign,
                  max(Activity.ORG_CODE) Fund,
                '' as PaymentType,
           CONVERT(int, SUBSTRING(CONVERT(char(6), max(Trans.FISCAL_PERIOD)), 5, 2)) AS FiscalMonth,     
           convert(int,substring(convert(char(6),max(Trans.FISCAL_PERIOD)),1,4)) as FiscalYear,
           'Gift' as                                           GiftType,
           0 as                                                MatchingTransaction,
           0 as                                                IsMatchingGift,
           '' as                                                 MemorialID,
           '' as                                                 ListAs,
           0 as                                                RequestNumber,
           '' as                                                 MemorialNameText     
       from Activity
       inner join Trans on Activity.ORIGINATING_TRANS_NUM = Trans.TRANS_NUMBER
       inner join Invoice on Invoice.REFERENCE_NUM = Trans.INVOICE_REFERENCE_NUM
       where 
             Activity.ACTIVITY_TYPE = 'GIFT' and 
             Activity.SOURCE_SYSTEM = 'MEETING' and
             Trans.TRANSACTION_TYPE = 'DIST' and 
              (Trans.PRODUCT_CODE = Activity.PRODUCT_CODE OR Trans.PRODUCT_CODE LIKE Activity.PRODUCT_CODE +'/%')
    group by Activity.ID, Trans.INVOICE_REFERENCE_NUM, Activity.ORG_CODE, Activity.CAMPAIGN_CODE, Activity.SOURCE_CODE 
    union
    select max(Activity.ID)                        ID,
           max(Activity.ORIGINATING_TRANS_NUM)  as OriginalTransaction,
           0 as                                                   InvoiceRefNum,
           max(Activity.SOURCE_SYSTEM)         SourceSystem,
           max(Activity.TRANSACTION_DATE)  TransactionDate,
           max(Activity.EFFECTIVE_DATE)         DateReceived,
           sum(Activity.AMOUNT) as        Amount,
           '' as                                                   SolicitorID,
           max(Trans.CHECK_NUMBER) as                                  CheckNumber,
           max(Activity.SOURCE_CODE) Appeal,
           max(Activity.CAMPAIGN_CODE) Campaign,
           max(Activity.ORG_CODE) Fund,
           (case max(Cash_Accounts.ACCOUNT_TYPE)
                            when 1 then 'Credit Card' 
                            when 2 then 'In Kind' 
                            when 3 then 'Debit Card' 
                            else 'Cash' end) as PaymentType,
           CONVERT(int, SUBSTRING(CONVERT(char(6), max(Trans.FISCAL_PERIOD)), 5, 2)) AS FiscalMonth,     
           convert(int,substring(convert(char(6),max(Trans.FISCAL_PERIOD)),1,4)) as FiscalYear,
           'Gift' as                                           GiftType,
           0 as                                                MatchingTransaction,
           0 as                                                IsMatchingGift,
           '' as                                                 MemorialID,
           '' as                                                 ListAs,
           0 as                                                RequestNumber,
           '' as                                                 MemorialNameText     
       from dbo.Activity 
			INNER JOIN Trans ON 
				Activity.ORIGINATING_TRANS_NUM = Trans.TRANS_NUMBER AND
				Trans.ST_ID = Activity.ID AND
				Trans.PRODUCT_CODE = Activity.PRODUCT_CODE 
			LEFT OUTER JOIN Cash_Accounts ON 
				Trans.CHECK_NUMBER = Cash_Accounts.CASH_ACCOUNT_CODE
       where 
             Activity.ACTIVITY_TYPE = 'GIFT' and 
             Activity.SOURCE_SYSTEM IN ('DUES', 'SC') and
             Trans.TRANSACTION_TYPE = 'DIST'
    group by Activity.ID, Trans.TRANS_NUMBER, Activity.ORG_CODE, Activity.CAMPAIGN_CODE, Activity.SOURCE_CODE

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCsDonationsDetail]'))
    DROP VIEW [dbo].[vBoCsDonationsDetail]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCsDonationsDetail] AS SELECT vDonationsDetail.Amount,vDonationsDetail.Appeal,vDonationsDetail.Campaign,vDonationsDetail.CheckNumber,vDonationsDetail.DateReceived,vDonationsDetail.FiscalMonth,vDonationsDetail.FiscalYear,vDonationsDetail.Fund,vDonationsDetail.GiftType,vDonationsDetail.ID,vDonationsDetail.InvoiceRefNum,vDonationsDetail.IsMatchingGift,vDonationsDetail.ListAs,vDonationsDetail.MatchingTransaction,vDonationsDetail.MemorialID,vDonationsDetail.MemorialNameText,vDonationsDetail.OriginalTransaction,vDonationsDetail.PaymentType,vDonationsDetail.RequestNumber,vDonationsDetail.SolicitorID,vDonationsDetail.SourceSystem,vDonationsDetail.TransactionDate FROM vDonationsDetail
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCsDonorData]'))
    DROP VIEW [dbo].[vBoCsDonorData]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCsDonorData] AS SELECT Name_FR.DO_NOT_EMAIL AS DoNotEmail,Name_FR.DO_NOT_PHONE AS DoNotPhone,Name_FR.DO_NOT_SELL AS DoNotSell,Name_FR.DO_NOT_SOLICIT AS DoNotSolicit,Name_FR.ID,Name_FR.Last_Receipt_Printed_Date AS LastReceiptPrintDate,Name_FR.LIST_AS AS ListAs,Name_FR.PREFERRED_DIST_CODE AS PreferredDistribution,Name_FR.Receipt_Interval AS ReceiptInterval,Name_FR.SOLICITOR_ID AS SolicitorID FROM Name_FR
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCsDuesHistory]'))
    DROP VIEW [dbo].[vBoCsDuesHistory]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCsDuesHistory] AS SELECT Activity.ACTIVITY_TYPE AS ActivityType,Activity.AMOUNT AS Amount,Activity.CO_ID AS CompanyId,Activity.DESCRIPTION AS Description,Activity.EFFECTIVE_DATE AS EffectiveDate,Activity.ID,Activity.PRODUCT_CODE AS ProductCode,Activity.SEQN AS SequenceNumber,Activity.SOURCE_CODE AS SourceCode,Activity.THRU_DATE AS PaidThru,Activity.TRANSACTION_DATE AS TransactionDate FROM Activity WHERE Activity.ACTIVITY_TYPE = 'DUES'
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCsEvent]'))
    DROP VIEW [dbo].[vBoCsEvent]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCsEvent] AS SELECT Meet_Master.ADDRESS_1 AS Address1,Meet_Master.ADDRESS_2 AS Address2,Meet_Master.ADDRESS_3 AS Address3,Meet_Master.BEGIN_DATE AS BeginDate,Meet_Master.CITY AS City,Meet_Master.CONTACT_ID AS ContactId,Meet_Master.COORDINATORS AS Coordinators,Meet_Master.COUNTRY AS Country,Meet_Master.DESCRIPTION AS Description,Meet_Master.DIRECTIONS AS Directions,Meet_Master.EARLY_CUTOFF AS EarlyCutoff,Meet_Master.EMAIL_REGISTRATION AS EmailRegistration,Meet_Master.END_DATE AS EndDate,Meet_Master.HEAD_COUNT AS Attendees,Meet_Master.IS_FR_MEET AS IsFrMeeting,Meet_Master.LATE_CUTOFF AS LateCutoff,Meet_Master.MAX_REGISTRANTS AS MaxRegistrants,Meet_Master.MEET_APPEAL AS MeetAppeal,Meet_Master.MEET_CAMPAIGN AS MeetCampaign,Meet_Master.MEETING AS EventCode,Meet_Master.MEETING_IMAGE_NAME AS MeetingImageName,Meet_Master.MEETING_TYPE AS MeetingType,Meet_Master.MEETING_URL AS MeetingUrl,Meet_Master.NOTES AS Notes,Meet_Master.ORG_CODE AS EntityCode,Meet_Master.REG_CUTOFF AS RegCutoff,Meet_Master.STATE_PROVINCE AS StateProvince,Meet_Master.STATUS AS Status,Meet_Master.TITLE AS Title,Meet_Master.TOTAL_CANCELATIONS AS TotalCancelations,Meet_Master.TOTAL_REGISTRANTS AS TotalRegistrants,Meet_Master.TOTAL_REVENUE AS TotalRevenue,Meet_Master.WEB_ENABLED AS WebEnabled,Meet_Master.WEB_VIEW_ONLY AS WebViewOnly,Meet_Master.ZIP AS Zip FROM Meet_Master
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCsEventHistory]'))
    DROP VIEW [dbo].[vBoCsEventHistory]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCsEventHistory] AS SELECT Activity.ACTIVITY_TYPE AS ActivityType,Activity.AMOUNT AS Fees,Activity.CO_ID AS CompanyId,Activity.DESCRIPTION AS Event,Activity.ID,Activity.PRODUCT_CODE AS EventCode,Activity.SEQN AS SequenceNumber,Activity.SOURCE_CODE AS SourceCode,Activity.TRANSACTION_DATE AS EventDate FROM Activity WHERE Activity.ACTIVITY_TYPE = 'MEETING'
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCsExchangeRate]'))
    DROP VIEW [dbo].[vBoCsExchangeRate]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCsExchangeRate] AS SELECT Exchange_Rate.CurrencyCode,Exchange_Rate.ExchangeRate FROM Exchange_Rate
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCsFunction]'))
    DROP VIEW [dbo].[vBoCsFunction]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCsFunction] AS SELECT Product.DEFERRED_INCOME_ACCOUNT AS DeferredIncomeAccount,Product.DESCRIPTION AS FunctionDescription,Product.INCOME_ACCOUNT AS DefaultIncomeAccount,Product.PRICE_1 AS DefaultEarlyFees,Product.PRICE_2 AS DefaultRegularFees,Product.PRICE_3 AS DefaultLateFees,Product.PRODUCT_CODE AS ProductCode,Product.PRODUCT_MAJOR AS EventCode,Product.PRODUCT_MINOR AS FunctionCode,Product.PST_TAXABLE AS PSTTaxable,Product.STATUS AS Status,Product.TAX_AUTHORITY AS VatTaxAuthority,Product.TAXABLE AS GSTTaxable,Product.TAXABLE_VALUE AS FairMarketValue,Product.TITLE AS Title,Product_Function.ACTUAL_ATTENDANCE AS ActualAttendance,Product_Function.AUTO_ENROLL AS AutomaticOption,Product_Function.BEGIN_DATE_TIME AS BeginDate,Product_Function.CEU_AMOUNT AS CeuAmount,Product_Function.CEU_ENTERED AS CeuEntered,Product_Function.CEU_TYPE AS CeuType,Product_Function.CONFLICT_CODE AS ConflictCode,Product_Function.END_DATE_TIME AS EndDate,Product_Function.EXPECTED_ATTENDANCE AS ExpectedAttendance,Product_Function.FUNCTION_TYPE AS FunctionType,Product_Function.GUARANTEED_ATTENDANCE AS GuaranteedAttendance,Product_Function.LAST_TICKET AS LastTicket,Product_Function.MAXIMUM_ATTENDANCE AS MaximumAttendance,Product_Function.MINIMUM_ATTENDANCE AS MinimumAttendance,Product_Function.PARENT AS Parent,Product_Function.PRINT_TICKET AS PrintTicket,Product_Function.SEQ AS SequenceNumber,Product_Function.SETTINGS AS Settings,Product_Function.WEB_ENABLED AS WebEnabled,Product_Inventory.LTD_INCOME AS TotalFees,Product_Inventory.LTD_QUANTITY AS TotalRegistrants FROM Product
	INNER JOIN Product_Function
		ON Product.PRODUCT_CODE = Product_Function.PRODUCT_CODE
	INNER JOIN Product_Inventory
		ON Product_Function.PRODUCT_CODE = Product_Inventory.PRODUCT_CODE
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCsFunctionFees]'))
    DROP VIEW [dbo].[vBoCsFunctionFees]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCsFunctionFees] AS SELECT Product_Price.COMPLIMENTARY AS Complimentary,Product_Price.CUSTOMER_TYPE AS RegistrantClass,Product_Price.INCOME_ACCOUNT AS IncomeAccount,Product_Price.PRODUCT_CODE AS ProductCode,Product_Price.RATE_1 AS EarlyFees,Product_Price.RATE_2 AS RegularFees,Product_Price.RATE_3 AS LateFees,Product_Price.RULE_TYPE AS RuleType FROM Product_Price
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCsGeneralLookupTables]'))
    DROP VIEW [dbo].[vBoCsGeneralLookupTables]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCsGeneralLookupTables] AS SELECT Gen_Tables.CODE AS Code,Gen_Tables.DESCRIPTION AS Description,Gen_Tables.SUBSTITUTE AS SubstituteValue,Gen_Tables.TABLE_NAME AS TableName FROM Gen_Tables
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vGenTablesUnion]'))
    DROP VIEW [dbo].[vGenTablesUnion]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
/****** Object:  View dbo.vGenTablesUnion    Script Date: 7/3/2003 4:57:56 PM ******/
CREATE VIEW vGenTablesUnion AS
SELECT	TABLE_NAME, CODE, DESCRIPTION
 FROM	Gen_Tables
 WHERE	SUBSTITUTE <= ' '
UNION
SELECT	TABLE_NAME, SUBSTITUTE, DESCRIPTION
 FROM	Gen_Tables
 WHERE	SUBSTITUTE > ' '

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCsGenTablesUnion]'))
    DROP VIEW [dbo].[vBoCsGenTablesUnion]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCsGenTablesUnion] AS SELECT vGenTablesUnion.CODE AS Code,vGenTablesUnion.DESCRIPTION AS Description,vGenTablesUnion.TABLE_NAME AS TableName FROM vGenTablesUnion
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCsInventory]'))
    DROP VIEW [dbo].[vBoCsInventory]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCsInventory] AS SELECT Product_Inventory.ADJUSTMENT_ACCOUNT AS AdjustmentAccount,Product_Inventory.AVERAGE_COST AS AverageCost,Product_Inventory.COG_ACCOUNT AS CogAccount,Product_Inventory.EXPECTED_ARRIVAL_DATE AS ExpectedArrivalDate,Product_Inventory.FIRST_ORDER_DATE AS FirstOrderDate,Product_Inventory.INCOME_ACCOUNT AS IncomeAccount,Product_Inventory.INVENTORY_ACCOUNT AS InventoryAccount,Product_Inventory.LAST_ORDER_DATE AS LastOrderDate,Product_Inventory.LAST_RECEIVED_DATE AS LastReceivedDate,Product_Inventory.LATEST_COST AS LatestCost,Product_Inventory.LOCATION AS Location,Product_Inventory.LTD_INCOME AS LtdIncome,Product_Inventory.LTD_ORDERS AS LtdOrders,Product_Inventory.LTD_QUANTITY AS LtdQuantitySold,Product_Inventory.MINIMUM_ORDER_POINT AS MinimumOrderPoint,Product_Inventory.MINIMUM_ORDER_QUANTITY AS MinimumOrderQuantity,Product_Inventory.PRODUCT_CODE AS ProductCode,Product_Inventory.QUANTITY_AVAILABLE AS QuantityAvailable,Product_Inventory.QUANTITY_BACKORDERED AS QuantityBackordered,Product_Inventory.QUANTITY_COMMITTED AS QuantityCommitted,Product_Inventory.QUANTITY_ON_HAND AS QuantityOnHand,Product_Inventory.QUANTITY_ON_ORDER AS QuantityOnOrder,Product_Inventory.QUANTITY_RESERVED AS QuantityReserved,Product_Inventory.STANDARD_COST AS StandardCost,Product_Inventory.TOTAL_COST AS TotalCost FROM Product_Inventory
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCsInvoice]'))
    DROP VIEW [dbo].[vBoCsInvoice]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCsInvoice] AS SELECT Invoice.ADJUSTMENTS,Invoice.AR_ACCOUNT,Invoice.AVAILABLE_DISC,Invoice.BALANCE,Invoice.BATCH_NUM,Invoice.BILL_TO_CC,Invoice.BT_ID,Invoice.CHARGES,Invoice.CREDIT_STATUS,Invoice.CREDITS,Invoice.CUSTOMER_NAME,Invoice.CUSTOMER_REFERENCE,Invoice.DESCRIPTION,Invoice.DISCOUNT_DATE,Invoice.DUE_DATE,Invoice.EFFECTIVE_DATE,Invoice.HAS_BEEN_BILLED,Invoice.INSTALL_BILL_DATE,Invoice.INVOICE_DATE,Invoice.INVOICE_NUM,Invoice.INVOICE_TYPE,Invoice.IS_MULTI_ORG,Invoice.NOTE,Invoice.NUM_LINES,Invoice.ORG_CODE,Invoice.ORIGINATING_TRANS_NUM,Invoice.REFERENCE_NUM,Invoice.SOURCE_CODE,Invoice.SOURCE_SYSTEM,Invoice.ST_ID,Invoice.TERMS_CODE FROM Invoice
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCsIsoCurrencyCodes]'))
    DROP VIEW [dbo].[vBoCsIsoCurrencyCodes]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCsIsoCurrencyCodes] AS SELECT Iso_Currency_Codes.CurrencyCode,Iso_Currency_Codes.CurrencyName FROM Iso_Currency_Codes
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCsLetters]'))
    DROP VIEW [dbo].[vBoCsLetters]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCsLetters] AS SELECT Activity.ACTIVITY_TYPE AS ActivityType,Activity.CO_ID AS CompanyId,Activity.DESCRIPTION AS Letter,Activity.ID AS Id,Activity.NOTE AS LetterText,Activity.SEQN AS SequenceNumber,Activity.SOURCE_CODE AS SentBy,Activity.TRANSACTION_DATE AS Date FROM Activity WHERE Activity.ACTIVITY_TYPE = 'LETTER'
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCsMatchingPlans]'))
    DROP VIEW [dbo].[vBoCsMatchingPlans]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCsMatchingPlans] AS SELECT Name_MatchPlan.FORM_NUMBER AS FormNumber,Name_MatchPlan.FROM_AMOUNT AS MinimumContribution,Name_MatchPlan.FROM_DATE AS StartDate,Name_MatchPlan.ID,Name_MatchPlan.NOTES AS Notes,Name_MatchPlan.PERCENTAGE AS MatchPercentage,Name_MatchPlan.SEQN AS SequenceNumber,Name_MatchPlan.TO_AMOUNT AS MaximumContribution,Name_MatchPlan.TO_DATE AS EndDate FROM Name_MatchPlan
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCsMemberType]'))
    DROP VIEW [dbo].[vBoCsMemberType]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCsMemberType] AS SELECT Member_Types.BILL_COMPANY AS BillCompany,Member_Types.COMPANY_RECORD AS IsCompany,Member_Types.DESCRIPTION AS Description,Member_Types.DUES_CODE_1 AS MainDuesCode,Member_Types.MEMBER_RECORD AS IsMember,Member_Types.MEMBER_TYPE AS MemberType FROM Member_Types
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCsName_FR]'))
    DROP VIEW [dbo].[vBoCsName_FR]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCsName_FR] AS SELECT Name_FR.DO_NOT_EMAIL AS DoNotEmail,Name_FR.DO_NOT_PHONE AS DoNotPhone,Name_FR.DO_NOT_SELL,Name_FR.DO_NOT_SOLICIT,Name_FR.ID AS Id,Name_FR.Last_Receipt_Printed_Date AS LastReceiptPrintedDate,Name_FR.LIST_AS AS ListAs,Name_FR.MATCH_DESCRIP AS MatchDescription,Name_FR.MATCH_PCT AS MatchPercent,Name_FR.MAX_EMPL_CONTRIB AS MaxEmployerContribution,Name_FR.MIN_EMPL_CONTRIB AS MinEmployerContribution,Name_FR.PREFERRED_DIST_CODE AS PreferredDistCode,Name_FR.Receipt_Interval AS ReceiptInterval,Name_FR.SOLICITOR_ID AS SolicitorId,Name_FR.TIME_STAMP AS TimeStamp,Name_FR.VALID_FROM AS ValidFrom,Name_FR.VALID_THRU AS ValidThrough FROM Name_FR
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCsName_Lookup]'))
    DROP VIEW [dbo].[vBoCsName_Lookup]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCsName_Lookup] AS SELECT Name_Lookup.Field1,Name_Lookup.ID,Name_Lookup.SEQN,Name_Lookup.TIME_STAMP FROM Name_Lookup
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCsName_TabTest]'))
    DROP VIEW [dbo].[vBoCsName_TabTest]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCsName_TabTest] AS SELECT Name_TabTest.DateFirst,Name_TabTest.ID,Name_TabTest.OtherValue,Name_TabTest.SEQN,Name_TabTest.TIME_STAMP FROM Name_TabTest
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCsNameLog]'))
    DROP VIEW [dbo].[vBoCsNameLog]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCsNameLog] AS SELECT Name_Log.DATE_TIME,Name_Log.ID,Name_Log.LOG_TEXT,Name_Log.LOG_TYPE,Name_Log.SUB_TYPE,Name_Log.USER_ID FROM Name_Log
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCsNameNote]'))
    DROP VIEW [dbo].[vBoCsNameNote]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCsNameNote] AS SELECT Name_Note.DATE_ADDED,Name_Note.ID,Name_Note.LAST_UPDATED,Name_Note.NOTE,Name_Note.NOTE_NUM,Name_Note.PURPOSE,Name_Note.UPDATED_BY FROM Name_Note
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCsNameUser]'))
    DROP VIEW [dbo].[vBoCsNameUser]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCsNameUser] AS SELECT Name.FIRST_NAME AS FirstName,Name.ID AS Id,Name.LAST_FIRST AS LastName,Name.MEMBER_TYPE AS MemberType,UserMain.UserId,UserMain.UserKey FROM UserMain
	INNER JOIN Name
		ON UserMain.ContactMaster = Name.ID
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCsNotificationList]'))
    DROP VIEW [dbo].[vBoCsNotificationList]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCsNotificationList] AS SELECT Name_Notify.ID,Name_Notify.MEM_TRIBUTE_CODE AS MemorialTributeType,Name_Notify.MERGE_CODE AS MergeCode,Name_Notify.NOTIFY_ID AS NotifyID,Name_Notify.RELATIONSHIP AS Relationship,Name_Notify.SALUTATION_CODE AS SalutationCode,Name_Notify.SENDER_CODE AS SenderCode FROM Name_Notify
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCsOrderHistory]'))
    DROP VIEW [dbo].[vBoCsOrderHistory]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCsOrderHistory] AS SELECT Activity.ACTIVITY_TYPE AS ActivityType,Activity.AMOUNT AS Amount,Activity.CO_ID AS CompanyId,Activity.DESCRIPTION AS ProductName,Activity.ID,Activity.MEMBER_TYPE AS MemberType,Activity.PRODUCT_CODE AS ProductCode,Activity.QUANTITY AS Quantity,Activity.SEQN AS SequenceNumber,Activity.SOURCE_CODE AS SourceCode,Activity.TRANSACTION_DATE AS TransactionDate FROM Activity WHERE Activity.ACTIVITY_TYPE = 'ORDER'
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vCsOrderLines]'))
    DROP VIEW [dbo].[vCsOrderLines]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vCsOrderLines] AS SELECT 
	Order_Lines.DESCRIPTION AS Description,
	Order_Lines.DISCOUNT AS Discount,
	Order_Lines.EXTENDED_AMOUNT AS ExtendedAmount,
	Order_Lines.EXTENDED_COST AS ExtendedCost,
	Order_Lines.INCOME_ACCOUNT AS IncomeAccount,
	Order_Lines.LINE_NUMBER AS LineNumber,
	Order_Lines.LOCATION AS Location,
	Order_Lines.NOTE AS Note,
	Order_Lines.ORDER_NUMBER AS OrderNumber,
	Order_Lines.PRODUCT_CODE AS ProductCode,
	Order_Lines.QUANTITY_BACKORDERED AS QuantityBackordered,
	Order_Lines.QUANTITY_COMMITTED AS QuantityCommitted,
	Order_Lines.QUANTITY_ORDERED AS QuantityOrdered,
	Order_Lines.QUANTITY_RESERVED AS QuantityReserved,
	Order_Lines.QUANTITY_SHIPPED AS QuantityShipped,
	Order_Lines.TAX_1 AS Tax1,
	Order_Lines.TAX_AUTHORITY AS VATTaxAuthority,
	Order_Lines.TAX_RATE AS VATTaxRate,
	Order_Lines.TAXABLE AS Taxable,
	Order_Lines.TAXABLE_2 AS GSTTaxable,
	Order_Lines.UNIT_COST AS UnitCost,
	Order_Lines.UNIT_PRICE AS UnitPrice 
FROM Order_Lines
	INNER JOIN Orders
		ON Order_Lines.ORDER_NUMBER = Orders.ORDER_NUMBER
WHERE Orders.ORDER_TYPE_CODE IN ('FULL', 'REG')

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCsOrderLines]'))
    DROP VIEW [dbo].[vBoCsOrderLines]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCsOrderLines] AS SELECT vCsOrderLines.Description,vCsOrderLines.Discount,vCsOrderLines.ExtendedAmount,vCsOrderLines.ExtendedCost,vCsOrderLines.GSTTaxable,vCsOrderLines.IncomeAccount,vCsOrderLines.LineNumber,vCsOrderLines.Location,vCsOrderLines.Note,vCsOrderLines.OrderNumber,vCsOrderLines.ProductCode,vCsOrderLines.QuantityBackordered,vCsOrderLines.QuantityCommitted,vCsOrderLines.QuantityOrdered,vCsOrderLines.QuantityReserved,vCsOrderLines.QuantityShipped,vCsOrderLines.Tax1,vCsOrderLines.Taxable,vCsOrderLines.UnitCost,vCsOrderLines.UnitPrice,vCsOrderLines.VATTaxAuthority,vCsOrderLines.VATTaxRate FROM vCsOrderLines
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCsOrders]'))
    DROP VIEW [dbo].[vBoCsOrders]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCsOrders] AS SELECT Orders.ADDRESS_1 AS Address1,Orders.ADDRESS_2 AS Address2,Orders.ADDRESS_3 AS Address3,Orders.ADDRESS_FORMAT AS AddressFormat,Orders.BALANCE AS Balance,Orders.BATCH_NUM AS BatchNumber,Orders.BT_ID AS BillToId,Orders.CITY AS City,Orders.CO_ID AS CompanyId,Orders.CO_MEMBER_TYPE AS CompanyMemberType,Orders.COMPANY AS Company,Orders.COMPANY_SORT AS CompanySort,Orders.COUNTRY AS Country,Orders.CUSTOMER_REFERENCE AS CustomerReference,Orders.EMAIL AS Email,Orders.FREIGHT_1 AS Freight1,Orders.FREIGHT_2 AS Freight2,Orders.FULL_ADDRESS AS FullAddress,Orders.FULL_NAME AS FullName,Orders.HANDLING_1 AS Handling1,Orders.HANDLING_2 AS Handling2,Orders.HOLD_CODE AS HoldCode,Orders.HOLD_COMMENT AS HoldComment,Orders.HOLD_FLAG AS HoldFlag,Orders.INVOICE_REFERENCE_NUM AS InvoiceReferenceNumber,Orders.MEMBER_TYPE AS MemberType,Orders.NOTES AS Notes,Orders.ORDER_DATE AS OrderDate,Orders.ORDER_NUMBER AS OrderNumber,Orders.ORDER_TYPE_CODE AS OrderTypeCode,Orders.ORG_CODE AS EntityCode,Orders.PAY_TYPE AS PayType,Orders.PHONE AS Phone,Orders.SOURCE_CODE AS SourceCode,Orders.ST_ID AS ShipToId,Orders.STAGE AS Stage,Orders.STATE_PROVINCE AS StateProvince,Orders.STATUS AS Status,Orders.TAX_1 AS Tax1,Orders.TAX_2 AS Tax2,Orders.TAX_3 AS Tax3,Orders.TAX_RATE_1 AS TaxRate1,Orders.TAX_RATE_2 AS TaxRate2,Orders.TAX_RATE_3 AS TaxRate3,Orders.TITLE AS Title,Orders.TOTAL_CHARGES AS TotalCharges,Orders.TOTAL_PAYMENTS AS TotalPayments,Orders.TOTAL_QUANTITY_BACKORDERED AS TotalQuantityBackordered,Orders.TOTAL_QUANTITY_ORDERED AS TotalQuantityOrdered,Orders.ZIP AS Zip,Orders.SOURCE_SYSTEM FROM Orders WHERE Orders.SOURCE_SYSTEM IN ('ORDER','AR','EXPO')
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCsOrderType]'))
    DROP VIEW [dbo].[vBoCsOrderType]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCsOrderType] AS SELECT Order_Type.CODE AS Code,Order_Type.DESCRIPTION AS Description FROM Order_Type
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCsOrg_Control]'))
    DROP VIEW [dbo].[vBoCsOrg_Control]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCsOrg_Control] AS SELECT Org_Control.CoVATRegNumber,Org_Control.DefaultArAccount,Org_Control.DefaultCancellationAccount,Org_Control.DefaultCashAccount,Org_Control.DefaultFlag,Org_Control.DefaultFreightAccount,Org_Control.DefaultHandlingAccount,Org_Control.DefaultIncomeAccount,Org_Control.DefaultPrepaidOrderAccount,Org_Control.DefaultTaxAccount,Org_Control.DefaultTransferClearingAccount,Org_Control.DefaultWriteOffOffsetAccount,Org_Control.DiscountAccount,Org_Control.FinanceAccount,Org_Control.GSTRemitNumber,Org_Control.InvoiceAddress,Org_Control.IsFund,Org_Control.LetterheadAddress,Org_Control.Logo,Org_Control.OrgCode,Org_Control.OrgName,Org_Control.RefundApAccount,Org_Control.RefundClearingAccount,Org_Control.Registration_Num,Org_Control.TaxAuthority,Org_Control.TIME_STAMP,Org_Control.UseCanadianTaxation,Org_Control.UseVATTaxation,Org_Control.VATBranchID,Org_Control.VATCountry,Org_Control.VATRegNumber FROM Org_Control
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCsPledges]'))
    DROP VIEW [dbo].[vBoCsPledges]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCsPledges] AS SELECT vPledge.AdjustmentsAmount,vPledge.Appeal,vPledge.Campaign,vPledge.DateReceived,vPledge.FiscalMonth,vPledge.FiscalYear,vPledge.Fund,vPledge.ID AS Id,vPledge.InstallmentDate,vPledge.InvoiceReferenceNumber,vPledge.IsMatchingGift,vPledge.LastPaymentDate,vPledge.ListAs,vPledge.MatchingTransaction,vPledge.MemorialID,vPledge.MemorialNameText,vPledge.NetPledgeAmount,vPledge.PaymentsAmount,vPledge.PledgeAmount,vPledge.PledgeBalance,vPledge.PledgeFairMarketValue,vPledge.RequestNumber,vPledge.SolicitorID,vPledge.SourceSystem,vPledge.TransactionDate,vPledge.TransactionNumber FROM vPledge
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vProduct]'))
    DROP VIEW [dbo].[vProduct]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vProduct]
AS
SELECT p.DEFERRED_INCOME_ACCOUNT AS DeferredIncomeAccount, p.DESCRIPTION AS Description, p.INCOME_ACCOUNT AS IncomeAccount,
       p.PRICE_1 AS Price1, p.PRICE_2 AS Price2, p.PRICE_3 AS Price3, p.PROD_TYPE AS ProductType, p.PRODUCT_CODE AS ProductCode,
       p.PRODUCT_MAJOR AS ProductMajor, p.PRODUCT_MINOR AS ProductMinor, p.STATUS AS Status, p.TITLE AS Title,
       p.TITLE_KEY AS TitleKey, p.CATEGORY AS ProductCategory, p.APPLY_IMAGE, p.APPLY_THUMBNAIL, p.IMAGE_URL, p.THUMBNAIL_URL,
       p.WEB_DESC, p.WEB_OPTION, op.IsSuperProduct, op.SellOnWeb, opcl.IsFeatured 
   FROM Product p
        LEFT OUTER JOIN OrderProduct op ON p.PRODUCT_CODE = op.ProductCode
        LEFT OUTER JOIN OrderProductCategoryLookup opcl ON op.OrderProductID = opcl.OrderProductID


GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCsProduct]'))
    DROP VIEW [dbo].[vBoCsProduct]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCsProduct] AS SELECT vProduct.APPLY_IMAGE,vProduct.APPLY_THUMBNAIL,vProduct.DeferredIncomeAccount,vProduct.Description,vProduct.IMAGE_URL,vProduct.IncomeAccount,vProduct.IsFeatured,vProduct.IsSuperProduct,vProduct.Price1,vProduct.Price2,vProduct.Price3,vProduct.ProductCategory,vProduct.ProductCode,vProduct.ProductMajor,vProduct.ProductMinor,vProduct.ProductType,vProduct.SellOnWeb,vProduct.Status,vProduct.THUMBNAIL_URL,vProduct.Title,vProduct.TitleKey,vProduct.WEB_DESC,vProduct.WEB_OPTION FROM vProduct
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCsProductCategory]'))
    DROP VIEW [dbo].[vBoCsProductCategory]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCsProductCategory] AS SELECT Product_Cat.DESCRIPTION AS Description,Product_Cat.PRODUCT_CATEGORY AS ProductCategory,Product_Cat.UF_1 AS UserDefinedField1,Product_Cat.UF_2 AS UserDefinedField2,Product_Cat.UF_3 AS UserDefinedField3,Product_Cat.UF_4 AS UserDefinedField4 FROM Product_Cat
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCsProductType]'))
    DROP VIEW [dbo].[vBoCsProductType]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCsProductType] AS SELECT Product_Type.PROD_TYPE AS ProductType,Product_Type.DESCRIPTION AS Description FROM Product_Type
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vCsRegFunctions]'))
    DROP VIEW [dbo].[vCsRegFunctions]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vCsRegFunctions] AS SELECT 
	Order_Lines.DESCRIPTION AS Description,
	Order_Lines.EXTENDED_AMOUNT AS ExtendedAmount,
	Order_Lines.INCOME_ACCOUNT AS IncomeAccount,
	Order_Lines.NOTE AS Note,
	Order_Lines.PRODUCT_CODE AS ProductCode,
	Order_Lines.QUANTITY_ORDERED AS QuantityOrdered,
	Order_Lines.QUANTITY_SHIPPED AS RegisteredQuantity,
	Order_Lines.TAX_1 AS Tax1,
	Order_Lines.TAX_RATE AS TaxRate,
	Order_Lines.UNIT_PRICE AS UnitPrice,
	Orders.BT_ID AS BillToId,
	Orders.COMPANY AS Company,
	Orders.COMPANY_SORT AS CompanySort,
	Orders.FULL_NAME AS FullName,
	Orders.INVOICE_DATE AS InvoiceDate,
	Orders.INVOICE_NUMBER AS InvoiceNumber,
	Orders.INVOICE_REFERENCE_NUM AS InvoiceReferenceNumber,
	Orders.IS_FR_ORDER AS IsFrOrder,
	Orders.ORDER_DATE AS OrderDate,
	Orders.ORDER_NUMBER AS OrderNumber,
	Orders.ST_ID AS ShipToId,
	Orders.STATUS AS Status 
FROM Orders
	INNER JOIN Order_Lines
		ON Orders.ORDER_NUMBER = Order_Lines.ORDER_NUMBER
WHERE Orders.ORDER_TYPE_CODE = 'MEETING'

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCsRegFunctions]'))
    DROP VIEW [dbo].[vBoCsRegFunctions]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCsRegFunctions] AS SELECT vCsRegFunctions.BillToId,vCsRegFunctions.Company,vCsRegFunctions.CompanySort,vCsRegFunctions.Description,vCsRegFunctions.ExtendedAmount,vCsRegFunctions.FullName,vCsRegFunctions.IncomeAccount,vCsRegFunctions.InvoiceDate,vCsRegFunctions.InvoiceNumber,vCsRegFunctions.InvoiceReferenceNumber,vCsRegFunctions.IsFrOrder,vCsRegFunctions.Note,vCsRegFunctions.OrderDate,vCsRegFunctions.OrderNumber,vCsRegFunctions.ProductCode,vCsRegFunctions.QuantityOrdered,vCsRegFunctions.RegisteredQuantity,vCsRegFunctions.ShipToId,vCsRegFunctions.Status,vCsRegFunctions.Tax1,vCsRegFunctions.TaxRate,vCsRegFunctions.UnitPrice FROM vCsRegFunctions
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCsRegistrantClasses]'))
    DROP VIEW [dbo].[vBoCsRegistrantClasses]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCsRegistrantClasses] AS SELECT Meet_Reg_Class.DESCRIPTION AS Description,Meet_Reg_Class.LONG_DESCRIPTION AS LongDescription,Meet_Reg_Class.REGISTRANT_CLASS AS RegistrantClass FROM Meet_Reg_Class
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vCsRegistration]'))
    DROP VIEW [dbo].[vCsRegistration]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vCsRegistration] AS SELECT 
	Order_Meet.MEETING AS EventCode,
	Order_Meet.REGISTRANT_CLASS AS RegistrantClass,
	Orders.BALANCE AS Balance,
	Orders.BT_ID AS BillToId,
	Orders.CO_MEMBER_TYPE AS CompanyMemberType,
	Orders.COMPANY AS Company,
	Orders.COMPANY_SORT AS CompanySort,
	Orders.FULL_NAME AS FullName,
	Orders.LAST_FIRST AS LastFirst,
	Orders.LINE_TAXABLE AS LineTaxable,
	Orders.LINE_TOTAL AS LineTotal,
	Orders.MEMBER_TYPE AS MemberType,
	Orders.ORDER_DATE AS OrderDate,
	Orders.ORDER_NUMBER AS OrderNumber,
	Orders.ORDER_TYPE_CODE AS OrderTypeCode,
	Orders.ST_ID AS ShipToId,
	Orders.STATUS AS Status,
	Orders.TOTAL_CHARGES AS TotalCharges,
	Orders.TOTAL_PAYMENTS AS TotalPayments 
FROM Order_Meet
	INNER JOIN Orders
		ON Order_Meet.ORDER_NUMBER = Orders.ORDER_NUMBER
WHERE Orders.ORDER_TYPE_CODE = 'MEETING'

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCsRegistration]'))
    DROP VIEW [dbo].[vBoCsRegistration]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCsRegistration] AS SELECT vCsRegistration.Balance,vCsRegistration.BillToId,vCsRegistration.Company,vCsRegistration.CompanyMemberType,vCsRegistration.CompanySort,vCsRegistration.EventCode,vCsRegistration.FullName,vCsRegistration.LastFirst,vCsRegistration.LineTaxable,vCsRegistration.LineTotal,vCsRegistration.MemberType,vCsRegistration.OrderDate,vCsRegistration.OrderNumber,vCsRegistration.OrderTypeCode,vCsRegistration.RegistrantClass,vCsRegistration.ShipToId,vCsRegistration.Status,vCsRegistration.TotalCharges,vCsRegistration.TotalPayments FROM vCsRegistration
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vRelationship]'))
    DROP VIEW [dbo].[vRelationship]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vRelationship]
AS
	SELECT
		Relationship.ID AS ID, 
		Relationship.RELATION_TYPE AS Relationship,
		Relationship.TARGET_ID AS RelatedToID,
		Relationship.TARGET_NAME AS RelatedToName,
		Relationship.TITLE AS Title,
		Relationship.FUNCTIONAL_TITLE AS FunctionalTitle,
		Relationship.STATUS AS Status,
		Relationship.EFFECTIVE_DATE AS BeginDate,
		Relationship.THRU_DATE AS EndDate,
		Relationship.NOTE AS Note,
		Relationship.GROUP_CODE AS GroupCode
	FROM Relationship
	UNION ALL
	SELECT
		Relationship.TARGET_ID AS ID,
		Relationship.TARGET_RELATION_TYPE AS Relationship,
		Relationship.ID AS RelatedToID,
		'' AS RelatedToName,
		'' AS Title,
		'' AS FunctionalTitle,
		Relationship.STATUS AS Status,
		Relationship.EFFECTIVE_DATE AS BeginDate,
		Relationship.THRU_DATE AS EndDate,
		Relationship.NOTE AS Note,
		Relationship.GROUP_CODE AS GroupCode
	FROM Relationship
	WHERE Relationship.TARGET_ID <> ''

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCsRelationship]'))
    DROP VIEW [dbo].[vBoCsRelationship]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCsRelationship] AS SELECT vRelationship.BeginDate,vRelationship.EndDate,vRelationship.FunctionalTitle,vRelationship.GroupCode,vRelationship.ID,vRelationship.Note,vRelationship.RelatedToID,vRelationship.RelatedToName,vRelationship.Relationship,vRelationship.Status,vRelationship.Title FROM vRelationship
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCsRelationshipTypes]'))
    DROP VIEW [dbo].[vBoCsRelationshipTypes]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCsRelationshipTypes] AS SELECT Relationship_Types.DESCRIPTION AS Description,Relationship_Types.RELATION_TYPE AS RelationType FROM Relationship_Types
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCsSalesHistory]'))
    DROP VIEW [dbo].[vBoCsSalesHistory]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCsSalesHistory] AS SELECT Activity.ACTIVITY_TYPE AS ActivityType,Activity.AMOUNT AS Amount,Activity.CO_ID AS CompanyId,Activity.DESCRIPTION AS ProductName,Activity.ID,Activity.PRODUCT_CODE AS ProductCode,Activity.QUANTITY AS Quantity,Activity.SEQN AS SequenceNumber,Activity.SOURCE_CODE AS SourceCode,Activity.SOURCE_SYSTEM AS SourceSystem,Activity.TRANSACTION_DATE AS TransactionDate FROM Activity WHERE Activity.ACTIVITY_TYPE = 'SALES' AND Activity.SOURCE_SYSTEM='AR'
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCsSalutations]'))
    DROP VIEW [dbo].[vBoCsSalutations]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCsSalutations] AS SELECT Name_Salutation.ID,Name_Salutation.SALUTATION_TEXT AS SalutationText,Name_Salutation.SALUTATION_TYPE AS SalutationCode FROM Name_Salutation
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCsSolicitorData]'))
    DROP VIEW [dbo].[vBoCsSolicitorData]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCsSolicitorData] AS SELECT Name_Staff.DESCRIPTION AS Comments,Name_Staff.HOURS_PER_WEEK AS HoursPerWeek,Name_Staff.ID,Name_Staff.IS_SALESMAN AS IsSolicitor,Name_Staff.IS_VOLUNTEER AS IsVolunteer FROM Name_Staff
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCsStaffUser]'))
    DROP VIEW [dbo].[vBoCsStaffUser]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCsStaffUser] AS SELECT Users.Disabled,Users.Password,Users.UserId,Users.AccessKeywords,Users.CheckTickler,Users.EditTypes,Users.IsCasualUser,Users.LevelCashAR,Users.LevelCert,Users.LevelDues,Users.LevelExpo,Users.LevelFundRaising,Users.LevelMeeting,Users.LevelMembership,Users.LevelOrderEntry,Users.LevelReferral,Users.LevelSC,Users.LevelSystem,Users.Signature,Users.StandardClosing1,Users.StandardClosing2 FROM Users
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCsStateProvinceCodes]'))
    DROP VIEW [dbo].[vBoCsStateProvinceCodes]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCsStateProvinceCodes] AS SELECT State_Codes.STATE_PROVINCE AS StateProvince,State_Codes.TITLE AS Title FROM State_Codes
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCsSubscriptions]'))
    DROP VIEW [dbo].[vBoCsSubscriptions]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCsSubscriptions] AS SELECT Subscriptions.APPEAL_CODE AS AppealCode,Subscriptions.BALANCE AS Balance,Subscriptions.BEGIN_DATE AS BeginDate,Subscriptions.BILL_AMOUNT AS BillAmount,Subscriptions.BILL_COPIES AS BillCopies,Subscriptions.BILL_DATE AS BillDate,Subscriptions.BILL_THRU AS BillThrough,Subscriptions.BILL_TYPE AS BillType,Subscriptions.BT_ID AS BillToId,Subscriptions.CAMPAIGN_CODE AS CampaignCode,Subscriptions.CANCEL_REASON AS CancelReason,Subscriptions.COMPLIMENTARY AS Complimentary,Subscriptions.COPIES AS Copies,Subscriptions.COPIES_PAID AS CopiesPaid,Subscriptions.FAIR_MARKET_VALUE AS FairMarketValue,Subscriptions.FUTURE_COPIES AS FutureCopies,Subscriptions.FUTURE_CREDITS AS FutureCredits,Subscriptions.ID,Subscriptions.INVOICE_LINE_NUM AS InvoiceLineNumber,Subscriptions.INVOICE_REFERENCE_NUM AS InvoiceReferenceNumber,Subscriptions.IS_FR_ITEM AS IsFRItem,Subscriptions.LAST_ISSUE AS LastIssue,Subscriptions.LAST_ISSUE_DATE AS LastIssueDate,Subscriptions.LAST_PAID_THRU AS LastPaidThrough,Subscriptions.ORG_CODE AS EntityCode,Subscriptions.PAID_BEGIN AS PaidBegin,Subscriptions.PAID_THRU AS PaidThrough,Subscriptions.PAYMENT_AMOUNT AS PaymentAmount,Subscriptions.PAYMENT_DATE AS PaymentDate,Subscriptions.PREF_BILL AS BillAddressNumber,Subscriptions.PREF_MAIL AS MailAddressNumber,Subscriptions.PREVIOUS_BALANCE AS PreviousBalance,Subscriptions.PRIOR_YEARS AS PriorYears,Subscriptions.PROD_TYPE AS ProductType,Subscriptions.PRODUCT_CODE AS ProductCode,Subscriptions.REMINDER_COUNT AS ReminderCount,Subscriptions.REMINDER_DATE AS ReminderDate,Subscriptions.RENEW_MONTHS AS RenewMonths,Subscriptions.SOURCE_CODE AS SourceCode,Subscriptions.STATUS AS Status,Subscriptions.BILL_BEGIN AS BillBegin FROM Subscriptions WHERE Subscriptions.PROD_TYPE in ('DUES', 'SUB','SEC','MISC','VOL','CHAPT')
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCsSystemParams]'))
    DROP VIEW [dbo].[vBoCsSystemParams]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCsSystemParams] AS SELECT System_Params.LongValue,System_Params.ParameterName,System_Params.ShortValue FROM System_Params
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCsTransSoftCredit]'))
    DROP VIEW [dbo].[vBoCsTransSoftCredit]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCsTransSoftCredit] AS SELECT Trans_SoftCredit.AMOUNT AS Amount,Trans_SoftCredit.FUNDRAISER_TYPE AS FundraiserType,Trans_SoftCredit.ORIGINATING_ACTIVITY_SEQN AS OriginatingActivitySeqn,Trans_SoftCredit.PERCENTAGE AS Percentage,Trans_SoftCredit.PRODUCT_CODE AS ProductCode,Trans_SoftCredit.SOFT_CREDIT_ID AS SoftCreditId,Trans_SoftCredit.TIME_STAMP AS TimeStamp,Trans_SoftCredit.TRANS_NUMBER AS TransactionNumber FROM Trans_SoftCredit
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCsWebSecurityGroup]'))
    DROP VIEW [dbo].[vBoCsWebSecurityGroup]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCsWebSecurityGroup] AS SELECT Security_Groups.SECURITY_GROUP AS Name,Security_Groups.SECURITY_GROUP_DESCR AS Description FROM Security_Groups
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCsWebUser]'))
    DROP VIEW [dbo].[vBoCsWebUser]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCsWebUser] AS SELECT Name_Security.EXPIRATION_DATE AS ExpirationDate,Name_Security.ID,Name_Security.LOGIN_DISABLED AS IsDisabled,Name_Security.WEB_LOGIN AS UserId,Name_Security_Groups.ID AS SecurityGroupID,Name_Security_Groups.SECURITY_GROUP AS SecurityGroup,Name_Security.UPDATED_BY AS UpdatedBy FROM Name_Security
	INNER JOIN Name_Security_Groups
		ON Name_Security.ID = Name_Security_Groups.ID
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCultureRef]'))
    DROP VIEW [dbo].[vBoCultureRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCultureRef] AS SELECT CultureRef.CultureCode,CultureRef.CultureDesc FROM CultureRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCurrency]'))
    DROP VIEW [dbo].[vBoCurrency]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCurrency] AS SELECT Currency.CreatedByUserKey,Currency.CreatedOn,Currency.Name,Currency.UpdatedByUserKey,Currency.UpdatedOn,Currency.CurrencyCode,Currency.CultureCode,Currency.RoundingMultipleKey FROM Currency
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCurrencyConversion]'))
    DROP VIEW [dbo].[vBoCurrencyConversion]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCurrencyConversion] AS SELECT CurrencyConversion.CreatedByUserKey,CurrencyConversion.CreatedOn,CurrencyConversion.UpdatedByUserKey,CurrencyConversion.UpdatedOn,CurrencyConversion.Rate,CurrencyConversion.FromCurrencyCode,CurrencyConversion.ToCurrencyCode FROM CurrencyConversion
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCustomerExperience]'))
    DROP VIEW [dbo].[vBoCustomerExperience]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCustomerExperience] AS SELECT CustomerExperience.CustomerExperienceKey,CustomerExperience.CustomerExperienceNote AS Note,CustomerExperience.CustomerExperienceStatusCode,CustomerExperience.UserKey,CustomerExperience.CreatedByUserKey,CustomerExperience.CreatedOn FROM CustomerExperience
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCustomerExperienceStatus]'))
    DROP VIEW [dbo].[vBoCustomerExperienceStatus]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCustomerExperienceStatus] AS SELECT CustomerExperienceStatusRef.CustomerExperienceStatusCode,CustomerExperienceStatusRef.CustomerExperienceStatusName AS Name FROM CustomerExperienceStatusRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCustomerExperienceStatusChange]'))
    DROP VIEW [dbo].[vBoCustomerExperienceStatusChange]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCustomerExperienceStatusChange] AS SELECT CustomerExperienceStatusChange.CreatedByUserKey,CustomerExperienceStatusChange.CreatedOn,CustomerExperienceStatusChange.CustomerExperienceKey,CustomerExperienceStatusChange.CustomerExperienceStatusChangeKey,CustomerExperienceStatusChange.CustomerExperienceStatusChangeNote,CustomerExperienceStatusChange.CustomerExperienceStatusCode,CustomerExperienceStatusChange.StatusChangedOn,CustomerExperienceStatusChange.StatusChangedUserKey,CustomerExperienceStatusChange.UpdatedByUserKey,CustomerExperienceStatusChange.UpdatedOn FROM CustomerExperienceStatusChange
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vModuleOfferedCustomerExperience]'))
    DROP VIEW [dbo].[vModuleOfferedCustomerExperience]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vModuleOfferedCustomerExperience]
AS
SELECT 
	[dbo].[OfferedCustomerExperience].[OfferedCustomerExperienceKey], 
	[dbo].[Offering].[OfferingKey], 
	[dbo].[CertificationModule].[RequiresGradeFlag], 
	[dbo].[GradeRef].[GradeValue] AS OfferedCustomerExperienceGrade, 
	[dbo].[CertificationModule].[CertificationModuleKey], 
	[dbo].[CertificationModule].[CertificationModuleName], 
	[dbo].[CertificationModule].[NumberOfUnits], 
	[dbo].[Offering].[OfferingName], 
	[dbo].[Offering].[OfferingCode], 
	[dbo].[Offering].[OfferingDesc], 
	[dbo].[Offering].[ContactKey], 
	[dbo].[Offering].[LocationKey], 
	[dbo].[Offering].[OfferingDate], 
	[dbo].[CertificationProgram].[CertificationProgramKey],
	[dbo].[CertificationProgram].[CertificationProgramName], 
	ISNULL([dbo].[Location].[LocationName], N'') AS LocationName
FROM 
	[dbo].[CertificationProgramRegistration] 
		INNER JOIN [dbo].[CertificationModuleRegistration] ON [dbo].[CertificationProgramRegistration].[CertificationProgramRegistrationKey] = [dbo].[CertificationModuleRegistration].[CertificationProgramRegistrationKey] 
		INNER JOIN [dbo].[CertificationProgram] ON [dbo].[CertificationProgramRegistration].[CertificationProgramKey] = [dbo].[CertificationProgram].[CertificationProgramKey] 
		INNER JOIN [dbo].[OfferedCustomerExperience] INNER JOIN [dbo].[Offering] ON [dbo].[OfferedCustomerExperience].[OfferingKey] = [dbo].[Offering].[OfferingKey] 
		INNER JOIN [dbo].[CertificationModule] ON [dbo].[Offering].[ExperienceDefinitionKey] = [dbo].[CertificationModule].[CertificationModuleKey] ON [dbo].[CertificationModuleRegistration].[CustomerExperienceKey] = [dbo].[OfferedCustomerExperience].[OfferedCustomerExperienceKey] 
		LEFT OUTER JOIN [dbo].[Location] ON [dbo].[Offering].[LocationKey] = [dbo].[Location].[LocationKey] 
		LEFT OUTER JOIN [dbo].[GradeRef] ON [dbo].[OfferedCustomerExperience].[OfferedCustomerExperienceGradeKey] = [dbo].[GradeRef].[GradeKey]

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoNetContact]'))
    DROP VIEW [dbo].[vBoNetContact]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoNetContact] AS SELECT Name.ADDRESS_NUM_1 AS AddressNumber1,Name.ADDRESS_NUM_2 AS AddressNumber2,Name.ADDRESS_NUM_3 AS AddressNumber3,Name.BAR_CODE AS BarCode,Name.BILL_ADDRESS_NUM AS BillAddressNum,Name.BIRTH_DATE AS BirthDate,Name.CATEGORY AS Category,Name.CHAPTER AS Chapter,Name.CO_ID AS CompanyId,Name.CO_MEMBER_TYPE AS CompanyMemberType,Name.COMPANY AS Company,Name.COMPANY_SORT AS CompanySort,Name.CONTACT_RANK AS ContactRank,Name.COUNTRY AS Country,Name.COUNTY AS County,Name.CRRT AS Crrt,Name.DATE_ADDED AS DateAdded,Name.DESIGNATION AS Designation,Name.DUP_MATCH_KEY AS DupMatchKey,Name.EMAIL AS Email,Name.EXCLUDE_DIRECTORY AS ExcludeDirectory,Name.EXCLUDE_MAIL AS ExcludeMail,Name.FAX AS Fax,Name.FULL_ADDRESS AS FullAddress,Name.FUNCTIONAL_TITLE AS FunctionalTitle,Name.GENDER AS Gender,Name.HOME_PHONE AS HomePhone,Name.INFORMAL AS Informal,Name.INTENT_TO_EDIT AS IntentToEdit,Name.JOIN_DATE AS JoinDate,Name.LAST_FIRST AS LastFirst,Name.LAST_NAME AS LastName,Name.LAST_UPDATED AS LastUpdated,Name.MAIL_ADDRESS_NUM AS MailAddressNumber,Name.MAIL_CODE AS MailCode,Name.MAJOR_KEY AS MajorKey,Name.MEMBER_RECORD AS IsMember,Name.MEMBER_STATUS AS MemberStatus,Name.MEMBER_STATUS_DATE AS MemberStatusDate,Name.MEMBER_TYPE AS MemberType,Name.MIDDLE_NAME AS MiddleName,Name.MT_CHANGE_DATE AS MemberTypeChangeDate,Name.ORG_CODE AS EntityCode,Name.PAID_THRU AS PaidThrough,Name.PREFIX AS Prefix,Name.PREVIOUS_MT AS PreviousMemberType,Name.SIC_CODE AS SicCode,Name.SOURCE_CODE AS SourceCode,Name.STATE_HOUSE AS StateHouse,Name.STATE_PROVINCE AS StateProvince,Name.STATE_SENATE AS StateSenate,Name.STATUS AS Status,Name.SUFFIX AS Suffix,Name.TITLE AS Title,Name.UPDATED_BY AS UpdatedBy,Name.US_CONGRESS AS UsCongress,Name.WEBSITE AS Website,Name.WORK_PHONE AS WorkPhone,Name.ZIP AS Zip,Name.FIRST_NAME AS FirstName,Name.CITY AS City,Name.TOLL_FREE AS TollFree,Name.BT_ID AS BillToID,Name.SHIP_ADDRESS_NUM AS ShipAddressNum,Name.ID,ContactMain.ContactKey,ContactMain.CreatedByUserKey,ContactMain.CreatedOn,ContactMain.UpdatedByUserKey,ContactMain.UpdatedOn,ContactMain.AccessKey,ContactMain.FullName,ContactMain.IsInstitute AS IsCompany,Name_Fin.BACKORDERS AS Backorders,Name_Fin.CREDIT_LIMIT AS CreditLimit,Name_Fin.NO_STATEMENTS AS NoStatements,Name_Fin.RENEW_MONTHS AS RenewMonths,Name_Fin.RENEWED_THRU AS RenewedThru,Name_Fin.TAX_AUTHOR_DEFAULT AS DefaultTaxAuthority,Name_Fin.TAX_EXEMPT AS TaxExempt,Name_Fin.TERMS_CODE AS DefaultTermsCode,Name_Fin.USE_VAT_TAXATION AS VatExempt,Name_Fin.VAT_COUNTRY AS VatCountry,Name_Fin.VAT_REG_NUMBER AS VatRegNumber,ContactMain.ContactStatusCode,ContactMain.SortName,ContactMain.TaxIDNumber FROM ContactMain
	INNER JOIN Name
		ON ContactMain.SyncContactID = Name.ID
	INNER JOIN Name_Fin
		ON Name.ID = Name_Fin.ID
GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vOfferedCustomerExperience]'))
    DROP VIEW [dbo].[vOfferedCustomerExperience]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vOfferedCustomerExperience]
AS
SELECT [dbo].[OfferedCustomerExperience].[OfferedCustomerExperienceKey], 
       [dbo].[Offering].[OfferingKey], 
       [dbo].[OfferedCustomerExperience].[OfferedCustomerExperienceGrade], 
       [dbo].[OfferedCustomerExperience].[OfferedCustomerExperienceGradeKey], 
       [dbo].[OfferedCustomerExperience].[OfferedCustomerExperienceDate],
       [dbo].[ExperienceDefinition].[ExperienceDefinitionKey], 
       [dbo].[ExperienceDefinition].[ExperienceDefinitionName], 
       [dbo].[ExperienceDefinition].[ExperienceDefinitionCode], 
       [dbo].[ExperienceDefinition].[ExperienceDefinitionDesc], 
       [dbo].[ExperienceDefinition].[NumberOfUnits], 
       [dbo].[ExperienceDefinition].[RequiresGradeFlag], 
       [dbo].[ExperienceDefinition].[RequiresApprovalFlag], 
       [dbo].[ExperienceDefinition].[ExperienceDefinitionLocation], 
       [dbo].[ExperienceDefinition].[ExperienceDefinitionDate], 
       [dbo].[ExperienceDefinition].[ExperienceDefinitionStatusCode], 
       [dbo].[Program].[ProgramKey], 
       [dbo].[Program].[ProgramName], 
       [dbo].[Program].[UserDefinedExperiencesFlag], 
       [dbo].[Program].[UomKey], 
       [dbo].[Program].[MinimumValue], 
       [dbo].[Program].[MaximumValue], 
       [dbo].[Program].[ProgramDescr], 
       [dbo].[Program].[ProgramStatusCode],
       [dbo].[Offering].[OfferingName], 
       [dbo].[Offering].[OfferingCode], 
       [dbo].[Offering].[OfferingDesc], 
       [dbo].[Offering].[ContactKey], 
       [dbo].[Offering].[LocationKey], 
       [dbo].[Offering].[OfferingDate], 
       [dbo].[Offering].[AllowChangesFlag],
       ISNULL(ISNULL([dbo].[Location].[LocationName], [dbo].[ExperienceDefinition].[ExperienceDefinitionLocation]), '') AS LocationName, 
       [dbo].[vBoNetContact].[Company]
 FROM [dbo].[OfferedCustomerExperience] 
      INNER JOIN [dbo].[Offering] ON [dbo].[OfferedCustomerExperience].[OfferingKey] = [dbo].[Offering].[OfferingKey] 
      INNER JOIN [dbo].[ExperienceDefinition] ON [dbo].[Offering].[ExperienceDefinitionKey] = [dbo].[ExperienceDefinition].[ExperienceDefinitionKey] 
      INNER JOIN [dbo].[Program] ON [dbo].[ExperienceDefinition].[ProgramKey] = [dbo].[Program].[ProgramKey] 
      LEFT OUTER JOIN [dbo].[Location] ON [dbo].[Offering].[LocationKey] = [dbo].[Location].[LocationKey] 
      LEFT OUTER JOIN [dbo].[vBoNetContact] ON [dbo].[Offering].[ContactKey] = [dbo].[vBoNetContact].[ContactKey]

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vUnofferedCustomerExperience]'))
    DROP VIEW [dbo].[vUnofferedCustomerExperience]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vUnofferedCustomerExperience]
AS
SELECT 
	[dbo].[ExperienceDefinition].[ExperienceDefinitionKey], 
	[dbo].[ExperienceDefinition].[ExperienceDefinitionName], 
	[dbo].[ExperienceDefinition].[ExperienceDefinitionCode], 
	[dbo].[ExperienceDefinition].[ExperienceDefinitionDesc], 
	[dbo].[ExperienceDefinition].[NumberOfUnits], 
	[dbo].[ExperienceDefinition].[RequiresGradeFlag], 
	[dbo].[ExperienceDefinition].[RequiresApprovalFlag], 
	[dbo].[ExperienceDefinition].[ExperienceDefinitionLocation],
	[dbo].[UnofferedCustomerExperience].[CompletionDate] AS 'ExperienceDefinitionDate', 
	[dbo].[ExperienceDefinition].[ExperienceDefinitionStatusCode], 
	[dbo].[Program].[ProgramName], 
	[dbo].[Program].[UserDefinedExperiencesFlag], 
	[dbo].[Program].[UomKey], 
	[dbo].[Program].[MinimumValue], 
	[dbo].[Program].[MaximumValue], 
	[dbo].[Program].[ProgramDescr], 
	[dbo].[Program].[ProgramStatusCode], 
	[dbo].[UnofferedCustomerExperience].[UnofferedCustomerExperienceKey], 
	[dbo].[UnofferedCustomerExperience].[UnofferedCustomerExperienceGrade], 
	[dbo].[Program].[ProgramKey]

FROM 
	[dbo].[UnofferedCustomerExperience] 
		INNER JOIN [dbo].[ExperienceDefinition] ON [dbo].[UnofferedCustomerExperience].[ExperienceDefinitionKey] = [dbo].[ExperienceDefinition].[ExperienceDefinitionKey] 
		INNER JOIN [dbo].[Program] ON [dbo].[ExperienceDefinition].[ProgramKey] = [dbo].[Program].[ProgramKey]

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vUserDefinedCustomerExperience]'))
    DROP VIEW [dbo].[vUserDefinedCustomerExperience]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vUserDefinedCustomerExperience]
AS
SELECT
	[dbo].[UserDefinedCustomerExperience].[UserDefinedCustomerExperienceKey], 
	[dbo].[Program].[ProgramKey], 
	[dbo].[UserDefinedCustomerExperience].[UserDefinedCustomerExperienceName], 
	[dbo].[UserDefinedCustomerExperience].[UserDefinedCustomerExperienceDesc], 
	[dbo].[UserDefinedCustomerExperience].[CompletionDate], 
	[dbo].[UserDefinedCustomerExperience].[UserDefinedCustomerExperienceUnits], 
	[dbo].[UserDefinedCustomerExperience].[UserDefinedCustomerExperienceLocation], 
	[dbo].[Program].[ProgramName], 
	[dbo].[Program].[UserDefinedExperiencesFlag], 
	[dbo].[Program].[UomKey], 
	[dbo].[Program].[MinimumValue], 
	[dbo].[Program].[MaximumValue], 
	[dbo].[Program].[ProgramDescr], 
	[dbo].[Program].[ProgramStatusCode], 
	[dbo].[Program].[RequiresApprovalFlag], 
	CONVERT(BIT, 0) AS RequiresGradeFlag, 
	'' AS Grade
FROM 
	[dbo].[UserDefinedCustomerExperience] 
		INNER JOIN [dbo].[Program] ON [dbo].[UserDefinedCustomerExperience].[ProgramKey] = [dbo].[Program].[ProgramKey]

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vCustomerExperiences]'))
    DROP VIEW [dbo].[vCustomerExperiences]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vCustomerExperiences]
AS
SELECT 
	[OfferedCustomerExperienceKey] AS CustomerExperienceKey, 
	[ExperienceDefinitionName] AS ExperienceName, 
	[NumberOfUnits] AS Units, 
	CASE WHEN [AllowChangesFlag] = '1' THEN [OfferedCustomerExperienceDate] ELSE [OfferingDate] END AS DateExp, 
	[ProgramKey],
	[ProgramName] AS Program, 
	[LocationName] AS Location, 
	[RequiresGradeFlag], 
	[OfferedCustomerExperienceGrade] AS Grade
FROM 
	[dbo].[vOfferedCustomerExperience]
UNION ALL
SELECT 
	[UnofferedCustomerExperienceKey] AS CustomerExperienceKey, 
	[ExperienceDefinitionName] AS ExperienceName, 
	[NumberOfUnits] AS Units, 
	[ExperienceDefinitionDate] AS DateExp, 
	[ProgramKey],
	[ProgramName] AS Program, 
	[ExperienceDefinitionLocation] AS Location, 
	[RequiresGradeFlag], 
	[UnofferedCustomerExperienceGrade] AS Grade
FROM
	[dbo].[vUnofferedCustomerExperience]
UNION ALL
SELECT 
	[UserDefinedCustomerExperienceKey] AS CustomerExperienceKey, 
	[UserDefinedCustomerExperienceName] AS ExperienceName, 
	[UserDefinedCustomerExperienceUnits] AS Units, 
	[CompletionDate] AS DateExp, 
	[ProgramKey],
	[ProgramName] AS Program, 
	[UserDefinedCustomerExperienceLocation] AS Location, 
	[RequiresGradeFlag], 
	[Grade]
FROM 
	[dbo].[vUserDefinedCustomerExperience]
UNION ALL
SELECT  
	[OfferedCustomerExperienceKey] AS CustomerExperienceKey, 
	[CertificationModuleName] AS ExperienceName, 
	[NumberOfUnits] AS Units, 
	[OfferingDate] AS DateExp, 
	[CertificationProgramKey] AS ProgramKey,
	[CertificationProgramName] AS Program, 
	[LocationName] AS Location, 
	[RequiresGradeFlag], 
	[OfferedCustomerExperienceGrade] AS Grade
FROM 
	[dbo].[vModuleOfferedCustomerExperience]

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCustomerExperienceView]'))
    DROP VIEW [dbo].[vBoCustomerExperienceView]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCustomerExperienceView] AS SELECT vCustomerExperiences.CustomerExperienceKey,vCustomerExperiences.DateExp,vCustomerExperiences.ExperienceName,vCustomerExperiences.Location,vCustomerExperiences.Program,vCustomerExperiences.Units,vCustomerExperiences.Grade,vCustomerExperiences.RequiresGradeFlag,vCustomerExperiences.ProgramKey FROM vCustomerExperiences
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoDataType]'))
    DROP VIEW [dbo].[vBoDataType]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoDataType] AS SELECT DataTypeRef.DataTypeCode,DataTypeRef.DataTypeDesc AS Description,DataTypeRef.DataTypeName AS Name,DataTypeRef.DefaultHIControlTypeCode FROM DataTypeRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoDeferralMatrix]'))
    DROP VIEW [dbo].[vBoDeferralMatrix]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoDeferralMatrix] AS SELECT DeferralMatrix.DeferralMatrixKey,DeferralMatrix.DeferralTermsKey,DeferralMatrix.DeferredIncomeGLAccountCode,DeferralMatrix.FinancialEntityCode,DeferralMatrix.OrganizationKey,DeferralMatrix.TargetGLAccountCode FROM DeferralMatrix
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoDeferralMatrixLine]'))
    DROP VIEW [dbo].[vBoDeferralMatrixLine]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoDeferralMatrixLine] AS SELECT DeferralMatrixLine.AmountConverted,DeferralMatrixLine.AmountDeferred,DeferralMatrixLine.DeferralMatrixKey,DeferralMatrixLine.DeferralMatrixLineKey,DeferralMatrixLine.EffectiveDate,DeferralMatrixLine.InvoiceKey,DeferralMatrixLine.InvoiceLineKey,DeferralMatrixLine.InvoiceLineNumber,DeferralMatrixLine.InvoiceNumber,DeferralMatrixLine.TotalAmountToBeDeferred,DeferralMatrixLine.UpdatedOn FROM DeferralMatrixLine
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoDeferralMatrixLineDetail]'))
    DROP VIEW [dbo].[vBoDeferralMatrixLineDetail]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoDeferralMatrixLineDetail] AS SELECT DeferralMatrixLineDetail.AmountConverted,DeferralMatrixLineDetail.DateConverted,DeferralMatrixLineDetail.DeferralMatrixKey,DeferralMatrixLineDetail.DeferralMatrixLineDetailKey,DeferralMatrixLineDetail.DeferralMatrixLineKey FROM DeferralMatrixLineDetail
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoDeferralTerms]'))
    DROP VIEW [dbo].[vBoDeferralTerms]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoDeferralTerms] AS SELECT DeferralTerms.DeferralTermsCode,DeferralTerms.Description,DeferralTerms.IntervalCount,DeferralTerms.IntervalDuration,DeferralTerms.IntervalEffectiveCount,DeferralTerms.CreatedByUserKey,DeferralTerms.CreatedOn,DeferralTerms.DeferralTermsKey,DeferralTerms.SystemEntityKey,DeferralTerms.UpdatedByUserKey,DeferralTerms.UpdatedOn,DeferralTerms.DeferralIntervalTypeCode FROM DeferralTerms
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vDeferredIncomeReport]'))
    DROP VIEW [dbo].[vDeferredIncomeReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vDeferredIncomeReport]
AS
SELECT	
	GTL.GLTransactionLineKey, GTL.Amount, GTL.Description AS GLTransLineDesc,  GTL.ProductKey, GTL.DeferralProcessedFlag, 
        	GTL.TargetGLAccountKey, GTM.GLTransactionKey, GTM.TransactionDate, GTM.FiscalPeriod, GTM.JournalEntryTypeCode, GTM.FinancialEntityKey, JETR.JournalEntryTypeDesc , 
	DM.DeferralMatrixKey, DM.DeferredIncomeGLAccountCode, DM.TargetGLAccountCode, DM.FinancialEntityCode, DM.DeferralTermsKey, 
	DML.DeferralMatrixLineKey, DML.InvoiceKey, DML.InvoiceNumber, DML.EffectiveDate, DML.AmountDeferred, DML.AmountConverted, DML.TotalAmountToBeDeferred, 
        	DT.DeferralIntervalTypeCode, ITR.IntervalTypeDesc, DT.IntervalCount, DT.IntervalDuration, DT.IntervalEffectiveCount, DT.DeferralTermsCode, DT.Description AS DeferralTermsDesc, 
        	DITR.DeferralIntervalTypeDesc AS DeferralIntervalType
FROM    DeferralMatrix DM  INNER JOIN
	DeferralMatrixLine DML ON DM.DeferralMatrixKey = DML.DeferralMatrixKey INNER JOIN
	DeferralTerms DT ON DM.DeferralTermsKey = DT.DeferralTermsKey INNER JOIN
        	DeferralIntervalTypeRef DITR ON DT.DeferralIntervalTypeCode = DITR.DeferralIntervalTypeCode INNER JOIN
	GLTransactionLine GTL ON GTL.DeferralTermsKey = DM.DeferralTermsKey AND GTL.InvoiceLineKey = DML.InvoiceLineKey INNER JOIN
        	GLTransactionMain GTM ON GTL.GLTransactionKey = GTM.GLTransactionKey INNER JOIN
       	JournalEntryTypeRef JETR ON GTM.JournalEntryTypeCode = JETR.JournalEntryTypeCode INNER JOIN
        	IntervalTypeRef ITR ON DT.DeferralIntervalTypeCode = ITR.IntervalTypeCode
WHERE 	GTL.Description LIKE 'Deferred%'

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoDeferredIncomeReport]'))
    DROP VIEW [dbo].[vBoDeferredIncomeReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoDeferredIncomeReport] AS SELECT vDeferredIncomeReport.Amount,vDeferredIncomeReport.AmountConverted,vDeferredIncomeReport.AmountDeferred,vDeferredIncomeReport.DeferralIntervalType,vDeferredIncomeReport.DeferralIntervalTypeCode,vDeferredIncomeReport.DeferralMatrixKey,vDeferredIncomeReport.DeferralMatrixLineKey,vDeferredIncomeReport.DeferralProcessedFlag,vDeferredIncomeReport.DeferralTermsCode,vDeferredIncomeReport.DeferralTermsDesc,vDeferredIncomeReport.DeferralTermsKey,vDeferredIncomeReport.DeferredIncomeGLAccountCode,vDeferredIncomeReport.EffectiveDate,vDeferredIncomeReport.FinancialEntityCode,vDeferredIncomeReport.FinancialEntityKey,vDeferredIncomeReport.FiscalPeriod,vDeferredIncomeReport.GLTransactionKey,vDeferredIncomeReport.GLTransactionLineKey,vDeferredIncomeReport.GLTransLineDesc,vDeferredIncomeReport.IntervalCount,vDeferredIncomeReport.IntervalDuration,vDeferredIncomeReport.IntervalEffectiveCount,vDeferredIncomeReport.IntervalTypeDesc,vDeferredIncomeReport.InvoiceKey,vDeferredIncomeReport.InvoiceNumber,vDeferredIncomeReport.JournalEntryTypeDesc,vDeferredIncomeReport.TargetGLAccountCode,vDeferredIncomeReport.TotalAmountToBeDeferred,vDeferredIncomeReport.TransactionDate,vDeferredIncomeReport.JournalEntryTypeCode,vDeferredIncomeReport.ProductKey,vDeferredIncomeReport.TargetGLAccountKey FROM vDeferredIncomeReport
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoDeploymentPackageRef]'))
    DROP VIEW [dbo].[vBoDeploymentPackageRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoDeploymentPackageRef] AS SELECT DeploymentPackageRef.DeploymentPackageCode,DeploymentPackageRef.DeploymentPackageDesc,DeploymentPackageRef.DocumentSystemPath FROM DeploymentPackageRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoDialectGatewayAccount]'))
    DROP VIEW [dbo].[vBoDialectGatewayAccount]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoDialectGatewayAccount] AS SELECT GatewayAccount.Login,GatewayAccount.Password,GatewayAccount.RetryCount,GatewayAccount.AuthorizationExpiration,GatewayAccount.UseAvsFlag,GatewayAccount.UseCscFlag,GatewayAccount.CreatedByUserKey,GatewayAccount.CreatedOn,GatewayAccount.GatewayAccountKey,GatewayAccount.SystemEntityKey,GatewayAccount.UpdatedByUserKey,GatewayAccount.UpdatedOn,GatewayAccount.GatewayComponentKey,GatewayAccount.Name,GatewayAccount.GatewayTypeCode,DialectGatewayAccount.CscLevel,DialectGatewayAccount.MerchantId,DialectGatewayAccount.BankAllowsVoidsFlag,DialectGatewayAccount.IsAuthorizationCaptureEnabled FROM GatewayAccount
	INNER JOIN DialectGatewayAccount
		ON GatewayAccount.GatewayAccountKey = DialectGatewayAccount.GatewayAccountKey
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoDiscountRule]'))
    DROP VIEW [dbo].[vBoDiscountRule]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoDiscountRule] AS SELECT RuleMain.Description,RuleMain.Name,RuleMain.UpdatedByUserKey,RuleMain.UpdatedOn,RuleMain.BeginDate,RuleMain.EndDate,RuleMain.IsActive,RuleMain.ObjectMapperComponentKey,RuleMain.RuleEvaluatorComponentKey,RuleMain.Priority,RuleMain.CreatedByUserKey,RuleMain.CreatedOn,RuleMain.RuleKey,RuleMain.SystemEntityKey,DiscountRule.PromoProductKey,DiscountRule.PromoProductQuantity,DiscountRule.PriceBasisCode,DiscountRule.Adjustment,DiscountRule.IsOrderDiscount,DiscountRule.IsPremium,DiscountRule.IsPercent,DiscountRule.HoldCodeKey,DiscountRule.PremiumHandlingFlag FROM RuleMain
	INNER JOIN DiscountRule
		ON RuleMain.RuleKey = DiscountRule.RuleKey
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoDocument]'))
    DROP VIEW [dbo].[vBoDocument]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoDocument] AS SELECT DocumentMain.Blob,DocumentMain.DefaultChildAccessKey,DocumentMain.IsSystem,DocumentMain.UpdatedByUserKey,DocumentMain.UpdatedOn,DocumentMain.LockedByUserKey,DocumentMain.LockedOn,DocumentMain.AccessKey,DocumentMain.CreatedByUserKey,DocumentMain.CreatedOn,DocumentMain.DocumentKey,DocumentMain.ContainsChildrenFlag,DocumentMain.AlternateName,DocumentMain.DocumentDescription AS Description,DocumentMain.DocumentName AS Name,DocumentMain.DocumentStatusCode,DocumentMain.DocumentTypeCode,DocumentMain.DocumentVersionKey,DocumentMain.StatusUpdatedByUserKey,DocumentMain.StatusUpdatedOn,DocumentMain.BranchedFromDocumentKey,DocumentMain.RelatedDocumentVersionKey,DocumentMain.VersionComment,DocumentMain.VersionLabel,DocumentMain.DocumentCode,DocumentMain.SystemKey FROM DocumentMain
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoDocumentHierarchy]'))
    DROP VIEW [dbo].[vBoDocumentHierarchy]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoDocumentHierarchy] AS SELECT Hierarchy.Depth,Hierarchy.HierarchyKey,Hierarchy.IsChildAMemberOfParent,Hierarchy.ParentHierarchyKey,Hierarchy.RootHierarchyKey,Hierarchy.SortOrder,Hierarchy.UniformKey,Hierarchy.UniformType,Hierarchy.HierarchyCode,DocumentMain.IsSystem,DocumentMain.UpdatedByUserKey,DocumentMain.UpdatedOn,DocumentMain.DocumentName,DocumentMain.DocumentDescription,DocumentMain.DocumentTypeCode,DocumentMain.DocumentStatusCode,DocumentMain.DocumentKey,DocumentMain.AlternateName,DocumentMain.AccessKey FROM Hierarchy
	INNER JOIN DocumentMain
		ON Hierarchy.UniformKey = DocumentMain.DocumentVersionKey
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoDocumentStorage]'))
    DROP VIEW [dbo].[vBoDocumentStorage]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoDocumentStorage] AS SELECT DocumentStorage.Blob,DocumentStorage.CreatedByUserKey,DocumentStorage.CreatedOn,DocumentStorage.Description,DocumentStorage.DocumentStorageKey,DocumentStorage.FileTypeCode,DocumentStorage.Name,DocumentStorage.UpdatedByUserKey,DocumentStorage.UpdatedOn,DocumentStorage.UploadedByUserKey,DocumentStorage.UploadedOn FROM DocumentStorage
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoDocumentType]'))
    DROP VIEW [dbo].[vBoDocumentType]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoDocumentType] AS SELECT DocumentTypeRef.DocumentTypeCode,DocumentTypeRef.DocumentTypeName,DocumentTypeRef.DocumentTypeDesc,DocumentTypeRef.TrackVersionsFlag,DocumentTypeRef.TaskHelperAssemblyName,DocumentTypeRef.DocumentNewLink,DocumentTypeRef.DocumentEditLink,DocumentTypeRef.DocumentExecuteLink,DocumentTypeRef.DocumentIconURL,DocumentTypeRef.FolderIconURL,DocumentTypeRef.PublishWorkflowDocumentKey,DocumentTypeRef.RecycleWorkflowDocumentKey,DocumentTypeRef.TaskHelperTypeName,DocumentTypeRef.DocumentSummaryLink,DocumentTypeRef.ShortcutIconURL,DocumentTypeRef.IsExportable FROM DocumentTypeRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoDonation]'))
    DROP VIEW [dbo].[vBoDonation]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoDonation] AS SELECT vDonations.Amount,vDonations.CheckNumber,vDonations.DateReceived,vDonations.FiscalMonth,vDonations.FiscalYear,vDonations.GiftType,vDonations.ID,vDonations.InvoiceRefNum,vDonations.IsMatchingGift,vDonations.ListAs,vDonations.MatchingTransaction,vDonations.MemorialID,vDonations.MemorialNameText,vDonations.OriginalTransaction,vDonations.PaymentType,vDonations.RequestNumber,vDonations.SolicitorID,vDonations.SourceSystem,vDonations.TransactionDate FROM vDonations
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoDonorClubParticipationDetail]'))
    DROP VIEW [dbo].[vBoDonorClubParticipationDetail]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoDonorClubParticipationDetail] AS SELECT GroupMemberDetail.CreatedByUserKey,GroupMemberDetail.CreatedOn,GroupMemberDetail.EffectiveDate,GroupMemberDetail.ExpirationDate,GroupMemberDetail.GroupMemberKey,GroupMemberDetail.GroupRoleKey,GroupMemberDetail.UpdatedByUserKey,GroupMemberDetail.UpdatedOn,GroupMemberDetail.TypeSpecificData,GroupMemberDetail.TypeSpecificFlag,GroupMemberDetail.TypeSpecificKey,GroupMemberDetail.TypeSpecificInt,GroupMemberDetail.GroupMemberStatusCode,GroupMemberDetail.IsActive,GroupMemberDetail.GroupMemberDetailKey,GroupMemberDetail.GroupKey FROM GroupMemberDetail
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vDonorClubReport]'))
    DROP VIEW [dbo].[vDonorClubReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vDonorClubReport]
AS
SELECT DISTINCT  
	C.EvaluatorKey, C.Name as ClubName, C.Description, C.EffectiveDate, C.ExpirationDate,
	CL.Name AS ClubLevel, C.Description AS ClubLevelDesc,CL.Minimum,CL.Maximum, 
	CRCR.Code AS ResonCode, CRCR.Description AS ReasonDesc,
	CM. ID as DonorId, CM.FullName as DonorName --, GMD.TypeSpecificData AS Reason, GMD.EffectiveDate, GMD.ExpirationDate
	

FROM  	Evaluator C 
	LEFT OUTER JOIN EvaluatorLevel CL ON C.EvaluatorKey = CL.EvaluatorKey
	LEFT OUTER JOIN GroupMain G ON C.GroupKey = G.GroupKey
 	LEFT OUTER JOIN GroupMember GM ON G.GroupKey = GM.GroupKey
	--LEFT OUTER JOIN GroupMemberDetail GMD ON GM.GroupMemberKey = GMD.GroupMemberKey
    	LEFT OUTER JOIN ContactMain CM on GM.MemberContactKey =CM.ContactKey 	
	LEFT OUTER JOIN EvaluatorReasonCodeRef CRCR ON C.AutoReasonCodeKey = CRCR.EvaluatorReasonCodeKey

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoDonorClubReport]'))
    DROP VIEW [dbo].[vBoDonorClubReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoDonorClubReport] AS SELECT vDonorClubReport.Description,vDonorClubReport.DonorId,vDonorClubReport.DonorName,vDonorClubReport.EffectiveDate,vDonorClubReport.ExpirationDate,vDonorClubReport.Maximum,vDonorClubReport.Minimum,vDonorClubReport.ClubLevel,vDonorClubReport.ClubLevelDesc,vDonorClubReport.ClubName,vDonorClubReport.ReasonDesc,vDonorClubReport.ResonCode,vDonorClubReport.EvaluatorKey FROM vDonorClubReport
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoEducationLevelRef]'))
    DROP VIEW [dbo].[vBoEducationLevelRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoEducationLevelRef] AS SELECT EducationLevelRef.EducationLevelCode AS Code,EducationLevelRef.EducationLevelDesc AS Description,EducationLevelRef.IsHandModified FROM EducationLevelRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoEvaluator]'))
    DROP VIEW [dbo].[vBoEvaluator]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoEvaluator] AS SELECT Evaluator.AccessKey,Evaluator.AutoReasonCodeKey,Evaluator.CreatedByUserKey,Evaluator.CreatedOn,Evaluator.Description,Evaluator.EffectiveDate,Evaluator.EvaluatorKey,Evaluator.ExpirationDate,Evaluator.GroupKey,Evaluator.Name,Evaluator.QueryDocumentKey,Evaluator.TimePeriodScheduleCommonKey,Evaluator.UpdatedByUserKey,Evaluator.UpdatedOn FROM Evaluator
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoEvaluatorLevel]'))
    DROP VIEW [dbo].[vBoEvaluatorLevel]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoEvaluatorLevel] AS SELECT EvaluatorLevel.CreatedByUserKey,EvaluatorLevel.CreatedOn,EvaluatorLevel.Description,EvaluatorLevel.EvaluatorKey,EvaluatorLevel.EvaluatorLevelKey,EvaluatorLevel.GroupRoleKey,EvaluatorLevel.IsManualOnly,EvaluatorLevel.Maximum,EvaluatorLevel.Minimum,EvaluatorLevel.Name,EvaluatorLevel.UpdatedByUserKey,EvaluatorLevel.UpdatedOn FROM EvaluatorLevel
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoEvaluatorReasonCode]'))
    DROP VIEW [dbo].[vBoEvaluatorReasonCode]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoEvaluatorReasonCode] AS SELECT EvaluatorReasonCodeRef.Code,EvaluatorReasonCodeRef.Description,EvaluatorReasonCodeRef.EvaluatorReasonCodeKey FROM EvaluatorReasonCodeRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoExecutionModeRef]'))
    DROP VIEW [dbo].[vBoExecutionModeRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoExecutionModeRef] AS SELECT ExecutionModeRef.ExecutionModeCode,ExecutionModeRef.ExecutionModeDesc,ExecutionModeRef.ExecutionModeName FROM ExecutionModeRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vExperienceCountSummary]'))
    DROP VIEW [dbo].[vExperienceCountSummary]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vExperienceCountSummary]
AS
SELECT
	[dbo].[CustomerExperience].[CustomerExperienceKey], 
	[dbo].[CustomerExperience].[UserKey], 
	[dbo].[vOfferedCustomerExperience].[ProgramKey], 
	[dbo].[vOfferedCustomerExperience].[ProgramName], 
	[dbo].[vOfferedCustomerExperience].[ExperienceDefinitionKey], 
	[dbo].[vOfferedCustomerExperience].[ExperienceDefinitionName], 
	[dbo].[vOfferedCustomerExperience].[OfferingKey], 
	[dbo].[vOfferedCustomerExperience].[OfferingName], 
	[dbo].[vOfferedCustomerExperience].[OfferingName] AS Name, 
	[dbo].[vOfferedCustomerExperience].[OfferingDesc] AS Description, 
	[dbo].[vOfferedCustomerExperience].[OfferingDate] AS Date, 
	[dbo].[vOfferedCustomerExperience].[ContactKey] AS Provider, 
	[dbo].[vOfferedCustomerExperience].[LocationKey], 
	[dbo].[vOfferedCustomerExperience].[LocationName], 
	[dbo].[vOfferedCustomerExperience].[RequiresGradeFlag], 
	[dbo].[vOfferedCustomerExperience].[RequiresApprovalFlag], 
	[dbo].[vOfferedCustomerExperience].[NumberOfUnits], 
	[dbo].[vOfferedCustomerExperience].[UomKey]

FROM
	[dbo].[CustomerExperience]
		INNER JOIN [dbo].[vOfferedCustomerExperience] ON [dbo].[CustomerExperience].[CustomerExperienceKey] = [dbo].[vOfferedCustomerExperience].[OfferedCustomerExperienceKey]

UNION ALL
SELECT
	[CustomerExperience1].[CustomerExperienceKey], 
	[CustomerExperience1].[UserKey], 
	[dbo].[vUnofferedCustomerExperience].[ProgramKey], 
	[dbo].[vUnofferedCustomerExperience].[ProgramName], 
	[dbo].[vUnofferedCustomerExperience].[ExperienceDefinitionKey], 
	[dbo].[vUnofferedCustomerExperience].[ExperienceDefinitionName], 
	NULL AS OfferingKey, 
	NULL AS OfferingName, 
	[dbo].[vUnofferedCustomerExperience].[ExperienceDefinitionName] AS Name, 
	[dbo].[vUnofferedCustomerExperience].[ExperienceDefinitionDesc] AS Description, 
	[dbo].[vUnofferedCustomerExperience].[ExperienceDefinitionDate] AS Date, 
	NULL AS Provider, 
	NULL AS LocationKey, 
	[dbo].[vUnofferedCustomerExperience].[ExperienceDefinitionLocation] AS LocationName, 
	[dbo].[vUnofferedCustomerExperience].[RequiresGradeFlag], 
	[dbo].[vUnofferedCustomerExperience].[RequiresApprovalFlag], 
	[dbo].[vUnofferedCustomerExperience].[NumberOfUnits], 
	[dbo].[vUnofferedCustomerExperience].[UomKey]

FROM
	[dbo].[CustomerExperience] AS CustomerExperience1 
		INNER JOIN [dbo].[vUnofferedCustomerExperience] ON [CustomerExperience1].[CustomerExperienceKey] = [dbo].[vUnofferedCustomerExperience].[UnofferedCustomerExperienceKey]

UNION ALL
SELECT
	[CustomerExperience2].[CustomerExperienceKey], 
	[CustomerExperience2].[UserKey], 
	[dbo].[vUserDefinedCustomerExperience].[ProgramKey], 
	[dbo].[vUserDefinedCustomerExperience].[ProgramName], 
	NULL AS ExperienceDefinitionKey, 
	NULL AS ExperienceDefinitionName, 
	NULL AS OfferingKey, 
	NULL AS OfferingName, 
	[dbo].[vUserDefinedCustomerExperience].[UserDefinedCustomerExperienceName] AS Name, 
	[dbo].[vUserDefinedCustomerExperience].[UserDefinedCustomerExperienceDesc] AS Description, 
	[dbo].[vUserDefinedCustomerExperience].[CompletionDate] AS Date, 
	NULL AS Provider, 
	NULL AS LocationKey, 
	[dbo].[vUserDefinedCustomerExperience].[UserDefinedCustomerExperienceLocation] AS LocationName, 
	NULL AS RequiresGradeFlag, 
	[dbo].[vUserDefinedCustomerExperience].[RequiresApprovalFlag], 
	[dbo].[vUserDefinedCustomerExperience].[UserDefinedCustomerExperienceUnits], 
	[dbo].[vUserDefinedCustomerExperience].[UomKey]

FROM
	[dbo].[CustomerExperience] AS [CustomerExperience2] 
		INNER JOIN [dbo].[vUserDefinedCustomerExperience] ON [CustomerExperience2].[CustomerExperienceKey] = [dbo].[vUserDefinedCustomerExperience].[UserDefinedCustomerExperienceKey]

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoExperienceCountSummary]'))
    DROP VIEW [dbo].[vBoExperienceCountSummary]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoExperienceCountSummary] AS SELECT vExperienceCountSummary.CustomerExperienceKey,vExperienceCountSummary.Date,vExperienceCountSummary.Description,vExperienceCountSummary.ExperienceDefinitionKey,vExperienceCountSummary.LocationKey,vExperienceCountSummary.LocationName,vExperienceCountSummary.Name,vExperienceCountSummary.NumberOfUnits,vExperienceCountSummary.ProgramKey,vExperienceCountSummary.ProgramName,vExperienceCountSummary.Provider,vExperienceCountSummary.RequiresApprovalFlag,vExperienceCountSummary.RequiresGradeFlag,vExperienceCountSummary.UserKey,vExperienceCountSummary.OfferingKey,vExperienceCountSummary.ExperienceDefinitionName,vExperienceCountSummary.OfferingName,vExperienceCountSummary.UomKey FROM vExperienceCountSummary
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoExperienceDefinition]'))
    DROP VIEW [dbo].[vBoExperienceDefinition]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoExperienceDefinition] AS SELECT ExperienceDefinition.ExperienceDefinitionCode AS Code,ExperienceDefinition.ExperienceDefinitionDate AS Date,ExperienceDefinition.ExperienceDefinitionDesc AS Description,ExperienceDefinition.ExperienceDefinitionKey,ExperienceDefinition.ExperienceDefinitionLocation AS Location,ExperienceDefinition.ExperienceDefinitionName AS Name,ExperienceDefinition.ExperienceDefinitionStatusCode,ExperienceDefinition.NumberOfUnits,ExperienceDefinition.ProgramKey,ExperienceDefinition.RequiresApprovalFlag,ExperienceDefinition.RequiresGradeFlag,ExperienceDefinition.UpdatedByUserKey,ExperienceDefinition.UpdatedOn,ExperienceDefinition.CreatedByUserKey,ExperienceDefinition.CreatedOn,ExperienceDefinition.MarkedForDeleteOn FROM ExperienceDefinition
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoExperienceDefinitionStatus]'))
    DROP VIEW [dbo].[vBoExperienceDefinitionStatus]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoExperienceDefinitionStatus] AS SELECT ExperienceDefinitionStatusRef.ExperienceDefinitionStatusCode AS Code,ExperienceDefinitionStatusRef.ExperienceDefinitionStatusName AS Name FROM ExperienceDefinitionStatusRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vExperienceRoster]'))
    DROP VIEW [dbo].[vExperienceRoster]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vExperienceRoster]
AS
SELECT
	[dbo].[CustomerExperience].[CustomerExperienceKey], 
	[dbo].[CustomerExperience].[UserKey], 
	[dbo].[vOfferedCustomerExperience].[ProgramKey], 
	[dbo].[vOfferedCustomerExperience].[ProgramName], 
	[dbo].[vOfferedCustomerExperience].[ExperienceDefinitionKey], 
	[dbo].[vOfferedCustomerExperience].[ExperienceDefinitionName], 
	[dbo].[vOfferedCustomerExperience].[OfferingKey], 
	[dbo].[vOfferedCustomerExperience].[OfferingName], 
	[dbo].[vOfferedCustomerExperience].[ContactKey] AS Provider, 
	[dbo].[vOfferedCustomerExperience].[OfferingName] AS Name, 
	[dbo].[vBoContact].[FullName], 
	[dbo].[vBoContact].[SortName], 
	ISNULL([dbo].[GradeRef].[GradeValue], [dbo].[vOfferedCustomerExperience].[OfferedCustomerExperienceGrade]) AS Grade, 
	[dbo].[CustomerExperience].[CustomerExperienceStatusCode] AS StatusCode, 
	[dbo].[CustomerExperienceStatusRef].[CustomerExperienceStatusName] AS StatusName, 
	[dbo].[vOfferedCustomerExperience].[NumberOfUnits], 
	[dbo].[vOfferedCustomerExperience].[OfferingDate] AS Date

FROM 
	[dbo].[CustomerExperience] 
		INNER JOIN [dbo].[vOfferedCustomerExperience] ON [dbo].[CustomerExperience].[CustomerExperienceKey] = [dbo].[vOfferedCustomerExperience].[OfferedCustomerExperienceKey] 
		INNER JOIN [dbo].[vBoContact] ON [dbo].[CustomerExperience].[UserKey] = [dbo].[vBoContact].[ContactKey] 
		INNER JOIN [dbo].[CustomerExperienceStatusRef] ON [dbo].[CustomerExperience].[CustomerExperienceStatusCode] = [dbo].[CustomerExperienceStatusRef].[CustomerExperienceStatusCode] 
		LEFT JOIN [dbo].[GradeRef] ON [dbo].[vOfferedCustomerExperience].[OfferedCustomerExperienceGradeKey] = [dbo].[GradeRef].[GradeKey]

UNION ALL
SELECT 
	[CustomerExperience1].[CustomerExperienceKey], 
	[CustomerExperience1].[UserKey], 
	[dbo].[vUnofferedCustomerExperience].[ProgramKey], 
	[dbo].[vUnofferedCustomerExperience].[ProgramName], 
	[dbo].[vUnofferedCustomerExperience].[ExperienceDefinitionKey], 
	[dbo].[vUnofferedCustomerExperience].[ExperienceDefinitionName], 
	NULL AS OfferingKey, 
	NULL AS OfferingName, 
	NULL AS Provider, 
	[dbo].[vUnofferedCustomerExperience].[ExperienceDefinitionName] AS Name, 
	[vBoContact1].[FullName], 
	[vBoContact1].[SortName], 
	[dbo].[vUnofferedCustomerExperience].[UnofferedCustomerExperienceGrade] AS Grade, 
	[CustomerExperience1].[CustomerExperienceStatusCode] AS StatusCode, 
	[CustomerExperienceStatusCodeRef1].[CustomerExperienceStatusName] AS StatusName, 
	[dbo].[vUnofferedCustomerExperience].[NumberOfUnits], 
	[dbo].[vUnofferedCustomerExperience].[ExperienceDefinitionDate] AS Date

FROM 
	[dbo].[CustomerExperience] AS [CustomerExperience1] 
		INNER JOIN [dbo].[vUnofferedCustomerExperience] ON [CustomerExperience1].[CustomerExperienceKey] = [dbo].[vUnofferedCustomerExperience].[UnofferedCustomerExperienceKey] 
		INNER JOIN [dbo].[vBoContact] AS [vBoContact1] ON [CustomerExperience1].[UserKey] = [vBoContact1].[ContactKey] 
		INNER JOIN [dbo].[CustomerExperienceStatusRef] AS [CustomerExperienceStatusCodeRef1] ON [CustomerExperience1].[CustomerExperienceStatusCode] = [CustomerExperienceStatusCodeRef1].[CustomerExperienceStatusCode]

UNION ALL
SELECT 
	[CustomerExperience2].[CustomerExperienceKey], 
	[CustomerExperience2].[UserKey], 
	[dbo].[vUserDefinedCustomerExperience].[ProgramKey], 
	[dbo].[vUserDefinedCustomerExperience].[ProgramName], 
	NULL AS ExperienceDefinitionKey, 
	NULL AS ExperienceDefinitionName, 
	NULL AS OfferingKey, 
	NULL AS OfferingName, 
	NULL AS Provider, 
	[dbo].[vUserDefinedCustomerExperience].[UserDefinedCustomerExperienceName] AS Name, 
	[vBoContact2].[FullName], 
	[vBoContact2].[SortName], 
	NULL AS Grade, 
	[CustomerExperience2].[CustomerExperienceStatusCode] AS StatusCode, 
	[CustomerExperienceStatusCodeRef2].[CustomerExperienceStatusName] AS StatusName, 
	[dbo].[vUserDefinedCustomerExperience].[UserDefinedCustomerExperienceUnits] AS NumberOfUnits, 
	[dbo].[vUserDefinedCustomerExperience].[CompletionDate] AS Date

FROM 
	[dbo].[CustomerExperience] AS [CustomerExperience2] 
		INNER JOIN [dbo].[vUserDefinedCustomerExperience] ON [CustomerExperience2].[CustomerExperienceKey] = [dbo].[vUserDefinedCustomerExperience].[UserDefinedCustomerExperienceKey] 
		INNER JOIN [dbo].[vBoContact] AS [vBoContact2] ON [CustomerExperience2].[UserKey] = [vBoContact2].[ContactKey] 
		INNER JOIN [dbo].[CustomerExperienceStatusRef] AS [CustomerExperienceStatusCodeRef2] ON [CustomerExperience2].[CustomerExperienceStatusCode] = [CustomerExperienceStatusCodeRef2].[CustomerExperienceStatusCode]

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoExperienceRoster]'))
    DROP VIEW [dbo].[vBoExperienceRoster]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoExperienceRoster] AS SELECT vExperienceRoster.CustomerExperienceKey,vExperienceRoster.Date,vExperienceRoster.ExperienceDefinitionKey,vExperienceRoster.ExperienceDefinitionName,vExperienceRoster.FullName,vExperienceRoster.Grade,vExperienceRoster.Name,vExperienceRoster.OfferingKey,vExperienceRoster.OfferingName,vExperienceRoster.ProgramKey,vExperienceRoster.ProgramName,vExperienceRoster.SortName,vExperienceRoster.StatusCode,vExperienceRoster.StatusName,vExperienceRoster.UserKey,vExperienceRoster.Provider,vExperienceRoster.NumberOfUnits FROM vExperienceRoster
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoFileTypeRef]'))
    DROP VIEW [dbo].[vBoFileTypeRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoFileTypeRef] AS SELECT FileTypeRef.FileTypeCode,FileTypeRef.FileTypeDesc,FileTypeRef.IconFileName,FileTypeRef.MimeType FROM FileTypeRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoFinancialEntity]'))
    DROP VIEW [dbo].[vBoFinancialEntity]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoFinancialEntity] AS SELECT FinancialEntity.IsDefault,FinancialEntity.LogoImageURL,FinancialEntity.Name,FinancialEntity.FinancialEntityCode,FinancialEntity.FirstMonthFiscalYear,FinancialEntity.AccessKey,FinancialEntity.CreatedByUserKey,FinancialEntity.CreatedOn,FinancialEntity.FinancialEntityKey,FinancialEntity.OrganizationKey,FinancialEntity.SystemEntityKey,FinancialEntity.UpdatedByUserKey,FinancialEntity.UpdatedOn,FinancialEntity.ContactKey FROM FinancialEntity
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoFinancialEntityDueTo]'))
    DROP VIEW [dbo].[vBoFinancialEntityDueTo]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoFinancialEntityDueTo] AS SELECT FinancialEntityDueTo.FinancialEntityDueToKey,FinancialEntityDueTo.FromFinancialEntityKey,FinancialEntityDueTo.FromFinEntityGLAccountKey,FinancialEntityDueTo.ToFinancialEntityKey,FinancialEntityDueTo.ToFinEntityGLAccountKey FROM FinancialEntityDueTo
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoFirstPaymentDateTypeRef]'))
    DROP VIEW [dbo].[vBoFirstPaymentDateTypeRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoFirstPaymentDateTypeRef] AS SELECT FirstPaymentDateTypeRef.FirstPaymentDateTypeCode AS Code,FirstPaymentDateTypeRef.FirstPaymentDateTypeDesc AS Description,FirstPaymentDateTypeRef.FirstPaymentDateTypeName AS Name FROM FirstPaymentDateTypeRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoFullAddress]'))
    DROP VIEW [dbo].[vBoFullAddress]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoFullAddress] AS SELECT FullAddress.AdditionalLine1,FullAddress.AdditionalLine2,FullAddress.ContactKey,FullAddress.DaytimePhoneAddressKey,FullAddress.EmailAddressKey,FullAddress.EveningPhoneAddressKey,FullAddress.FaxAddressKey,FullAddress.FullAddressKey,FullAddress.PhysicalAddressKey,FullAddress.SalutationKey,FullAddress.FullAddressDesc AS Description,FullAddress.AddressPurposeKey,FullAddress.AddresseeText,FullAddress.IsAddresseeOverridden FROM FullAddress
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vFullAddressAllReport]'))
    DROP VIEW [dbo].[vFullAddressAllReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE  VIEW [dbo].[vFullAddressAllReport]
AS
/****************************************************************************************
** This view provides all Full Address information for each Contact on "One Row per Contact" basis.
** This can be joined to other relevant tables or views to get the necessary address related information..
**
***************************************************************************************/
SELECT    
	 AM1.FormattedAddress AS PhysicalAddress, AM2.FormattedAddress AS DayTimePhone,  AM3.FormattedAddress AS EveningPhone, 
	AM4.FormattedAddress AS Fax, AM5.FormattedAddress AS Email, FA.FullAddressDesc AS FullAddressPurpose, PA.Address1, PA.Address2, PA.Address3, 
	PA.City, PA.StateProvinceCode, PA.Region, PA.PostalCode, PA.CountryCode, PA.County, PA.MailCode, PA.CarrierRoute, PA.DeliveryPointBarCode, PA.LineOfTravel, 
	PA.BarCode, PA.USCongress, PA.StateSenate, PA.Latitude, PA.Longitude, SPR.StateProvinceDesc, CR.CountryName, 
  CRR.CommunicationReasonDesc, CRR.IsDefaultType, FA.FullAddressKey, FA.ContactKey, 
	FA.SalutationKey, ATU.SeasonalRevertFullAddressKey, CCRP.PreferredAddressCategoryCode,
  ACR.AddressCategoryDesc AS PreferredAddressCategory

FROM         
	FullAddress 	FA 
	LEFT OUTER JOIN 	PhysicalAddress 	PA 	ON 	FA.PhysicalAddressKey = PA.AddressKey 
	LEFT OUTER JOIN 	AddressMain 		AM1 	ON 	FA.PhysicalAddressKey = AM1.AddressKey  
	LEFT OUTER JOIN 	AddressMain 		AM2 	ON 	FA.DaytimePhoneAddressKey = AM2.AddressKey 
	LEFT OUTER JOIN 	AddressMain 		AM3 	ON 	FA.EveningPhoneAddressKey = AM3.AddressKey 
	LEFT OUTER JOIN 	AddressMain 		AM4 	ON 	FA.FaxAddressKey = AM4.AddressKey 
	LEFT OUTER JOIN 	AddressMain 		AM5 	ON 	FA.EmailAddressKey = AM5.AddressKey 
	LEFT OUTER JOIN 	AddressToUse 		ATU 	ON 	FA.FullAddressKey = ATU.FullAddressKey 
	LEFT OUTER JOIN 	StateProvinceRef 	SPR 	ON 	PA.StateProvinceCode = SPR.StateProvinceCode 
	LEFT OUTER JOIN 	CountryRef 		CR 	ON 	PA.CountryCode = CR.CountryCode 
	LEFT OUTER JOIN 	CommunicationReasonRef CRR 	ON 	ATU.CommunicationReasonKey = CRR.CommunicationReasonKey
  	LEFT OUTER JOIN   ContactCommunicationReasonPreferences CCRP ON ATU.CommunicationReasonKey = CCRP.CommunicationReasonKey
                    AND ATU.ContactKey = CCRP.ContactKey
  	LEFT OUTER JOIN   AddressCategoryRef ACR ON CCRP.PreferredAddressCategoryCode = ACR.AddressCategoryCode

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoFullAddressAllReport]'))
    DROP VIEW [dbo].[vBoFullAddressAllReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoFullAddressAllReport] AS SELECT vFullAddressAllReport.Address1,vFullAddressAllReport.Address2,vFullAddressAllReport.Address3,vFullAddressAllReport.BarCode,vFullAddressAllReport.CarrierRoute,vFullAddressAllReport.City,vFullAddressAllReport.CommunicationReasonDesc,vFullAddressAllReport.ContactKey,vFullAddressAllReport.CountryCode,vFullAddressAllReport.CountryName,vFullAddressAllReport.County,vFullAddressAllReport.DeliveryPointBarCode,vFullAddressAllReport.FullAddressKey,vFullAddressAllReport.FullAddressPurpose,vFullAddressAllReport.IsDefaultType,vFullAddressAllReport.Latitude,vFullAddressAllReport.LineOfTravel,vFullAddressAllReport.Longitude,vFullAddressAllReport.MailCode,vFullAddressAllReport.PostalCode,vFullAddressAllReport.PreferredAddressCategory,vFullAddressAllReport.PreferredAddressCategoryCode,vFullAddressAllReport.Region,vFullAddressAllReport.SalutationKey,vFullAddressAllReport.SeasonalRevertFullAddressKey,vFullAddressAllReport.StateProvinceCode,vFullAddressAllReport.StateProvinceDesc,vFullAddressAllReport.StateSenate,vFullAddressAllReport.USCongress,vFullAddressAllReport.DayTimePhone,vFullAddressAllReport.Email,vFullAddressAllReport.EveningPhone,vFullAddressAllReport.Fax,vFullAddressAllReport.PhysicalAddress FROM vFullAddressAllReport
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vFullAddressPrimaryReport]'))
    DROP VIEW [dbo].[vFullAddressPrimaryReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE  VIEW [dbo].[vFullAddressPrimaryReport]
AS
/****************************************************************************************
** This view provides Primary Full Address information for each Contact on "One Row per Contact" basis.
** This can be joined to other  relevant tables or views to get the necessary address related information..
**
***************************************************************************************/
SELECT    
	 AM1.FormattedAddress AS PrimaryPhysicalAddress, AM2.FormattedAddress AS PrimaryDayTimePhone,  AM3.FormattedAddress AS PrimaryEveningPhone, 
	AM4.FormattedAddress AS PrimaryFax, AM5.FormattedAddress AS PrimaryEmail, FA.FullAddressDesc AS FullAddressPurpose, PA.Address1, PA.Address2, PA.Address3, 
	PA.City, PA.StateProvinceCode, PA.Region, PA.PostalCode, PA.CountryCode, PA.County, PA.MailCode, PA.CarrierRoute, PA.DeliveryPointBarCode, PA.LineOfTravel, 
	PA.BarCode, PA.USCongress, PA.StateSenate, PA.Latitude, PA.Longitude, SPR.StateProvinceDesc, CR.CountryName, CCRP.PreferredAddressCategoryCode, 
	ACR.AddressCategoryName AS PreferredAddressCategory, CRR.CommunicationReasonDesc, CRR.IsDefaultType, FA.FullAddressKey, FA.ContactKey, 
	FA.SalutationKey, ATU.SeasonalRevertFullAddressKey

FROM         
	FullAddress 	FA 
	LEFT OUTER JOIN 	PhysicalAddress 	PA 	ON 	FA.PhysicalAddressKey = PA.AddressKey 
	LEFT OUTER JOIN 	AddressMain 		AM1 	ON 	FA.PhysicalAddressKey = AM1.AddressKey  
	LEFT OUTER JOIN 	AddressMain 		AM2 	ON 	FA.DaytimePhoneAddressKey = AM2.AddressKey 
	LEFT OUTER JOIN 	AddressMain 		AM3 	ON 	FA.EveningPhoneAddressKey = AM3.AddressKey 
	LEFT OUTER JOIN 	AddressMain 		AM4 	ON 	FA.FaxAddressKey = AM4.AddressKey 
	LEFT OUTER JOIN 	AddressMain 		AM5 	ON 	FA.EmailAddressKey = AM5.AddressKey 
	LEFT OUTER JOIN 	AddressToUse 		ATU 	ON 	FA.FullAddressKey = ATU.FullAddressKey 
	LEFT OUTER JOIN 	StateProvinceRef 	SPR 	ON 	PA.StateProvinceCode = SPR.StateProvinceCode 
	LEFT OUTER JOIN 	CountryRef 		CR 	ON 	PA.CountryCode = CR.CountryCode 
  	LEFT OUTER JOIN 	CommunicationReasonRef CRR 	ON 	ATU.CommunicationReasonKey = CRR.CommunicationReasonKey
 	LEFT OUTER JOIN   ContactCommunicationReasonPreferences CCRP ON ATU.CommunicationReasonKey = CCRP.CommunicationReasonKey
                    AND ATU.ContactKey = CCRP.ContactKey
  	LEFT OUTER JOIN 	AddressCategoryRef 	ACR 	ON 	CCRP.PreferredAddressCategoryCode = ACR.AddressCategoryCode 
	
	WHERE  CRR.IsDefaultType = 1

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoFullAddressPrimaryReport]'))
    DROP VIEW [dbo].[vBoFullAddressPrimaryReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoFullAddressPrimaryReport] AS SELECT vFullAddressPrimaryReport.Address1,vFullAddressPrimaryReport.Address2,vFullAddressPrimaryReport.Address3,vFullAddressPrimaryReport.BarCode,vFullAddressPrimaryReport.CarrierRoute,vFullAddressPrimaryReport.City,vFullAddressPrimaryReport.CommunicationReasonDesc,vFullAddressPrimaryReport.ContactKey,vFullAddressPrimaryReport.CountryCode,vFullAddressPrimaryReport.CountryName,vFullAddressPrimaryReport.County,vFullAddressPrimaryReport.DeliveryPointBarCode,vFullAddressPrimaryReport.FullAddressKey,vFullAddressPrimaryReport.FullAddressPurpose,vFullAddressPrimaryReport.IsDefaultType,vFullAddressPrimaryReport.Latitude,vFullAddressPrimaryReport.LineOfTravel,vFullAddressPrimaryReport.Longitude,vFullAddressPrimaryReport.MailCode,vFullAddressPrimaryReport.PostalCode,vFullAddressPrimaryReport.PreferredAddressCategory,vFullAddressPrimaryReport.PreferredAddressCategoryCode,vFullAddressPrimaryReport.PrimaryDayTimePhone,vFullAddressPrimaryReport.PrimaryEmail,vFullAddressPrimaryReport.PrimaryEveningPhone,vFullAddressPrimaryReport.PrimaryFax,vFullAddressPrimaryReport.PrimaryPhysicalAddress,vFullAddressPrimaryReport.Region,vFullAddressPrimaryReport.SalutationKey,vFullAddressPrimaryReport.SeasonalRevertFullAddressKey,vFullAddressPrimaryReport.StateProvinceCode,vFullAddressPrimaryReport.StateProvinceDesc,vFullAddressPrimaryReport.StateSenate,vFullAddressPrimaryReport.USCongress FROM vFullAddressPrimaryReport
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoFund]'))
    DROP VIEW [dbo].[vBoFund]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoFund] AS SELECT Fund.Description,Fund.Name,Fund.UpdatedByUserKey,Fund.UpdatedOn,Fund.FinancialEntityKey,Fund.FundFamilyKey,Fund.AccessKey,Fund.CreatedByUserKey,Fund.CreatedOn,Fund.FundKey FROM Fund
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoFundFamilyRef]'))
    DROP VIEW [dbo].[vBoFundFamilyRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoFundFamilyRef] AS SELECT FundFamilyRef.FundFamilyKey,FundFamilyRef.Code,FundFamilyRef.Description FROM FundFamilyRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoFundFundType]'))
    DROP VIEW [dbo].[vBoFundFundType]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoFundFundType] AS SELECT FundFundType.FundFundTypeKey,FundFundType.FundKey,FundFundType.FundTypeKey FROM FundFundType
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoFundraisingPreferenceRef]'))
    DROP VIEW [dbo].[vBoFundraisingPreferenceRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoFundraisingPreferenceRef] AS SELECT FundraisingPreferenceRef.FundraisingPreferenceCode,FundraisingPreferenceRef.FundraisingPreferenceDesc,FundraisingPreferenceRef.FundraisingPreferenceName FROM FundraisingPreferenceRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoFundType]'))
    DROP VIEW [dbo].[vBoFundType]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoFundType] AS SELECT FundTypeRef.FundTypeKey,FundTypeRef.Code,FundTypeRef.Description FROM FundTypeRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoGatewayAccount]'))
    DROP VIEW [dbo].[vBoGatewayAccount]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoGatewayAccount] AS SELECT GatewayAccount.Login,GatewayAccount.Password,GatewayAccount.RetryCount,GatewayAccount.AuthorizationExpiration,GatewayAccount.UseAvsFlag,GatewayAccount.UseCscFlag,GatewayAccount.CreatedByUserKey,GatewayAccount.CreatedOn,GatewayAccount.GatewayAccountKey,GatewayAccount.SystemEntityKey,GatewayAccount.UpdatedByUserKey,GatewayAccount.UpdatedOn,GatewayAccount.GatewayComponentKey,GatewayAccount.Name,GatewayAccount.GatewayTypeCode FROM GatewayAccount
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoGatewayResultRef]'))
    DROP VIEW [dbo].[vBoGatewayResultRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoGatewayResultRef] AS SELECT GatewayResultRef.GatewayResultCode,GatewayResultRef.GatewayResultDesc FROM GatewayResultRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoGatewayTransaction]'))
    DROP VIEW [dbo].[vBoGatewayTransaction]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoGatewayTransaction] AS SELECT GatewayTransaction.Amount,GatewayTransaction.VendorRequest,GatewayTransaction.VendorResult,GatewayTransaction.GatewayResultCode,GatewayTransaction.GatewayTransactionCode,GatewayTransaction.CreatedByUserKey,GatewayTransaction.CreatedOn,GatewayTransaction.GatewayTransactionKey,GatewayTransaction.SystemEntityKey,GatewayTransaction.UpdatedByUserKey,GatewayTransaction.UpdatedOn,GatewayTransaction.AuthorizationCode,GatewayTransaction.PaymentDetailKey FROM GatewayTransaction
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoGatewayTransactionRef]'))
    DROP VIEW [dbo].[vBoGatewayTransactionRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoGatewayTransactionRef] AS SELECT GatewayTransactionRef.GatewayTransactionDesc,GatewayTransactionRef.GatewayTransactionCode,GatewayTransactionRef.GatewayTransactionName FROM GatewayTransactionRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoGatewayTypeRef]'))
    DROP VIEW [dbo].[vBoGatewayTypeRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoGatewayTypeRef] AS SELECT GatewayTypeRef.BusinessObjectName,GatewayTypeRef.EditGuiContentCode,GatewayTypeRef.GatewayComponentKey,GatewayTypeRef.GatewayTypeCode AS Code,GatewayTypeRef.GatewayTypeDesc AS Description FROM GatewayTypeRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoGeneric]'))
    DROP VIEW [dbo].[vBoGeneric]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoGeneric] AS SELECT Generic.CreatedByUserKey,Generic.CreatedOn,Generic.Description,Generic.GenericKey,Generic.ID,Generic.IsEnabled,Generic.LongDescription,Generic.NumLookup,Generic.UpdatedByUserKey,Generic.UpdatedOn FROM Generic
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoGenericLink]'))
    DROP VIEW [dbo].[vBoGenericLink]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoGenericLink] AS SELECT GenericLink.CreatedByUserKey,GenericLink.CreatedOn,GenericLink.GenericLinkKey,GenericLink.SourceComponentKey,GenericLink.SourceKey,GenericLink.TargetComponentKey,GenericLink.TargetKey FROM GenericLink
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoGift]'))
    DROP VIEW [dbo].[vBoGift]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoGift] AS SELECT vGift.Amount,vGift.AmountAsMoney,vGift.Appeal,vGift.Campaign,vGift.CheckNumber,vGift.DateReceived,vGift.FairMktValue,vGift.FiscalMonth,vGift.FiscalYear,vGift.Fund,vGift.GiftType,vGift.ID,vGift.InstallmentDate,vGift.InvoiceReferenceNumber,vGift.IsMatchingGift,vGift.ListAs,vGift.MatchingTransaction,vGift.MemorialID,vGift.MemorialNameText,vGift.OriginalTransaction,vGift.PaymentType,vGift.PledgeID,vGift.ReceiptID,vGift.RequestNumber,vGift.SolicitorID,vGift.SourceSystem,vGift.TransactionDate,vGift.TransactionNumber FROM vGift
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vGiftAidClaim]'))
    DROP VIEW [dbo].[vGiftAidClaim]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vGiftAidClaim]
AS
    SELECT  h.Reference as GiftAidReference,   
            RTRIM(d.TaxPayerLastName + ' ' + d.TaxPayerFirstName + ' ' + d.TaxPayerTitle) + ' [' + RTRIM(CONVERT(char(20), d.ContactId)) + ']' AS TaxPayer, 
            d.TransactionPaidDate AS DateOfPayment, 
            d.DonationAmount, 
            d.HmrcReference, 
            h.GiftAidTaxRate as GiftAidTaxRate,
            h.ClaimFromDate, 
            h.ClaimToDate, 
            d.IsIncludedInClaim
    FROM GiftAidClaimDetail d INNER JOIN GiftAidClaimHeader h ON d.GiftAidClaimHeaderKey = h.GiftAidClaimHeaderKey

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoGiftAidClaim]'))
    DROP VIEW [dbo].[vBoGiftAidClaim]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoGiftAidClaim] AS SELECT vGiftAidClaim.ClaimFromDate,vGiftAidClaim.ClaimToDate,vGiftAidClaim.DateOfPayment,vGiftAidClaim.DonationAmount,vGiftAidClaim.GiftAidReference,vGiftAidClaim.GiftAidTaxRate,vGiftAidClaim.HmrcReference,vGiftAidClaim.IsIncludedInClaim,vGiftAidClaim.TaxPayer FROM vGiftAidClaim
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoGiftAidClaimDetail]'))
    DROP VIEW [dbo].[vBoGiftAidClaimDetail]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoGiftAidClaimDetail] AS SELECT GiftAidClaimDetail.ContactId,GiftAidClaimDetail.DonationAmount,GiftAidClaimDetail.GiftAidClaimDetailKey,GiftAidClaimDetail.GiftAidClaimHeaderKey,GiftAidClaimDetail.GiftAidDeclarationKey,GiftAidClaimDetail.GiftAidTaxRate,GiftAidClaimDetail.HmrcReference,GiftAidClaimDetail.IsIncludedInClaim,GiftAidClaimDetail.IsTaxReclaimAllocatedtoGeneralFund,GiftAidClaimDetail.LabelName,GiftAidClaimDetail.TaxPayerFirstName,GiftAidClaimDetail.TaxPayerLastName,GiftAidClaimDetail.TaxPayerTitle,GiftAidClaimDetail.TaxReclaimAmount,GiftAidClaimDetail.TransactionId,GiftAidClaimDetail.TransactionPaidDate FROM GiftAidClaimDetail
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoGiftAidClaimHeader]'))
    DROP VIEW [dbo].[vBoGiftAidClaimHeader]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoGiftAidClaimHeader] AS SELECT GiftAidClaimHeader.ClaimFromDate,GiftAidClaimHeader.ClaimToDate,GiftAidClaimHeader.CreatedOn,GiftAidClaimHeader.GiftAidClaimHeaderKey,GiftAidClaimHeader.GiftAidStatus,GiftAidClaimHeader.GiftAidTaxRate,GiftAidClaimHeader.Reference,GiftAidClaimHeader.UpdatedOn,GiftAidClaimHeader.CreatedByUserKey,GiftAidClaimHeader.UpdatedByUserKey FROM GiftAidClaimHeader
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoGiftAidDeclaration]'))
    DROP VIEW [dbo].[vBoGiftAidDeclaration]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoGiftAidDeclaration] AS SELECT GiftAidDeclaration.CreatedByUserKey,GiftAidDeclaration.CreatedOn,GiftAidDeclaration.DeclarationEndDate,GiftAidDeclaration.DeclarationMethodKey,GiftAidDeclaration.DeclarationNotes,GiftAidDeclaration.DeclarationReceivedDate,GiftAidDeclaration.DeclarationStartDate,GiftAidDeclaration.GiftAidDeclarationKey,GiftAidDeclaration.IsConfirmationRequired,GiftAidDeclaration.IsTaxRecoveredUnrestricted,GiftAidDeclaration.UpdatedOn,GiftAidDeclaration.ID,GiftAidDeclaration.ConfirmationSentDate,GiftAidDeclaration.Status,GiftAidDeclaration.UpdatedByUserKey,GiftAidDeclaration.StatusUpdatedDate,GiftAidDeclaration.AppealCode,GiftAidDeclaration.IsUsing6YearRule,GiftAidDeclaration.TaxpayerPrefix,GiftAidDeclaration.IsHighRateTaxpayer,GiftAidDeclaration.TaxpayerCity,GiftAidDeclaration.TaxpayerAddress2,GiftAidDeclaration.TaxpayerFirstName,GiftAidDeclaration.TaxpayerLastName,GiftAidDeclaration.TaxpayerAddress1,GiftAidDeclaration.TaxpayerAddress3,GiftAidDeclaration.TaxpayerCountry,GiftAidDeclaration.TaxpayerCounty,GiftAidDeclaration.TaxpayerPostcode FROM GiftAidDeclaration
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vGiftHistoryBase]'))
    DROP VIEW [dbo].[vGiftHistoryBase]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE VIEW [dbo].[vGiftHistoryBase]
AS  SELECT  MAX(a.[ID]) ID,
           MAX(a.[ORIGINATING_TRANS_NUM]) OriginalTransaction,
           MAX(t.[INVOICE_REFERENCE_NUM]) AS InvoiceRefNum,
           MAX(a.[SOURCE_SYSTEM]) SourceSystem,
           MAX(a.[TRANSACTION_DATE]) TransactionDate,
           CASE
                 WHEN MAX(a.[SOURCE_SYSTEM]) = 'FR' THEN MAX(a.[EFFECTIVE_DATE])
                 ELSE MAX(a.[TRANSACTION_DATE]) END AS DateReceived,    
           ( SUM([t2].[AMOUNT]) * -1 ) AS Amount,
           MAX(a.[SOLICITOR_ID]) SolicitorID,
           ( CASE WHEN MAX(a.[ACTIVITY_TYPE]) = 'GIFT' THEN MAX(t.[CHECK_NUMBER])
                  ELSE ''
             END ) CheckNumber,
           MAX(a.[SOURCE_CODE]) Appeal,
           MAX(a.[CAMPAIGN_CODE]) Campaign,
           MAX(a.[ORG_CODE]) Fund,
           ( CASE WHEN MAX(a.[ACTIVITY_TYPE]) = 'GIFT'
                  THEN ( CASE MAX(c.[ACCOUNT_TYPE])
                           WHEN 1 THEN 'Credit Card'
                           WHEN 2 THEN 'In Kind'
                           WHEN 3 THEN 'Debit Card'
                           ELSE 'Cash'
                         END )
                  ELSE ''
             END ) AS PaymentType,
           CONVERT(INT, SUBSTRING(CONVERT(CHAR(6), MAX(t.[FISCAL_PERIOD])), 5,
                                  2)) AS FiscalMonth,
           CONVERT(INT, SUBSTRING(CONVERT(CHAR(6), MAX(t.[FISCAL_PERIOD])), 1,
                                  4)) AS FiscalYear,
           ( CASE WHEN MAX(a.[SOURCE_SYSTEM]) = 'DUES' THEN 'Membership'
                  WHEN MAX(a.[SOURCE_SYSTEM]) = 'MEETING' THEN 'Event'
                  WHEN MAX(a.[SOURCE_SYSTEM]) = 'FR'
                  THEN ( CASE WHEN MAX(a.[ACTIVITY_TYPE]) = 'PLEDGE'
                              THEN 'Pledge'
                              WHEN ( MAX(a.[ACTIVITY_TYPE]) = 'GIFT'
                                     AND MAX(c.[ACCOUNT_TYPE]) = 2
                                   ) THEN 'In Kind'
                              ELSE 'Cash'
                         END )
                  ELSE 'Gift'
             END ) AS GiftType,
           MAX(t.[MATCH_GIFT_TRANS_NUM]) MatchingTransaction,
           MAX(t.[IS_MATCH_GIFT]) IsMatchingGift,
           MAX(t.[MEM_TRIB_ID]) MemorialID,
           MAX(a.[ACTION_CODES]) ListAs,
           MAX(a.[UF_4]) RequestNumber,
           MAX(t.[MEM_TRIB_NAME_TEXT]) MemorialNameText,
           CAST(0.00 AS MONEY) AS SoftCreditAmount,
           '' AS SoftCreditDonorID
    FROM    [dbo].[Trans] t
           INNER JOIN [dbo].[Activity] a ON t.[ACTIVITY_SEQN] = a.[SEQN]
           LEFT OUTER JOIN [dbo].[Cash_Accounts] c ON t.[CHECK_NUMBER] = c.[CASH_ACCOUNT_CODE]
           INNER JOIN [dbo].[Invoice] i ON i.[REFERENCE_NUM] = t.[INVOICE_REFERENCE_NUM]
           INNER JOIN [dbo].[Trans] t2 ON i.[REFERENCE_NUM] = [t2].[INVOICE_REFERENCE_NUM]
    WHERE   [t2].[TRANSACTION_TYPE] = 'DIST'
           AND t.[JOURNAL_TYPE] = 'IN'
           AND t.[TRANSACTION_TYPE] = 'DIST'
           AND t.[PRODUCT_CODE] = [t2].[PRODUCT_CODE]
           AND ( i.[SOURCE_SYSTEM] = 'FR'
                 OR ( i.[SOURCE_SYSTEM] = 'DUES'
                      AND t.[INVOICE_LINE_NUM] = [t2].[INVOICE_LINE_NUM]
                    )
               )
           AND [t2].[IS_FR_ITEM] = 1
    GROUP BY a.[ID],
           a.[ORIGINATING_TRANS_NUM],
           a.[ORG_CODE],
           a.[CAMPAIGN_CODE],
           a.[SOURCE_CODE]
    UNION
    SELECT  MAX(a.[ID]) ID,
           MIN(i.[ORIGINATING_TRANS_NUM]) AS OriginalTransaction,
           MAX(t.[INVOICE_REFERENCE_NUM]) InvoiceRefNum,
           MAX(a.[SOURCE_SYSTEM]) SourceSystem,
           MAX(a.[TRANSACTION_DATE]) TransactionDate,
           CASE
                 WHEN MAX(a.[SOURCE_SYSTEM]) = 'FR' THEN MAX(a.[EFFECTIVE_DATE])
                 ELSE MAX(a.[TRANSACTION_DATE]) END AS DateReceived,
           SUM(a.[AMOUNT]) AS Amount,
           '' AS SolicitorID,
           '' AS CheckNumber,
           MAX(a.[SOURCE_CODE]) Appeal,
           MAX(a.[CAMPAIGN_CODE]) Campaign,
           MAX(a.[ORG_CODE]) Fund,
           '' AS PaymentType,
           CONVERT(INT, SUBSTRING(CONVERT(CHAR(6), MAX(t.[FISCAL_PERIOD])), 5,
                                  2)) AS FiscalMonth,
           CONVERT(INT, SUBSTRING(CONVERT(CHAR(6), MAX(t.[FISCAL_PERIOD])), 1,
                                  4)) AS FiscalYear,
           'Event' AS GiftType,
           0 AS MatchingTransaction,
           0 AS IsMatchingGift,
           '' AS MemorialID,
           '' AS ListAs,
           0 AS RequestNumber,
           '' AS MemorialNameText,
           CAST(0.00 AS MONEY) AS SoftCreditAmount,
           '' AS SoftCreditDonorID
    FROM    [dbo].[Activity] a
           INNER JOIN [dbo].[Trans] t ON a.[ORIGINATING_TRANS_NUM] = t.[TRANS_NUMBER]
           INNER JOIN [dbo].[Invoice] i ON i.[REFERENCE_NUM] = t.[INVOICE_REFERENCE_NUM]
    WHERE   a.[ACTIVITY_TYPE] = 'GIFT'
           AND a.[SOURCE_SYSTEM] = 'MEETING'
           AND t.[TRANSACTION_TYPE] = 'DIST'
           AND ( t.[PRODUCT_CODE] = a.[PRODUCT_CODE]
                 OR t.[PRODUCT_CODE] LIKE a.[PRODUCT_CODE] + '/%'
               )
    GROUP BY a.[ID],
          t.[INVOICE_REFERENCE_NUM],
           a.[ORG_CODE],
           a.[CAMPAIGN_CODE],
           a.[SOURCE_CODE]
    UNION
    SELECT  MAX(a.[ID]) ID,
           MAX(a.[ORIGINATING_TRANS_NUM]) AS OriginalTransaction,
           0 AS InvoiceRefNum,
           MAX(a.[SOURCE_SYSTEM]) SourceSystem,
           MAX(a.[TRANSACTION_DATE]) TransactionDate,
           CASE
                 WHEN MAX(a.[SOURCE_SYSTEM]) = 'FR' THEN MAX(a.[EFFECTIVE_DATE])
                 ELSE MAX(a.[TRANSACTION_DATE]) END AS DateReceived,
           SUM(a.[AMOUNT]) AS Amount,
           '' AS SolicitorID,
           MAX(t.[CHECK_NUMBER]) AS CheckNumber,
           MAX(a.[SOURCE_CODE]) Appeal,
           MAX(a.[CAMPAIGN_CODE]) Campaign,
           MAX(a.[ORG_CODE]) Fund,
           ( CASE MAX(c.[ACCOUNT_TYPE])
               WHEN 1 THEN 'Credit Card'
               WHEN 2 THEN 'In Kind'
               WHEN 3 THEN 'Debit Card'
               ELSE 'Cash'
             END ) AS PaymentType,
           CONVERT(INT, SUBSTRING(CONVERT(CHAR(6), MAX(t.[FISCAL_PERIOD])), 5,
                                  2)) AS FiscalMonth,
           CONVERT(INT, SUBSTRING(CONVERT(CHAR(6), MAX(t.[FISCAL_PERIOD])), 1,
                                  4)) AS FiscalYear,
           'Membership' AS GiftType,
           0 AS MatchingTransaction,
           0 AS IsMatchingGift,
           '' AS MemorialID,
           '' AS ListAs,
           0 AS RequestNumber,
           '' AS MemorialNameText,
           CAST(0.00 AS MONEY) AS SoftCreditAmount,
           '' AS SoftCreditDonorID
    FROM    [dbo].[Activity] a
           INNER JOIN [dbo].[Trans] t ON a.[ORIGINATING_TRANS_NUM] = t.[TRANS_NUMBER]
                                     AND t.[ST_ID] = a.[ID]
                                     AND t.[PRODUCT_CODE] = a.[PRODUCT_CODE]
           LEFT OUTER JOIN [dbo].[Cash_Accounts] c ON t.[CHECK_NUMBER] = c.[CASH_ACCOUNT_CODE]
    WHERE   a.[ACTIVITY_TYPE] = 'GIFT'
           AND a.[SOURCE_SYSTEM] IN ( 'DUES', 'SC' )
           AND t.[TRANSACTION_TYPE] = 'DIST'
    GROUP BY a.[ID],
           t.[TRANS_NUMBER],
           a.[ORG_CODE],
           a.[CAMPAIGN_CODE],
           a.[SOURCE_CODE]
    UNION
    SELECT  MAX(s.[SOFT_CREDIT_ID]) ID,
           MAX(a.[ORIGINATING_TRANS_NUM]) OriginalTransaction,
           MAX(t.[INVOICE_REFERENCE_NUM]) AS InvoiceRefNum,
           MAX(a.[SOURCE_SYSTEM]) SourceSystem,
           MAX(a.[TRANSACTION_DATE]) TransactionDate,
           MAX(a.[EFFECTIVE_DATE]) DateReceived,
           CAST(0.00 AS MONEY) AS Amount,
           MAX(a.[SOLICITOR_ID]) SolicitorID,
           ( CASE WHEN MAX(a.[ACTIVITY_TYPE]) = 'GIFT' THEN MAX(t.[CHECK_NUMBER])
                  ELSE ''
             END ) CheckNumber,
           MAX(a.[SOURCE_CODE]) Appeal,
           MAX(a.[CAMPAIGN_CODE]) Campaign,
           MAX(a.[ORG_CODE]) Fund,
           ( CASE WHEN MAX(a.[ACTIVITY_TYPE]) = 'GIFT'
                  THEN ( CASE MAX(c.[ACCOUNT_TYPE])
                           WHEN 1 THEN 'Credit Card'
                           WHEN 2 THEN 'In Kind'
                           WHEN 3 THEN 'Debit Card'
                           ELSE 'Cash'
                         END )
                  ELSE ''
             END ) AS PaymentType,
           CONVERT(INT, SUBSTRING(CONVERT(CHAR(6), MAX(t.[FISCAL_PERIOD])), 5,
                                  2)) AS FiscalMonth,
           CONVERT(INT, SUBSTRING(CONVERT(CHAR(6), MAX(t.[FISCAL_PERIOD])), 1,
                                  4)) AS FiscalYear,
           'Soft Credit' AS GiftType,
           MAX(t.[MATCH_GIFT_TRANS_NUM]) MatchingTransaction,
           MAX(t.[IS_MATCH_GIFT]) IsMatchingGift,
           MAX(t.[MEM_TRIB_ID]) MemorialID,
           MAX(a.[ACTION_CODES]) ListAs,
           MAX(a.[UF_4]) RequestNumber,
           MAX(t.[MEM_TRIB_NAME_TEXT]) MemorialNameText,
           SUM(s.[AMOUNT]) AS SoftCreditAmount,
           MAX(a.[ID]) AS SoftCreditDonorID
    FROM    [dbo].[Trans] t
           INNER JOIN [dbo].[Activity] a ON t.[ACTIVITY_SEQN] = a.[SEQN]
           LEFT OUTER JOIN [dbo].[Cash_Accounts] c ON t.[CHECK_NUMBER] = c.[CASH_ACCOUNT_CODE]
           INNER JOIN [dbo].[Invoice] i ON i.[REFERENCE_NUM] = t.[INVOICE_REFERENCE_NUM]
           INNER JOIN [dbo].[Trans_SoftCredit] s ON s.[ORIGINATING_ACTIVITY_SEQN] = t.[ACTIVITY_SEQN]
    WHERE   t.[TRANSACTION_TYPE] = 'DIST'
           AND t.[JOURNAL_TYPE] = 'IN'
           AND t.[TRANSACTION_TYPE] = 'DIST'
           AND t.[PRODUCT_CODE] = s.[PRODUCT_CODE]
           AND i.[SOURCE_SYSTEM] = 'FR'
    GROUP BY a.[ID],
           a.[ORIGINATING_TRANS_NUM],
           s.[SOFT_CREDIT_ID],
           a.[ORG_CODE],
           a.[CAMPAIGN_CODE],
           a.[SOURCE_CODE]





GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vGiftsReceivedBase]'))
    DROP VIEW [dbo].[vGiftsReceivedBase]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE VIEW [dbo].[vGiftsReceivedBase]
  AS
    SELECT 
		Activity.ID ID,
		Activity.ORIGINATING_TRANS_NUM OriginalTransaction,
		Activity.ORIGINATING_TRANS_NUM TransactionNumber,
		MAX(Activity.SOURCE_SYSTEM) SourceSystem,
		MAX(Activity.TRANSACTION_DATE) TransactionDate,
        CASE
             WHEN MAX(Activity.[SOURCE_SYSTEM]) = 'FR' THEN MAX(Activity.[EFFECTIVE_DATE])
             ELSE MAX(Activity.[TRANSACTION_DATE]) END AS DateReceived,
		SUM(Activity.AMOUNT) Amount,
		MAX(Activity.ORG_CODE) Fund,
		MAX(Activity.SOURCE_CODE) Appeal,
		MAX(Activity.SOLICITOR_ID) SolicitorID,
		MAX(C.CHECK_NUMBER) CheckNumber,
		(CASE MAX(Cash_Accounts.ACCOUNT_TYPE)
			WHEN 1 THEN 'Credit Card'
			WHEN 2 THEN 'In Kind' 
			WHEN 3 THEN 'Debit Card' 
			ELSE 'Cash' END) AS PaymentType,
		MAX(Activity.CAMPAIGN_CODE) Campaign,
		CONVERT(int,SUBSTRING(CONVERT(char(6),MAX(C.FISCAL_PERIOD)),1,4)) AS FiscalYear,
		CONVERT(int,SUBSTRING(CONVERT(char(6),MAX(C.FISCAL_PERIOD)),5,2)) AS FiscalMonth,
           ( CASE WHEN MAX(Activity.[SOURCE_SYSTEM]) = 'DUES' THEN 'Membership'
                   WHEN MAX(Activity.[SOURCE_SYSTEM]) = 'MEETING' THEN 'Event'
                   WHEN MAX(Activity.[SOURCE_SYSTEM]) = 'FR'
                   THEN ( CASE WHEN MAX(Activity.[ACTIVITY_TYPE]) = 'PLEDGE'
                               THEN 'Pledge Payment'
                               WHEN ( MAX(Activity.[ACTIVITY_TYPE]) = 'GIFT'
                                      AND MAX(Cash_Accounts.[ACCOUNT_TYPE]) = 2
                                    ) THEN 'In Kind'
                               ELSE 'Cash'
                          END )
                   ELSE 'Gift'
              END ) AS GiftType,
		MAX(C.INVOICE_REFERENCE_NUM) InvoiceReferenceNumber,
		MAX(C.RECEIPT_ID) ReceiptID,
		MAX(C.MATCH_GIFT_TRANS_NUM) MatchingTransaction,
		MAX(C.IS_MATCH_GIFT) IsMatchingGift,
		MAX(C.MEM_TRIB_ID) MemorialID,
		'' AS PledgeID,
		MAX(Activity.ACTION_CODES) ListAs,
		MAX(Activity.UF_4) RequestNumber,
		null AS InstallmentDate,
		MAX(C.MEM_TRIB_NAME_TEXT) MemorialNameText    
     FROM Activity
		INNER JOIN Trans C ON 
			Activity.ORIGINATING_TRANS_NUM = C.TRANS_NUMBER
		INNER JOIN TransWatch ON
			C.TRANS_NUMBER = TransWatch.TransactionNumber AND
			C.INVOICE_REFERENCE_NUM = TransWatch.InvoiceNumber
		LEFT OUTER JOIN Cash_Accounts ON
			C.CHECK_NUMBER = Cash_Accounts.CASH_ACCOUNT_CODE 
     WHERE 
		Activity.ACTIVITY_TYPE = 'GIFT' AND Activity.ID = C.ST_ID AND
		(
			(Activity.SOURCE_SYSTEM = 'FR' AND C.TRANSACTION_TYPE = 'PAY' AND C.JOURNAL_TYPE = 'IN' AND C.SUB_LINE_NUMBER = 1) OR
			(Activity.SOURCE_SYSTEM IN ('SC', 'DUES') AND C.TRANSACTION_TYPE = 'DIST' AND C.PRODUCT_CODE = Activity.PRODUCT_CODE)
		)
	GROUP BY Activity.ID, Activity.ORIGINATING_TRANS_NUM,  Activity.ORG_CODE, Activity.CAMPAIGN_CODE, Activity.SOURCE_CODE
UNION
	SELECT 
		CASE WHEN Invoice_Lines.ST_ID IS NULL THEN Invoice.BT_ID ELSE Invoice_Lines.ST_ID END    ID,
		P.TRANS_NUMBER OriginalTransaction,
		C.TRANS_NUMBER TransactionNumber,
		MAX(P.SOURCE_SYSTEM) SourceSystem,
		MAX(C.TRANSACTION_DATE)TransactionDate,
		MAX(C.TRANSACTION_DATE) DateReceived,
		(CASE WHEN MAX(C.JOURNAL_TYPE) = 'IN' THEN SUM(C.AMOUNT) ELSE -SUM(C.AMOUNT) END) Amount,
		(CASE WHEN MAX(C.JOURNAL_TYPE) = 'IN' THEN MAX(C.OWNER_ORG_CODE) ELSE MAX(C.GL_ACCT_ORG_CODE) END) Fund,
		MAX(P.SOURCE_CODE)Appeal,
		MAX(P.SOLICITOR_ID)SolicitorID,
		MAX(C.CHECK_NUMBER)CheckNumber,
		(CASE MAX(Cash_Accounts.ACCOUNT_TYPE)
			WHEN 1 THEN 'Credit Card' 
			WHEN 2 THEN 'In Kind' 
			WHEN 3 THEN 'Debit Card' 
			ELSE 'Cash' END) AS PaymentType,
		MAX(Activity.CAMPAIGN_CODE)Campaign,
		CONVERT(int,SUBSTRING(CONVERT(char(6),MAX(C.FISCAL_PERIOD)),1,4)) AS FiscalYear,
		CONVERT(int,SUBSTRING(CONVERT(char(6),MAX(C.FISCAL_PERIOD)),5,2)) AS FiscalMonth,
		(CASE WHEN MAX(Activity.[ACTIVITY_TYPE]) = 'PLEDGE'
             THEN 'Pledge Payment'
             WHEN ( MAX(Activity.[ACTIVITY_TYPE]) = 'GIFT'
                    AND MAX(Cash_Accounts.[ACCOUNT_TYPE]) = 2
                  ) THEN 'In Kind'
                    ELSE 'Cash'
        END),
		MAX(C.INVOICE_REFERENCE_NUM) InvoiceReferenceNumber,
		MAX(C.RECEIPT_ID) ReceiptID,
		MAX(P.MATCH_GIFT_TRANS_NUM) MatchingTransaction,
		MAX(P.IS_MATCH_GIFT) IsMatchingGift,
		MAX(P.MEM_TRIB_ID) MemorialID,
		(CASE WHEN MAX(C.BT_ID)= MAX(C.ST_ID) THEN '' ELSE MAX(C.BT_ID) END) AS PledgeID,
		MAX(Activity.ACTION_CODES) ListAs,
		MAX(Activity.UF_4) RequestNumber,
		MAX(Invoice.INSTALL_BILL_DATE) AS InstallmentDate,
		MAX(P.MEM_TRIB_NAME_TEXT) MemorialNameText     
	FROM Invoice 
		INNER JOIN TransWatch ON
			Invoice.ORIGINATING_TRANS_NUM = TransWatch.TransactionNumber AND
			Invoice.REFERENCE_NUM = TransWatch.InvoiceNumber
		INNER JOIN Trans P ON 
			Invoice.ORIGINATING_TRANS_NUM = P.TRANS_NUMBER
		INNER JOIN Activity ON 
			P.ACTIVITY_SEQN = Activity.SEQN
		INNER JOIN Trans C ON
			Invoice.REFERENCE_NUM = C.INVOICE_REFERENCE_NUM
		LEFT OUTER JOIN Cash_Accounts ON 
			C.CHECK_NUMBER = Cash_Accounts.CASH_ACCOUNT_CODE
		LEFT OUTER JOIN Invoice_Lines ON
			C.INVOICE_REFERENCE_NUM = Invoice_Lines.REFERENCE_NUM AND
			C.INVOICE_LINE_NUM = Invoice_Lines.LINE_NUM
	WHERE  
		P.TRANSACTION_TYPE = 'DIST' AND Activity.ACTIVITY_TYPE in ('PLEDGE','GIFT') AND C.IS_FR_ITEM = 1 AND
		(
			(
				Activity.ACTIVITY_TYPE = 'PLEDGE' and P.LINE_NUMBER = 1 AND P.SUB_LINE_NUMBER = 1 AND Invoice.SOURCE_SYSTEM = 'FR' AND 
				(
					(C.JOURNAL_TYPE = 'PAY' AND C.TRANSACTION_TYPE = 'AR') OR
					(C.JOURNAL_TYPE = 'IN' AND C.TRANSACTION_TYPE = 'PAY')
				)
			)
		OR 
			(
				Activity.ACTIVITY_TYPE = 'PLEDGE' and Invoice.SOURCE_SYSTEM = 'DUES' AND 
				P.PRODUCT_CODE = C.PRODUCT_CODE AND 
				C.JOURNAL_TYPE = 'PAY' AND 
				C.TRANSACTION_TYPE = 'AR' AND 
				P.INVOICE_LINE_NUM = C.INVOICE_LINE_NUM
			)
		OR
			(
				Activity.ACTIVITY_TYPE = 'GIFT' and P.LINE_NUMBER = 1 AND P.SUB_LINE_NUMBER = 1 AND Invoice.SOURCE_SYSTEM = 'FR' AND 
				C.JOURNAL_TYPE = 'PAY' AND C.TRANSACTION_TYPE = 'AR'
			)
		)
	GROUP BY Invoice_Lines.ST_ID, Invoice.BT_ID, C.TRANS_NUMBER, Invoice.ORIGINATING_TRANS_NUM, C.OWNER_ORG_CODE, C.GL_ACCT_ORG_CODE, Activity.CAMPAIGN_CODE, P.SOURCE_CODE, P.TRANS_NUMBER
UNION
	SELECT 
		Activity.ID ID,
		Invoice.ORIGINATING_TRANS_NUM  AS  OriginalTransaction,
		0 AS TransactionNumber,
		MAX(Activity.SOURCE_SYSTEM) SourceSystem,
		MAX(Activity.TRANSACTION_DATE) TransactionDate,
        CASE
             WHEN MAX(Activity.[SOURCE_SYSTEM]) = 'FR' THEN MAX(Activity.[EFFECTIVE_DATE])
             ELSE MAX(Activity.[TRANSACTION_DATE]) END AS DateReceived,
		SUM(Activity.AMOUNT) Amount,
		MAX(Activity.ORG_CODE) Fund,
		MAX(Activity.SOURCE_CODE) Appeal,
		'' AS  SolicitorID,
		'' AS  CheckNumber,
		'' AS PaymentType,
		MAX(Activity.CAMPAIGN_CODE) Campaign,
		CONVERT(int,SUBSTRING(CONVERT(char(6),MAX(C.FISCAL_PERIOD)),1,4)) AS FiscalYear,
		CONVERT(int,SUBSTRING(CONVERT(char(6),MAX(C.FISCAL_PERIOD)),5,2)) AS FiscalMonth,
		'Event' AS GiftType,
		MAX(C.INVOICE_REFERENCE_NUM) InvoiceReferenceNumber,
		0 AS ReceiptID,
		0 AS MatchingTransaction,
		0 AS IsMatchingGift,
		'' AS MemorialID,
		'' AS PledgeID,
		'' AS ListAs,
		0 AS RequestNumber,
		null AS InstallmentDate,
		'' AS MemorialNameText    
	FROM Activity
		INNER JOIN Trans C ON 
			Activity.ORIGINATING_TRANS_NUM = C.TRANS_NUMBER
		INNER JOIN Invoice ON 
			Invoice.REFERENCE_NUM = C.INVOICE_REFERENCE_NUM
		INNER JOIN TransWatch ON
				 C.TRANS_NUMBER = TransWatch.TransactionNumber AND
				 C.INVOICE_REFERENCE_NUM = TransWatch.InvoiceNumber
     WHERE 
             Activity.ACTIVITY_TYPE = 'GIFT' AND 
             C.TRANSACTION_TYPE = 'DIST' AND 
             (C.PRODUCT_CODE = Activity.PRODUCT_CODE OR C.PRODUCT_CODE LIKE Activity.PRODUCT_CODE +'/%') AND 
             Activity.SOURCE_SYSTEM = 'MEETING'
     GROUP BY Activity.ID, C.INVOICE_REFERENCE_NUM, Activity.ORG_CODE, Activity.CAMPAIGN_CODE, Activity.SOURCE_CODE, Invoice.ORIGINATING_TRANS_NUM
UNION 
	SELECT 
		MAX(P.ST_ID) ID, 
		MAX(P.TRANS_NUMBER) OriginalTransaction,
		MAX(C.TRANS_NUMBER) TransactionNumber,
		MAX(P.SOURCE_SYSTEM) SourceSystem,
		MAX(C.TRANSACTION_DATE)TransactionDate,
		MAX(C.TRANSACTION_DATE) DateReceived,
		-SUM(C.AMOUNT) Amount,
		(
			CASE WHEN MAX(C.JOURNAL_TYPE) = 'IN' 
			THEN MAX(C.OWNER_ORG_CODE) 
			ELSE MAX(C.GL_ACCT_ORG_CODE) END
		) Fund,
		MAX(P.SOURCE_CODE)Appeal,
		MAX(P.SOLICITOR_ID)SolicitorID,
		MAX(C.CHECK_NUMBER)CheckNumber,
		(
			CASE MAX(Cash_Accounts.ACCOUNT_TYPE)
			WHEN 1 THEN 'Credit Card' 
			WHEN 2 THEN 'In Kind' 
			WHEN 3 THEN 'Debit Card' 
			ELSE 'Cash' END
		) PaymentType,
		MAX(Activity.CAMPAIGN_CODE)Campaign,
		CONVERT(int,SUBSTRING(CONVERT(char(6),MAX(C.FISCAL_PERIOD)),1,4)) AS FiscalYear,
		CONVERT(int,SUBSTRING(CONVERT(char(6),MAX(C.FISCAL_PERIOD)),5,2)) AS FiscalMonth,
		'Asterisk Tab Adjustment' AS GiftType,
		MAX(C.INVOICE_REFERENCE_NUM) InvoiceReferenceNumber,
		MAX(C.RECEIPT_ID) ReceiptID,
		MAX(P.MATCH_GIFT_TRANS_NUM) MatchingTransaction,
		MAX(P.IS_MATCH_GIFT) IsMatchingGift,
		MAX(P.MEM_TRIB_ID) MemorialID,
		(CASE WHEN MAX(C.BT_ID)= MAX(C.ST_ID) THEN '' ELSE MAX(C.BT_ID) END) AS PledgeID,
		''  ListAs,
		0 RequestNumber,
		MAX(Invoice.INSTALL_BILL_DATE) AS InstallmentDate,
		MAX(P.MEM_TRIB_NAME_TEXT) MemorialNameText
	FROM Invoice
		INNER JOIN TransWatch ON 
			Invoice.ORIGINATING_TRANS_NUM = TransWatch.TransactionNumber  AND
			Invoice.REFERENCE_NUM = TransWatch.InvoiceNumber 
		INNER JOIN Trans C ON
			Invoice.REFERENCE_NUM = C.INVOICE_REFERENCE_NUM 
		LEFT OUTER JOIN Cash_Accounts ON 
			C.CHECK_NUMBER = Cash_Accounts.CASH_ACCOUNT_CODE
		INNER JOIN Trans P ON
			Invoice.ORIGINATING_TRANS_NUM = P.TRANS_NUMBER
		INNER JOIN Activity ON 
			P.ACTIVITY_SEQN = Activity.SEQN
	WHERE 
		P.LINE_NUMBER = 1  AND P.SUB_LINE_NUMBER = 1 AND P.JOURNAL_TYPE = 'IN' AND 
		P.TRANSACTION_TYPE = 'DIST' AND Invoice.SOURCE_SYSTEM='FR' AND 
		(
			(C.JOURNAL_TYPE = 'IN' AND C.TRANSACTION_TYPE = 'TR') OR
			(C.JOURNAL_TYPE = 'PAY' AND C.TRANSACTION_TYPE IN ('PAY', 'TR'))
		) 
	GROUP BY P.ST_ID, C.TRANS_NUMBER, P.INVOICE_REFERENCE_NUM
UNION
	SELECT ID, OriginalTransaction, GiftReport.TransactionNumber, SourceSystem, TransactionDate, 
    CASE
         WHEN SourceSystem = 'FR' THEN DateReceived
         ELSE TransactionDate END AS DateReceived,
	Amount, Fund, AppealCode, SolicitorID, CheckNumber, PaymentType, CampaignCode, FiscalYear, FiscalMonth, 
    CASE
         WHEN SourceSystem = 'MEETING' THEN 'Event'
         ELSE GiftType END AS GiftType, 
	InvoiceReferenceNumber, ReceiptID, MatchingTransaction, IsMatchingGift, MemorialID, PledgeID, ListAs, RequestNumber, InstallmentDate, MemorialNameText 
	FROM GiftReport
		LEFT OUTER JOIN TransWatch ON
			GiftReport.OriginalTransaction = TransWatch.TransactionNumber AND
			GiftReport.InvoiceReferenceNumber = TransWatch.InvoiceNumber
	WHERE 
		TransWatch.TransactionNumber IS NULL 
UNION
	SELECT ID, OriginalTransaction, GiftReport.TransactionNumber, SourceSystem, TransactionDate, 
	TransactionDate AS DateReceived,
	Amount, Fund, AppealCode, SolicitorID, CheckNumber, PaymentType, CampaignCode, FiscalYear, FiscalMonth, 
    'Event' AS GiftType, 
    InvoiceReferenceNumber, ReceiptID, MatchingTransaction, IsMatchingGift, MemorialID, PledgeID, ListAs, RequestNumber, InstallmentDate, MemorialNameText 
	FROM GiftReport
	WHERE 
		OriginalTransaction NOT IN (SELECT TransactionNumber FROM TransWatch) AND 
		SourceSystem = 'MEETING'




GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vGiftHistory]'))
    DROP VIEW [dbo].[vGiftHistory]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE VIEW [dbo].[vGiftHistory] AS
     SELECT  d.[OriginalTransaction],
                 d.[Fund],
                 d.[Campaign],
                 d.[Appeal],
                 DATEPART(year,d.[TransactionDate]) AS CalendarYear,  
                 d.[FiscalYear],
                 d.[ID],
                 d.[TransactionDate],
                 d.[DateReceived],     
                 CASE
                       WHEN (SELECT COUNT(v.OriginalTransaction) from vGiftHistoryBase v where d.OriginalTransaction = v.OriginalTransaction and d.ID = v.ID) > 1 then 'Split-' + d.GiftType
                       ELSE d.GiftType END AS GiftType,
                 d.[SolicitorID],  
                 CASE
                       WHEN d.[GiftType] = 'Soft Credit' THEN 0
                       ELSE d.[Amount] END AS Amount,            
                 CASE
                       WHEN d.[GiftType] = 'Soft Credit' THEN 0
                       ELSE SUM(ISNULL(g.[Amount],0)) END AS Received,
                 (d.Amount-(CASE
                       WHEN d.[GiftType] = 'Soft Credit' THEN 0
                       ELSE SUM(ISNULL(g.[Amount],0)) END)) AS Balance,
                  d.[SoftCreditAmount] AS SoftCredit,
                  d.[SoftCreditDonorID],
                 (d.Amount + d.[SoftCreditAmount]) AS TotalCredits                              
       FROM [dbo].[vGiftHistoryBase] d
              LEFT OUTER JOIN [dbo].[vGiftsReceivedBase] g ON d.[OriginalTransaction] = g.[OriginalTransaction] and d.[Fund] = g.[Fund]
    GROUP BY  d.[OriginalTransaction],
             d.[SourceSystem],
             d.[Fund],
             d.[Campaign],                 
             d.[Appeal],            
             d.[PaymentType],            
             d.[TransactionDate],
             d.[FiscalYear],
             d.[DateReceived],                 
             d.[ID],
             d.[GiftType],
             d.[SolicitorID],
             d.[Amount],
             d.[SoftCreditAmount],
             d.[SoftCreditDonorID]





GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoGiftHistory]'))
    DROP VIEW [dbo].[vBoGiftHistory]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoGiftHistory] AS SELECT vGiftHistory.Amount,vGiftHistory.Appeal,vGiftHistory.Balance,vGiftHistory.CalendarYear,vGiftHistory.Campaign,vGiftHistory.DateReceived,vGiftHistory.FiscalYear,vGiftHistory.Fund,vGiftHistory.GiftType,vGiftHistory.ID,vGiftHistory.OriginalTransaction,vGiftHistory.Received,vGiftHistory.SoftCredit,vGiftHistory.SoftCreditDonorID,vGiftHistory.SolicitorID,vGiftHistory.TotalCredits,vGiftHistory.TransactionDate FROM vGiftHistory
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vGiftHistorySummary]'))
    DROP VIEW [dbo].[vGiftHistorySummary]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO


CREATE VIEW [dbo].[vGiftHistorySummary] 
AS
SELECT GH.[ID], 
    -- first gift
    (SELECT TOP 1 [TransactionDate] 
       FROM [vGift] GH1 WITH(NOLOCK)  
     WHERE [OriginalTransaction] =  [dbo].[asi_Get_TransactionID](GH.ID,'FIRST' ) ) as [FirstGiftDate],
    (SELECT TOP 1 [Amount] 
       FROM [vGift] GH1 WITH(NOLOCK) 
     WHERE [OriginalTransaction] =  [dbo].[asi_Get_TransactionID](GH.ID,'FIRST' ) ) as [FirstGiftAmount],   
    (SELECT TOP 1 [Appeal] 
       FROM [vGift] GH1 WITH(NOLOCK) 
     WHERE [OriginalTransaction] =  [dbo].[asi_Get_TransactionID](GH.ID,'FIRST' ) ) as [FirstGiftAppeal],
    -- next to last gift    
    (SELECT TOP 1 [TransactionDate] 
       FROM [vGift] GH1 WITH(NOLOCK) 
     WHERE [OriginalTransaction] =  [dbo].[asi_Get_TransactionID](GH.ID,'NEXTLAST' ) ) as [NextLastGiftDate],
    (SELECT TOP 1 [Amount] 
       FROM [vGift] GH1 WITH(NOLOCK) 
     WHERE [OriginalTransaction] =  [dbo].[asi_Get_TransactionID](GH.ID,'NEXTLAST' ) ) as [NextLastGiftAmount],   
    (SELECT TOP 1 [Appeal] 
       FROM [vGift] GH1 WITH(NOLOCK)  
     WHERE [OriginalTransaction] =  [dbo].[asi_Get_TransactionID](GH.ID,'NEXTLAST' ) ) as [NextLastGiftAppeal],     
     -- Last Gift   
    (SELECT TOP 1 [TransactionDate] 
       FROM [vGift] GH1 WITH(NOLOCK)  
     WHERE [OriginalTransaction] =  [dbo].[asi_Get_TransactionID](GH.ID,'LAST' ) ) as [LastGiftDate],
    (SELECT TOP 1 [Amount] 
       FROM [vGift] GH1 WITH(NOLOCK) 
     WHERE [OriginalTransaction] =  [dbo].[asi_Get_TransactionID](GH.ID,'LAST' ) ) as [LastGiftAmount],   
    (SELECT TOP 1 [Appeal] 
       FROM [vGift] GH1 WITH(NOLOCK) 
     WHERE [OriginalTransaction] =  [dbo].[asi_Get_TransactionID](GH.ID,'LAST' ) ) as [LastGiftAppeal],
    -- other values    
    [dbo].[asi_GivingStatistics]( GH.ID, 'MIN' ) as [LowestGiftAmount],
    [dbo].[asi_GivingStatistics]( GH.ID, 'MAX' ) as [HighestGiftAmount],    
    CONVERT( int, [dbo].[asi_GivingStatistics]( GH.ID, 'COUNT' )) as [NumberofGifts],    
    [dbo].[asi_GivingStatistics]( GH.ID, 'SUM' ) as [LifetimeGiftValue],    
    [dbo].[asi_GivingStatistics]( GH.ID, 'AVG' ) as [AverageGiftValue],     
    [dbo].[asi_ConsecutiveYearsGiving]( GH.ID ) as [ConsecutiveYearsGiving] 
  FROM [dbo].[vGift] GH WITH(NOLOCK) 
  WHERE GH.[Amount] <> 0
  GROUP by GH.ID









GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoGiftHistorySummary]'))
    DROP VIEW [dbo].[vBoGiftHistorySummary]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoGiftHistorySummary] AS SELECT vGiftHistorySummary.ConsecutiveYearsGiving,vGiftHistorySummary.FirstGiftAmount,vGiftHistorySummary.FirstGiftAppeal,vGiftHistorySummary.FirstGiftDate,vGiftHistorySummary.HighestGiftAmount,vGiftHistorySummary.ID,vGiftHistorySummary.LastGiftAmount,vGiftHistorySummary.LastGiftAppeal,vGiftHistorySummary.LastGiftDate,vGiftHistorySummary.LifetimeGiftValue,vGiftHistorySummary.LowestGiftAmount,vGiftHistorySummary.NextLastGiftAmount,vGiftHistorySummary.NextLastGiftAppeal,vGiftHistorySummary.NextLastGiftDate,vGiftHistorySummary.NumberofGifts,vGiftHistorySummary.AverageGiftValue FROM vGiftHistorySummary
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vGiftsReceived]'))
    DROP VIEW [dbo].[vGiftsReceived]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE VIEW [dbo].[vGiftsReceived] AS      
     SELECT  g.[OriginalTransaction],
                 g.[TransactionNumber],
                 g.[Fund],
                 g.[Campaign],
                 g.[Appeal],
                 DATEPART(year,g.[TransactionDate]) AS CalendarYear,  
                 g.[FiscalYear],
                 g.[ID],
                 g.[TransactionDate],
                 g.[DateReceived],     
                 CASE
                       WHEN (SELECT COUNT(v.OriginalTransaction) from vGiftHistoryBase v where g.OriginalTransaction = v.OriginalTransaction and g.ID = v.ID) > 1 then 'Split-' + g.GiftType
                       ELSE g.GiftType END AS GiftType,
                 g.[PaymentType] AS PaymentMethod,
                 g.[SolicitorID],  
                 g.[Amount]                              
       FROM [dbo].[vGiftsReceivedBase] g
    GROUP BY  g.[OriginalTransaction],
             g.[TransactionNumber],
             g.[Fund],
             g.[Campaign],                 
             g.[Appeal],            
             g.[PaymentType],            
             g.[TransactionDate],
             g.[FiscalYear],
             g.[DateReceived],                 
             g.[ID],
             g.[GiftType],
             g.[SolicitorID],
             g.[Amount]



GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoGiftsReceived]'))
    DROP VIEW [dbo].[vBoGiftsReceived]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoGiftsReceived] AS SELECT vGiftsReceived.Amount,vGiftsReceived.Appeal,vGiftsReceived.CalendarYear,vGiftsReceived.Campaign,vGiftsReceived.DateReceived,vGiftsReceived.FiscalYear,vGiftsReceived.Fund,vGiftsReceived.GiftType,vGiftsReceived.ID,vGiftsReceived.OriginalTransaction,vGiftsReceived.PaymentMethod,vGiftsReceived.SolicitorID,vGiftsReceived.TransactionDate,vGiftsReceived.TransactionNumber FROM vGiftsReceived
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vGivingHistory]'))
    DROP VIEW [dbo].[vGivingHistory]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE     VIEW [dbo].[vGivingHistory] AS
-- View of fundraising history.  This is a UNION of three selects because 
-- pledges made using a Cash account method are not visible in the SalesHistory,
-- and invoices may not be present at all.
--
-- The first SELECT statement pulls most of the information out of SalesHistory.
-- It assumes that Invoices are available -- if they are not, it finds nothing.
-- It gets the amount from the InvoiceLine.ExtendedPrice, and the outstanding balance from 
-- the difference between InvoiceLine.ExtendedPrice and the MonetaryApplications
-- applied to the invoice line.
select distinct h.BillToContactKey as DonorKey,
       min(i.InvoiceDate) as Date,
       max(h.InvoiceNumber) as 'InvoiceNumber',
       max(h.InvoiceLineNumber) as 'InvoiceLineNumber',
       p.ProductKey,
       pf.FundKey,
       h.SourceCodeKey,
       h.IsPledge,
       max(il.ExtendedPrice) as Amount,
	case 
	  when sum(ma1.Amount) is null then max(il.ExtendedPrice)
	  else max(il.ExtendedPrice) - sum(ma1.Amount) 
	  end
	as 'OutstandingBalance',
	case
	  when max(i.AccountingMethodCode) is not null then max(i.AccountingMethodCode)
	  else '-'
	end
	as 'AccountingMethod'
 from SalesHistory h
 join ProductMain p on h.ProductKey = p.ProductKey
 join ProductFundraising pf on p.ProductKey = pf.ProductKey
 join Fund f on pf.FundKey = f.FundKey
 join ProductType pt on p.ProductTypeKey = pt.ProductTypeKey
 join InvoiceMain i on h.OrderNumber = i.OrderNumber
 join InvoiceLine il on il.InvoiceKey = i.InvoiceKey
 left outer join MonetaryApplication ma1 on ma1.InvoiceLineKey = il.InvoiceLineKey
 where pt.Name = 'ProductFundraising'
	and il.ProductKey = h.ProductKey or il.ProductKey is null
   group by   h.SalesHistoryKey,  pf.FundKey, h.IsPledge, h.SourceCodeKey, h.BillToContactKey, p.ProductKey

-- The second SELECT statement pulls everything of SalesHistory, but only if
-- the corresponding invoice is not available.  The outstanding balance is assumed
-- to be zero.

UNION

select distinct h.BillToContactKey as DonorKey, 
	min(h.TransactionDate) as Date,
       max(h.InvoiceNumber) as 'InvoiceNumber',
       max(h.InvoiceLineNumber) as 'InvoiceLineNumber',
       p.ProductKey,
       pf.FundKey,
       h.SourceCodeKey,
       h.IsPledge,
        sum(h.ExtendedPrice) as Amount,
	0 as 'OutstandingBalance',
	'-' as 'AccountingMethod'
 from SalesHistory h
 join ProductMain p on h.ProductKey = p.ProductKey
 join ProductFundraising pf on p.ProductKey = pf.ProductKey
 join Fund f on pf.FundKey = f.FundKey
 join ProductType pt on p.ProductTypeKey = pt.ProductTypeKey
 left outer join InvoiceMain i on h.OrderNumber = i.OrderNumber
   where i.InvoiceKey is null
 group by    h.InvoiceNumber,  pf.FundKey, h.IsPledge, h.SourceCodeKey, h.BillToContactKey, p.ProductKey

UNION
--
-- The third SELECT statement pulls most of the information out of the Invoice
-- system where the invoice line represents a pledge and the accounting method is
-- cash; these are the conditions under which history data may not be available 
-- in the SalesHistory.
select i.BillToContactKey as DonorKey,
  max(i.InvoiceDate) as Date,
  max(i.InvoiceNumber) as 'InvoiceNumber',
  max(il.InvoiceLineNumber) as 'InvoiceLineNumber',
  p.ProductKey,
  pf.FundKey,
  case 
     when il.SourceCodeKey is null then i.SourceCodeKey
     else il.SourceCodeKey
     end
  as SourceCodeKey,
  '1' as IsPledge,
  max(il.ExtendedPrice) as Amount,
  case 
     when sum(ma1.Amount) is null then max(il.ExtendedPrice)
     else max(il.ExtendedPrice) - sum(ma1.Amount) 
  end
  as 'OutstandingBalance',
  max(i.AccountingMethodCode) as 'AccountingMethod'
 from InvoiceMain i
 join InvoiceLine il on il.InvoiceKey = i.InvoiceKey
 join ProductMain p on il.ProductKey = p.ProductKey
 join ProductFundraising pf on p.ProductKey = pf.ProductKey
 join Fund f on pf.FundKey = f.FundKey
 left outer join MonetaryApplication ma1 on ma1.InvoiceLineKey = il.InvoiceLineKey
 where il.IsPledge = 1
 and i.AccountingMethodCode = 'C'
 group by  il.InvoiceLineKey, i.SourceCodeKey,  il.SourceCodeKey, i.BillToContactKey, p.ProductKey, pf.FundKey

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoGivingHistory]'))
    DROP VIEW [dbo].[vBoGivingHistory]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoGivingHistory] AS SELECT vGivingHistory.AccountingMethod,vGivingHistory.Amount,vGivingHistory.Date,vGivingHistory.DonorKey,vGivingHistory.FundKey,vGivingHistory.InvoiceLineNumber,vGivingHistory.InvoiceNumber,vGivingHistory.IsPledge,vGivingHistory.OutstandingBalance,vGivingHistory.ProductKey,vGivingHistory.SourceCodeKey FROM vGivingHistory
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoGLAccount]'))
    DROP VIEW [dbo].[vBoGLAccount]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoGLAccount] AS SELECT GLAccount.Description,GLAccount.GLAccountCode,GLAccount.FinancialEntityKey,GLAccount.CreatedByUserKey,GLAccount.CreatedOn,GLAccount.GLAccountKey,GLAccount.SystemEntityKey,GLAccount.UpdatedByUserKey,GLAccount.UpdatedOn FROM GLAccount
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoGLAccountPurposeRef]'))
    DROP VIEW [dbo].[vBoGLAccountPurposeRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoGLAccountPurposeRef] AS SELECT GLAccountPurposeRef.GLAccountPurposeDesc,GLAccountPurposeRef.GLAccountPurposeCode FROM GLAccountPurposeRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoGLEntryTypeRef]'))
    DROP VIEW [dbo].[vBoGLEntryTypeRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoGLEntryTypeRef] AS SELECT GLEntryTypeRef.GLEntryTypeDesc,GLEntryTypeRef.GLEntryTypeCode FROM GLEntryTypeRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoGLExport]'))
    DROP VIEW [dbo].[vBoGLExport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoGLExport]
AS
SELECT GLExport.BeginDate,GLExport.CreatedByUserKey,GLExport.CreatedOn,GLExport.Description,GLExport.EndDate,GLExport.GLExportKey,GLExport.GLExportSummaryLevelCode,GLExport.Name,GLExport.RunNumber,GLExport.SystemEntityKey,GLExport.UpdatedByUserKey,GLExport.UpdatedOn,GLExport.FinancialEntityKey
  FROM GLExport
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vGLExportDetail]'))
    DROP VIEW [dbo].[vGLExportDetail]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vGLExportDetail]
AS
SELECT     dbo.GLExport.GLExportKey, dbo.GLTransactionMain.GLTransactionKey, dbo.GLTransactionMain.FiscalPeriod, 
                      dbo.GLTransactionMain.TransactionDate, MONTH(dbo.GLTransactionMain.TransactionDate) AS TransactionMonth, DAY(dbo.GLTransactionMain.TransactionDate) AS TransactionDay, YEAR(dbo.GLTransactionMain.TransactionDate) As TransactionYear, dbo.JournalEntryTypeRef.JournalEntryTypeCode, dbo.JournalEntryTypeRef.JournalEntryTypeName, 
                      dbo.GLTransactionLine.GLTransactionLineKey, ISNULL(dbo.GLTransactionLine.TargetGLAccountKey, dbo.GLTransactionLine.GLAccountKey) 
                      AS GLAccountKey, dbo.GLAccount.GLAccountCode AS GLAccountCode, 
                      dbo.GLTransactionLine.Amount, 
                      CASE WHEN dbo.GLTransactionLine.Amount <= 0.00 THEN 0 WHEN dbo.GLTransactionLine.Amount > 0 THEN dbo.GLTransactionLine.Amount END AS Debit,
                       CASE WHEN dbo.GLTransactionLine.Amount >= 0.00 THEN 0 WHEN dbo.GLTransactionLine.Amount < 0 THEN dbo.GLTransactionLine.Amount * - 1 END
                       AS Credit, dbo.GLTransactionLine.ProductKey, dbo.GLTransactionLine.Description
FROM         dbo.GLExport INNER JOIN dbo.GLExportItem ON dbo.GLExport.GLExportKey = dbo.GLExportItem.GLExportKey INNER JOIN
dbo.GLTransactionMain ON dbo.GLExportItem.GLTransactionKey = dbo.GLTransactionMain.GLTransactionKey INNER JOIN
                      dbo.GLTransactionLine ON dbo.GLTransactionMain.GLTransactionKey = dbo.GLTransactionLine.GLTransactionKey LEFT OUTER JOIN
                      dbo.JournalEntryTypeRef ON dbo.GLTransactionMain.JournalEntryTypeCode = dbo.JournalEntryTypeRef.JournalEntryTypeCode LEFT OUTER JOIN
                      dbo.GLAccount ON dbo.GLTransactionLine.GLAccountKey = dbo.GLAccount.GLAccountKey

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoGLExportDetail]'))
    DROP VIEW [dbo].[vBoGLExportDetail]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoGLExportDetail] AS SELECT vGLExportDetail.Amount,vGLExportDetail.Credit,vGLExportDetail.Debit,vGLExportDetail.Description,vGLExportDetail.FiscalPeriod,vGLExportDetail.GLAccountCode,vGLExportDetail.GLAccountKey,vGLExportDetail.GLExportKey,vGLExportDetail.GLTransactionKey,vGLExportDetail.GLTransactionLineKey,vGLExportDetail.JournalEntryTypeCode,vGLExportDetail.JournalEntryTypeName,vGLExportDetail.TransactionDate,vGLExportDetail.TransactionDay,vGLExportDetail.TransactionMonth,vGLExportDetail.TransactionYear,vGLExportDetail.ProductKey FROM vGLExportDetail
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoGLExportItem]'))
    DROP VIEW [dbo].[vBoGLExportItem]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoGLExportItem] AS SELECT GLExportItem.GLExportKey,GLExportItem.GLTransactionKey FROM GLExportItem
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoGLExportSummaryLevelRef]'))
    DROP VIEW [dbo].[vBoGLExportSummaryLevelRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoGLExportSummaryLevelRef] AS SELECT GLExportSummaryLevelRef.GLExportSummaryLevelCode,GLExportSummaryLevelRef.GLExportSummaryLevelDesc,GLExportSummaryLevelRef.GLExportSummaryLevelName FROM GLExportSummaryLevelRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoGLSourceItemTypeRef]'))
    DROP VIEW [dbo].[vBoGLSourceItemTypeRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoGLSourceItemTypeRef] AS SELECT GLSourceItemTypeRef.GLSourceItemTypeDesc,GLSourceItemTypeRef.GLSourceItemTypeCode FROM GLSourceItemTypeRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoGLTransaction]'))
    DROP VIEW [dbo].[vBoGLTransaction]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoGLTransaction] AS SELECT GLTransactionMain.FiscalPeriod,GLTransactionMain.GLTransactionKey,GLTransactionMain.TransactionDate,GLTransactionMain.FinancialEntityKey,GLTransactionMain.JournalEntryTypeCode,GLTransactionMain.ContactKey,GLTransactionMain.CreatedOn,GLTransactionMain.Description,GLTransactionMain.ExportedOn,GLTransactionMain.FinalBatchNumber,GLTransactionMain.InvoiceKey,GLTransactionMain.OriginatingBatchNumber,GLTransactionMain.PaymentKey FROM GLTransactionMain
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoGLTransactionLine]'))
    DROP VIEW [dbo].[vBoGLTransactionLine]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoGLTransactionLine] AS SELECT GLTransactionLine.GLAccountKey,GLTransactionLine.GLTransactionKey,GLTransactionLine.GLTransactionLineKey,GLTransactionLine.Amount,GLTransactionLine.DeferralProcessedFlag,GLTransactionLine.DeferralTermsKey,GLTransactionLine.Description,GLTransactionLine.ContactKey,GLTransactionLine.GLEntryType,GLTransactionLine.InvoiceLineKey,GLTransactionLine.PaymentKey,GLTransactionLine.ProductKey,GLTransactionLine.TransactionSequenceNumber,GLTransactionLine.LineGroup,GLTransactionLine.TargetGLAccountKey FROM GLTransactionLine
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vGLTransReport]'))
    DROP VIEW [dbo].[vGLTransReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vGLTransReport]
AS
SELECT     GLTL.GLTransactionLineKey, GLTL.Amount, GLTL.Description, GLTL.ProductKey, GLTL.GLTransactionKey, 
                      GLTL.GLAccountKey, GLTL.DeferralTermsKey, GLTL.DeferralProcessedFlag, GLTL.TargetGLAccountKey, 
                      GLTL.InvoiceLineKey, GLTL.GLEntryType AS EntryType, GLTM.TransactionDate, GLA.GLAccountCode, 
                      GLA.Description AS GLAccountName, IM.InvoiceNumber, IM.InvoiceKey, IM.InvoiceDate, IM.InvoiceTypeCode, OM.OrderKey, OM.OrderNumber, 
                      OM.OrderDate, OM.PurchaseOrderNumber, OM.OrigInvoiceNumber, IM.AccountingMethodCode
FROM         dbo.GLTransactionLine GLTL INNER JOIN
                      dbo.GLTransactionMain GLTM ON GLTL.GLTransactionKey = GLTM.GLTransactionKey INNER JOIN
                      dbo.GLAccount GLA ON GLTL.GLAccountKey = GLA.GLAccountKey INNER JOIN
                      dbo.InvoiceMain IM ON GLTM.InvoiceKey = IM.InvoiceKey INNER JOIN
                      dbo.OrderMain OM ON IM.OrderNumber = OM.OrderNumber

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoGLTransReport]'))
    DROP VIEW [dbo].[vBoGLTransReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoGLTransReport] AS SELECT vGLTransReport.Amount,vGLTransReport.DeferralProcessedFlag,vGLTransReport.DeferralTermsKey,vGLTransReport.Description,vGLTransReport.EntryType,vGLTransReport.GLAccountCode,vGLTransReport.GLAccountKey,vGLTransReport.GLAccountName,vGLTransReport.GLTransactionKey,vGLTransReport.GLTransactionLineKey,vGLTransReport.InvoiceDate,vGLTransReport.InvoiceKey,vGLTransReport.InvoiceNumber,vGLTransReport.OrderDate,vGLTransReport.OrderKey,vGLTransReport.OrderNumber,vGLTransReport.OrigInvoiceNumber,vGLTransReport.PurchaseOrderNumber,vGLTransReport.TransactionDate,vGLTransReport.InvoiceTypeCode,vGLTransReport.AccountingMethodCode,vGLTransReport.InvoiceLineKey,vGLTransReport.ProductKey,vGLTransReport.TargetGLAccountKey FROM vGLTransReport
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoGrade]'))
    DROP VIEW [dbo].[vBoGrade]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoGrade] AS SELECT GradeRef.GradeKey,GradeRef.GradeValue AS Value FROM GradeRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoGroup]'))
    DROP VIEW [dbo].[vBoGroup]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoGroup] AS SELECT GroupMain.Description,GroupMain.Name,GroupMain.UpdatedByUserKey,GroupMain.UpdatedOn,GroupMain.IsSystem,GroupMain.GroupTypeKey,GroupMain.OwnerAccessKey,GroupMain.OverrideOwnerGroupKey,GroupMain.Priority,GroupMain.IsAutoGenerated,GroupMain.AccessKey,GroupMain.CreatedByUserKey,GroupMain.CreatedOn,GroupMain.GroupKey,GroupMain.SystemEntityKey,GroupMain.IsInvitationOnly,GroupMain.IsSimpleGroup,GroupMain.IsSingleRole,GroupMain.GroupStatusCode AS StatusCode,GroupMain.InheritRolesFlag AS InheritRoles FROM GroupMain
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vGroupInfo]'))
    DROP VIEW [dbo].[vGroupInfo]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE VIEW [dbo].[vGroupInfo] WITH SCHEMABINDING 
AS 
SELECT t.[GroupTypeKey], t.[GroupTypeName], t.[GroupTypeDesc], t.[IsSimpleGroup], t.[IsDateLimited], 
       g.[GroupKey], g.[Name] AS [GroupName], g.[Description] AS [GroupDesc], g.[IsAutoGenerated], g.[GroupStatusCode], g.[InheritRolesFlag],
       m.[GroupMemberKey], m.[MemberContactKey], m.[IsActive] AS [IsActiveMember], m.[JoinDate], m.[DropDate]
  FROM [dbo].[GroupMember] m
       INNER JOIN [dbo].[GroupMain] g ON m.[GroupKey] = g.[GroupKey]
       INNER JOIN [dbo].[GroupTypeRef] t ON g.[GroupTypeKey] = t.[GroupTypeKey]


GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoGroupInfo]'))
    DROP VIEW [dbo].[vBoGroupInfo]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoGroupInfo] AS SELECT vGroupInfo.DropDate,vGroupInfo.GroupDesc,vGroupInfo.GroupKey,vGroupInfo.GroupMemberKey,vGroupInfo.GroupName,vGroupInfo.GroupStatusCode,vGroupInfo.GroupTypeDesc,vGroupInfo.GroupTypeKey,vGroupInfo.GroupTypeName,vGroupInfo.InheritRolesFlag,vGroupInfo.IsActiveMember,vGroupInfo.IsAutoGenerated,vGroupInfo.IsDateLimited,vGroupInfo.IsSimpleGroup,vGroupInfo.JoinDate,vGroupInfo.MemberContactKey FROM vGroupInfo
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoGroupInstanceRole]'))
    DROP VIEW [dbo].[vBoGroupInstanceRole]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoGroupInstanceRole] AS SELECT GroupInstanceRole.GroupKey,GroupInstanceRole.GroupRoleKey,GroupInstanceRole.IsRequired,GroupInstanceRole.SortRank,GroupInstanceRole.IsUnique,GroupInstanceRole.DefaultMemberStatusCode,GroupInstanceRole.IsDefault,GroupInstanceRole.GroupInstanceRoleKey FROM GroupInstanceRole
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vOpportunityReport]'))
    DROP VIEW [dbo].[vOpportunityReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vOpportunityReport]
AS

SELECT OM.Id AS OpportunityId, OM.Description AS OpportunityName, OSR.OpportunityStatusName AS OpportunityStatus, OT.Name AS OpportunityType, 
       OT.OpportunityClass, OM.CurrentActionPlanStageName AS CurrentStage, OM.WinProbability, OM.ExpirationDate, OM.UpdatedOn, OM.CreatedOn, 
       CASE WHEN OMS.DecisionDate IS NOT NULL THEN OMS.DecisionDate WHEN OMD.DecisionDate IS NOT NULL 
       THEN OMD.DecisionDate WHEN OMM.DecisionDate IS NOT NULL THEN OMM.DecisionDate END AS DecisionDate, 
       CASE WHEN OMS.ResponseMedia IS NOT NULL THEN OMS.ResponseMedia WHEN OMD.ResponseMedia IS NOT NULL 
       THEN OMD.ResponseMedia WHEN OMM.ResponseMedia IS NOT NULL THEN OMM.ResponseMedia END AS ResponseMedia, 
       CASE WHEN OMS.TimingProbability IS NOT NULL THEN OMS.TimingProbability WHEN OMD.TimingProbability IS NOT NULL 
       THEN OMD.TimingProbability WHEN OMM.TimingProbability IS NOT NULL THEN OMM.TimingProbability END AS TimingProbability, 
       CASE WHEN OMS.ActualSales IS NOT NULL THEN OMS.ActualSales WHEN OMD.Actual IS NOT NULL 
       THEN OMD.Actual WHEN OMM.Actual IS NOT NULL THEN OMM.Actual END AS Actual, CASE WHEN OMS.PotentialSales IS NOT NULL 
       THEN OMS.PotentialSales WHEN OMD.Potential IS NOT NULL THEN OMD.Potential WHEN OMM.Potential IS NOT NULL 
       THEN OMM.Potential END AS Potential, CASE WHEN OMS.Quality IS NOT NULL THEN OMS.Quality WHEN OMD.Quality IS NOT NULL 
       THEN OMD.Quality WHEN OMM.Quality IS NOT NULL THEN OMM.Quality END AS Quality, CASE WHEN OMS. Product IS NOT NULL 
       THEN OMS. Product WHEN OMD.Distribution IS NOT NULL THEN OMD.Distribution WHEN OMM.Subscription IS NOT NULL 
       THEN OMM.Subscription END AS ProductInterest, CASE WHEN OMS.Units IS NOT NULL THEN OMS.Units WHEN OMM.Units IS NOT NULL 
       THEN OMM.Units ELSE 0 END AS Units, P.ID AS ProspectId, P.FullName AS ProspectName, I.InstituteName AS ProspectCompany, 
       G.Name AS GroupName, G.GroupTypeKey, CSM.ID AS OwnerId, CSM.FullName AS OwnerName, GRR.GroupRoleName AS OwnerRole, 
       OM.OpportunityKey, OT.OpportunityTypeKey, OM.OpportunityOwnerGroupKey, OM.OpportunityContactGroupKey, OM.SourceCodeKey
FROM dbo.OpportunityMain AS OM INNER JOIN
     dbo.OpportunityType AS OT ON OM.OpportunityTypeKey = OT.OpportunityTypeKey LEFT OUTER JOIN
     dbo.OpportunityStatusRef AS OSR ON OM.OpportunityStatusCode = OSR.OpportunityStatusCode LEFT OUTER JOIN
     dbo.OpportunityMainSales AS OMS ON OM.OpportunityKey = OMS.OpportunityKey LEFT OUTER JOIN
     dbo.OpportunityMainDonor AS OMD ON OM.OpportunityKey = OMD.OpportunityKey LEFT OUTER JOIN
     dbo.OpportunityMainMember AS OMM ON OM.OpportunityKey = OMM.OpportunityKey LEFT OUTER JOIN
     dbo.ContactMain AS P ON OM.ProspectKey = P.ContactKey LEFT OUTER JOIN
     dbo.Institute AS I ON P.ContactKey = I.ContactKey LEFT OUTER JOIN
     dbo.GroupMain AS G ON OM.OpportunityOwnerGroupKey = G.GroupKey INNER JOIN
     dbo.GroupMember AS GM ON G.GroupKey = GM.GroupKey LEFT OUTER JOIN
     dbo.ContactMain AS CSM ON GM.MemberContactKey = CSM.ContactKey LEFT OUTER JOIN
     dbo.GroupMemberDetail AS GMD ON GM.GroupMemberKey = GMD.GroupMemberKey LEFT OUTER JOIN
     dbo.GroupRoleRef AS GRR ON GMD.GroupRoleKey = GRR.GroupRoleKey
UNION
SELECT OM.Id AS OpportunityId, OM.Description AS OpportunityName, OSR.OpportunityStatusName AS OpportunityStatus, OT.Name AS OpportunityType, 
       OT.OpportunityClass, OM.CurrentActionPlanStageName AS CurrentStage, OM.WinProbability, OM.ExpirationDate, OM.UpdatedOn, OM.CreatedOn, 
       CASE WHEN OMS.DecisionDate IS NOT NULL THEN OMS.DecisionDate WHEN OMD.DecisionDate IS NOT NULL 
       THEN OMD.DecisionDate WHEN OMM.DecisionDate IS NOT NULL THEN OMM.DecisionDate END AS DecisionDate, 
       CASE WHEN OMS.ResponseMedia IS NOT NULL THEN OMS.ResponseMedia WHEN OMD.ResponseMedia IS NOT NULL 
       THEN OMD.ResponseMedia WHEN OMM.ResponseMedia IS NOT NULL THEN OMM.ResponseMedia END AS ResponseMedia, 
       CASE WHEN OMS.TimingProbability IS NOT NULL THEN OMS.TimingProbability WHEN OMD.TimingProbability IS NOT NULL 
       THEN OMD.TimingProbability WHEN OMM.TimingProbability IS NOT NULL THEN OMM.TimingProbability END AS TimingProbability, 
       CASE WHEN OMS.ActualSales IS NOT NULL THEN OMS.ActualSales WHEN OMD.Actual IS NOT NULL 
       THEN OMD.Actual WHEN OMM.Actual IS NOT NULL THEN OMM.Actual END AS Actual, CASE WHEN OMS.PotentialSales IS NOT NULL 
       THEN OMS.PotentialSales WHEN OMD.Potential IS NOT NULL THEN OMD.Potential WHEN OMM.Potential IS NOT NULL 
       THEN OMM.Potential END AS Potential, CASE WHEN OMS.Quality IS NOT NULL THEN OMS.Quality WHEN OMD.Quality IS NOT NULL 
       THEN OMD.Quality WHEN OMM.Quality IS NOT NULL THEN OMM.Quality END AS Quality, CASE WHEN OMS. Product IS NOT NULL 
       THEN OMS. Product WHEN OMD.Distribution IS NOT NULL THEN OMD.Distribution WHEN OMM.Subscription IS NOT NULL 
       THEN OMM.Subscription END AS ProductInterest, CASE WHEN OMS.Units IS NOT NULL THEN OMS.Units WHEN OMM.Units IS NOT NULL 
       THEN OMM.Units ELSE 0 END AS Units, P.ID AS ProspectId, P.FullName AS ProspectName, I.InstituteName AS ProspectCompany, 
       G.Name AS GroupName, G.GroupTypeKey, CSM.ID AS OwnerId, CSM.FullName AS OwnerName, GRR.GroupRoleName AS OwnerRole, 
       OM.OpportunityKey, OT.OpportunityTypeKey, OM.OpportunityOwnerGroupKey, OM.OpportunityContactGroupKey, OM.SourceCodeKey
FROM dbo.OpportunityMain AS OM INNER JOIN
     dbo.OpportunityType AS OT ON OM.OpportunityTypeKey = OT.OpportunityTypeKey LEFT OUTER JOIN
     dbo.OpportunityStatusRef AS OSR ON OM.OpportunityStatusCode = OSR.OpportunityStatusCode LEFT OUTER JOIN
     dbo.OpportunityMainSales AS OMS ON OM.OpportunityKey = OMS.OpportunityKey LEFT OUTER JOIN
     dbo.OpportunityMainDonor AS OMD ON OM.OpportunityKey = OMD.OpportunityKey LEFT OUTER JOIN
     dbo.OpportunityMainMember AS OMM ON OM.OpportunityKey = OMM.OpportunityKey LEFT OUTER JOIN
     dbo.ContactMain AS P ON OM.ProspectKey = P.ContactKey LEFT OUTER JOIN
     dbo.Institute AS I ON P.ContactKey = I.ContactKey LEFT OUTER JOIN
     dbo.GroupMain AS G ON OM.OpportunityContactGroupKey = G.GroupKey INNER JOIN
     dbo.GroupMember AS GM ON G.GroupKey = GM.GroupKey LEFT OUTER JOIN
     dbo.ContactMain AS CSM ON GM.MemberContactKey = CSM.ContactKey LEFT OUTER JOIN
     dbo.GroupMemberDetail AS GMD ON GM.GroupMemberKey = GMD.GroupMemberKey LEFT OUTER JOIN
     dbo.GroupRoleRef AS GRR ON GMD.GroupRoleKey = GRR.GroupRoleKey

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vGroupLinkReport]'))
    DROP VIEW [dbo].[vGroupLinkReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vGroupLinkReport]
AS
SELECT o.OpportunityId, o2.OwnerName AS RegionalManager, o3.OwnerName AS Salesman, o.OpportunityOwnerGroupKey, o.OpportunityKey
FROM (SELECT DISTINCT OpportunityId, OpportunityOwnerGroupKey, OpportunityKey
      FROM  dbo.vOpportunityReport
      WHERE (OwnerRole = 'Regional Manager') OR (OwnerRole = 'Salesperson')) AS o LEFT OUTER JOIN
           dbo.vOpportunityReport AS o2 ON o.OpportunityOwnerGroupKey = o2.OpportunityOwnerGroupKey AND 
            o2.OwnerRole = 'Regional Manager' LEFT OUTER JOIN
            dbo.vOpportunityReport AS o3 ON o.OpportunityOwnerGroupKey = o3.OpportunityOwnerGroupKey AND o3.OwnerRole = 'Salesperson'

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoGroupLinkReport]'))
    DROP VIEW [dbo].[vBoGroupLinkReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoGroupLinkReport] AS SELECT vGroupLinkReport.OpportunityId,vGroupLinkReport.OpportunityKey,vGroupLinkReport.OpportunityOwnerGroupKey,vGroupLinkReport.RegionalManager,vGroupLinkReport.Salesman FROM vGroupLinkReport
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoGroupMember]'))
    DROP VIEW [dbo].[vBoGroupMember]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoGroupMember] AS SELECT GroupMember.CreatedByUserKey,GroupMember.CreatedOn,GroupMember.DropDate,GroupMember.GroupKey,GroupMember.GroupMemberKey,GroupMember.JoinDate,GroupMember.MemberContactKey,GroupMember.UpdatedByUserKey,GroupMember.UpdatedOn,GroupMember.IsActive FROM GroupMember
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoGroupMemberDetail]'))
    DROP VIEW [dbo].[vBoGroupMemberDetail]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoGroupMemberDetail] AS SELECT GroupMemberDetail.CreatedByUserKey,GroupMemberDetail.CreatedOn,GroupMemberDetail.EffectiveDate,GroupMemberDetail.ExpirationDate,GroupMemberDetail.GroupMemberKey,GroupMemberDetail.GroupRoleKey,GroupMemberDetail.UpdatedByUserKey,GroupMemberDetail.UpdatedOn,GroupMemberDetail.TypeSpecificData,GroupMemberDetail.TypeSpecificFlag,GroupMemberDetail.TypeSpecificKey,GroupMemberDetail.TypeSpecificInt,GroupMemberDetail.GroupMemberStatusCode,GroupMemberDetail.IsActive,GroupMemberDetail.GroupMemberDetailKey,GroupMemberDetail.GroupKey FROM GroupMemberDetail
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoGroupMemberOptions]'))
    DROP VIEW [dbo].[vBoGroupMemberOptions]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoGroupMemberOptions] AS SELECT GroupMemberOptions.GroupBillingFullAddressKey,GroupMemberOptions.GroupContactFullAddressKey,GroupMemberOptions.GroupMemberKey,GroupMemberOptions.OptOutFlag FROM GroupMemberOptions
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoGroupMemberStatusRef]'))
    DROP VIEW [dbo].[vBoGroupMemberStatusRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoGroupMemberStatusRef] AS SELECT GroupMemberStatusRef.GroupMemberStatusCode,GroupMemberStatusRef.IsActiveStatus,GroupMemberStatusRef.GroupMemberStatusDesc AS Description FROM GroupMemberStatusRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoGroupPerspective]'))
    DROP VIEW [dbo].[vBoGroupPerspective]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoGroupPerspective] AS SELECT GroupPerspective.GroupKey,GroupPerspective.GroupPerspectiveKey,GroupPerspective.IsDefaultFlag AS IsDefault,GroupPerspective.PerspectiveKey FROM GroupPerspective
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vGroupReport]'))
    DROP VIEW [dbo].[vGroupReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vGroupReport]
AS
SELECT     G.Description AS GroupDescription, G.IsSystem, G.IsAutoGenerated, G.Priority, G.IsInvitationOnly, GSR.GroupStatusDesc, G.IsSimpleGroup, 
                      G.InheritRolesFlag, G.IsSingleRole, GM.JoinDate, GM.DropDate, GMD.GroupMemberStatusCode, GMSR.GroupMemberStatusDesc, GMD.EffectiveDate, 
                      GMD.ExpirationDate, GMD.IsActive, GMD.TypeSpecificData, GRR.GroupRoleDesc, G.GroupKey, GM.GroupMemberKey, GM.MemberContactKey, 
                      G.SystemEntityKey, G.Name AS GroupName, GTR.GroupTypeName
FROM         dbo.GroupMain AS G LEFT OUTER JOIN
                      dbo.GroupMember AS GM ON G.GroupKey = GM.GroupKey LEFT OUTER JOIN
                      dbo.GroupMemberDetail AS GMD ON GM.GroupMemberKey = GMD.GroupMemberKey INNER JOIN
                      dbo.GroupTypeRef AS GTR ON G.GroupTypeKey = GTR.GroupTypeKey LEFT OUTER JOIN
                      dbo.GroupRoleRef AS GRR ON GMD.GroupRoleKey = GRR.GroupRoleKey LEFT OUTER JOIN
                      dbo.GroupStatusRef AS GSR ON GSR.GroupStatusCode = G.GroupStatusCode LEFT OUTER JOIN
                      dbo.GroupMemberStatusRef AS GMSR ON GMD.GroupMemberStatusCode = GMSR.GroupMemberStatusCode

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoGroupReport]'))
    DROP VIEW [dbo].[vBoGroupReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoGroupReport] AS SELECT vGroupReport.GroupKey,vGroupReport.GroupMemberKey,vGroupReport.GroupName,vGroupReport.MemberContactKey,vGroupReport.GroupTypeName,vGroupReport.DropDate,vGroupReport.GroupMemberStatusCode,vGroupReport.GroupRoleDesc,vGroupReport.GroupStatusDesc,vGroupReport.IsActive,vGroupReport.JoinDate,vGroupReport.TypeSpecificData,vGroupReport.EffectiveDate,vGroupReport.ExpirationDate,vGroupReport.InheritRolesFlag,vGroupReport.IsAutoGenerated,vGroupReport.IsInvitationOnly,vGroupReport.IsSimpleGroup,vGroupReport.IsSingleRole,vGroupReport.IsSystem,vGroupReport.Priority,vGroupReport.SystemEntityKey,vGroupReport.GroupDescription,vGroupReport.GroupMemberStatusDesc FROM vGroupReport
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoGroupRoleRef]'))
    DROP VIEW [dbo].[vBoGroupRoleRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoGroupRoleRef] AS SELECT GroupRoleRef.GroupRoleDesc AS Description,GroupRoleRef.GroupRoleKey,GroupRoleRef.IsActive,GroupRoleRef.IsSystem,GroupRoleRef.GroupRoleName AS Name FROM GroupRoleRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoGroupStatusRef]'))
    DROP VIEW [dbo].[vBoGroupStatusRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoGroupStatusRef] AS SELECT GroupStatusRef.GroupStatusCode,GroupStatusRef.GroupStatusDesc AS Description,GroupStatusRef.IsActiveStatus,GroupStatusRef.IsDefault FROM GroupStatusRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoGroupTypeMemberStatus]'))
    DROP VIEW [dbo].[vBoGroupTypeMemberStatus]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoGroupTypeMemberStatus] AS SELECT GroupTypeMemberStatus.GroupMemberStatusCode,GroupTypeMemberStatus.GroupTypeKey,GroupTypeMemberStatus.IsActiveStatus,GroupTypeMemberStatus.Priority,GroupTypeMemberStatus.GroupTypeMemberStatusKey FROM GroupTypeMemberStatus
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoGroupTypeRef]'))
    DROP VIEW [dbo].[vBoGroupTypeRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoGroupTypeRef] AS SELECT GroupTypeRef.GroupTypeKey,GroupTypeRef.IsDateLimited,GroupTypeRef.IsPaymentRequired,GroupTypeRef.IsSystem,GroupTypeRef.DefaultGroupStatusCode,GroupTypeRef.IsInvitationOnly,GroupTypeRef.IsSimpleGroup,GroupTypeRef.MemberQueryFolderKey,GroupTypeRef.GroupMemberBranchName,GroupTypeRef.InheritRolesFlag,GroupTypeRef.IsSingleRole,GroupTypeRef.GroupTypeDesc AS Description,GroupTypeRef.GroupTypeName AS Name,GroupTypeRef.CreatedByUserKey,GroupTypeRef.CreatedOn,GroupTypeRef.UpdatedByUserKey,GroupTypeRef.UpdatedOn,GroupTypeRef.LandingPageContentKey FROM GroupTypeRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoGroupTypeRole]'))
    DROP VIEW [dbo].[vBoGroupTypeRole]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoGroupTypeRole] AS SELECT GroupTypeRole.GroupRoleKey,GroupTypeRole.GroupTypeKey,GroupTypeRole.IsRequired,GroupTypeRole.SortRank,GroupTypeRole.IsUnique,GroupTypeRole.DefaultMemberStatusCode,GroupTypeRole.IsDefault,GroupTypeRole.IsSystem,GroupTypeRole.GroupTypeRoleKey FROM GroupTypeRole
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoHandlingPrice]'))
    DROP VIEW [dbo].[vBoHandlingPrice]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoHandlingPrice] AS SELECT HandlingPrice.CreatedByUserKey,HandlingPrice.CreatedOn,HandlingPrice.HandlingPriceKey,HandlingPrice.Price,HandlingPrice.HandlingPriceCode,HandlingPrice.MinAmount,HandlingPrice.UpdatedByUserKey,HandlingPrice.UpdatedOn FROM HandlingPrice
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoHandlingPriceRef]'))
    DROP VIEW [dbo].[vBoHandlingPriceRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoHandlingPriceRef] AS SELECT HandlingPriceRef.HandlingPriceCode,HandlingPriceRef.HandlingPriceDesc,HandlingPriceRef.DisplayPrompt FROM HandlingPriceRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoHierarchy]'))
    DROP VIEW [dbo].[vBoHierarchy]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoHierarchy] AS SELECT Hierarchy.Depth,Hierarchy.HierarchyKey,Hierarchy.IsChildAMemberOfParent,Hierarchy.ParentHierarchyKey,Hierarchy.RootHierarchyKey,Hierarchy.SortOrder,Hierarchy.UniformKey,Hierarchy.UniformType,Hierarchy.HierarchyCode FROM Hierarchy
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoHierarchyRoot]'))
    DROP VIEW [dbo].[vBoHierarchyRoot]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoHierarchyRoot] AS SELECT HierarchyRoot.RootHierarchyKey AS HierarchyRootKey,HierarchyRoot.HierarchyRootName AS Name,HierarchyRoot.HierarchyRootDescription AS Description,HierarchyRoot.UniformType,HierarchyRoot.OrganizationKey,HierarchyRoot.AccessKey,HierarchyRoot.CreatedByUserKey,HierarchyRoot.CreatedOn,HierarchyRoot.UpdatedByUserKey,HierarchyRoot.UpdatedOn FROM HierarchyRoot
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoHINonPhysicalContactAddress]'))
    DROP VIEW [dbo].[vBoHINonPhysicalContactAddress]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoHINonPhysicalContactAddress] AS SELECT AddressMain.AddressStatusCode,AddressMain.BadAddressReasonKey,AddressMain.FormattedAddress,ContactAddress.AddressCategoryCode,ContactAddress.AddressKey,ContactAddress.AddressTypeKey,ContactAddress.ContactAddressKey,ContactAddress.ContactKey,AddressTypeRef.DisplayOrder AS AddressTypeDisplayOrder FROM ContactAddress
	INNER JOIN AddressMain
		ON ContactAddress.AddressKey = AddressMain.AddressKey
	INNER JOIN AddressTypeRef
		ON ContactAddress.AddressTypeKey = AddressTypeRef.AddressTypeKey
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoHoldCode]'))
    DROP VIEW [dbo].[vBoHoldCode]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoHoldCode] AS SELECT HoldCode.Code,HoldCode.HoldCodeKey,HoldCode.OrganizationKey,HoldCode.Reason FROM HoldCode
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoIndividual]'))
    DROP VIEW [dbo].[vBoIndividual]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoIndividual] AS SELECT ContactMain.ContactStatusCode,ContactMain.FullName,ContactMain.NoSolicitationFlag AS NoSolicitation,ContactMain.SortName,ContactMain.SyncContactID,ContactMain.TaxIDNumber,ContactMain.UpdatedByUserKey,ContactMain.UpdatedOn,ContactMain.ID,ContactMain.PreferredAddressCategoryCode,ContactMain.IsSortNameOverridden,ContactMain.IsInstitute,ContactMain.AccessKey,ContactMain.ContactKey,ContactMain.CreatedByUserKey,ContactMain.CreatedOn,ContactMain.MajorKey,ContactMain.PrimaryMembershipGroupKey,ContactMain.TextOnlyEmailFlag,ContactMain.ContactTypeKey,ContactMain.IsIDEditable,ContactMain.OptOutFlag AS OptOut,Individual.BirthDate,Individual.FirstName,Individual.Gender,Individual.Informal,Individual.LastName,Individual.MiddleName,Individual.PrefixCode,Individual.SuffixCode,Individual.Designation,Individual.PrimaryInstituteContactKey,Individual.PrimaryInstituteName,Individual.PrimaryInstituteTitle FROM ContactMain
	INNER JOIN Individual
		ON ContactMain.ContactKey = Individual.ContactKey
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoInstitute]'))
    DROP VIEW [dbo].[vBoInstitute]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoInstitute] AS SELECT ContactMain.ContactStatusCode,ContactMain.FullName,ContactMain.NoSolicitationFlag AS NoSolicitation,ContactMain.SortName,ContactMain.SyncContactID,ContactMain.TaxIDNumber,ContactMain.UpdatedByUserKey,ContactMain.UpdatedOn,ContactMain.ID,ContactMain.PreferredAddressCategoryCode,ContactMain.IsSortNameOverridden,ContactMain.IsInstitute,ContactMain.AccessKey,ContactMain.ContactKey,ContactMain.CreatedByUserKey,ContactMain.CreatedOn,ContactMain.MajorKey,ContactMain.PrimaryMembershipGroupKey,ContactMain.TextOnlyEmailFlag,ContactMain.ContactTypeKey,ContactMain.IsIDEditable,ContactMain.OptOutFlag AS OptOut,Institute.InstituteGroupKey,Institute.InstituteName,Institute.PrimaryContactKey FROM ContactMain
	INNER JOIN Institute
		ON ContactMain.ContactKey = Institute.ContactKey WHERE ContactMain.IsInstitute = 1
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoIntervalTypeRef]'))
    DROP VIEW [dbo].[vBoIntervalTypeRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoIntervalTypeRef] AS SELECT IntervalTypeRef.IntervalTypeCode,IntervalTypeRef.IntervalTypeDesc,IntervalTypeRef.IntervalTypeName FROM IntervalTypeRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoInventoryBackOrder]'))
    DROP VIEW [dbo].[vBoInventoryBackOrder]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoInventoryBackOrder] AS SELECT InventoryBackOrder.BackOrderKey,InventoryBackOrder.DateBackOrdered,InventoryBackOrder.OrderLineKey,InventoryBackOrder.ProductKey,InventoryBackOrder.QtyBackOrdered FROM InventoryBackOrder
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vInventoryCOGSReport]'))
    DROP VIEW [dbo].[vInventoryCOGSReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW  [dbo].[vInventoryCOGSReport]
AS
SELECT	
	PM.ProductKey, PM.ProductCode, PM.Name AS ProductName, PGLA.ProductGLAccountKey,
	(Select GA.GLAccountKey Where PGLA.GLAccountPurposeCode = 'COG') as COGSGLAccountKey, 
	(Select GA.GLAccountCode Where PGLA.GLAccountPurposeCode = 'COG') as COGSAcCode,	
	(Select GA.Description Where PGLA.GLAccountPurposeCode = 'COG') as  COGSAcDesc,
	PW.QuantityCommitted, GLTL.Description AS TransLineDesc, GLTL.Amount, GLTL.GLTransactionKey, 
	GLTM.TransactionDate, GLTM.FiscalPeriod, WH.Description as Warehouse

FROM	ProductMain PM 
	LEFT OUTER JOIN ProductWarehouse PW  ON PM.ProductKey = PW.ProductKey 
	LEFT OUTER JOIN ProductGLAccount PGLA ON PM.ProductKey = PGLA.ParentKey 
	LEFT OUTER JOIN GLAccount GA ON PGLA.GLAccountKey = GA.GLAccountKey 
	LEFT OUTER JOIN GLTransactionLine GLTL ON GA.GLAccountKey = GLTL.GLAccountKey 
	LEFT OUTER JOIN GLTransactionMain GLTM ON GLTL.GLTransactionKey = GLTM.GLTransactionKey 
	LEFT OUTER JOIN Warehouse WH ON PW.WarehouseKey = WH.WarehouseKey

WHERE	
	(GLTL.Description = 'Fulfilled' OR
     GLTL.Description = 'Return')

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoInventoryCOGSReport]'))
    DROP VIEW [dbo].[vBoInventoryCOGSReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoInventoryCOGSReport] AS SELECT vInventoryCOGSReport.Amount,vInventoryCOGSReport.COGSAcCode,vInventoryCOGSReport.COGSAcDesc,vInventoryCOGSReport.COGSGLAccountKey,vInventoryCOGSReport.FiscalPeriod,vInventoryCOGSReport.GLTransactionKey,vInventoryCOGSReport.ProductCode,vInventoryCOGSReport.ProductGLAccountKey,vInventoryCOGSReport.ProductKey,vInventoryCOGSReport.ProductName,vInventoryCOGSReport.QuantityCommitted,vInventoryCOGSReport.TransactionDate,vInventoryCOGSReport.TransLineDesc,vInventoryCOGSReport.Warehouse FROM vInventoryCOGSReport
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoInventoryLocation]'))
    DROP VIEW [dbo].[vBoInventoryLocation]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoInventoryLocation] AS SELECT InventoryLocation.Description,InventoryLocation.Name,InventoryLocation.IsDefault,InventoryLocation.BinNumber,InventoryLocation.CreatedByUserKey,InventoryLocation.CreatedOn,InventoryLocation.LocationKey,InventoryLocation.UpdatedByUserKey,InventoryLocation.UpdatedOn,InventoryLocation.WarehouseKey FROM InventoryLocation
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vInventoryLogReport]'))
    DROP VIEW [dbo].[vInventoryLogReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vInventoryLogReport]
AS
SELECT     
	ITLL.InventoryTransactionLogLineKey, ITLL.TransactionTypeCode, ITLL.ProductDescription, ITLL.Quantity AS LogLineQty, ITLL.QuantityOrdered, 
	ITLL.LotId, ITLL.PurchaseOrderNumber, ITLL.LandedCost, ITLL.TransactionMessage, ITLL.SortOrder, ITLL.TotalCost AS LogLineTotalCost, ITLL.UomKey,
	ITLM.InventoryTransactionLogKey, ITLM.TransactionDate, ITLM.OrderNumber, ITLM.Vendor, ITLM.ReceiptNumber, ITLM.ReturnAuthorization, 
	ITLM.Notes, PM.ProductKey, PM.ProductCode, PM.Name AS ProductName, OL.OrderLineKey, OL.QuantityShipped, OL.UnitPrice, OL.ExtendedPrice, 
	TTR.TransactionTypeDesc, U.Name AS UomName, U.Description AS UomDesc, 
	IL.BinNumber, WH.Description AS Warehouse,UC.FromUomKey, UC.ToUomKey, UC.ConversionFactor, OL.UomKey AS OrderLineUomKey
FROM    InventoryTransactionLogLine ITLL 
	LEFT OUTER JOIN InventoryTransactionLogMain ITLM ON ITLL.InventoryTransactionLogKey = ITLM.InventoryTransactionLogKey 
	LEFT OUTER JOIN OrderLine OL ON ITLL.OrderLineKey = OL.OrderLineKey 
	LEFT OUTER JOIN ProductMain PM ON ITLL.ProductKey = PM.ProductKey 
	LEFT OUTER JOIN TransactionTypeRef TTR ON ITLL.TransactionTypeCode = TTR.TransactionTypeCode 
	LEFT OUTER JOIN Uom U ON ITLL.UomKey = U.UomKey 
	LEFT OUTER JOIN InventoryLocation IL ON ITLL.InventoryLocationKey = IL.LocationKey 
	LEFT OUTER JOIN Warehouse WH ON ITLL.WarehouseKey = WH.WarehouseKey 
	LEFT OUTER JOIN UomConversion UC ON ITLL.UomKey = UC.FromUomKey OR ITLL.UomKey = UC.ToUomKey

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoInventoryLogReport]'))
    DROP VIEW [dbo].[vBoInventoryLogReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoInventoryLogReport] AS SELECT vInventoryLogReport.BinNumber,vInventoryLogReport.ConversionFactor,vInventoryLogReport.ExtendedPrice,vInventoryLogReport.FromUomKey,vInventoryLogReport.InventoryTransactionLogKey,vInventoryLogReport.InventoryTransactionLogLineKey,vInventoryLogReport.LandedCost,vInventoryLogReport.LogLineQty,vInventoryLogReport.LogLineTotalCost,vInventoryLogReport.LotId,vInventoryLogReport.Notes,vInventoryLogReport.OrderLineKey,vInventoryLogReport.OrderNumber,vInventoryLogReport.ProductCode,vInventoryLogReport.ProductDescription,vInventoryLogReport.ProductKey,vInventoryLogReport.ProductName,vInventoryLogReport.PurchaseOrderNumber,vInventoryLogReport.QuantityOrdered,vInventoryLogReport.QuantityShipped,vInventoryLogReport.ReceiptNumber,vInventoryLogReport.ReturnAuthorization,vInventoryLogReport.SortOrder,vInventoryLogReport.ToUomKey,vInventoryLogReport.TransactionDate,vInventoryLogReport.TransactionMessage,vInventoryLogReport.TransactionTypeCode,vInventoryLogReport.TransactionTypeDesc,vInventoryLogReport.UnitPrice,vInventoryLogReport.UomDesc,vInventoryLogReport.UomKey,vInventoryLogReport.UomName,vInventoryLogReport.Vendor,vInventoryLogReport.Warehouse,vInventoryLogReport.OrderLineUomKey FROM vInventoryLogReport
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoInventoryTransactionLog]'))
    DROP VIEW [dbo].[vBoInventoryTransactionLog]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoInventoryTransactionLog] AS SELECT InventoryTransactionLogMain.OrderKey,InventoryTransactionLogMain.ReceiptNumber,InventoryTransactionLogMain.TransactionDate,InventoryTransactionLogMain.Vendor,InventoryTransactionLogMain.Notes,InventoryTransactionLogMain.ReturnAuthorization,InventoryTransactionLogMain.OrderNumber,InventoryTransactionLogMain.CreatedOn,InventoryTransactionLogMain.CreatedByUserKey,InventoryTransactionLogMain.InventoryTransactionLogKey,InventoryTransactionLogMain.SystemEntityKey,InventoryTransactionLogMain.UpdatedByUserKey,InventoryTransactionLogMain.UpdatedOn,InventoryTransactionLogMain.OwnerGroupKey,InventoryTransactionLogMain.BatchLineStatusCode,InventoryTransactionLogMain.BatchStatusMessage,InventoryTransactionLogMain.FinalBatchKey,InventoryTransactionLogMain.OriginatingBatchKey FROM InventoryTransactionLogMain
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoInventoryTransactionLogCost]'))
    DROP VIEW [dbo].[vBoInventoryTransactionLogCost]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoInventoryTransactionLogCost] AS SELECT InventoryTransactionLogCost.ProductKey,InventoryTransactionLogCost.Quantity,InventoryTransactionLogCost.QuantityReturned,InventoryTransactionLogCost.SortOrder,InventoryTransactionLogCost.TotalCost,InventoryTransactionLogCost.InventoryTransactionLogCostKey,InventoryTransactionLogCost.InventoryTransactionLogKey,InventoryTransactionLogCost.CostMethodCode FROM InventoryTransactionLogCost
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoInventoryTransactionLogLine]'))
    DROP VIEW [dbo].[vBoInventoryTransactionLogLine]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoInventoryTransactionLogLine] AS SELECT InventoryTransactionLogLine.InventoryLocationKey,InventoryTransactionLogLine.LandedCost,InventoryTransactionLogLine.LotId,InventoryTransactionLogLine.OrderFulfillmentLineKey,InventoryTransactionLogLine.OrderLineKey,InventoryTransactionLogLine.ProductDescription,InventoryTransactionLogLine.ProductInventoryKey,InventoryTransactionLogLine.ProductKey,InventoryTransactionLogLine.PurchaseOrderNumber,InventoryTransactionLogLine.Quantity,InventoryTransactionLogLine.QuantityOrdered,InventoryTransactionLogLine.SortOrder,InventoryTransactionLogLine.TransactionMessage,InventoryTransactionLogLine.UomKey,InventoryTransactionLogLine.RelatedInventoryTransactionLogLineKey,InventoryTransactionLogLine.TotalCost,InventoryTransactionLogLine.WarehouseKey,InventoryTransactionLogLine.InventoryTransactionLogKey,InventoryTransactionLogLine.InventoryTransactionLogLineKey,InventoryTransactionLogLine.ReasonCodeKey,InventoryTransactionLogLine.TransactionTypeCode FROM InventoryTransactionLogLine
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoInvoice]'))
    DROP VIEW [dbo].[vBoInvoice]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoInvoice] AS SELECT InvoiceMain.BillToContactKey,InvoiceMain.InvoiceDate,InvoiceMain.Notes,InvoiceMain.SoldToContactKey,InvoiceMain.FinancialEntityKey,InvoiceMain.PaymentTermsKey,InvoiceMain.InvoiceNumber,InvoiceMain.SourceCodeKey,InvoiceMain.CurrencyCode,InvoiceMain.CurrencyConversionRate,InvoiceMain.PurchaseOrderNumber,InvoiceMain.InvoiceTypeCode,InvoiceMain.CommissionPlanKey,InvoiceMain.SalesTeamGroupKey,InvoiceMain.OrderNumber,InvoiceMain.SystemEntityKey,InvoiceMain.SalesLocationKey,InvoiceMain.AccessKey,InvoiceMain.CreatedByUserKey,InvoiceMain.CreatedOn,InvoiceMain.InvoiceKey,InvoiceMain.UpdatedByUserKey,InvoiceMain.UpdatedOn,InvoiceMain.OwnerGroupKey,InvoiceMain.AccountingMethodCode,InvoiceMain.FirstPaymentDueDate,InvoiceMain.Description,InvoiceMain.PromoCode,InvoiceMain.PriceSheetKey,InvoiceMain.BatchLineStatusCode,InvoiceMain.BatchStatusMessage,InvoiceMain.FinalBatchKey,InvoiceMain.OriginatingBatchKey FROM InvoiceMain
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vInvoiceReport]'))
    DROP VIEW [dbo].[vInvoiceReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vInvoiceReport]
AS
/****************************************************************************************
** This view provides basic information about each Invoice on "One Row per Invoice" basis.
** This view can be joined with InvoiceLine, Payment, Contact, and FullAddress related views to get detailed information.
***************************************************************************************/
SELECT 
	IM.InvoiceNumber, IM.InvoiceDate,IM.InvoiceTypeCode,ITR.InvoiceTypeDesc, IM.OrderNumber,
	IM.AccountingMethodCode, IM.CurrencyCode, IM.CurrencyConversionRate, IM.PurchaseOrderNumber, IM.Notes,
	FE.Name AS FinancialEntity, PT.PaymentTermsName, BI.BatchNumber, BI.BatchName, BI.BatchTypeCode,
	IM.InvoiceKey,IM.SoldToContactKey, IM.BillToContactKey, IM.SalesTeamGroupKey, IM.SystemEntityKey
FROM    
	InvoiceMain IM 
	INNER JOIN 		InvoiceTypeRef 	ITR 	ON IM.InvoiceTypeCode = ITR.InvoiceTypeCode 
	INNER JOIN		FinancialEntity FE 	ON IM.FinancialEntityKey = FE.FinancialEntityKey 
	LEFT OUTER JOIN	PaymentTerms 	PT 	ON IM.PaymentTermsKey = PT.PaymentTermsKey
	LEFT OUTER JOIN	BatchInstance 	BI 	ON BI.BatchKey = IM.FinalBatchKey

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vInvoiceDetailReport]'))
    DROP VIEW [dbo].[vInvoiceDetailReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vInvoiceDetailReport] AS
/****************************************************************************************
** This view provides detailed information about each Work Invoice Line on "One Row per Work Invoice Line" basis.
** This view can be joined with Payment, Ship to Contact, and FullAddress related views to get detailed information.
***************************************************************************************/
SELECT 
	IR.*, IL.InvoiceLineNumber, PT.Name as 'ProductType', PM.ProductCode, IL.QuantitySold,
	IL.UnitPrice, IL.PayPriority, IL.ExtendedPrice, IL.OrderLineNumber, IL.IsPledge,
	PM.Name AS ProductName,PM.ProductSetTypeCode, PSTR.ProductSetTypeDesc,
	IL.InvoiceLineKey, IL.ShipToContactKey, IL.ShipToFullAddressKey,IL.ParentInvoiceLineKey,
	IL.SalesTeamGroupKey AS ILSalesTeamGroupKey, IL.SourceCodeKey AS ILSourceCodeKey
FROM    
	vInvoiceReport IR
	INNER JOIN InvoiceLine IL ON IR.InvoiceKey = IL.InvoiceKey
	INNER JOIN ProductMain PM ON IL.ProductKey = PM.ProductKey
    INNER JOIN ProductSetTypeRef PSTR ON PM.ProductSetTypeCode = PSTR.ProductSetTypeCode
    INNER JOIN ProductType PT on PM.ProductTypeKey = PT.ProductTypeKey

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoInvoiceDetailReport]'))
    DROP VIEW [dbo].[vBoInvoiceDetailReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoInvoiceDetailReport] AS SELECT vInvoiceDetailReport.AccountingMethodCode,vInvoiceDetailReport.BatchName,vInvoiceDetailReport.BatchNumber,vInvoiceDetailReport.BatchTypeCode,vInvoiceDetailReport.BillToContactKey,vInvoiceDetailReport.CurrencyCode,vInvoiceDetailReport.CurrencyConversionRate,vInvoiceDetailReport.ExtendedPrice,vInvoiceDetailReport.FinancialEntity,vInvoiceDetailReport.ILSalesTeamGroupKey,vInvoiceDetailReport.ILSourceCodeKey,vInvoiceDetailReport.InvoiceDate,vInvoiceDetailReport.InvoiceKey,vInvoiceDetailReport.InvoiceLineKey,vInvoiceDetailReport.InvoiceLineNumber,vInvoiceDetailReport.InvoiceNumber,vInvoiceDetailReport.InvoiceTypeCode,vInvoiceDetailReport.InvoiceTypeDesc,vInvoiceDetailReport.IsPledge,vInvoiceDetailReport.Notes,vInvoiceDetailReport.OrderLineNumber,vInvoiceDetailReport.OrderNumber,vInvoiceDetailReport.ParentInvoiceLineKey,vInvoiceDetailReport.PayPriority,vInvoiceDetailReport.ProductCode,vInvoiceDetailReport.ProductName,vInvoiceDetailReport.ProductSetTypeCode,vInvoiceDetailReport.ProductSetTypeDesc,vInvoiceDetailReport.ProductType,vInvoiceDetailReport.PurchaseOrderNumber,vInvoiceDetailReport.SalesTeamGroupKey,vInvoiceDetailReport.ShipToContactKey,vInvoiceDetailReport.ShipToFullAddressKey,vInvoiceDetailReport.SoldToContactKey,vInvoiceDetailReport.SystemEntityKey,vInvoiceDetailReport.UnitPrice,vInvoiceDetailReport.PaymentTermsName,vInvoiceDetailReport.QuantitySold FROM vInvoiceDetailReport
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoInvoiceDistribution]'))
    DROP VIEW [dbo].[vBoInvoiceDistribution]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoInvoiceDistribution] AS SELECT InvoiceDistribution.ExtendedIncome,InvoiceDistribution.ExtendedIncomeRecognized,InvoiceDistribution.InvoiceDistributionKey,InvoiceDistribution.InvoiceKey,InvoiceDistribution.InvoiceLineKey,InvoiceDistribution.UnitIncome,InvoiceDistribution.IncomeGLAccountKey,InvoiceDistribution.DeferredIncomeGLAccountKey,InvoiceDistribution.FinancialEntityKey,InvoiceDistribution.ARGLAccountKey,InvoiceDistribution.DeferralTermsKey,InvoiceDistribution.ExtendedCost,InvoiceDistribution.WarehouseKey,InvoiceDistribution.QuantitySold,InvoiceDistribution.ShipMethodKey FROM InvoiceDistribution
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoInvoiceLine]'))
    DROP VIEW [dbo].[vBoInvoiceLine]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoInvoiceLine] AS SELECT InvoiceLine.InvoiceKey,InvoiceLine.InvoiceLineKey,InvoiceLine.ShipToContactKey,InvoiceLine.UnitPrice,InvoiceLine.InvoiceLineNumber,InvoiceLine.PayPriority,InvoiceLine.ExtendedPrice,InvoiceLine.ParentInvoiceLineKey,InvoiceLine.InvoiceNumber,InvoiceLine.OrderLineNumber,InvoiceLine.ExtendedPriceHome,InvoiceLine.ProductKey,InvoiceLine.ShipToFullAddressKey,InvoiceLine.IsPledge,InvoiceLine.SalesTeamGroupKey,InvoiceLine.SourceCodeKey,InvoiceLine.UomKey,InvoiceLine.BasePrice,InvoiceLine.PromoCode,InvoiceLine.QuantitySold,InvoiceLine.ShipMethodKey,InvoiceLine.PriceSheetKey FROM InvoiceLine
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vInvoiceLineReport]'))
    DROP VIEW [dbo].[vInvoiceLineReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vInvoiceLineReport] AS
/****************************************************************************************
** This view provides detailed information about each Work Invoice Line on "One Row per Work Invoice Line" basis.
** This view can be joined with Payment, Ship to Contact, and FullAddress related views to get detailed information.
***************************************************************************************/
SELECT 
	IM.InvoiceNumber, IL.InvoiceLineNumber, 
	ISNULL(parent.InvoiceLineNumber, 0) as 'ParentInvoiceLineNumber',
	IL.OrderLineNumber,
	IL.QuantitySold,
	UOM.Name as 'UomName', 
	IL.UnitPrice, IL.ExtendedPrice, IL.BasePrice,
	IL.QuantitySold * IL.BasePrice AS 'ExtendedBasePrice',
	ISNULL(IncludedTax.Tax, 0) as 'TaxIncluded',
	IL.PromoCode as 'LinePromoCode',
	ISNULL(PS.Name, '') as 'LinePriceSheetName',
	ISNULL(SC.Name, '') as 'LineSourceCode',
	ISNULL(SM.Name, '') as 'LineShipMethod',
	IL.ShipToContactKey, IL.ShipToFullAddressKey,
	IL.ProductKey, 
	IL.SalesTeamGroupKey,
	IL.InvoiceKey,
	IL.InvoiceLineKey
FROM    
	InvoiceMain IM
	INNER JOIN InvoiceLine IL ON IM.InvoiceKey = IL.InvoiceKey
	INNER JOIN Uom UOM ON IL.UomKey = UOM.UomKey
	LEFT OUTER JOIN ShipMethod SM on IL.ShipMethodKey = SM.ShipMethodKey
	LEFT OUTER JOIN PriceSheet PS on IL.PriceSheetKey = PS.PriceSheetKey
	LEFT OUTER JOIN SourceCode SC on IL.SourceCodeKey = SC.SourceCodeKey
	LEFT OUTER JOIN InvoiceLine parent on IL.ParentInvoiceLineKey = parent.InvoiceLineKey
	LEFT OUTER JOIN
		(SELECT 
			SUM(CASE WHEN TAC.IsTaxInclusive = 1 THEN inclTax.ExtendedPrice ELSE 0 END) as 'Tax',
			IL.InvoiceLineKey
			FROM InvoiceLine IL
			INNER JOIN InvoiceLine inclTax on inclTax.ParentInvoiceLineKey = IL.InvoiceLineKey
			INNER JOIN ProductTax PT ON inclTax.ProductKey = PT.ProductKey
 			INNER JOIN TaxAuthorityCategory TAC ON PT.TaxAuthorityKey = TAC.TaxAuthorityKey AND PT.TaxCategoryKey = TAC.TaxCategoryKey
			GROUP BY IL.InvoiceLineKey
		) AS IncludedTax 			ON IL.InvoiceLineKey = IncludedTax.InvoiceLineKey
	WHERE IL.OrderLineNumber > 0

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoInvoiceLineReport]'))
    DROP VIEW [dbo].[vBoInvoiceLineReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoInvoiceLineReport] AS SELECT vInvoiceLineReport.BasePrice,vInvoiceLineReport.ExtendedBasePrice,vInvoiceLineReport.ExtendedPrice,vInvoiceLineReport.InvoiceKey,vInvoiceLineReport.InvoiceLineKey,vInvoiceLineReport.InvoiceLineNumber,vInvoiceLineReport.InvoiceNumber,vInvoiceLineReport.LinePriceSheetName,vInvoiceLineReport.LinePromoCode,vInvoiceLineReport.LineShipMethod,vInvoiceLineReport.LineSourceCode,vInvoiceLineReport.OrderLineNumber,vInvoiceLineReport.ParentInvoiceLineNumber,vInvoiceLineReport.ProductKey,vInvoiceLineReport.QuantitySold,vInvoiceLineReport.SalesTeamGroupKey,vInvoiceLineReport.ShipToContactKey,vInvoiceLineReport.ShipToFullAddressKey,vInvoiceLineReport.TaxIncluded,vInvoiceLineReport.UnitPrice,vInvoiceLineReport.UomName FROM vInvoiceLineReport
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vInvoiceMainReport]'))
    DROP VIEW [dbo].[vInvoiceMainReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vInvoiceMainReport]
AS
/****************************************************************************************
** This view provides basic information about each Invoice on "One Row per Invoice" basis.
** This view can be joined with InvoiceLine, Payment, Contact, and FullAddress related views to get detailed information.
***************************************************************************************/
SELECT 
	IM.InvoiceNumber, 
	CAST(CONVERT(CHAR(10), IM.InvoiceDate, 101) as datetime) as 'InvoiceDate',
	ITR.InvoiceTypeDesc, IM.Description, IM.PurchaseOrderNumber,
	CASE WHEN InvoiceLine.NumberShipMethods > 1 THEN 'Various' ELSE InvoiceLine.ShipMethodName END as 'ShipMethod', 
	PT.PaymentTermsName, 
	CAST(CONVERT(CHAR(10), PaymentSchedule.FirstDueDate, 101) as datetime) as 'FirstDueDate', 
	IM.OrderNumber, IM.PromoCode,
	ISNULL(SC.Name, '') as 'SourceCode',
	PS.Name as 'PriceSheetName', 
	IM.SalesLocationKey, AM.AccountMethodDesc, 
	IM.CurrencyCode, IM.CurrencyConversionRate, IM.Notes,
	InvoiceLine.LineTotal as 'LineTotal', 
	MiscLine.FreightTotal as 'Shipping', 
	MiscLine.HandlingTotal as 'Handling', 
	MiscLine.RestockingTotal as 'Restocking', 
	TaxLine.TaxTotal as 'Tax',
	InvoiceLine.LineTotal + MiscLine.FreightTotal + MiscLine.HandlingTotal + MiscLine.RestockingTotal + TaxLine.TaxTotal + TaxLine.TotalTaxIncluded as 'InvoiceTotal', 
	ISNULL(PaymentApplications.AppliedAmount, 0) as 'PaymentsApplied', 
	InvoiceLine.LineTotal + MiscLine.FreightTotal + MiscLine.HandlingTotal + MiscLine.RestockingTotal + TaxLine.TaxTotal + TaxLine.TotalTaxIncluded - PaymentApplications.AppliedAmount as 'Balance', 
	InvoiceLine.BaseLineTotal as 'BaseLineTotal', 
	InvoiceLine.BaseLineTotal - InvoiceLine.LineTotal - TaxLine.TotalTaxIncluded as 'TotalDiscount', 
	TaxLine.TotalTaxIncluded as 'TotalTaxIncluded', 
	CASE WHEN InvoiceLine.NumberShipTos > 1 THEN 1 ELSE 0 END as 'MultipleShipTos', 
	CASE WHEN PaymentSchedule.ScheduleLineCount > 1 THEN 1 ELSE 0 END as 'MultipleInstallmentPayments',
	IM.FinancialEntityKey, IM.SoldToContactKey, IM.BillToContactKey, IM.SalesTeamGroupKey,
	IM.CreatedByUserKey, IM.CreatedOn, IM.UpdatedByUserKey, IM.UpdatedOn, IM.OwnerGroupKey, IM.AccessKey,
	IM.InvoiceKey 
FROM    
	InvoiceMain IM 
	INNER JOIN 		InvoiceTypeRef 	ITR 	ON IM.InvoiceTypeCode = ITR.InvoiceTypeCode 
	INNER JOIN		AccountingMethodRef AM  ON IM.AccountingMethodCode=AM.AccountingMethodCode
	INNER JOIN		PaymentTerms 	PT 	ON IM.PaymentTermsKey = PT.PaymentTermsKey
	INNER JOIN		PriceSheet 	PS 	ON IM.PriceSheetKey = PS.PriceSheetKey
	INNER JOIN 
		(SELECT 
			SUM(IL.ExtendedPrice) as 'LineTotal',
			SUM(IL.QuantitySold * IL.BasePrice) as 'BaseLineTotal',
			COUNT(DISTINCT CM.FullName) as 'NumberShipTos',
			COUNT(DISTINCT SM.Name) as 'NumberShipMethods',
			MIN(SM.Name) as 'ShipMethodName',
			IL.InvoiceKey
			FROM InvoiceLine IL
			INNER JOIN ContactMain CM on IL.ShipToContactKey = CM.ContactKey
			INNER JOIN InvoiceDistribution ID on IL.InvoiceLineKey = ID.InvoiceLineKey
			INNER JOIN ShipMethod SM on ID.ShipMethodKey = SM.ShipMethodKey
			WHERE IL.OrderLineNumber > 0
			GROUP BY IL.InvoiceKey
		) AS InvoiceLine 			ON IM.InvoiceKey = InvoiceLine.InvoiceKey
	INNER JOIN 
		(SELECT 
			SUM(CASE WHEN TAC.IsTaxInclusive = 0 THEN IL.ExtendedPrice ELSE 0 END) as 'TaxTotal',
			SUM(CASE WHEN TAC.IsTaxInclusive = 1 THEN IL.ExtendedPrice ELSE 0 END) as 'TotalTaxIncluded',
			IL.InvoiceKey
			FROM InvoiceLine IL
			INNER JOIN ProductTax PT ON IL.ProductKey = PT.ProductKey
 			INNER JOIN TaxAuthorityCategory TAC ON PT.TaxAuthorityKey = TAC.TaxAuthorityKey AND PT.TaxCategoryKey = TAC.TaxCategoryKey
			--WHERE TAC.IsTaxInclusive = 0
			GROUP BY IL.InvoiceKey
		) AS TaxLine 			ON IM.InvoiceKey = TaxLine.InvoiceKey
	INNER JOIN 
		(SELECT 
			SUM(CASE WHEN PT.BusinessObjectName = 'ProductFreight' THEN IL.ExtendedPrice ELSE 0 END) as 'FreightTotal',
			SUM(CASE WHEN PT.BusinessObjectName = 'ProductHandling' THEN IL.ExtendedPrice ELSE 0 END) as 'HandlingTotal',
			SUM(CASE WHEN PT.BusinessObjectName = 'ProductRestocking' THEN IL.ExtendedPrice ELSE 0 END) as 'RestockingTotal',
			IL.InvoiceKey
			FROM InvoiceLine IL
			INNER JOIN ProductMain PM ON IL.ProductKey = PM.ProductKey
			INNER JOIN ProductType PT ON PM.ProductTypeKey = PT.ProductTypeKey
			WHERE IL.OrderLineNumber = 0
			GROUP BY IL.InvoiceKey
		) AS MiscLine 			ON IM.InvoiceKey =  + MiscLine.InvoiceKey

	INNER JOIN
		(SELECT
			PSL.InvoiceKey,
			COUNT (*) as 'ScheduleLineCount',
			MIN(PSL.DueDate) as 'FirstDueDate'
			FROM PaymentScheduleLine PSL
			GROUP BY PSL.InvoiceKey
		) AS PaymentSchedule			ON IM.InvoiceKey = PaymentSchedule.InvoiceKey

	LEFT OUTER JOIN 
		(SELECT 
			SUM(MA.Amount) as 'AppliedAmount',
			MA.InvoiceKey
			FROM MonetaryApplication MA
			GROUP BY MA.InvoiceKey
		) AS PaymentApplications		ON IM.InvoiceKey = PaymentApplications.InvoiceKey
	LEFT OUTER JOIN SourceCode SC on IM.SourceCodeKey = SC.SourceCodeKey

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoInvoiceMainReport]'))
    DROP VIEW [dbo].[vBoInvoiceMainReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoInvoiceMainReport] AS SELECT vInvoiceMainReport.AccessKey,vInvoiceMainReport.AccountMethodDesc,vInvoiceMainReport.Balance,vInvoiceMainReport.BaseLineTotal,vInvoiceMainReport.BillToContactKey,vInvoiceMainReport.CreatedByUserKey,vInvoiceMainReport.CreatedOn,vInvoiceMainReport.CurrencyCode,vInvoiceMainReport.CurrencyConversionRate,vInvoiceMainReport.Description,vInvoiceMainReport.FinancialEntityKey,vInvoiceMainReport.FirstDueDate,vInvoiceMainReport.Handling,vInvoiceMainReport.InvoiceDate,vInvoiceMainReport.InvoiceKey,vInvoiceMainReport.InvoiceNumber,vInvoiceMainReport.InvoiceTotal,vInvoiceMainReport.InvoiceTypeDesc,vInvoiceMainReport.LineTotal,vInvoiceMainReport.MultipleInstallmentPayments,vInvoiceMainReport.MultipleShipTos,vInvoiceMainReport.Notes,vInvoiceMainReport.OrderNumber,vInvoiceMainReport.OwnerGroupKey,vInvoiceMainReport.PaymentsApplied,vInvoiceMainReport.PaymentTermsName,vInvoiceMainReport.PriceSheetName,vInvoiceMainReport.PromoCode,vInvoiceMainReport.PurchaseOrderNumber,vInvoiceMainReport.Restocking,vInvoiceMainReport.SalesLocationKey,vInvoiceMainReport.SalesTeamGroupKey,vInvoiceMainReport.ShipMethod,vInvoiceMainReport.Shipping,vInvoiceMainReport.SoldToContactKey,vInvoiceMainReport.SourceCode,vInvoiceMainReport.Tax,vInvoiceMainReport.TotalDiscount,vInvoiceMainReport.TotalTaxIncluded,vInvoiceMainReport.UpdatedByUserKey,vInvoiceMainReport.UpdatedOn FROM vInvoiceMainReport
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoInvoiceReport]'))
    DROP VIEW [dbo].[vBoInvoiceReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoInvoiceReport] AS SELECT vInvoiceReport.AccountingMethodCode,vInvoiceReport.BatchName,vInvoiceReport.BatchNumber,vInvoiceReport.BatchTypeCode,vInvoiceReport.BillToContactKey,vInvoiceReport.CurrencyCode,vInvoiceReport.CurrencyConversionRate,vInvoiceReport.FinancialEntity,vInvoiceReport.InvoiceDate,vInvoiceReport.InvoiceKey,vInvoiceReport.InvoiceNumber,vInvoiceReport.InvoiceTypeCode,vInvoiceReport.InvoiceTypeDesc,vInvoiceReport.Notes,vInvoiceReport.OrderNumber,vInvoiceReport.PurchaseOrderNumber,vInvoiceReport.SalesTeamGroupKey,vInvoiceReport.SoldToContactKey,vInvoiceReport.SystemEntityKey,vInvoiceReport.PaymentTermsName FROM vInvoiceReport
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoInvoiceTypeRef]'))
    DROP VIEW [dbo].[vBoInvoiceTypeRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoInvoiceTypeRef] AS SELECT InvoiceTypeRef.InvoiceTypeCode,InvoiceTypeRef.InvoiceTypeDesc FROM InvoiceTypeRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoJournalEntryTypeRef]'))
    DROP VIEW [dbo].[vBoJournalEntryTypeRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoJournalEntryTypeRef] AS SELECT JournalEntryTypeRef.JournalEntryTypeDesc,JournalEntryTypeRef.JournalEntryTypeCode FROM JournalEntryTypeRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vKitReport]'))
    DROP VIEW [dbo].[vKitReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vKitReport]
AS
SELECT     ppm.ProductCode AS ParentProductCode, ppm.Name AS ParentProductName, psi.Quantity AS ChildQty, cpm.ProductCode AS ChildCode, 
                      cpm.Name AS ChildName, psr.ProductSetTypeCode, psr.ProductSetTypeDesc, dbo.Uom.Name AS ChildUom, w.Description AS Warehouse, 
                      psi.ParentProductKey, psi.ChildProductKey, dbo.Uom.UomKey, ppm.StandardCost AS KitStdCost, cpm.StandardCost AS ChildStdCost
FROM         dbo.ProductMain ppm INNER JOIN
                      dbo.ProductSetItem psi ON ppm.ProductKey = psi.ParentProductKey INNER JOIN
                      dbo.ProductMain cpm ON psi.ChildProductKey = cpm.ProductKey LEFT OUTER JOIN
                      dbo.ProductInventory pi ON cpm.ProductKey = pi.ProductKey LEFT OUTER JOIN
                      dbo.Uom ON psi.ChildUomKey = dbo.Uom.UomKey INNER JOIN
                      dbo.ProductSetTypeRef psr ON ppm.ProductSetTypeCode = psr.ProductSetTypeCode LEFT OUTER JOIN
                      dbo.ProductWarehouse pw ON ppm.ProductKey = pw.ProductKey LEFT OUTER JOIN
                      dbo.Warehouse w ON pw.ProductWarehouseKey = w.WarehouseKey

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoKitReport]'))
    DROP VIEW [dbo].[vBoKitReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoKitReport] AS SELECT vKitReport.ChildCode,vKitReport.ChildName,vKitReport.ChildProductKey,vKitReport.ChildQty,vKitReport.ChildUom,vKitReport.ParentProductCode,vKitReport.ParentProductKey,vKitReport.ParentProductName,vKitReport.UomKey,vKitReport.Warehouse,vKitReport.ProductSetTypeCode,vKitReport.ProductSetTypeDesc,vKitReport.ChildStdCost,vKitReport.KitStdCost FROM vKitReport
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoLicense]'))
    DROP VIEW [dbo].[vBoLicense]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoLicense] AS SELECT License.LicenseKey,License.LicenseDesc AS Description,License.LicenseName AS Name FROM License
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoLicenseMain]'))
    DROP VIEW [dbo].[vBoLicenseMain]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoLicenseMain] AS SELECT LicenseMain.EffectiveDate,LicenseMain.ExpirationDate,LicenseMain.LicenseKey,LicenseMain.LicenseMasterKey,LicenseMain.NamedLicenseCount,LicenseMain.OrganizationKey,LicenseMain.UnnamedLicenseCount,LicenseMain.Checksum FROM LicenseMain
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoLicenseMap]'))
    DROP VIEW [dbo].[vBoLicenseMap]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoLicenseMap] AS SELECT LicenseMap.LicenseKey,LicenseMap.LicenseType FROM LicenseMap
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoLicenseMapMaster]'))
    DROP VIEW [dbo].[vBoLicenseMapMaster]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoLicenseMapMaster] AS SELECT LicenseMapMaster.CreatedByUserKey,LicenseMapMaster.CreatedOn,LicenseMapMaster.LicenseKey,LicenseMapMaster.LicenseType,LicenseMapMaster.UpdatedByUserKey,LicenseMapMaster.UpdatedOn FROM LicenseMapMaster
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoLicenseMaster]'))
    DROP VIEW [dbo].[vBoLicenseMaster]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoLicenseMaster] AS SELECT LicenseMaster.EffectiveDate,LicenseMaster.ExpirationDate,LicenseMaster.LicenseKey,LicenseMaster.LicenseMasterKey,LicenseMaster.NamedLicenseCount,LicenseMaster.UnnamedLicenseCount,LicenseMaster.UpdatedByUserKey,LicenseMaster.UpdatedOn,LicenseMaster.LicenseOrganizationKey,LicenseMaster.Checksum,LicenseMaster.CreatedByUserKey,LicenseMaster.CreatedOn FROM LicenseMaster
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoLicenseOrganization]'))
    DROP VIEW [dbo].[vBoLicenseOrganization]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoLicenseOrganization] AS SELECT LicenseOrganization.CreatedByUserKey,LicenseOrganization.Name,LicenseOrganization.UpdatedByUserKey,LicenseOrganization.Description,LicenseOrganization.LicenseOrganizationKey FROM LicenseOrganization
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoLicenseTypeRef]'))
    DROP VIEW [dbo].[vBoLicenseTypeRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoLicenseTypeRef] AS SELECT LicenseTypeRef.CreatedByUserKey,LicenseTypeRef.CreatedOn,LicenseTypeRef.Description,LicenseTypeRef.LicenseType,LicenseTypeRef.UpdatedByUserKey,LicenseTypeRef.UpdatedOn FROM LicenseTypeRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoLicenseUser]'))
    DROP VIEW [dbo].[vBoLicenseUser]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoLicenseUser] AS SELECT LicenseUser.LicenseKey,LicenseUser.UserKey,LicenseUser.CreatedByUserKey,LicenseUser.CreatedOn FROM LicenseUser
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoLinePricingRef]'))
    DROP VIEW [dbo].[vBoLinePricingRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoLinePricingRef] AS SELECT LinePricingRef.LinePricingCode,LinePricingRef.LinePricingDesc,LinePricingRef.LinePricingName FROM LinePricingRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoListElement]'))
    DROP VIEW [dbo].[vBoListElement]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoListElement] AS SELECT ListItem.CreatedByUserKey,ListItem.CreatedOn,ListItem.IsDisabled,ListItem.ListItemKey,ListItem.ListKey,ListItem.ObjectKey,ListItem.LinkedObjectKey FROM ListItem
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoListEntity]'))
    DROP VIEW [dbo].[vBoListEntity]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoListEntity] AS SELECT ListMain.ListKey,ListMain.MemberObjectType FROM ListMain
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoLocaleRef]'))
    DROP VIEW [dbo].[vBoLocaleRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoLocaleRef] AS SELECT LocaleRef.LocaleCode,LocaleRef.LocaleKey FROM LocaleRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoLocation]'))
    DROP VIEW [dbo].[vBoLocation]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoLocation] AS SELECT Location.ContactKey,Location.CreatedByUserKey,Location.CreatedOn,Location.LocationDescription,Location.LocationKey,Location.LocationName,Location.LocationStatusCode,Location.UpdatedByUserKey,Location.UpdatedOn FROM Location
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoLocationStatus]'))
    DROP VIEW [dbo].[vBoLocationStatus]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoLocationStatus] AS SELECT LocationStatusRef.LocationStatusCode,LocationStatusRef.LocationStatusName FROM LocationStatusRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoMailCodeRef]'))
    DROP VIEW [dbo].[vBoMailCodeRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoMailCodeRef] AS SELECT MailCodeRef.MailCode AS Code,MailCodeRef.MailCodeDesc AS Description,MailCodeRef.UpdatedByUserKey,MailCodeRef.UpdatedOn FROM MailCodeRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoMatchingGift]'))
    DROP VIEW [dbo].[vBoMatchingGift]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoMatchingGift] AS SELECT MatchingGift.MatchedAmount,MatchingGift.MatchingGiftKey,MatchingGift.MatchingGiftPlanKey,MatchingGift.MatchingGiftRelationshipKey,MatchingGift.MatchingContactKey,MatchingGift.MatchingGiftInfo,MatchingGift.MatchingOrderLineKey,MatchingGift.OriginalOrderLineKey FROM MatchingGift
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoMatchingGiftPlan]'))
    DROP VIEW [dbo].[vBoMatchingGiftPlan]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoMatchingGiftPlan] AS SELECT MatchingGiftPlan.CorporateGiftContactKey,MatchingGiftPlan.EffectiveDate,MatchingGiftPlan.MatchingGiftContactKey,MatchingGiftPlan.MatchingGiftPlanTypeKey,MatchingGiftPlan.MatchingMode,MatchingGiftPlan.MatchingRatio,MatchingGiftPlan.MaximumMatchPeriod,MatchingGiftPlan.Name,MatchingGiftPlan.PlanProcedure,MatchingGiftPlan.PreferredMatchingProductKey,MatchingGiftPlan.RulesDescription,MatchingGiftPlan.TerminationDate,MatchingGiftPlan.UpdatedByUserKey,MatchingGiftPlan.UpdatedOn,MatchingGiftPlan.IsAutomatch,MatchingGiftPlan.OwnerContactKey,MatchingGiftPlan.MaximumMatchAmount,MatchingGiftPlan.IsGiftQualified,MatchingGiftPlan.IsPledgeQualified,MatchingGiftPlan.AccessKey,MatchingGiftPlan.CreatedByUserKey,MatchingGiftPlan.CreatedOn,MatchingGiftPlan.MatchingGiftPlanKey,MatchingGiftPlan.SystemEntityKey FROM MatchingGiftPlan
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoMatchingGiftPlanFundType]'))
    DROP VIEW [dbo].[vBoMatchingGiftPlanFundType]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoMatchingGiftPlanFundType] AS SELECT MatchingGiftPlanFundType.FundTypeKey,MatchingGiftPlanFundType.MatchingGiftPlanFundTypeKey,MatchingGiftPlanFundType.MatchingGiftPlanKey FROM MatchingGiftPlanFundType
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoMatchingGiftPlanRelationship]'))
    DROP VIEW [dbo].[vBoMatchingGiftPlanRelationship]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoMatchingGiftPlanRelationship] AS SELECT MatchingGiftPlanRelationship.MatchingGiftPlanKey,MatchingGiftPlanRelationship.MatchingGiftPlanRelationshipKey,MatchingGiftPlanRelationship.RelationshipTypeKey FROM MatchingGiftPlanRelationship
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoMatchingGiftPlanRule]'))
    DROP VIEW [dbo].[vBoMatchingGiftPlanRule]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoMatchingGiftPlanRule] AS SELECT MatchingGiftPlanRule.MatchingGiftPlanKey,MatchingGiftPlanRule.MatchingGiftPlanRuleKey,MatchingGiftPlanRule.RuleKey FROM MatchingGiftPlanRule
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoMatchingGiftPlanTypeRef]'))
    DROP VIEW [dbo].[vBoMatchingGiftPlanTypeRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoMatchingGiftPlanTypeRef] AS SELECT MatchingGiftPlanTypeRef.IsActive,MatchingGiftPlanTypeRef.MatchingGiftPlanDesc,MatchingGiftPlanTypeRef.MatchingGiftPlanTypeKey FROM MatchingGiftPlanTypeRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoMatchingModeRef]'))
    DROP VIEW [dbo].[vBoMatchingModeRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoMatchingModeRef] AS SELECT MatchingModeRef.MatchingModeCode,MatchingModeRef.MatchingModeDesc,MatchingModeRef.MatchingModeName FROM MatchingModeRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoMatchingPeriodRef]'))
    DROP VIEW [dbo].[vBoMatchingPeriodRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoMatchingPeriodRef] AS SELECT MatchingPeriodRef.MatchingPeriodCode,MatchingPeriodRef.MatchingPeriodDesc,MatchingPeriodRef.MatchingPeriodName FROM MatchingPeriodRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoMemorialTribute]'))
    DROP VIEW [dbo].[vBoMemorialTribute]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoMemorialTribute] AS SELECT MemorialTribute.FRProductKey,MemorialTribute.MemorialTributeCodeKey,MemorialTribute.NotificationGroupKey,MemorialTribute.MemorialTributeKey,MemorialTribute.Description,MemorialTribute.HonoreeContactKey,MemorialTribute.UseDefaultDescriptionFlag FROM MemorialTribute
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoMemorialTributeCodeRef]'))
    DROP VIEW [dbo].[vBoMemorialTributeCodeRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoMemorialTributeCodeRef] AS SELECT MemorialTributeCodeRef.MemorialTributeCodeKey,MemorialTributeCodeRef.Code,MemorialTributeCodeRef.Description FROM MemorialTributeCodeRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoMemorialTributeNotificationMember]'))
    DROP VIEW [dbo].[vBoMemorialTributeNotificationMember]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoMemorialTributeNotificationMember] AS SELECT GroupMember.CreatedByUserKey,GroupMember.CreatedOn,GroupMember.DropDate,GroupMember.GroupKey,GroupMember.GroupMemberKey,GroupMember.JoinDate,GroupMember.MemberContactKey,GroupMember.UpdatedByUserKey,GroupMember.UpdatedOn,GroupMember.IsActive,MemorialTributeNotificationMember.RelationshipKey,MemorialTributeNotificationMember.MemorialTributeNotificationPreferenceCode FROM GroupMember
	INNER JOIN MemorialTributeNotificationMember
		ON GroupMember.GroupMemberKey = MemorialTributeNotificationMember.GroupMemberKey
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoMethodSet]'))
    DROP VIEW [dbo].[vBoMethodSet]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoMethodSet] AS SELECT MethodSet.MethodSetKey,MethodSet.MethodSetName AS Name,MethodSet.MethodSetTypeCode,MethodSet.CreatedByUserKey,MethodSet.CreatedOn,MethodSet.MethodSetDescription AS Description,MethodSet.SystemEntityKey,MethodSet.UpdatedByUserKey,MethodSet.UpdatedOn,MethodSet.IsDefault FROM MethodSet
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoMethodSetDetail]'))
    DROP VIEW [dbo].[vBoMethodSetDetail]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoMethodSetDetail] AS SELECT MethodSetDetail.IsDefault,MethodSetDetail.MethodSetDetailKey,MethodSetDetail.MethodSetKey,MethodSetDetail.Priority,MethodSetDetail.VisibleName FROM MethodSetDetail
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoMethodSetTypeRef]'))
    DROP VIEW [dbo].[vBoMethodSetTypeRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoMethodSetTypeRef] AS SELECT MethodSetTypeRef.MethodSetTypeCode AS Code,MethodSetTypeRef.MethodSetTypeDesc AS Description FROM MethodSetTypeRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoMiscCharge]'))
    DROP VIEW [dbo].[vBoMiscCharge]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoMiscCharge] AS SELECT MiscCharge.CreatedByUserKey,MiscCharge.CreatedOn,MiscCharge.IsHandlingCharge,MiscCharge.MiscChargeKey,MiscCharge.ProductKey,MiscCharge.Charge,MiscCharge.ChargeHome,MiscCharge.IsManual,MiscCharge.OrderShipToKey,MiscCharge.IsEstimate FROM MiscCharge
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoMonetaryApplication]'))
    DROP VIEW [dbo].[vBoMonetaryApplication]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoMonetaryApplication] AS SELECT MonetaryApplication.Amount,MonetaryApplication.InvoiceDistributionKey,MonetaryApplication.InvoiceKey,MonetaryApplication.InvoiceLineKey,MonetaryApplication.InvoiceNumber,MonetaryApplication.MonetaryApplicationKey,MonetaryApplication.SrcInvoiceLineKey,MonetaryApplication.PaymentScheduleLineKey,MonetaryApplication.SrcPaymentKey,MonetaryApplication.DiscountTaken,MonetaryApplication.CurrencyVariance,MonetaryApplication.OrderLineNumber,MonetaryApplication.OrderNumber,MonetaryApplication.TransactionDate,MonetaryApplication.TransactionType,MonetaryApplication.BatchKey FROM MonetaryApplication
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoNavigationHierarchy]'))
    DROP VIEW [dbo].[vBoNavigationHierarchy]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoNavigationHierarchy] AS SELECT Hierarchy.Depth,Hierarchy.HierarchyKey,Hierarchy.IsChildAMemberOfParent,Hierarchy.ParentHierarchyKey,Hierarchy.RootHierarchyKey,Hierarchy.SortOrder,Hierarchy.UniformKey,Hierarchy.UniformType,Hierarchy.HierarchyCode,Perspective.PerspectiveKey,Perspective.PerspectiveName,Perspective.WebsiteKey,DocumentMain.AlternateName,DocumentMain.Blob,DocumentMain.DocumentCode,DocumentMain.DocumentDescription,DocumentMain.DocumentKey,DocumentMain.DocumentName,DocumentMain.DocumentStatusCode,DocumentMain.DocumentTypeCode,DocumentMain.DocumentVersionKey,DocumentMain.IsSystem,DocumentMain.RelatedDocumentVersionKey,DocumentMain.UpdatedByUserKey,DocumentMain.UpdatedOn FROM Hierarchy
	INNER JOIN DocumentMain
		ON Hierarchy.UniformKey = DocumentMain.DocumentVersionKey
	INNER JOIN Perspective
		ON Hierarchy.RootHierarchyKey = Perspective.RootHierarchyKey
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoNavigationHierarchyCM]'))
    DROP VIEW [dbo].[vBoNavigationHierarchyCM]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoNavigationHierarchyCM] AS SELECT Hierarchy.Depth,Hierarchy.HierarchyKey,Hierarchy.IsChildAMemberOfParent,Hierarchy.ParentHierarchyKey,Hierarchy.RootHierarchyKey,Hierarchy.SortOrder,Hierarchy.UniformKey,Hierarchy.UniformType,Hierarchy.HierarchyCode,Perspective.PerspectiveKey,Perspective.PerspectiveName,Perspective.WebsiteKey,DocumentMain.DocumentName,DocumentMain.DocumentKey,DocumentMain.DocumentDescription,DocumentMain.DocumentStatusCode,DocumentMain.DocumentTypeCode,DocumentMain.IsSystem,DocumentMain.UpdatedByUserKey,DocumentMain.UpdatedOn,DocumentMain.Blob,DocumentMain.DocumentCode,DocumentMain.AlternateName,DocumentMain.DocumentVersionKey,DocumentMain.RelatedDocumentVersionKey FROM DocumentMain
	INNER JOIN Hierarchy
		ON DocumentMain.DocumentVersionKey = Hierarchy.UniformKey
	INNER JOIN Perspective
		ON Hierarchy.RootHierarchyKey = Perspective.RootHierarchyKey
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoNavigationPane]'))
    DROP VIEW [dbo].[vBoNavigationPane]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoNavigationPane] AS SELECT NavigationPaneRef.DynamicDisplayLevels,NavigationPaneRef.HighlightTopAncestorFlag,NavigationPaneRef.NavigationPaneCode AS Code,NavigationPaneRef.NavigationPaneName AS Name,NavigationPaneRef.StartingLevel,NavigationPaneRef.StaticDisplayLevels FROM NavigationPaneRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoNavigationWorkflow]'))
    DROP VIEW [dbo].[vBoNavigationWorkflow]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoNavigationWorkflow] AS SELECT NavigationWorkflowParameters.DocumentVersionKey,NavigationWorkflowParameters.NotifyContactKey,NavigationWorkflowParameters.RemoveAfterDays FROM NavigationWorkflowParameters
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoNote]'))
    DROP VIEW [dbo].[vBoNote]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoNote] AS SELECT Note.NoteForUniformKey,Note.NotePurposeKey,Note.NoteText,Note.UpdatedByUserKey,Note.UpdatedOn,Note.AccessKey,Note.CreatedByUserKey,Note.CreatedOn,Note.NoteKey FROM Note
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoNotePurposeRef]'))
    DROP VIEW [dbo].[vBoNotePurposeRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoNotePurposeRef] AS SELECT NotePurposeRef.NotePurposeKey,NotePurposeRef.NotePurposeDesc FROM NotePurposeRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoOfferedCustomerExperience]'))
    DROP VIEW [dbo].[vBoOfferedCustomerExperience]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoOfferedCustomerExperience] AS SELECT CustomerExperience.CustomerExperienceKey,CustomerExperience.CustomerExperienceNote AS Note,CustomerExperience.CustomerExperienceStatusCode,CustomerExperience.UserKey,CustomerExperience.CreatedByUserKey,CustomerExperience.CreatedOn,OfferedCustomerExperience.OfferedCustomerExperienceGrade AS Grade,OfferedCustomerExperience.OfferedCustomerExperienceKey,OfferedCustomerExperience.OfferingKey,OfferedCustomerExperience.OfferedCustomerExperienceGradeKey,OfferedCustomerExperience.OfferedCustomerExperienceDate FROM CustomerExperience
	INNER JOIN OfferedCustomerExperience
		ON CustomerExperience.CustomerExperienceKey = OfferedCustomerExperience.OfferedCustomerExperienceKey
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoOffering]'))
    DROP VIEW [dbo].[vBoOffering]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoOffering] AS SELECT Offering.ContactKey AS Provider,Offering.ExperienceDefinitionKey,Offering.LocationKey AS Location,Offering.OfferingCode AS Code,Offering.OfferingDate AS Date,Offering.OfferingDesc AS Description,Offering.OfferingKey,Offering.OfferingName AS Name,Offering.UpdatedByUserKey,Offering.UpdatedOn,Offering.CreatedByUserKey,Offering.CreatedOn,Offering.MarkedForDeleteOn,Offering.OfferingStatusCode AS StatusCode,Offering.AllowChangesFlag AS AllowChanges,Offering.LinkedProgramKey FROM Offering
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoOfferingStatus]'))
    DROP VIEW [dbo].[vBoOfferingStatus]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoOfferingStatus] AS SELECT OfferingStatusRef.OfferingStatusCode AS Code,OfferingStatusRef.OfferingStatusName AS Name FROM OfferingStatusRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoOpenCreditPaymentDetail]'))
    DROP VIEW [dbo].[vBoOpenCreditPaymentDetail]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoOpenCreditPaymentDetail] AS SELECT PaymentDetail.CreatedByUserKey,PaymentDetail.CreatedOn,PaymentDetail.CurrencyCode,PaymentDetail.OriginalAmount,PaymentDetail.PaymentApplicationRestrictionCode,PaymentDetail.PaymentDetailKey,PaymentDetail.PaymentDetailStatusCode,PaymentDetail.PaymentMethodKey,PaymentDetail.PaymentTypeKey,PaymentDetail.PayorContactKey,PaymentDetail.ReferenceNumber,PaymentDetail.SerializedDetails,PaymentDetail.SummaryDisplay,PaymentDetail.UpdatedByUserKey,PaymentDetail.UpdatedOn,PaymentDetail.PaymentDetailBOName FROM PaymentDetail WHERE PaymentDetail.PaymentDetailBOName= 'OpenCreditPaymentDetail'
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vOppDonorContact]'))
    DROP VIEW [dbo].[vOppDonorContact]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vOppDonorContact]
AS
SELECT     OM.OpportunityKey, OM.Id AS OpportunityId, OM.Description AS OpportunityName, OM.OpportunityStatusCode AS OpportunityStatus, 
                      OM.CurrentActionPlanStageName AS CurrentStage, OMD.DecisionDate, OMD.Distribution, OMD.ResponseMedia, OMD.TimingProbability, 
                      OM.WinProbability, OMD.Actual, OMD.Potential, OMD.Quality, N.ID AS ProspectId, N.FULL_NAME AS ProspectName, 
                      N.FULL_ADDRESS AS ProspectAddress, N.MEMBER_TYPE AS ProspectMemberType, N.STATUS AS ProspectStatus, 
                      N.LAST_FIRST AS ProspectLastFirst, N.TITLE AS ProspectTitle, N.PREFIX AS ProspectPrefix, N.SUFFIX AS ProspectSuffix, 
                      N.DESIGNATION AS ProspectDesignation, N.INFORMAL AS ProspectInformal, N.WORK_PHONE AS ProspectWorkPhone, 
                      N.HOME_PHONE AS ProspectHomePhone, N.FAX AS ProspectFax, N.TOLL_FREE AS ProspectTollFree, N.EMAIL AS ProspectEmail, 
                      N.CITY AS ProspectCity, N.STATE_PROVINCE AS ProspectStateProvince, N.ZIP AS ProspectZip, N.COUNTRY AS ProspectCountry, 
                      N.FUNCTIONAL_TITLE AS ProspectFunctionalTitle, N.CONTACT_RANK AS ProspectContactRank, OGRR.GroupRoleName AS GroupName, 
					  GTR.GroupTypeName, OWN.ID AS Id, OWN.FULL_NAME AS Name, OWN.FULL_ADDRESS AS Address, OWN.MEMBER_TYPE AS MemberType, OWN.STATUS AS Status, 
                      OWN.LAST_FIRST AS LastFirst, OWN.TITLE AS Title, OWN.PREFIX AS Prefix, OWN.SUFFIX AS Suffix, OWN.DESIGNATION AS Designation, 
                      OWN.INFORMAL AS Informal, OWN.WORK_PHONE AS WorkPhone, OWN.HOME_PHONE AS HomePhone, OWN.FAX AS Fax, 
                      OWN.TOLL_FREE AS TollFree, OWN.EMAIL AS Email, OWN.CITY AS City, OWN.STATE_PROVINCE AS StateProvince, OWN.ZIP AS Zip, 
                      OWN.COUNTRY AS Country, OWN.FUNCTIONAL_TITLE AS FunctionalTitle, OWN.CONTACT_RANK AS ContactRank
FROM         dbo.OpportunityMain AS OM INNER JOIN
                      dbo.OpportunityMainDonor AS OMD ON OM.OpportunityKey = OMD.OpportunityKey LEFT OUTER JOIN
                      dbo.ContactMain AS CM ON OM.ProspectKey = CM.ContactKey LEFT OUTER JOIN
                      dbo.Name AS N ON CM.SyncContactID = N.ID LEFT OUTER JOIN
                      dbo.GroupMain AS OG ON OM.OpportunityOwnerGroupKey = OG.GroupKey LEFT OUTER JOIN
                      dbo.GroupMember AS OGM ON OG.GroupKey = OGM.GroupKey LEFT OUTER JOIN
					  dbo.GroupMemberDetail AS OGMD ON OGMD.GroupMemberKey = OGM.GroupMemberKey LEFT OUTER JOIN
					  dbo.GroupRoleRef AS OGRR ON OGRR.GroupRoleKey = OGMD.GroupRoleKey LEFT OUTER JOIN
                      dbo.ContactMain AS OUM ON OGM.MemberContactKey = OUM.ContactKey LEFT OUTER JOIN
                      dbo.Name AS OWN ON OUM.SyncContactID = OWN.ID INNER JOIN
                      dbo.GroupTypeRef AS GTR ON OG.GroupTypeKey = GTR.GroupTypeKey
WHERE     (OWN.ID IS NOT NULL)
UNION
SELECT     OM.OpportunityKey, OM.Id AS OpportunityId, OM.Description AS OpportunityName, OM.OpportunityStatusCode AS OpportunityStatus, 
                      OM.CurrentActionPlanStageName AS CurrentStage, OMD.DecisionDate, OMD.Distribution, OMD.ResponseMedia, OMD.TimingProbability, 
                      OM.WinProbability, OMD.Actual, OMD.Potential, OMD.Quality, N.ID AS ProspectId, N.FULL_NAME AS ProspectName, 
                      N.FULL_ADDRESS AS ProspectAddress, N.MEMBER_TYPE AS ProspectMemberType, N.STATUS AS ProspectStatus, 
                      N.LAST_FIRST AS ProspectLastFirst, N.TITLE AS ProspectTitle, N.PREFIX AS ProspectPrefix, N.SUFFIX AS ProspectSuffix, 
                      N.DESIGNATION AS ProspectDesignation, N.INFORMAL AS ProspectInformal, N.WORK_PHONE AS ProspectWorkPhone, 
                      N.HOME_PHONE AS ProspectHomePhone, N.FAX AS ProspectFax, N.TOLL_FREE AS ProspectTollFree, N.EMAIL AS ProspectEmail, 
                      N.CITY AS ProspectCity, N.STATE_PROVINCE AS ProspectStateProvince, N.ZIP AS ProspectZip, N.COUNTRY AS ProspectCountry, 
                      N.FUNCTIONAL_TITLE AS ProspectFunctionalTitle, N.CONTACT_RANK AS ProspectContactRank, CGRR.GroupRoleName AS GroupName,
                      GTR.GroupTypeName, CN.ID AS Id, CN.FULL_NAME AS Name, CN.FULL_ADDRESS AS Address, CN.MEMBER_TYPE AS MemberType, CN.STATUS AS Status, 
                      CN.LAST_FIRST AS LastFirst, CN.TITLE AS Title, CN.PREFIX AS Prefix, CN.SUFFIX AS Suffix, CN.DESIGNATION AS Designation, 
                      CN.INFORMAL AS Informal, CN.WORK_PHONE AS WorkPhone, CN.HOME_PHONE AS HomePhone, CN.FAX AS Fax, CN.TOLL_FREE AS TollFree, 
                      CN.EMAIL AS Email, CN.CITY AS City, CN.STATE_PROVINCE AS StateProvince, CN.ZIP AS Zip, CN.COUNTRY AS Country, 
                      CN.FUNCTIONAL_TITLE AS FunctionalTitle, CN.CONTACT_RANK AS ContactRank
FROM         dbo.OpportunityMain AS OM INNER JOIN
                      dbo.OpportunityMainDonor AS OMD ON OM.OpportunityKey = OMD.OpportunityKey LEFT OUTER JOIN
                      dbo.ContactMain AS CM ON OM.ProspectKey = CM.ContactKey LEFT OUTER JOIN
                      dbo.Name AS N ON CM.SyncContactID = N.ID LEFT OUTER JOIN
                      dbo.GroupMain AS CG ON OM.OpportunityContactGroupKey = CG.GroupKey LEFT OUTER JOIN
                      dbo.GroupMember AS CGM ON CG.GroupKey = CGM.GroupKey LEFT OUTER JOIN
					  dbo.GroupMemberDetail AS CGMD ON CGMD.GroupMemberKey = CGM.GroupMemberKey LEFT OUTER JOIN
					  dbo.GroupRoleRef AS CGRR ON CGRR.GroupRoleKey = CGMD.GroupRoleKey LEFT OUTER JOIN
                      dbo.ContactMain AS CCM ON CGM.MemberContactKey = CCM.ContactKey LEFT OUTER JOIN
                      dbo.Name AS CN ON CCM.SyncContactID = CN.ID INNER JOIN
                      dbo.GroupTypeRef AS GTR ON CG.GroupTypeKey = GTR.GroupTypeKey
WHERE     (CN.ID IS NOT NULL)

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoOppDonorContact]'))
    DROP VIEW [dbo].[vBoOppDonorContact]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoOppDonorContact] AS SELECT vOppDonorContact.Actual,vOppDonorContact.Address,vOppDonorContact.City,vOppDonorContact.ContactRank,vOppDonorContact.Country,vOppDonorContact.CurrentStage,vOppDonorContact.DecisionDate,vOppDonorContact.Designation,vOppDonorContact.Distribution,vOppDonorContact.Email,vOppDonorContact.Fax,vOppDonorContact.FunctionalTitle,vOppDonorContact.GroupName,vOppDonorContact.GroupTypeName,vOppDonorContact.HomePhone,vOppDonorContact.Id,vOppDonorContact.Informal,vOppDonorContact.LastFirst,vOppDonorContact.MemberType,vOppDonorContact.Name,vOppDonorContact.OpportunityId,vOppDonorContact.OpportunityKey,vOppDonorContact.OpportunityName,vOppDonorContact.OpportunityStatus,vOppDonorContact.Potential,vOppDonorContact.Prefix,vOppDonorContact.ProspectAddress,vOppDonorContact.ProspectCity,vOppDonorContact.ProspectContactRank,vOppDonorContact.ProspectCountry,vOppDonorContact.ProspectDesignation,vOppDonorContact.ProspectEmail,vOppDonorContact.ProspectFax,vOppDonorContact.ProspectFunctionalTitle,vOppDonorContact.ProspectHomePhone,vOppDonorContact.ProspectId,vOppDonorContact.ProspectInformal,vOppDonorContact.ProspectLastFirst,vOppDonorContact.ProspectMemberType,vOppDonorContact.ProspectName,vOppDonorContact.ProspectPrefix,vOppDonorContact.ProspectStateProvince,vOppDonorContact.ProspectStatus,vOppDonorContact.ProspectSuffix,vOppDonorContact.ProspectTitle,vOppDonorContact.ProspectTollFree,vOppDonorContact.ProspectWorkPhone,vOppDonorContact.ProspectZip,vOppDonorContact.Quality,vOppDonorContact.ResponseMedia,vOppDonorContact.StateProvince,vOppDonorContact.Status,vOppDonorContact.Suffix,vOppDonorContact.TimingProbability,vOppDonorContact.Title,vOppDonorContact.TollFree,vOppDonorContact.WinProbability,vOppDonorContact.WorkPhone,vOppDonorContact.Zip FROM vOppDonorContact
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vOppMemberContact]'))
    DROP VIEW [dbo].[vOppMemberContact]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vOppMemberContact]
AS
SELECT     OM.OpportunityKey, OM.Id AS OpportunityId, OM.Description AS OpportunityName, OM.OpportunityStatusCode AS OpportunityStatus, 
                      OM.CurrentActionPlanStageName AS CurrentStage, OMM.DecisionDate, OMM.Subscription, OMM.ResponseMedia, OMM.TimingProbability, 
                      OM.WinProbability, OMM.Actual, OMM.Potential, OMM.Quality, OMM.Units, N.ID AS ProspectId, N.FULL_NAME AS ProspectName, 
                      N.FULL_ADDRESS AS ProspectAddress, N.MEMBER_TYPE AS ProspectMemberType, N.STATUS AS ProspectStatus, 
                      N.LAST_FIRST AS ProspectLastFirst, N.TITLE AS ProspectTitle, N.PREFIX AS ProspectPrefix, N.SUFFIX AS ProspectSuffix, 
                      N.DESIGNATION AS ProspectDesignation, N.INFORMAL AS ProspectInformal, N.WORK_PHONE AS ProspectWorkPhone, 
                      N.HOME_PHONE AS ProspectHomePhone, N.FAX AS ProspectFax, N.TOLL_FREE AS ProspectTollFree, N.EMAIL AS ProspectEmail, 
                      N.CITY AS ProspectCity, N.STATE_PROVINCE AS ProspectStateProvince, N.ZIP AS ProspectZip, N.COUNTRY AS ProspectCountry, 
                      N.FUNCTIONAL_TITLE AS ProspectFunctionalTitle, N.CONTACT_RANK AS ProspectContactRank, OGRR.GroupRoleName AS GroupName, 
                      GTR.GroupTypeName AS GroupType, OWN.ID AS Id, OWN.FULL_NAME AS Name, OWN.FULL_ADDRESS AS Address, 
                      OWN.MEMBER_TYPE AS MemberType, OWN.STATUS AS Status, OWN.LAST_FIRST AS LastFirst, OWN.TITLE AS Title, OWN.PREFIX AS Prefix, 
                      OWN.SUFFIX AS Suffix, OWN.DESIGNATION AS Designation, OWN.INFORMAL AS Informal, OWN.WORK_PHONE AS WorkPhone, 
                      OWN.HOME_PHONE AS HomePhone, OWN.FAX AS Fax, OWN.TOLL_FREE AS TollFree, OWN.EMAIL AS Email, OWN.CITY AS City, 
                      OWN.STATE_PROVINCE AS StateProvince, OWN.ZIP AS Zip, OWN.COUNTRY AS Country, OWN.FUNCTIONAL_TITLE AS FunctionalTitle, 
                      OWN.CONTACT_RANK AS ContactRank
FROM         dbo.OpportunityMain AS OM INNER JOIN
                      dbo.OpportunityMainMember AS OMM ON OM.OpportunityKey = OMM.OpportunityKey LEFT OUTER JOIN
                      dbo.ContactMain AS UM ON OM.ProspectKey = UM.ContactKey LEFT OUTER JOIN
                      dbo.Name AS N ON UM.SyncContactID = N.ID LEFT OUTER JOIN
                      dbo.GroupMain AS OG ON OM.OpportunityOwnerGroupKey = OG.GroupKey LEFT OUTER JOIN
                      dbo.GroupMember AS OGM ON OG.GroupKey = OGM.GroupKey LEFT OUTER JOIN
					  dbo.GroupMemberDetail AS OGMD ON OGMD.GroupMemberKey = OGM.GroupMemberKey LEFT OUTER JOIN
					  dbo.GroupRoleRef AS OGRR ON OGRR.GroupRoleKey = OGMD.GroupRoleKey LEFT OUTER JOIN
                      dbo.ContactMain AS OUM ON OGM.MemberContactKey = OUM.ContactKey LEFT OUTER JOIN
                      dbo.Name AS OWN ON OUM.SyncContactID = OWN.ID INNER JOIN
                      dbo.GroupTypeRef AS GTR ON OG.GroupTypeKey = GTR.GroupTypeKey
WHERE     (OWN.ID IS NOT NULL)
UNION
SELECT     OM.OpportunityKey, OM.Id AS OpportunityId, OM.Description AS OpportunityName, OM.OpportunityStatusCode AS OpportunityStatus, 
                      OM.CurrentActionPlanStageName AS CurrentStage, OMM.DecisionDate, OMM.Subscription, OMM.ResponseMedia, OMM.TimingProbability, 
                      OM.WinProbability, OMM.Actual, OMM.Potential, OMM.Quality, OMM.Units, N.ID AS ProspectId, N.FULL_NAME AS ProspectName, 
                      N.FULL_ADDRESS AS ProspectAddress, N.MEMBER_TYPE AS ProspectMemberType, N.STATUS AS ProspectStatus, 
                      N.LAST_FIRST AS ProspectLastFirst, N.TITLE AS ProspectTitle, N.PREFIX AS ProspectPrefix, N.SUFFIX AS ProspectSuffix, 
                      N.DESIGNATION AS ProspectDesignation, N.INFORMAL AS ProspectInformal, N.WORK_PHONE AS ProspectWorkPhone, 
                      N.HOME_PHONE AS ProspectHomePhone, N.FAX AS ProspectFax, N.TOLL_FREE AS ProspectTollFree, N.EMAIL AS ProspectEmail, 
                      N.CITY AS ProspectCity, N.STATE_PROVINCE AS ProspectStateProvince, N.ZIP AS ProspectZip, N.COUNTRY AS ProspectCountry, 
                      N.FUNCTIONAL_TITLE AS ProspectFunctionalTitle, N.CONTACT_RANK AS ProspectContactRank, CGRR.GroupRoleName AS GroupName, 
                      GTR.GroupTypeName AS GroupType, CN.ID AS Id, CN.FULL_NAME AS Name, CN.FULL_ADDRESS AS Address, CN.MEMBER_TYPE AS MemberType, 
                      CN.STATUS AS Status, CN.LAST_FIRST AS LastFirst, CN.TITLE AS Title, CN.PREFIX AS Prefix, CN.SUFFIX AS Suffix, CN.DESIGNATION AS Designation, 
                      CN.INFORMAL AS Informal, CN.WORK_PHONE AS WorkPhone, CN.HOME_PHONE AS HomePhone, CN.FAX AS Fax, CN.TOLL_FREE AS TollFree, 
                      CN.EMAIL AS Email, CN.CITY AS City, CN.STATE_PROVINCE AS StateProvince, CN.ZIP AS Zip, CN.COUNTRY AS Country, 
                      CN.FUNCTIONAL_TITLE AS FunctionalTitle, CN.CONTACT_RANK AS ContactRank
FROM         dbo.OpportunityMain AS OM INNER JOIN
                      dbo.OpportunityMainMember AS OMM ON OM.OpportunityKey = OMM.OpportunityKey LEFT OUTER JOIN
                      dbo.ContactMain AS UM ON OM.ProspectKey = UM.ContactKey LEFT OUTER JOIN
                      dbo.Name AS N ON UM.SyncContactID = N.ID LEFT OUTER JOIN
                      dbo.GroupMain AS CG ON OM.OpportunityContactGroupKey = CG.GroupKey LEFT OUTER JOIN
                      dbo.GroupMember AS CGM ON CG.GroupKey = CGM.GroupKey LEFT OUTER JOIN
					  dbo.GroupMemberDetail AS CGMD ON CGMD.GroupMemberKey = CGM.GroupMemberKey LEFT OUTER JOIN
					  dbo.GroupRoleRef AS CGRR ON CGRR.GroupRoleKey = CGMD.GroupRoleKey LEFT OUTER JOIN
                      dbo.ContactMain AS CUM ON CGM.MemberContactKey = CUM.ContactKey LEFT OUTER JOIN
                      dbo.Name AS CN ON CUM.SyncContactID = CN.ID INNER JOIN 
                      dbo.GroupTypeRef AS GTR ON CG.GroupTypeKey = GTR.GroupTypeKey
WHERE     (CN.ID IS NOT NULL)

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoOppMemberContact]'))
    DROP VIEW [dbo].[vBoOppMemberContact]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoOppMemberContact] AS SELECT vOppMemberContact.Actual,vOppMemberContact.Address,vOppMemberContact.City,vOppMemberContact.ContactRank,vOppMemberContact.Country,vOppMemberContact.CurrentStage,vOppMemberContact.DecisionDate,vOppMemberContact.Designation,vOppMemberContact.Email,vOppMemberContact.Fax,vOppMemberContact.FunctionalTitle,vOppMemberContact.GroupName,vOppMemberContact.GroupType,vOppMemberContact.HomePhone,vOppMemberContact.Id,vOppMemberContact.Informal,vOppMemberContact.LastFirst,vOppMemberContact.MemberType,vOppMemberContact.Name,vOppMemberContact.OpportunityId,vOppMemberContact.OpportunityKey,vOppMemberContact.OpportunityName,vOppMemberContact.OpportunityStatus,vOppMemberContact.Potential,vOppMemberContact.Prefix,vOppMemberContact.ProspectAddress,vOppMemberContact.ProspectCity,vOppMemberContact.ProspectContactRank,vOppMemberContact.ProspectCountry,vOppMemberContact.ProspectDesignation,vOppMemberContact.ProspectEmail,vOppMemberContact.ProspectFax,vOppMemberContact.ProspectFunctionalTitle,vOppMemberContact.ProspectHomePhone,vOppMemberContact.ProspectId,vOppMemberContact.ProspectInformal,vOppMemberContact.ProspectLastFirst,vOppMemberContact.ProspectMemberType,vOppMemberContact.ProspectName,vOppMemberContact.ProspectPrefix,vOppMemberContact.ProspectStateProvince,vOppMemberContact.ProspectStatus,vOppMemberContact.ProspectSuffix,vOppMemberContact.ProspectTitle,vOppMemberContact.ProspectTollFree,vOppMemberContact.ProspectWorkPhone,vOppMemberContact.ProspectZip,vOppMemberContact.Quality,vOppMemberContact.ResponseMedia,vOppMemberContact.StateProvince,vOppMemberContact.Status,vOppMemberContact.Subscription,vOppMemberContact.Suffix,vOppMemberContact.TimingProbability,vOppMemberContact.Title,vOppMemberContact.TollFree,vOppMemberContact.Units,vOppMemberContact.WinProbability,vOppMemberContact.WorkPhone,vOppMemberContact.Zip FROM vOppMemberContact
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoOpportunity]'))
    DROP VIEW [dbo].[vBoOpportunity]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoOpportunity]
AS
SELECT OpportunityMain.ActionManifest,OpportunityMain.Description,OpportunityMain.ExpirationDate,OpportunityMain.OpportunityTypeKey,OpportunityMain.ProspectKey,OpportunityMain.SourceCodeKey,OpportunityMain.UpdatedByUserKey,OpportunityMain.UpdatedOn,OpportunityMain.Id,OpportunityMain.CurrentActionPlanStageName,OpportunityMain.WinProbability,OpportunityMain.ProductKey,OpportunityMain.OpportunityContactGroupKey,OpportunityMain.OpportunityOwnerGroupKey,OpportunityMain.OpportunityKey,OpportunityMain.CreatedByUserKey,OpportunityMain.CreatedOn,OpportunityMain.AccessKey,OpportunityMain.SystemEntityKey,OpportunityMain.OpportunityStatusCode
  FROM OpportunityMain
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoOpportunityClassRef]'))
    DROP VIEW [dbo].[vBoOpportunityClassRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoOpportunityClassRef] AS SELECT OpportunityClassRef.OpportunityClassCode,OpportunityClassRef.OpportunityClassDesc,OpportunityClassRef.OpportunityClassName FROM OpportunityClassRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoOpportunityCompetitor]'))
    DROP VIEW [dbo].[vBoOpportunityCompetitor]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoOpportunityCompetitor] AS SELECT OpportunityCompetitor.CompetitorWonOpportunityFlag AS CompetitorWonOpportunity,OpportunityCompetitor.CreatedByUserKey,OpportunityCompetitor.CreatedOn,OpportunityCompetitor.DemoGivenFlag AS DemoGiven,OpportunityCompetitor.Notes,OpportunityCompetitor.OpportunityCompetitorKey,OpportunityCompetitor.OpportunityKey,OpportunityCompetitor.UpdatedByUserKey,OpportunityCompetitor.UpdatedOn,OpportunityCompetitor.CompetitorContactKey FROM OpportunityCompetitor
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoOpportunityDefaultStatusRef]'))
    DROP VIEW [dbo].[vBoOpportunityDefaultStatusRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoOpportunityDefaultStatusRef] AS SELECT OpportunityDefaultStatusRef.OpportunityDefaultStatusCode,OpportunityDefaultStatusRef.OpportunityDefaultStatusDesc,OpportunityDefaultStatusRef.OpportunityDefaultStatusName FROM OpportunityDefaultStatusRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoOpportunityDonor]'))
    DROP VIEW [dbo].[vBoOpportunityDonor]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoOpportunityDonor]
AS
SELECT OpportunityMain.ActionManifest,OpportunityMain.Description,OpportunityMain.ExpirationDate,OpportunityMain.OpportunityTypeKey,OpportunityMain.ProspectKey,OpportunityMain.SourceCodeKey,OpportunityMain.UpdatedByUserKey,OpportunityMain.UpdatedOn,OpportunityMain.Id,OpportunityMain.CurrentActionPlanStageName,OpportunityMain.WinProbability,OpportunityMain.ProductKey,OpportunityMain.OpportunityContactGroupKey,OpportunityMain.OpportunityOwnerGroupKey,OpportunityMain.OpportunityKey,OpportunityMain.CreatedByUserKey,OpportunityMain.CreatedOn,OpportunityMain.AccessKey,OpportunityMain.SystemEntityKey,OpportunityMain.OpportunityStatusCode,OpportunityMainDonor.DecisionDate AS DecisionDate1,OpportunityMainDonor.Distribution,OpportunityMainDonor.Quality AS Quality1,OpportunityMainDonor.ResponseMedia AS ResponseMedia1,OpportunityMainDonor.TimingProbability AS TimingProbability1,OpportunityMainDonor.Actual,OpportunityMainDonor.Potential
  FROM OpportunityMain
	INNER JOIN OpportunityMainDonor
		ON OpportunityMain.OpportunityKey = OpportunityMainDonor.OpportunityKey
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoOpportunityHistory]'))
    DROP VIEW [dbo].[vBoOpportunityHistory]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoOpportunityHistory] AS SELECT OpportunityHistory.Notes,OpportunityHistory.OpportunityHistoryKey,OpportunityHistory.OpportunityKey,OpportunityHistory.PropertyName,OpportunityHistory.UpdatedByUserKey,OpportunityHistory.UpdatedOn,OpportunityHistory.CurrentValue,OpportunityHistory.OriginalValue FROM OpportunityHistory
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoOpportunityMember]'))
    DROP VIEW [dbo].[vBoOpportunityMember]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoOpportunityMember]
AS
SELECT OpportunityMain.ActionManifest,OpportunityMain.Description,OpportunityMain.ExpirationDate,OpportunityMain.OpportunityTypeKey,OpportunityMain.ProspectKey,OpportunityMain.SourceCodeKey,OpportunityMain.UpdatedByUserKey,OpportunityMain.UpdatedOn,OpportunityMain.Id,OpportunityMain.CurrentActionPlanStageName,OpportunityMain.WinProbability,OpportunityMain.ProductKey,OpportunityMain.OpportunityContactGroupKey,OpportunityMain.OpportunityOwnerGroupKey,OpportunityMain.OpportunityKey,OpportunityMain.CreatedByUserKey,OpportunityMain.CreatedOn,OpportunityMain.AccessKey,OpportunityMain.SystemEntityKey,OpportunityMain.OpportunityStatusCode,OpportunityMainMember.DecisionDate AS DecisionDate2,OpportunityMainMember.Quality AS Quality2,OpportunityMainMember.ResponseMedia AS ResponseMedia2,OpportunityMainMember.Subscription,OpportunityMainMember.Units AS Units1,OpportunityMainMember.TimingProbability,OpportunityMainMember.Actual AS Actual1,OpportunityMainMember.Potential AS Potential1
  FROM OpportunityMain
	INNER JOIN OpportunityMainMember
		ON OpportunityMain.OpportunityKey = OpportunityMainMember.OpportunityKey
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoOpportunityReport]'))
    DROP VIEW [dbo].[vBoOpportunityReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoOpportunityReport] AS SELECT vOpportunityReport.Actual,vOpportunityReport.CreatedOn,vOpportunityReport.CurrentStage,vOpportunityReport.DecisionDate,vOpportunityReport.ExpirationDate,vOpportunityReport.GroupName,vOpportunityReport.GroupTypeKey,vOpportunityReport.OpportunityClass,vOpportunityReport.OpportunityId,vOpportunityReport.OpportunityKey,vOpportunityReport.OpportunityName,vOpportunityReport.OpportunityOwnerGroupKey,vOpportunityReport.OpportunityStatus,vOpportunityReport.OpportunityType,vOpportunityReport.OpportunityTypeKey,vOpportunityReport.OwnerId,vOpportunityReport.OwnerName,vOpportunityReport.Potential,vOpportunityReport.ProductInterest,vOpportunityReport.ProspectCompany,vOpportunityReport.ProspectId,vOpportunityReport.ProspectName,vOpportunityReport.Quality,vOpportunityReport.ResponseMedia,vOpportunityReport.SourceCodeKey,vOpportunityReport.TimingProbability,vOpportunityReport.Units,vOpportunityReport.UpdatedOn,vOpportunityReport.WinProbability,vOpportunityReport.OpportunityContactGroupKey,vOpportunityReport.OwnerRole FROM vOpportunityReport
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoOpportunitySales]'))
    DROP VIEW [dbo].[vBoOpportunitySales]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoOpportunitySales]
AS
SELECT OpportunityMain.ActionManifest,OpportunityMain.Description,OpportunityMain.ExpirationDate,OpportunityMain.OpportunityTypeKey,OpportunityMain.ProspectKey,OpportunityMain.SourceCodeKey,OpportunityMain.UpdatedByUserKey,OpportunityMain.UpdatedOn,OpportunityMain.Id,OpportunityMain.CurrentActionPlanStageName,OpportunityMain.WinProbability,OpportunityMain.ProductKey,OpportunityMain.OpportunityContactGroupKey,OpportunityMain.OpportunityOwnerGroupKey,OpportunityMain.OpportunityKey,OpportunityMain.CreatedByUserKey,OpportunityMain.CreatedOn,OpportunityMain.AccessKey,OpportunityMain.SystemEntityKey,OpportunityMain.OpportunityStatusCode,OpportunityMainSales.DecisionDate,OpportunityMainSales.Product,OpportunityMainSales.Quality,OpportunityMainSales.ResponseMedia,OpportunityMainSales.Units,OpportunityMainSales.ActualSales,OpportunityMainSales.PotentialSales,OpportunityMainSales.TimingProbability AS TimingProbability2
  FROM OpportunityMain
	INNER JOIN OpportunityMainSales
		ON OpportunityMain.OpportunityKey = OpportunityMainSales.OpportunityKey
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vOpportunitySalesReport]'))
    DROP VIEW [dbo].[vOpportunitySalesReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vOpportunitySalesReport]
AS
SELECT DISTINCT 
                      OM.Id, OM.OpportunityStatusCode, OM.CurrentActionPlanStageName, OM.WinProbability, OM.ExpirationDate, OM.OpportunityKey, OMS.DecisionDate, 
                      OMS.PotentialSales, OMS.ActualSales, OMS.Product, OMS.TimingProbability, OMS.Units, OMS.Quality, OMS.ResponseMedia, OT.OpportunityClass, 
                      OT.Name AS OpportunityType, '' AS OwnerSubRoleNames, '' AS ContactSubRoleNames, CMOG.FullName AS OwnerName, 
                      CMP.FullName AS ProspectName, CMC.FullName AS ContactName, GRR.GroupRoleDesc, OM.Description
FROM         dbo.OpportunityMain AS OM INNER JOIN
                      dbo.OpportunityMainSales AS OMS ON OM.OpportunityKey = OMS.OpportunityKey LEFT OUTER JOIN
                      dbo.OpportunityType AS OT ON OM.OpportunityTypeKey = OT.OpportunityTypeKey LEFT OUTER JOIN
                      dbo.GroupMember AS GMEMOG ON OM.OpportunityOwnerGroupKey = GMEMOG.GroupKey LEFT OUTER JOIN
                      dbo.ContactMain AS CMOG ON GMEMOG.MemberContactKey = CMOG.ContactKey LEFT OUTER JOIN
                      dbo.ContactMain AS CMP ON OM.ProspectKey = CMP.ContactKey LEFT OUTER JOIN
                      dbo.GroupMember AS GMEMCG ON OM.OpportunityContactGroupKey = GMEMCG.GroupKey LEFT OUTER JOIN
                      dbo.ContactMain AS CMC ON GMEMCG.MemberContactKey = CMC.ContactKey LEFT OUTER JOIN
                      dbo.GroupMemberDetail AS GMD ON GMEMOG.GroupMemberKey = GMD.GroupMemberKey LEFT OUTER JOIN
                      dbo.GroupRoleRef AS GRR ON GMD.GroupRoleKey = GRR.GroupRoleKey

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoOpportunitySalesReport]'))
    DROP VIEW [dbo].[vBoOpportunitySalesReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoOpportunitySalesReport] AS SELECT vOpportunitySalesReport.ActualSales,vOpportunitySalesReport.ContactName,vOpportunitySalesReport.ContactSubRoleNames,vOpportunitySalesReport.CurrentActionPlanStageName,vOpportunitySalesReport.DecisionDate,vOpportunitySalesReport.Description,vOpportunitySalesReport.ExpirationDate,vOpportunitySalesReport.GroupRoleDesc,vOpportunitySalesReport.Id,vOpportunitySalesReport.OpportunityClass,vOpportunitySalesReport.OpportunityKey,vOpportunitySalesReport.OpportunityType,vOpportunitySalesReport.OwnerName,vOpportunitySalesReport.OwnerSubRoleNames,vOpportunitySalesReport.PotentialSales,vOpportunitySalesReport.Product,vOpportunitySalesReport.ProspectName,vOpportunitySalesReport.Quality,vOpportunitySalesReport.ResponseMedia,vOpportunitySalesReport.OpportunityStatusCode AS Status,vOpportunitySalesReport.TimingProbability,vOpportunitySalesReport.Units,vOpportunitySalesReport.WinProbability FROM vOpportunitySalesReport
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoOpportunityStatusRef]'))
    DROP VIEW [dbo].[vBoOpportunityStatusRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoOpportunityStatusRef] AS SELECT OpportunityStatusRef.OpportunityStatusCode,OpportunityStatusRef.OpportunityStatusDesc,OpportunityStatusRef.OpportunityStatusName FROM OpportunityStatusRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vOpportunityTaskUser]'))
    DROP VIEW [dbo].[vOpportunityTaskUser]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vOpportunityTaskUser]
AS
SELECT [dbo].[TaskItem].[OpportunityKey], [dbo].[GroupMember].[MemberContactKey] as UserKey, [dbo].[TaskItem].[Subject], [dbo].[TaskItem].[Category], [dbo].[TaskItemStatusRef].[TaskItemStatusName], [dbo].[TaskItem].[StartDate], [dbo].[TaskItem].[DueDate], [dbo].[TaskItem].[TaskItemKey]
FROM [dbo].[TaskItem]
	INNER JOIN [dbo].[OpportunityMain] ON 
		[dbo].[TaskItem].[OpportunityKey] = [dbo].[OpportunityMain].[OpportunityKey]
	INNER JOIN [dbo].[GroupMemberDetail] ON
		[dbo].[TaskItem].[AssignedToKey] = [dbo].[GroupMemberDetail].[GroupRoleKey]
	INNER JOIN [dbo].[GroupMember] ON
		[dbo].[GroupMemberDetail].[GroupMemberKey] = [dbo].[GroupMember].[GroupMemberKey] AND
		[dbo].[OpportunityMain].[OpportunityOwnerGroupKey] = [GroupMember].[GroupKey]
	INNER JOIN [dbo].[TaskItemStatusRef] ON
		[dbo].[TaskItem].[TaskItemStatusCode] = [dbo].[TaskItemStatusRef].[TaskItemStatusCode]
UNION 
SELECT [dbo].[TaskItem].[OpportunityKey], [dbo].[UserToken].[UserKey], [dbo].[TaskItem].[Subject], [dbo].[TaskItem].[Category], [dbo].[TaskItemStatusRef].[TaskItemStatusName], [dbo].[TaskItem].[StartDate], [dbo].[TaskItem].[DueDate], [dbo].[TaskItem].[TaskItemKey]
FROM [dbo].[TaskItem]
	INNER JOIN [dbo].[UserToken] ON
		[dbo].[UserToken].[Grantee] = [dbo].[TaskItem].[AssignedToKey]
	INNER JOIN [dbo].[TaskItemStatusRef] ON
		[dbo].[TaskItem].[TaskItemStatusCode] = [dbo].[TaskItemStatusRef].[TaskItemStatusCode]

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoOpportunityTaskUser]'))
    DROP VIEW [dbo].[vBoOpportunityTaskUser]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoOpportunityTaskUser] AS SELECT vOpportunityTaskUser.Category,vOpportunityTaskUser.DueDate,vOpportunityTaskUser.OpportunityKey,vOpportunityTaskUser.StartDate,vOpportunityTaskUser.Subject,vOpportunityTaskUser.TaskItemKey,vOpportunityTaskUser.TaskItemStatusName,vOpportunityTaskUser.UserKey FROM vOpportunityTaskUser
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoOpportunityType]'))
    DROP VIEW [dbo].[vBoOpportunityType]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoOpportunityType] AS SELECT OpportunityType.AllowCompetitorsFlag,OpportunityType.DefaultActionPlanKey,OpportunityType.DefaultOwnerKey,OpportunityType.DefaultStatus,OpportunityType.Description,OpportunityType.Name,OpportunityType.UpdatedByUserKey,OpportunityType.UpdatedOn,OpportunityType.OpportunityClass,OpportunityType.OpportunityTypeKey,OpportunityType.AccessKey,OpportunityType.SystemEntityKey,OpportunityType.CreatedByUserKey,OpportunityType.CreatedOn,OpportunityType.ContactGroupTypeKey,OpportunityType.OwnerGroupTypeKey,OpportunityType.OpportunityCreationGroupKey FROM OpportunityType
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vOppSalesContact]'))
    DROP VIEW [dbo].[vOppSalesContact]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vOppSalesContact]
AS
SELECT     OM.OpportunityKey, OM.Id AS OpportunityId, OM.Description AS OpportunityName, OM.OpportunityStatusCode AS OpportunityStatus, 
                      OM.CurrentActionPlanStageName AS CurrentStage, OMS.DecisionDate, OMS.Product, OMS.ResponseMedia, OMS.TimingProbability, 
                      OM.WinProbability, OMS.ActualSales, OMS.PotentialSales, OMS.Units, OMS.Quality, N.ID AS ProspectId, N.FULL_NAME AS ProspectName, 
                      N.FULL_ADDRESS AS ProspectAddress, N.MEMBER_TYPE AS ProspectMemberType, N.STATUS AS ProspectStatus, 
                      N.LAST_FIRST AS ProspectLastFirst, N.TITLE AS ProspectTitle, N.PREFIX AS ProspectPrefix, N.SUFFIX AS ProspectSuffix, 
                      N.DESIGNATION AS ProspectDesignation, N.INFORMAL AS ProspectInformal, N.WORK_PHONE AS ProspectWorkPhone, 
                      N.HOME_PHONE AS ProspectHomePhone, N.FAX AS ProspectFax, N.TOLL_FREE AS ProspectTollFree, N.EMAIL AS ProspectEmail, 
                      N.CITY AS ProspectCity, N.STATE_PROVINCE AS ProspectStateProvince, N.ZIP AS ProspectZip, N.COUNTRY AS ProspectCountry, 
                      N.FUNCTIONAL_TITLE AS ProspectFunctionalTitle, N.CONTACT_RANK AS ProspectContactRank, OGRR.GroupRoleName AS GroupName, 
                      GTR.GroupTypeName AS GroupType, OWN.ID AS Id, OWN.FULL_NAME AS Name, OWN.FULL_ADDRESS AS Address, 
                      OWN.MEMBER_TYPE AS MemberType, OWN.STATUS AS Status, OWN.LAST_FIRST AS LastFirst, OWN.TITLE AS Title, OWN.PREFIX AS Prefix, 
                      OWN.SUFFIX AS Suffix, OWN.DESIGNATION AS Designation, OWN.INFORMAL AS Informal, OWN.WORK_PHONE AS WorkPhone, 
                      OWN.HOME_PHONE AS HomePhone, OWN.FAX AS Fax, OWN.TOLL_FREE AS TollFree, OWN.EMAIL AS Email, OWN.CITY AS City, 
                      OWN.STATE_PROVINCE AS StateProvince, OWN.ZIP AS Zip, OWN.COUNTRY AS Country, OWN.FUNCTIONAL_TITLE AS FunctionalTitle, 
                      OWN.CONTACT_RANK AS ContactRank
FROM         dbo.OpportunityMain AS OM INNER JOIN
                      dbo.OpportunityMainSales AS OMS ON OM.OpportunityKey = OMS.OpportunityKey LEFT OUTER JOIN
                      dbo.ContactMain AS CM ON OM.ProspectKey = CM.ContactKey LEFT OUTER JOIN
                      dbo.Name AS N ON CM.SyncContactID = N.ID LEFT OUTER JOIN
                      dbo.GroupMain AS OG ON OM.OpportunityOwnerGroupKey = OG.GroupKey LEFT OUTER JOIN
                      dbo.GroupMember AS OGM ON OG.GroupKey = OGM.GroupKey LEFT OUTER JOIN
					  dbo.GroupMemberDetail AS OGMD ON OGMD.GroupMemberKey = OGM.GroupMemberKey LEFT OUTER JOIN
					  dbo.GroupRoleRef AS OGRR ON OGRR.GroupRoleKey = OGMD.GroupRoleKey LEFT OUTER JOIN
                      dbo.ContactMain AS OUM ON OGM.MemberContactKey = OUM.ContactKey LEFT OUTER JOIN
                      dbo.Name AS OWN ON OUM.SyncContactID = OWN.ID INNER JOIN
                      dbo.GroupTypeRef AS GTR ON GTR.GroupTypeKey = OG.GroupTypeKey
WHERE     (OWN.ID IS NOT NULL)
UNION
SELECT     OM.OpportunityKey, OM.Id AS OpportunityId, OM.Description AS OpportunityName, OM.OpportunityStatusCode AS OpportunityStatus, 
                      OM.CurrentActionPlanStageName AS CurrentStage, OMS.DecisionDate, OMS.Product, OMS.ResponseMedia, OMS.TimingProbability, 
                      OM.WinProbability, OMS.ActualSales, OMS.PotentialSales, OMS.Units, OMS.Quality, N.ID AS ProspectId, N.FULL_NAME AS ProspectName, 
                      N.FULL_ADDRESS AS ProspectAddress, N.MEMBER_TYPE AS ProspectMemberType, N.STATUS AS ProspectStatus, 
                      N.LAST_FIRST AS ProspectLastFirst, N.TITLE AS ProspectTitle, N.PREFIX AS ProspectPrefix, N.SUFFIX AS ProspectSuffix, 
                      N.DESIGNATION AS ProspectDesignation, N.INFORMAL AS ProspectInformal, N.WORK_PHONE AS ProspectWorkPhone, 
                      N.HOME_PHONE AS ProspectHomePhone, N.FAX AS ProspectFax, N.TOLL_FREE AS ProspectTollFree, N.EMAIL AS ProspectEmail, 
                      N.CITY AS ProspectCity, N.STATE_PROVINCE AS ProspectStateProvince, N.ZIP AS ProspectZip, N.COUNTRY AS ProspectCountry, 
                      N.FUNCTIONAL_TITLE AS ProspectFunctionalTitle, N.CONTACT_RANK AS ProspectContactRank, CGRR.GroupRoleName AS GroupName, 
                      GTR.GroupTypeName AS GroupType, CN.ID AS Id, CN.FULL_NAME AS Name, CN.FULL_ADDRESS AS Address, CN.MEMBER_TYPE AS MemberType, 
                      CN.STATUS AS Status, CN.LAST_FIRST AS LastFirst, CN.TITLE AS Title, CN.PREFIX AS Prefix, CN.SUFFIX AS Suffix, CN.DESIGNATION AS Designation, 
                      CN.INFORMAL AS Informal, CN.WORK_PHONE AS WorkPhone, CN.HOME_PHONE AS HomePhone, CN.FAX AS Fax, CN.TOLL_FREE AS TollFree, 
                      CN.EMAIL AS Email, CN.CITY AS City, CN.STATE_PROVINCE AS StateProvince, CN.ZIP AS Zip, CN.COUNTRY AS Country, 
                      CN.FUNCTIONAL_TITLE AS FunctionalTitle, CN.CONTACT_RANK AS ContactRank
FROM         dbo.OpportunityMain AS OM INNER JOIN
                      dbo.OpportunityMainSales AS OMS ON OM.OpportunityKey = OMS.OpportunityKey LEFT OUTER JOIN
                      dbo.ContactMain AS UM ON OM.ProspectKey = UM.ContactKey LEFT OUTER JOIN
                      dbo.Name AS N ON UM.SyncContactID = N.ID LEFT OUTER JOIN
                      dbo.GroupMain AS CG ON OM.OpportunityContactGroupKey = CG.GroupKey LEFT OUTER JOIN
                      dbo.GroupMember AS CGM ON CG.GroupKey = CGM.GroupKey LEFT OUTER JOIN
					  dbo.GroupMemberDetail AS CGMD ON CGMD.GroupMemberKey = CGM.GroupMemberKey LEFT OUTER JOIN
					  dbo.GroupRoleRef AS CGRR ON CGRR.GroupRoleKey = CGMD.GroupRoleKey LEFT OUTER JOIN
                      dbo.ContactMain AS CCM ON CGM.MemberContactKey = CCM.ContactKey LEFT OUTER JOIN
                      dbo.Name AS CN ON CCM.SyncContactID = CN.ID INNER JOIN
                      dbo.GroupTypeRef AS GTR ON GTR.GroupTypeKey = CG.GroupTypeKey
WHERE     (CN.ID IS NOT NULL)

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoOppSalesContact]'))
    DROP VIEW [dbo].[vBoOppSalesContact]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoOppSalesContact] AS SELECT vOppSalesContact.ActualSales,vOppSalesContact.Address,vOppSalesContact.City,vOppSalesContact.ContactRank,vOppSalesContact.Country,vOppSalesContact.CurrentStage,vOppSalesContact.DecisionDate,vOppSalesContact.Designation,vOppSalesContact.Email,vOppSalesContact.Fax,vOppSalesContact.FunctionalTitle,vOppSalesContact.GroupName,vOppSalesContact.GroupType,vOppSalesContact.HomePhone,vOppSalesContact.Id,vOppSalesContact.Informal,vOppSalesContact.LastFirst,vOppSalesContact.MemberType,vOppSalesContact.Name,vOppSalesContact.OpportunityId,vOppSalesContact.OpportunityKey,vOppSalesContact.OpportunityName,vOppSalesContact.OpportunityStatus,vOppSalesContact.PotentialSales,vOppSalesContact.Prefix,vOppSalesContact.Product,vOppSalesContact.ProspectAddress,vOppSalesContact.ProspectCity,vOppSalesContact.ProspectContactRank,vOppSalesContact.ProspectCountry,vOppSalesContact.ProspectDesignation,vOppSalesContact.ProspectEmail,vOppSalesContact.ProspectFax,vOppSalesContact.ProspectFunctionalTitle,vOppSalesContact.ProspectHomePhone,vOppSalesContact.ProspectId,vOppSalesContact.ProspectInformal,vOppSalesContact.ProspectLastFirst,vOppSalesContact.ProspectMemberType,vOppSalesContact.ProspectName,vOppSalesContact.ProspectPrefix,vOppSalesContact.ProspectStateProvince,vOppSalesContact.ProspectStatus,vOppSalesContact.ProspectSuffix,vOppSalesContact.ProspectTitle,vOppSalesContact.ProspectTollFree,vOppSalesContact.ProspectWorkPhone,vOppSalesContact.ProspectZip,vOppSalesContact.Quality,vOppSalesContact.ResponseMedia,vOppSalesContact.StateProvince,vOppSalesContact.Status,vOppSalesContact.Suffix,vOppSalesContact.TimingProbability,vOppSalesContact.Title,vOppSalesContact.TollFree,vOppSalesContact.Units,vOppSalesContact.WinProbability,vOppSalesContact.WorkPhone,vOppSalesContact.Zip FROM vOppSalesContact
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoOrder]'))
    DROP VIEW [dbo].[vBoOrder]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoOrder] AS SELECT OrderMain.OrderTypeKey,OrderMain.OrderDate,OrderMain.DefaultWarehouseKey,OrderMain.ReqShipDate,OrderMain.RetAuthNumber,OrderMain.SourceCodeKey,OrderMain.ConversionRate,OrderMain.Discount,OrderMain.LineTotal,OrderMain.OrderTotal,OrderMain.ShippingTotal,OrderMain.TaxTotal,OrderMain.UpdatedByUserKey,OrderMain.UpdatedOn,OrderMain.IsReturn,OrderMain.PurchaseOrderNumber,OrderMain.ReasonCodeKey,OrderMain.DiscountCode,OrderMain.IsShippingFixed,OrderMain.IsReturnFullOrder,OrderMain.PriceSheetKey,OrderMain.OrigInvoiceNumber,OrderMain.CurrencyCode,OrderMain.HoldCodeKey,OrderMain.LineTotalHome,OrderMain.OrderTotalHome,OrderMain.ShippingTotalHome,OrderMain.TaxTotalHome,OrderMain.BillToContactKey,OrderMain.OrderStateCode,OrderMain.SoldToContactKey,OrderMain.BillToFullAddressKey,OrderMain.SoldToFullAddressKey,OrderMain.CultureCode,OrderMain.BackorderReleasePriority,OrderMain.PaymentTermsKey,OrderMain.OrderNumber,OrderMain.OrigOrderNumber,OrderMain.MiscChargeTotal,OrderMain.MiscChargeTotalHome,OrderMain.ResponseMediaCode,OrderMain.HoldNote,OrderMain.Description,OrderMain.Instructions,OrderMain.FinancialEntityKey,OrderMain.CommissionPlanKey,OrderMain.SalesTeamGroupKey,OrderMain.SystemEntityKey,OrderMain.SalesLocationKey,OrderMain.AccessKey,OrderMain.CreatedByUserKey,OrderMain.CreatedOn,OrderMain.OrderKey,OrderMain.OwnerGroupKey,OrderMain.FirstPaymentDueDate,OrderMain.BatchLineStatusCode,OrderMain.BatchStatusMessage,OrderMain.FinalBatchKey,OrderMain.OriginatingBatchKey FROM OrderMain
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vOrderAllReport]'))
    DROP VIEW [dbo].[vOrderAllReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
/* Note that since OrderMain does NOT have a Blob column, any columns
   added to WorkOrderMain must come before the Blob column or this view will fail
*/

CREATE VIEW [dbo].[vOrderAllReport]
AS
SELECT     NULL AS WorkOrderKey, *, NULL AS Blob
FROM         dbo.OrderMain

UNION ALL
SELECT     *
FROM         WorkOrderMain

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoOrderAllReport]'))
    DROP VIEW [dbo].[vBoOrderAllReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoOrderAllReport] AS SELECT vOrderAllReport.BackorderReleasePriority,vOrderAllReport.BillToContactKey,vOrderAllReport.CommissionPlanKey,vOrderAllReport.ConversionRate,vOrderAllReport.CultureCode,vOrderAllReport.CurrencyCode,vOrderAllReport.DefaultWarehouseKey,vOrderAllReport.Description,vOrderAllReport.Discount,vOrderAllReport.DiscountCode,vOrderAllReport.FinancialEntityKey,vOrderAllReport.HoldCodeKey,vOrderAllReport.HoldNote,vOrderAllReport.Instructions,vOrderAllReport.IsReturn,vOrderAllReport.IsReturnFullOrder,vOrderAllReport.LineTotal,vOrderAllReport.LineTotalHome,vOrderAllReport.MiscChargeTotal,vOrderAllReport.MiscChargeTotalHome,vOrderAllReport.OrderDate,vOrderAllReport.OrderKey,vOrderAllReport.OrderNumber,vOrderAllReport.OrderStateCode,vOrderAllReport.OrderTotal,vOrderAllReport.OrderTotalHome,vOrderAllReport.OrderTypeKey,vOrderAllReport.OrigInvoiceNumber,vOrderAllReport.OrigOrderNumber,vOrderAllReport.PaymentTermsKey,vOrderAllReport.PriceSheetKey,vOrderAllReport.PurchaseOrderNumber,vOrderAllReport.ReasonCodeKey,vOrderAllReport.ReqShipDate,vOrderAllReport.ResponseMediaCode,vOrderAllReport.RetAuthNumber,vOrderAllReport.SalesTeamGroupKey,vOrderAllReport.ShippingTotal,vOrderAllReport.ShippingTotalHome,vOrderAllReport.SoldToContactKey,vOrderAllReport.SourceCodeKey,vOrderAllReport.SystemEntityKey,vOrderAllReport.TaxTotal,vOrderAllReport.TaxTotalHome,vOrderAllReport.UpdatedByUserKey,vOrderAllReport.UpdatedOn,vOrderAllReport.WorkOrderKey,vOrderAllReport.BillToFullAddressKey AS BillToAddressKey,vOrderAllReport.SoldToFullAddressKey AS SoldToAddressKey FROM vOrderAllReport
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoOrderCategory]'))
    DROP VIEW [dbo].[vBoOrderCategory]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoOrderCategory] AS SELECT OrderCategory.OrderCategoryID,OrderCategory.Title FROM OrderCategory
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vOrderDetailReport]'))
    DROP VIEW [dbo].[vOrderDetailReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vOrderDetailReport] AS
/****************************************************************************************
** This view provides all Order Line information for each Order on "One Row per Order Line" basis.
** This can be joined to views or tables related to Order Details, Shipment, Payment and other
** relevant sources to get more detailed information..
**
***************************************************************************************/

SELECT	
	OL.OrderLineNumber, OL.SequenceOrderLineNumber, OL.DisplayOrderLineNumber, PM.ProductCode, PM.Name AS ProductName, U.Name as Uom, 
	OL.Quantity as QtyOrdered, OL.QuantityShipped as QtyShipped, OL.QuantityCommitted, OL.QuantityBackOrdered as QtyBackOrdered, 
	OL.BasePrice, OL.UnitPrice, OL.ExtendedPrice, OL.IsPledge, OL.DiscountCode, OSR.OrderStateName,
	OL.CurrencyUnitPrice, OL.Instructions, OL.EstimatedShipDate, OL.QuantityInProductSet, PM.ProductSetTypeCode,
	OST.Instructions AS ShipToInstructions, OST.AllowPartialShipmentsFlag,
	OL.OrderKey, OL.OrderLineKey, OL.ProductKey, OL.ProductTypeKey, OL.OrderShipToKey, 
	OL.ParentOrderLineKey, OL.TaxScheduleKey, OL.PriceSheetKey, OL.SalesTeamGroupKey, 
	OST.ContactKey as ShipToContactKey, OST.FullAddressKey as ShipToFullAddressKey
FROM    OrderLine 	OL 		
	LEFT OUTER JOIN	ProductMain 	PM 	ON 	OL.ProductKey = PM.ProductKey 
	LEFT OUTER JOIN	Uom 		U 	ON 	OL.UomKey = U.UomKey 
	LEFT OUTER JOIN OrderShipTo 	OST 	ON 	OST.OrderShipToKey = OL.OrderShipToKey 
	LEFT OUTER JOIN OrderStateRef	OSR	ON	OL.OrderStateCode = OSR.OrderStateCode

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoOrderDetailReport]'))
    DROP VIEW [dbo].[vBoOrderDetailReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoOrderDetailReport] AS SELECT vOrderDetailReport.AllowPartialShipmentsFlag,vOrderDetailReport.BasePrice,vOrderDetailReport.CurrencyUnitPrice,vOrderDetailReport.DiscountCode,vOrderDetailReport.DisplayOrderLineNumber,vOrderDetailReport.EstimatedShipDate,vOrderDetailReport.ExtendedPrice,vOrderDetailReport.Instructions,vOrderDetailReport.IsPledge,vOrderDetailReport.OrderKey,vOrderDetailReport.OrderLineKey,vOrderDetailReport.OrderLineNumber,vOrderDetailReport.OrderShipToKey,vOrderDetailReport.OrderStateName,vOrderDetailReport.ParentOrderLineKey,vOrderDetailReport.PriceSheetKey,vOrderDetailReport.ProductKey,vOrderDetailReport.ProductName,vOrderDetailReport.ProductTypeKey,vOrderDetailReport.QtyBackOrdered,vOrderDetailReport.QtyOrdered,vOrderDetailReport.QtyShipped,vOrderDetailReport.QuantityCommitted,vOrderDetailReport.QuantityInProductSet,vOrderDetailReport.SalesTeamGroupKey,vOrderDetailReport.SequenceOrderLineNumber,vOrderDetailReport.ShipToContactKey,vOrderDetailReport.ShipToFullAddressKey,vOrderDetailReport.ShipToInstructions,vOrderDetailReport.TaxScheduleKey,vOrderDetailReport.UnitPrice,vOrderDetailReport.Uom,vOrderDetailReport.ProductSetTypeCode,vOrderDetailReport.ProductCode FROM vOrderDetailReport
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoOrderFulfillmentLine]'))
    DROP VIEW [dbo].[vBoOrderFulfillmentLine]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoOrderFulfillmentLine] AS SELECT OrderFulfillmentLine.BinNumber,OrderFulfillmentLine.CreatedByUserKey,OrderFulfillmentLine.CreatedOn,OrderFulfillmentLine.DateFulfilled,OrderFulfillmentLine.InventoryCommitmentKey,OrderFulfillmentLine.InvoiceNumber,OrderFulfillmentLine.OrderFulfillmentLineKey,OrderFulfillmentLine.OrderLineKey,OrderFulfillmentLine.UpdatedByUserKey,OrderFulfillmentLine.UpdatedOn,OrderFulfillmentLine.WarehouseKey,OrderFulfillmentLine.OrderFulfillmentStatusCode,OrderFulfillmentLine.Quantity,OrderFulfillmentLine.ExtendedCost FROM OrderFulfillmentLine
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoOrderFulfillmentStatusRef]'))
    DROP VIEW [dbo].[vBoOrderFulfillmentStatusRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoOrderFulfillmentStatusRef] AS SELECT OrderFulfillmentStatusRef.OrderFulfillmentStatusCode,OrderFulfillmentStatusRef.OrderFulfillmentStatusDesc FROM OrderFulfillmentStatusRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoOrderLine]'))
    DROP VIEW [dbo].[vBoOrderLine]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoOrderLine] AS SELECT OrderLine.OrderKey,OrderLine.OrderLineKey,OrderLine.OrderShipToKey,OrderLine.ParentOrderLineKey,OrderLine.ProductDetail,OrderLine.ProductKey,OrderLine.ProductTypeKey,OrderLine.UomKey,OrderLine.IsManuallyOverridden,OrderLine.DefaultWarehouseKey,OrderLine.BasePrice,OrderLine.CurrencyUnitPrice,OrderLine.ExtendedPrice,OrderLine.UnitPrice,OrderLine.DiscountCode,OrderLine.CreatedByUserKey,OrderLine.CreatedOn,OrderLine.OrderLineNumber,OrderLine.UpdatedByUserKey,OrderLine.UpdatedOn,OrderLine.Quantity,OrderLine.TaxScheduleKey,OrderLine.QuantityCommitted,OrderLine.QuantityShipped,OrderLine.PriceSheetKey,OrderLine.QuantityBackOrdered,OrderLine.ProductDetailXml,OrderLine.ExtendedPriceHome,OrderLine.OrderStateCode,OrderLine.LinePricingCode,OrderLine.Instructions,OrderLine.EstimatedShipDate,OrderLine.IsExemptFromHandling,OrderLine.IsExemptFromShipping,OrderLine.QuantityInProductSet,OrderLine.HoldCodeKey,OrderLine.IsPledge,OrderLine.SalesTeamGroupKey,OrderLine.SourceCodeKey,OrderLine.DisplayOrderLineNumber,OrderLine.SequenceOrderLineNumber,OrderLine.FirstPaymentDueDate,OrderLine.PaymentTermsKey,OrderLine.DistributionUnitPrice,OrderLine.OrderPromotionKey FROM OrderLine
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoOrderPromotion]'))
    DROP VIEW [dbo].[vBoOrderPromotion]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoOrderPromotion] AS SELECT OrderPromotion.AdjustmentAmount,OrderPromotion.OrderKey,OrderPromotion.OrderLineKey,OrderPromotion.OrderPromotionKey,OrderPromotion.SequenceNumber,OrderPromotion.UpdatedByUserKey,OrderPromotion.UpdatedOn,OrderPromotion.PromotionDiscountKey FROM OrderPromotion
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vOrderReport]'))
    DROP VIEW [dbo].[vOrderReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vOrderReport] AS
/****************************************************************************************
** This view provides all Order Header information for each Order on "One Row per Order" basis.
** This can be joined to views or tables related to Order Details, Shipment, Payment and other
** relevant sources to get more detailed information..
**
***************************************************************************************/

SELECT	
	OM.OrderNumber, OM.OrderDate, OT.Title AS OrderType, OM.CurrencyCode, OM.ConversionRate,
	OSR.OrderStateDesc AS OrderStatus, OM.LineTotal, OM.TaxTotal, OM.ShippingTotal,
	OM.Discount, 	OM.MiscChargeTotal, OM.OrderTotal, OM.PurchaseOrderNumber,
	OM.Description, OM.Instructions, OM.ReqShipDate, OM.IsReturn, OM.IsReturnFullOrder,
	OM.RetAuthNumber,OM.OrigOrderNumber, OM.OrigInvoiceNumber, OM.IsShippingFixed, 
	OM.BackorderReleasePriority,OM.ResponseMediaCode, OM.HoldNote,
	OM.OrderKey, OM.SourceCodeKey, OM.PriceSheetKey, OM.SoldToContactKey, 
	OM.BillToContactKey, OM.BillToFullAddressKey, OM.SoldToFullAddressKey, 
	OM.FinancialEntityKey, OM.SalesTeamGroupKey, OM.OwnerGroupKey, OM.SystemEntityKey
FROM    OrderMain OM 
	LEFT OUTER JOIN OrderType OT 		ON OM.OrderTypeKey = OT.OrderTypeKey 
	LEFT OUTER JOIN	OrderStateRef OSR 	ON OM.OrderStateCode = OSR.OrderStateCode

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoOrderReport]'))
    DROP VIEW [dbo].[vBoOrderReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoOrderReport] AS SELECT vOrderReport.BackorderReleasePriority,vOrderReport.BillToContactKey,vOrderReport.BillToFullAddressKey,vOrderReport.ConversionRate,vOrderReport.CurrencyCode,vOrderReport.Description,vOrderReport.Discount,vOrderReport.FinancialEntityKey,vOrderReport.HoldNote,vOrderReport.Instructions,vOrderReport.IsReturn,vOrderReport.IsReturnFullOrder,vOrderReport.IsShippingFixed,vOrderReport.LineTotal,vOrderReport.MiscChargeTotal,vOrderReport.OrderDate,vOrderReport.OrderKey,vOrderReport.OrderNumber,vOrderReport.OrderStatus,vOrderReport.OrderTotal,vOrderReport.OrderType,vOrderReport.OrigInvoiceNumber,vOrderReport.OrigOrderNumber,vOrderReport.OwnerGroupKey,vOrderReport.PriceSheetKey,vOrderReport.PurchaseOrderNumber,vOrderReport.ReqShipDate,vOrderReport.ResponseMediaCode,vOrderReport.RetAuthNumber,vOrderReport.SalesTeamGroupKey,vOrderReport.ShippingTotal,vOrderReport.SoldToContactKey,vOrderReport.SoldToFullAddressKey,vOrderReport.SourceCodeKey,vOrderReport.SystemEntityKey,vOrderReport.TaxTotal FROM vOrderReport
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoOrderShipTo]'))
    DROP VIEW [dbo].[vBoOrderShipTo]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoOrderShipTo] AS SELECT OrderShipTo.FullAddressKey,OrderShipTo.ContactKey,OrderShipTo.OrderKey,OrderShipTo.OrderShipToKey,OrderShipTo.CreatedByUserKey,OrderShipTo.CreatedOn,OrderShipTo.AllowPartialShipmentsFlag,OrderShipTo.Instructions,OrderShipTo.ShipMethodKey,OrderShipTo.HandlingCharge,OrderShipTo.RestockingCharge,OrderShipTo.ShippingCharge FROM OrderShipTo
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoOrderStateRef]'))
    DROP VIEW [dbo].[vBoOrderStateRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoOrderStateRef] AS SELECT OrderStateRef.OrderStateCode,OrderStateRef.OrderStateDesc FROM OrderStateRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoOrderTaxLine]'))
    DROP VIEW [dbo].[vBoOrderTaxLine]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoOrderTaxLine] AS SELECT OrderTaxLine.OrderKey,OrderTaxLine.OrderTaxLineKey,OrderTaxLine.ProductKey,OrderTaxLine.OrderLineKey,OrderTaxLine.CreatedByUserKey,OrderTaxLine.CreatedOn,OrderTaxLine.UpdatedByUserKey,OrderTaxLine.UpdatedOn,OrderTaxLine.TaxableAmount,OrderTaxLine.TaxAmount,OrderTaxLine.ExemptAmount,OrderTaxLine.TaxPlan,OrderTaxLine.TaxAmountHome,OrderTaxLine.IsExemptFromIncludedTax,OrderTaxLine.IsTaxInclusive FROM OrderTaxLine
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoOrderType]'))
    DROP VIEW [dbo].[vBoOrderType]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoOrderType] AS SELECT OrderType.AutoEvalReadinessFlag,OrderType.AutoPostFlag,OrderType.DefaultWarehouseKey,OrderType.Description,OrderType.IncursHandlingChargeFlag,OrderType.IncursRestockChargeFlag,OrderType.ResponseMediaCode,OrderType.Title,OrderType.CreatedByUserKey,OrderType.CreatedOn,OrderType.OrderTypeKey,OrderType.SystemEntityKey,OrderType.UpdatedByUserKey,OrderType.UpdatedOn,OrderType.DefaultDescription FROM OrderType
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoOrganization]'))
    DROP VIEW [dbo].[vBoOrganization]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoOrganization] AS SELECT OrganizationMain.CreatedByUserKey,OrganizationMain.CreatedOn,OrganizationMain.Description,OrganizationMain.Name,OrganizationMain.OrganizationKey,OrganizationMain.UpdatedByUserKey,OrganizationMain.UpdatedOn,OrganizationMain.DefaultDepartmentGroupKey,OrganizationMain.IsDefault FROM OrganizationMain
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoOutboundCommunicationStatusRef]'))
    DROP VIEW [dbo].[vBoOutboundCommunicationStatusRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoOutboundCommunicationStatusRef] AS SELECT OutboundCommunicationStatusRef.OutboundCommunicationStatusCode,OutboundCommunicationStatusRef.OutboundCommunicationStatusDesc AS Description,OutboundCommunicationStatusRef.OutboundCommunicationStatusName AS Name FROM OutboundCommunicationStatusRef

GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoPackage]'))
    DROP VIEW [dbo].[vBoPackage]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoPackage] AS SELECT PackageMain.Description,PackageMain.ExpirationDate,PackageMain.Name,PackageMain.OutputMethodKey,PackageMain.UpdatedByUserKey,PackageMain.UpdatedOn,PackageMain.PackageMessageKey,PackageMain.Cost,PackageMain.PackageStatusCode,PackageMain.CreatedByUserKey,PackageMain.CreatedOn,PackageMain.PackageKey,PackageMain.SystemEntityKey FROM PackageMain
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoPackageItem]'))
    DROP VIEW [dbo].[vBoPackageItem]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoPackageItem] AS SELECT PackageItem.SupplementKey,PackageItem.UpdatedByUserKey,PackageItem.UpdatedOn,PackageItem.PackageItemKey,PackageItem.PackageKey,PackageItem.CreatedByUserKey,PackageItem.CreatedOn FROM PackageItem
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoPackageLogStatusRef]'))
    DROP VIEW [dbo].[vBoPackageLogStatusRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoPackageLogStatusRef] AS SELECT PackageLogStatusRef.PackageLogStatusCode,PackageLogStatusRef.PackageLogStatusDesc AS Description,PackageLogStatusRef.PackageLogStatusName AS Name FROM PackageLogStatusRef

GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoPackageQueue]'))
    DROP VIEW [dbo].[vBoPackageQueue]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoPackageQueue] AS SELECT PackageQueue.Name,PackageQueue.NotificationGroupKey,PackageQueue.PackageCount,PackageQueue.PackageQueueKey,PackageQueue.PackageQueueReleaseTypeCode,PackageQueue.QueueReleaseWorkflowKey,PackageQueue.ScheduledTaskKey,PackageQueue.AccessKey FROM PackageQueue

GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoPackageQueueReleaseTypeRef]'))
    DROP VIEW [dbo].[vBoPackageQueueReleaseTypeRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoPackageQueueReleaseTypeRef] AS SELECT PackageQueueReleaseTypeRef.PackageQueueReleaseTypeCode,PackageQueueReleaseTypeRef.PackageQueueReleaseTypeDesc AS Description,PackageQueueReleaseTypeRef.PackageQueueReleaseTypeName AS Name FROM PackageQueueReleaseTypeRef

GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoPackageStatusRef]'))
    DROP VIEW [dbo].[vBoPackageStatusRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoPackageStatusRef] AS SELECT PackageStatusRef.PackageStatusCode,PackageStatusRef.PackageStatusDesc FROM PackageStatusRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoPaperSizeRef]'))
    DROP VIEW [dbo].[vBoPaperSizeRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoPaperSizeRef] AS SELECT PaperSizeRef.PageHeight,PaperSizeRef.PageWidth,PaperSizeRef.PaperSizeDesc AS Description,PaperSizeRef.PaperSizeKey FROM PaperSizeRef

GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vParticipantRoster]'))
    DROP VIEW [dbo].[vParticipantRoster]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vParticipantRoster]
AS
SELECT
	[dbo].[CustomerExperience].[CustomerExperienceKey], 
	[dbo].[CustomerExperience].[UserKey], 
	[dbo].[vOfferedCustomerExperience].[ProgramKey], 
	[dbo].[vOfferedCustomerExperience].[ProgramName], 
	[dbo].[vOfferedCustomerExperience].[ExperienceDefinitionKey], 
	[dbo].[vOfferedCustomerExperience].[ExperienceDefinitionName], 
	[dbo].[vOfferedCustomerExperience].[OfferingKey], 
	[dbo].[vOfferedCustomerExperience].[OfferingName], 
	[dbo].[vOfferedCustomerExperience].[ContactKey] AS Provider, 
	[dbo].[vOfferedCustomerExperience].[OfferingName] AS Name, 
	[dbo].[vBoNetContact].[LastName], 
	[dbo].[vBoNetContact].[FirstName], 
	[dbo].[vBoNetContact].[FullName],
	[dbo].[vBoNetContact].[SortName], 
	[dbo].[vBoNetContact].[Company] AS CompanyName, 
	[dbo].[vBoNetContact].[FullAddress], 
	[dbo].[GradeRef].[GradeValue] AS Grade, 
	[dbo].[CustomerExperience].[CustomerExperienceStatusCode] AS StatusCode, 
	[dbo].[CustomerExperienceStatusRef].[CustomerExperienceStatusName] AS StatusName, 
	[dbo].[vOfferedCustomerExperience].[LocationKey], 
	[dbo].[vOfferedCustomerExperience].[LocationName], 
	[dbo].[vOfferedCustomerExperience].[NumberOfUnits], 
	[dbo].[vOfferedCustomerExperience].[OfferingDate] AS Date

FROM
	[dbo].[CustomerExperience]
		INNER JOIN [dbo].[vOfferedCustomerExperience] ON [dbo].[CustomerExperience].[CustomerExperienceKey] = [dbo].[vOfferedCustomerExperience].[OfferedCustomerExperienceKey]
		INNER JOIN [dbo].[vBoNetContact] ON [dbo].[CustomerExperience].[UserKey] = [dbo].[vBoNetContact].[ContactKey] 
		INNER JOIN [dbo].[CustomerExperienceStatusRef] ON [dbo].[CustomerExperience].[CustomerExperienceStatusCode] = [dbo].[CustomerExperienceStatusRef].[CustomerExperienceStatusCode] 
		LEFT JOIN [dbo].[GradeRef] ON [dbo].[vOfferedCustomerExperience].[OfferedCustomerExperienceGradeKey] = [dbo].[GradeRef].[GradeKey]

UNION ALL
SELECT 
	[CustomerExperience1].[CustomerExperienceKey], 
	[CustomerExperience1].[UserKey], 
	[dbo].[vUnofferedCustomerExperience].[ProgramKey], 
	[dbo].[vUnofferedCustomerExperience].[ProgramName], 
	[dbo].[vUnofferedCustomerExperience].[ExperienceDefinitionKey], 
	[dbo].[vUnofferedCustomerExperience].[ExperienceDefinitionName], 
	NULL AS OfferingKey, 
	NULL AS OfferingName, 
	NULL AS Provider, 
	[dbo].[vUnofferedCustomerExperience].[ExperienceDefinitionName] AS Name, 
	[vBoNetContact1].[LastName], 
	[vBoNetContact1].[FirstName], 
	[vBoNetContact1].[FullName], 
	[vBoNetContact1].[SortName], 
	[vBoNetContact1].[Company] AS CompanyName, 
	[vBoNetContact1].[FullAddress], 
	[dbo].[vUnofferedCustomerExperience].[UnofferedCustomerExperienceGrade] AS Grade, 
	[CustomerExperience1].[CustomerExperienceStatusCode] AS StatusCode, 
	[CustomerExperienceStatusCodeRef1].[CustomerExperienceStatusName] AS StatusName, 
	NULL AS LocationKey, 
	[dbo].[vUnofferedCustomerExperience].[ExperienceDefinitionLocation] AS LocationName, 
	[dbo].[vUnofferedCustomerExperience].[NumberOfUnits], 
	[dbo].[vUnofferedCustomerExperience].[ExperienceDefinitionDate] AS Date

FROM
	[dbo].[CustomerExperience] AS [CustomerExperience1] 
		INNER JOIN [dbo].[vUnofferedCustomerExperience] ON [CustomerExperience1].[CustomerExperienceKey] = [dbo].[vUnofferedCustomerExperience].[UnofferedCustomerExperienceKey] 
		INNER JOIN [dbo].[vBoNetContact] AS [vBoNetContact1] ON [CustomerExperience1].[UserKey] = [vBoNetContact1].[ContactKey] 
		INNER JOIN [dbo].[CustomerExperienceStatusRef] AS [CustomerExperienceStatusCodeRef1] ON [CustomerExperience1].[CustomerExperienceStatusCode] = [CustomerExperienceStatusCodeRef1].[CustomerExperienceStatusCode]

UNION ALL
SELECT 
	[CustomerExperience2].[CustomerExperienceKey], 
	[CustomerExperience2].[UserKey], 
	[dbo].[vUserDefinedCustomerExperience].[ProgramKey], 
	[dbo].[vUserDefinedCustomerExperience].[ProgramName], 
	NULL AS ExperienceDefinitionKey, 
	NULL AS ExperienceDefinitionName, 
	NULL AS OfferingKey, 
	NULL AS OfferingName, 
	NULL AS Provider, 
	[dbo].[vUserDefinedCustomerExperience].[UserDefinedCustomerExperienceName] AS Name, 
	[vBoNetContact2].[LastName], 
	[vBoNetContact2].[FirstName], 
	[vBoNetContact2].[FullName], 
	[vBoNetContact2].[SortName], 
	[vBoNetContact2].[Company] AS CompanyName, 
	[vBoNetContact2].[FullAddress], 
	NULL AS Grade, 
	[CustomerExperience2].[CustomerExperienceStatusCode] AS StatusCode, 
	[CustomerExperienceStatusCodeRef2].[CustomerExperienceStatusName] AS StatusName, 
	NULL AS LocationKey, 
	[dbo].[vUserDefinedCustomerExperience].[UserDefinedCustomerExperienceLocation] AS LocationName, 
	[dbo].[vUserDefinedCustomerExperience].[UserDefinedCustomerExperienceUnits] AS NumberOfUnits, 
	[dbo].[vUserDefinedCustomerExperience].[CompletionDate] AS Date

FROM 
	[dbo].[CustomerExperience] AS [CustomerExperience2] 
		INNER JOIN [dbo].[vUserDefinedCustomerExperience] ON [CustomerExperience2].[CustomerExperienceKey] = [dbo].[vUserDefinedCustomerExperience].[UserDefinedCustomerExperienceKey] 
		INNER JOIN [dbo].[vBoNetContact] AS [vBoNetContact2] ON [CustomerExperience2].[UserKey] = [vBoNetContact2].[ContactKey] 
		INNER JOIN [dbo].[CustomerExperienceStatusRef] AS [CustomerExperienceStatusCodeRef2] ON [CustomerExperience2].[CustomerExperienceStatusCode] = [CustomerExperienceStatusCodeRef2].[CustomerExperienceStatusCode]

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoParticipantRoster]'))
    DROP VIEW [dbo].[vBoParticipantRoster]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoParticipantRoster] AS SELECT vParticipantRoster.CompanyName,vParticipantRoster.CustomerExperienceKey,vParticipantRoster.Date,vParticipantRoster.ExperienceDefinitionKey,vParticipantRoster.ExperienceDefinitionName,vParticipantRoster.FirstName,vParticipantRoster.FullAddress,vParticipantRoster.FullName,vParticipantRoster.Grade,vParticipantRoster.LastName,vParticipantRoster.LocationKey,vParticipantRoster.Name,vParticipantRoster.NumberOfUnits,vParticipantRoster.OfferingKey,vParticipantRoster.OfferingName,vParticipantRoster.ProgramKey,vParticipantRoster.ProgramName,vParticipantRoster.Provider,vParticipantRoster.SortName,vParticipantRoster.StatusCode,vParticipantRoster.StatusName,vParticipantRoster.UserKey,vParticipantRoster.LocationName FROM vParticipantRoster
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoPayment]'))
    DROP VIEW [dbo].[vBoPayment]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoPayment] AS SELECT PaymentMain.PaymentDate,PaymentMain.PaymentApplicationRestrictionCode,PaymentMain.AmountHome,PaymentMain.CurrencyCode,PaymentMain.FinancialEntityKey,PaymentMain.Amount,PaymentMain.OriginalPaymentKey,PaymentMain.PayorContactKey,PaymentMain.SummaryDisplay,PaymentMain.AccessKey,PaymentMain.CreatedByUserKey,PaymentMain.CreatedOn,PaymentMain.PaymentKey,PaymentMain.SystemEntityKey,PaymentMain.UpdatedByUserKey,PaymentMain.UpdatedOn,PaymentMain.OwnerGroupKey,PaymentMain.PaymentMethodKey,PaymentMain.PaymentReferenceData,PaymentMain.PaymentDetailKey,PaymentMain.BatchLineStatusCode,PaymentMain.BatchStatusMessage,PaymentMain.FinalBatchKey,PaymentMain.OriginatingBatchKey FROM PaymentMain
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoPaymentApplicationRestrictionRef]'))
    DROP VIEW [dbo].[vBoPaymentApplicationRestrictionRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoPaymentApplicationRestrictionRef] AS SELECT PaymentApplicationRestrictionRef.PaymentApplicationRestrictionCode,PaymentApplicationRestrictionRef.PaymentApplicationRestrictionDesc FROM PaymentApplicationRestrictionRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vPaymentApplicationSummary]'))
    DROP VIEW [dbo].[vPaymentApplicationSummary]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vPaymentApplicationSummary] AS

/*
	This is a view of payment applications as the union of two disjoint sets -- their
	disjointness is guaranteed because the second select has the "where ma.InvoiceKey is null"
	clause, and the first select is inner joined on that key.

	The first select returns a summary of payment application information for applications
	to invoices.  The second returns a summary of payments applied to orders but not to 
	invoices.
*/
select im.InvoiceKey as PrimaryKey, p.PaymentKey, p.PaymentDate, p.Amount, im.InvoiceNumber, 
	im.OrderNumber, 
	im.Description as 'InvoiceDescription',
	'' as 'OrderDescription',
	MIN(ma.TransactionDate) as 'TransactionDate',
	ma.TransactionType, 
	batch.BatchNumber, sum(ma.Amount) as 'AppliedAmount'
 from PaymentMain p
 inner join MonetaryApplication  ma on p.PaymentKey = ma.SrcPaymentKey
 inner join InvoiceMain im on ma.InvoiceKey = im.InvoiceKey
 LEFT OUTER JOIN BatchInstance batch on ma.BatchKey = batch.BatchKey
 group by p.PaymentDate, p.PaymentKey, p.Amount, im.InvoiceNumber,
	im.OrderNumber, im.InvoiceKey, im.Description, ma.TransactionType,
	batch.BatchNumber

UNION

select o.OrderKey, p.PaymentKey, p.PaymentDate, p.Amount, '',
	o.OrderNumber, 
	'',
	o.Description,
	ma.TransactionDate,
	ma.TransactionType, batch.BatchNumber, sum(ma.Amount) as 'Applied amount'
 from PaymentMain p
 inner join MonetaryApplication  ma on p.PaymentKey = ma.SrcPaymentKey
 inner join OrderMain o on ma.OrderNumber = o.OrderNumber
 LEFT OUTER JOIN BatchInstance batch on ma.BatchKey = batch.BatchKey
 where ma.InvoiceKey is null
 group by p.PaymentKey, p.PaymentDate, p.Amount, o.OrderNumber, o.OrderKey, o.Description, ma.TransactionDate, 
	ma.TransactionType, batch.BatchNumber

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoPaymentApplicationSummary]'))
    DROP VIEW [dbo].[vBoPaymentApplicationSummary]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoPaymentApplicationSummary] AS SELECT vPaymentApplicationSummary.Amount,vPaymentApplicationSummary.AppliedAmount,vPaymentApplicationSummary.BatchNumber,vPaymentApplicationSummary.InvoiceNumber,vPaymentApplicationSummary.OrderNumber,vPaymentApplicationSummary.PaymentDate,vPaymentApplicationSummary.PaymentKey,vPaymentApplicationSummary.PrimaryKey,vPaymentApplicationSummary.TransactionDate,vPaymentApplicationSummary.TransactionType,vPaymentApplicationSummary.InvoiceDescription,vPaymentApplicationSummary.OrderDescription FROM vPaymentApplicationSummary
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vPaymentApplicationToInvoice]'))
    DROP VIEW [dbo].[vPaymentApplicationToInvoice]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE                          VIEW [dbo].[vPaymentApplicationToInvoice] AS

/*
	This is a view of payment applications to invoices.  It is a join of PaymentMain with
	a derived table called InvoiceApp.
*/

Select p.PaymentKey, 
	InvoiceApp.InvoiceLineKey,
	p.PaymentDate,
	InvoiceApp.ThisPaymentInvoiceTotal as 'Amount',
	InvoiceApp.InvoiceNumber,
	InvoiceApp.InvoiceLineNumber,
	InvoiceApp.OrderNumber,
	InvoiceApp.Description, 
	InvoiceApp.TransactionDate,
	InvoiceApp.TransactionType, 
	InvoiceApp.BatchNumber,
	InvoiceApp.ThisPaymentThisLine as 'AppliedAmount',
	InvoiceApp.ExtendedPrice,
	pm.Name as 'Product',
	pm.ProductCode, 
	InvoiceApp.InvoiceTotal,
	InvoiceApp.InvoiceDate,
	c.FullName as 'BillToContact',
	InvoiceApp.TotalAppliedToInvoice,
	InvoiceApp.InvoiceTotal - InvoiceApp.TotalAppliedToInvoice as 'Balance',
	InvoiceApp.ExtendedPrice - InvoiceApp.TotalAppliedToInvoiceLine as 'LineBalance',
	InvoiceApp.TotalAppliedToInvoice - InvoiceApp.ThisPaymentInvoiceTotal as 'OtherApplicationsToInvoice',
	InvoiceApp.TotalAppliedToInvoiceLine - InvoiceApp.ThisPaymentThisLine  as 'OtherApplicationsToInvoiceLine',
	InvoiceApp.InvoiceKey
FROM PaymentMain p
 JOIN (SELECT DISTINCT im.InvoiceKey, 
	ma.SrcPaymentKey,
	MIN(im.InvoiceNumber) as 'InvoiceNumber',
	MIN(il.InvoiceLineNumber) as 'InvoiceLineNumber',
	MIN(il.ExtendedPrice) as 'ExtendedPrice',
	il.InvoiceLineKey,
	MIN(im.Description)as 'Description', 
	MIN(im.InvoiceDate)as 'InvoiceDate', 
	MIN(ma.TransactionDate) as 'TransactionDate',
	ma.TransactionType,
	MIN(im.OrderNumber) as 'OrderNumber',
	MIN(batch.BatchNumber)as 'BatchNumber', 
	SUM(ma.Amount) as 'ThisPaymentInvoiceTotal',
	ISNULL((select sum(allApps.Amount) from MonetaryApplication  allApps
 			where allApps.InvoiceKey = im.InvoiceKey), 0) as 'TotalAppliedToInvoice',
	ISNULL((select sum(allApps.Amount) from MonetaryApplication  allApps
 			where allApps.InvoiceLineKey = il.InvoiceLineKey), 0) as 'TotalAppliedToInvoiceLine',
	ISNULL((select sum(line.ExtendedPrice) from InvoiceLine line
		 	   where line.InvoiceKey = im.InvoiceKey), 0) as 'InvoiceTotal',
	ISNULL((select sum(allApps.Amount) from MonetaryApplication  allApps
 			where (allApps.InvoiceLineKey = il.InvoiceLineKey
				AND allApps.SrcPaymentKey = ma.SrcPaymentKey)), 0) as 'ThisPaymentThisLine',
	im.BillToContactKey,
	il.ProductKey
	FROM InvoiceMain im
	INNER JOIN MonetaryApplication ma on ma.InvoiceKey = im.InvoiceKey
	INNER JOIN InvoiceLine il on im.InvoiceKey = il.InvoiceKey
	LEFT OUTER JOIN BatchInstance batch on ma.BatchKey = batch.BatchKey
	GROUP BY  ma.TransactionType, im.InvoiceKey, ma.SrcPaymentKey, il.InvoiceLineKey, 
		im.BillToContactKey, il.ProductKey) 
	as InvoiceApp
 ON p.PaymentKey = InvoiceApp.SrcPaymentKey

INNER JOIN ProductMain pm on InvoiceApp.ProductKey = pm.ProductKey
INNER JOIN ContactMain c on InvoiceApp.BillToContactKey = c.ContactKey

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoPaymentApplicationToInvoice]'))
    DROP VIEW [dbo].[vBoPaymentApplicationToInvoice]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoPaymentApplicationToInvoice] AS SELECT vPaymentApplicationToInvoice.Amount,vPaymentApplicationToInvoice.AppliedAmount,vPaymentApplicationToInvoice.BatchNumber,vPaymentApplicationToInvoice.Description,vPaymentApplicationToInvoice.InvoiceLineKey,vPaymentApplicationToInvoice.InvoiceLineNumber,vPaymentApplicationToInvoice.InvoiceNumber,vPaymentApplicationToInvoice.OrderNumber,vPaymentApplicationToInvoice.PaymentDate,vPaymentApplicationToInvoice.PaymentKey,vPaymentApplicationToInvoice.Product,vPaymentApplicationToInvoice.TransactionDate,vPaymentApplicationToInvoice.TransactionType,vPaymentApplicationToInvoice.Balance,vPaymentApplicationToInvoice.BillToContact,vPaymentApplicationToInvoice.ExtendedPrice,vPaymentApplicationToInvoice.InvoiceDate,vPaymentApplicationToInvoice.InvoiceTotal,vPaymentApplicationToInvoice.LineBalance,vPaymentApplicationToInvoice.OtherApplicationsToInvoice,vPaymentApplicationToInvoice.OtherApplicationsToInvoiceLine,vPaymentApplicationToInvoice.ProductCode,vPaymentApplicationToInvoice.TotalAppliedToInvoice,vPaymentApplicationToInvoice.InvoiceKey FROM vPaymentApplicationToInvoice
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vPaymentApplicationToOrder]'))
    DROP VIEW [dbo].[vPaymentApplicationToOrder]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE                           VIEW [dbo].[vPaymentApplicationToOrder] AS

/*
	This is a view of payment applications to order that are not associated with
	a remittance.  That is, payments entered separately from the order.  
*/

select  Application.OrderKey, 
	p.PaymentKey, 
	p.PaymentDate, 
	p.Amount,
	Application.OrderNumber, 
	Application.Description, 
	detail.PaymentApplicationRestrictionCode, 
	detail.PaymentDetailStatusCode,
	detail.SummaryDisplay,
	detail.PayorContactKey,
	Application.AppliedAmount
 from PaymentMain p
 inner join PaymentDetail detail on p.PaymentDetailKey = detail.PaymentDetailKey
 inner join (SELECT o.OrderKey, o.OrderNumber, o.Description,
	 sum(ma.Amount) as 'AppliedAmount',
	 ma.SrcPaymentKey
	 from MonetaryApplication ma
 	inner join InvoiceMain im on ma.InvoiceKey = im.InvoiceKey
 	inner join OrderMain o on im.OrderNumber = o.OrderNumber
	group by o.OrderNumber, o.OrderKey, o.Description, ma.SrcPaymentKey) Application
	ON Application.SrcPaymentKey = p.PaymentKey
 LEFT OUTER JOIN Remittance r on r.PaymentDetailKey = p.PaymentDetailKey
    WHERE r.RemittanceKey is null

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoPaymentApplicationToOrder]'))
    DROP VIEW [dbo].[vBoPaymentApplicationToOrder]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoPaymentApplicationToOrder] AS SELECT vPaymentApplicationToOrder.Amount,vPaymentApplicationToOrder.AppliedAmount,vPaymentApplicationToOrder.Description,vPaymentApplicationToOrder.OrderKey,vPaymentApplicationToOrder.OrderNumber,vPaymentApplicationToOrder.PaymentApplicationRestrictionCode,vPaymentApplicationToOrder.PaymentDate,vPaymentApplicationToOrder.PaymentDetailStatusCode,vPaymentApplicationToOrder.PaymentKey,vPaymentApplicationToOrder.PayorContactKey,vPaymentApplicationToOrder.SummaryDisplay FROM vPaymentApplicationToOrder
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoPaymentDetail]'))
    DROP VIEW [dbo].[vBoPaymentDetail]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoPaymentDetail] AS SELECT PaymentDetail.CreatedByUserKey,PaymentDetail.CreatedOn,PaymentDetail.CurrencyCode,PaymentDetail.OriginalAmount,PaymentDetail.PaymentApplicationRestrictionCode,PaymentDetail.PaymentDetailKey,PaymentDetail.PaymentDetailStatusCode,PaymentDetail.PaymentMethodKey,PaymentDetail.PaymentTypeKey,PaymentDetail.PayorContactKey,PaymentDetail.ReferenceNumber,PaymentDetail.SerializedDetails,PaymentDetail.SummaryDisplay,PaymentDetail.UpdatedByUserKey,PaymentDetail.UpdatedOn,PaymentDetail.PaymentDetailBOName FROM PaymentDetail
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoPaymentDetailStatusRef]'))
    DROP VIEW [dbo].[vBoPaymentDetailStatusRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoPaymentDetailStatusRef] AS SELECT PaymentDetailStatusRef.PaymentDetailStatusCode,PaymentDetailStatusRef.PaymentDetailStatusDesc,PaymentDetailStatusRef.PaymentDetailStatusName FROM PaymentDetailStatusRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoPaymentMethod]'))
    DROP VIEW [dbo].[vBoPaymentMethod]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoPaymentMethod] AS SELECT PaymentMethod.PaymentMethodName,PaymentMethod.PaymentTypeKey,PaymentMethod.CreatedByUserKey,PaymentMethod.CreatedOn,PaymentMethod.PaymentMethodKey,PaymentMethod.SystemEntityKey,PaymentMethod.UpdatedByUserKey,PaymentMethod.UpdatedOn,PaymentMethod.CashGLAccountKey,PaymentMethod.CurrencyCode,PaymentMethod.FinancialEntityKey,PaymentMethod.GatewayAccountKey FROM PaymentMethod
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoPaymentMethodSet]'))
    DROP VIEW [dbo].[vBoPaymentMethodSet]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoPaymentMethodSet] AS SELECT MethodSet.MethodSetKey,MethodSet.MethodSetName AS Name,MethodSet.MethodSetTypeCode,MethodSet.CreatedByUserKey,MethodSet.CreatedOn,MethodSet.MethodSetDescription AS Description,MethodSet.SystemEntityKey,MethodSet.UpdatedByUserKey,MethodSet.UpdatedOn,MethodSet.IsDefault FROM MethodSet WHERE MethodSetTypeCode=1
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoPaymentMethodSetDetail]'))
    DROP VIEW [dbo].[vBoPaymentMethodSetDetail]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoPaymentMethodSetDetail] AS SELECT MethodSetDetail.IsDefault,MethodSetDetail.MethodSetDetailKey,MethodSetDetail.MethodSetKey,MethodSetDetail.Priority,MethodSetDetail.VisibleName,PaymentMethodSetDetail.IsAvailableForCreditHold,PaymentMethodSetDetail.PaymentMethodKey FROM MethodSetDetail
	INNER JOIN PaymentMethodSetDetail
		ON MethodSetDetail.MethodSetDetailKey = PaymentMethodSetDetail.MethodSetDetailKey
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vPaymentReport]'))
    DROP VIEW [dbo].[vPaymentReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vPaymentReport]
AS
SELECT PM.PaymentKey, PM.Amount AS TotalPaymentAmount, PM.PaymentDate, PM.AmountHome, PM.CurrencyCode,
	PAR.PaymentApplicationRestrictionCode, PAR.PaymentApplicationRestrictionDesc, 
	MA.Amount AS AppliedAmount, MA.DiscountTaken, MA.CurrencyVariance, 
	MA.SrcPaymentKey, MA.OrderNumber as MAOrderNumber, MA.SrcInvoiceLineKey, MA.MonetaryApplicationKey,
	IM.InvoiceKey, IM.InvoiceNumber, IM.InvoiceDate, IM.OrderNumber AS InvOrderNumber,
	SRCIL.InvoiceKey as AdjInvoiceKey, SRCIL.InvoiceNumber AS AdjInvoiceNumber,
	(SELECT  MA.Amount WHERE MA.SrcPaymentKey IS NOT  NULL) AS Payment,
	(SELECT MA.Amount WHERE MA.SrcPaymentKey IS  NULL or MA.SrcInvoiceLineKey IS NOT  NULL) AS Adjustment

FROM MonetaryApplication MA 
	LEFT OUTER JOIN	PaymentMain PM 	ON 	PM.PaymentKey = MA.SrcPaymentKey 
	LEFT OUTER JOIN	InvoiceLine SRCIL 	ON 	SRCIL.InvoiceLineKey = MA.SrcInvoiceLineKey 
	LEFT OUTER JOIN 	PaymentApplicationRestrictionRef PAR 	ON 	PM.PaymentApplicationRestrictionCode = PAR.PaymentApplicationRestrictionCode
	LEFT OUTER JOIN 	InvoiceMain IM 		ON 	MA.InvoiceKey = IM.InvoiceKey

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoPaymentReport]'))
    DROP VIEW [dbo].[vBoPaymentReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoPaymentReport] AS SELECT vPaymentReport.AdjInvoiceKey,vPaymentReport.AdjInvoiceNumber,vPaymentReport.Adjustment,vPaymentReport.AmountHome,vPaymentReport.AppliedAmount,vPaymentReport.CurrencyCode,vPaymentReport.CurrencyVariance,vPaymentReport.DiscountTaken,vPaymentReport.InvoiceDate,vPaymentReport.InvoiceKey,vPaymentReport.InvoiceNumber,vPaymentReport.MonetaryApplicationKey,vPaymentReport.Payment,vPaymentReport.PaymentApplicationRestrictionCode,vPaymentReport.PaymentApplicationRestrictionDesc,vPaymentReport.PaymentDate,vPaymentReport.PaymentKey,vPaymentReport.SrcInvoiceLineKey,vPaymentReport.SrcPaymentKey,vPaymentReport.TotalPaymentAmount,vPaymentReport.InvOrderNumber,vPaymentReport.MAOrderNumber FROM vPaymentReport
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoPaymentScheduleLine]'))
    DROP VIEW [dbo].[vBoPaymentScheduleLine]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoPaymentScheduleLine] AS SELECT PaymentScheduleLine.AmountDue,PaymentScheduleLine.PaymentNumber,PaymentScheduleLine.PaymentScheduleLineKey,PaymentScheduleLine.OutstandingBalance,PaymentScheduleLine.AmountDueHome,PaymentScheduleLine.DueDate,PaymentScheduleLine.GLAccountKey,PaymentScheduleLine.OutstandingBalanceHome,PaymentScheduleLine.PayPriority,PaymentScheduleLine.InvoiceKey FROM PaymentScheduleLine
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoPaymentTerms]'))
    DROP VIEW [dbo].[vBoPaymentTerms]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoPaymentTerms] AS SELECT PaymentTerms.CreatedByUserKey,PaymentTerms.CreatedOn,PaymentTerms.EarlyDiscountDays,PaymentTerms.EarlyDiscountPercent,PaymentTerms.FirstPaymentDateOffset,PaymentTerms.FirstPaymentDateTypeCode,PaymentTerms.IsFirstPaymentDateAdjustable,PaymentTerms.IsSystem,PaymentTerms.PaymentIntervalCount,PaymentTerms.PaymentIntervalSize,PaymentTerms.PaymentIntervalTypeCode,PaymentTerms.PaymentTermsDescription AS Description,PaymentTerms.PaymentTermsKey,PaymentTerms.PaymentTermsName AS Name,PaymentTerms.SystemEntityKey,PaymentTerms.UpdatedByUserKey,PaymentTerms.UpdatedOn FROM PaymentTerms
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoPaymentType]'))
    DROP VIEW [dbo].[vBoPaymentType]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoPaymentType] AS SELECT PaymentType.PaymentTypeName,PaymentType.Priority,PaymentType.CreatedByUserKey,PaymentType.CreatedOn,PaymentType.PaymentTypeKey,PaymentType.SystemEntityKey,PaymentType.UpdatedByUserKey,PaymentType.UpdatedOn,PaymentType.GatewayTypeCode,PaymentType.EditGuiContentCode,PaymentType.PaymentDetailBOName FROM PaymentType
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoPerspective]'))
    DROP VIEW [dbo].[vBoPerspective]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoPerspective] AS SELECT Perspective.PerspectiveKey,Perspective.RootHierarchyKey,Perspective.WebsiteKey,Perspective.PerspectiveName,Perspective.HomePageHierarchyKey FROM Perspective
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoPhysicalAddress]'))
    DROP VIEW [dbo].[vBoPhysicalAddress]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoPhysicalAddress] AS SELECT AddressMain.UpdatedByUserKey,AddressMain.AddressStatusCode,AddressMain.IsPhysicalAddress,AddressMain.LastVerifiedOn,AddressMain.BadAddressReasonKey,AddressMain.UpdatedOn,AddressMain.FormattedAddress,AddressMain.AddressKey,AddressMain.CreatedByUserKey,AddressMain.CreatedOn,AddressMain.SystemEntityKey,AddressMain.AddressCategoryCode,AddressMain.OwnerContactKey,PhysicalAddress.Address1,PhysicalAddress.Address2,PhysicalAddress.Address3,PhysicalAddress.BarCode,PhysicalAddress.CarrierRoute,PhysicalAddress.City,PhysicalAddress.County,PhysicalAddress.DeliveryPointBarCode,PhysicalAddress.Latitude,PhysicalAddress.LineOfTravel,PhysicalAddress.Longitude,PhysicalAddress.MailCode,PhysicalAddress.PostalCode,PhysicalAddress.Region,PhysicalAddress.StateHouse,PhysicalAddress.StateSenate,PhysicalAddress.TaxScheduleKey,PhysicalAddress.TimeZoneKey,PhysicalAddress.USCongress,PhysicalAddress.CountryCode,PhysicalAddress.StateProvinceCode FROM AddressMain
	INNER JOIN PhysicalAddress
		ON AddressMain.AddressKey = PhysicalAddress.AddressKey WHERE AddressMain.IsPhysicalAddress = '1'
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoPickList]'))
    DROP VIEW [dbo].[vBoPickList]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoPickList] AS SELECT PickList.Name,PickList.CreatedByUserKey,PickList.CreatedOn,PickList.PickListKey,PickList.SystemEntityKey,PickList.UpdatedByUserKey,PickList.UpdatedOn FROM PickList
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoPickListItem]'))
    DROP VIEW [dbo].[vBoPickListItem]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoPickListItem] AS SELECT PickListItem.OrderFulfillmentLineKey,PickListItem.PickListItemKey,PickListItem.PickListKey FROM PickListItem
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vPickListReport]'))
    DROP VIEW [dbo].[vPickListReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vPickListReport]
AS
SELECT 
	PL.PickListKey, PL.Name as PickListName, PLI.PickListItemKey, 
	OFL.OrderFulfillmentLineKey, OFL.Quantity, OFL.BinNumber, OFL.DateFulfilled,OFL.InvoiceNumber, 
	OFSR.OrderFulfillmentStatusCode, OFSR.OrderFulfillmentStatusDesc,
	OPL.OrderPickLineKey, OPL.QuantityPicked,
	PINV.ProductInventoryKey, PINV.QuantityOnHand, PINV.LotId, 
	PM.ProductKey, PM.ProductCode, PM.Name as ProductName,
	WH.WarehouseKey, WH.Description, WTR.WarehouseTypeDesc as WareHouseType, WH.HoursOfOperation, WH.Holidays,
	AM.FormattedAddress as WarehouseAddress,
	U.Name as UomName,
	OM.OrderNumber, OM.OrderKey, OM.OrderDate
FROM PickList PL LEFT OUTER JOIN 
	PickListItem PLI ON PL. PickListKey= PLI.PickListKey LEFT OUTER JOIN 
	OrderFulfillmentLine OFL ON PLI. OrderFulfillmentLineKey= OFL.OrderFulfillmentLineKey LEFT OUTER JOIN 
	OrderFulfillmentStatusRef OFSR ON OFL.OrderFulfillmentStatusCode = OFSR.OrderFulfillmentStatusCode LEFT OUTER JOIN 
	OrderPickLine OPL ON OFL.OrderFulfillmentLineKey = OPL.OrderFulfillmentLineKey LEFT OUTER JOIN 
	ProductInventory PINV ON OPL.ProductInventoryKey = PINV.ProductInventoryKey LEFT OUTER JOIN 
	ProductMain PM ON PINV.ProductKey = PM.ProductKey LEFT OUTER JOIN 
	ProductWarehouse PW ON PM.ProductKey = PW.ProductKey LEFT OUTER JOIN 
	Warehouse WH ON PW.WarehouseKey = WH.WarehouseKey LEFT OUTER JOIN 
	AddressMain AM ON WH.FullAddressKey = AM.AddressKey LEFT OUTER JOIN 
	Uom U ON PINV.UomKey = U.UomKey LEFT OUTER JOIN 
	OrderLine  OL ON OFL.OrderLineKey = OL.OrderLineKey LEFT OUTER JOIN 
	OrderMain OM ON OL.OrderKey = OM.OrderKey LEFT OUTER JOIN 
	WarehouseTypeRef WTR ON WH.WarehouseTypeCode = WTR.WarehouseTypeCode

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoPickListReport]'))
    DROP VIEW [dbo].[vBoPickListReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoPickListReport] AS SELECT vPickListReport.BinNumber,vPickListReport.DateFulfilled,vPickListReport.Description,vPickListReport.Holidays,vPickListReport.HoursOfOperation,vPickListReport.InvoiceNumber,vPickListReport.LotId,vPickListReport.OrderDate,vPickListReport.OrderFulfillmentLineKey,vPickListReport.OrderFulfillmentStatusCode,vPickListReport.OrderFulfillmentStatusDesc,vPickListReport.OrderKey,vPickListReport.OrderNumber,vPickListReport.OrderPickLineKey,vPickListReport.PickListItemKey,vPickListReport.PickListKey,vPickListReport.PickListName,vPickListReport.ProductCode,vPickListReport.ProductInventoryKey,vPickListReport.ProductKey,vPickListReport.ProductName,vPickListReport.Quantity,vPickListReport.QuantityOnHand,vPickListReport.QuantityPicked,vPickListReport.UomName,vPickListReport.WarehouseAddress,vPickListReport.WarehouseKey,vPickListReport.WareHouseType FROM vPickListReport
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoPicture]'))
    DROP VIEW [dbo].[vBoPicture]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoPicture] AS SELECT Picture.Alt,Picture.Data,Picture.ImageKey AS PictureKey,Picture.ImageUrl,Picture.MimeType FROM Picture
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoPicturePurposeRef]'))
    DROP VIEW [dbo].[vBoPicturePurposeRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoPicturePurposeRef] AS SELECT PicturePurposeRef.PicturePurposeDesc AS Description,PicturePurposeRef.PicturePurposeKey FROM PicturePurposeRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoPipeline]'))
    DROP VIEW [dbo].[vBoPipeline]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoPipeline] AS SELECT Pipeline.Name,Pipeline.OrderTypeKey,Pipeline.PipelineKey FROM Pipeline
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoPipelineStage]'))
    DROP VIEW [dbo].[vBoPipelineStage]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoPipelineStage] AS SELECT PipelineStage.ComponentKey,PipelineStage.Name,PipelineStage.PipelineKey,PipelineStage.Sequence,PipelineStage.PipelineStageKey FROM PipelineStage
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoPostalCodeRef]'))
    DROP VIEW [dbo].[vBoPostalCodeRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoPostalCodeRef] AS SELECT PostalCodeRef.PostalCode AS Code,PostalCodeRef.ChapterGroupKey,PostalCodeRef.City,PostalCodeRef.CountryCode,PostalCodeRef.County,PostalCodeRef.CountyFIPS,PostalCodeRef.IsHandEntered,PostalCodeRef.IsHandModified,PostalCodeRef.Region,PostalCodeRef.UpdatedByUserKey,PostalCodeRef.UpdatedOn,PostalCodeRef.IsActive,PostalCodeRef.StateProvinceCode,PostalCodeRef.PostalCodeKey FROM PostalCodeRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoPotentialMatchingGift]'))
    DROP VIEW [dbo].[vBoPotentialMatchingGift]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoPotentialMatchingGift] AS SELECT PotentialMatchingGift.DateCreated,PotentialMatchingGift.DateMatchingFormSubmitted,PotentialMatchingGift.DateMatchingGiftFormReceived,PotentialMatchingGift.MatchingGiftInformation,PotentialMatchingGift.MatchingGiftPlanKey,PotentialMatchingGift.MatchingGiftRelationshipKey,PotentialMatchingGift.UpdatedByUserKey,PotentialMatchingGift.UpdatedOn,PotentialMatchingGift.Amount,PotentialMatchingGift.OrderLineKey,PotentialMatchingGift.CreatedByUserKey,PotentialMatchingGift.CreatedOn,PotentialMatchingGift.PotentialMatchingGiftKey,PotentialMatchingGift.SystemEntityKey FROM PotentialMatchingGift
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoPrefixRef]'))
    DROP VIEW [dbo].[vBoPrefixRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoPrefixRef] AS SELECT PrefixRef.PrefixCode AS Code,PrefixRef.PrefixDesc AS Description,PrefixRef.SyncPrefixCode,PrefixRef.Gender,PrefixRef.PrefixKey FROM PrefixRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoPriceBasisRef]'))
    DROP VIEW [dbo].[vBoPriceBasisRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoPriceBasisRef] AS SELECT PriceBasisRef.PriceBasisCode,PriceBasisRef.PriceBasisDesc,PriceBasisRef.PriceBasisName FROM PriceBasisRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoPriceBreak]'))
    DROP VIEW [dbo].[vBoPriceBreak]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoPriceBreak] AS SELECT PriceBreak.CreatedByUserKey,PriceBreak.CreatedOn,PriceBreak.PriceBreakKey,PriceBreak.UpdatedByUserKey,PriceBreak.UpdatedOn,PriceBreak.MinQuantity,PriceBreak.UnitRate,PriceBreak.PriceDetailKey,PriceBreak.UomKey,PriceBreak.IsPercent,PriceBreak.PriceBasisCode FROM PriceBreak
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoPriceDetail]'))
    DROP VIEW [dbo].[vBoPriceDetail]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoPriceDetail] AS SELECT PriceDetail.CreatedByUserKey,PriceDetail.CreatedOn,PriceDetail.PriceDetailKey,PriceDetail.ProductKey,PriceDetail.UpdatedByUserKey,PriceDetail.UpdatedOn,PriceDetail.CurrencyCode FROM PriceDetail
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoPriceSheet]'))
    DROP VIEW [dbo].[vBoPriceSheet]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoPriceSheet] AS SELECT PriceSheet.Description,PriceSheet.Name,PriceSheet.UpdatedByUserKey,PriceSheet.UpdatedOn,PriceSheet.ComparisonPriceSheetKey,PriceSheet.ParentPriceSheetKey,PriceSheet.Priority,PriceSheet.CreatedByUserKey,PriceSheet.CreatedOn,PriceSheet.PriceSheetKey,PriceSheet.SystemEntityKey FROM PriceSheet
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoPriceSheetDiscount]'))
    DROP VIEW [dbo].[vBoPriceSheetDiscount]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoPriceSheetDiscount] AS SELECT PriceSheetDiscount.UpdatedByUserKey,PriceSheetDiscount.UpdatedOn,PriceSheetDiscount.DiscountRuleKey,PriceSheetDiscount.PriceSheetVersionKey FROM PriceSheetDiscount
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vPriceSheetReport]'))
    DROP VIEW [dbo].[vPriceSheetReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vPriceSheetReport]
AS
SELECT     
PM.Name AS ProductName, PS.Name AS PriceSheetName, PS.Description as PriceSheetDescription, PS.Priority,
PSV.Version, PSV.BeginDate, PSV.EndDate, PSV.Adjustment, PSV.IsAdjustmentPercent, PVD.IsVersionOwner, 
PD.CurrencyCode, UOM.Name AS UomName, PB.PriceBasisCode, PB.MinQuantity, PB.UnitRate, PB.IsPercent, 
BPS.Name as BasePriceSheet, BPS.Description as BasePriceSheetDesc, CPS.Name as ComparisonPriceSheet,
CPS.Description as ComparisonPriceSheetDesc,
PS.ParentPriceSheetKey,PS.ComparisonPriceSheetKey, PVD.OriginalPriceDetailKey, PM.ProductKey, 
PS.PriceSheetKey, PD.PriceDetailKey

FROM       ProductMain PM 
LEFT OUTER JOIN  PriceDetail PD ON PD.ProductKey = PM.ProductKey 
LEFT OUTER JOIN  PriceBreak PB ON PB.PriceDetailKey = PD.PriceDetailKey 
LEFT OUTER JOIN  Uom UOM ON UOM.UomKey = PB.UomKey 
LEFT OUTER JOIN  PriceVersionDetail PVD ON PVD.PriceDetailKey = PD.PriceDetailKey 
LEFT OUTER JOIN  PriceSheetVersion PSV ON PSV.PriceSheetVersionKey = PVD.PriceSheetVersionKey 
LEFT OUTER JOIN  PriceSheet PS ON PS.PriceSheetKey = PSV.PriceSheetKey
LEFT OUTER JOIN  PriceSheet CPS ON PS.ComparisonPriceSheetKey = CPS.PriceSheetKey
LEFT OUTER JOIN  PriceSheet BPS ON PS.ParentPriceSheetKey = BPS.PriceSheetKey

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoPriceSheetReport]'))
    DROP VIEW [dbo].[vBoPriceSheetReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoPriceSheetReport] AS SELECT vPriceSheetReport.Adjustment,vPriceSheetReport.BasePriceSheet,vPriceSheetReport.BasePriceSheetDesc,vPriceSheetReport.BeginDate,vPriceSheetReport.ComparisonPriceSheet,vPriceSheetReport.ComparisonPriceSheetDesc,vPriceSheetReport.ComparisonPriceSheetKey,vPriceSheetReport.CurrencyCode,vPriceSheetReport.EndDate,vPriceSheetReport.IsPercent,vPriceSheetReport.MinQuantity,vPriceSheetReport.OriginalPriceDetailKey,vPriceSheetReport.ParentPriceSheetKey,vPriceSheetReport.PriceBasisCode,vPriceSheetReport.PriceDetailKey,vPriceSheetReport.PriceSheetDescription,vPriceSheetReport.PriceSheetKey,vPriceSheetReport.PriceSheetName,vPriceSheetReport.Priority,vPriceSheetReport.ProductKey,vPriceSheetReport.ProductName,vPriceSheetReport.UnitRate,vPriceSheetReport.UomName,vPriceSheetReport.Version,vPriceSheetReport.IsAdjustmentPercent,vPriceSheetReport.IsVersionOwner FROM vPriceSheetReport
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoPriceSheetVersion]'))
    DROP VIEW [dbo].[vBoPriceSheetVersion]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoPriceSheetVersion] AS SELECT PriceSheetVersion.Adjustment,PriceSheetVersion.BeginDate,PriceSheetVersion.CreatedByUserKey,PriceSheetVersion.CreatedOn,PriceSheetVersion.EndDate,PriceSheetVersion.PriceSheetKey,PriceSheetVersion.PriceSheetVersionKey,PriceSheetVersion.UpdatedByUserKey,PriceSheetVersion.UpdatedOn,PriceSheetVersion.Version,PriceSheetVersion.IsAdjustmentPercent FROM PriceSheetVersion
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoPriceVersionDetail]'))
    DROP VIEW [dbo].[vBoPriceVersionDetail]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoPriceVersionDetail] AS SELECT PriceVersionDetail.CreatedByUserKey,PriceVersionDetail.CreatedOn,PriceVersionDetail.OriginalPriceDetailKey,PriceVersionDetail.PriceDetailKey,PriceVersionDetail.PriceSheetVersionKey,PriceVersionDetail.UpdatedByUserKey,PriceVersionDetail.UpdatedOn,PriceVersionDetail.IsVersionOwner FROM PriceVersionDetail
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoPricingTypeRef]'))
    DROP VIEW [dbo].[vBoPricingTypeRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoPricingTypeRef] AS SELECT PricingTypeRef.PricingTypeCode,PricingTypeRef.PricingTypeDesc,PricingTypeRef.PricingTypeName FROM PricingTypeRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vProcessTypeDefaultOwnerAllUsers]'))
    DROP VIEW [dbo].[vProcessTypeDefaultOwnerAllUsers]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vProcessTypeDefaultOwnerAllUsers]
AS
SELECT [dbo].[ContactMain].[FullName], [dbo].[UserMain].[UserId], [dbo].[UserMain].[UserKey]
FROM [dbo].[UserMain] 
INNER JOIN [dbo].[ContactMain] ON [dbo].[UserMain].[UserKey] = [dbo].[ContactMain].[ContactKey]
INNER JOIN [dbo].[GroupMember] ON [dbo].[GroupMember].[MemberContactKey] = [dbo].[UserMain].[UserKey] 
INNER JOIN [dbo].[SystemConfig] ON [dbo].[GroupMember].[GroupKey] = [dbo].[SystemConfig].[ParameterValue]
WHERE (([dbo].[UserMain].[IsDisabled] = 0)) AND ([dbo].[SystemConfig].[ParameterName] = 'OppOwnerGroupKey' 
OR [dbo].[SystemConfig].[ParameterName] = 'OppAdminGroupKey')
UNION
SELECT [dbo].[ContactMain].[FullName], [dbo].[UserMain].[UserId], [dbo].[UserMain].[UserKey]
FROM [dbo].[UserMain]
INNER JOIN [dbo].[ContactMain] ON [dbo].[UserMain].[UserKey] = [dbo].[ContactMain].[ContactKey] 
INNER JOIN [dbo].[Name] ON [dbo].[ContactMain].[SyncContactID] = [dbo].[Name].[ID]
INNER JOIN [dbo].[Name_Fin] ON [dbo].[Name].[ID] = [dbo].[Name_Fin].[ID]
INNER JOIN [dbo].[UserRole] ON [dbo].[UserMain].[UserKey] = [dbo].[UserRole].[UserKey]
INNER JOIN [dbo].[RoleMain] ON [dbo].[UserRole].[RoleKey] = [dbo].[RoleMain].[RoleKey]
WHERE (([dbo].[UserMain].[IsDisabled] = 0)) AND [dbo].[RoleMain].[Name] = 'SysAdmin'

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoProcessTypeDefaultOwnerAllUsers]'))
    DROP VIEW [dbo].[vBoProcessTypeDefaultOwnerAllUsers]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoProcessTypeDefaultOwnerAllUsers] AS SELECT vProcessTypeDefaultOwnerAllUsers.FullName,vProcessTypeDefaultOwnerAllUsers.UserId,vProcessTypeDefaultOwnerAllUsers.UserKey FROM vProcessTypeDefaultOwnerAllUsers
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoProduct]'))
    DROP VIEW [dbo].[vBoProduct]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoProduct] AS SELECT ProductMain.InventoryUomKey,ProductMain.ProductTypeKey,ProductMain.PurchaseUomKey,ProductMain.TaxCategoryKey,ProductMain.UomGroupKey,ProductMain.UPCCode,ProductMain.TaxScheduleKey,ProductMain.EffectiveDate,ProductMain.PayPriority,ProductMain.ProductSetTypeCode,ProductMain.DefaultWarehouseKey,ProductMain.DefaultSalesUomKey,ProductMain.HasPhysicalInventory,ProductMain.HasRoyalties,ProductMain.IsCommissionable,ProductMain.Name,ProductMain.ProductCode,ProductMain.ProductStatusCode,ProductMain.DeferralTermsKey,ProductMain.IncursHandlingChargeFlag,ProductMain.IncursRestockChargeFlag,ProductMain.NumPieces,ProductMain.Weight,ProductMain.ReplacementProductKey,ProductMain.CommissionCategoryKey,ProductMain.ProductClassKey,ProductMain.FairMarketValue,ProductMain.AccessKey,ProductMain.CreatedByUserKey,ProductMain.CreatedOn,ProductMain.ProductKey,ProductMain.SystemEntityKey,ProductMain.UpdatedByUserKey,ProductMain.UpdatedOn,ProductMain.AccountingMethodCode,ProductMain.StandardCost,ProductMain.UseFourDecimalsFlag,ProductMain.PaymentTermsKey,ProductMain.UseChildPricingFlag,ProductMain.IncursShippingChargeFlag,ProductMain.OwnerGroupKey FROM ProductMain
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoProductAppliance]'))
    DROP VIEW [dbo].[vBoProductAppliance]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoProductAppliance] AS SELECT ProductMain.InventoryUomKey,ProductMain.ProductTypeKey,ProductMain.PurchaseUomKey,ProductMain.TaxCategoryKey,ProductMain.UomGroupKey,ProductMain.UPCCode,ProductMain.TaxScheduleKey,ProductMain.EffectiveDate,ProductMain.PayPriority,ProductMain.ProductSetTypeCode,ProductMain.DefaultWarehouseKey,ProductMain.DefaultSalesUomKey,ProductMain.HasPhysicalInventory,ProductMain.HasRoyalties,ProductMain.IsCommissionable,ProductMain.Name,ProductMain.ProductCode,ProductMain.ProductStatusCode,ProductMain.DeferralTermsKey,ProductMain.IncursHandlingChargeFlag,ProductMain.IncursRestockChargeFlag,ProductMain.NumPieces,ProductMain.Weight,ProductMain.ReplacementProductKey,ProductMain.CommissionCategoryKey,ProductMain.ProductClassKey,ProductMain.FairMarketValue,ProductMain.AccessKey,ProductMain.CreatedByUserKey,ProductMain.CreatedOn,ProductMain.ProductKey,ProductMain.SystemEntityKey,ProductMain.UpdatedByUserKey,ProductMain.UpdatedOn,ProductMain.AccountingMethodCode,ProductMain.StandardCost,ProductMain.UseFourDecimalsFlag,ProductMain.PaymentTermsKey,ProductMain.UseChildPricingFlag,ProductMain.IncursShippingChargeFlag,ProductMain.OwnerGroupKey FROM ProductMain
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoProductBook]'))
    DROP VIEW [dbo].[vBoProductBook]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoProductBook] AS SELECT ProductMain.InventoryUomKey,ProductMain.ProductTypeKey,ProductMain.PurchaseUomKey,ProductMain.TaxCategoryKey,ProductMain.UomGroupKey,ProductMain.UPCCode,ProductMain.TaxScheduleKey,ProductMain.EffectiveDate,ProductMain.PayPriority,ProductMain.ProductSetTypeCode,ProductMain.DefaultWarehouseKey,ProductMain.DefaultSalesUomKey,ProductMain.HasPhysicalInventory,ProductMain.HasRoyalties,ProductMain.IsCommissionable,ProductMain.Name,ProductMain.ProductCode,ProductMain.ProductStatusCode,ProductMain.DeferralTermsKey,ProductMain.IncursHandlingChargeFlag,ProductMain.IncursRestockChargeFlag,ProductMain.NumPieces,ProductMain.Weight,ProductMain.ReplacementProductKey,ProductMain.CommissionCategoryKey,ProductMain.ProductClassKey,ProductMain.FairMarketValue,ProductMain.AccessKey,ProductMain.CreatedByUserKey,ProductMain.CreatedOn,ProductMain.ProductKey,ProductMain.SystemEntityKey,ProductMain.UpdatedByUserKey,ProductMain.UpdatedOn,ProductMain.AccountingMethodCode,ProductMain.StandardCost,ProductMain.UseFourDecimalsFlag,ProductMain.PaymentTermsKey,ProductMain.UseChildPricingFlag,ProductMain.IncursShippingChargeFlag,ProductMain.OwnerGroupKey,ProductBook.Author,ProductBook.Publisher,ProductBook.Type AS BookType,ProductBook.MonthPublished,ProductBook.YearPublished,ProductBook.DatePublished FROM ProductMain
	INNER JOIN ProductBook
		ON ProductMain.ProductKey = ProductBook.ProductKey
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoProductClass]'))
    DROP VIEW [dbo].[vBoProductClass]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoProductClass] AS SELECT ProductClass.HasPhysicalInventory,ProductClass.InventoryUomKey,ProductClass.PurchaseUomKey,ProductClass.TaxCategoryKey,ProductClass.UomGroupKey,ProductClass.TaxScheduleKey,ProductClass.DefaultWarehouseKey,ProductClass.DefaultSalesUomKey,ProductClass.FinancialEntityKey,ProductClass.DeferralTermsKey,ProductClass.IncursHandlingChargeFlag,ProductClass.IncursRestockChargeFlag,ProductClass.CommissionCategoryKey,ProductClass.Name,ProductClass.IsCommissionable,ProductClass.AccessKey,ProductClass.CreatedByUserKey,ProductClass.CreatedOn,ProductClass.ProductClassKey,ProductClass.SystemEntityKey,ProductClass.UpdatedByUserKey,ProductClass.UpdatedOn,ProductClass.AccountingMethodCode,ProductClass.UseFourDecimalsFlag,ProductClass.PaymentTermsKey,ProductClass.IncursShippingChargeFlag FROM ProductClass
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vProductClassReport]'))
    DROP VIEW [dbo].[vProductClassReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vProductClassReport]
AS
SELECT	PC.ProductClassKey, PGLA.ParentKey,PM.ProductKey, PC.Name AS ProductClassName, PM.ProductCode, PM.Name AS ProductName, PC.HasPhysicalInventory, 
        		PC.IsCommissionable, PC.AccountingMethodCode, W.Description AS Warehouse, TS.Name AS TaxScheduleName, TC.Name AS TaxCategoryName, 
        		TC.Description AS TaxCategoryDescription,  UG.Name AS UomGroupName, FE.Name AS FinancialEntityName, 
		UI.Name AS UomInventoryName, UP.Name AS UomPurchaseName, US.Name AS UomSalesName,
		GA.GLAccountCode AS ProdGLAcCode, GA.Description AS ProdGLAcName,
			(Select GA.GLAccountCode where PGLA.GLAccountPurposeCode = 'INV') as InvGLAcCode,
			(Select GA.Description where PGLA.GLAccountPurposeCode = 'INV') as InvGLAcName,

			(Select GA.GLAccountCode where PGLA.GLAccountPurposeCode = 'COG') as CogsGLAcCode,
			(Select GA.Description where PGLA.GLAccountPurposeCode = 'COG') as CogsGLAcName,

			(Select GA.GLAccountCode where PGLA.GLAccountPurposeCode = 'ADJ') as AdjGLAcCode,
			(Select GA.Description where PGLA.GLAccountPurposeCode = 'ADJ') as AdjGLAcName,

			(Select GA.GLAccountCode where PGLA.GLAccountPurposeCode = 'DAG') as DamGLAcCode,
			(Select GA.Description where PGLA.GLAccountPurposeCode = 'DAG') as DamGLAcName,

			(Select GA.GLAccountCode where PGLA.GLAccountPurposeCode = 'DIN') as DefIncGLAcCode,
			(Select GA.Description where PGLA.GLAccountPurposeCode = 'DIN') as DefIncGLAcName,
			
			(Select GA.GLAccountCode where PGLA.GLAccountPurposeCode = 'INC') as IncGLAcCode,
			(Select GA.Description where PGLA.GLAccountPurposeCode = 'INC') as IncGLAcName,


			(Select GA.GLAccountCode where PGLA.GLAccountPurposeCode = 'ACR') as ARGLAcCode,
			(Select GA.Description where PGLA.GLAccountPurposeCode = 'ACR') as ARGLAcName

FROM		ProductClass PC LEFT OUTER JOIN
       		 UomGroup UG ON PC.UomGroupKey = UG.UomGroupKey LEFT OUTER JOIN
        		TaxSchedule TS ON PC.TaxScheduleKey = TS.TaxScheduleKey LEFT OUTER JOIN
        		TaxCategory TC ON PC.TaxCategoryKey = TC.TaxCategoryKey LEFT OUTER JOIN
        		Warehouse W ON PC.DefaultWarehouseKey = W.WarehouseKey LEFT OUTER JOIN
       	 	FinancialEntity FE ON PC.FinancialEntityKey = FE.FinancialEntityKey LEFT OUTER JOIN
        		Uom US ON PC.DefaultSalesUomKey = US.UomKey LEFT OUTER JOIN
       		Uom UP ON PC.PurchaseUomKey = UP.UomKey LEFT OUTER JOIN
        		Uom UI ON PC.InventoryUomKey = UI.UomKey LEFT OUTER JOIN
        		ProductMain PM ON PC.ProductClassKey = PM.ProductClassKey LEFT OUTER JOIN
		ProductGLAccount PGLA ON PC.ProductClassKey = PGLA.ParentKey LEFT OUTER JOIN
		GLAccount GA ON PGLA.GLAccountKey = GA.GLAccountKey

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoProductClassReport]'))
    DROP VIEW [dbo].[vBoProductClassReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoProductClassReport] AS SELECT vProductClassReport.AdjGLAcCode,vProductClassReport.AdjGLAcName,vProductClassReport.ARGLAcCode,vProductClassReport.ARGLAcName,vProductClassReport.CogsGLAcCode,vProductClassReport.CogsGLAcName,vProductClassReport.DamGLAcCode,vProductClassReport.DamGLAcName,vProductClassReport.DefIncGLAcCode,vProductClassReport.DefIncGLAcName,vProductClassReport.FinancialEntityName,vProductClassReport.HasPhysicalInventory,vProductClassReport.InvGLAcCode,vProductClassReport.InvGLAcName,vProductClassReport.IsCommissionable,vProductClassReport.ParentKey,vProductClassReport.ProdGLAcCode,vProductClassReport.ProdGLAcName,vProductClassReport.ProductClassKey,vProductClassReport.ProductClassName,vProductClassReport.ProductCode,vProductClassReport.ProductKey,vProductClassReport.ProductName,vProductClassReport.TaxCategoryName,vProductClassReport.TaxScheduleName,vProductClassReport.UomGroupName,vProductClassReport.UomInventoryName,vProductClassReport.UomPurchaseName,vProductClassReport.UomSalesName,vProductClassReport.Warehouse,vProductClassReport.IncGLAcCode,vProductClassReport.IncGLAcName,vProductClassReport.AccountingMethodCode,vProductClassReport.TaxCategoryDescription FROM vProductClassReport
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoProductClothing]'))
    DROP VIEW [dbo].[vBoProductClothing]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoProductClothing] AS SELECT ProductMain.InventoryUomKey,ProductMain.ProductTypeKey,ProductMain.PurchaseUomKey,ProductMain.TaxCategoryKey,ProductMain.UomGroupKey,ProductMain.UPCCode,ProductMain.TaxScheduleKey,ProductMain.EffectiveDate,ProductMain.PayPriority,ProductMain.ProductSetTypeCode,ProductMain.DefaultWarehouseKey,ProductMain.DefaultSalesUomKey,ProductMain.HasPhysicalInventory,ProductMain.HasRoyalties,ProductMain.IsCommissionable,ProductMain.Name,ProductMain.ProductCode,ProductMain.ProductStatusCode,ProductMain.DeferralTermsKey,ProductMain.IncursHandlingChargeFlag,ProductMain.IncursRestockChargeFlag,ProductMain.NumPieces,ProductMain.Weight,ProductMain.ReplacementProductKey,ProductMain.CommissionCategoryKey,ProductMain.ProductClassKey,ProductMain.FairMarketValue,ProductMain.AccessKey,ProductMain.CreatedByUserKey,ProductMain.CreatedOn,ProductMain.ProductKey,ProductMain.SystemEntityKey,ProductMain.UpdatedByUserKey,ProductMain.UpdatedOn,ProductMain.AccountingMethodCode,ProductMain.StandardCost,ProductMain.UseFourDecimalsFlag,ProductMain.PaymentTermsKey,ProductMain.UseChildPricingFlag,ProductMain.IncursShippingChargeFlag,ProductMain.OwnerGroupKey,ProductClothing.Color,ProductClothing.Gender,ProductClothing.Size,ProductClothing.Type,ProductClothing.Manufacturer,ProductClothing.Style FROM ProductMain
	INNER JOIN ProductClothing
		ON ProductMain.ProductKey = ProductClothing.ProductKey
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoProductDescription]'))
    DROP VIEW [dbo].[vBoProductDescription]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoProductDescription] AS SELECT ProductDescription.ImageURL,ProductDescription.ProductKey,ProductDescription.Title,ProductDescription.CultureCode,ProductDescription.Description FROM ProductDescription
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vProductReport]'))
    DROP VIEW [dbo].[vProductReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE view [dbo].[vProductReport] as

/****************************************************************************************
** This view provides basic information about each product on "One Row per Product" basis.
** This view can be used as the basis for other detailed Product related views.
**
***************************************************************************************/


SELECT 

	PM.ProductCode, PM.Name as ProductName,PM.HasPhysicalInventory,PM.ProductStatusCode, 
	PSR.ProductStatusName, PM.ProductSetTypeCode, PSTR.ProductSetTypeDesc, PC.Name as ProductClassName, 
	PT.Name as ProductTypeName, PM.ProductKey, PM.ProductTypeKey, PM.ProductClassKey, 
	PM.InventoryUomKey, PM.SystemEntityKey

FROM

	ProductMain 	PM 
	INNER JOIN	ProductStatusRef 	PSR 	ON 	PM.ProductStatusCode = PSR.ProductStatusCode
	INNER JOIN	ProductSetTypeRef	 PSTR 	ON 	PM.ProductSetTypeCode = PSTR.ProductSetTypeCode
	INNER JOIN 	ProductType  		PT 	ON  	PM.ProductTypeKey = PT.ProductTypeKey 
	INNER JOIN 	ProductClass 		PC 	ON 	PM.ProductClassKey = PC.ProductClassKey

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vProductDetailReport]'))
    DROP VIEW [dbo].[vProductDetailReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vProductDetailReport]
AS
/****************************************************************************************
** This view provides detailed  information about each product on "One Row per Product" basis.
** This can be used as the basis to get other detailed related iinformation by joining relevant tables through the Key fields included in this view.
**
***************************************************************************************/

SELECT 

	PR.*, 
	PM.IsCommissionable, PM.Weight, PM.UPCCode, PM.EffectiveDate, PM.AccountingMethodCode, AMR.AccountMethodDesc,  PM.FairMarketValue,
	DW.Name as DefaultWarehouse , TS.Name as TaxScheduleName, TC.Description as TaxCategoryDescription, PS.QuantityOnHand as TotalQuantityOnHand, 
	DT.Description as DeferralTermsDesc, IU.Name as InventoryUomName, SU.Name as SalesUomName, PU.Name as PurchaseUomName, 
	SC.ParameterValue  as WeightUomName,	PM.DeferralTermsKey, PM.ReplacementProductKey

FROM
	vProductReport 		PR
	INNER JOIN 		ProductMain		PM   	ON  	PR.ProductKey = PM.ProductKey 
	LEFT OUTER JOIN 	ProductStatistics      	PS   	ON 	PM.ProductKey = PS.ProductKey
	LEFT OUTER JOIN 	TaxCategory           	TC     	ON  	PM.TaxCategoryKey = TC.TaxCategoryKey
	LEFT OUTER JOIN 	TaxSchedule           	TS     	ON 	PM.TaxScheduleKey = TS.TaxScheduleKey
	LEFT OUTER JOIN 	Warehouse 	       	DW   	ON  	PM.DefaultWarehouseKey = DW.WarehouseKey
	LEFT OUTER JOIN 	AccountingMethodRef	AMR	ON	PM.AccountingMethodCode = AMR.AccountingMethodCode
	LEFT OUTER JOIN 	DeferralTerms		DT	ON	PM.DeferralTermsKey = DT.DeferralTermsKey
	LEFT OUTER JOIN 	Uom 		        	IU     	ON  	PM.InventoryUomKey = IU.UomKey
	LEFT OUTER JOIN 	Uom 		        	SU    	ON  	PM.DefaultSalesUomKey = SU.UomKey
	LEFT OUTER JOIN 	Uom 		        	PU    	ON  	PM.PurchaseUomKey = PU.UomKey
	LEFT OUTER JOIN 	SystemConfig	        	SC    	ON  	SC.ParameterName='AddOn.Shipping.WeightPrompt'

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoProductDetailReport]'))
    DROP VIEW [dbo].[vBoProductDetailReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoProductDetailReport] AS SELECT vProductDetailReport.AccountingMethodCode,vProductDetailReport.AccountMethodDesc,vProductDetailReport.DefaultWarehouse,vProductDetailReport.DeferralTermsDesc,vProductDetailReport.DeferralTermsKey,vProductDetailReport.EffectiveDate,vProductDetailReport.FairMarketValue,vProductDetailReport.HasPhysicalInventory,vProductDetailReport.InventoryUomKey,vProductDetailReport.InventoryUomName,vProductDetailReport.IsCommissionable,vProductDetailReport.ProductClassKey,vProductDetailReport.ProductClassName,vProductDetailReport.ProductCode,vProductDetailReport.ProductKey,vProductDetailReport.ProductName,vProductDetailReport.ProductSetTypeCode,vProductDetailReport.ProductSetTypeDesc,vProductDetailReport.ProductStatusCode,vProductDetailReport.ProductStatusName,vProductDetailReport.ProductTypeKey,vProductDetailReport.ProductTypeName,vProductDetailReport.PurchaseUomName,vProductDetailReport.ReplacementProductKey,vProductDetailReport.SalesUomName,vProductDetailReport.SystemEntityKey,vProductDetailReport.TaxCategoryDescription,vProductDetailReport.TaxScheduleName,vProductDetailReport.TotalQuantityOnHand,vProductDetailReport.UPCCode,vProductDetailReport.Weight,vProductDetailReport.WeightUomName FROM vProductDetailReport
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoProductEvent]'))
    DROP VIEW [dbo].[vBoProductEvent]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoProductEvent] AS SELECT ProductMain.InventoryUomKey,ProductMain.ProductTypeKey,ProductMain.PurchaseUomKey,ProductMain.TaxCategoryKey,ProductMain.UomGroupKey,ProductMain.UPCCode,ProductMain.TaxScheduleKey,ProductMain.EffectiveDate,ProductMain.PayPriority,ProductMain.ProductSetTypeCode,ProductMain.DefaultWarehouseKey,ProductMain.DefaultSalesUomKey,ProductMain.HasPhysicalInventory,ProductMain.HasRoyalties,ProductMain.IsCommissionable,ProductMain.Name,ProductMain.ProductCode,ProductMain.ProductStatusCode,ProductMain.DeferralTermsKey,ProductMain.IncursHandlingChargeFlag,ProductMain.IncursRestockChargeFlag,ProductMain.NumPieces,ProductMain.Weight,ProductMain.ReplacementProductKey,ProductMain.CommissionCategoryKey,ProductMain.ProductClassKey,ProductMain.FairMarketValue,ProductMain.AccessKey,ProductMain.CreatedByUserKey,ProductMain.CreatedOn,ProductMain.ProductKey,ProductMain.SystemEntityKey,ProductMain.UpdatedByUserKey,ProductMain.UpdatedOn,ProductMain.AccountingMethodCode,ProductMain.StandardCost,ProductMain.UseFourDecimalsFlag,ProductMain.PaymentTermsKey,ProductMain.UseChildPricingFlag,ProductMain.IncursShippingChargeFlag,ProductMain.OwnerGroupKey FROM ProductMain
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoProductFreight]'))
    DROP VIEW [dbo].[vBoProductFreight]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoProductFreight] AS SELECT ProductMain.InventoryUomKey,ProductMain.ProductTypeKey,ProductMain.PurchaseUomKey,ProductMain.TaxCategoryKey,ProductMain.UomGroupKey,ProductMain.UPCCode,ProductMain.TaxScheduleKey,ProductMain.EffectiveDate,ProductMain.PayPriority,ProductMain.ProductSetTypeCode,ProductMain.DefaultWarehouseKey,ProductMain.DefaultSalesUomKey,ProductMain.HasPhysicalInventory,ProductMain.HasRoyalties,ProductMain.IsCommissionable,ProductMain.Name,ProductMain.ProductCode,ProductMain.ProductStatusCode,ProductMain.DeferralTermsKey,ProductMain.IncursHandlingChargeFlag,ProductMain.IncursRestockChargeFlag,ProductMain.NumPieces,ProductMain.Weight,ProductMain.ReplacementProductKey,ProductMain.CommissionCategoryKey,ProductMain.ProductClassKey,ProductMain.FairMarketValue,ProductMain.AccessKey,ProductMain.CreatedByUserKey,ProductMain.CreatedOn,ProductMain.ProductKey,ProductMain.SystemEntityKey,ProductMain.UpdatedByUserKey,ProductMain.UpdatedOn,ProductMain.AccountingMethodCode,ProductMain.StandardCost,ProductMain.UseFourDecimalsFlag,ProductMain.PaymentTermsKey,ProductMain.UseChildPricingFlag,ProductMain.IncursShippingChargeFlag,ProductMain.OwnerGroupKey FROM ProductMain
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoProductFundraising]'))
    DROP VIEW [dbo].[vBoProductFundraising]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoProductFundraising] AS SELECT ProductMain.InventoryUomKey,ProductMain.ProductTypeKey,ProductMain.PurchaseUomKey,ProductMain.TaxCategoryKey,ProductMain.UomGroupKey,ProductMain.UPCCode,ProductMain.TaxScheduleKey,ProductMain.EffectiveDate,ProductMain.PayPriority,ProductMain.ProductSetTypeCode,ProductMain.DefaultWarehouseKey,ProductMain.DefaultSalesUomKey,ProductMain.HasPhysicalInventory,ProductMain.HasRoyalties,ProductMain.IsCommissionable,ProductMain.Name,ProductMain.ProductCode,ProductMain.ProductStatusCode,ProductMain.DeferralTermsKey,ProductMain.IncursHandlingChargeFlag,ProductMain.IncursRestockChargeFlag,ProductMain.NumPieces,ProductMain.Weight,ProductMain.ReplacementProductKey,ProductMain.CommissionCategoryKey,ProductMain.ProductClassKey,ProductMain.FairMarketValue,ProductMain.AccessKey,ProductMain.CreatedByUserKey,ProductMain.CreatedOn,ProductMain.ProductKey,ProductMain.SystemEntityKey,ProductMain.UpdatedByUserKey,ProductMain.UpdatedOn,ProductMain.AccountingMethodCode,ProductMain.StandardCost,ProductMain.UseFourDecimalsFlag,ProductMain.PaymentTermsKey,ProductMain.UseChildPricingFlag,ProductMain.IncursShippingChargeFlag,ProductMain.OwnerGroupKey,ProductFundraising.MaximumAmount,ProductFundraising.MinimumAmount,ProductFundraising.SuggestedAmount,ProductFundraising.FundKey FROM ProductMain
	INNER JOIN ProductFundraising
		ON ProductMain.ProductKey = ProductFundraising.ProductKey
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoProductGLAccount]'))
    DROP VIEW [dbo].[vBoProductGLAccount]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoProductGLAccount] AS SELECT ProductGLAccount.GLAccountKey,ProductGLAccount.GLAccountPurposeCode,ProductGLAccount.ParentKey,ProductGLAccount.ProductGLAccountKey FROM ProductGLAccount
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoProductHandling]'))
    DROP VIEW [dbo].[vBoProductHandling]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoProductHandling] AS SELECT ProductMain.InventoryUomKey,ProductMain.ProductTypeKey,ProductMain.PurchaseUomKey,ProductMain.TaxCategoryKey,ProductMain.UomGroupKey,ProductMain.UPCCode,ProductMain.TaxScheduleKey,ProductMain.EffectiveDate,ProductMain.PayPriority,ProductMain.ProductSetTypeCode,ProductMain.DefaultWarehouseKey,ProductMain.DefaultSalesUomKey,ProductMain.HasPhysicalInventory,ProductMain.HasRoyalties,ProductMain.IsCommissionable,ProductMain.Name,ProductMain.ProductCode,ProductMain.ProductStatusCode,ProductMain.DeferralTermsKey,ProductMain.IncursHandlingChargeFlag,ProductMain.IncursRestockChargeFlag,ProductMain.NumPieces,ProductMain.Weight,ProductMain.ReplacementProductKey,ProductMain.CommissionCategoryKey,ProductMain.ProductClassKey,ProductMain.FairMarketValue,ProductMain.AccessKey,ProductMain.CreatedByUserKey,ProductMain.CreatedOn,ProductMain.ProductKey,ProductMain.SystemEntityKey,ProductMain.UpdatedByUserKey,ProductMain.UpdatedOn,ProductMain.AccountingMethodCode,ProductMain.StandardCost,ProductMain.UseFourDecimalsFlag,ProductMain.PaymentTermsKey,ProductMain.UseChildPricingFlag,ProductMain.IncursShippingChargeFlag,ProductMain.OwnerGroupKey FROM ProductMain
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoProductInventory]'))
    DROP VIEW [dbo].[vBoProductInventory]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoProductInventory] AS SELECT ProductInventory.LocationKey,ProductInventory.ProductKey,ProductInventory.QuantityOnHand,ProductInventory.UomKey,ProductInventory.LotId,ProductInventory.CreatedByUserKey,ProductInventory.CreatedOn,ProductInventory.ProductInventoryKey,ProductInventory.UpdatedByUserKey,ProductInventory.UpdatedOn FROM ProductInventory
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vProductInventoryReport]'))
    DROP VIEW [dbo].[vProductInventoryReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vProductInventoryReport]
AS
/****************************************************************************************
** This view provides basic information about each inventory product on "One Row per Product Inventory" basis.
** This can be linked with other Product related tables or business objects to get more detailed information.
**
***************************************************************************************/

SELECT     PM.Name AS ProductName, PIN.LotId, PIN.QuantityOnHand, IL.Name AS Location, IL.BinNumber, W.Name AS Warehouse, W.WarehouseStatusCode, 
                  WSR.WarehouseStatusDesc, U.Name AS Uom, PIN.ProductKey, PIN.ProductInventoryKey, PIN.UomKey, W.WarehouseKey, IL.LocationKey
FROM         
	ProductInventory PIN 
	INNER JOIN ProductMain PM ON PIN.ProductKey = PM.ProductKey 
	INNER JOIN InventoryLocation IL ON PIN.LocationKey = IL.LocationKey 
	INNER JOIN Warehouse W ON IL.WarehouseKey = W.WarehouseKey 
	INNER JOIN WarehouseStatusRef WSR ON W.WarehouseStatusCode = WSR.WarehouseStatusCode
	INNER JOIN Uom U ON PIN.UomKey = U.UomKey

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoProductInventoryReport]'))
    DROP VIEW [dbo].[vBoProductInventoryReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoProductInventoryReport] AS SELECT vProductInventoryReport.BinNumber,vProductInventoryReport.Location,vProductInventoryReport.LocationKey,vProductInventoryReport.LotId,vProductInventoryReport.ProductInventoryKey,vProductInventoryReport.ProductKey,vProductInventoryReport.ProductName,vProductInventoryReport.QuantityOnHand,vProductInventoryReport.UomKey,vProductInventoryReport.Warehouse,vProductInventoryReport.WarehouseKey,vProductInventoryReport.WarehouseStatusCode,vProductInventoryReport.WarehouseStatusDesc,vProductInventoryReport.Uom FROM vProductInventoryReport
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoProductMaster]'))
    DROP VIEW [dbo].[vBoProductMaster]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoProductMaster] AS SELECT ProductMaster.AttributeList,ProductMaster.ProductKey FROM ProductMaster
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoProductMembership]'))
    DROP VIEW [dbo].[vBoProductMembership]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoProductMembership] AS SELECT ProductMain.InventoryUomKey,ProductMain.ProductTypeKey,ProductMain.PurchaseUomKey,ProductMain.TaxCategoryKey,ProductMain.UomGroupKey,ProductMain.UPCCode,ProductMain.TaxScheduleKey,ProductMain.EffectiveDate,ProductMain.PayPriority,ProductMain.ProductSetTypeCode,ProductMain.DefaultWarehouseKey,ProductMain.DefaultSalesUomKey,ProductMain.HasPhysicalInventory,ProductMain.HasRoyalties,ProductMain.IsCommissionable,ProductMain.Name,ProductMain.ProductCode,ProductMain.ProductStatusCode,ProductMain.DeferralTermsKey,ProductMain.IncursHandlingChargeFlag,ProductMain.IncursRestockChargeFlag,ProductMain.NumPieces,ProductMain.Weight,ProductMain.ReplacementProductKey,ProductMain.CommissionCategoryKey,ProductMain.ProductClassKey,ProductMain.FairMarketValue,ProductMain.AccessKey,ProductMain.CreatedByUserKey,ProductMain.CreatedOn,ProductMain.ProductKey,ProductMain.SystemEntityKey,ProductMain.UpdatedByUserKey,ProductMain.UpdatedOn,ProductMain.AccountingMethodCode,ProductMain.StandardCost,ProductMain.UseFourDecimalsFlag,ProductMain.PaymentTermsKey,ProductMain.UseChildPricingFlag,ProductMain.IncursShippingChargeFlag,ProductMain.OwnerGroupKey,ProductMembership.MembershipProcessingComponentKey,ProductMembership.MinimumAmount,ProductMembership.SuggestedPaymentTermsKey,ProductMembership.SuggestedProductKey,ProductMembership.TargetUniformKey FROM ProductMain
	INNER JOIN ProductMembership
		ON ProductMain.ProductKey = ProductMembership.ProductKey
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoProductReport]'))
    DROP VIEW [dbo].[vBoProductReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoProductReport] AS SELECT vProductReport.HasPhysicalInventory,vProductReport.InventoryUomKey,vProductReport.ProductClassKey,vProductReport.ProductClassName,vProductReport.ProductCode,vProductReport.ProductKey,vProductReport.ProductName,vProductReport.ProductSetTypeCode,vProductReport.ProductSetTypeDesc,vProductReport.ProductStatusCode,vProductReport.ProductStatusName,vProductReport.ProductTypeKey,vProductReport.ProductTypeName,vProductReport.SystemEntityKey FROM vProductReport
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoProductRestock]'))
    DROP VIEW [dbo].[vBoProductRestock]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoProductRestock] AS SELECT ProductMain.InventoryUomKey,ProductMain.ProductTypeKey,ProductMain.PurchaseUomKey,ProductMain.TaxCategoryKey,ProductMain.UomGroupKey,ProductMain.UPCCode,ProductMain.TaxScheduleKey,ProductMain.EffectiveDate,ProductMain.PayPriority,ProductMain.ProductSetTypeCode,ProductMain.DefaultWarehouseKey,ProductMain.DefaultSalesUomKey,ProductMain.HasPhysicalInventory,ProductMain.HasRoyalties,ProductMain.IsCommissionable,ProductMain.Name,ProductMain.ProductCode,ProductMain.ProductStatusCode,ProductMain.DeferralTermsKey,ProductMain.IncursHandlingChargeFlag,ProductMain.IncursRestockChargeFlag,ProductMain.NumPieces,ProductMain.Weight,ProductMain.ReplacementProductKey,ProductMain.CommissionCategoryKey,ProductMain.ProductClassKey,ProductMain.FairMarketValue,ProductMain.AccessKey,ProductMain.CreatedByUserKey,ProductMain.CreatedOn,ProductMain.ProductKey,ProductMain.SystemEntityKey,ProductMain.UpdatedByUserKey,ProductMain.UpdatedOn,ProductMain.AccountingMethodCode,ProductMain.StandardCost,ProductMain.UseFourDecimalsFlag,ProductMain.PaymentTermsKey,ProductMain.UseChildPricingFlag,ProductMain.IncursShippingChargeFlag,ProductMain.OwnerGroupKey FROM ProductMain
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoProductSetItem]'))
    DROP VIEW [dbo].[vBoProductSetItem]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoProductSetItem] AS SELECT ProductSetItem.ParentProductKey,ProductSetItem.ChildUomKey,ProductSetItem.MaxQuantity,ProductSetItem.Quantity,ProductSetItem.ChildProductKey,ProductSetItem.ProductSetItemKey FROM ProductSetItem
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoProductSetTypeRef]'))
    DROP VIEW [dbo].[vBoProductSetTypeRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoProductSetTypeRef] AS SELECT ProductSetTypeRef.ProductSetTypeDesc,ProductSetTypeRef.ProductSetTypeCode,ProductSetTypeRef.HasChildOrderLinesFlag,ProductSetTypeRef.UserSelectionRequiredFlag FROM ProductSetTypeRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoProductSoftware]'))
    DROP VIEW [dbo].[vBoProductSoftware]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoProductSoftware] AS SELECT ProductMain.InventoryUomKey,ProductMain.ProductTypeKey,ProductMain.PurchaseUomKey,ProductMain.TaxCategoryKey,ProductMain.UomGroupKey,ProductMain.UPCCode,ProductMain.TaxScheduleKey,ProductMain.EffectiveDate,ProductMain.PayPriority,ProductMain.ProductSetTypeCode,ProductMain.DefaultWarehouseKey,ProductMain.DefaultSalesUomKey,ProductMain.HasPhysicalInventory,ProductMain.HasRoyalties,ProductMain.IsCommissionable,ProductMain.Name,ProductMain.ProductCode,ProductMain.ProductStatusCode,ProductMain.DeferralTermsKey,ProductMain.IncursHandlingChargeFlag,ProductMain.IncursRestockChargeFlag,ProductMain.NumPieces,ProductMain.Weight,ProductMain.ReplacementProductKey,ProductMain.CommissionCategoryKey,ProductMain.ProductClassKey,ProductMain.FairMarketValue,ProductMain.AccessKey,ProductMain.CreatedByUserKey,ProductMain.CreatedOn,ProductMain.ProductKey,ProductMain.SystemEntityKey,ProductMain.UpdatedByUserKey,ProductMain.UpdatedOn,ProductMain.AccountingMethodCode,ProductMain.StandardCost,ProductMain.UseFourDecimalsFlag,ProductMain.PaymentTermsKey,ProductMain.UseChildPricingFlag,ProductMain.IncursShippingChargeFlag,ProductMain.OwnerGroupKey FROM ProductMain
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoProductStatistics]'))
    DROP VIEW [dbo].[vBoProductStatistics]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoProductStatistics] AS SELECT ProductStatistics.ProductKey,ProductStatistics.QuantityAvailable,ProductStatistics.QuantityBackordered,ProductStatistics.QuantityCommitted,ProductStatistics.QuantityOnHand,ProductStatistics.QuantityReserved FROM ProductStatistics
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoProductStatusRef]'))
    DROP VIEW [dbo].[vBoProductStatusRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoProductStatusRef] AS SELECT ProductStatusRef.ProductStatusCode,ProductStatusRef.ProductStatusDesc,ProductStatusRef.ProductStatusName FROM ProductStatusRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoProductTax]'))
    DROP VIEW [dbo].[vBoProductTax]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoProductTax] AS SELECT ProductMain.InventoryUomKey,ProductMain.ProductTypeKey,ProductMain.PurchaseUomKey,ProductMain.TaxCategoryKey,ProductMain.UomGroupKey,ProductMain.UPCCode,ProductMain.TaxScheduleKey,ProductMain.EffectiveDate,ProductMain.PayPriority,ProductMain.ProductSetTypeCode,ProductMain.DefaultWarehouseKey,ProductMain.DefaultSalesUomKey,ProductMain.HasPhysicalInventory,ProductMain.HasRoyalties,ProductMain.IsCommissionable,ProductMain.Name,ProductMain.ProductCode,ProductMain.ProductStatusCode,ProductMain.DeferralTermsKey,ProductMain.IncursHandlingChargeFlag,ProductMain.IncursRestockChargeFlag,ProductMain.NumPieces,ProductMain.Weight,ProductMain.ReplacementProductKey,ProductMain.CommissionCategoryKey,ProductMain.ProductClassKey,ProductMain.FairMarketValue,ProductMain.AccessKey,ProductMain.CreatedByUserKey,ProductMain.CreatedOn,ProductMain.ProductKey,ProductMain.SystemEntityKey,ProductMain.UpdatedByUserKey,ProductMain.UpdatedOn,ProductMain.AccountingMethodCode,ProductMain.StandardCost,ProductMain.UseFourDecimalsFlag,ProductMain.PaymentTermsKey,ProductMain.UseChildPricingFlag,ProductMain.IncursShippingChargeFlag,ProductMain.OwnerGroupKey,ProductTax.TaxAuthorityKey AS TaxAuthorityKey1,ProductTax.TaxCategoryKey AS TaxCategoryKey1 FROM ProductMain
	INNER JOIN ProductTax
		ON ProductMain.ProductKey = ProductTax.ProductKey
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoProductTest]'))
    DROP VIEW [dbo].[vBoProductTest]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoProductTest] AS SELECT ProductMain.InventoryUomKey,ProductMain.ProductTypeKey,ProductMain.PurchaseUomKey,ProductMain.TaxCategoryKey,ProductMain.UomGroupKey,ProductMain.UPCCode,ProductMain.TaxScheduleKey,ProductMain.EffectiveDate,ProductMain.PayPriority,ProductMain.ProductSetTypeCode,ProductMain.DefaultWarehouseKey,ProductMain.DefaultSalesUomKey,ProductMain.HasPhysicalInventory,ProductMain.HasRoyalties,ProductMain.IsCommissionable,ProductMain.Name,ProductMain.ProductCode,ProductMain.ProductStatusCode,ProductMain.DeferralTermsKey,ProductMain.IncursHandlingChargeFlag,ProductMain.IncursRestockChargeFlag,ProductMain.NumPieces,ProductMain.Weight,ProductMain.ReplacementProductKey,ProductMain.CommissionCategoryKey,ProductMain.ProductClassKey,ProductMain.FairMarketValue,ProductMain.AccessKey,ProductMain.CreatedByUserKey,ProductMain.CreatedOn,ProductMain.ProductKey,ProductMain.SystemEntityKey,ProductMain.UpdatedByUserKey,ProductMain.UpdatedOn,ProductMain.AccountingMethodCode,ProductMain.StandardCost,ProductMain.UseFourDecimalsFlag,ProductMain.PaymentTermsKey,ProductMain.UseChildPricingFlag,ProductMain.IncursShippingChargeFlag,ProductMain.OwnerGroupKey,ProductTest.TestData FROM ProductMain
	INNER JOIN ProductTest
		ON ProductMain.ProductKey = ProductTest.ProductKey
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoProductType]'))
    DROP VIEW [dbo].[vBoProductType]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoProductType] AS SELECT ProductType.BusinessObjectName,ProductType.Name,ProductType.FulfillmentComponentKey,ProductType.PricingComponentKey,ProductType.GeneratesSalesHistoryFlag,ProductType.DetailGUIContentCode,ProductType.EditGUIContentCode,ProductType.SummaryGUIContentCode,ProductType.CreatedByUserKey,ProductType.CreatedOn,ProductType.ProductTypeKey,ProductType.UpdatedByUserKey,ProductType.UpdatedOn FROM ProductType
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoProductWarehouse]'))
    DROP VIEW [dbo].[vBoProductWarehouse]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoProductWarehouse] AS SELECT ProductWarehouse.ProductKey,ProductWarehouse.QuantityCommitted,ProductWarehouse.WarehouseKey,ProductWarehouse.ReorderQty,ProductWarehouse.UnitRestockingFee,ProductWarehouse.QtyOnOrder,ProductWarehouse.ProductWarehouseStatusCode,ProductWarehouse.ReorderPoint,ProductWarehouse.DateExpected,ProductWarehouse.CreatedByUserKey,ProductWarehouse.CreatedOn,ProductWarehouse.ProductWarehouseKey,ProductWarehouse.UpdatedByUserKey,ProductWarehouse.UpdatedOn FROM ProductWarehouse
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vProductWarehouseReport]'))
    DROP VIEW [dbo].[vProductWarehouseReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vProductWarehouseReport]
AS
SELECT    
	 W.Name AS Warehouse, PW.ReorderQty, PW.UnitRestockingFee, PW.ProductWarehouseStatusCode, WSR.WarehouseStatusDesc, 
	PW.QuantityCommitted, PW.QtyOnOrder, PW.ReorderPoint, IL.Name AS Location, IL.BinNumber, PIN.QuantityOnHand, PW.DateExpected, PW.ProductWarehouseKey, 
              PW.ProductKey, W.WarehouseKey, IL.LocationKey
FROM   
	ProductWarehouse PW 
	INNER JOIN	Warehouse 		W	ON 	PW.WarehouseKey = W.WarehouseKey 
	INNER JOIN	WarehouseStatusRef 	WSR 	ON 	W.WarehouseStatusCode = WSR.WarehouseStatusCode 
	INNER JOIN	ProductInventory 	PIN 	ON 	PW.ProductKey = PIN.ProductKey 
	INNER JOIN	InventoryLocation 	IL 	ON 	PIN.LocationKey = IL.LocationKey

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoProductWarehouseReport]'))
    DROP VIEW [dbo].[vBoProductWarehouseReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoProductWarehouseReport] AS SELECT vProductWarehouseReport.BinNumber,vProductWarehouseReport.Location,vProductWarehouseReport.LocationKey,vProductWarehouseReport.ProductWarehouseKey,vProductWarehouseReport.ProductWarehouseStatusCode,vProductWarehouseReport.QtyOnOrder,vProductWarehouseReport.QuantityCommitted,vProductWarehouseReport.QuantityOnHand,vProductWarehouseReport.ReorderPoint,vProductWarehouseReport.ReorderQty,vProductWarehouseReport.UnitRestockingFee,vProductWarehouseReport.Warehouse,vProductWarehouseReport.WarehouseKey,vProductWarehouseReport.WarehouseStatusDesc,vProductWarehouseReport.ProductKey,vProductWarehouseReport.DateExpected FROM vProductWarehouseReport
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoProgram]'))
    DROP VIEW [dbo].[vBoProgram]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoProgram] AS SELECT Program.MinimumValue AS Minimum,Program.ProgramKey,Program.ProgramName AS Name,Program.MaximumValue AS Maximum,Program.UserDefinedExperiencesFlag AS UserDefinedExperiences,Program.UomKey,Program.ProgramStatusCode,Program.CreatedByUserKey,Program.CreatedOn,Program.UpdatedByUserKey,Program.UpdatedOn,Program.RequiresApprovalFlag AS RequiresApproval,Program.ProgramDescr AS Description,Program.MarkedForDeleteOn FROM Program
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoProgramGroup]'))
    DROP VIEW [dbo].[vBoProgramGroup]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoProgramGroup] AS SELECT ProgramGroup.CreatedByUserKey,ProgramGroup.CreatedOn,ProgramGroup.ProgramGroupDescription,ProgramGroup.ProgramGroupKey,ProgramGroup.ProgramGroupName,ProgramGroup.ProgramGroupStatusCode,ProgramGroup.UpdatedByUserKey,ProgramGroup.UpdatedOn,ProgramGroup.MarkedForDeleteOn FROM ProgramGroup
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoProgramGroupStatus]'))
    DROP VIEW [dbo].[vBoProgramGroupStatus]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoProgramGroupStatus] AS SELECT ProgramGroupStatusRef.ProgramGroupStatusCode,ProgramGroupStatusRef.ProgramGroupStatusName FROM ProgramGroupStatusRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoProgramStatus]'))
    DROP VIEW [dbo].[vBoProgramStatus]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoProgramStatus] AS SELECT ProgramStatusRef.ProgramStatusCode AS Code,ProgramStatusRef.ProgramStatusName AS Name FROM ProgramStatusRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoPromotionDiscount]'))
    DROP VIEW [dbo].[vBoPromotionDiscount]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoPromotionDiscount] AS SELECT PromotionDiscount.DiscountRuleKey,PromotionDiscount.PromotionDiscountKey,PromotionDiscount.PromotionRuleKey,PromotionDiscount.UpdatedByUserKey,PromotionDiscount.UpdatedOn FROM PromotionDiscount
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vPromotionReport]'))
    DROP VIEW [dbo].[vPromotionReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vPromotionReport]
AS
SELECT     RM.RuleKey AS PromoRuleKey, DRM.RuleKey AS DiscRuleKey, RM.Name AS PromoName, RM.Description AS PromoDesc, 
                      RM.IsActive AS PromoIsActive, RM.Priority AS PromoPriority, RM.BeginDate AS PromoBegin, RM.EndDate AS PromoEnd, 
                      RM.RuleEvaluatorComponentKey AS PromoRuleEvalKey, RM.ObjectMapperComponentKey AS PromoMapperKey, PR.PromotionRuleCode, 
                      PR.IsExplicit, PR.IsExclusive, PR.Code, PR.ContactKey, PRC.Name AS PromoCritName, PRC.ObjectName AS PromoCritObjectName, DR.IsPremium, 
                      DR.IsOrderDiscount, DR.PromoProductKey, DRM.Name AS DiscName, DRM.Description AS DiscDesc, DRM.IsActive AS DiscIsActive, 
                      DRM.BeginDate AS DiscBegin, DRM.EndDate AS DiscEnd, DR.PromoProductQuantity, DR.PriceBasisCode, DR.Adjustment, DR.IsPercent, 
                      DRC.Name AS DiscCritName, DRC.ObjectName AS DiscCritObjectName, PRR.PromotionRuleDesc, PBR.PriceBasisDesc, PM.Name AS Product
FROM         dbo.RuleMain RM INNER JOIN
                      dbo.PromotionRule PR ON RM.RuleKey = PR.RuleKey INNER JOIN
                      dbo.PromotionDiscount PD ON PD.PromotionRuleKey = PR.RuleKey INNER JOIN
                      dbo.DiscountRule DR ON DR.RuleKey = PD.DiscountRuleKey INNER JOIN
                      dbo.RuleMain DRM ON DR.RuleKey = DRM.RuleKey LEFT OUTER JOIN
                      dbo.RuleCriterion PRC ON PRC.RuleKey = PR.RuleKey LEFT OUTER JOIN
                      dbo.RuleCriterion DRC ON DRC.RuleKey = DR.RuleKey INNER JOIN
                      dbo.PromotionRuleRef PRR ON PR.PromotionRuleCode = PRR.PromotionRuleCode INNER JOIN
                      dbo.PriceBasisRef PBR ON DR.PriceBasisCode = PBR.PriceBasisCode LEFT OUTER JOIN
                      dbo.ProductMain PM ON DR.PromoProductKey = PM.ProductKey

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoPromotionReport]'))
    DROP VIEW [dbo].[vBoPromotionReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoPromotionReport] AS SELECT vPromotionReport.Adjustment,vPromotionReport.Code,vPromotionReport.ContactKey,vPromotionReport.DiscBegin,vPromotionReport.DiscCritName,vPromotionReport.DiscCritObjectName,vPromotionReport.DiscDesc,vPromotionReport.DiscEnd,vPromotionReport.DiscIsActive,vPromotionReport.DiscName,vPromotionReport.DiscRuleKey,vPromotionReport.IsExclusive,vPromotionReport.IsExplicit,vPromotionReport.IsOrderDiscount,vPromotionReport.IsPercent,vPromotionReport.IsPremium,vPromotionReport.PriceBasisCode,vPromotionReport.PriceBasisDesc,vPromotionReport.Product,vPromotionReport.PromoBegin,vPromotionReport.PromoCritName,vPromotionReport.PromoCritObjectName,vPromotionReport.PromoDesc,vPromotionReport.PromoEnd,vPromotionReport.PromoIsActive,vPromotionReport.PromoMapperKey,vPromotionReport.PromoName,vPromotionReport.PromoPriority,vPromotionReport.PromoProductKey,vPromotionReport.PromoProductQuantity,vPromotionReport.PromoRuleEvalKey,vPromotionReport.PromoRuleKey,vPromotionReport.PromotionRuleCode,vPromotionReport.PromotionRuleDesc FROM vPromotionReport
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoPromotionRule]'))
    DROP VIEW [dbo].[vBoPromotionRule]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoPromotionRule] AS SELECT RuleMain.Description,RuleMain.Name,RuleMain.UpdatedByUserKey,RuleMain.UpdatedOn,RuleMain.BeginDate,RuleMain.EndDate,RuleMain.IsActive,RuleMain.ObjectMapperComponentKey,RuleMain.RuleEvaluatorComponentKey,RuleMain.Priority,RuleMain.CreatedByUserKey,RuleMain.CreatedOn,RuleMain.RuleKey,RuleMain.SystemEntityKey,PromotionRule.Code,PromotionRule.ContactKey,PromotionRule.PromotionRuleCode,PromotionRule.IsExclusive,PromotionRule.IsExplicit,PromotionRule.PromotionRuleUsageCode,PromotionRule.IsFundraisingPremium FROM RuleMain
	INNER JOIN PromotionRule
		ON RuleMain.RuleKey = PromotionRule.RuleKey
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoPromotionRuleRef]'))
    DROP VIEW [dbo].[vBoPromotionRuleRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoPromotionRuleRef] AS SELECT PromotionRuleRef.PromotionRuleCode,PromotionRuleRef.PromotionRuleDesc,PromotionRuleRef.PromotionRuleName FROM PromotionRuleRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoPropertyDefinition]'))
    DROP VIEW [dbo].[vBoPropertyDefinition]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoPropertyDefinition] AS SELECT PropertyDefinition.AllowMultiSelectFlag,PropertyDefinition.DataTypeCode,PropertyDefinition.DisplayMask,PropertyDefinition.HIControlHeight,PropertyDefinition.HIControlRepeatColumns,PropertyDefinition.HIControlRepeatDirection,PropertyDefinition.HIControlTypeCode,PropertyDefinition.HIControlWidth,PropertyDefinition.IsRequired,PropertyDefinition.Label,PropertyDefinition.MaxLength,PropertyDefinition.PropertyDefinitionKey,PropertyDefinition.Scale,PropertyDefinition.ValueList,PropertyDefinition.ValueListQueryDisplayColumn,PropertyDefinition.ValueListQueryDocumentVersionKey,PropertyDefinition.ValueListQueryFolder,PropertyDefinition.ValueListQueryPersistColumn,PropertyDefinition.ForeignObjectDocumentVersionKey,PropertyDefinition.DefaultValue,PropertyDefinition.UseFinder FROM PropertyDefinition
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoProspect]'))
    DROP VIEW [dbo].[vBoProspect]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoProspect] AS SELECT Prospect.Address1,Prospect.Address2,Prospect.Address3,Prospect.City,Prospect.Country,Prospect.Email,Prospect.FirstName,Prospect.FullName,Prospect.HomePhone,Prospect.LastName,Prospect.MiddleName,Prospect.Organization,Prospect.PostalCode,Prospect.Prefix,Prospect.ProspectKey,Prospect.StateProvince,Prospect.Suffix,Prospect.Title,Prospect.WorkPhone,Prospect.Fax,Prospect.ProspectID,Prospect.ImisID,Prospect.LastFirst,Prospect.ImportDate,Prospect.ListCode,Prospect.CompanySort FROM Prospect
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoPublishMessageLog]'))
    DROP VIEW [dbo].[vBoPublishMessageLog]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoPublishMessageLog] AS SELECT PublishMessageLog.DisplayFlag,PublishMessageLog.Location,PublishMessageLog.MessageDateTime,PublishMessageLog.MessageNumber,PublishMessageLog.MessageText,PublishMessageLog.PublishMessageLogKey,PublishMessageLog.PublishRequestDetailKey,PublishMessageLog.PublishRequestKey,PublishMessageLog.PublishServerCode FROM PublishMessageLog
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoPublishPriority]'))
    DROP VIEW [dbo].[vBoPublishPriority]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoPublishPriority] AS SELECT PublishPriorityRef.PublishPriorityCode AS Code,PublishPriorityRef.PublishPriorityDesc AS Description FROM PublishPriorityRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoPublishRequest]'))
    DROP VIEW [dbo].[vBoPublishRequest]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoPublishRequest] AS SELECT PublishRequest.DocumentKey,PublishRequest.PublishPriorityCode,PublishRequest.PublishRequestKey,PublishRequest.RequestDateTime,PublishRequest.UserKey,PublishRequest.PublishedDateTime FROM PublishRequest
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoPublishRequestDetail]'))
    DROP VIEW [dbo].[vBoPublishRequestDetail]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoPublishRequestDetail] AS SELECT PublishRequestDetail.Frequency,PublishRequestDetail.IsDelete,PublishRequestDetail.IsRegenerate,PublishRequestDetail.PublishedDateTime,PublishRequestDetail.PublishRequestDetailKey,PublishRequestDetail.PublishRequestKey,PublishRequestDetail.PublishRequestStatusCode,PublishRequestDetail.PublishServerCode,PublishRequestDetail.ContentDocumentKey,PublishRequestDetail.NumOfAttempts FROM PublishRequestDetail
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoPublishRequestStatus]'))
    DROP VIEW [dbo].[vBoPublishRequestStatus]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoPublishRequestStatus] AS SELECT PublishRequestStatusRef.PublishRequestStatusCode,PublishRequestStatusRef.PublishRequestStatusDesc,PublishRequestStatusRef.PublishRequestStatusName FROM PublishRequestStatusRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoPublishServer]'))
    DROP VIEW [dbo].[vBoPublishServer]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoPublishServer] AS SELECT PublishServerRef.AlternateServerIPAddress,PublishServerRef.Frequency,PublishServerRef.IISSecurityDomain,PublishServerRef.IISSecurityPassword,PublishServerRef.IISSecurityUserName,PublishServerRef.IsDefault,PublishServerRef.PublishingSpeed,PublishServerRef.PublishServerCode AS Code,PublishServerRef.PublishServerDesc AS Description,PublishServerRef.ServerIPAddress,PublishServerRef.UseServiceRequest,PublishServerRef.LocalProtectedPath,PublishServerRef.LocalPublishPath,PublishServerRef.CreatedByUserKey,PublishServerRef.CreatedOn,PublishServerRef.UpdatedByUserKey,PublishServerRef.UpdatedOn FROM PublishServerRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoPurchaseOrderPaymentDetail]'))
    DROP VIEW [dbo].[vBoPurchaseOrderPaymentDetail]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoPurchaseOrderPaymentDetail] AS SELECT PaymentDetail.CreatedByUserKey,PaymentDetail.CreatedOn,PaymentDetail.CurrencyCode,PaymentDetail.OriginalAmount,PaymentDetail.PaymentApplicationRestrictionCode,PaymentDetail.PaymentDetailKey,PaymentDetail.PaymentDetailStatusCode,PaymentDetail.PaymentMethodKey,PaymentDetail.PaymentTypeKey,PaymentDetail.PayorContactKey,PaymentDetail.ReferenceNumber,PaymentDetail.SerializedDetails,PaymentDetail.SummaryDisplay,PaymentDetail.UpdatedByUserKey,PaymentDetail.UpdatedOn,PaymentDetail.PaymentDetailBOName FROM PaymentDetail WHERE PaymentDetail.PaymentDetailBOName= 'PurchaseOrderPaymentDetail'
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoQualityRef]'))
    DROP VIEW [dbo].[vBoQualityRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoQualityRef] AS SELECT QualityRef.QualityCode,QualityRef.QualityDesc,QualityRef.QualityName FROM QualityRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoReasonCode]'))
    DROP VIEW [dbo].[vBoReasonCode]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoReasonCode] AS SELECT ReasonCode.Code,ReasonCode.Description,ReasonCode.OrganizationKey,ReasonCode.ReasonCodeKey,ReasonCode.ReturnToInventoryFlag,ReasonCode.RefundShippingFlag FROM ReasonCode
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoReceipt]'))
    DROP VIEW [dbo].[vBoReceipt]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoReceipt] AS SELECT ReceiptMain.AccessKey,ReceiptMain.CreatedByUserKey,ReceiptMain.CreatedOn,ReceiptMain.IsNumberAutoGenerated,ReceiptMain.IssuedOn,ReceiptMain.IssuedToContactKey,ReceiptMain.Notes,ReceiptMain.ReceiptKey,ReceiptMain.ReceiptNumber,ReceiptMain.ReceiptTypeKey,ReceiptMain.SystemEntityKey,ReceiptMain.UpdatedByUserKey,ReceiptMain.UpdatedOn FROM ReceiptMain
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoReceiptLine]'))
    DROP VIEW [dbo].[vBoReceiptLine]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoReceiptLine] AS SELECT ReceiptLine.ReceiptKey,ReceiptLine.ReceiptLineKey,ReceiptLine.LineDescription,ReceiptLine.LineNumber,ReceiptLine.PaymentKey,ReceiptLine.ProductKey,ReceiptLine.ReceiptedAmount,ReceiptLine.SourceReceiptLineKey FROM ReceiptLine
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vReceiptReport]'))
    DROP VIEW [dbo].[vReceiptReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vReceiptReport]
AS
SELECT DISTINCT 
                      R.ReceiptKey, R.ReceiptNumber, R.IssuedOn,  R.IsNumberAutoGenerated, R.Notes, RL.LineDescription AS ReceiptLineDescription, RL.ReceiptLineKey,
                      RL.ReceiptedAmount AS ReceiptLineAmount, RTR.ReceiptTitle, RTR.ReceiptTypeDesc, CM.ID, CM.FullName, 
                      AM.FormattedAddress AS ContactAddress
FROM         dbo.ReceiptMain R LEFT OUTER JOIN
                      dbo.ReceiptLine RL ON R.ReceiptKey = RL.ReceiptKey LEFT OUTER JOIN
                      dbo.ReceiptTypeRef RTR ON R.ReceiptTypeKey = RTR.ReceiptTypeKey LEFT OUTER JOIN
                      dbo.ContactMain CM ON R.IssuedToContactKey = CM.ContactKey LEFT OUTER JOIN
                      dbo.FullAddress FA ON CM.ContactKey = FA.ContactKey LEFT OUTER JOIN
                      dbo.AddressMain AM ON FA.PhysicalAddressKey = AM.AddressKey

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoReceiptReport]'))
    DROP VIEW [dbo].[vBoReceiptReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoReceiptReport] AS SELECT vReceiptReport.FullName,vReceiptReport.ID,vReceiptReport.IssuedOn,vReceiptReport.ReceiptKey,vReceiptReport.ReceiptLineAmount,vReceiptReport.ReceiptNumber,vReceiptReport.ReceiptTypeDesc,vReceiptReport.ContactAddress,vReceiptReport.ReceiptLineKey,vReceiptReport.IsNumberAutoGenerated,vReceiptReport.Notes,vReceiptReport.ReceiptLineDescription,vReceiptReport.ReceiptTitle FROM vReceiptReport
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoReceiptType]'))
    DROP VIEW [dbo].[vBoReceiptType]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoReceiptType] AS SELECT ReceiptTypeRef.ReceiptTypeDesc,ReceiptTypeRef.ReceiptTypeKey,ReceiptTypeRef.ReceiptTitle FROM ReceiptTypeRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoRecurringDonationCommitment]'))
    DROP VIEW [dbo].[vBoRecurringDonationCommitment]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoRecurringDonationCommitment] AS SELECT RecurringDonationCommitment.Appeal,RecurringDonationCommitment.Campaign,RecurringDonationCommitment.CommitmentNotes,RecurringDonationCommitment.CommitmentStatusInd,RecurringDonationCommitment.ContactKey,RecurringDonationCommitment.CreatedByUserKey,RecurringDonationCommitment.CreatedOn,RecurringDonationCommitment.Distribution,RecurringDonationCommitment.DonationAmount,RecurringDonationCommitment.EndDate,RecurringDonationCommitment.Fund,RecurringDonationCommitment.MatchReference,RecurringDonationCommitment.PaymentMethod,RecurringDonationCommitment.RecurringDonationCommitmentKey,RecurringDonationCommitment.RecurringDonationFrequencyCode,RecurringDonationCommitment.StartDate,RecurringDonationCommitment.UpdatedByUserKey,RecurringDonationCommitment.UpdatedOn,RecurringDonationCommitment.BankAccountName,RecurringDonationCommitment.BankAccountNumber,RecurringDonationCommitment.BranchSortCode FROM RecurringDonationCommitment
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoRecurringDonationExpectedPayment]'))
    DROP VIEW [dbo].[vBoRecurringDonationExpectedPayment]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoRecurringDonationExpectedPayment] AS SELECT RecurringDonationExpectedPayment.Appeal,RecurringDonationExpectedPayment.BankAccountName,RecurringDonationExpectedPayment.BankAccountNumber,RecurringDonationExpectedPayment.BranchSortCode,RecurringDonationExpectedPayment.Campaign,RecurringDonationExpectedPayment.CreatedByUserKey,RecurringDonationExpectedPayment.CreatedOn,RecurringDonationExpectedPayment.Distribution,RecurringDonationExpectedPayment.DonationAmount,RecurringDonationExpectedPayment.Fund,RecurringDonationExpectedPayment.MatchReference,RecurringDonationExpectedPayment.Narrative,RecurringDonationExpectedPayment.OpportunityKey,RecurringDonationExpectedPayment.PaymentMethod,RecurringDonationExpectedPayment.RecurringDonationCommitmentKey,RecurringDonationExpectedPayment.RecurringDonationExpectedPaymentKey,RecurringDonationExpectedPayment.RecurringDonationExpectedPaymentSetKey,RecurringDonationExpectedPayment.RecurringDonationExpectedPaymentStatusCode,RecurringDonationExpectedPayment.ResultingTransLineNum,RecurringDonationExpectedPayment.ResultingTransNum,RecurringDonationExpectedPayment.UpdatedByUserKey,RecurringDonationExpectedPayment.UpdatedOn FROM RecurringDonationExpectedPayment
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoRecurringDonationExpectedPaymentSet]'))
    DROP VIEW [dbo].[vBoRecurringDonationExpectedPaymentSet]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoRecurringDonationExpectedPaymentSet] AS SELECT RecurringDonationExpectedPaymentSet.CreatedByUserKey,RecurringDonationExpectedPaymentSet.CreatedOn,RecurringDonationExpectedPaymentSet.ExpectedPaymentDate,RecurringDonationExpectedPaymentSet.RecurringDonationExpectedPaymentSetKey,RecurringDonationExpectedPaymentSet.RecurringDonationExpectedPaymentSetStatusCode,RecurringDonationExpectedPaymentSet.UpdatedByUserKey,RecurringDonationExpectedPaymentSet.UpdatedOn FROM RecurringDonationExpectedPaymentSet
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vRecurringDonationExpectedPaymentSetList]'))
    DROP VIEW [dbo].[vRecurringDonationExpectedPaymentSetList]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vRecurringDonationExpectedPaymentSetList]
AS
    SELECT 
        [e].[RecurringDonationExpectedPaymentSetKey],
        [e].[UpdatedOn] as [DateRun],
        [e].[ExpectedPaymentDate] as [MonthYear],
        [s].[RecurringDonationExpectedPaymentSetStatusDesc] as [RunStatus],
        (SELECT ISNULL(SUM([p].[DonationAmount]),0) FROM [RecurringDonationExpectedPayment] [p] WHERE [p].[RecurringDonationExpectedPaymentSetKey] = [e].[RecurringDonationExpectedPaymentSetKey] and [p].[RecurringDonationExpectedPaymentStatusCode] = 2) as [AmountWaiting],
        (SELECT COUNT(0) FROM [RecurringDonationExpectedPayment] [p] WHERE [p].[RecurringDonationExpectedPaymentSetKey] = [e].[RecurringDonationExpectedPaymentSetKey] and [p].[RecurringDonationExpectedPaymentStatusCode] = 2) as [NumberWaiting],
        (SELECT ISNULL(SUM([p].[DonationAmount]),0) FROM [RecurringDonationExpectedPayment] [p] WHERE [p].[RecurringDonationExpectedPaymentSetKey] = [e].[RecurringDonationExpectedPaymentSetKey] and [p].[RecurringDonationExpectedPaymentStatusCode] = 3) as [AmountProcessed],
        (SELECT COUNT(0) FROM [RecurringDonationExpectedPayment] [p] WHERE [p].[RecurringDonationExpectedPaymentSetKey] = [e].[RecurringDonationExpectedPaymentSetKey] and [p].[RecurringDonationExpectedPaymentStatusCode] = 3) as [NumberProcessed]
    FROM [dbo].[RecurringDonationExpectedPaymentSet] e
    INNER JOIN [dbo].[RecurringDonationExpectedPaymentSetStatusRef] s ON [e].[RecurringDonationExpectedPaymentSetStatusCode] = [s].[RecurringDonationExpectedPaymentSetStatusCode]



GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoRecurringDonationExpectedPaymentSetList]'))
    DROP VIEW [dbo].[vBoRecurringDonationExpectedPaymentSetList]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoRecurringDonationExpectedPaymentSetList] AS SELECT vRecurringDonationExpectedPaymentSetList.AmountProcessed,vRecurringDonationExpectedPaymentSetList.AmountWaiting,vRecurringDonationExpectedPaymentSetList.DateRun,vRecurringDonationExpectedPaymentSetList.MonthYear,vRecurringDonationExpectedPaymentSetList.NumberProcessed,vRecurringDonationExpectedPaymentSetList.NumberWaiting,vRecurringDonationExpectedPaymentSetList.RecurringDonationExpectedPaymentSetKey,vRecurringDonationExpectedPaymentSetList.RunStatus FROM vRecurringDonationExpectedPaymentSetList
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoRecurringDonationExpectedPaymentSetStatus]'))
    DROP VIEW [dbo].[vBoRecurringDonationExpectedPaymentSetStatus]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoRecurringDonationExpectedPaymentSetStatus] AS SELECT RecurringDonationExpectedPaymentSetStatusRef.RecurringDonationExpectedPaymentSetStatusCode,RecurringDonationExpectedPaymentSetStatusRef.RecurringDonationExpectedPaymentSetStatusDesc AS Description,RecurringDonationExpectedPaymentSetStatusRef.RecurringDonationExpectedPaymentSetStatusName AS Name FROM RecurringDonationExpectedPaymentSetStatusRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoRecurringDonationExpectedPaymentStatus]'))
    DROP VIEW [dbo].[vBoRecurringDonationExpectedPaymentStatus]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoRecurringDonationExpectedPaymentStatus] AS SELECT RecurringDonationExpectedPaymentStatusRef.RecurringDonationExpectedPaymentStatusCode,RecurringDonationExpectedPaymentStatusRef.RecurringDonationExpectedPaymentStatusDesc AS Description,RecurringDonationExpectedPaymentStatusRef.RecurringDonationExpectedPaymentStatusName AS Name FROM RecurringDonationExpectedPaymentStatusRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoRecurringDonationFrequencyRef]'))
    DROP VIEW [dbo].[vBoRecurringDonationFrequencyRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoRecurringDonationFrequencyRef] AS SELECT RecurringDonationFrequencyRef.Description,RecurringDonationFrequencyRef.RecurringDonationFrequencyCode,RecurringDonationFrequencyRef.RecurringDonationFrequencyName FROM RecurringDonationFrequencyRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoRecurringDonationMatchStatus]'))
    DROP VIEW [dbo].[vBoRecurringDonationMatchStatus]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoRecurringDonationMatchStatus] AS SELECT RecurringDonationMatchStatusRef.RecurringDonationMatchStatusCode,RecurringDonationMatchStatusRef.RecurringDonationMatchStatusDesc AS Description FROM RecurringDonationMatchStatusRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoRegisteredComponent]'))
    DROP VIEW [dbo].[vBoRegisteredComponent]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoRegisteredComponent] AS SELECT ComponentRegistry.AssemblyName,ComponentRegistry.ConfigureWebUserControl,ComponentRegistry.ConfigureWindowsControl,ComponentRegistry.Description,ComponentRegistry.InterfaceName,ComponentRegistry.Name,ComponentRegistry.TypeName,ComponentRegistry.ComponentKey,ComponentRegistry.IsBusinessItem,ComponentRegistry.IsTyped,ComponentRegistry.ComponentEditLink,ComponentRegistry.ComponentExecuteLink,ComponentRegistry.ComponentNewLink,ComponentRegistry.ComponentSummaryContentKey,ComponentRegistry.DeploymentPackageCode FROM ComponentRegistry
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoRegistrationStatus]'))
    DROP VIEW [dbo].[vBoRegistrationStatus]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoRegistrationStatus] AS SELECT RegistrationStatusRef.RegistrationStatusCode AS Code,RegistrationStatusRef.RegistrationStatusName AS Name FROM RegistrationStatusRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoRegistrationStatusChange]'))
    DROP VIEW [dbo].[vBoRegistrationStatusChange]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoRegistrationStatusChange] AS SELECT RegistrationStatusChange.CertificationProgramRegistrationKey,RegistrationStatusChange.CreatedByUserKey,RegistrationStatusChange.CreatedOn,RegistrationStatusChange.RegistrationStatusChangeKey,RegistrationStatusChange.RegistrationStatusCode,RegistrationStatusChange.StatusChangedOn,RegistrationStatusChange.StatusChangedUserKey,RegistrationStatusChange.UpdatedByUserKey,RegistrationStatusChange.UpdatedOn,RegistrationStatusChange.RegistrationStatusChangeNote FROM RegistrationStatusChange
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vRegistrationStatusChangeGrouped]'))
    DROP VIEW [dbo].[vRegistrationStatusChangeGrouped]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vRegistrationStatusChangeGrouped]
AS
SELECT RSC1.[RegistrationStatusChangeKey]
  FROM [dbo].[RegistrationStatusChange] AS RSC1
 WHERE RSC1.[UpdatedOn] =  ( SELECT MAX(RSC2.UpdatedOn)
                                     FROM [dbo].[RegistrationStatusChange] AS RSC2
                                    WHERE RSC1.[CertificationProgramRegistrationKey] = RSC2.[CertificationProgramRegistrationKey] )

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoRegistrationStatusChangeGrouped]'))
    DROP VIEW [dbo].[vBoRegistrationStatusChangeGrouped]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoRegistrationStatusChangeGrouped] AS SELECT vRegistrationStatusChangeGrouped.RegistrationStatusChangeKey FROM vRegistrationStatusChangeGrouped
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vRelatedJournalEntry]'))
    DROP VIEW [dbo].[vRelatedJournalEntry]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vRelatedJournalEntry]
AS
/*
	This view selects journal entries related to a sales journal entry.  Today this only means
	Payment entries -- later it will include adjustments as well.
*/
	SELECT DISTINCT paymentJournal.GLTransactionKey, paymentJournal.TransactionDate, paymentJournal.FiscalPeriod,
		 paymentJournal.FinancialEntityKey, paymentJournal.JournalEntryTypeCode, paymentJournal.OriginatingBatchNumber,
		 paymentJournal.FinalBatchNumber, paymentJournal.InvoiceKey, paymentJournal.PaymentKey, paymentJournal.ContactKey,
		 paymentJournal.CreatedOn, paymentJournal.ExportedOn, paymentJournal.Description, 
		 sum(ma.Amount) as Amount, ma.InvoiceKey AS RelatedObjectKey, 'Payment' as ObjectType
	FROM         dbo.GLTransactionMain paymentJournal 
	INNER JOIN dbo.MonetaryApplication ma on ma.SrcPaymentKey = paymentJournal.PaymentKey
	WHERE ma.Amount > 0
	GROUP BY paymentJournal.GLTransactionKey,
		 paymentJournal.TransactionDate,
		 paymentJournal.FiscalPeriod,
		 paymentJournal.FinancialEntityKey,
		 paymentJournal.JournalEntryTypeCode,
		 paymentJournal.OriginatingBatchNumber,
		 paymentJournal.FinalBatchNumber,
		 paymentJournal.InvoiceKey,
		 paymentJournal.PaymentKey,
		 paymentJournal.ContactKey,
		 paymentJournal.CreatedOn,
		 paymentJournal.ExportedOn,
		 paymentJournal.Description,
		 ma.InvoiceKey


	UNION

select DISTINCT  salesJournalEntry.GLTransactionKey, salesJournalEntry.TransactionDate, salesJournalEntry.FiscalPeriod,
		 salesJournalEntry.FinancialEntityKey, salesJournalEntry.JournalEntryTypeCode, salesJournalEntry.OriginatingBatchNumber,
		 salesJournalEntry.FinalBatchNumber, salesJournalEntry.InvoiceKey, salesJournalEntry.PaymentKey, salesJournalEntry.ContactKey,
		 salesJournalEntry.CreatedOn, salesJournalEntry.ExportedOn, salesJournalEntry.Description, 
		 sum(ma.Amount) , ma.SrcPaymentKey AS RelatedObjectKey, 'Invoice' as ObjectType
from GLTransactionMain salesJournalEntry 
 inner join MonetaryApplication ma on ma.InvoiceKey = salesJournalEntry.InvoiceKey
 where ma.Amount > 0
 GROUP BY 	 salesJournalEntry.GLTransactionKey,
		 salesJournalEntry.TransactionDate,
		 salesJournalEntry.FiscalPeriod,
		 salesJournalEntry.FinancialEntityKey,
		 salesJournalEntry.JournalEntryTypeCode,
		 salesJournalEntry.OriginatingBatchNumber,
		 salesJournalEntry.FinalBatchNumber,
		 salesJournalEntry.InvoiceKey,
		 salesJournalEntry.PaymentKey,
		 salesJournalEntry.ContactKey,
		 salesJournalEntry.CreatedOn,
		 salesJournalEntry.ExportedOn,
		 salesJournalEntry.Description,
		 ma.SrcPaymentKey

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoRelatedJournalEntry]'))
    DROP VIEW [dbo].[vBoRelatedJournalEntry]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoRelatedJournalEntry] AS SELECT vRelatedJournalEntry.Amount,vRelatedJournalEntry.ContactKey,vRelatedJournalEntry.CreatedOn,vRelatedJournalEntry.Description,vRelatedJournalEntry.ExportedOn,vRelatedJournalEntry.FinalBatchNumber,vRelatedJournalEntry.FinancialEntityKey,vRelatedJournalEntry.FiscalPeriod,vRelatedJournalEntry.GLTransactionKey,vRelatedJournalEntry.InvoiceKey,vRelatedJournalEntry.JournalEntryTypeCode,vRelatedJournalEntry.ObjectType,vRelatedJournalEntry.OriginatingBatchNumber,vRelatedJournalEntry.PaymentKey,vRelatedJournalEntry.RelatedObjectKey,vRelatedJournalEntry.TransactionDate FROM vRelatedJournalEntry
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoRelationship]'))
    DROP VIEW [dbo].[vBoRelationship]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoRelationship] AS SELECT RelationshipMain.EffectiveDate,RelationshipMain.EndDate,RelationshipMain.RelationshipKey,RelationshipMain.RelationshipTypeKey,RelationshipMain.SubjectUniformKey,RelationshipMain.TargetUniformKey FROM RelationshipMain
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoRelationshipCategory]'))
    DROP VIEW [dbo].[vBoRelationshipCategory]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoRelationshipCategory] AS SELECT RelationshipCategoryRef.IsActive,RelationshipCategoryRef.IsSystem,RelationshipCategoryRef.RelationshipCategoryDescription AS Description,RelationshipCategoryRef.RelationshipCategoryKey,RelationshipCategoryRef.RelationshipCategoryName AS Name FROM RelationshipCategoryRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoRelationshipTypeCategory]'))
    DROP VIEW [dbo].[vBoRelationshipTypeCategory]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoRelationshipTypeCategory] AS SELECT RelationshipTypeCategory.RelationshipTypeCategoryKey,RelationshipTypeCategory.RelationshipTypeKey,RelationshipTypeCategory.RelationshipCategoryKey,RelationshipTypeCategory.IsSystem,RelationshipTypeCategory.IsActive FROM RelationshipTypeCategory
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoRelationshipTypeRef]'))
    DROP VIEW [dbo].[vBoRelationshipTypeRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoRelationshipTypeRef] AS SELECT RelationshipTypeRef.IsSystem,RelationshipTypeRef.ReciprocalRelationshipTypeKey,RelationshipTypeRef.RelationshipTypeDesc AS Description,RelationshipTypeRef.RelationshipTypeKey FROM RelationshipTypeRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoRemittance]'))
    DROP VIEW [dbo].[vBoRemittance]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoRemittance] AS SELECT Remittance.CreatedByUserKey,Remittance.CreatedOn,Remittance.RemittanceKey,Remittance.SystemEntityKey,Remittance.UpdatedByUserKey,Remittance.UpdatedOn,Remittance.FinancialEntityKey,Remittance.PaymentDetailBOName,Remittance.PaymentDetailKey FROM Remittance
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoRemittanceApplication]'))
    DROP VIEW [dbo].[vBoRemittanceApplication]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoRemittanceApplication] AS SELECT RemittanceApplication.Amount,RemittanceApplication.InvoiceKey,RemittanceApplication.InvoiceLineKey,RemittanceApplication.RemittanceApplicationKey,RemittanceApplication.RemittanceKey,RemittanceApplication.OrderLineNumber,RemittanceApplication.OrderNumber,RemittanceApplication.OrderKey FROM RemittanceApplication
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoRemittanceAppliedToOrder]'))
    DROP VIEW [dbo].[vBoRemittanceAppliedToOrder]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoRemittanceAppliedToOrder] AS SELECT PaymentDetail.OriginalAmount,PaymentDetail.PaymentApplicationRestrictionCode,PaymentDetail.PaymentDetailKey,PaymentDetail.PaymentDetailStatusCode,PaymentDetail.PaymentMethodKey,PaymentDetail.PayorContactKey,PaymentDetail.SummaryDisplay,Remittance.CreatedOn,RemittanceApplication.Amount,RemittanceApplication.OrderKey FROM PaymentDetail
	INNER JOIN Remittance
		ON PaymentDetail.PaymentDetailKey = Remittance.PaymentDetailKey
	INNER JOIN RemittanceApplication
		ON Remittance.RemittanceKey = RemittanceApplication.RemittanceKey
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vReportIndexReport]'))
    DROP VIEW [dbo].[vReportIndexReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE  VIEW [dbo].[vReportIndexReport]
AS
 SELECT
	D4.DocumentName AS ModuleName, D3.DocumentName AS RootFolderName,  
	D2.DocumentName AS FolderName, D1.DocumentName AS SubFolderName, D.DocumentName AS 		ReportName, D.DocumentDescription AS Description, D.DocumentKey, H.HierarchyKey AS 	DocumentNodeKey, H.ParentHierarchyKey AS ParentDocumentNodeKey
FROM dbo.DocumentMain D 
	INNER JOIN dbo.Hierarchy H     ON D.DocumentVersionKey = H.UniformKey 
	INNER JOIN dbo.Hierarchy H1    ON H.ParentHierarchyKey = H1.HierarchyKey 
	INNER JOIN dbo.DocumentMain D1 ON H1.UniformKey = D1.DocumentVersionKey 
	INNER JOIN dbo.Hierarchy H2    ON H1.ParentHierarchyKey = H2.HierarchyKey 
	INNER JOIN dbo.DocumentMain D2 ON H2.UniformKey = D2.DocumentVersionKey 
	INNER JOIN dbo.Hierarchy H3    ON H2.ParentHierarchyKey = H3.HierarchyKey 
	INNER JOIN dbo.DocumentMain D3 ON H3.UniformKey = D3.DocumentVersionKey
	INNER JOIN dbo.Hierarchy H4    ON H3.ParentHierarchyKey = H4.HierarchyKey 
	INNER JOIN dbo.DocumentMain D4 ON H4.UniformKey = D4.DocumentVersionKey
 WHERE D.DocumentTypeCode = 'CRA'    AND D2.DocumentName = 'Reports'

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoReportIndexReport]'))
    DROP VIEW [dbo].[vBoReportIndexReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoReportIndexReport] AS SELECT vReportIndexReport.DocumentKey,vReportIndexReport.DocumentNodeKey,vReportIndexReport.FolderName,vReportIndexReport.ModuleName,vReportIndexReport.ParentDocumentNodeKey,vReportIndexReport.ReportName,vReportIndexReport.Description,vReportIndexReport.RootFolderName,vReportIndexReport.SubFolderName FROM vReportIndexReport
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoResourceAction]'))
    DROP VIEW [dbo].[vBoResourceAction]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoResourceAction] AS SELECT ResourceActionRef.IsSystem,ResourceActionRef.OrganizationKey,ResourceActionRef.ResourceActionDesc AS Description,ResourceActionRef.ResourceActionKey,ResourceActionRef.ResourceActionName AS Name FROM ResourceActionRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoResponseMediaRef]'))
    DROP VIEW [dbo].[vBoResponseMediaRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoResponseMediaRef] AS SELECT ResponseMediaRef.ResponseMediaCode,ResponseMediaRef.ResponseMediaDesc FROM ResponseMediaRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoResponseTypeRef]'))
    DROP VIEW [dbo].[vBoResponseTypeRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoResponseTypeRef] AS SELECT ResponseTypeRef.ResponseTypeCode,ResponseTypeRef.ResponseTypeDesc,ResponseTypeRef.ResponseTypeName FROM ResponseTypeRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoRestockPrice]'))
    DROP VIEW [dbo].[vBoRestockPrice]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoRestockPrice] AS SELECT RestockPrice.CreatedByUserKey,RestockPrice.CreatedOn,RestockPrice.RestockPriceKey,RestockPrice.Price,RestockPrice.MinAmount,RestockPrice.RestockPriceCode,RestockPrice.UpdatedByUserKey,RestockPrice.UpdatedOn FROM RestockPrice
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoRestockPriceRef]'))
    DROP VIEW [dbo].[vBoRestockPriceRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoRestockPriceRef] AS SELECT RestockPriceRef.RestockPriceCode,RestockPriceRef.RestockPriceDesc,RestockPriceRef.DisplayPrompt FROM RestockPriceRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoRFMAnalysis]'))
    DROP VIEW [dbo].[vBoRFMAnalysis]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoRFMAnalysis] AS SELECT DocumentMain.Blob,DocumentMain.DefaultChildAccessKey,DocumentMain.DocumentDescription AS Description,DocumentMain.DocumentKey,DocumentMain.DocumentTypeCode AS DocumentType,DocumentMain.LockedByUserKey,DocumentMain.LockedOn,DocumentMain.DocumentName AS Name,DocumentMain.UpdatedByUserKey,DocumentMain.UpdatedOn,RFMMain.Combined,RFMMain.FirstContact,RFMMain.Frequency,RFMMain.HighAmount,RFMMain.LastContact,RFMMain.LowAmount,RFMMain.Monetary,RFMMain.NumContacts,RFMMain.NumDays,RFMMain.Recency,RFMMain.RFMKey,RFMMain.Total,RFMMain.TotalAmount,RFMMain.ContactKey,RFMMain.HighContact,RFMMain.FirstContactAmount,DocumentMain.CreatedByUserKey,DocumentMain.CreatedOn FROM DocumentMain
	INNER JOIN RFMMain
		ON DocumentMain.DocumentKey = RFMMain.RFMKey
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoRole]'))
    DROP VIEW [dbo].[vBoRole]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoRole] AS SELECT RoleMain.Description,RoleMain.IsSystem,RoleMain.Name,RoleMain.RoleKey,RoleMain.UpdatedByUserKey,RoleMain.UpdatedOn FROM RoleMain
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoRoundingMultipleRef]'))
    DROP VIEW [dbo].[vBoRoundingMultipleRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoRoundingMultipleRef] AS SELECT RoundingMultipleRef.RoundingMultipleCode,RoundingMultipleRef.RoundingMultipleDesc,RoundingMultipleRef.RoundingMultipleKey FROM RoundingMultipleRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoRule]'))
    DROP VIEW [dbo].[vBoRule]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoRule] AS SELECT RuleMain.Description,RuleMain.Name,RuleMain.UpdatedByUserKey,RuleMain.UpdatedOn,RuleMain.BeginDate,RuleMain.EndDate,RuleMain.IsActive,RuleMain.ObjectMapperComponentKey,RuleMain.RuleEvaluatorComponentKey,RuleMain.Priority,RuleMain.CreatedByUserKey,RuleMain.CreatedOn,RuleMain.RuleKey,RuleMain.SystemEntityKey FROM RuleMain
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoRuleCriterion]'))
    DROP VIEW [dbo].[vBoRuleCriterion]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoRuleCriterion] AS SELECT RuleCriterion.Name,RuleCriterion.ObjectName,RuleCriterion.RuleCriterionKey,RuleCriterion.RuleKey,RuleCriterion.UpdatedByUserKey,RuleCriterion.UpdatedOn FROM RuleCriterion
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoRuleFilter]'))
    DROP VIEW [dbo].[vBoRuleFilter]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoRuleFilter] AS SELECT RuleFilter.ComparisonCode,RuleFilter.PropertyName,RuleFilter.RuleCriterionKey,RuleFilter.RuleFilterKey,RuleFilter.ValueOne,RuleFilter.ValueOneTypeName,RuleFilter.ValueTwo,RuleFilter.ValueTwoTypeName,RuleFilter.UpdatedByUserKey,RuleFilter.UpdatedOn FROM RuleFilter
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoSalesHistory]'))
    DROP VIEW [dbo].[vBoSalesHistory]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoSalesHistory] AS SELECT SalesHistory.BillToContactKey,SalesHistory.ExtendedCost,SalesHistory.ExtendedPrice,SalesHistory.InvoiceTypeCode,SalesHistory.OrderDate,SalesHistory.OrderNumber,SalesHistory.OrderTypeKey,SalesHistory.PriceSheetKey,SalesHistory.ProductKey,SalesHistory.QuantitySold,SalesHistory.ResponseMediaCode,SalesHistory.SalesHistoryKey,SalesHistory.ShipToContactKey,SalesHistory.SoldToContactKey,SalesHistory.SourceCodeKey,SalesHistory.TransactionDate,SalesHistory.UndiscountedExtendedPrice,SalesHistory.UomKey,SalesHistory.WarehouseKey,SalesHistory.CommissionPlanKey,SalesHistory.SalesTeamGroupKey,SalesHistory.SalesLocationKey,SalesHistory.Description,SalesHistory.InvoiceLineNumber,SalesHistory.InvoiceNumber,SalesHistory.IsPledge,SalesHistory.ListAs,SalesHistory.PromotionDiscountKey,SalesHistory.SourceSalesHistoryKey,SalesHistory.AccessKey,SalesHistory.CreatedByUserKey,SalesHistory.CreatedOn,SalesHistory.SystemEntityKey FROM SalesHistory
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoSalesHistoryMemorialTribute]'))
    DROP VIEW [dbo].[vBoSalesHistoryMemorialTribute]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoSalesHistoryMemorialTribute] AS SELECT SalesHistoryMemorialTribute.ContactKey,SalesHistoryMemorialTribute.Description,SalesHistoryMemorialTribute.SalesHistoryKey,SalesHistoryMemorialTribute.SalesHistoryMemorialTributeKey FROM SalesHistoryMemorialTribute
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoSalesHistoryRelationship]'))
    DROP VIEW [dbo].[vBoSalesHistoryRelationship]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoSalesHistoryRelationship] AS SELECT SalesHistoryRelationship.SalesHistoryRelationshipKey,SalesHistoryRelationship.SalesHistoryRelationshipTypeCode,SalesHistoryRelationship.SourceSalesHistoryKey,SalesHistoryRelationship.TargetSalesHistorykey FROM SalesHistoryRelationship
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSalesHistoryReport]'))
    DROP VIEW [dbo].[vSalesHistoryReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vSalesHistoryReport]
AS
SELECT     SH.SalesHistoryKey, SH.TransactionDate, SH.OrderNumber, SH.OrderDate, SH.InvoiceTypeCode, SH.QuantitySold, SH.ExtendedPrice, 
                      SH.UndiscountedExtendedPrice, SH.ExtendedCost, SH.ResponseMediaCode, BCM.ID AS BillToId, BCM.FullName AS BillToName, 
                      SHCM.ID AS ShipToId, SHCM.FullName AS ShipToName, SCM.ID AS SoldToId, SCM.FullName AS SoldToName, PM.ProductCode, 
                      PM.Name AS ProductName, WH.Description AS Warehouse, UM.Name AS UomName
FROM         dbo.SalesHistory SH LEFT OUTER JOIN
                      dbo.Uom UM ON SH.UomKey = UM.UomKey LEFT OUTER JOIN
                      dbo.ContactMain BCM ON SH.BillToContactKey = BCM.ContactKey LEFT OUTER JOIN
                      dbo.ContactMain SHCM ON SH.ShipToContactKey = SHCM.ContactKey LEFT OUTER JOIN
                      dbo.ContactMain SCM ON SH.SoldToContactKey = SCM.ContactKey LEFT OUTER JOIN
                      dbo.ProductMain PM ON SH.ProductKey = PM.ProductKey LEFT OUTER JOIN
                      dbo.Warehouse WH ON SH.WarehouseKey = WH.WarehouseKey

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoSalesHistoryReport]'))
    DROP VIEW [dbo].[vBoSalesHistoryReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoSalesHistoryReport] AS SELECT vSalesHistoryReport.BillToId,vSalesHistoryReport.BillToName,vSalesHistoryReport.ExtendedCost,vSalesHistoryReport.ExtendedPrice,vSalesHistoryReport.OrderDate,vSalesHistoryReport.OrderNumber,vSalesHistoryReport.ProductCode,vSalesHistoryReport.ProductName,vSalesHistoryReport.QuantitySold,vSalesHistoryReport.ResponseMediaCode,vSalesHistoryReport.SalesHistoryKey,vSalesHistoryReport.ShipToId,vSalesHistoryReport.ShipToName,vSalesHistoryReport.SoldToId,vSalesHistoryReport.SoldToName,vSalesHistoryReport.TransactionDate,vSalesHistoryReport.UndiscountedExtendedPrice,vSalesHistoryReport.UomName,vSalesHistoryReport.Warehouse,vSalesHistoryReport.InvoiceTypeCode FROM vSalesHistoryReport
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoSalesHistorySoftCredit]'))
    DROP VIEW [dbo].[vBoSalesHistorySoftCredit]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoSalesHistorySoftCredit] AS SELECT SalesHistorySoftCredit.Amount,SalesHistorySoftCredit.ContactKey,SalesHistorySoftCredit.PercentCredit,SalesHistorySoftCredit.SalesHistorySoftCreditKey,SalesHistorySoftCredit.SalesHistoryKey FROM SalesHistorySoftCredit
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSalesJournalSummary]'))
    DROP VIEW [dbo].[vSalesJournalSummary]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
/****** Object:  View dbo.vSalesJournalSummary    Script Date: 1/5/2006 4:38:32 PM ******/
/*
	This view summarizes GLTransactions and GLTransactionLines involved in 
	Sales journal entries.  The requirements are, for each Sales
	journal entry, list:
		1) lines to credit income accounts, one line per invoice
		   distribution; ordered by invoice line number.  These for Accrual-based
		   invoices only.
		2) line to debit Unearned Income, if appropriate; one per
		   payment applied, in the order the payments were applied
		3) lines to debit AR; one line per Invoice/GLAccount
		   combination, ordered by Invoice number; AR account 
		   ordering is arbitrary.  These are included only for 
		   accrual-based invoices
	
	This view handles the summarization -- ordering is the responsibility of the
	stored procedures that produce the GLTransactionLines and assign 
	TransactionSequenceNumbers to each line.  

	This view is a UNION of two disjoint selects.  The first handles the income lines 
	where no summarization is needed.  The second handles
	AR and unearned income.
*/
CREATE                           VIEW [dbo].[vSalesJournalSummary] AS
select gla.GLAccountCode, gla.Description as 'Account', l.Description as 'Type', 
p.Name as 'Description',
l.Amount, 
CASE WHEN Amount >= 0 then Amount END as 'Debit',
	CASE WHEN Amount < 0 then -1 * Amount END as 'Credit',
l.TransactionSequenceNumber, l.GLTransactionLineKey,
m.GLTransactionKey, m.TransactionDate, m.FiscalPeriod, m.FinancialEntityKey, 
m.JournalEntryTypeCode, m.OriginatingBatchNumber, m.FinalBatchNumber, m.InvoiceKey,
m.PaymentKey, m.ContactKey, m.CreatedOn, m.ExportedOn, m.Description as 'EntryDescription' 
from  GLTransactionMain m
 join GLTransactionLine l on l.GLTransactionKey = m.GLTransactionKey
 join GLAccount gla on l.GLAccountKey = gla.GLAccountKey
 join ProductMain p on p.ProductKey = l.ProductKey

where m.InvoiceKey is not null
      and l.GLEntryType != 'UnearnedIncome'
      and l.GLEntryType != 'AccountsReceivable'

UNION

select gla.GLAccountCode, MAX(gla.Description), MAX(l.Description), 
CASE WHEN l.GLEntryType = 'UnearnedIncome' THEN 'Application of ' + MAX(pay.SummaryDisplay) 
ELSE 'Balance due' END, 
SUM(l.Amount),
CASE WHEN SUM(l.Amount) >= 0 then SUM(l.Amount) END as 'Debit',
	CASE WHEN SUM(l.Amount) < 0 then -1 * SUM(l.Amount) END as 'Credit', 
MIN(l.TransactionSequenceNumber),  
dbo.GetFirstGLTransactionLineKey(m.GLTransactionKey, l.PaymentKey, l.GLAccountKey, l.GLEntryType),
 m.GLTransactionKey,
MAX(m.TransactionDate), MAX(m.FiscalPeriod), 
m.FinancialEntityKey, MAX(m.JournalEntryTypeCode), 
MAX(m.OriginatingBatchNumber), MAX(m.FinalBatchNumber), m.InvoiceKey,
ISNULL(l.PaymentKey,'00000000-0000-0000-0000-000000000000'), m.ContactKey, MAX(m.CreatedOn), MAX(m.ExportedOn), 
MAX(m.Description)  
from  GLTransactionMain m
 join GLTransactionLine l on l.GLTransactionKey = m.GLTransactionKey
 join GLAccount gla on l.GLAccountKey = gla.GLAccountKey
 join ProductMain p on p.ProductKey = l.ProductKey
 left outer join PaymentMain pay on pay.PaymentKey = l.PaymentKey

where m.InvoiceKey is not null
      and l.GLEntryType = 'UnearnedIncome'
      or  l.GLEntryType = 'AccountsReceivable'
group by gla.GLAccountCode, l.PaymentKey, m.FinancialEntityKey, m.InvoiceKey,
 m.PaymentKey, m.ContactKey, l.GLEntryType, m.GLTransactionKey, l.GLAccountKey

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoSalesJournalSummary]'))
    DROP VIEW [dbo].[vBoSalesJournalSummary]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoSalesJournalSummary] AS SELECT vSalesJournalSummary.Account,vSalesJournalSummary.Amount,vSalesJournalSummary.ContactKey,vSalesJournalSummary.CreatedOn,vSalesJournalSummary.Credit,vSalesJournalSummary.Debit,vSalesJournalSummary.Description,vSalesJournalSummary.EntryDescription,vSalesJournalSummary.ExportedOn,vSalesJournalSummary.FinalBatchNumber,vSalesJournalSummary.FinancialEntityKey,vSalesJournalSummary.FiscalPeriod,vSalesJournalSummary.GLAccountCode,vSalesJournalSummary.GLTransactionKey,vSalesJournalSummary.GLTransactionLineKey,vSalesJournalSummary.InvoiceKey,vSalesJournalSummary.JournalEntryTypeCode,vSalesJournalSummary.OriginatingBatchNumber,vSalesJournalSummary.PaymentKey,vSalesJournalSummary.TransactionDate,vSalesJournalSummary.TransactionSequenceNumber,vSalesJournalSummary.Type FROM vSalesJournalSummary
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoSalesLocation]'))
    DROP VIEW [dbo].[vBoSalesLocation]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoSalesLocation] AS SELECT SalesLocation.Description,SalesLocation.FullAddressKey,SalesLocation.Holidays,SalesLocation.HoursOfOperation,SalesLocation.IsSystemDefault,SalesLocation.Name,SalesLocation.SalesLocationKey,SalesLocation.SalesLocationStatusCode FROM SalesLocation
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoSalesLocationStatusRef]'))
    DROP VIEW [dbo].[vBoSalesLocationStatusRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoSalesLocationStatusRef] AS SELECT SalesLocationStatusRef.SalesLocationStatusCode,SalesLocationStatusRef.SalesLocationStatusDesc,SalesLocationStatusRef.SalesLocationStatusName FROM SalesLocationStatusRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoSalesTeamMember]'))
    DROP VIEW [dbo].[vBoSalesTeamMember]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoSalesTeamMember] AS SELECT GroupMember.CreatedByUserKey,GroupMember.CreatedOn,GroupMember.DropDate,GroupMember.GroupKey,GroupMember.GroupMemberKey,GroupMember.JoinDate,GroupMember.MemberContactKey,GroupMember.UpdatedByUserKey,GroupMember.UpdatedOn,GroupMember.IsActive,SalesTeamMember.Notes FROM GroupMember
	INNER JOIN SalesTeamMember
		ON GroupMember.GroupMemberKey = SalesTeamMember.GroupMemberKey
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoSalutationRef]'))
    DROP VIEW [dbo].[vBoSalutationRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoSalutationRef] AS SELECT SalutationRef.AutoCreateFlag AS AutoCreate,SalutationRef.IsActive,SalutationRef.IsDefault,SalutationRef.IsOverrideable,SalutationRef.SalutationDesc AS Description,SalutationRef.SalutationKey,SalutationRef.IndividualFormula,SalutationRef.InstituteFormula,SalutationRef.NeedsGenerationFlag AS NeedsGeneration,SalutationRef.NeedsUpdateFlag AS NeedsUpdate FROM SalutationRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoScheduleCommon]'))
    DROP VIEW [dbo].[vBoScheduleCommon]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoScheduleCommon] AS SELECT ScheduleCommon.CreatedByUserKey,ScheduleCommon.CreatedOn,ScheduleCommon.EffectiveDate,ScheduleCommon.IntervalCount,ScheduleCommon.IntervalDuration,ScheduleCommon.IntervalTypeCode,ScheduleCommon.ScheduleKey,ScheduleCommon.SystemEntityKey,ScheduleCommon.UpdatedByUserKey,ScheduleCommon.UpdatedOn FROM ScheduleCommon
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoScheduledTask]'))
    DROP VIEW [dbo].[vBoScheduledTask]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoScheduledTask] AS SELECT ScheduledTask.AtomGraph,ScheduledTask.AtomKey,ScheduledTask.Category,ScheduledTask.CreatedByUserKey,ScheduledTask.CreatedOn,ScheduledTask.Description,ScheduledTask.IsDisabled,ScheduledTask.KeepAlive,ScheduledTask.MostRecentRun,ScheduledTask.MostRecentWorkflowInstanceKey,ScheduledTask.RunAsUserKey,ScheduledTask.Schedule,ScheduledTask.ScheduledTaskKey,ScheduledTask.SelectionLock,ScheduledTask.SingleInstanceConcurrency,ScheduledTask.UpdatedByUserKey,ScheduledTask.UpdatedOn,ScheduledTask.WorkflowInputParameters FROM ScheduledTask
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoScheduledTaskHistory]'))
    DROP VIEW [dbo].[vBoScheduledTaskHistory]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoScheduledTaskHistory] AS SELECT ScheduledTaskHistory.CompletionStatus,ScheduledTaskHistory.FinishedOn,ScheduledTaskHistory.LogText,ScheduledTaskHistory.ScheduledTaskHistoryKey,ScheduledTaskHistory.ScheduledTaskKey,ScheduledTaskHistory.StartedOn,ScheduledTaskHistory.WorkflowInstanceKey FROM ScheduledTaskHistory
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoScheduledTaskService]'))
    DROP VIEW [dbo].[vBoScheduledTaskService]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoScheduledTaskService] AS SELECT ScheduledTaskService.BaseDirectory,ScheduledTaskService.CategoryFilter,ScheduledTaskService.MachineName,ScheduledTaskService.MaxWorkerCount,ScheduledTaskService.ScheduledTaskServiceKey,ScheduledTaskService.ServiceName,ScheduledTaskService.ServiceStatus,ScheduledTaskService.UpdatedOn FROM ScheduledTaskService
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoSeasonalFullAddress]'))
    DROP VIEW [dbo].[vBoSeasonalFullAddress]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoSeasonalFullAddress] AS SELECT SeasonalFullAddress.BeginDate,SeasonalFullAddress.EndDate,SeasonalFullAddress.FullAddressKey,SeasonalFullAddress.IsSeasonalAnnually,SeasonalFullAddress.ReplacesFullAddressKey,SeasonalFullAddress.SeasonalFullAddressKey FROM SeasonalFullAddress
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoSegmentationDef]'))
    DROP VIEW [dbo].[vBoSegmentationDef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoSegmentationDef] AS SELECT SegmentDefinition.Description,SegmentDefinition.Name,SegmentDefinition.NSelectElements,SegmentDefinition.QueryDocumentKey,SegmentDefinition.UpdatedByUserKey,SegmentDefinition.UpdatedOn,SegmentDefinition.ExecutionOrder,SegmentDefinition.IsJobNSelect,ListMain.MemberObjectType,SegmentDefinition.CreatedByUserKey,SegmentDefinition.CreatedOn,SegmentDefinition.SegmentationJobKey,ListMain.ListKey AS SegmentDefinitionKey FROM ListMain
	INNER JOIN SegmentDefinition
		ON ListMain.ListKey = SegmentDefinition.SegmentDefinitionKey
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoSegmentationJob]'))
    DROP VIEW [dbo].[vBoSegmentationJob]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoSegmentationJob] AS SELECT SegmentationJob.Description,SegmentationJob.InactiveDate,SegmentationJob.LastListCreatedByUserKey,SegmentationJob.LastListCreatedOn,SegmentationJob.MemberObjectType,SegmentationJob.Name,SegmentationJob.NSelectSegmentElements,SegmentationJob.NSelectSegments,SegmentationJob.SegmentationJobStatusCode,SegmentationJob.SupersetQueryDocumentKey,SegmentationJob.UpdatedByUserKey,SegmentationJob.UpdatedOn,SegmentationJob.UseNSelectFlag,SegmentationJob.IsExecutionEnabled,SegmentationJob.AccessKey,SegmentationJob.CreatedByUserKey,SegmentationJob.CreatedOn,SegmentationJob.SegmentationJobKey,SegmentationJob.SystemEntityKey FROM SegmentationJob
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoSegmentationJobStatusRef]'))
    DROP VIEW [dbo].[vBoSegmentationJobStatusRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoSegmentationJobStatusRef] AS SELECT SegmentationJobStatusRef.SegmentationJobStatusCode,SegmentationJobStatusRef.SegmentationJobStatusDesc,SegmentationJobStatusRef.SegmentationJobStatusName FROM SegmentationJobStatusRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoSegmentdefinition]'))
    DROP VIEW [dbo].[vBoSegmentdefinition]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoSegmentdefinition] AS SELECT SegmentDefinition.Description,SegmentDefinition.Name,SegmentDefinition.NSelectElements,SegmentDefinition.QueryDocumentKey,SegmentDefinition.UpdatedByUserKey,SegmentDefinition.UpdatedOn,SegmentDefinition.ExecutionOrder,SegmentDefinition.IsJobNSelect,ListMain.MemberObjectType,SegmentDefinition.CreatedByUserKey,SegmentDefinition.CreatedOn,SegmentDefinition.SegmentationJobKey,ListMain.ListKey AS SegmentDefinitionKey FROM ListMain INNER JOIN SegmentDefinition ON ListMain.ListKey = SegmentDefinition.SegmentDefinitionKey

GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoSequenceCounter]'))
    DROP VIEW [dbo].[vBoSequenceCounter]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoSequenceCounter] AS SELECT SequenceCounter.CounterName,SequenceCounter.CurrentValue,SequenceCounter.OrganizationKey,SequenceCounter.SystemEntityKey FROM SequenceCounter
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoShipCarrier]'))
    DROP VIEW [dbo].[vBoShipCarrier]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoShipCarrier] AS SELECT ShipCarrier.Description,ShipCarrier.Name,ShipCarrier.UpdatedByUserKey,ShipCarrier.UpdatedOn,ShipCarrier.CreatedByUserKey,ShipCarrier.CreatedOn,ShipCarrier.ShipCarrierKey,ShipCarrier.SystemEntityKey FROM ShipCarrier
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoShipCharge]'))
    DROP VIEW [dbo].[vBoShipCharge]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoShipCharge] AS SELECT ShipCharge.CreatedByUserKey,ShipCharge.CreatedOn,ShipCharge.ProductKey,ShipCharge.ShipChargeKey,ShipCharge.UpdatedByUserKey,ShipCharge.UpdatedOn,ShipCharge.OrderShipToKey,ShipCharge.IsEstimate,ShipCharge.Charge,ShipCharge.ChargeHome,ShipCharge.IsDiscounted FROM ShipCharge
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoShipment]'))
    DROP VIEW [dbo].[vBoShipment]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoShipment] AS SELECT Shipment.IsShipped,Shipment.IsVirtual,Shipment.OrderKey,Shipment.OrderShipToKey,Shipment.ShipChargeKey,Shipment.ShippedOn,Shipment.TotalTax,Shipment.TrackingId,Shipment.UpdatedByUserKey,Shipment.UpdatedOn,Shipment.ShipCarrierKey,Shipment.MiscChargeKey,Shipment.CreatedByUserKey,Shipment.CreatedOn,Shipment.ShipmentKey,Shipment.SystemEntityKey,Shipment.ShipMethodKey FROM Shipment
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoShipmentLine]'))
    DROP VIEW [dbo].[vBoShipmentLine]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoShipmentLine] AS SELECT ShipmentLine.CreatedByUserKey,ShipmentLine.CreatedOn,ShipmentLine.ShipmentKey,ShipmentLine.ShipmentLineKey,ShipmentLine.OrderFulfillmentLineKey FROM ShipmentLine
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vShipmentReport]'))
    DROP VIEW [dbo].[vShipmentReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vShipmentReport]
AS
/****************************************************************************************
** This view provides all Shipment information for each Shipping on "One Row per Shipment" basis.
** This can be joined to views or tables related to Order Details, Warehouse and other
** relevant sources to get more detailed information..
**
***************************************************************************************/

SELECT  
	S.ShippedOn, S.TrackingId, S.IsShipped, S.IsVirtual, S.TotalTax, SC.Name AS ShipCarrier,
	SM.Name AS ServiceLevelCode, SM.Description AS ServiceLevel, 
	SC.Description AS ShipCarrierDesc, SCG.Charge, SCG.IsEstimate, SCG.IsDiscounted,
	OFL.Quantity, OFL.OrderLineKey, S.ShipmentKey, SHL.ShipmentLineKey, S.OrderKey, S.OrderShipToKey, S.SystemEntityKey


FROM	Shipment 	S 
	INNER JOIN		ShipmentLine 		SHL 	ON S.ShipmentKey = SHL.ShipmentKey 
	LEFT OUTER JOIN	OrderFulfillmentLine 	OFL 	ON SHL.OrderFulfillmentLineKey = OFL.OrderFulfillmentLineKey   								
	LEFT OUTER JOIN	ShipCarrier 		SC 	ON S.ShipCarrierKey = SC.ShipCarrierKey 
	LEFT OUTER JOIN	ShipCharge 		SCG 	ON S.ShipChargeKey = SCG.ShipChargeKey 
	LEFT OUTER JOIN	ShipMethod 		SM	 	ON S.ShipMethodKey = SM.ShipMethodKey

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoShipmentReport]'))
    DROP VIEW [dbo].[vBoShipmentReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoShipmentReport] AS SELECT vShipmentReport.Charge,vShipmentReport.IsDiscounted,vShipmentReport.IsEstimate,vShipmentReport.IsShipped,vShipmentReport.IsVirtual,vShipmentReport.OrderKey,vShipmentReport.OrderShipToKey,vShipmentReport.Quantity,vShipmentReport.ServiceLevel,vShipmentReport.ServiceLevelCode,vShipmentReport.ShipCarrier,vShipmentReport.ShipCarrierDesc,vShipmentReport.ShipmentKey,vShipmentReport.ShippedOn,vShipmentReport.SystemEntityKey,vShipmentReport.TotalTax,vShipmentReport.TrackingId,vShipmentReport.ShipmentLineKey,vShipmentReport.OrderLineKey FROM vShipmentReport
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoShipmentTaxLine]'))
    DROP VIEW [dbo].[vBoShipmentTaxLine]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoShipmentTaxLine] AS SELECT ShipmentTaxLine.CreatedByUserKey,ShipmentTaxLine.CreatedOn,ShipmentTaxLine.OrderLineKey,ShipmentTaxLine.ProductKey,ShipmentTaxLine.ShipmentKey,ShipmentTaxLine.ShipmentTaxLineKey,ShipmentTaxLine.UpdatedByUserKey,ShipmentTaxLine.UpdatedOn,ShipmentTaxLine.TaxableAmount,ShipmentTaxLine.TaxAmount,ShipmentTaxLine.ExemptAmount,ShipmentTaxLine.TaxPlan,ShipmentTaxLine.IsTaxInclusive,ShipmentTaxLine.IsExemptFromIncludedTax FROM ShipmentTaxLine
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoShipMethod]'))
    DROP VIEW [dbo].[vBoShipMethod]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoShipMethod] AS SELECT ShipMethod.CreatedByUserKey,ShipMethod.CreatedOn,ShipMethod.Description,ShipMethod.MaximumCharge,ShipMethod.MinimumCharge,ShipMethod.Name,ShipMethod.PercentOfOrder,ShipMethod.ShipMethodKey,ShipMethod.SystemEntityKey,ShipMethod.UpdatedByUserKey,ShipMethod.UpdatedOn,ShipMethod.VisibleName FROM ShipMethod
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoShipMethodMethodSetDetail]'))
    DROP VIEW [dbo].[vBoShipMethodMethodSetDetail]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoShipMethodMethodSetDetail] AS SELECT ShipMethodMethodSetDetail.MethodSetDetailKey,ShipMethodMethodSetDetail.Priority,ShipMethodMethodSetDetail.ShipMethodKey FROM ShipMethodMethodSetDetail
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoShipMethodSet]'))
    DROP VIEW [dbo].[vBoShipMethodSet]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoShipMethodSet] AS SELECT MethodSet.MethodSetKey,MethodSet.MethodSetName AS Name,MethodSet.MethodSetTypeCode,MethodSet.CreatedByUserKey,MethodSet.CreatedOn,MethodSet.MethodSetDescription AS Description,MethodSet.SystemEntityKey,MethodSet.UpdatedByUserKey,MethodSet.UpdatedOn,MethodSet.IsDefault FROM MethodSet WHERE MethodSetTypeCode=2
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoShipMethodSetDetail]'))
    DROP VIEW [dbo].[vBoShipMethodSetDetail]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoShipMethodSetDetail] AS SELECT MethodSetDetail.IsDefault,MethodSetDetail.MethodSetDetailKey,MethodSetDetail.MethodSetKey,MethodSetDetail.Priority,MethodSetDetail.VisibleName FROM MethodSetDetail
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vShipMethodSetDetails]'))
    DROP VIEW [dbo].[vShipMethodSetDetails]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vShipMethodSetDetails]
AS
SELECT 
TOP 100 PERCENT
sms.MethodSetKey,
smsd.MethodSetDetailKey,
sm.ShipMethodKey,
sm.Name,
smsd.VisibleName,
smsd.Priority,
smsd.IsDefault,
sm.VisibleName AS 'ShipMethodVisibleName'
FROM vBoShipMethodSet sms
INNER JOIN vBoShipMethodSetDetail smsd ON smsd.MethodSetKey = sms.MethodSetKey
INNER JOIN vBoShipMethodMethodSetDetail smmsd ON smmsd.MethodSetDetailKey = smsd.MethodSetDetailKey
INNER JOIN vBoShipMethod sm ON sm.ShipMethodKey = smmsd.ShipMethodKey
ORDER BY sms.MethodSetKey, smsd.Priority

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoShipMethodSetDetailView]'))
    DROP VIEW [dbo].[vBoShipMethodSetDetailView]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoShipMethodSetDetailView] AS SELECT vShipMethodSetDetails.IsDefault,vShipMethodSetDetails.MethodSetDetailKey,vShipMethodSetDetails.MethodSetKey,vShipMethodSetDetails.Priority,vShipMethodSetDetails.ShipMethodKey,vShipMethodSetDetails.ShipMethodVisibleName,vShipMethodSetDetails.VisibleName,vShipMethodSetDetails.Name FROM vShipMethodSetDetails
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vShipMethodValidate]'))
    DROP VIEW [dbo].[vShipMethodValidate]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vShipMethodValidate] AS
	select  sp.ShipPriceKey,  sm.ShipMethodKey ShipMethodKey, sm.Name Method, sm.Description DisplayName, sm.Description Description, sz.Name ShipZone, 
	spr.ShipPriceCode CalType, Charges =
			case 
			when count(*) > 0 then 1
			else 0
		        end
			from  ShipPrice sp
	inner join ShipZone sz on sz.ShipZoneKey=sp.ShipZoneKey
	inner join ShipOrigin so on so.ShipOriginKey=sz.ShipOriginKey
	inner join ShipMethod sm on sp.ShipMethodKey=sm.ShipMethodKey
	inner join ShipPriceRef spr on sp.PricingTypeCode = spr.ShipPriceCode
	where
	so.ShipOriginKey in ( select ParameterValue from SystemConfig where ParameterName='AddOn.Shipping.DefaultShipOriginKey')
	group by  sp.ShipPriceKey, sm.ShipMethodKey,  sm.Name, sm.Description, sm.Description , sz.Name, spr.ShipPriceCode

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoShipMethodValidate]'))
    DROP VIEW [dbo].[vBoShipMethodValidate]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoShipMethodValidate] AS SELECT vShipMethodValidate.CalType,vShipMethodValidate.Charges,vShipMethodValidate.Description,vShipMethodValidate.DisplayName,vShipMethodValidate.Method,vShipMethodValidate.ShipMethodKey,vShipMethodValidate.ShipZone,vShipMethodValidate.ShipPriceKey FROM vShipMethodValidate
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoShipOrigin]'))
    DROP VIEW [dbo].[vBoShipOrigin]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoShipOrigin] AS SELECT ShipOrigin.Description,ShipOrigin.Name,ShipOrigin.UpdatedByUserKey,ShipOrigin.UpdatedOn,ShipOrigin.DefaultCountryCode,ShipOrigin.CreatedByUserKey,ShipOrigin.CreatedOn,ShipOrigin.ShipOriginKey,ShipOrigin.SystemEntityKey FROM ShipOrigin
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoShipPrice]'))
    DROP VIEW [dbo].[vBoShipPrice]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoShipPrice] AS SELECT ShipPrice.CreatedByUserKey,ShipPrice.CreatedOn,ShipPrice.PricingTypeCode,ShipPrice.ShipPriceKey,ShipPrice.ShipZoneKey,ShipPrice.UpdatedByUserKey,ShipPrice.UpdatedOn,ShipPrice.MinAmount,ShipPrice.Price,ShipPrice.ShipMethodKey FROM ShipPrice
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoShipPriceRef]'))
    DROP VIEW [dbo].[vBoShipPriceRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoShipPriceRef] AS SELECT ShipPriceRef.ShipPriceCode,ShipPriceRef.ShipPriceDesc,ShipPriceRef.DisplayPrompt FROM ShipPriceRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoShipZone]'))
    DROP VIEW [dbo].[vBoShipZone]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoShipZone] AS SELECT ShipZone.CountryCode,ShipZone.CreatedByUserKey,ShipZone.CreatedOn,ShipZone.Name,ShipZone.ShipOriginKey,ShipZone.ShipZoneKey,ShipZone.TargetRangeBegin,ShipZone.TargetRangeEnd,ShipZone.UpdatedByUserKey,ShipZone.UpdatedOn FROM ShipZone
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoSoftCreditRelationshipType]'))
    DROP VIEW [dbo].[vBoSoftCreditRelationshipType]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoSoftCreditRelationshipType] AS SELECT SoftCreditRelationshipType.Percentage,SoftCreditRelationshipType.RelationshipTypeKey,SoftCreditRelationshipType.UpdatedByUserKey,SoftCreditRelationshipType.UpdatedOn,SoftCreditRelationshipType.SoftCreditRelationshipKey FROM SoftCreditRelationshipType
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoSolicitation]'))
    DROP VIEW [dbo].[vBoSolicitation]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoSolicitation] AS SELECT SolicitationMain.Description,SolicitationMain.Name,SolicitationMain.UpdatedByUserKey,SolicitationMain.UpdatedOn,SolicitationMain.SolicitationStatusCode,SolicitationMain.CostCollection,SolicitationMain.PredictedResponseRate,SolicitationMain.TargetRevenue,SolicitationMain.TotalRevenue,SolicitationMain.EndDate,SolicitationMain.StartDate,SolicitationMain.ReminderDate,SolicitationMain.AppealKey,SolicitationMain.CreatedByUserKey,SolicitationMain.CreatedOn,SolicitationMain.SolicitationKey,SolicitationMain.AccessKey,SolicitationMain.ActualCost,SolicitationMain.EstimatedCost,SolicitationMain.ExtendedCost,SolicitationMain.FirstResponseDate,SolicitationMain.HighResponseAmount,SolicitationMain.LastResponseDate,SolicitationMain.LowResponseAmount,SolicitationMain.OverheadCost,SolicitationMain.TotalNegativeResponse,SolicitationMain.TotalPositiveResponse,SolicitationMain.TotalSolicited FROM SolicitationMain
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoSolicitationStatusRef]'))
    DROP VIEW [dbo].[vBoSolicitationStatusRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoSolicitationStatusRef] AS SELECT SolicitationStatusRef.SolicitationStatusCode,SolicitationStatusRef.SolicitationStatusDesc,SolicitationStatusRef.SolicitationStatusName FROM SolicitationStatusRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoSourceCode]'))
    DROP VIEW [dbo].[vBoSourceCode]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoSourceCode] AS SELECT ListMain.MemberObjectType,SourceCode.CostCollection,SourceCode.Description,SourceCode.ExternalListCount,SourceCode.Name,SourceCode.PackageKey,SourceCode.PredictedResponseRate,SourceCode.ResponsesTotalledOn,SourceCode.SourceCodeStatusCode,SourceCode.TotalRevenue,SourceCode.UpdatedByUserKey,SourceCode.UpdatedOn,SourceCode.LastDropDate,SourceCode.TotalSolicited,SourceCode.OverheadCost,SourceCode.EstimatedCost,SourceCode.SourceCodeTypeCode,SourceCode.FirstResponseDate,SourceCode.HighResponseAmount,SourceCode.LastResponseDate,SourceCode.LowResponseAmount,SourceCode.ExternalFileName,SourceCode.TotalNegativeResponse,SourceCode.TotalPositiveResponse,SourceCode.TargetRevenue,SourceCode.Code,SourceCode.CreatedByUserKey,SourceCode.CreatedOn,SourceCode.SolicitationKey,SourceCode.SourceCodeKey,SourceCode.AccessKey FROM SourceCode
	INNER JOIN ListMain
		ON SourceCode.SourceCodeKey = ListMain.ListKey
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoSourceCodeStatusRef]'))
    DROP VIEW [dbo].[vBoSourceCodeStatusRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoSourceCodeStatusRef] AS SELECT SourceCodeStatusRef.SourceCodeStatusCode,SourceCodeStatusRef.SourceCodeStatusDesc,SourceCodeStatusRef.SourceCodeStatusName FROM SourceCodeStatusRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoSourceCodeTypeRef]'))
    DROP VIEW [dbo].[vBoSourceCodeTypeRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoSourceCodeTypeRef] AS SELECT SourceCodeTypeRef.SourceCodeTypeCode,SourceCodeTypeRef.SourceCodeTypeDesc,SourceCodeTypeRef.SourceCodeTypeName FROM SourceCodeTypeRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoSourceLineOrderPromotion]'))
    DROP VIEW [dbo].[vBoSourceLineOrderPromotion]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoSourceLineOrderPromotion] AS SELECT SourceLineOrderPromotion.SourceLineOrderPromotionKey,SourceLineOrderPromotion.OrderPromotionKey,SourceLineOrderPromotion.OrderLineKey,SourceLineOrderPromotion.IsRecorded,SourceLineOrderPromotion.CreatedOn,SourceLineOrderPromotion.CreatedByUserKey,SourceLineOrderPromotion.UpdatedOn,SourceLineOrderPromotion.UpdatedByUserKey FROM SourceLineOrderPromotion
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoSourceList]'))
    DROP VIEW [dbo].[vBoSourceList]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoSourceList] AS SELECT SolicitationSource.SolicitationSourceKey,SolicitationSource.UpdatedByUserKey,SolicitationSource.UpdatedOn,SolicitationSource.DisplayText,SolicitationSource.NavigationHint,SolicitationSource.OriginListType,SolicitationSource.OriginListKeys,SolicitationSource.SelectorComponentKey,SolicitationSource.CreatedByUserKey,SolicitationSource.CreatedOn,SolicitationSource.SourceCodeKey FROM SolicitationSource
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoStandardPage]'))
    DROP VIEW [dbo].[vBoStandardPage]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoStandardPage] AS SELECT StandardPageRef.StandardPageCode,StandardPageRef.StandardPageDesc AS Description,StandardPageRef.StandardPageUrl AS Url FROM StandardPageRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoStateProvinceCodes]'))
    DROP VIEW [dbo].[vBoStateProvinceCodes]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoStateProvinceCodes] AS SELECT State_Codes.STATE_PROVINCE AS StateProvince,State_Codes.TITLE AS Title FROM State_Codes

GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoStateProvinceRef]'))
    DROP VIEW [dbo].[vBoStateProvinceRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoStateProvinceRef] AS SELECT StateProvinceRef.CountryCode,StateProvinceRef.ChapterGroupKey,StateProvinceRef.IsActive,StateProvinceRef.IsHandModified,StateProvinceRef.UpdatedByUserKey,StateProvinceRef.UpdatedOn,StateProvinceRef.StateProvinceCode AS Code,StateProvinceRef.StateProvinceDesc AS Description FROM StateProvinceRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vStoreFeaturedProducts]'))
    DROP VIEW [dbo].[vStoreFeaturedProducts]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vStoreFeaturedProducts] AS
    
    SELECT op.[OrderProductID],
           op.[ProductCode],
           op.[Title],
           CONVERT(varchar(max),op.[Description]) [Description],
           op.[IsSuperProduct],
           op.[SellOnWeb]
      FROM [dbo].[OrderProductCategoryLookup] opcl
           INNER JOIN [dbo].[OrderProduct] op ON opcl.[OrderProductID] = op.[OrderProductID]
     WHERE opcl.[IsFeatured] = 1
           AND op.[SellOnWeb] != 0
           AND op.[IsSuperProduct] = 1

UNION       

    SELECT op.[OrderProductID],
           op.[ProductCode],
           p.[TITLE] [Title],
           CONVERT(varchar(max),
               CASE
                   WHEN (p.[WEB_DESC] LIKE '' OR p.[WEB_DESC] IS NULL) THEN p.[DESCRIPTION]
                   ELSE p.[WEB_DESC]
               END) [Description], 
           op.[IsSuperProduct],
           p.[WEB_OPTION] [SellOnWeb]
      FROM [dbo].[OrderProductCategoryLookup] opcl
           INNER JOIN [dbo].[OrderProduct] op ON opcl.[OrderProductID] = op.[OrderProductID]
           INNER JOIN [dbo].[Product] p ON p.[PRODUCT_CODE] = op.[ProductCode]
     WHERE opcl.[IsFeatured] = 1
           AND p.[WEB_OPTION] != 0
           AND op.[IsSuperProduct] = 0

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoStoreFeaturedProducts]'))
    DROP VIEW [dbo].[vBoStoreFeaturedProducts]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoStoreFeaturedProducts] AS SELECT vStoreFeaturedProducts.Description,vStoreFeaturedProducts.IsSuperProduct,vStoreFeaturedProducts.OrderProductID,vStoreFeaturedProducts.ProductCode,vStoreFeaturedProducts.SellOnWeb,vStoreFeaturedProducts.Title FROM vStoreFeaturedProducts
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoSuffixRef]'))
    DROP VIEW [dbo].[vBoSuffixRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoSuffixRef] AS SELECT SuffixRef.SuffixCode AS Code,SuffixRef.SuffixDesc AS Description,SuffixRef.SyncSuffixCode,SuffixRef.SuffixKey FROM SuffixRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSummaryGLTransactionLine]'))
    DROP VIEW [dbo].[vSummaryGLTransactionLine]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vSummaryGLTransactionLine]
AS
SELECT     m.*, l.GLTransactionLineKey AS 'GLTransactionLineKey', l.Amount AS 'Amount', CASE WHEN Amount >= 0 THEN Amount END AS 'Debit', 
                      CASE WHEN Amount < 0 THEN - 1 * Amount END AS 'Credit', l.GLAccountKey AS 'GLAccountKey', l.Description AS 'LineDescription', 
                      l.GLEntryType AS 'GLEntryType', l.InvoiceLineKey AS 'InvoiceLineKey', l.PaymentKey AS 'LinePaymentKey', l.ContactKey AS 'LineContactKey', 
                      l.ProductKey AS 'ProductKey', l.TransactionSequenceNumber AS 'TransactionSequenceNumber'
FROM         GLTransactionMain m JOIN
                      GLTransactionLine l ON l.GLTransactionKey = m.GLTransactionKey

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoSummaryGLTransactionLine]'))
    DROP VIEW [dbo].[vBoSummaryGLTransactionLine]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoSummaryGLTransactionLine] AS SELECT vSummaryGLTransactionLine.Amount,vSummaryGLTransactionLine.ContactKey,vSummaryGLTransactionLine.CreatedOn,vSummaryGLTransactionLine.Credit,vSummaryGLTransactionLine.Debit,vSummaryGLTransactionLine.Description,vSummaryGLTransactionLine.ExportedOn,vSummaryGLTransactionLine.FinalBatchNumber,vSummaryGLTransactionLine.FinancialEntityKey,vSummaryGLTransactionLine.FiscalPeriod,vSummaryGLTransactionLine.GLAccountKey,vSummaryGLTransactionLine.GLEntryType,vSummaryGLTransactionLine.GLTransactionKey,vSummaryGLTransactionLine.GLTransactionLineKey,vSummaryGLTransactionLine.InvoiceKey,vSummaryGLTransactionLine.InvoiceLineKey,vSummaryGLTransactionLine.JournalEntryTypeCode,vSummaryGLTransactionLine.LineContactKey,vSummaryGLTransactionLine.LineDescription,vSummaryGLTransactionLine.LinePaymentKey,vSummaryGLTransactionLine.OriginatingBatchNumber,vSummaryGLTransactionLine.PaymentKey,vSummaryGLTransactionLine.ProductKey,vSummaryGLTransactionLine.TransactionDate,vSummaryGLTransactionLine.TransactionSequenceNumber FROM vSummaryGLTransactionLine
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSummaryInvoicePayment]'))
    DROP VIEW [dbo].[vSummaryInvoicePayment]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vSummaryInvoicePayment]
AS
SELECT PM.PaymentKey, sum(MA.Amount) as 'Amount', max(PM.PaymentDate) as 'PaymentDate', 
	max(PM.CurrencyCode) as 'CurrencyCode',
	IM.InvoiceKey, max(IM.InvoiceNumber) as 'InvoiceNumber', 
	max(IM.OrderNumber) AS 'InvOrderNumber',
	max(PMTH.PaymentMethodName) as 'PaymentMethod',
	max(CM.FullName) AS 'Payor',
	max(PM.SummaryDisplay) AS 'Summary',
	PaymentReferenceData = CASE WHEN max(PM.PaymentReferenceData) is null or max(PM.PaymentReferenceData) = '' THEN max(PM.SummaryDisplay) ELSE max(PM.PaymentReferenceData) END

FROM MonetaryApplication MA 
	INNER JOIN	PaymentMain PM 	ON 	PM.PaymentKey = MA.SrcPaymentKey 
	INNER JOIN 	InvoiceMain IM 		ON 	MA.InvoiceKey = IM.InvoiceKey 
	INNER JOIN	ContactMain CM ON PM.PayorContactKey = CM.ContactKey
	INNER JOIN	PaymentMethod PMTH ON PM.PaymentMethodKey = PMTH.PaymentMethodKey
GROUP BY PM.PaymentKey, IM.InvoiceKey

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoSummaryInvoicePayment]'))
    DROP VIEW [dbo].[vBoSummaryInvoicePayment]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoSummaryInvoicePayment] AS SELECT vSummaryInvoicePayment.Amount,vSummaryInvoicePayment.CurrencyCode,vSummaryInvoicePayment.InvoiceKey,vSummaryInvoicePayment.InvoiceNumber,vSummaryInvoicePayment.InvOrderNumber,vSummaryInvoicePayment.PaymentDate,vSummaryInvoicePayment.PaymentKey,vSummaryInvoicePayment.Payor,vSummaryInvoicePayment.Summary,vSummaryInvoicePayment.PaymentReferenceData,vSummaryInvoicePayment.PaymentMethod FROM vSummaryInvoicePayment
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSummaryPaymentScheduleLine]'))
    DROP VIEW [dbo].[vSummaryPaymentScheduleLine]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vSummaryPaymentScheduleLine] AS
select  i.InvoiceKey, i.InvoiceNumber, psl.PaymentNumber, max(psl.DueDate) as 'DueDate', sum(psl.AmountDue) as 'AmountDue', sum(psl.OutstandingBalance) as 'OutstandingBalance', 
   sum(psl.AmountDue) -  sum(psl.OutstandingBalance) as 'AmountPaid'
from InvoiceMain i
 join PaymentScheduleLine psl on psl.InvoiceKey = i.InvoiceKey
 group by i.InvoiceNumber, i.InvoiceKey, psl.PaymentNumber

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoSummaryPaymentScheduleLine]'))
    DROP VIEW [dbo].[vBoSummaryPaymentScheduleLine]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoSummaryPaymentScheduleLine] AS SELECT vSummaryPaymentScheduleLine.AmountDue,vSummaryPaymentScheduleLine.AmountPaid,vSummaryPaymentScheduleLine.DueDate,vSummaryPaymentScheduleLine.InvoiceKey,vSummaryPaymentScheduleLine.InvoiceNumber,vSummaryPaymentScheduleLine.OutstandingBalance,vSummaryPaymentScheduleLine.PaymentNumber FROM vSummaryPaymentScheduleLine
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoSupplement]'))
    DROP VIEW [dbo].[vBoSupplement]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoSupplement] AS SELECT SupplementMain.Description,SupplementMain.Name,SupplementMain.UpdatedByUserKey,SupplementMain.UpdatedOn,SupplementMain.SupplementStatusCode,SupplementMain.Cost,SupplementMain.CostCollection,SupplementMain.CreatedByUserKey,SupplementMain.CreatedOn,SupplementMain.SupplementKey,SupplementMain.SystemEntityKey,SupplementMain.NotificationGroupKey,SupplementMain.SupplementTypeKey,SupplementMain.DocumentVersionKey,SupplementMain.AccessKey FROM SupplementMain
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoSupplementStatusRef]'))
    DROP VIEW [dbo].[vBoSupplementStatusRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoSupplementStatusRef] AS SELECT SupplementStatusRef.SupplementStatusCode,SupplementStatusRef.SupplementStatusDesc,SupplementStatusRef.SupplementStatusName FROM SupplementStatusRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoSupplementTypeRef]'))
    DROP VIEW [dbo].[vBoSupplementTypeRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoSupplementTypeRef] AS SELECT SupplementTypeRef.SupplementTypeDesc AS Description,SupplementTypeRef.SupplementTypeKey,SupplementTypeRef.IsEnclosure FROM SupplementTypeRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSystemConfigParameterDefinition]'))
    DROP VIEW [dbo].[vSystemConfigParameterDefinition]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vSystemConfigParameterDefinition] AS
SELECT SystemConfigParameterRef.ParameterName,
		SystemConfigParameterRef.SystemKeyword, 
		SystemConfigParameterRef.Description,
		SystemConfigParameterRef.DefaultParameterValue,
		SystemConfigPageParameterRef.SortOrder,
		PropertyDefinition.PropertyDefinitionKey,
		PropertyDefinition.Label,
		PropertyDefinition.DataTypeCode,
		PropertyDefinition.MaxLength,
		PropertyDefinition.Scale,
		PropertyDefinition.HIControlTypeCode,
		PropertyDefinition.HIControlHeight,
		PropertyDefinition.HIControlWidth,
		PropertyDefinition.HIControlRepeatColumns,
		PropertyDefinition.HIControlRepeatDirection,
		PropertyDefinition.AllowMultiSelectFlag,
		PropertyDefinition.IsRequired,
		PropertyDefinition.DisplayMask,
		PropertyDefinition.ValueList,
		PropertyDefinition.ValueListQueryDocumentVersionKey,
		PropertyDefinition.ValueListQueryFolder,
		PropertyDefinition.ValueListQueryDisplayColumn,
		PropertyDefinition.ValueListQueryPersistColumn,
		SystemConfigPageRef.SystemConfigPageKey,
		SystemConfigPageRef.SystemConfigPageName,
		SystemConfigPageRef.SystemConfigPageDesc,
		SystemEntity.SystemEntityKey,
		SystemEntity.OrganizationKey,
		SystemEntity.IsDefault
   FROM SystemConfigParameterRef
		INNER JOIN PropertyDefinition
			ON PropertyDefinition.PropertyDefinitionKey = SystemConfigParameterRef.PropertyDefinitionKey
		INNER JOIN SystemConfigPageParameterRef
			ON SystemConfigPageParameterRef.ParameterName = SystemConfigParameterRef.ParameterName
		INNER JOIN SystemConfigPageRef
			ON SystemConfigPageRef.SystemConfigPageKey = SystemConfigPageParameterRef.SystemConfigPageKey
		INNER JOIN SystemEntity
			ON SystemEntity.SystemKeyword = SystemConfigParameterRef.SystemKeyword

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoSystemConfigParameterValue]'))
    DROP VIEW [dbo].[vBoSystemConfigParameterValue]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoSystemConfigParameterValue] AS SELECT SystemConfig.ParameterName,SystemConfig.ParameterValue,SystemConfig.Description,SystemConfig.CreatedByUserKey,SystemConfig.CreatedOn,SystemConfig.OrganizationKey,SystemConfig.SystemConfigKey AS SystemParamKey,SystemConfig.SystemEntityKey,SystemConfig.UpdatedByUserKey,SystemConfig.UpdatedOn,vSystemConfigParameterDefinition.AllowMultiSelectFlag,vSystemConfigParameterDefinition.DataTypeCode,vSystemConfigParameterDefinition.DefaultParameterValue,vSystemConfigParameterDefinition.Description AS Description_1,vSystemConfigParameterDefinition.DisplayMask,vSystemConfigParameterDefinition.HIControlHeight,vSystemConfigParameterDefinition.HIControlRepeatColumns,vSystemConfigParameterDefinition.HIControlRepeatDirection,vSystemConfigParameterDefinition.HIControlTypeCode,vSystemConfigParameterDefinition.HIControlWidth,vSystemConfigParameterDefinition.Label,vSystemConfigParameterDefinition.MaxLength,vSystemConfigParameterDefinition.OrganizationKey AS OrganizationKey_1,vSystemConfigParameterDefinition.ParameterName AS ParameterName_1,vSystemConfigParameterDefinition.PropertyDefinitionKey,vSystemConfigParameterDefinition.Scale,vSystemConfigParameterDefinition.SystemConfigPageDesc,vSystemConfigParameterDefinition.SystemConfigPageKey,vSystemConfigParameterDefinition.SystemConfigPageName,vSystemConfigParameterDefinition.SystemEntityKey AS SystemEntityKey_1,vSystemConfigParameterDefinition.SystemKeyword,vSystemConfigParameterDefinition.ValueList,vSystemConfigParameterDefinition.ValueListQueryDisplayColumn,vSystemConfigParameterDefinition.ValueListQueryDocumentVersionKey,vSystemConfigParameterDefinition.ValueListQueryFolder,vSystemConfigParameterDefinition.ValueListQueryPersistColumn,vSystemConfigParameterDefinition.IsDefault,vSystemConfigParameterDefinition.SortOrder,vSystemConfigParameterDefinition.IsRequired FROM vSystemConfigParameterDefinition
	INNER JOIN SystemConfig
		ON vSystemConfigParameterDefinition.SystemEntityKey = SystemConfig.SystemEntityKey
		AND vSystemConfigParameterDefinition.ParameterName = SystemConfig.ParameterName
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoSystemEntity]'))
    DROP VIEW [dbo].[vBoSystemEntity]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoSystemEntity] AS SELECT SystemEntity.Description,SystemEntity.IsActive,SystemEntity.IsDefault,SystemEntity.Name,SystemEntity.SystemKeyword,SystemEntity.UpdatedByUserKey,SystemEntity.UpdatedOn,SystemEntity.ApplicationAccessKey,SystemEntity.AccessKey,SystemEntity.CreatedByUserKey,SystemEntity.CreatedOn,SystemEntity.OrganizationKey,SystemEntity.SystemEntityKey FROM SystemEntity
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoSystemParam]'))
    DROP VIEW [dbo].[vBoSystemParam]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoSystemParam] AS SELECT SystemConfig.ParameterName,SystemConfig.ParameterValue,SystemConfig.Description,SystemConfig.CreatedByUserKey,SystemConfig.CreatedOn,SystemConfig.OrganizationKey,SystemConfig.SystemConfigKey AS SystemParamKey,SystemConfig.SystemEntityKey,SystemConfig.UpdatedByUserKey,SystemConfig.UpdatedOn FROM SystemConfig
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoTag]'))
    DROP VIEW [dbo].[vBoTag]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoTag] AS SELECT Tag.AccessKey,Tag.AssignAccessKey,Tag.CreatedByUserKey,Tag.CreatedOn,Tag.TagDescription AS Description,Tag.TagKey,Tag.TagName AS Name,Tag.UpdatedByUserKey,Tag.UpdatedOn,Tag.IsCategory,Tag.TagAliasList FROM Tag
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoTagHierarchy]'))
    DROP VIEW [dbo].[vBoTagHierarchy]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoTagHierarchy] AS SELECT Hierarchy.Depth,Hierarchy.HierarchyCode,Hierarchy.HierarchyKey,Hierarchy.IsChildAMemberOfParent,Hierarchy.ParentHierarchyKey,Hierarchy.RootHierarchyKey,Hierarchy.SortOrder,Hierarchy.UniformKey,Hierarchy.UniformType,Tag.AccessKey,Tag.AssignAccessKey,Tag.TagKey,Tag.TagName,Tag.CreatedByUserKey,Tag.CreatedOn,Tag.TagDescription,Tag.UpdatedByUserKey,Tag.UpdatedOn,Tag.IsCategory,Tag.TagAliasList FROM Hierarchy
	INNER JOIN Tag
		ON Hierarchy.UniformKey = Tag.TagKey
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoTagRelatedName]'))
    DROP VIEW [dbo].[vBoTagRelatedName]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoTagRelatedName] AS SELECT TagRelatedName.RelatedName,TagRelatedName.TagKey,TagRelatedName.TagRelationshipTypeCode FROM TagRelatedName
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoTagRelationship]'))
    DROP VIEW [dbo].[vBoTagRelationship]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoTagRelationship] AS SELECT TagRelationship.SubjectTagKey,TagRelationship.TagRelationshipKey,TagRelationship.TagRelationshipTypeCode,TagRelationship.TargetTagKey FROM TagRelationship
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoTagRelationshipType]'))
    DROP VIEW [dbo].[vBoTagRelationshipType]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoTagRelationshipType] AS SELECT TagRelationshipTypeRef.TagRelationshipTypeDesc AS Description,TagRelationshipTypeRef.TagRelationshipTypeName AS Name,TagRelationshipTypeRef.ReciprocalTagRelationshipTypeCode AS ReciprocalCode,TagRelationshipTypeRef.TagRelationshipTypeCode AS Code FROM TagRelationshipTypeRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoTask]'))
    DROP VIEW [dbo].[vBoTask]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoTask] AS SELECT TaskMain.AccessKey,TaskMain.Comments,TaskMain.CreatedByUserKey,TaskMain.CreatedOn,TaskMain.Subject,TaskMain.TaskKey,TaskMain.TaskStatusCode,TaskMain.TaskStatusDate AS StatusDate,TaskMain.TaskTypeCode,TaskMain.UpdatedByUserKey,TaskMain.UpdatedOn,TaskMain.WorkflowInstanceKey,TaskMain.AssigneeKey,TaskMain.AssigneeGroupKey,TaskMain.AssigneeUserKey,TaskMain.CompletedByUserKey,TaskMain.CompletedOn,TaskMain.DueDate,TaskMain.StartDate,TaskMain.TaskPriorityCode FROM TaskMain
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoTaskItem]'))
    DROP VIEW [dbo].[vBoTaskItem]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoTaskItem] AS SELECT TaskItem.Category,TaskItem.CompletedByUserKey,TaskItem.CompletedOn,TaskItem.DueDate,TaskItem.Priority,TaskItem.StartDate,TaskItem.StatusDate,TaskItem.Subject,TaskItem.UpdatedByUserKey,TaskItem.UpdatedOn,TaskItem.Comment,TaskItem.IsGroupTask,TaskItem.AssignedToKey,TaskItem.TaskItemStatusCode,TaskItem.NotifyCreatorCode,TaskItem.AccessKey,TaskItem.CreatedByUserKey,TaskItem.CreatedOn,TaskItem.TaskItemKey,TaskItem.OpportunityKey FROM TaskItem
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoTaskItemStatusRef]'))
    DROP VIEW [dbo].[vBoTaskItemStatusRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoTaskItemStatusRef] AS SELECT TaskItemStatusRef.TaskItemStatusDesc,TaskItemStatusRef.TaskItemStatusName,TaskItemStatusRef.TaskItemStatusCode FROM TaskItemStatusRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoTaskNotifyCreatorRef]'))
    DROP VIEW [dbo].[vBoTaskNotifyCreatorRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoTaskNotifyCreatorRef] AS SELECT TaskNotifyCreatorRef.TaskNotifyCreatorCode,TaskNotifyCreatorRef.TaskNotifyCreatorDesc,TaskNotifyCreatorRef.TaskNotifyCreatorName FROM TaskNotifyCreatorRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoTaskPriority]'))
    DROP VIEW [dbo].[vBoTaskPriority]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoTaskPriority] AS SELECT TaskPriorityRef.TaskPriorityCode,TaskPriorityRef.TaskPriorityDesc,TaskPriorityRef.TaskPriorityName FROM TaskPriorityRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoTaskStatus]'))
    DROP VIEW [dbo].[vBoTaskStatus]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoTaskStatus] AS SELECT TaskStatusRef.TaskStatusCode AS Code,TaskStatusRef.TaskStatusName AS Name,TaskStatusRef.TaskStatusDesc AS Description,TaskStatusRef.IsComplete FROM TaskStatusRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoTaskType]'))
    DROP VIEW [dbo].[vBoTaskType]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoTaskType] AS SELECT TaskTypeRef.TaskTypeCode AS Code,TaskTypeRef.TaskTypeName AS Name,TaskTypeRef.TaskTypeDesc AS Description FROM TaskTypeRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vTaxationReport]'))
    DROP VIEW [dbo].[vTaxationReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
/****** Object:  View dbo.vTaxationReport    Script Date: 3/22/2004 3:49:06 PM *****

*/
CREATE VIEW [dbo].[vTaxationReport]
AS
SELECT     TOP 100 PERCENT ta.Name AS Authority, ta.AuthorityCode, tc.Name AS Category, o.OrderNumber, stl.TaxableAmount, stl.ExemptAmount, 
                      stl.TaxAmount AS Tax, stl.IsTaxInclusive, stl.IsExemptFromIncludedTax, tac.TaxRate, tac.TaxRate2, tac.MaxAmount AS Cutoff, tac.CombineRatesFlag, 
                      stl.TaxPlan, ta.TaxAuthorityKey, tc.TaxCategoryKey, o.OrderKey
FROM         dbo.ShipmentTaxLine stl INNER JOIN
                      dbo.Shipment s ON s.ShipmentKey = stl.ShipmentKey INNER JOIN
                      dbo.OrderMain o ON s.OrderKey = o.OrderKey INNER JOIN
                      dbo.ProductTax pt ON stl.ProductKey = pt.ProductKey INNER JOIN
                      dbo.TaxAuthority ta ON pt.TaxAuthorityKey = ta.TaxAuthorityKey INNER JOIN
                      dbo.TaxCategory tc ON pt.TaxCategoryKey = tc.TaxCategoryKey INNER JOIN
                      dbo.TaxAuthorityCategory tac ON pt.TaxAuthorityKey = tac.TaxAuthorityKey AND pt.TaxCategoryKey = tac.TaxCategoryKey
WHERE     (o.OrderDate BETWEEN tac.StartDate AND tac.EndDate)
ORDER BY ta.Name, tc.Name, o.OrderNumber

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoTaxationReport]'))
    DROP VIEW [dbo].[vBoTaxationReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoTaxationReport] AS SELECT vTaxationReport.Authority,vTaxationReport.AuthorityCode,vTaxationReport.Category,vTaxationReport.CombineRatesFlag,vTaxationReport.Cutoff,vTaxationReport.ExemptAmount,vTaxationReport.IsExemptFromIncludedTax,vTaxationReport.IsTaxInclusive,vTaxationReport.OrderKey,vTaxationReport.OrderNumber,vTaxationReport.Tax,vTaxationReport.TaxableAmount,vTaxationReport.TaxAuthorityKey,vTaxationReport.TaxCategoryKey,vTaxationReport.TaxPlan,vTaxationReport.TaxRate,vTaxationReport.TaxRate2 FROM vTaxationReport
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoTaxAuthority]'))
    DROP VIEW [dbo].[vBoTaxAuthority]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoTaxAuthority] AS SELECT TaxAuthority.Description,TaxAuthority.Name,TaxAuthority.UpdatedByUserKey,TaxAuthority.UpdatedOn,TaxAuthority.AuthorityCode,TaxAuthority.CreatedByUserKey,TaxAuthority.CreatedOn,TaxAuthority.SystemEntityKey,TaxAuthority.TaxAuthorityKey,TaxAuthority.TaxAuthorityLevelKey FROM TaxAuthority
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoTaxAuthorityCategory]'))
    DROP VIEW [dbo].[vBoTaxAuthorityCategory]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoTaxAuthorityCategory] AS SELECT TaxAuthorityCategory.TaxAuthorityCategoryKey,TaxAuthorityCategory.TaxAuthorityKey,TaxAuthorityCategory.TaxCategoryKey,TaxAuthorityCategory.TaxRate,TaxAuthorityCategory.UpdatedByUserKey,TaxAuthorityCategory.UpdatedOn,TaxAuthorityCategory.MaxAmount,TaxAuthorityCategory.TaxRate2,TaxAuthorityCategory.QualifiesForExemptionFlag,TaxAuthorityCategory.EndDate,TaxAuthorityCategory.StartDate,TaxAuthorityCategory.CreatedByUserKey,TaxAuthorityCategory.CreatedOn,TaxAuthorityCategory.CombineRatesFlag,TaxAuthorityCategory.IsExemptFromIncludedTax,TaxAuthorityCategory.IsTaxInclusive,TaxAuthorityCategory.IsPerItem FROM TaxAuthorityCategory
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoTaxAuthorityFinancialEntity]'))
    DROP VIEW [dbo].[vBoTaxAuthorityFinancialEntity]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoTaxAuthorityFinancialEntity] AS SELECT TaxAuthorityFinancialEntity.CreatedByUserKey,TaxAuthorityFinancialEntity.CreatedOn,TaxAuthorityFinancialEntity.FinancialEntityKey,TaxAuthorityFinancialEntity.TaxAuthorityFinancialEntityKey,TaxAuthorityFinancialEntity.TaxAuthorityKey,TaxAuthorityFinancialEntity.UpdatedByUserKey,TaxAuthorityFinancialEntity.UpdatedOn,TaxAuthorityFinancialEntity.TaxLiabilityGLAccountKey,TaxAuthorityFinancialEntity.TaxRegistrationID FROM TaxAuthorityFinancialEntity
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoTaxAuthorityLevelRef]'))
    DROP VIEW [dbo].[vBoTaxAuthorityLevelRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoTaxAuthorityLevelRef] AS SELECT TaxAuthorityLevelRef.TaxAuthorityLevelDesc AS Description,TaxAuthorityLevelRef.TaxAuthorityLevelCode AS Code,TaxAuthorityLevelRef.TaxAuthorityLevelKey FROM TaxAuthorityLevelRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoTaxCategory]'))
    DROP VIEW [dbo].[vBoTaxCategory]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoTaxCategory] AS SELECT TaxCategory.Description,TaxCategory.UpdatedByUserKey,TaxCategory.UpdatedOn,TaxCategory.CreatedByUserKey,TaxCategory.CreatedOn,TaxCategory.SystemEntityKey,TaxCategory.TaxCategoryKey,TaxCategory.Name FROM TaxCategory
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoTaxExemptionInfo]'))
    DROP VIEW [dbo].[vBoTaxExemptionInfo]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoTaxExemptionInfo] AS SELECT TaxExemptionInfo.Reason,TaxExemptionInfo.RegistrationCode,TaxExemptionInfo.TaxExemptionInfoKey,TaxExemptionInfo.UpdatedByUserKey,TaxExemptionInfo.UpdatedOn,TaxExemptionInfo.CreatedByUserKey,TaxExemptionInfo.CreatedOn,TaxExemptionInfo.EndDate,TaxExemptionInfo.StartDate,TaxExemptionInfo.ContactKey,TaxExemptionInfo.ExemptTaxAuthorityKey FROM TaxExemptionInfo
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoTaxSchedule]'))
    DROP VIEW [dbo].[vBoTaxSchedule]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoTaxSchedule] AS SELECT TaxSchedule.Description,TaxSchedule.Name,TaxSchedule.UpdatedByUserKey,TaxSchedule.UpdatedOn,TaxSchedule.CreatedByUserKey,TaxSchedule.CreatedOn,TaxSchedule.SystemEntityKey,TaxSchedule.TaxScheduleKey FROM TaxSchedule
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoTaxScheduleAuthority]'))
    DROP VIEW [dbo].[vBoTaxScheduleAuthority]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoTaxScheduleAuthority] AS SELECT TaxScheduleAuthority.TaxAuthorityKey,TaxScheduleAuthority.TaxScheduleAuthorityKey,TaxScheduleAuthority.TaxScheduleKey,TaxScheduleAuthority.UpdatedByUserKey,TaxScheduleAuthority.UpdatedOn,TaxScheduleAuthority.CreatedByUserKey,TaxScheduleAuthority.CreatedOn,TaxScheduleAuthority.IsTaxable FROM TaxScheduleAuthority
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoTimeZoneRef]'))
    DROP VIEW [dbo].[vBoTimeZoneRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoTimeZoneRef] AS SELECT TimeZoneRef.GMTOffsetMinutes,TimeZoneRef.IsActive,TimeZoneRef.IsDaylightSaving,TimeZoneRef.IsHandModified,TimeZoneRef.TimeZoneDesc AS Description,TimeZoneRef.TimeZoneKey,TimeZoneRef.UpdatedByUserKey,TimeZoneRef.UpdatedOn FROM TimeZoneRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vTrialBalanceReport]'))
    DROP VIEW [dbo].[vTrialBalanceReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vTrialBalanceReport]
AS
SELECT  Distinct
	  IM.InvoiceKey, IM.InvoiceNumber, IM.BillToContactKey, IM.FinancialEntityKey, IM.Notes, IM.InvoiceDate, IM.AccountingMethodCode, 
                IM.InvoiceTypeCode, ITR.InvoiceTypeDesc, IM.CurrencyCode, IM.CurrencyConversionRate, IM.PurchaseOrderNumber, IL.InvoiceLineKey, 
                IL.InvoiceLineNumber, PrM.ProductCode, IL.QuantitySold, IL.UnitPrice, IL.PayPriority, PrT.Name as 'ProductType', 
                IL.ExtendedPrice, IL.ExtendedPriceHome, IL.ParentInvoiceLineKey, BCM.FullName AS BillToName, BCM.ID AS BillToId, PT.PaymentTermsKey, 
                PT.PaymentTermsName, PT.PaymentTermsDescription, PT.EarlyDiscountDays, PT.EarlyDiscountPercent, FE.Name AS FinancialEntity, 
                BAM.FormattedAddress AS BillToAddress, PM.PaymentKey, PM.PaymentDate, PM.Amount AS PmtAmount, PM.AmountHome AS PmtAmountHome, 
                PM.CurrencyCode AS PmtCurrencyCode, ATU.FullAddressText FinEntityAddress,
	   PSL.PaymentNumber, PSL.DueDate, PSL.AmountDue, PSL.OutstandingBalance, 
	  IDN.ARGLAccountKey, GA.GLAccountCode, GA.Description GLAccountName
FROM      InvoiceMain IM LEFT OUTER JOIN
                InvoiceLine IL ON IM.InvoiceKey = IL.InvoiceKey LEFT OUTER JOIN
                ContactMain BCM ON IM.BillToContactKey = BCM.ContactKey LEFT OUTER JOIN
                ContactAddress BCA ON IM.BillToContactKey = BCA.ContactKey LEFT OUTER JOIN
                InvoiceTypeRef ITR ON IM.InvoiceTypeCode = ITR.InvoiceTypeCode LEFT OUTER JOIN
                FinancialEntity FE ON IM.FinancialEntityKey = FE.FinancialEntityKey LEFT OUTER JOIN
                PaymentTerms PT ON IM.PaymentTermsKey = PT.PaymentTermsKey LEFT OUTER JOIN
                MonetaryApplication MA ON IM.InvoiceKey = MA.InvoiceKey LEFT OUTER JOIN
	  PaymentMain PM ON MA.SrcPaymentKey = PM.PaymentKey LEFT OUTER JOIN
               AddressMain BAM ON BCA.AddressKey = BAM.AddressKey AND BAM.IsPhysicalAddress = 1 LEFT OUTER JOIN
	  AddressToUse ATU ON FE.ContactKey = ATU.ContactKey LEFT OUTER JOIN
	  PaymentScheduleLine PSL ON IM.InvoiceKey = PSL.InvoiceKey LEFT OUTER JOIN
	  InvoiceDistribution IDN ON IM.InvoiceKey = IDN.InvoiceKey LEFT OUTER JOIN
	  GLAccount GA ON IDN.ARGLAccountKey = GA.GLAccountKey LEFT OUTER JOIN
	  ProductMain PrM on PrM.ProductKey = IL.ProductKey LEFT OUTER JOIN
	  ProductType PrT on PrT.ProductTypeKey = PrM.ProductTypeKey

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoTrialBalanceReport]'))
    DROP VIEW [dbo].[vBoTrialBalanceReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoTrialBalanceReport] AS SELECT vTrialBalanceReport.AmountDue,vTrialBalanceReport.BillToAddress,vTrialBalanceReport.BillToContactKey,vTrialBalanceReport.BillToId,vTrialBalanceReport.BillToName,vTrialBalanceReport.CurrencyCode,vTrialBalanceReport.CurrencyConversionRate,vTrialBalanceReport.EarlyDiscountDays,vTrialBalanceReport.EarlyDiscountPercent,vTrialBalanceReport.ExtendedPrice,vTrialBalanceReport.ExtendedPriceHome,vTrialBalanceReport.FinancialEntity,vTrialBalanceReport.FinancialEntityKey,vTrialBalanceReport.FinEntityAddress,vTrialBalanceReport.InvoiceDate,vTrialBalanceReport.InvoiceKey,vTrialBalanceReport.InvoiceLineKey,vTrialBalanceReport.InvoiceLineNumber,vTrialBalanceReport.InvoiceNumber,vTrialBalanceReport.InvoiceTypeDesc,vTrialBalanceReport.Notes,vTrialBalanceReport.OutstandingBalance,vTrialBalanceReport.ParentInvoiceLineKey,vTrialBalanceReport.PaymentDate,vTrialBalanceReport.PaymentKey,vTrialBalanceReport.PaymentNumber,vTrialBalanceReport.PaymentTermsKey,vTrialBalanceReport.PayPriority,vTrialBalanceReport.PmtAmount,vTrialBalanceReport.PmtAmountHome,vTrialBalanceReport.PmtCurrencyCode,vTrialBalanceReport.ProductCode,vTrialBalanceReport.ProductType,vTrialBalanceReport.PurchaseOrderNumber,vTrialBalanceReport.UnitPrice,vTrialBalanceReport.ARGLAccountKey,vTrialBalanceReport.GLAccountCode,vTrialBalanceReport.GLAccountName,vTrialBalanceReport.InvoiceTypeCode,vTrialBalanceReport.AccountingMethodCode,vTrialBalanceReport.DueDate,vTrialBalanceReport.PaymentTermsDescription,vTrialBalanceReport.PaymentTermsName,vTrialBalanceReport.QuantitySold FROM vTrialBalanceReport
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoUniformItemUniformResource]'))
    DROP VIEW [dbo].[vBoUniformItemUniformResource]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoUniformItemUniformResource] AS SELECT UniformItemUniformResourceRef.UniformKey,UniformItemUniformResourceRef.UniformResourceKey FROM UniformItemUniformResourceRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoUniformLink]'))
    DROP VIEW [dbo].[vBoUniformLink]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoUniformLink] AS SELECT UniformLink.SubjectUniformKey,UniformLink.SystemEntityKey,UniformLink.TargetUniformKey,UniformLink.UniformLinkKey FROM UniformLink
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoUniformRegistry]'))
    DROP VIEW [dbo].[vBoUniformRegistry]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoUniformRegistry] AS SELECT UniformRegistry.ComponentKey,UniformRegistry.UniformKey FROM UniformRegistry
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoUniformResource]'))
    DROP VIEW [dbo].[vBoUniformResource]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoUniformResource] AS SELECT UniformResourceRef.IsSystem,UniformResourceRef.OrganizationKey,UniformResourceRef.UniformResourceDesc AS Description,UniformResourceRef.UniformResourceKey,UniformResourceRef.UniformResourceName AS Name FROM UniformResourceRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoUniformResourceAction]'))
    DROP VIEW [dbo].[vBoUniformResourceAction]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoUniformResourceAction] AS SELECT UniformResourceAction.ComponentKey,UniformResourceAction.IsActive,UniformResourceAction.OrganizationKey,UniformResourceAction.ResourceActionKey,UniformResourceAction.UniformResourceActionKey,UniformResourceAction.UniformResourceKey,UniformResourceAction.WorkflowDocumentKey FROM UniformResourceAction
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoUniformTag]'))
    DROP VIEW [dbo].[vBoUniformTag]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoUniformTag] AS SELECT UniformTag.CreatedByUserKey,UniformTag.CreatedOn,UniformTag.TagKey,UniformTag.UniformKey,UniformTag.IsPrimary FROM UniformTag
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoUnofferedCustomerExperience]'))
    DROP VIEW [dbo].[vBoUnofferedCustomerExperience]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoUnofferedCustomerExperience] AS SELECT CustomerExperience.CustomerExperienceKey,CustomerExperience.CustomerExperienceNote AS Note,CustomerExperience.CustomerExperienceStatusCode,CustomerExperience.UserKey,CustomerExperience.CreatedByUserKey,CustomerExperience.CreatedOn,UnofferedCustomerExperience.ExperienceDefinitionKey,UnofferedCustomerExperience.UnofferedCustomerExperienceGrade AS Grade,UnofferedCustomerExperience.UnofferedCustomerExperienceKey,UnofferedCustomerExperience.CompletionDate AS CompletionDate_1 FROM CustomerExperience
	INNER JOIN UnofferedCustomerExperience
		ON CustomerExperience.CustomerExperienceKey = UnofferedCustomerExperience.UnofferedCustomerExperienceKey
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vUnPostedInvoiceReport]'))
    DROP VIEW [dbo].[vUnPostedInvoiceReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vUnPostedInvoiceReport]
AS
/****************************************************************************************
** This view provides basic information about each Work Invoice on "One Row per Invoice" basis.
** This view can be joined with WorkInvoiceLine, Payment, Contact, and FullAddress related views to get detailed information.
***************************************************************************************/
SELECT 
	IM.InvoiceNumber, IM.InvoiceDate,IM.InvoiceTypeCode,ITR.InvoiceTypeDesc, IM.OrderNumber,
	IM.AccountingMethodCode, IM.CurrencyCode, IM.CurrencyConversionRate, IM.PurchaseOrderNumber, IM.Notes,
	FE.Name AS FinancialEntity, PT.PaymentTermsName, BI.BatchNumber, BI.BatchName, BI.BatchTypeCode,
	IM.WorkInvoiceKey,IM.SoldToContactKey, IM.BillToContactKey, IM.SalesTeamGroupKey, IM.SystemEntityKey
FROM    
	WorkInvoiceMain IM 
	INNER JOIN 		InvoiceTypeRef 	ITR 	ON IM.InvoiceTypeCode = ITR.InvoiceTypeCode 
	INNER JOIN		FinancialEntity FE 	ON IM.FinancialEntityKey = FE.FinancialEntityKey 
	LEFT OUTER JOIN	PaymentTerms 	PT 	ON IM.PaymentTermsKey = PT.PaymentTermsKey
	LEFT OUTER JOIN	BatchInstance 	BI 	ON BI.BatchKey = IM.BatchKey

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vUnPostedInvoiceDetailReport]'))
    DROP VIEW [dbo].[vUnPostedInvoiceDetailReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vUnPostedInvoiceDetailReport] AS
/****************************************************************************************
** This view provides detailed information about each Invoice Line on "One Row per Invoice Line" basis.
** This view can be joined with Payment, Ship to Contact, and FullAddress related views to get detailed information.
***************************************************************************************/
SELECT 
	IR.*, IL.InvoiceLineNumber, PT.Name as 'ProductType', PM.ProductCode, IL.QuantitySold,
	IL.UnitPrice, IL.PayPriority, IL.ExtendedPrice, IL.OrderLineNumber, IL.IsPledge,
	PM.Name AS ProductName,PM.ProductSetTypeCode, PSTR.ProductSetTypeDesc,
	IL.WorkInvoiceLineKey, IL.ShipToContactKey, IL.ShipToFullAddressKey,IL.ParentWorkInvoiceLineKey,
	IL.SalesTeamGroupKey AS ILSalesTeamGroupKey, IL.SourceCodeKey AS ILSourceCodeKey
FROM    
	vUnPostedInvoiceReport IR
	INNER JOIN WorkInvoiceLine IL ON IR.WorkInvoiceKey = IL.WorkInvoiceKey
	INNER JOIN ProductMain PM ON IL.ProductKey = PM.ProductKey
    INNER JOIN ProductSetTypeRef PSTR ON PM.ProductSetTypeCode = PSTR.ProductSetTypeCode
    INNER JOIN ProductType PT on PM.ProductTypeKey = PT.ProductTypeKey

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoUnPostedInvoiceDetailReport]'))
    DROP VIEW [dbo].[vBoUnPostedInvoiceDetailReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoUnPostedInvoiceDetailReport] AS SELECT vUnPostedInvoiceDetailReport.AccountingMethodCode,vUnPostedInvoiceDetailReport.BatchName,vUnPostedInvoiceDetailReport.BatchNumber,vUnPostedInvoiceDetailReport.BatchTypeCode,vUnPostedInvoiceDetailReport.BillToContactKey,vUnPostedInvoiceDetailReport.CurrencyCode,vUnPostedInvoiceDetailReport.CurrencyConversionRate,vUnPostedInvoiceDetailReport.ExtendedPrice,vUnPostedInvoiceDetailReport.FinancialEntity,vUnPostedInvoiceDetailReport.ILSalesTeamGroupKey,vUnPostedInvoiceDetailReport.ILSourceCodeKey,vUnPostedInvoiceDetailReport.InvoiceDate,vUnPostedInvoiceDetailReport.InvoiceLineNumber,vUnPostedInvoiceDetailReport.InvoiceNumber,vUnPostedInvoiceDetailReport.InvoiceTypeCode,vUnPostedInvoiceDetailReport.InvoiceTypeDesc,vUnPostedInvoiceDetailReport.IsPledge,vUnPostedInvoiceDetailReport.Notes,vUnPostedInvoiceDetailReport.OrderLineNumber,vUnPostedInvoiceDetailReport.OrderNumber,vUnPostedInvoiceDetailReport.ParentWorkInvoiceLineKey,vUnPostedInvoiceDetailReport.PayPriority,vUnPostedInvoiceDetailReport.ProductCode,vUnPostedInvoiceDetailReport.ProductName,vUnPostedInvoiceDetailReport.ProductSetTypeCode,vUnPostedInvoiceDetailReport.ProductSetTypeDesc,vUnPostedInvoiceDetailReport.ProductType,vUnPostedInvoiceDetailReport.PurchaseOrderNumber,vUnPostedInvoiceDetailReport.SalesTeamGroupKey,vUnPostedInvoiceDetailReport.ShipToContactKey,vUnPostedInvoiceDetailReport.ShipToFullAddressKey,vUnPostedInvoiceDetailReport.SoldToContactKey,vUnPostedInvoiceDetailReport.SystemEntityKey,vUnPostedInvoiceDetailReport.UnitPrice,vUnPostedInvoiceDetailReport.WorkInvoiceKey,vUnPostedInvoiceDetailReport.WorkInvoiceLineKey,vUnPostedInvoiceDetailReport.PaymentTermsName,vUnPostedInvoiceDetailReport.QuantitySold FROM vUnPostedInvoiceDetailReport
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoUnPostedInvoiceReport]'))
    DROP VIEW [dbo].[vBoUnPostedInvoiceReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoUnPostedInvoiceReport] AS SELECT vUnPostedInvoiceReport.AccountingMethodCode,vUnPostedInvoiceReport.BatchName,vUnPostedInvoiceReport.BatchNumber,vUnPostedInvoiceReport.BatchTypeCode,vUnPostedInvoiceReport.BillToContactKey,vUnPostedInvoiceReport.CurrencyCode,vUnPostedInvoiceReport.CurrencyConversionRate,vUnPostedInvoiceReport.FinancialEntity,vUnPostedInvoiceReport.InvoiceDate,vUnPostedInvoiceReport.InvoiceNumber,vUnPostedInvoiceReport.InvoiceTypeCode,vUnPostedInvoiceReport.InvoiceTypeDesc,vUnPostedInvoiceReport.Notes,vUnPostedInvoiceReport.OrderNumber,vUnPostedInvoiceReport.PurchaseOrderNumber,vUnPostedInvoiceReport.SalesTeamGroupKey,vUnPostedInvoiceReport.SoldToContactKey,vUnPostedInvoiceReport.SystemEntityKey,vUnPostedInvoiceReport.WorkInvoiceKey,vUnPostedInvoiceReport.PaymentTermsName FROM vUnPostedInvoiceReport
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vUnpostedOrderReport]'))
    DROP VIEW [dbo].[vUnpostedOrderReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vUnpostedOrderReport]
AS
SELECT	
	WOM.WorkOrderKey, WOM.OrderKey, WOM.OrderNumber, WOM.OrderDate, WOM.LineTotal, WOM.MiscChargeTotal, WOM.Discount, 
        	WOM.ShippingTotal, WOM.TaxTotal, WOM.OrderTotal, WOM.CurrencyCode, WOM.ConversionRate, WOM.ReqShipDate, WOM.Description, 
        	WOM.Instructions, WOM.OrigOrderNumber, WOM.RetAuthNumber, WOM.PurchaseOrderNumber, WOM.OrigInvoiceNumber, WOM.HoldNote, 
        	WOM.BackorderReleasePriority, WOM.ResponseMediaCode, HC.Code AS HoldCode, HC.Reason AS HoldReason,
        	OSR.OrderStateDesc, OT.Title OrderType, OT.Description OrderTypeDesc, 
	WOM.SoldToContactKey, WOM.SoldToFullAddressKey, WOM.BillToContactKey, WOM.BillToFullAddressKey 
FROM   
	 WorkOrderMain WOM
	INNER JOIN		OrderType 	OT 	ON 	WOM.OrderTypeKey = OT.OrderTypeKey 
	INNER JOIN 		OrderStateRef 	OSR 	ON 	WOM.OrderStateCode = OSR.OrderStateCode
	LEFT OUTER JOIN 	HoldCode 	HC 	ON 	WOM.HoldCodeKey = HC.HoldCodeKey

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoUnPostedOrderReport]'))
    DROP VIEW [dbo].[vBoUnPostedOrderReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoUnPostedOrderReport] AS SELECT vUnpostedOrderReport.BackorderReleasePriority,vUnpostedOrderReport.ConversionRate,vUnpostedOrderReport.CurrencyCode,vUnpostedOrderReport.Description,vUnpostedOrderReport.Discount,vUnpostedOrderReport.HoldCode,vUnpostedOrderReport.HoldNote,vUnpostedOrderReport.HoldReason,vUnpostedOrderReport.Instructions,vUnpostedOrderReport.LineTotal,vUnpostedOrderReport.MiscChargeTotal,vUnpostedOrderReport.OrderDate,vUnpostedOrderReport.OrderKey,vUnpostedOrderReport.OrderNumber,vUnpostedOrderReport.OrderStateDesc,vUnpostedOrderReport.OrderTotal,vUnpostedOrderReport.OrderType,vUnpostedOrderReport.OrderTypeDesc,vUnpostedOrderReport.OrigInvoiceNumber,vUnpostedOrderReport.OrigOrderNumber,vUnpostedOrderReport.PurchaseOrderNumber,vUnpostedOrderReport.ReqShipDate,vUnpostedOrderReport.ResponseMediaCode,vUnpostedOrderReport.RetAuthNumber,vUnpostedOrderReport.ShippingTotal,vUnpostedOrderReport.TaxTotal,vUnpostedOrderReport.WorkOrderKey,vUnpostedOrderReport.BillToContactKey,vUnpostedOrderReport.BillToFullAddressKey,vUnpostedOrderReport.SoldToContactKey,vUnpostedOrderReport.SoldToFullAddressKey FROM vUnpostedOrderReport
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoUom]'))
    DROP VIEW [dbo].[vBoUom]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoUom] AS SELECT Uom.Description,Uom.Name,Uom.CreatedByUserKey,Uom.CreatedOn,Uom.SystemEntityKey,Uom.UomKey,Uom.UpdatedByUserKey,Uom.UpdatedOn,Uom.UomGroupKey,Uom.RoundingFactor,Uom.IsSellable,Uom.IsInventoryUom FROM Uom
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoUomConversion]'))
    DROP VIEW [dbo].[vBoUomConversion]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoUomConversion] AS SELECT UomConversion.FromUomKey,UomConversion.ToUomKey,UomConversion.ConversionFactor,UomConversion.UomConversionKey FROM UomConversion
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoUomGroup]'))
    DROP VIEW [dbo].[vBoUomGroup]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoUomGroup] AS SELECT UomGroup.Description,UomGroup.Name,UomGroup.CreatedByUserKey,UomGroup.CreatedOn,UomGroup.SystemEntityKey,UomGroup.UomGroupKey,UomGroup.UpdatedByUserKey,UomGroup.UpdatedOn FROM UomGroup
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoURLMapping]'))
    DROP VIEW [dbo].[vBoURLMapping]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoURLMapping] AS SELECT URLMapping.DirectoryName,URLMapping.URL,URLMapping.URLMappingKey,URLMapping.WebsiteDocumentVersionKey FROM URLMapping
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoUser]'))
    DROP VIEW [dbo].[vBoUser]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoUser] AS SELECT UserMain.ContactMaster,UserMain.EffectiveDate,UserMain.ExpirationDate,UserMain.IsDisabled,UserMain.UpdatedByUserKey,UserMain.UpdatedOn,UserMain.UserId,UserMain.CreatedByUserKey,UserMain.CreatedOn,UserMain.UserKey,UserMain.DefaultDepartmentGroupKey,UserMain.DefaultPerspectiveKey,UserMain.ProviderKey FROM UserMain
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoUserDefinedCustomerExperience]'))
    DROP VIEW [dbo].[vBoUserDefinedCustomerExperience]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoUserDefinedCustomerExperience] AS SELECT CustomerExperience.CustomerExperienceKey,CustomerExperience.CustomerExperienceNote AS Note,CustomerExperience.CustomerExperienceStatusCode,CustomerExperience.UserKey,CustomerExperience.CreatedByUserKey,CustomerExperience.CreatedOn,UserDefinedCustomerExperience.CompletionDate,UserDefinedCustomerExperience.ProgramKey,UserDefinedCustomerExperience.UserDefinedCustomerExperienceDesc AS Description,UserDefinedCustomerExperience.UserDefinedCustomerExperienceKey,UserDefinedCustomerExperience.UserDefinedCustomerExperienceLocation AS Location,UserDefinedCustomerExperience.UserDefinedCustomerExperienceName AS Name,UserDefinedCustomerExperience.UserDefinedCustomerExperienceUnits AS Units FROM CustomerExperience
	INNER JOIN UserDefinedCustomerExperience
		ON CustomerExperience.CustomerExperienceKey = UserDefinedCustomerExperience.UserDefinedCustomerExperienceKey
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoUserDefinedField]'))
    DROP VIEW [dbo].[vBoUserDefinedField]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoUserDefinedField] AS SELECT UserDefinedFieldRef.PropertyDefinitionKey,UserDefinedFieldRef.SortOrder,UserDefinedFieldRef.SystemEntityKey,UserDefinedFieldRef.UseInSearchFlag,UserDefinedFieldRef.UserDefinedFieldKey,UserDefinedFieldRef.UserDefinedFieldName AS Name FROM UserDefinedFieldRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoUserRole]'))
    DROP VIEW [dbo].[vBoUserRole]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoUserRole] AS SELECT UserRole.RoleKey,UserRole.UserKey FROM UserRole
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoUserToken]'))
    DROP VIEW [dbo].[vBoUserToken]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoUserToken] AS SELECT UserToken.Grantee,UserToken.UserKey FROM UserToken
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoVerisignGatewayAccount]'))
    DROP VIEW [dbo].[vBoVerisignGatewayAccount]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoVerisignGatewayAccount] AS SELECT GatewayAccount.Login,GatewayAccount.Password,GatewayAccount.RetryCount,GatewayAccount.AuthorizationExpiration,GatewayAccount.UseAvsFlag,GatewayAccount.UseCscFlag,GatewayAccount.CreatedByUserKey,GatewayAccount.CreatedOn,GatewayAccount.GatewayAccountKey,GatewayAccount.SystemEntityKey,GatewayAccount.UpdatedByUserKey,GatewayAccount.UpdatedOn,GatewayAccount.GatewayComponentKey,GatewayAccount.Name,GatewayAccount.GatewayTypeCode,VerisignGatewayAccount.HostAddress,VerisignGatewayAccount.HostPort,VerisignGatewayAccount.Partner,VerisignGatewayAccount.ProxyAddress,VerisignGatewayAccount.ProxyLogin,VerisignGatewayAccount.ProxyPassword,VerisignGatewayAccount.ProxyPort,VerisignGatewayAccount.Timeout,VerisignGatewayAccount.Vendor FROM GatewayAccount
	INNER JOIN VerisignGatewayAccount
		ON GatewayAccount.GatewayAccountKey = VerisignGatewayAccount.GatewayAccountKey
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoVerticalAlignmentRef]'))
    DROP VIEW [dbo].[vBoVerticalAlignmentRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoVerticalAlignmentRef] AS SELECT VerticalAlignmentRef.VerticalAlignmentDesc AS Description,VerticalAlignmentRef.VerticalAlignmentCode AS Code,VerticalAlignmentRef.VerticalAlignmentName AS Name FROM VerticalAlignmentRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoWarehouse]'))
    DROP VIEW [dbo].[vBoWarehouse]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoWarehouse] AS SELECT Warehouse.Description,Warehouse.Holidays,Warehouse.HoursOfOperation,Warehouse.ShipOriginKey,Warehouse.ShipZoneKey,Warehouse.WarehouseStatusCode,Warehouse.WarehouseTypeCode,Warehouse.FullAddressKey,Warehouse.AccessKey,Warehouse.CreatedByUserKey,Warehouse.CreatedOn,Warehouse.OrganizationKey,Warehouse.SystemEntityKey,Warehouse.UpdatedByUserKey,Warehouse.UpdatedOn,Warehouse.WarehouseKey,Warehouse.Name FROM Warehouse
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoWarehouseCarrierService]'))
    DROP VIEW [dbo].[vBoWarehouseCarrierService]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoWarehouseCarrierService] AS SELECT WarehouseCarrierService.CreatedByUserKey,WarehouseCarrierService.CreatedOn,WarehouseCarrierService.ShipCarrierKey,WarehouseCarrierService.WarehouseKey,WarehouseCarrierService.ShipMethodKey FROM WarehouseCarrierService
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vWarehouseReport]'))
    DROP VIEW [dbo].[vWarehouseReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vWarehouseReport]
AS
SELECT    
	 W.WarehouseKey, W.Name AS WarehouseName, W.Description, W.HoursOfOperation, W.Holidays, W.WarehouseTypeCode, 
	 WTR.WarehouseTypeName, W.WarehouseStatusCode, WSR.WarehouseStatusDesc, W.FullAddressKey, W.ShipOriginKey, W.ShipZoneKey
              
FROM  
	Warehouse 	W 
	INNER JOIN	WarehouseStatusRef 	WSR 	ON 	W.WarehouseStatusCode = WSR.WarehouseStatusCode 
	INNER JOIN	WarehouseTypeRef 	WTR 	ON 	W.WarehouseTypeCode = WTR.WarehouseTypeCode

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoWarehouseReport]'))
    DROP VIEW [dbo].[vBoWarehouseReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoWarehouseReport] AS SELECT vWarehouseReport.Description,vWarehouseReport.FullAddressKey,vWarehouseReport.Holidays,vWarehouseReport.HoursOfOperation,vWarehouseReport.ShipOriginKey,vWarehouseReport.ShipZoneKey,vWarehouseReport.WarehouseKey,vWarehouseReport.WarehouseName,vWarehouseReport.WarehouseStatusCode,vWarehouseReport.WarehouseStatusDesc,vWarehouseReport.WarehouseTypeCode,vWarehouseReport.WarehouseTypeName FROM vWarehouseReport
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoWarehouseStatusRef]'))
    DROP VIEW [dbo].[vBoWarehouseStatusRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoWarehouseStatusRef] AS SELECT WarehouseStatusRef.WarehouseStatusCode,WarehouseStatusRef.WarehouseStatusDesc FROM WarehouseStatusRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoWarehouseTypeRef]'))
    DROP VIEW [dbo].[vBoWarehouseTypeRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoWarehouseTypeRef] AS SELECT WarehouseTypeRef.WarehouseTypeCode,WarehouseTypeRef.WarehouseTypeDesc FROM WarehouseTypeRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoWebUserControlRef]'))
    DROP VIEW [dbo].[vBoWebUserControlRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoWebUserControlRef] AS SELECT WebUserControlRef.WebUserControlName,WebUserControlRef.WebUserControlPath,WebUserControlRef.ParameterControlPath FROM WebUserControlRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoWorkflowDemo]'))
    DROP VIEW [dbo].[vBoWorkflowDemo]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoWorkflowDemo] AS SELECT WorkflowDemo.DemoAction,WorkflowDemo.DemoStatus,WorkflowDemo.WorkflowDemoKey FROM WorkflowDemo
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoWorkflowDemoLog]'))
    DROP VIEW [dbo].[vBoWorkflowDemoLog]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoWorkflowDemoLog] AS SELECT WorkflowDemoLog.LoginUser,WorkflowDemoLog.LogTimeStamp,WorkflowDemoLog.Message FROM WorkflowDemoLog
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vWorkflowInstanceReport]'))
    DROP VIEW [dbo].[vWorkflowInstanceReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE    VIEW [dbo].[vWorkflowInstanceReport]
AS
SELECT	wfi.WorkflowInstanceKey, 
	wfi.ProcessName,
	wfi.WorkflowStatus, 
	wfi.InitiatedByUserKey,
	cm2.FullName InitiatedByName,
	wfi.InitiatedOn,
	wfi.LogText, 
	CASE WHEN wfi.LockedByUserKey IS NULL THEN 'No' WHEN wfi.KeepAlive IS NULL THEN 'No' WHEN wfi.KeepAlive < dateadd(mi, - dbo.asi_GetWorkflowInstanceLockDuration(), getdate()) THEN 'No' ELSE 'Yes' END IsLocked, 
	COALESCE (cm.FullName, '') LockedByName
 FROM	WorkflowInstance wfi 
	INNER JOIN ContactMain cm2 ON wfi.InitiatedByUserKey = cm2.ContactKey 
	LEFT OUTER JOIN ContactMain cm ON wfi.LockedByUserKey = cm.ContactKey

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoWorkflowInstanceReport]'))
    DROP VIEW [dbo].[vBoWorkflowInstanceReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoWorkflowInstanceReport] AS SELECT vWorkflowInstanceReport.IsLocked,vWorkflowInstanceReport.LockedByName,vWorkflowInstanceReport.LogText,vWorkflowInstanceReport.WorkflowInstanceKey,vWorkflowInstanceReport.WorkflowStatus,vWorkflowInstanceReport.InitiatedByName,vWorkflowInstanceReport.InitiatedByUserKey,vWorkflowInstanceReport.InitiatedOn,vWorkflowInstanceReport.ProcessName FROM vWorkflowInstanceReport
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoWorkflowProcess]'))
    DROP VIEW [dbo].[vBoWorkflowProcess]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoWorkflowProcess] AS SELECT WorkflowInstance.InstanceGraph,WorkflowInstance.LockedByUserKey,WorkflowInstance.LockedOn,WorkflowInstance.ProcessId,WorkflowInstance.WorkflowInstanceKey FROM WorkflowInstance
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoWorkflowQueueItem]'))
    DROP VIEW [dbo].[vBoWorkflowQueueItem]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoWorkflowQueueItem] AS SELECT WorkflowQueue.CreatedByUserKey,WorkflowQueue.CreatedOn,WorkflowQueue.DateExecuted,WorkflowQueue.Description,WorkflowQueue.SelectionKey,WorkflowQueue.Stage,WorkflowQueue.WorkFlowQueueItemStatusCode,WorkflowQueue.TaskItemKey,WorkflowQueue.UpdatedByUserKey,WorkflowQueue.UpdatedOn,WorkflowQueue.WorkFlowQueueKey,WorkflowQueue.WorkItems,WorkflowQueue.TaskItemAccessKey FROM WorkflowQueue
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vWorkflowQueueWithStatus]'))
    DROP VIEW [dbo].[vWorkflowQueueWithStatus]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vWorkflowQueueWithStatus]
AS
SELECT WorkFlowQueueKey, WorkItems, Description, TaskItemKey, SelectionKey, Stage, DateExecuted, CreatedOn, CreatedByUserKey, UpdatedOn, 
               UpdatedByUserKey, MarkedForDeleteOn, TaskItemAccessKey, 
               CASE WorkFlowQueueItemStatusCode WHEN 0 THEN 'Not Started' WHEN 1 THEN 'In Progress' WHEN 2 THEN 'Completed' WHEN 4 THEN 'Aborted' WHEN
                8 THEN 'Validation Failed' WHEN 16 THEN 'Cancelled' WHEN 1028 THEN 'Unknown' ELSE CAST(WorkFlowQueueItemStatusCode AS nvarchar(100)) 
               END AS Status
FROM  dbo.WorkflowQueue


GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoWorkflowQueueItemWithStatus]'))
    DROP VIEW [dbo].[vBoWorkflowQueueItemWithStatus]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoWorkflowQueueItemWithStatus] AS SELECT vWorkflowQueueWithStatus.Status,vWorkflowQueueWithStatus.CreatedByUserKey,vWorkflowQueueWithStatus.CreatedOn,vWorkflowQueueWithStatus.DateExecuted,vWorkflowQueueWithStatus.Description,vWorkflowQueueWithStatus.SelectionKey,vWorkflowQueueWithStatus.Stage,vWorkflowQueueWithStatus.TaskItemAccessKey,vWorkflowQueueWithStatus.TaskItemKey,vWorkflowQueueWithStatus.UpdatedByUserKey,vWorkflowQueueWithStatus.UpdatedOn,vWorkflowQueueWithStatus.WorkFlowQueueKey,vWorkflowQueueWithStatus.WorkItems FROM vWorkflowQueueWithStatus
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoWorkflowQueueStatusRef]'))
    DROP VIEW [dbo].[vBoWorkflowQueueStatusRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoWorkflowQueueStatusRef] AS SELECT WorkflowQueueStatusRef.WorkflowQueueStatusCode,WorkflowQueueStatusRef.WorkflowQueueStatusDesc,WorkflowQueueStatusRef.WorkflowQueueStatusName FROM WorkflowQueueStatusRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoWorkflowServiceReport]'))
    DROP VIEW [dbo].[vBoWorkflowServiceReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoWorkflowServiceReport] AS SELECT WorkflowService.BaseDirectory,WorkflowService.CategoryFilter,WorkflowService.MachineName,WorkflowService.MaxWorkerCount,WorkflowService.ServiceName,WorkflowService.UpdatedOn,WorkflowService.WorkflowServiceKey,WorkflowService.WorkFlowServiceStatusCode FROM WorkflowService
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vWorkItemQueueReport]'))
    DROP VIEW [dbo].[vWorkItemQueueReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE  VIEW [dbo].[vWorkItemQueueReport]
AS

SELECT 	wiq.WorkItemQueueKey, 
	wiq.WorkflowInstanceKey, 
	wiq.Category, 
       	CASE wiq.Priority WHEN 0 THEN 'Lowest' WHEN 1 THEN 'Below Normal' WHEN 2 THEN 'Normal' WHEN 3 THEN 'Above Normal' ELSE 'Highest' END Priority,
       	CASE wiq.IsInteractive WHEN 0 THEN 'Non-visual' ELSE 'Interactive' END IsInteractive, 
	wiq.Description, 
	wiq.EnqueuedOn, 
	COALESCE (wiq.BeginOn, getdate()) BeginOn,
	wiq.PerformerKey,
       	COALESCE (cm.FullName, ins.InstituteName, gm.Name, '') PerformerName, 
	ctr.ContactTypeDesc, 
	wiq.RecoveryPoint,
	wiq.SelectionLock,
       	CASE WHEN wiq.SelectionLock IS NULL THEN 'No' WHEN wiq.KeepAlive IS NULL THEN 'No' WHEN wiq.KeepAlive < dateadd(mi, - dbo.asi_GetWorkItemLockDuration(), getdate()) THEN 'No' ELSE 'Yes' END IsLocked
FROM	WorkItemQueue wiq 
	LEFT OUTER JOIN ContactMain cm ON wiq.PerformerKey = cm.ContactKey 
	LEFT OUTER JOIN Institute ins ON wiq.PerformerKey = ins.ContactKey 
	LEFT OUTER JOIN ContactTypeRef ctr ON cm.ContactTypeKey = ctr.ContactTypeKey 
	LEFT OUTER JOIN GroupMain gm ON wiq.PerformerKey = gm.GroupKey

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vWorkflowServiceWorkerReport]'))
    DROP VIEW [dbo].[vWorkflowServiceWorkerReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vWorkflowServiceWorkerReport]
AS
SELECT     wsw.WorkflowServiceKey, wsw.WorkItemQueueKey, wsw.WorkflowInstanceKey, wsw.CreatedOn, wiqr.Category, wiqr.Priority, wiqr.Description, 
                      wiqr.EnqueuedOn, wiqr.PerformerName
FROM         dbo.WorkflowServiceWorker wsw INNER JOIN
                      dbo.vWorkItemQueueReport wiqr ON wsw.WorkItemQueueKey = wiqr.WorkItemQueueKey

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoWorkflowServiceWorkerReport]'))
    DROP VIEW [dbo].[vBoWorkflowServiceWorkerReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoWorkflowServiceWorkerReport] AS SELECT vWorkflowServiceWorkerReport.Category,vWorkflowServiceWorkerReport.CreatedOn,vWorkflowServiceWorkerReport.Description,vWorkflowServiceWorkerReport.EnqueuedOn,vWorkflowServiceWorkerReport.PerformerName,vWorkflowServiceWorkerReport.Priority,vWorkflowServiceWorkerReport.WorkflowInstanceKey,vWorkflowServiceWorkerReport.WorkflowServiceKey,vWorkflowServiceWorkerReport.WorkItemQueueKey FROM vWorkflowServiceWorkerReport
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoWorkflowStatusRef]'))
    DROP VIEW [dbo].[vBoWorkflowStatusRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoWorkflowStatusRef] AS SELECT WorkflowStatusRef.WorkflowStatusCode,WorkflowStatusRef.WorkflowStatusDesc,WorkflowStatusRef.WorkflowStatusName FROM WorkflowStatusRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoWorkInvoice]'))
    DROP VIEW [dbo].[vBoWorkInvoice]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoWorkInvoice] AS SELECT WorkInvoiceMain.BillToContactKey,WorkInvoiceMain.SoldToContactKey,WorkInvoiceMain.Notes,WorkInvoiceMain.PaymentTermsKey,WorkInvoiceMain.InvoiceDate,WorkInvoiceMain.InvoiceTypeCode,WorkInvoiceMain.FinancialEntityKey,WorkInvoiceMain.InvoiceNumber,WorkInvoiceMain.SourceCodeKey,WorkInvoiceMain.CurrencyCode,WorkInvoiceMain.CurrencyConversionRate,WorkInvoiceMain.PurchaseOrderNumber,WorkInvoiceMain.CommissionPlanKey,WorkInvoiceMain.SalesTeamGroupKey,WorkInvoiceMain.OrderNumber,WorkInvoiceMain.SystemEntityKey,WorkInvoiceMain.AccessKey,WorkInvoiceMain.CreatedByUserKey,WorkInvoiceMain.CreatedOn,WorkInvoiceMain.UpdatedByUserKey,WorkInvoiceMain.UpdatedOn,WorkInvoiceMain.WorkInvoiceKey,WorkInvoiceMain.OwnerGroupKey,WorkInvoiceMain.AccountingMethodCode,WorkInvoiceMain.FirstPaymentDueDate,WorkInvoiceMain.Description,WorkInvoiceMain.PromoCode,WorkInvoiceMain.PriceSheetKey,WorkInvoiceMain.BatchKey,WorkInvoiceMain.BatchLineStatusCode,WorkInvoiceMain.BatchStatusMessage,WorkInvoiceMain.OriginatingBatchKey FROM WorkInvoiceMain
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoWorkInvoiceDistribution]'))
    DROP VIEW [dbo].[vBoWorkInvoiceDistribution]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoWorkInvoiceDistribution] AS SELECT WorkInvoiceDistribution.ExtendedIncome,WorkInvoiceDistribution.ExtendedIncomeRecognized,WorkInvoiceDistribution.UnitIncome,WorkInvoiceDistribution.WorkInvoiceDistributionKey,WorkInvoiceDistribution.WorkInvoiceKey,WorkInvoiceDistribution.WorkInvoiceLineKey,WorkInvoiceDistribution.IncomeGLAccountKey,WorkInvoiceDistribution.DeferredIncomeGLAccountKey,WorkInvoiceDistribution.FinancialEntityKey,WorkInvoiceDistribution.ARGLAccountKey,WorkInvoiceDistribution.DeferralTermsKey,WorkInvoiceDistribution.ExtendedCost,WorkInvoiceDistribution.WarehouseKey,WorkInvoiceDistribution.QuantitySold,WorkInvoiceDistribution.ShipMethodKey FROM WorkInvoiceDistribution
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoWorkInvoiceLine]'))
    DROP VIEW [dbo].[vBoWorkInvoiceLine]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoWorkInvoiceLine] AS SELECT WorkInvoiceLine.ShipToContactKey,WorkInvoiceLine.UnitPrice,WorkInvoiceLine.WorkInvoiceKey,WorkInvoiceLine.WorkInvoiceLineKey,WorkInvoiceLine.InvoiceLineNumber,WorkInvoiceLine.PayPriority,WorkInvoiceLine.ExtendedPrice,WorkInvoiceLine.ParentWorkInvoiceLineKey,WorkInvoiceLine.InvoiceNumber,WorkInvoiceLine.OrderLineNumber,WorkInvoiceLine.ExtendedPriceHome,WorkInvoiceLine.ProductKey,WorkInvoiceLine.ShipToFullAddressKey,WorkInvoiceLine.IsPledge,WorkInvoiceLine.SalesTeamGroupKey,WorkInvoiceLine.SourceCodeKey,WorkInvoiceLine.UomKey,WorkInvoiceLine.BasePrice,WorkInvoiceLine.PromoCode,WorkInvoiceLine.QuantitySold,WorkInvoiceLine.ShipMethodKey,WorkInvoiceLine.PriceSheetKey FROM WorkInvoiceLine
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vWorkInvTransReport]'))
    DROP VIEW [dbo].[vWorkInvTransReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vWorkInvTransReport]
AS
SELECT     WTM.WorkTransactionKey, WTM.TransactionDate, WTM.OrderKey, WTM.OrderNumber, WTM.Vendor, WTM.ReceiptNumber, WTM.ReturnAuthorization,
                       WTM.Notes, WTM.Status, WTL.TransactionTypeCode, WTL.ProductKey, WTL.UomKey, WTL.ProductDescription, WTL.Quantity, WTL.QuantityOrdered, 
                      WTL.LotId, WTL.PurchaseOrderNumber, WTL.LandedCost, WTL.TotalCost, WH.Description AS Warehouse, PM.ProductCode, 
                      PM.Name AS ProductName, OM.OrderDate, TTR.TransactionTypeDesc
FROM         dbo.WorkTransactionMain WTM LEFT OUTER JOIN
                      dbo.WorkTransactionLine WTL ON WTM.WorkTransactionKey = WTL.WorkTransactionKey LEFT OUTER JOIN
                      dbo.Warehouse WH ON WTL.WarehouseKey = WH.WarehouseKey LEFT OUTER JOIN
                      dbo.ProductMain PM ON WTL.ProductKey = PM.ProductKey LEFT OUTER JOIN
                      dbo.OrderMain OM ON WTM.OrderKey = OM.OrderKey LEFT OUTER JOIN
		      dbo.TransactionTypeRef TTR ON WTL.TransactionTypeCode = TTR.TransactionTypeCode

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoWorkInvTransReport]'))
    DROP VIEW [dbo].[vBoWorkInvTransReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoWorkInvTransReport] AS SELECT vWorkInvTransReport.LandedCost,vWorkInvTransReport.LotId,vWorkInvTransReport.Notes,vWorkInvTransReport.OrderDate,vWorkInvTransReport.OrderKey,vWorkInvTransReport.OrderNumber,vWorkInvTransReport.ProductCode,vWorkInvTransReport.ProductDescription,vWorkInvTransReport.ProductKey,vWorkInvTransReport.ProductName,vWorkInvTransReport.PurchaseOrderNumber,vWorkInvTransReport.Quantity,vWorkInvTransReport.QuantityOrdered,vWorkInvTransReport.ReceiptNumber,vWorkInvTransReport.ReturnAuthorization,vWorkInvTransReport.Status,vWorkInvTransReport.TotalCost,vWorkInvTransReport.TransactionDate,vWorkInvTransReport.TransactionTypeCode,vWorkInvTransReport.UomKey,vWorkInvTransReport.Vendor,vWorkInvTransReport.Warehouse,vWorkInvTransReport.WorkTransactionKey,vWorkInvTransReport.TransactionTypeDesc FROM vWorkInvTransReport
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoWorkItem]'))
    DROP VIEW [dbo].[vBoWorkItem]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoWorkItem] AS SELECT WorkItemQueue.ActivityId,WorkItemQueue.Category,WorkItemQueue.Description,WorkItemQueue.EnqueuedOn,WorkItemQueue.ExecutionMode,WorkItemQueue.IsInteractive,WorkItemQueue.KeepAlive,WorkItemQueue.PackageId,WorkItemQueue.PerformerKey,WorkItemQueue.Priority,WorkItemQueue.ProcessId,WorkItemQueue.SelectedOn,WorkItemQueue.SelectionLock,WorkItemQueue.WorkflowInstanceKey,WorkItemQueue.WorkItemGraph,WorkItemQueue.WorkItemQueueKey,WorkItemQueue.BeginOn,WorkItemQueue.RecoveryPoint FROM WorkItemQueue
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoWorkItemQueueReport]'))
    DROP VIEW [dbo].[vBoWorkItemQueueReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoWorkItemQueueReport] AS SELECT vWorkItemQueueReport.Category,vWorkItemQueueReport.Description,vWorkItemQueueReport.EnqueuedOn,vWorkItemQueueReport.IsInteractive,vWorkItemQueueReport.IsLocked,vWorkItemQueueReport.PerformerName,vWorkItemQueueReport.Priority,vWorkItemQueueReport.WorkflowInstanceKey,vWorkItemQueueReport.WorkItemQueueKey,vWorkItemQueueReport.BeginOn,vWorkItemQueueReport.PerformerKey,vWorkItemQueueReport.RecoveryPoint,vWorkItemQueueReport.SelectionLock,vWorkItemQueueReport.ContactTypeDesc FROM vWorkItemQueueReport
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoWorkMonetaryApplication]'))
    DROP VIEW [dbo].[vBoWorkMonetaryApplication]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoWorkMonetaryApplication] AS SELECT WorkMonetaryApplication.Amount,WorkMonetaryApplication.InvoiceKey,WorkMonetaryApplication.InvoiceLineKey,WorkMonetaryApplication.InvoiceLineNumber,WorkMonetaryApplication.InvoiceNumber,WorkMonetaryApplication.SrcWorkInvoiceLineKey,WorkMonetaryApplication.WorkMonetaryApplicationKey,WorkMonetaryApplication.SrcInvoiceLineKey,WorkMonetaryApplication.SrcPaymentKey,WorkMonetaryApplication.SrcWorkPaymentKey,WorkMonetaryApplication.DiscountTaken,WorkMonetaryApplication.CurrencyVariance,WorkMonetaryApplication.InvoiceDistributionKey,WorkMonetaryApplication.PaymentScheduleLineKey,WorkMonetaryApplication.OrderLineNumber,WorkMonetaryApplication.OrderNumber,WorkMonetaryApplication.TransactionDate,WorkMonetaryApplication.TransactionType,WorkMonetaryApplication.BatchKey FROM WorkMonetaryApplication
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoWorkOrder]'))
    DROP VIEW [dbo].[vBoWorkOrder]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoWorkOrder] AS SELECT WorkOrderMain.BackorderReleasePriority,WorkOrderMain.BillToFullAddressKey,WorkOrderMain.BillToContactKey,WorkOrderMain.Blob,WorkOrderMain.ConversionRate,WorkOrderMain.CultureCode,WorkOrderMain.CurrencyCode,WorkOrderMain.DefaultWarehouseKey,WorkOrderMain.Description,WorkOrderMain.Discount,WorkOrderMain.DiscountCode,WorkOrderMain.FinancialEntityKey,WorkOrderMain.HoldCodeKey,WorkOrderMain.HoldNote,WorkOrderMain.Instructions,WorkOrderMain.IsReturn,WorkOrderMain.IsReturnFullOrder,WorkOrderMain.LineTotal,WorkOrderMain.LineTotalHome,WorkOrderMain.MiscChargeTotal,WorkOrderMain.MiscChargeTotalHome,WorkOrderMain.OrderDate,WorkOrderMain.OrderKey,WorkOrderMain.OrderNumber,WorkOrderMain.OrderStateCode,WorkOrderMain.OrderTotal,WorkOrderMain.OrderTotalHome,WorkOrderMain.OrderTypeKey,WorkOrderMain.OrigInvoiceNumber,WorkOrderMain.OrigOrderNumber,WorkOrderMain.PaymentTermsKey,WorkOrderMain.PriceSheetKey,WorkOrderMain.PurchaseOrderNumber,WorkOrderMain.ReasonCodeKey,WorkOrderMain.ReqShipDate,WorkOrderMain.ResponseMediaCode,WorkOrderMain.RetAuthNumber,WorkOrderMain.IsShippingFixed,WorkOrderMain.ShippingTotal,WorkOrderMain.ShippingTotalHome,WorkOrderMain.SoldToFullAddressKey,WorkOrderMain.SoldToContactKey,WorkOrderMain.SourceCodeKey,WorkOrderMain.TaxTotal,WorkOrderMain.TaxTotalHome,WorkOrderMain.UpdatedByUserKey,WorkOrderMain.UpdatedOn,WorkOrderMain.CommissionPlanKey,WorkOrderMain.SalesTeamGroupKey,WorkOrderMain.SystemEntityKey,WorkOrderMain.SalesLocationKey,WorkOrderMain.CreatedByUserKey,WorkOrderMain.CreatedOn,WorkOrderMain.WorkOrderKey,WorkOrderMain.AccessKey,WorkOrderMain.OwnerGroupKey,WorkOrderMain.FirstPaymentDueDate,WorkOrderMain.BatchKey,WorkOrderMain.BatchLineStatusCode,WorkOrderMain.BatchStatusMessage,WorkOrderMain.OriginatingBatchKey FROM WorkOrderMain
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoWorkPayment]'))
    DROP VIEW [dbo].[vBoWorkPayment]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoWorkPayment] AS SELECT WorkPayment.PaymentAuthorizationKey,WorkPayment.PaymentDate,WorkPayment.PaymentApplicationRestrictionCode,WorkPayment.AmountHome,WorkPayment.CurrencyCode,WorkPayment.FinancialEntityKey,WorkPayment.Amount,WorkPayment.OriginalPaymentKey,WorkPayment.CreditTypeCode,WorkPayment.PayorContactKey,WorkPayment.SummaryDisplay,WorkPayment.AccessKey,WorkPayment.CreatedByUserKey,WorkPayment.CreatedOn,WorkPayment.SystemEntityKey,WorkPayment.UpdatedByUserKey,WorkPayment.UpdatedOn,WorkPayment.WorkPaymentKey,WorkPayment.OwnerGroupKey,WorkPayment.PaymentMethodKey,WorkPayment.PaymentReferenceData,WorkPayment.PaymentDetailKey,WorkPayment.BatchKey,WorkPayment.BatchLineStatusCode,WorkPayment.BatchStatusMessage,WorkPayment.OriginatingBatchKey FROM WorkPayment
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoWorkTransaction]'))
    DROP VIEW [dbo].[vBoWorkTransaction]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoWorkTransaction] AS SELECT WorkTransactionMain.Notes,WorkTransactionMain.OrderKey,WorkTransactionMain.OrderNumber,WorkTransactionMain.ReceiptNumber,WorkTransactionMain.ReturnAuthorization,WorkTransactionMain.Status,WorkTransactionMain.TransactionDate,WorkTransactionMain.Vendor,WorkTransactionMain.CreatedByUserKey,WorkTransactionMain.CreatedOn,WorkTransactionMain.SystemEntityKey,WorkTransactionMain.UpdatedByUserKey,WorkTransactionMain.UpdatedOn,WorkTransactionMain.WorkTransactionKey,WorkTransactionMain.OwnerGroupKey,WorkTransactionMain.BatchKey,WorkTransactionMain.BatchLineStatusCode,WorkTransactionMain.BatchStatusMessage,WorkTransactionMain.OriginatingBatchKey FROM WorkTransactionMain
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoWorkTransactionLine]'))
    DROP VIEW [dbo].[vBoWorkTransactionLine]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoWorkTransactionLine] AS SELECT WorkTransactionLine.InventoryLocationKey,WorkTransactionLine.LandedCost,WorkTransactionLine.LotId,WorkTransactionLine.OrderLineKey,WorkTransactionLine.ProductDescription,WorkTransactionLine.ProductKey,WorkTransactionLine.PurchaseOrderNumber,WorkTransactionLine.Quantity,WorkTransactionLine.QuantityOrdered,WorkTransactionLine.RelatedTransactionLineKey,WorkTransactionLine.SortOrder,WorkTransactionLine.TargetLocationKey,WorkTransactionLine.TotalCost,WorkTransactionLine.UomKey,WorkTransactionLine.WarehouseKey,WorkTransactionLine.WorkTransactionKey,WorkTransactionLine.WorkTransactionLineKey,WorkTransactionLine.TransactionTypeCode,WorkTransactionLine.ReasonCodeKey FROM WorkTransactionLine
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vCampaignMgmtReport]'))
    DROP VIEW [dbo].[vCampaignMgmtReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW dbo.vCampaignMgmtReport
AS
SELECT     C.Name AS Campaign, C.StartDate AS CampaignStartDate, C.EndDate AS CampaignEndDate, C.CampaignStatusCode, 
                      C.TargetRevenue AS CampaignTargetRevenue, C.PredictedResponseRate AS CampaignPredictedResponseRate, 
                      C.TotalRevenue AS CampaignTotalRevenue, A.Name AS Appeal, A.AppealStatusCode, A.TotalRevenue AS AppealTotalRevenue, 
                      A.TargetRevenue AS AppealTargetRevenue, A.PredictedResponseRate AS AppealPredictedResponseRate, A.StartDate AS AppealStartDate, 
                      A.EndDate AS AppealEndDate, ASR.AppealStatusName, S.Name AS Solicitation, S.SolicitationStatusCode, 
                      S.TargetRevenue AS SolicitationTargetRevenue, S.TotalRevenue AS SolicitationTotalRevenue, 
                      S.PredictedResponseRate AS SolicitationPredictedResponseRate, S.StartDate AS SolicitationStartDate, S.EndDate AS SolicitationEndDate, 
                      S.ReminderDate AS SolicitationReminderDate, SSR.SolicitationStatusName, CSR.CampaignStatusName, SC.Code AS SourceCode, 
                      SC.Name AS SourceCodeName, SC.OverheadCost, SC.EstimatedCost, SC.TargetRevenue AS SourceCodeTargetRevenue, 
                      SC.TotalRevenue AS SourceCodeTotalRevenue, SC.TotalSolicited AS SourceCodeTotalSolicited, 
                      SC.PredictedResponseRate AS SourceCodePredictedResponseRate, SC.ExternalListCount, SC.ResponsesTotalledOn, SC.LastDropDate, 
                      SC.FirstResponseDate, SC.LastResponseDate, SC.LowResponseAmount, SC.HighResponseAmount, SC.TotalPositiveResponse, 
                      SC.TotalNegativeResponse, SCSR.SourceCodeStatusName, SCTR.SourceCodeTypeName, C.CampaignKey, A.AppealKey, S.SolicitationKey, 
                      SC.SourceCodeKey, C.SystemEntityKey, C.CampaignTypeCode
FROM         dbo.CampaignMain AS C INNER JOIN
                      dbo.CampaignStatusRef AS CSR ON C.CampaignStatusCode = CSR.CampaignStatusCode LEFT OUTER JOIN
                      dbo.AppealMain AS A ON C.CampaignKey = A.CampaignKey LEFT OUTER JOIN
                      dbo.AppealStatusRef AS ASR ON A.AppealStatusCode = ASR.AppealStatusCode LEFT OUTER JOIN
                      dbo.SolicitationMain AS S ON A.AppealKey = S.AppealKey LEFT OUTER JOIN
                      dbo.SolicitationStatusRef AS SSR ON S.SolicitationStatusCode = SSR.SolicitationStatusCode LEFT OUTER JOIN
                      dbo.SourceCode AS SC ON S.SolicitationKey = SC.SolicitationKey LEFT OUTER JOIN
                      dbo.SourceCodeStatusRef AS SCSR ON SC.SourceCodeStatusCode = SCSR.SourceCodeStatusCode LEFT OUTER JOIN
                      dbo.SourceCodeTypeRef AS SCTR ON SC.SourceCodeTypeCode = SCTR.SourceCodeTypeCode

GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vCashGifts]'))
    DROP VIEW [dbo].[vCashGifts]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
create  view vCashGifts as
   select t.BT_ID as ID,
               sum(t.INVOICE_CREDITS) as GIFT_AMOUNT
    from Trans t, Invoice i
    where  t.INVOICE_REFERENCE_NUM = i.REFERENCE_NUM and
                i.SOURCE_SYSTEM = 'FR' and
                t.CHECK_NUMBER NOT IN
                   (select Cash_Accounts.CASH_ACCOUNT_CODE 
                    from Cash_Accounts  
                    where Cash_Accounts.ACCOUNT_TYPE = 2) and
                          ((t.JOURNAL_TYPE = 'PAY' and t.TRANSACTION_TYPE = 'AR') or 
                            (t.JOURNAL_TYPE = 'IN' and t.TRANSACTION_TYPE = 'PAY'))
  group by t.BT_ID

GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vCashGiftTotals]'))
    DROP VIEW [dbo].[vCashGiftTotals]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
create  view vCashGiftTotals as
    select t.BT_ID as ID,
           t.TRANS_NUMBER,
           t.TRANSACTION_DATE,
           (sum(t.INVOICE_CREDITS)) as AMOUNT,
           max(p.SOURCE_CODE) as SOURCE_CODE
    from Trans  t, Invoice  i,Trans p
    where t.INVOICE_REFERENCE_NUM = i.REFERENCE_NUM and
          i.SOURCE_SYSTEM = 'FR' and
          p.TRANS_NUMBER = i.ORIGINATING_TRANS_NUM and
          p.LINE_NUMBER = 1 AND p.SUB_LINE_NUMBER = 1 and
          p.JOURNAL_TYPE = 'IN' and p.TRANSACTION_TYPE = 'DIST' and
         ((t.JOURNAL_TYPE = 'PAY' and t.TRANSACTION_TYPE = 'AR') or
               (t.JOURNAL_TYPE = 'IN' and t.TRANSACTION_TYPE = 'PAY'))
 group by  t.BT_ID,t.TRANS_NUMBER,t.TRANSACTION_DATE

GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vContactAddressCategoryPreferencesReport]'))
    DROP VIEW [dbo].[vContactAddressCategoryPreferencesReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
/*
This view is used from vContactCorrespondencePreferencesReport in order to 
provide preference information for contact's address category. 
The resultset includes contact and specific preference information for
mailing, phone, fax and email communication methods.
*/
CREATE VIEW [dbo].[vContactAddressCategoryPreferencesReport]
AS
SELECT  cm.ContactKey,
        mail.NoSolicitationFlag AS MailNoSolicitationFlag,
        mail.OptOutFlag AS MailOptOutFlag,
        phone.NoSolicitationFlag AS PhoneNoSolicitationFlag,
        phone.OptOutFlag AS PhoneOptOutFlag,
        fax.NoSolicitationFlag AS FaxNoSolicitationFlag,
        fax.OptOutFlag AS FaxOptOutFlag,
        email.NoSolicitationFlag AS EmailNoSolicitationFlag,
        email.OptOutFlag AS EmailOptOutFlag
  FROM ContactMain cm LEFT OUTER JOIN AddressCategoryPreferences mail
       ON cm.ContactKey = mail.ContactKey
       AND mail.AddressCategoryCode = 1
       LEFT OUTER JOIN AddressCategoryPreferences phone
       ON cm.ContactKey = phone.ContactKey
       AND phone.AddressCategoryCode = 2
       LEFT OUTER JOIN AddressCategoryPreferences fax
       ON cm.ContactKey = fax.ContactKey
       AND fax.AddressCategoryCode = 3
       LEFT OUTER JOIN AddressCategoryPreferences email
       ON cm.ContactKey = email.ContactKey
       AND email.AddressCategoryCode = 4

GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vContent_TemplatePath]'))
    DROP VIEW [dbo].[vContent_TemplatePath]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE  VIEW dbo.vContent_TemplatePath
AS
/*
This View is a part of SP - amsp_getTaggedPage, created in order to improve perfomance of the SP.
*/

SELECT 
	C.*, N.TemplatePath
FROM 
	Content C WITH (UPDLOCK),  
	Nav_Menu N WITH (UPDLOCK), 
	Nav_Menu Nb WITH (UPDLOCK)
  WHERE 

	C.NavMenuID = N.NavMenuID
	AND 
	N.AncestorNavMenuID = Nb.NavMenuID
	AND 
	ISNULL(N.HideFlag,'N') <> 'Y'
	AND 
	ISNULL(Nb.HideFlag,'N') <> 'Y'
	AND 
	C.WorkflowStatusCode = 'P'

GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vCurrent_Content]'))
    DROP VIEW [dbo].[vCurrent_Content]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE      VIEW vCurrent_Content AS
SELECT a.*
FROM Content a
WHERE WorkflowStatusCode IN ('W','E','A','Q')
OR (WorkflowStatusCode = 'P' AND NOT EXISTS (
       SELECT 1
         FROM Content b
        WHERE b.PreviousContentID = a.ContentID))

GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vDistributionReport]'))
    DROP VIEW [dbo].[vDistributionReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW dbo.vDistributionReport
AS
SELECT DISTINCT 
                      T.BT_ID AS ID, I.ORIGINATING_TRANS_NUM AS OriginalTransaction, T.TRANS_NUMBER AS TransactionNumber, 
                      T.TRANSACTION_DATE AS TransactionDate, I.INSTALL_BILL_DATE AS InstallDate, T.ACTIVITY_TYPE AS GiftType, CONVERT(float, - T.AMOUNT) 
                      AS Amount, A.CAMPAIGN_CODE AS Campaign, T.OWNER_ORG_CODE AS Fund, A.SOURCE_CODE AS Appeal, T.PRODUCT_CODE AS Distribution, 
                      T.SOLICITOR_ID AS SolicitorID, CONVERT(int, SUBSTRING(CONVERT(char(6), T.FISCAL_PERIOD), 5, 2)) AS FiscalMonth, CONVERT(int, 
                      SUBSTRING(CONVERT(char(6), T.FISCAL_PERIOD), 1, 4)) AS FiscalYear, I.SOURCE_SYSTEM AS SourceSystem
FROM         dbo.Trans AS T LEFT OUTER JOIN
                      dbo.Activity AS A ON T.ACTIVITY_SEQN = A.SEQN LEFT OUTER JOIN
                      dbo.Invoice AS I ON I.ORIGINATING_TRANS_NUM = T.TRANS_NUMBER
WHERE     (T.JOURNAL_TYPE = 'IN') AND (T.TRANSACTION_TYPE = 'DIST') AND (T.SOURCE_SYSTEM = 'FR')

GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vDonation]'))
    DROP VIEW [dbo].[vDonation]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
create view vDonation as
    select min(Activity.ID)                                ID,
           min(Activity.TRANSACTION_DATE)    TRANSACTION_DATE,
           min(Activity.SOURCE_CODE)               SOURCE_CODE,
           sum(Activity.AMOUNT)                        AMOUNT,
           Activity.ORIGINATING_TRANS_NUM,
           Activity.ORG_CODE,
           min(Activity.CAMPAIGN_CODE)          CAMPAIGN_CODE,
           min(Activity.SOLICITOR_ID)               SOLICITOR_ID, 
           sum (Activity.TAXABLE_VALUE)          TAXABLE_VALUE,
           max(Activity.OTHER_CODE)               OTHER_CODE,   
           max(UF_1)                                           UF_1, 
           max(Trans.MEM_TRIB_ID)                  MEM_TRIB_ID, 
           max(Trans.MEM_TRIB_NAME_TEXT)  MEM_TRIB_NAME_TEXT     
         /*from Activity,Trans - jf - 23 mar 06*/
        from Trans LEFT OUTER JOIN Activity on Trans.ACTIVITY_SEQN = Activity.SEQN
        where Activity.ACTIVITY_TYPE in ('GIFT','PLEDGE')    
        /*and Trans.ACTIVITY_SEQN *= Activity.SEQN*/
        and Trans.TRANSACTION_TYPE = 'DIST' and Trans.JOURNAL_TYPE = 'IN'
        and Trans.SOURCE_SYSTEM = 'FR'
 group by Activity.ORIGINATING_TRANS_NUM,Activity.ORG_CODE

GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vDonationsDistribution]'))
    DROP VIEW [dbo].[vDonationsDistribution]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vDonationsDistribution]
   AS
	SELECT	
		MAX(TransactionDate)as Date,  
		MAX(ID) as ID,  
		MAX(ORIGINATING_TRANS_NUM) as OriginalTransaction,  
		MAX(ActivityType) as GiftType,  
		SUM(Amount) as Amount, 
		MAX(SourceSystem) as SourceSystem, 
		MAX(SolicitorId) as SolicitorId,     
		MAX(UserField4) as RequestCode, 
		MAX(ProductCode) as ProductCode,  
		MAX(EntityCode) as FundCode, 
		MAX(SourceCode) as AppealCode , 
		MAX(CampaignCode) as CampaignCode  
			FROM vBoCsActivity 
				GROUP BY ORIGINATING_TRANS_NUM

GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vDonorRelationship]'))
    DROP VIEW [dbo].[vDonorRelationship]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW vDonorRelationship AS
    SELECT Relationship.ID                                  ID,  
           Relationship.TARGET_ID                         TID, 
           Relationship.RELATION_TYPE                 RTYPE,
           Relationship.TARGET_RELATION_TYPE  TRTYPE,
           Name_1.FULL_NAME                               NAME,
           Relationship.TARGET_NAME                   TNAME,
           Relationship.TITLE                                  TITLE, 
           Relationship.EFFECTIVE_DATE               EFFDATE, 
           Relationship.THRU_DATE                        THRUDATE,
           Relationship_Types.DESCRIPTION         RTDESC, 
           Name_1.COMPANY                                 COMPANY, 
           Name_1.COMPANY_RECORD                 COREC
    FROM Relationship INNER JOIN Name  ON 
                             Relationship.ID = Name.ID
              LEFT OUTER JOIN Name Name_1 ON   
                             Relationship.TARGET_ID = Name_1.ID
              INNER JOIN  Relationship_Types ON 
                             Relationship.RELATION_TYPE = Relationship_Types.RELATION_TYPE
  UNION
    SELECT Relationship.TARGET_ID                   ID,
           Relationship.ID                                        TID,    
           Relationship.TARGET_RELATION_TYPE  RTYPE,
           Relationship.RELATION_TYPE                 TRTYPE, 
           Name_1.FULL_NAME                               NAME, 
           Relationship.TARGET_NAME                   TNAME,
           Relationship.TITLE                                   TITLE, 
           Relationship.EFFECTIVE_DATE               EFFDATE, 
           Relationship.THRU_DATE                        THRUDATE,
           Relationship_Types.DESCRIPTION         RTDESC,    
           Name_1.COMPANY                                 COMPANY, 
           Name_1.COMPANY_RECORD                 COREC
    FROM Relationship INNER JOIN Name ON  
                  Relationship.TARGET_ID = Name.ID
         LEFT OUTER JOIN Name Name_1  ON  
                  Relationship.ID = Name_1.ID
         INNER JOIN  Relationship_Types ON
                  Relationship.TARGET_RELATION_TYPE = Relationship_Types.RELATION_TYPE

GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vFirstGift]'))
    DROP VIEW [dbo].[vFirstGift]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
create  view vFirstGift as
    select t.BT_ID as ID,
           t.TRANSACTION_DATE,
           t.TRANS_NUMBER,
           (sum(t.INVOICE_CREDITS)) as AMOUNT
    from Trans  t, Invoice i
    where t.INVOICE_REFERENCE_NUM = i.REFERENCE_NUM and
        ((t.JOURNAL_TYPE = 'PAY' and t.TRANSACTION_TYPE = 'AR') or
         (t.JOURNAL_TYPE = 'IN' and t.TRANSACTION_TYPE = 'PAY')) and
         i.SOURCE_SYSTEM = 'FR'
    group by t.BT_ID,t.TRANSACTION_DATE,t.TRANS_NUMBER having t.TRANS_NUMBER <=
        (select min(t2.TRANS_NUMBER) 
         from Trans  t2,Invoice  i2
         where t2.BT_ID = t.BT_ID and 
               t2.INVOICE_REFERENCE_NUM = i2.REFERENCE_NUM and
              ((t2.JOURNAL_TYPE = 'PAY' and t2.TRANSACTION_TYPE = 'AR') or
               (t2.JOURNAL_TYPE = 'IN' and t2.TRANSACTION_TYPE = 'PAY')) and
               i2.SOURCE_SYSTEM = 'FR')

GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vFRDonationTemp]'))
    DROP VIEW [dbo].[vFRDonationTemp]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
create view vFRDonationTemp as

------------- Select FR single gift and Pledge ------------
------------- select FR matching single gift and matching pledge ------------

select max(P.BT_ID) ID,
(case when max(P.IS_MATCH_GIFT)=1 then max(P.MATCH_GIFT_TRANS_NUM) else max(P.TRANS_NUMBER) end) as OriginalTransNumber,
max(P.TRANS_NUMBER) TransactionNumber,
'' as InvoiceRefNum,
'Fund Raising' as SourceSystem,
max(P.TRANSACTION_DATE) TransactionDate,
(sum(P.AMOUNT) * -1)  as Amount,
max(P.PRODUCT_CODE) Product,
max(P.SOURCE_CODE) Appeal,
max(P.CAMPAIGN_CODE) Campaign,
max(P.OWNER_ORG_CODE) Fund,
(case when max(P.INSTALL_BILL_DATE) is null then 'Gift' else 'Pledge' end) as GiftType,
(case when max(P.IS_MATCH_GIFT)= 1 then 'Matching' else '' end) as MatchOrSoftCredit,
max(Cash_Accounts.ACCOUNT_TYPE) as PaymentType,
'' as AdjustmentFlag
from Trans P
left outer join Cash_Accounts on P.CHECK_NUMBER = Cash_Accounts.CASH_ACCOUNT_CODE
where 
P.JOURNAL_TYPE = 'IN' and P.TRANSACTION_TYPE = 'DIST'
and P.SOURCE_SYSTEM='FR'
and P.POSTED >= 2
group by P.BT_ID, P.TRANS_NUMBER, P.OWNER_ORG_CODE, P.PRODUCT_CODE


union

------------ Create CM/DM for single gift and pledge for regular donation or matching Gift -----------

select max(C.BT_ID) ID,
'' as OriginalTransNumber,
max(Invoice.ORIGINATING_TRANS_NUM) TransactionNumber,
'' as InvoiceRefNum,
'' as SourceSystem,
'' as TransactionDate,
(sum(C.AMOUNT) * -1)  as Amount,
max(C.PRODUCT_CODE) Product,
'' as Appeal,
'' as Campaign,
max(C.OWNER_ORG_CODE) Fund,
'' as GiftType,
'' as MatchOrSoftCredit,
'' as PaymentType,
'Yes' as AdjustmentFlag
from Trans C
inner join Invoice on Invoice.REFERENCE_NUM = C.INVOICE_REFERENCE_NUM
where Invoice.SOURCE_SYSTEM='FR'
and ((C.JOURNAL_TYPE = 'CM' and C.TRANSACTION_TYPE = 'DIST')
or  (C.JOURNAL_TYPE = 'DM' and C.TRANSACTION_TYPE = 'DIST'))
and C.POSTED >= 2
group by C.BT_ID, C.TRANS_NUMBER, C.OWNER_ORG_CODE, C.PRODUCT_CODE

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vFRDonation]'))
    DROP VIEW [dbo].[vFRDonation]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
create view [dbo].[vFRDonation] as

--------------- Select single gift and pledge from FRDonationTemp -------------

select max(ID) ID,
max(OriginalTransNumber) OriginalTransNumber,
max(TransactionNumber) TransactionNumber,
'' as InvoiceRefNum,
'Fund Raising' as SourceSystem,
max(TransactionDate) TransactionDate,
sum(Amount) Amount,
max(Product) Product,
max(Appeal) Appeal,
max(Campaign) Campaign,
max(Fund) Fund,
max(GiftType) GiftType,
max(MatchOrSoftCredit) MatchOrSoftCredit,
-- max(PaymentType) PaymentType,
case 	when max(PaymentType) = 0 then 'Cash'  
	when max(PaymentType) = 1 then 'Credit Card'  
	when max(PaymentType) = 2 then 'In Kind'
	else ''
	end
as PaymentType,
max(AdjustmentFlag) AdjustmentFlag
from vFRDonationTemp
group by ID, TransactionNumber, Fund, Product

union

------------- select meeting gift   ------------

select max(Trans.ST_ID)ID,
min(Trans.TRANS_NUMBER)as OriginalTransNum,
min(Trans.TRANS_NUMBER)TransactionNumber,
max(Trans.INVOICE_REFERENCE_NUM) InvoiceRefNum,
'Event' as SourceSystem,
max(Trans.TRANSACTION_DATE)TransactionDate,
(sum(Trans.AMOUNT) * -1) as Amount,
max(Trans.PRODUCT_CODE) Product,
max(Trans.SOURCE_CODE)Appeal,
max(Trans.CAMPAIGN_CODE)Campaign,
Max(Trans.GL_ACCT_ORG_CODE) Fund,
'Gift' as GiftType,
'' as MatchOrSoftCredit,
'' as PaymentType,
'' as AdjustmentFlag
from Trans
where Trans.SOURCE_SYSTEM = 'MEETING'
and  Trans.JOURNAL_TYPE = 'IN'  and  Trans.TRANSACTION_TYPE = 'DIST'
and  Trans.IS_FR_ITEM = 1
and Trans.POSTED >= 2
group by Trans.ST_ID, Trans.INVOICE_REFERENCE_NUM, Trans.GL_ACCT_ORG_CODE, Trans.PRODUCT_CODE

union

----------- Select Soft Credit ---------------


select Max(Trans_SoftCredit.SOFT_CREDIT_ID) ID,
max(Trans_SoftCredit.TRANS_NUMBER)OriginalTransNum,
max(Trans_SoftCredit.TRANS_NUMBER)TransactionNumber,
'' as InvoiceRefNum,
'Fund Raising' as SourceSystem,
max(Activity.TRANSACTION_DATE) as TransactionDate,
sum(Trans_SoftCredit.AMOUNT) as Amount,
max(Trans_SoftCredit.PRODUCT_CODE) as Product,
max(Activity.SOURCE_CODE) as Appeal,
max(Activity.CAMPAIGN_CODE) as Campaign,
max(Activity.ORG_CODE) Fund,
(case when max(Activity.ACTIVITY_TYPE) = 'GIFT' then 'Gift' else 'Pledge' end) as GiftType,
'Soft Credit' as MatchOrSoftCredit,
case 	when max(Cash_Accounts.ACCOUNT_TYPE) = 0 then 'Cash'  
	when max(Cash_Accounts.ACCOUNT_TYPE) = 1 then 'Credit Card'  
	when max(Cash_Accounts.ACCOUNT_TYPE) = 2 then 'In Kind'
	else ''
	end
as PaymentType,
-- max(Cash_Accounts.ACCOUNT_TYPE) as PaymentType,
'' as AdjustmentFlag
from Trans_SoftCredit
inner join Activity on Activity.SEQN = Trans_SoftCredit.ORIGINATING_ACTIVITY_SEQN
inner join Trans on Trans.TRANS_NUMBER = Trans_SoftCredit.TRANS_NUMBER
left outer join Cash_Accounts on Trans.CHECK_NUMBER = Cash_Accounts.CASH_ACCOUNT_CODE
where Activity.SOURCE_SYSTEM='FR'
and Trans.LINE_NUMBER = 1 AND Trans.SUB_LINE_NUMBER = 1
and Trans.POSTED >= 2
group by Trans_SoftCredit.SOFT_CREDIT_ID, Trans_SoftCredit.TRANS_NUMBER, Activity.ORG_CODE, Trans_SoftCredit.PRODUCT_CODE

GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vFRParticipantTeamCaptain]'))
    DROP VIEW [dbo].[vFRParticipantTeamCaptain]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE VIEW [dbo].[vFRParticipantTeamCaptain]
AS
    SELECT f.[ID], 
           f.[MEETING], 
           f.[TeamID], 
           f.[TeamName], 
           f.[TeamType], 
           f.[TeamGoal], 
           a.[ID] AS [CaptainID]
      FROM [dbo].[Name_AlternateId] a
           RIGHT OUTER JOIN [dbo].[Name_FRTeamInformation] f ON a.[AlternateId] = f.[TeamCaptainAlternateId]
           AND a.[IdType] = 'Friendraising'


GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vGifts]'))
    DROP VIEW [dbo].[vGifts]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
create view vGifts as
  select min(Activity.ID)                              ID,
           min(Activity.TRANSACTION_DATE)  TRANSACTION_DATE,
           min(Activity.SOURCE_CODE)            SOURCE_CODE,
           -sum(Trans.AMOUNT)                       AMOUNT,
           max(TRANS_NUMBER)                      TRANS_NUMBER,
           min(Activity.CAMPAIGN_CODE)       CAMPAIGN_CODE,
           min(Activity.SOLICITOR_ID)            SOLICITOR_ID, 
           sum (Activity.TAXABLE_VALUE)        TAXABLE_VALUE,
           max(Activity.OTHER_CODE)             OTHER_CODE,
           max(Activity.DESCRIPTION)             DESCRIPTION,     
           max(UF_1)                                         UF_1,     
           max(Trans.INSTALL_BILL_DATE)      INSTALL_BILL_DATE,
           max(Trans.OWNER_ORG_CODE)     OWNER_ORG_CODE,
           max(Activity.SEQN)                          SEQN,
           max(Trans.MERGE_CODE)               MERGE_CODE
    from Trans LEFT OUTER JOIN Activity on Trans.ACTIVITY_SEQN = Activity.SEQN
    where Trans.TRANSACTION_TYPE = 'DIST' and Trans.JOURNAL_TYPE = 'IN'
      and Trans.INSTALL_BILL_DATE is null
      and Trans.SOURCE_SYSTEM = 'FR'
 group by Trans.TRANS_NUMBER

GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vGiftSummary]'))
    DROP VIEW [dbo].[vGiftSummary]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vGiftSummary] 
AS
    SELECT ID, 
           OriginalTransaction, 
           MAX(TransactionDate)  TransactionDate,
           SUM(Amount) Gift
    FROM vGift
    GROUP BY  OriginalTransaction,ID

GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vGreatestGift]'))
    DROP VIEW [dbo].[vGreatestGift]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
create  view vGreatestGift as
    select v.ID, 
           max(v.TRANSACTION_DATE) as TRANSACTION_DATE, 
           v.AMOUNT
    from vCashGiftTotals v
    group by v.ID, v.AMOUNT having v.AMOUNT >= 
             (select max(v2.AMOUNT) 
              from vCashGiftTotals as v2 
              where v2.ID = v.ID )

GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vInKindGifts]'))
    DROP VIEW [dbo].[vInKindGifts]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
create  view vInKindGifts as
   select t.BT_ID as ID,
          sum(t.INVOICE_CREDITS) as GIFT_AMOUNT
   from Trans t, Invoice i, Cash_Accounts c
   where t.INVOICE_REFERENCE_NUM = i.REFERENCE_NUM and
         i.SOURCE_SYSTEM = 'FR' and
         t.CHECK_NUMBER = c.CASH_ACCOUNT_CODE and
         c.ACCOUNT_TYPE= 2 and
         ((t.JOURNAL_TYPE = 'PAY' and t.TRANSACTION_TYPE = 'AR') or
             (t.JOURNAL_TYPE = 'IN' and t.TRANSACTION_TYPE = 'PAY'))
  group by t.BT_ID

GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vInvoiceDistibutionReport]'))
    DROP VIEW [dbo].[vInvoiceDistibutionReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vInvoiceDistibutionReport]
AS
/*****************************************************************************************
** This view provides detailed information about each Invoice Distribution Line
** on "One Row per Invoice Distribution" basis.  This view can return only one line for each
** Distribution but can return one or more lines per Invoice Line depending on the distribution.
** This view can be joined with Invoice or Invoice Line related views to get more detailed 
** information.
******************************************************************************************/

SELECT	
	IDN.InvoiceKey, IDN.InvoiceLineKey, IDN.InvoiceDistributionKey, PM.ProductCode, IDN.QuantitySold AS Quantity, 
	IDN.UnitIncome, IDN.ExtendedIncome, IDN.ExtendedIncomeRecognized, IDN.ExtendedCost, 
	IDN.IncomeGLAccountKey, IGLA.GLAccountCode AS IncomeGLAccountCode, IGLA.Description AS IncomeGLAccount, 
	IDN.ARGLAccountKey, ARGLA.GLAccountCode As ARGLAccountCode, ARGLA.Description AS ARGLAccount,
	IDN.DeferredIncomeGLAccountKey, DGLA.GLAccountCode As DeferredGLAccountCode, DGLA.Description AS DeferredGLAccount,
	IDN.DeferralTermsKey, IDN.WarehouseKey
FROM 
	InvoiceDistribution IDN
	LEFT OUTER JOIN GLAccount IGLA	ON	IDN.IncomeGLAccountKey = IGLA.GLAccountKey
	LEFT OUTER JOIN GLAccount ARGLA 	ON 	IDN.ARGLAccountKey = ARGLA.GLAccountKey
	LEFT OUTER JOIN GLAccount DGLA 	ON 	IDN.DeferredIncomeGLAccountKey = DGLA.GLAccountKey
	LEFT OUTER JOIN  InvoiceLine IL on IDN.InvoiceLineKey = IL.InvoiceLineKey
	LEFT OUTER JOIN ProductMain PM ON IL.ProductKey = PM.ProductKey

GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vLastGift]'))
    DROP VIEW [dbo].[vLastGift]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
create  view vLastGift as
    select t.BT_ID as ID,
           t.TRANSACTION_DATE,
           t.TRANS_NUMBER,
           sum(t.INVOICE_CREDITS) as AMOUNT
    from Trans  t 
    where ((t.JOURNAL_TYPE = 'PAY' and t.TRANSACTION_TYPE = 'AR') or
           (t.JOURNAL_TYPE = 'IN' and t.TRANSACTION_TYPE = 'PAY'))
          and t.SOURCE_SYSTEM = 'FR'
    group by t.BT_ID,t.TRANSACTION_DATE,
             t.TRANS_NUMBER having t.TRANSACTION_DATE = 
                (select max(t2.TRANSACTION_DATE) 
                 from Trans t2
                 where t2.BT_ID = t.BT_ID  and t2.SOURCE_SYSTEM = 'FR' and
                     ((t2.JOURNAL_TYPE = 'PAY' and t2.TRANSACTION_TYPE = 'AR') or
                      (t2.JOURNAL_TYPE = 'IN'  and t2.TRANSACTION_TYPE = 'PAY')))
                      and t.TRANS_NUMBER=(select max(t2.TRANS_NUMBER) 
                                          from Trans t2
                                          where t2.BT_ID = t.BT_ID  and t2.SOURCE_SYSTEM = 'FR' and
                                                t.TRANSACTION_DATE =t2.TRANSACTION_DATE and
                                                ((t2.JOURNAL_TYPE = 'PAY' and t2.TRANSACTION_TYPE = 'AR') or
                                                 (t2.JOURNAL_TYPE = 'IN'  and t2.TRANSACTION_TYPE = 'PAY')))

GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vLegacySecurityRole]'))
    DROP VIEW [dbo].[vLegacySecurityRole]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vLegacySecurityRole] 
AS
SELECT a.[UserId], c.[UserKey], 'CustomerLevel' + CAST(b.[LevelCode] AS varchar) AS Role
  FROM [dbo].[Users] AS a 
       INNER JOIN [dbo].[LegacySecurityLevelRef] AS b ON a.[LevelMembership] >= b.[LevelCode] 
       INNER JOIN [dbo].[UserMain] AS c ON a.[UserId] = c.[UserId]
UNION
SELECT a.[UserId], c.[UserKey], 'BillingLevel' + CAST(b.[LevelCode] AS varchar) AS Role
  FROM [dbo].[Users] AS a 
       INNER JOIN [dbo].[LegacySecurityLevelRef] AS b ON a.[LevelDues] >= b.[LevelCode] 
       INNER JOIN [dbo].[UserMain] AS c ON a.[UserId] = c.[UserId]
UNION
SELECT a.[UserId], c.[UserKey], 'CashARLevel' + CAST(b.[LevelCode] AS varchar) AS Role
  FROM [dbo].[Users] AS a 
       INNER JOIN [dbo].[LegacySecurityLevelRef] AS b ON a.[LevelCashAR] >= b.[LevelCode]  
       INNER JOIN [dbo].[UserMain] AS c ON a.[UserId] = c.[UserId]
UNION
SELECT a.[UserId], c.[UserKey], 'EventsLevel' + CAST(b.[LevelCode] AS varchar) AS Role
  FROM [dbo].[Users] AS a  
       INNER JOIN [dbo].[LegacySecurityLevelRef] AS b ON a.[LevelMeeting] >= b.[LevelCode]  
       INNER JOIN [dbo].[UserMain] AS c ON a.[UserId] = c.[UserId]
UNION
SELECT a.[UserId], c.[UserKey], 'OrdersLevel' + CAST(b.[LevelCode] AS varchar) AS Role
  FROM [dbo].[Users] AS a  
       INNER JOIN [dbo].[LegacySecurityLevelRef] AS b ON a.[LevelOrderEntry] >= b.[LevelCode]  
       INNER JOIN [dbo].[UserMain] AS c ON a.[UserId] = c.[UserId]
UNION
SELECT a.[UserId], c.[UserKey], 'ReferralLevel' + CAST(b.[LevelCode] AS varchar) AS Role
  FROM [dbo].[Users] AS a  
       INNER JOIN [dbo].[LegacySecurityLevelRef] AS b ON a.LevelReferral >= b.[LevelCode]  
       INNER JOIN [dbo].[UserMain] AS c ON a.[UserId] = c.[UserId]
UNION
SELECT a.[UserId], c.[UserKey], 'CertificationLevel' + CAST(b.[LevelCode] AS varchar) AS Role
  FROM [dbo].[Users] AS a  
       INNER JOIN [dbo].[LegacySecurityLevelRef] AS b ON a.[LevelCert] >= b.[LevelCode]  
       INNER JOIN [dbo].[UserMain] AS c ON a.[UserId] = c.[UserId]
UNION
SELECT a.[UserId], c.[UserKey], 'FundraisingLevel' + CAST(b.[LevelCode] AS varchar) AS Role
  FROM [dbo].[Users] AS a  
       INNER JOIN [dbo].[LegacySecurityLevelRef] AS b ON a.[LevelFundRaising] >= b.[LevelCode]  
       INNER JOIN [dbo].[UserMain] AS c ON a.[UserId] = c.[UserId]
UNION
SELECT a.[UserId], c.[UserKey], 'ServiceCentralLevel' + CAST(b.[LevelCode] AS varchar) AS Role
  FROM [dbo].[Users] AS a  
       INNER JOIN [dbo].[LegacySecurityLevelRef] AS b ON a.[LevelSC] >= b.[LevelCode]  
       INNER JOIN [dbo].[UserMain] AS c ON a.[UserId] = c.[UserId]
UNION
SELECT a.[UserId], c.[UserKey], 'ExpoLevel' + CAST(b.[LevelCode] AS varchar) AS Role
  FROM [dbo].[Users] AS a  
       INNER JOIN [dbo].[LegacySecurityLevelRef] AS b ON a.[LevelExpo] >= b.[LevelCode]  
       INNER JOIN [dbo].[UserMain] AS c ON a.[UserId] = c.[UserId]
UNION
SELECT a.[UserId], c.[UserKey], 'SysAdmin' AS Role
  FROM [dbo].[Users] AS a  
       INNER JOIN [dbo].[LegacySecurityLevelRef] AS b ON a.[LevelSystem] >= 8  
       INNER JOIN [dbo].[UserMain] AS c ON a.[UserId] = c.[UserId]

GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vLegacySecurityRoleRef]'))
    DROP VIEW [dbo].[vLegacySecurityRoleRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
create view vLegacySecurityRoleRef as
SELECT     'CustomerLevel' + CAST(b.LevelCode AS varchar) AS Role
FROM         dbo.LegacySecurityLevelRef AS b
UNION
SELECT     'BillingLevel' + CAST(b.LevelCode AS varchar) AS Role
FROM         dbo.LegacySecurityLevelRef AS b
UNION
SELECT     'CashARLevel' + CAST(b.LevelCode AS varchar) AS Role
FROM         dbo.LegacySecurityLevelRef AS b
UNION
SELECT     'EventsLevel' + CAST(b.LevelCode AS varchar) AS Role
FROM         dbo.LegacySecurityLevelRef AS b
UNION
SELECT     'OrdersLevel' + CAST(b.LevelCode AS varchar) AS Role
FROM         dbo.LegacySecurityLevelRef AS b
UNION
SELECT     'ReferralLevel' + CAST(b.LevelCode AS varchar) AS Role
FROM         dbo.LegacySecurityLevelRef AS b
UNION
SELECT     'CertificationLevel' + CAST(b.LevelCode AS varchar) AS Role
FROM         dbo.LegacySecurityLevelRef AS b
UNION
SELECT     'FundraisingLevel' + CAST(b.LevelCode AS varchar) AS Role
FROM         dbo.LegacySecurityLevelRef AS b
UNION
SELECT     'ServiceCentralLevel' + CAST(b.LevelCode AS varchar) AS Role
FROM         dbo.LegacySecurityLevelRef AS b
UNION
SELECT     'ExpoLevel' + CAST(b.LevelCode AS varchar) AS Role
FROM         dbo.LegacySecurityLevelRef AS b

GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vMatching]'))
    DROP VIEW [dbo].[vMatching]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
create view vMatching as
 select min(Activity.ID)                                    ID,
           min(Activity.TRANSACTION_DATE)        TRANSACTION_DATE,
           min(Activity.SOURCE_CODE)                  SOURCE_CODE,
           -(sum(Trans.AMOUNT))                           AMOUNT,
           max(TRANS_NUMBER)                             TRANS_NUMBER,
           min(Activity.CAMPAIGN_CODE)              CAMPAIGN_CODE,
           min(Activity.SOLICITOR_ID)                   SOLICITOR_ID, 
           sum (Activity.TAXABLE_VALUE)               TAXABLE_VALUE,
           max(Activity.OTHER_CODE)                   OTHER_CODE,
           max(Activity.DESCRIPTION)                   DESCRIPTION,    
           max(UF_1)                                               UF_1,   
           max(Trans.INSTALL_BILL_DATE)            INSTALL_BILL_DATE, 
           max(Trans.OWNER_ORG_CODE)           OWNER_ORG_CODE,
           max(Activity.SEQN)                                 SEQN,
           max(Trans.MERGE_CODE)                      MERGE_CODE,
           max(Trans.MATCH_GIFT_TRANS_NUM) MATCH_GIFT_TRANS_NUM
    from Trans
    inner join Activity on Trans.ACTIVITY_SEQN = Activity.SEQN 
        and Trans.TRANSACTION_TYPE = 'DIST' and Trans.JOURNAL_TYPE = 'IN'
        and Trans.IS_MATCH_GIFT = 1
        and Trans.SOURCE_SYSTEM = 'FR'
 group by Trans.TRANS_NUMBER,Trans.OWNER_ORG_CODE

GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vMeetDonation]'))
    DROP VIEW [dbo].[vMeetDonation]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
create view vMeetDonation as
    select min(Trans.ST_ID)                                  ST_ID,
           min(Trans.TRANSACTION_DATE)            TRANSACTION_DATE,
           -(sum(Trans.AMOUNT))                           AMOUNT,
           max(TRANS_NUMBER)                             TRANS_NUMBER, 
           sum(Trans.INVOICE_CHARGES)              INVOICE_CHARGES, 
           sum(Trans.INVOICE_CREDITS)                INVOICE_CREDITS,
           max(Trans.INSTALL_BILL_DATE)             INSTALL_BILL_DATE, 
           max(Trans.OWNER_ORG_CODE)            OWNER_ORG_CODE,
           max(Trans.INVOICE_REFERENCE_NUM) INVOICE_REFERENCE_NUM,
           max(Trans.SOLICITOR_ID)                      SOLICITOR_ID,
           max(Trans.SOURCE_CODE)                     MEET_APPEAL,
           max(Trans.CAMPAIGN_CODE)                 MEET_CAMPAIGN,
           max(SUBSTRING(Trans.PRODUCT_CODE,1,charindex('/',Trans.PRODUCT_CODE)-1)) MEETING, '' as TITLE
    from Trans
    where Trans.TRANSACTION_TYPE = 'DIST' and Trans.JOURNAL_TYPE = 'IN'
        and Trans.SOURCE_SYSTEM = 'MEETING'
        and Trans.IS_FR_ITEM = 1
 group by Trans.ST_ID, Trans.GL_ACCT_ORG_CODE, Trans.CAMPAIGN_CODE, Trans.SOURCE_CODE

GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vMeetDonationSumm]'))
    DROP VIEW [dbo].[vMeetDonationSumm]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
create  view vMeetDonationSumm as
    select max(Trans.ST_ID) as ST_ID, 
           -sum(Trans.AMOUNT) as AMOUNT
    from Trans
    where Trans.SOURCE_SYSTEM = 'MEETING'
     and  Trans.JOURNAL_TYPE = 'IN'  and  Trans.TRANSACTION_TYPE = 'DIST'
     and  Trans.IS_FR_ITEM = 1
  group by Trans.ST_ID

GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vNameProspectUnion]'))
    DROP VIEW [dbo].[vNameProspectUnion]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vNameProspectUnion] 
AS 
SELECT ID, PREFIX, LAST_FIRST, FIRST_NAME, MIDDLE_NAME, LAST_NAME, SUFFIX,FULL_NAME, TITLE, COMPANY, COMPANY_SORT, CITY, STATE_PROVINCE, ZIP, COUNTRY, HOME_PHONE, WORK_PHONE, FAX, EMAIL, ORG_CODE, MEMBER_TYPE, CATEGORY, STATUS, MAJOR_KEY, CO_ID, BT_ID,  DUP_MATCH_KEY, FULL_ADDRESS, DESIGNATION, INFORMAL, TOLL_FREE, MAIL_CODE, CRRT, BAR_CODE,  COUNTY, MAIL_ADDRESS_NUM, BILL_ADDRESS_NUM, GENDER, BIRTH_DATE,US_CONGRESS, STATE_SENATE,  STATE_HOUSE, SIC_CODE, CHAPTER, FUNCTIONAL_TITLE, CONTACT_RANK, MEMBER_RECORD, COMPANY_RECORD,  JOIN_DATE, SOURCE_CODE, PAID_THRU, MEMBER_STATUS, MEMBER_STATUS_DATE, PREVIOUS_MT,  MT_CHANGE_DATE, CO_MEMBER_TYPE, EXCLUDE_MAIL, EXCLUDE_DIRECTORY, DATE_ADDED, LAST_UPDATED, UPDATED_BY, INTENT_TO_EDIT, ADDRESS_NUM_1, ADDRESS_NUM_2, ADDRESS_NUM_3, WEBSITE, '' AS ImisID,0 as IsProspect 
FROM [Name] 
UNION ALL 
SELECT  ProspectID as ID, Prefix as PREFIX, LastFirst as LAST_FIRST, FirstName as FIRST_NAME, MiddleName as MIDDLE_NAME, LastName as LAST_NAME, Suffix as SUFFIX, FullName as FULL_NAME, Title as TITLE, Organization as COMPANY, CompanySort as COMPANY_SORT, City as CITY,  StateProvince as STATE_PROVINCE, PostalCode as ZIP, Country as COUNTRY, HomePhone as HOME_PHONE,  WorkPhone as WORK_PHONE, Fax as FAX, Email as EMAIL, '' AS ORG_CODE, ListCode AS MEMBER_TYPE, '' AS CATEGORY, '' AS STATUS, '' AS MAJOR_KEY, '' AS CO_ID,   '' AS BT_ID, '' AS DUP_MATCH_KEY, '' AS FULL_ADDRESS, '' AS DESIGNATION, '' AS INFORMAL,  '' AS TOLL_FREE, '' AS MAIL_CODE, '' AS CRRT, '' AS BAR_CODE, '' AS COUNTY, 0 AS MAIL_ADDRESS_NUM,  0 AS BILL_ADDRESS_NUM, '' AS GENDER, NULL AS BIRTH_DATE, '' AS US_CONGRESS, '' AS STATE_SENATE,  '' AS STATE_HOUSE, '' AS SIC_CODE, '' AS CHAPTER, '' AS FUNCTIONAL_TITLE, 0 AS CONTACT_RANK, 0 AS MEMBER_RECORD,  0 AS COMPANY_RECORD, NULL AS JOIN_DATE, '' AS SOURCE_CODE, NULL AS PAID_THRU, '' AS MEMBER_STATUS,  NULL AS MEMBER_STATUS_DATE, '' AS PREVIOUS_MT, NULL AS MT_CHANGE_DATE, '' AS CO_MEMBER_TYPE, 0 AS EXCLUDE_MAIL,  0 AS EXCLUDE_DIRECTORY, NULL AS DATE_ADDED, NULL AS LAST_UPDATED, '' AS UPDATED_BY, '' AS INTENT_TO_EDIT,  0 AS ADDRESS_NUM_1, 0 AS ADDRESS_NUM_2, 0 AS ADDRESS_NUM_3, '' AS WEBSITE, ImisID,1 as IsProspect 
FROM [Prospect]

GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vOnlineEventRegAnswers]'))
    DROP VIEW [dbo].[vOnlineEventRegAnswers]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vOnlineEventRegAnswers]
AS
SELECT	OrderAnswer.OrderNumber, 
		OrderAnswer.QuestionID, 
		OrderAnswer.Answer, 
		EventSetupQuestion.Question, 
		EventSetupQuestion.QuestionType, 
		EventSetupQuestion.Required, 
		EventSetupQuestion.QuestionOrder
FROM	OrderAnswer 
		INNER JOIN EventSetupQuestion 
		ON OrderAnswer.QuestionID = EventSetupQuestion.EventSetupQuestionID

GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vPayments]'))
    DROP VIEW [dbo].[vPayments]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
create view vPayments as
     select max(C.TRANS_NUMBER)                     TRANS_NUMBER,
           max(C.TRANSACTION_DATE)                TRANSACTION_DATE,
           max(C.JOURNAL_TYPE)                         JOURNAL_TYPE,
           max(C.TRANSACTION_TYPE)                 TRANSACTION_TYPE,
           sum(C.AMOUNT)                                     AMOUNT,
           max(C.BT_ID)                                         BT_ID,
           max(C.DESCRIPTION)                            DESCRIPTION,
           max(C.OWNER_ORG_CODE)                 OWNER_ORG_CODE,
           max(Cash_Accounts.ACCOUNT_TYPE)  ACCOUNT_TYPE,
           max(C.INVOICE_REFERENCE_NUM)      INVOICE_REFERENCE_NUM,
           max(Activity.SOURCE_CODE)                SOURCE_CODE,
           max(C.ACTION_CODES)                        ACTION_CODES,
           max(C.PRODUCT_CODE)                       PRODUCT_CODE,
           max(P.SOLICITOR_ID)                          SOLICITOR_ID,
           max(C.CHECK_NUMBER)                       CHECK_NUMBER,
           max(Activity.CAMPAIGN_CODE)           CAMPAIGN_CODE,
           max(C.INSTALL_BILL_DATE)                 INSTALL_BILL_DATE,
           sum(C.INVOICE_CREDITS)                    INVOICE_CREDITS,
           max(Activity.SEQN)                               SEQN
     from Trans as P
     INNER JOIN Invoice on Invoice.ORIGINATING_TRANS_NUM = P.TRANS_NUMBER and Invoice.SOURCE_SYSTEM='FR'
     INNER JOIN Trans as C on C.INVOICE_REFERENCE_NUM=Invoice.REFERENCE_NUM
      and ((C.JOURNAL_TYPE = 'PAY' and C.TRANSACTION_TYPE = 'AR')    
      or  (C.JOURNAL_TYPE = 'IN' and C.TRANSACTION_TYPE = 'PAY'))
     LEFT OUTER JOIN Cash_Accounts on C.CHECK_NUMBER = Cash_Accounts.CASH_ACCOUNT_CODE
     LEFT OUTER JOIN Activity on P.ACTIVITY_SEQN = Activity.SEQN
     and P.LINE_NUMBER = 1 and  P.SUB_LINE_NUMBER = 1
     and P.JOURNAL_TYPE = 'IN' and P.TRANSACTION_TYPE = 'DIST'    
 group by C.TRANS_NUMBER,C.INVOICE_REFERENCE_NUM

GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vPaymentScheduleReport]'))
    DROP VIEW [dbo].[vPaymentScheduleReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vPaymentScheduleReport]
AS
/*****************************************************************************************
** This view provides detailed information about each Payment Schedule Line
** on "One Row per Payment Schedule Line" basis. This view can be joined with Invoice and 
**Invoice Line related views to get more detailed information.
******************************************************************************************/

SELECT	
	PSL.PaymentNumber, PSL.DueDate,  PSL.AmountDue,  PSL.OutstandingBalance, MA.Amount AS AppliedAmount,
	PSL.InvoiceKey, PSL.PaymentScheduleLineKey, PSL.GLAccountKey
FROM 
	PaymentScheduleLine PSL
	LEFT OUTER JOIN MonetaryApplication MA 			ON 	PSL.PaymentScheduleLineKey = MA.PaymentScheduleLineKey

GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vPledgeBalances]'))
    DROP VIEW [dbo].[vPledgeBalances]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
create  view vPledgeBalances as
    select i.BT_ID,
           SUM(i.BALANCE) as BALANCE
    from Invoice i
    where i.SOURCE_SYSTEM = 'FR' and i.BALANCE <> 0
 group by i.BT_ID

GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vPledges]'))
    DROP VIEW [dbo].[vPledges]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
create view vPledges as
    select min(Activity.ID)                                 ID,
           min(Activity.TRANSACTION_DATE)     TRANSACTION_DATE,
           min(Activity.SOURCE_CODE)              SOURCE_CODE,
           -sum(Trans.AMOUNT)                         AMOUNT,
           max(TRANS_NUMBER)                        TRANS_NUMBER,
           min(Activity.CAMPAIGN_CODE)          CAMPAIGN_CODE,
           min(Activity.SOLICITOR_ID)               SOLICITOR_ID, 
           sum (Activity.TAXABLE_VALUE)          TAXABLE_VALUE,
           max(Activity.OTHER_CODE)               OTHER_CODE,
           max(Activity.DESCRIPTION)               DESCRIPTION,     
           max(UF_1)                                           UF_1, 
           max(Trans.INSTALL_BILL_DATE)        INSTALL_BILL_DATE, 
           max(Trans.OWNER_ORG_CODE)        OWNER_ORG_CODE,
           max(Activity.SEQN)                             SEQN,
           max(Trans.MERGE_CODE)                  MERGE_CODE,
           max(Trans.MEM_TRIB_ID)                  MEM_TRIB_ID,
           max(Trans.MEM_TRIB_NAME_TEXT)  MEM_TRIB_NAME_TEXT     
        from Trans LEFT OUTER JOIN Activity on Trans.ACTIVITY_SEQN = Activity.SEQN   
        where Trans.TRANSACTION_TYPE = 'DIST' and Trans.JOURNAL_TYPE = 'IN'
        and Trans.INSTALL_BILL_DATE is not null
        and Trans.SOURCE_SYSTEM = 'FR'
 group by Trans.TRANS_NUMBER,Trans.OWNER_ORG_CODE

GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vPledgeSummary]'))
    DROP VIEW [dbo].[vPledgeSummary]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
Create view vPledgeSummary as
    select ID, TransactionNumber, 
           Max(TransactionDate)  TransactionDate,
           Sum(NetPledgeAmount)  Pledge
    from vPledge
 Group by  TransactionNumber,ID

GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vPostingInvoiceData]'))
    DROP VIEW [dbo].[vPostingInvoiceData]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE                                    VIEW [dbo].[vPostingInvoiceData] AS
SELECT im.InvoiceKey, im.InvoiceNumber, im.FinalBatchKey as 'BatchKey',
im.AccountingMethodCode, im.FinancialEntityKey, im.PaymentTermsKey, 
im.InvoiceDate, il.InvoiceLineKey, il.OrderLineNumber, il.InvoiceLineNumber, il.ParentInvoiceLineKey,
PayPriority = CASE WHEN il.PayPriority is null OR il.PayPriority = 0 THEN 999999999 ELSE il.PayPriority END, idist.QuantitySold,
idist.InvoiceDistributionKey, ExtendedIncome = ISNULL(idist.ExtendedIncome,0), 
ExtendedIncomeRecognized = ISNULL(idist.ExtendedIncomeRecognized,0),
IncomeGLAccountKey = CASE WHEN idist.IncomeGLAccountKey = '00000000-0000-0000-0000-000000000000' THEN null ELSE idist.IncomeGLAccountKey END, 
ARGLAccountKey = CASE WHEN idist.ARGLAccountKey = '00000000-0000-0000-0000-000000000000' THEN null ELSE idist.ARGLAccountKey END, 
DeferredIncomeGLAccountKey = CASE WHEN idist.DeferredIncomeGLAccountKey = '00000000-0000-0000-0000-000000000000' THEN null ELSE idist.DeferredIncomeGLAccountKey END, 
DeferralTermsKey = CASE WHEN idist.DeferralTermsKey = '00000000-0000-0000-0000-000000000000' THEN null ELSE idist.DeferralTermsKey END,
om.OrderTypeKey, om.ResponseMediaCode, ol.PriceSheetKey, GeneratesSalesHistoryFlag = ISNULL(pt.GeneratesSalesHistoryFlag,0), idist.ExtendedCost,
AppliedTotal = (SELECT ISNULL(SUM(Amount),0) + ISNULL(SUM(DiscountTaken),0) FROM MonetaryApplication WHERE InvoiceDistributionKey = idist.InvoiceDistributionKey), 
im.InvoiceTypeCode, DistFinancialEntityKey = idist.FinancialEntityKey, im.BillToContactKey, il.ShipToContactKey, im.SoldToContactKey,
idist.UnitIncome, SourceCodeKey = CASE WHEN il.SourceCodeKey is null OR il.SourceCodeKey = '00000000-0000-0000-0000-000000000000' THEN im.SourceCodeKey ELSE il.SourceCodeKey END,
idist.WarehouseKey, om.OrderNumber, om.OrderDate, pm.ProductKey, UndiscountedExtendedPrice = ISNULL(ol.BasePrice,0) * ISNULL(ol.Quantity,0),
ol.UomKey, im.CommissionPlanKey, im.SalesTeamGroupKey, il.ExtendedPrice,
SalesLocationKey = CASE 
WHEN im.SalesLocationKey IS NOT null AND im.SalesLocationKey != '00000000-0000-0000-0000-000000000000' THEN im.SalesLocationKey 
WHEN om.SalesLocationKey IS NOT null AND om.SalesLocationKey != '00000000-0000-0000-0000-000000000000' THEN om.SalesLocationKey
ELSE null END,
IsPledge = CASE WHEN il.IsPledge is null THEN 0 ELSE il.IsPledge END,
im.FirstPaymentDueDate, im.Description, 
fbatch.BatchNumber as 'FinalBatchNumber',
obatch.BatchNumber as 'OriginatingBatchNumber'
FROM InvoiceMain im
INNER JOIN InvoiceLine il on il.InvoiceKey = im.InvoiceKey
LEFT OUTER JOIN ProductMain pm on pm.ProductKey = il.ProductKey
LEFT OUTER JOIN ProductType pt on pt.ProductTypeKey = pm.ProductTypeKey
LEFT OUTER JOIN OrderMain om on im.OrderNumber = om.OrderNumber AND im.SystemEntityKey = om.SystemEntityKey
LEFT OUTER JOIN OrderLine ol on il.OrderLineNumber = ol.SequenceOrderLineNumber AND ol.OrderKey = om.OrderKey
LEFT OUTER JOIN InvoiceDistribution idist on idist.InvoiceLineKey = il.InvoiceLineKey
LEFT OUTER JOIN BatchInstance fbatch on fbatch.BatchKey = im.FinalBatchKey
LEFT OUTER JOIN BatchInstance obatch on obatch.BatchKey = im.OriginatingBatchKey

GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vPostingPaymentData]'))
    DROP VIEW [dbo].[vPostingPaymentData]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE                          VIEW [dbo].[vPostingPaymentData] AS
SELECT  SrcPaymentKey = CASE WHEN PaymentMain.PaymentKey  = '00000000-0000-0000-0000-000000000000' THEN null ELSE PaymentMain.PaymentKey END, MonetaryApplication.SrcInvoiceLineKey, 
	PaymentMain.Amount, PaymentMain.FinancialEntityKey, PaymentMain.FinalBatchKey as 'BatchKey', SrcInvoiceKey = null, MonetaryApplication.MonetaryApplicationKey, 
	AppliedAmount = ISNULL(MonetaryApplication.Amount,0)+ISNULL(MonetaryApplication.DiscountTaken,0),
	OrderNumber = MonetaryApplication.OrderNumber, 
	OrderLineNumber = MonetaryApplication.OrderLineNumber, 
	InvoiceKey = CASE WHEN MonetaryApplication.InvoiceKey = '00000000-0000-0000-0000-000000000000' THEN null ELSE MonetaryApplication.InvoiceKey END, 
	InvoiceLineKey = CASE WHEN MonetaryApplication.InvoiceLineKey = '00000000-0000-0000-0000-000000000000' THEN null ELSE MonetaryApplication.InvoiceLineKey END, 
	InvoiceDistributionKey = CASE WHEN MonetaryApplication.InvoiceDistributionKey = '00000000-0000-0000-0000-000000000000' THEN null ELSE MonetaryApplication.InvoiceDistributionKey END,
	PaymentMain.PaymentDate, InvFinancialEntityKey = InvoiceDistribution.FinancialEntityKey,  DiscountTaken = ISNULL(MonetaryApplication.DiscountTaken,0), PaymentMain.BatchLineStatusCode, MonetaryApplication.CurrencyVariance,
	SalesLocationKey = null, batch.BatchNumber as 'FinalBatchNumber', PaymentMain.SummaryDisplay as 'Description',
	PaymentMain.PayorContactKey as 'ContactKey', MonetaryApplication.TransactionDate as 'TransactionDate', 
	MonetaryApplication.TransactionType as 'TransactionType', MonetaryApplication.BatchKey as 'ApplicationBatchKey',
	PaymentTypePriority = ISNULL(type.Priority, 99999999), 
	CashGLAccountKey = ISNULL(meth.CashGLAccountKey, pgla.GLAccountKey)
	from PaymentMain
	LEFT OUTER JOIN PaymentMethod meth on PaymentMain.PaymentMethodKey = meth.PaymentMethodKey
	LEFT OUTER JOIN PaymentType type on  meth.PaymentTypeKey = type.PaymentTypeKey
	LEFT OUTER JOIN MonetaryApplication on MonetaryApplication.SrcPaymentKey = PaymentMain.PaymentKey
	LEFT OUTER JOIN InvoiceDistribution on MonetaryApplication.InvoiceDistributionKey = InvoiceDistribution.InvoiceDistributionKey
    LEFT OUTER JOIN BatchInstance batch on batch.BatchKey = PaymentMain.FinalBatchKey
    LEFT OUTER JOIN ProductGLAccount pgla on meth.FinancialEntityKey = pgla.ParentKey
    WHERE pgla.GLAccountPurposeCode IS NULL OR pgla.GLAccountPurposeCode = 'CAS'
	UNION
	SELECT SrcPaymentKey = CASE WHEN MonetaryApplication.SrcPaymentKey  = '00000000-0000-0000-0000-000000000000' THEN null ELSE MonetaryApplication.SrcPaymentKey END, 
	SrcInvoiceLineKey = CASE WHEN MonetaryApplication.SrcInvoiceLineKey  = '00000000-0000-0000-0000-000000000000' THEN null ELSE MonetaryApplication.SrcInvoiceLineKey END, 
	Amount = -1 * InvoiceLine.ExtendedPrice, InvoiceMain.FinancialEntityKey, InvoiceMain.FinalBatchKey as 'BatchKey', SrcInvoiceKey = InvoiceMain.InvoiceKey,
	MonetaryApplication.MonetaryApplicationKey, AppliedAmount = ISNULL(MonetaryApplication.Amount,0)+ISNULL(MonetaryApplication.DiscountTaken,0),
	OrderNumber = MonetaryApplication.OrderNumber, 
	OrderLineNumber = MonetaryApplication.OrderLineNumber, 
	InvoiceKey = CASE WHEN MonetaryApplication.InvoiceKey = '00000000-0000-0000-0000-000000000000' THEN null ELSE MonetaryApplication.InvoiceKey END, 
	InvoiceLineKey = CASE WHEN MonetaryApplication.InvoiceLineKey = '00000000-0000-0000-0000-000000000000' THEN null ELSE MonetaryApplication.InvoiceLineKey END, 
	InvoiceDistributionKey = CASE WHEN MonetaryApplication.InvoiceDistributionKey = '00000000-0000-0000-0000-000000000000' THEN null ELSE MonetaryApplication.InvoiceDistributionKey END,
	PaymentDate = InvoiceMain.InvoiceDate, InvFinancialEntityKey = null, DiscountTaken = ISNULL(MonetaryApplication.DiscountTaken, 0), InvoiceMain.BatchLineStatusCode, MonetaryApplication.CurrencyVariance,
	SalesLocationKey = CASE WHEN InvoiceMain.SalesLocationKey = '00000000-0000-0000-0000-000000000000' THEN null ELSE InvoiceMain.SalesLocationKey END,
	batch.BatchNumber as 'FinalBatchNumber', InvoiceMain.InvoiceNumber as 'Description',
	InvoiceMain.BillToContactKey as 'ContactKey', MonetaryApplication.TransactionDate as 'TransactionDate', 
	MonetaryApplication.TransactionType as 'TransactionType', MonetaryApplication.BatchKey as 'ApplicationBatchKey',
	PaymentTypePriority = 1, null
	from InvoiceLine
	INNER JOIN MonetaryApplication on MonetaryApplication.SrcInvoiceLineKey = InvoiceLine.InvoiceLineKey
	INNER JOIN InvoiceMain on InvoiceMain.InvoiceKey = InvoiceLine.InvoiceKey
    LEFT OUTER JOIN BatchInstance batch on batch.BatchKey = InvoiceMain.FinalBatchKey

GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vProcessTaskAssignee]'))
    DROP VIEW [dbo].[vProcessTaskAssignee]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vProcessTaskAssignee] 
AS
SELECT TI.[TaskItemKey],CM.[FullName]
  FROM [dbo].[TaskItem] AS TI LEFT OUTER JOIN
       [dbo].[OpportunityMain] AS OM ON OM.[OpportunityKey] = TI.[OpportunityKey] LEFT OUTER JOIN
       [dbo].[GroupMemberDetail] AS OGMD ON OGMD.[GroupRoleKey] = TI.[AssignedToKey] AND OGMD.[GroupKey] = OM.[OpportunityOwnerGroupKey] INNER JOIN 
       [dbo].[GroupMember] AS OGM ON OGM.[GroupMemberKey] = OGMD.[GroupMemberKey] INNER JOIN 
       [dbo].[ContactMain] AS CM ON CM.[ContactKey] = OGM.[MemberContactKey] 
UNION
SELECT TI.[TaskItemKey],CM.[FullName]
  FROM [dbo].[TaskItem] AS TI INNER JOIN
       [dbo].[ContactMain] AS CM ON CM.[ContactKey] = TI.[AssignedToKey]

GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vQueryResults_int]'))
    DROP VIEW [dbo].[vQueryResults_int]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
/****** Object:  View dbo.vQueryResults_int    Script Date: 7/3/2003 4:57:56 PM ******/
CREATE VIEW dbo.vQueryResults_int
AS
SELECT     QueryResultKey, CONVERT(int, AnyKey) AS AnyKey
FROM         dbo.QueryResultItem

GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vQueryResults_uniqueidentifier]'))
    DROP VIEW [dbo].[vQueryResults_uniqueidentifier]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
/****** Object:  View dbo.vQueryResults_uniqueidentifier    Script Date: 7/3/2003 4:57:56 PM ******/
CREATE VIEW dbo.vQueryResults_uniqueidentifier
AS
SELECT     QueryResultKey, CONVERT(uniqueidentifier, AnyKey) AS AnyKey
FROM         dbo.QueryResultItem

GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vQueryResults_varchar10]'))
    DROP VIEW [dbo].[vQueryResults_varchar10]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
/****** Object:  View dbo.vQueryResults_varchar10    Script Date: 7/3/2003 4:57:56 PM ******/
CREATE VIEW dbo.vQueryResults_varchar10
AS
SELECT     QueryResultKey, CONVERT(varchar(10), AnyKey) AS AnyKey
FROM         dbo.QueryResultItem

GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vQueryResults_varchar30]'))
    DROP VIEW [dbo].[vQueryResults_varchar30]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
/****** Object:  View dbo.vQueryResults_varchar30    Script Date: 7/3/2003 4:57:59 PM ******/
CREATE VIEW dbo.vQueryResults_varchar30
AS
SELECT     QueryResultKey, CONVERT(varchar(30), AnyKey) AS AnyKey
FROM         dbo.QueryResultItem

GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vRecycle_Bin]'))
    DROP VIEW [dbo].[vRecycle_Bin]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
/*==============================================================*/
/* View: vRecycle_Bin                           */
/*==============================================================*/
CREATE      VIEW vRecycle_Bin AS
SELECT a.*
FROM Content a 
LEFT OUTER JOIN Content b
 ON a.ContentID = b.PreviousContentID
WHERE a.WorkflowStatusCode IN ('Y','D')
AND b.ContentID IS NULL

GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSecurityRead]'))
    DROP VIEW [dbo].[vSecurityRead]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
create view vSecurityRead as
select    AccessItem.AccessKey, UserToken.UserKey
 from    AccessItem
            inner join UserToken on AccessItem.Grantee = UserToken.Grantee
 where  (AccessItem.Permission & 3) > 0
 group by AccessItem.AccessKey, UserToken.UserKey

GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSoaCashInvoiceLine]'))
    DROP VIEW [dbo].[vSoaCashInvoiceLine]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE VIEW [dbo].[vSoaCashInvoiceLine]
AS
-- Union Cash subscriptions
SELECT CAST(s.[ID] + ':' + s.[PRODUCT_CODE] AS VARCHAR(31)) AS InvoiceLineId,
       CAST('CASH:' + s.[ID] AS VARCHAR(20)) AS InvoiceId,
       s.[INVOICE_REFERENCE_NUM] AS InvoiceNumber,
       s.[INVOICE_LINE_NUM] AS LineNumber,
       s.[PRODUCT_CODE] AS ItemId,
       s.[ID] AS ShipToPartyId,
       s.[COPIES] AS Quantity,
       CAST(CASE WHEN s.[BILL_COPIES] > 0 THEN (s.[BILL_AMOUNT]/s.[BILL_COPIES]) ELSE s.[BILL_AMOUNT] END AS MONEY) AS UnitPrice,       
       (CASE WHEN s.[PROD_TYPE] != 'VOL' THEN s.[BILL_AMOUNT] ELSE
        (CASE WHEN (ISNULL(SUM(s2.[BALANCE]),0) - ISNULL(SUM(t2.[AMOUNT] + t2.[ADJUSTMENT_AMOUNT]),0) <= 0) 
            THEN (s.[PAYMENT_AMOUNT] + s.[ADJUSTMENT_AMOUNT]) + ISNULL(SUM(t.[AMOUNT] + t.[ADJUSTMENT_AMOUNT]), 0) 
           ELSE s.[BILL_AMOUNT] 
         END) 
        END) AS ExtendedAmount,   
       (s.[PAYMENT_AMOUNT] + s.[ADJUSTMENT_AMOUNT]) AS PaymentAdjustmentAmount,
       ISNULL(-(t.[AMOUNT] + t.[ADJUSTMENT_AMOUNT]),0) AS PendingPaymentAdjustmentAmount,
       (CASE WHEN s.[PROD_TYPE] = 'VOL' THEN (CASE WHEN (ISNULL(SUM(s2.[BALANCE]),0) - 
         ISNULL(SUM(t2.[AMOUNT] + t2.[ADJUSTMENT_AMOUNT]),0) <= 0) THEN 0 ELSE
          (s.[BALANCE]  + ISNULL((t.[AMOUNT] + t.[ADJUSTMENT_AMOUNT]),0)) END) ELSE 
         (s.[BALANCE]  + ISNULL((t.[AMOUNT] + t.[ADJUSTMENT_AMOUNT]),0)) END) AS Balance
 FROM  [dbo].[Subscriptions] s 
       LEFT JOIN  
       [dbo].[Subscriptions] s2 ON s.[ID] = s2.[ID] AND s2.[PROD_TYPE] != 'VOL' 
       LEFT JOIN [dbo].[Trans] t ON (s.[PRODUCT_CODE] = t.[PRODUCT_CODE] AND s.[ID] = t.[ST_ID]
         AND t.[POSTED] < 2 AND t.[TRANSACTION_TYPE] = 'DIST' AND t.[JOURNAL_TYPE] = 'PAY' AND t.[INVOICE_REFERENCE_NUM] = 0)
       LEFT JOIN [dbo].[Trans] t2 ON (s2.[ID] = t2.[ST_ID] AND s2.[PRODUCT_CODE] = t2.[PRODUCT_CODE] AND t2.[POSTED] < 2 
         AND t2.[TRANSACTION_TYPE] = 'DIST' AND t2.[JOURNAL_TYPE] = 'PAY' AND t2.[INVOICE_REFERENCE_NUM] = 0)           
WHERE s.[INVOICE_REFERENCE_NUM] = 0 AND s.[STATUS] = 'A' AND (s.[BILL_DATE] IS NOT NULL OR s.[BILL_AMOUNT] != 0) 
GROUP BY s.[ID], s.[PRODUCT_CODE], s.[COPIES], s.[BILL_COPIES], s.[BILL_AMOUNT], s.[PAYMENT_AMOUNT], s.[ADJUSTMENT_AMOUNT], s.[BALANCE], s.[PROD_TYPE],
t.[ADJUSTMENT_AMOUNT], t.[AMOUNT],  s.[INVOICE_REFERENCE_NUM], s.[INVOICE_LINE_NUM]



GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSoaChangeLog]'))
    DROP VIEW [dbo].[vSoaChangeLog]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [vSoaChangeLog]
AS
SELECT 'Party-' + [ID] +'-' + CONVERT(varchar, [DATE_TIME], 126) AS [ChangeLogId],
       'Party' AS [IdentityEntityTypeName], 
       [ID] AS [IdentityIdentityElement],
       [DATE_TIME] AS [ChangeDate], 
       [SUB_TYPE] AS [Subtype], 
       [USER_ID] AS [ChangedByUserId],
       [LOG_TEXT] AS [LogText]
  FROM [Name_Log]


GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSoaEvent]'))
    DROP VIEW [dbo].[vSoaEvent]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE VIEW [dbo].[vSoaEvent]
AS 
SELECT [Meet_Master].[MEETING] AS [EventId],
       'Public' AS [ParentEntityTypeName],
       'Public Groups' AS [ParentEntityId],
       [Meet_Master].[TITLE] AS [Name],
       CAST([Meet_Master].[DESCRIPTION] AS VARCHAR(6000)) AS [Description],
       [Meet_Master].[MEETING] AS [CategoryId],
       [Meet_Master].[MEETING] AS [CategoryName],
       [Meet_Master].[STATUS] AS [Status],
       [Meet_Master].[BEGIN_DATE] AS [StartDateTime],
       [Meet_Master].[END_DATE] AS [EndDateTime],
       [Meet_Master].[MAX_REGISTRANTS] AS [Capacity],
       [Meet_Master].[TOTAL_REGISTRANTS] AS [RegistrationsCount],
       CAST(CASE WHEN LEN([Meet_Master].[ADDRESS_1]) > 0 THEN [Meet_Master].[ADDRESS_1] + CHAR(13) ELSE '' END +
            CASE WHEN LEN([Meet_Master].[ADDRESS_2]) > 0 THEN [Meet_Master].[ADDRESS_2] + CHAR(13) ELSE '' END +
            CASE WHEN LEN([Meet_Master].[ADDRESS_3]) > 0 THEN [Meet_Master].[ADDRESS_3] + CHAR(13) ELSE '' END +
            CASE WHEN LEN([Meet_Master].[CITY]) > 0 THEN [Meet_Master].[CITY] + ', ' ELSE '' END +
            CASE WHEN LEN([Meet_Master].[STATE_PROVINCE]) > 0 THEN [Meet_Master].[STATE_PROVINCE] + ' ' ELSE '' END +
            CASE WHEN LEN([Meet_Master].[ZIP]) > 0 THEN [Meet_Master].[ZIP] + ' ' ELSE '' END
          AS VARCHAR(200))
       AS [FacilityName],
       [Meet_Master].[MEETING_IMAGE_NAME] AS [ImageUrl],
         CAST(3 AS INT) AS [EventFunctionRegistrationTypeCode],
       [Meet_Master].[EARLY_CUTOFF] AS [EarlyCutoffDate],
       [Meet_Master].[REG_CUTOFF] AS [RegularCutoffDate],
       [Meet_Master].[LATE_CUTOFF] AS [LateCutoffDate]                     
  FROM [dbo].[Meet_Master]
WHERE [Meet_Master].[WEB_ENABLED] = 1

GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSoaEventFunction]'))
    DROP VIEW [dbo].[vSoaEventFunction]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE VIEW [dbo].[vSoaEventFunction]
AS  
SELECT p.[PRODUCT_MAJOR] AS [EventId],
       p.[PRODUCT_CODE] AS [EventFunctionId],
       p.[TITLE] AS [Name],
       p.[DESCRIPTION] AS [Description],
       p.[PRODUCT_MINOR] AS [Code],
       f.[FUNCTION_TYPE] AS [CategoryId],
       f.[FUNCTION_TYPE] AS [CategoryName],
       CAST('' AS VARCHAR (50)) AS [Status],
       f.[BEGIN_DATE_TIME] AS [StartDateTime],
       f.[END_DATE_TIME] AS [EndDateTime],
       CAST('' AS VARCHAR (100)) AS [FacilityName],
       CAST(3 AS INT) AS [EventFunctionRegistrationTypeCode],
       f.[EVENT_TRACK] AS [EventTrack],
       f.[EVENT_CATEGORY] AS [EventCategory],
       f.[IS_EVENT_REGISTRATION_OPTION] AS [IsEventRegistrationOption]
  FROM [dbo].[Product] p 
       INNER JOIN [dbo].[Product_Function] f ON p.[PRODUCT_CODE] = f.[PRODUCT_CODE]
       INNER JOIN [dbo].[Meet_Master] e ON p.[PRODUCT_MAJOR] = e.[MEETING]
WHERE p.PROD_TYPE = 'MEETING'
       AND f.[WEB_ENABLED] = 1
       AND e.[WEB_ENABLED] = 1

GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSoaEventSummary]'))
    DROP VIEW [dbo].[vSoaEventSummary]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE VIEW [dbo].[vSoaEventSummary]
AS  
SELECT [Meet_Master].[MEETING] AS [EventId],
       'Public' AS [ParentEntityTypeName],
       'Public Groups' AS [ParentEntityId],
       [Meet_Master].[TITLE] AS [Name],
       CAST([Meet_Master].[DESCRIPTION] AS VARCHAR(6000)) AS [Description],
       [Meet_Master].[MEETING] AS [CategoryId],
       [Meet_Master].[MEETING] AS [CategoryName],
       [Meet_Master].[STATUS] AS [Status]
  FROM [dbo].[Meet_Master]



GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSoaGeneralReference]'))
    DROP VIEW [dbo].[vSoaGeneralReference]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE VIEW [dbo].[vSoaGeneralReference]
AS
  SELECT CAST(gt.[TABLE_NAME] + ':' + gt.[CODE] AS NVARCHAR(1000)) AS [GeneralReferenceId],
       gt.[TABLE_NAME] AS [Table],
       gt.[CODE] AS [Name],
       CAST(gt.[DESCRIPTION] AS NVARCHAR(1000)) AS [Description]
  FROM [dbo].[Gen_Tables] gt
  WHERE gt.[SUBSTITUTE] NOT IN (select [CODE] from [dbo].[Gen_Tables] where [TABLE_NAME] = gt.[TABLE_NAME])


GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSoaGLAccount]'))
    DROP VIEW [dbo].[vSoaGLAccount]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE VIEW [dbo].[vSoaGLAccount]
AS
SELECT     o.OrgCode + '-' + a.CODE AS GLAccountId, o.OrgCode AS FinancialEntityId, a.DESCRIPTION AS Name, a.CODE AS GLAccountCode
FROM         dbo.Gen_Tables AS a CROSS JOIN
                      dbo.Org_Control AS o
WHERE     (a.TABLE_NAME = 'GL_Account')


GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSoaGroupClassSummary]'))
    DROP VIEW [dbo].[vSoaGroupClassSummary]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO




CREATE VIEW [dbo].[vSoaGroupClassSummary] AS
SELECT CAST('DUES' AS VARCHAR(20)) AS GroupClassId, 'Dues' AS Name, '' AS Description, 
	CAST(1 AS BIT) AS [IsReadOnly], CAST(0 AS BIT) AS [IsRelationshipGroup], CAST(0 AS BIT) AS [IsSimpleGroup] 
UNION
SELECT CAST('SUB' AS VARCHAR(20)) AS GroupClassId, 'Subscription' AS Name, '' AS Description, 
	CAST(1 AS BIT) AS [IsReadOnly], CAST(0 AS BIT) AS [IsRelationshipGroup], CAST(0 AS BIT) AS [IsSimpleGroup] 
UNION
SELECT CAST('SEC' AS VARCHAR(20)) AS GroupClassId, 'Section' AS Name, '' AS Description, 
	CAST(1 AS BIT) AS [IsReadOnly], CAST(0 AS BIT) AS [IsRelationshipGroup], CAST(0 AS BIT) AS [IsSimpleGroup] 
UNION
SELECT CAST('CHAPT' AS VARCHAR(20)) AS GroupClassId, 'Chapter' AS Name, '' AS Description, 
	CAST(1 AS BIT) AS [IsReadOnly], CAST(0 AS BIT) AS [IsRelationshipGroup], CAST(0 AS BIT) AS [IsSimpleGroup] 
UNION
SELECT CAST('VOL' AS VARCHAR(20)) AS GroupClassId, 'Voluntary Contribution' AS Name, '' AS Description, 
	CAST(1 AS BIT) AS [IsReadOnly], CAST(0 AS BIT) AS [IsRelationshipGroup], CAST(0 AS BIT) AS [IsSimpleGroup] 
UNION
SELECT CAST('MISC' AS VARCHAR(20)) AS GroupClassId, 'Miscellaneous' AS Name, '' AS Description, 
	CAST(1 AS BIT) AS [IsReadOnly], CAST(0 AS BIT) AS [IsRelationshipGroup], CAST(0 AS BIT) AS [IsSimpleGroup] 
UNION
SELECT CAST('COMMITTEE' AS VARCHAR(20)) AS GroupClassId, 'Committee' AS Name, '' AS Description, 
	CAST(1 AS BIT) AS [IsReadOnly], CAST(0 AS BIT) AS [IsRelationshipGroup], CAST(0 AS BIT) AS [IsSimpleGroup] 
UNION
SELECT CAST('MT' AS VARCHAR(20)) AS GroupClassId, 'Member Type' AS Name, '' AS Description, 
	CAST(1 AS BIT) AS [IsReadOnly], CAST(0 AS BIT) AS [IsRelationshipGroup], CAST(1 AS BIT) AS [IsSimpleGroup] 
UNION
SELECT CAST('EVENT' AS VARCHAR(20)) AS GroupClassId, 'Event' AS Name, '' AS Description, 
	CAST(1 AS BIT) AS [IsReadOnly], CAST(0 AS BIT) AS [IsRelationshipGroup], CAST(1 AS BIT) AS [IsSimpleGroup] 
UNION
SELECT CAST('RELATIONSHIP' AS VARCHAR(20)) AS GroupClassId, 'Relationship' AS Name, '' AS Description, 
	CAST(0 AS BIT) AS [IsReadOnly], CAST(1 AS BIT) AS [IsRelationshipGroup], CAST(0 AS BIT) AS [IsSimpleGroup] 
UNION
SELECT CAST('ORGRELATIONSHIP' AS VARCHAR(20)) AS GroupClassId, 'Organization' AS Name, '' AS Description, 
	CAST(0 AS BIT) AS [IsReadOnly], CAST(0 AS BIT) AS [IsRelationshipGroup], CAST(0 AS BIT) AS [IsSimpleGroup] 






GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSoaGroupMemberDetailCommittee]'))
    DROP VIEW [dbo].[vSoaGroupMemberDetailCommittee]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE VIEW [dbo].[vSoaGroupMemberDetailCommittee]
WITH SCHEMABINDING
AS
    SELECT  CAST([p2].[PRODUCT_CODE] + ':' + [a].[ID] + ':'
            + CAST([a].[SEQN] AS VARCHAR(10)) AS VARCHAR(50)) AS [GroupMemberDetailId],
            CAST([p2].[PRODUCT_CODE] + ':' + [a].[ID] AS VARCHAR(50)) AS [GroupMemberId],
            [a].[ID] AS [PartyId],
            [a].[EFFECTIVE_DATE] AS [EffectiveDate],
            [a].[THRU_DATE] AS [ExpirationDate],
            [a].[ACTION_CODES]
      FROM  [dbo].[Activity] AS [a]
            INNER JOIN [dbo].[Product] AS [p2] ON [a].[PRODUCT_CODE] = [p2].[PRODUCT_CODE]
     WHERE  ( [p2].[PROD_TYPE] = 'COMMITTEE' ) 


GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSoaGroupMemberDetailOrganization]'))
    DROP VIEW [dbo].[vSoaGroupMemberDetailOrganization]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vSoaGroupMemberDetailOrganization]
WITH SCHEMABINDING
AS
    SELECT  CAST('ORGRELATIONSHIP-' + [n].[CO_ID] + ':' + [n].[ID] AS VARCHAR(50)) AS [GroupMemberDetailId],
            CAST('ORGRELATIONSHIP-' + [n].[CO_ID] + ':' + [n].[ID] AS VARCHAR(50)) AS [GroupMemberId],
            [n].[ID] AS [PartyId],
            CAST(1 AS BIT) AS [IsActive],
            CAST('ORGRELATIONSHIP:' + [n].[CO_ID] AS VARCHAR(30)) AS [GroupRoleId],
            CAST([n].[TITLE] AS VARCHAR(100)) AS [Title]
      FROM  [dbo].[Name] AS [n]
     WHERE  [n].[CO_ID] != '' 


GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSoaGroupMemberDetailRelationship]'))
    DROP VIEW [dbo].[vSoaGroupMemberDetailRelationship]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE VIEW [dbo].[vSoaGroupMemberDetailRelationship]
WITH SCHEMABINDING
AS
    SELECT  CAST('RELATIONSHIP-' + [r].[ID] + ':' + [r].[TARGET_ID] + ':'
            + CAST([r].[SEQN] AS VARCHAR(10)) AS VARCHAR(50)) AS [GroupMemberDetailId],
            CAST(SUBSTRING('RELATIONSHIP-' + [r].[ID] + ':'
                           + CASE WHEN [r].[TARGET_ID] > ''
                                  THEN [r].[TARGET_ID]
                                  ELSE [r].[TARGET_NAME]
                             END, 1, 50) AS VARCHAR(50)) AS [GroupMemberId],
            [r].[TARGET_ID] AS [PartyId],
            [r].[EFFECTIVE_DATE] AS [EffectiveDate],
            [r].[THRU_DATE] AS [ExpirationDate],
            CAST('RELATIONSHIP:' + [rt].[RELATION_TYPE] AS VARCHAR(30)) AS [GroupRoleId],
            CAST([rt].[RELATION_TYPE] AS VARCHAR(100)) AS [RoleName],
            CAST([rt].[DESCRIPTION] AS VARCHAR(100)) AS [RoleDescription],
            CAST(NULL AS INT) AS [RolePriority],
            CAST([r].[TITLE] AS VARCHAR(100)) AS [Title],
            [r].[SEQN],
            [r].[STATUS]
      FROM  [dbo].[Relationship] r
            INNER JOIN [dbo].[Relationship_Types] [rt] ON [r].[RELATION_TYPE] = [rt].[RELATION_TYPE] 



GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSoaGroupMemberDetailSubscription]'))
    DROP VIEW [dbo].[vSoaGroupMemberDetailSubscription]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE VIEW [dbo].[vSoaGroupMemberDetailSubscription]
WITH SCHEMABINDING
AS
    SELECT  CAST([p1].[PRODUCT_CODE] + ':' + [s].[ID] AS VARCHAR(50)) AS [GroupMemberDetailId],
            CAST([p1].[PRODUCT_CODE] + ':' + [s].[ID] AS VARCHAR(50)) AS [GroupMemberId],
            [s].[ID] AS [PartyId],
            [s].[BEGIN_DATE] AS [EffectiveDate],
            [s].[PAID_THRU] AS [ExpirationDate],
            CAST(NULL AS VARCHAR(30)) AS [GroupRoleId],
            CAST(NULL AS VARCHAR(100)) AS [RoleName],
            CAST(NULL AS VARCHAR(100)) AS [RoleDescription],
            CAST(NULL AS INT) AS [RolePriority],
            CAST(NULL AS VARCHAR(100)) AS [RoleReciprocalName],
            CAST(NULL AS VARCHAR(100)) AS [RoleReciprocalDescription],
            CAST(NULL AS VARCHAR(100)) AS [Title],
            CAST(NULL AS VARCHAR(6000)) AS [Note]
      FROM  [dbo].[Subscriptions] AS [s]
            INNER JOIN [dbo].[Product] AS [p1] ON [s].[PRODUCT_CODE] = [p1].[PRODUCT_CODE]
     WHERE  ( [p1].[PROD_TYPE] IN ( 'DUES', 'SUB', 'SEC', 'CHAPT', 'VOL',
                                    'MISC' ) ) 


GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSoaGroupMemberDetail]'))
    DROP VIEW [dbo].[vSoaGroupMemberDetail]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE VIEW [dbo].[vSoaGroupMemberDetail]
AS
    SELECT  [GroupMemberDetailId],
            [GroupMemberId],
            [PartyId],
            [EffectiveDate],
            [ExpirationDate],
            CAST(CASE WHEN ( [ExpirationDate] IS NULL
                             OR [ExpirationDate] > DATEADD(DAY, 1, GETDATE())
                           )
                           AND ( [EffectiveDate] IS NULL
                                 OR [EffectiveDate] < GETDATE()
                               ) THEN 1
                      ELSE 0
                 END AS BIT) AS [IsActive],
            [GroupRoleId],
            [RoleName],
            [RoleDescription],
            [RolePriority],
            [RoleReciprocalName],
            [RoleReciprocalDescription],
            [Title],
            [Note]
      FROM  [dbo].[vSoaGroupMemberDetailSubscription]
    UNION ALL
    SELECT  [GroupMemberDetailId],
            [GroupMemberId],
            [PartyId],
            [EffectiveDate],
            [ExpirationDate],
            CAST(CASE WHEN ( [ExpirationDate] IS NULL
                             OR [ExpirationDate] > DATEADD(DAY, 1, GETDATE())
                           )
                           AND ( [EffectiveDate] IS NULL
                                 OR [EffectiveDate] < GETDATE()
                               ) THEN 1
                      ELSE 0
                 END AS BIT) AS [IsActive],
            CASE WHEN [cp].[POSITION_CODE] IS NOT NULL
                 THEN CAST('COMMITTEE:' + [cp].[POSITION_CODE] AS VARCHAR(30))
                 ELSE CAST(NULL AS VARCHAR(30))
            END AS [GroupRoleId],
            CAST([cp].[TITLE] AS VARCHAR(100)) AS [RoleName],
            CAST(NULL AS VARCHAR(100)) AS [RoleDescription],
            [cp].[RANK] AS [RolePriority],
            CAST(NULL AS VARCHAR(100)) AS [RoleReciprocalName],
            CAST(NULL AS VARCHAR(100)) AS [RoleReciprocalDescription],
            CAST(NULL AS VARCHAR(100)) AS [Title],
            CAST(NULL AS VARCHAR(6000)) AS [Note]
      FROM  [dbo].[vSoaGroupMemberDetailCommittee] AS [gmdc]
            LEFT OUTER JOIN [dbo].[Committee_Position] AS [cp] ON [gmdc].[ACTION_CODES] = [cp].[POSITION_CODE]
                                                              AND [gmdc].[ACTION_CODES] != ''
    UNION ALL
    SELECT  [gmdr].[GroupMemberDetailId],
            [gmdr].[GroupMemberId],
            [gmdr].[PartyId],
            [gmdr].[EffectiveDate],
            [gmdr].[ExpirationDate],
            CAST(CASE WHEN ( [gmdr].[ExpirationDate] IS NULL
                             OR [gmdr].[ExpirationDate] > DATEADD(DAY, 1,
                                                              GETDATE())
                           )
                           AND ( [gmdr].[EffectiveDate] IS NULL
                                 OR [gmdr].[EffectiveDate] < GETDATE()
                               )
                           AND ( [gmdr].[STATUS] IS NULL
                                 OR RTRIM([gmdr].[STATUS]) = ''
                                 OR [gmdr].[STATUS] = 'A'
                               ) THEN 1
                      ELSE 0
                 END AS BIT) AS [IsActive],
            [gmdr].[GroupRoleId],
            [gmdr].[RoleName],
            [gmdr].[RoleDescription],
            [gmdr].[RolePriority],
            CAST([rrt].[RELATION_TYPE] AS VARCHAR(100)) AS [RoleReciprocalName],
            CAST([rrt].[DESCRIPTION] AS VARCHAR(100)) AS [RoleReciprocalDescription],
            [gmdr].[Title],
            CAST([r].[NOTE] AS VARCHAR(6000)) AS [Note]
      FROM  [dbo].[vSoaGroupMemberDetailRelationship] AS [gmdr]
            INNER JOIN [dbo].[Relationship] r ON [r].SEQN = [gmdr].[SEQN]
            LEFT OUTER JOIN [dbo].[Relationship_Types] [rrt] ON [gmdr].[RoleName] = [rrt].[RELATION_TYPE]
    UNION ALL
    SELECT  [GroupMemberDetailId],
            [GroupMemberId],
            [PartyId],
            NULL AS [EffectiveDate],
            NULL AS [ExpirationDate],
            CAST(1 AS BIT) AS [IsActive],
            [GroupRoleId],
            CAST(NULL AS VARCHAR(100)) AS [RoleName],
            CAST(NULL AS VARCHAR(100)) AS [RoleDescription],
            CAST(NULL AS INT) AS [RolePriority],
            CAST(NULL AS VARCHAR(100)) AS [RoleReciprocalName],
            CAST(NULL AS VARCHAR(100)) AS [RoleReciprocalDescription],
            [Title],
            CAST(NULL AS VARCHAR(6000)) AS [Note]
      FROM  [dbo].[vSoaGroupMemberDetailOrganization] 

GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSoaGroupMemberSummaryCommittee]'))
    DROP VIEW [dbo].[vSoaGroupMemberSummaryCommittee]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE VIEW [dbo].[vSoaGroupMemberSummaryCommittee]
WITH SCHEMABINDING
AS
    SELECT  CAST([p].[PRODUCT_CODE] + ':' + [a].[ID] AS VARCHAR(50)) AS [GroupMemberId],
            CAST([p].[PRODUCT_CODE] AS VARCHAR(50)) AS [GroupId],
            [a].[ID] AS [PartyId],
            [a].[SEQN]
      FROM  [dbo].[Activity] AS [a]
            INNER JOIN [dbo].[Product] AS [p] ON [a].[PRODUCT_CODE] = [p].[PRODUCT_CODE]
     WHERE  [p].[PROD_TYPE] = 'COMMITTEE' 
  


GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSoaGroupMemberSummaryMT]'))
    DROP VIEW [dbo].[vSoaGroupMemberSummaryMT]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vSoaGroupMemberSummaryMT]
WITH SCHEMABINDING
AS
    SELECT  CAST('MT-' + [mt].[MEMBER_TYPE] + ':' + [n].[ID] AS VARCHAR(50)) AS [GroupMemberId],
            CAST('MT-' + [mt].[MEMBER_TYPE] AS VARCHAR(50)) AS [GroupId],
            [n].[ID] AS [PartyId],
            [n].[FULL_NAME] AS [PartyName],
            CASE WHEN [n].[STATUS] = 'A' THEN CAST(1 AS BIT)
                 ELSE CAST(0 AS BIT)
            END AS [IsActive],
            [n].[JOIN_DATE] AS [JoinDate],
            [n].[PAID_THRU] AS [DropDate]
      FROM  [dbo].[Name] AS [n]
            INNER JOIN [dbo].[Member_Types] AS [mt] ON [n].[MEMBER_TYPE] = [mt].[MEMBER_TYPE] 


GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSoaGroupMemberSummaryOrganization]'))
    DROP VIEW [dbo].[vSoaGroupMemberSummaryOrganization]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vSoaGroupMemberSummaryOrganization]
WITH SCHEMABINDING
AS
    SELECT  CAST('ORGRELATIONSHIP-' + [n].[CO_ID] + ':' + [n].[ID] AS VARCHAR(50)) AS [GroupMemberId],
            CAST('ORGRELATIONSHIP-' + [n].[CO_ID] AS VARCHAR(50)) AS [GroupId],
            [n].[ID] AS PartyId,
            [n].[FULL_NAME] AS [PartyName],
            [n].[CO_ID]
      FROM  [dbo].[Name] AS [n]
     WHERE  [n].[CO_ID] != '' 


GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSoaGroupMemberSummaryRelationship]'))
    DROP VIEW [dbo].[vSoaGroupMemberSummaryRelationship]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE VIEW [dbo].[vSoaGroupMemberSummaryRelationship]
WITH SCHEMABINDING
AS
    SELECT  CAST(SUBSTRING('RELATIONSHIP-' + [n].[ID] + ':'
                           + CASE WHEN [r].[TARGET_ID] > ''
                                  THEN [r].[TARGET_ID]
                                  ELSE [r].[TARGET_NAME]
                             END, 1, 50) AS VARCHAR(50)) AS [GroupMemberId],
            CAST('RELATIONSHIP-' + [n].[ID] AS VARCHAR(50)) AS [GroupId],
            [r].[TARGET_ID] AS [PartyId],
            CAST([r].[TARGET_NAME] AS VARCHAR(70)) AS [PartyName],
            [r].[SEQN]
      FROM  [dbo].[Relationship] AS r
            INNER JOIN [dbo].[Name] AS n ON [n].[ID] = [r].[ID]


GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSoaGroupMemberSummarySubscription]'))
    DROP VIEW [dbo].[vSoaGroupMemberSummarySubscription]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE VIEW [dbo].[vSoaGroupMemberSummarySubscription]
WITH SCHEMABINDING
AS
    SELECT  CAST([p].[PRODUCT_CODE] + ':' + [s].[ID] AS VARCHAR(50)) AS [GroupMemberId],
            CAST([p].[PRODUCT_CODE] AS VARCHAR(50)) AS [GroupId],
            [s].[ID] AS [PartyId],
            CAST(NULL AS VARCHAR(70)) AS [PartyName],
            [s].[PAID_THRU],
            [s].[BEGIN_DATE],
            [s].[BEGIN_DATE] AS [JoinDate],
            [s].[PAID_THRU] AS [DropDate]
      FROM  [dbo].[Subscriptions] AS [s]
            INNER JOIN [dbo].[Product] AS [p] ON [s].[PRODUCT_CODE] = [p].[PRODUCT_CODE]
     WHERE  ( [p].[PROD_TYPE] IN ( 'DUES', 'SUB', 'SEC', 'CHAPT', 'VOL',
                                   'MISC' ) ) 


GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSoaGroupMemberSummaryEvent]'))
    DROP VIEW [dbo].[vSoaGroupMemberSummaryEvent]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE VIEW [dbo].[vSoaGroupMemberSummaryEvent]
WITH SCHEMABINDING
AS
    SELECT  CAST('EVENT-' + [mm].[MEETING] + ':' + [o].[ST_ID] AS VARCHAR(50)) AS GroupMemberId,
            CAST('EVENT-' + [mm].[MEETING] AS VARCHAR(50)) AS [GroupId],
            [o].[ST_ID] AS [PartyId],
            CAST(NULL AS VARCHAR(70)) AS [PartyName],
            CAST(1 AS BIT) AS [IsActive],
            [o].[ORDER_DATE] AS [JoinDate],
            NULL AS [DropDate]
      FROM  [dbo].[Meet_Master] AS [mm]
            INNER JOIN [dbo].[Order_Meet] AS [om] ON [mm].[MEETING] = [om].[MEETING]
            INNER JOIN [dbo].[Orders] AS [o] ON [om].[ORDER_NUMBER] = [o].[ORDER_NUMBER]
     WHERE  [o].[STAGE] != 'CANCELED' 
     AND    [o].[ST_ID] NOT IN ('',' ')


GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSoaGroupMemberSummary]'))
    DROP VIEW [dbo].[vSoaGroupMemberSummary]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO


CREATE VIEW [dbo].[vSoaGroupMemberSummary]
AS
    SELECT  [GroupMemberId],
            [GroupId],
            [PartyId],
            [PartyName],
            CASE WHEN ( [PAID_THRU] IS NULL
                        OR [PAID_THRU] > DATEADD(DAY, 1, GETDATE())
                      )
                      AND ( [BEGIN_DATE] IS NULL
                            OR [BEGIN_DATE] < GETDATE()
                          ) THEN CAST(1 AS BIT)
                 ELSE CAST(0 AS BIT)
            END AS [IsActive],
            [JoinDate],
            [DropDate]
      FROM  [dbo].[vSoaGroupMemberSummarySubscription]
    UNION ALL
    SELECT DISTINCT
            [GroupMemberId],
            [GroupId],
            [PartyId],
            CAST(NULL AS VARCHAR(70)) AS [PartyName],
            CASE WHEN EXISTS ( SELECT   1
                                 FROM   [dbo].[Activity] AS [a]
                                WHERE   [a].[ACTIVITY_TYPE] = 'COMMITTEE'
                                        AND [a].[ID] = [PartyId]
                                        AND ( ( [a].[EFFECTIVE_DATE] IS NULL
                                                AND ( [a].[THRU_DATE] IS NULL
                                                      OR [a].[THRU_DATE] > GETDATE()
                                                    )
                                              )
                                              OR ( [a].[EFFECTIVE_DATE] <= GETDATE()
                                                   AND ( [a].[THRU_DATE] IS NULL
                                                         OR [a].[THRU_DATE] > GETDATE()
                                                       )
                                                 )
                                            ) ) THEN CAST(1 AS BIT)
                 ELSE CAST(0 AS BIT)
            END AS [IsActive],
            NULL AS [JoinDate],
            NULL AS [DropDate]
      FROM  [dbo].[vSoaGroupMemberSummaryCommittee]
    UNION ALL
    SELECT  [GroupMemberId],
            [GroupId],
            [PartyId],
            [PartyName],
            [IsActive],
            [JoinDate],
            [DropDate]
      FROM  [dbo].[vSoaGroupMemberSummaryEvent]
    UNION ALL
    SELECT  [GroupMemberId],
            [GroupId],
            [PartyId],
            [PartyName],
            [IsActive],
            [JoinDate],
            [DropDate]
      FROM  [dbo].[vSoaGroupMemberSummaryMT]
    UNION ALL
    SELECT  DISTINCT
            [GroupMemberId],
            [GroupId],
            [PartyId],
            [PartyName],
            CASE WHEN EXISTS ( SELECT   1
                                 FROM   [dbo].[Relationship] AS [r]
                                WHERE   ( [r].[ID] = [PartyId] )
                                        AND ( [r].[STATUS] = NULL
                                              OR RTRIM([r].[STATUS]) = ''
                                              OR [r].[STATUS] = 'A'
                                            )
                                        AND ( ( [r].[EFFECTIVE_DATE] IS NULL
                                                AND ( [r].[THRU_DATE] IS NULL
                                                      OR [r].[THRU_DATE] > GETDATE()
                                                    )
                                              )
                                              OR ( [r].[EFFECTIVE_DATE] <= GETDATE()
                                                   AND ( [r].[THRU_DATE] IS NULL
                                                         OR [r].[THRU_DATE] > GETDATE()
                                                       )
                                                 )
                                            ) ) THEN CAST(1 AS BIT)
                 ELSE CAST(0 AS BIT)
            END AS [IsActive],
            NULL AS [JoinDate],
            NULL AS [DropDate]
      FROM  [dbo].[vSoaGroupMemberSummaryRelationship]
    UNION ALL
    SELECT DISTINCT
            [GroupMemberId],
            [GroupId],
            [PartyId],
            [PartyName],
            CAST(1 AS BIT) AS [IsActive],
            NULL AS [JoinDate],
            NULL AS [DropDate]
      FROM  [dbo].[vSoaGroupMemberSummaryOrganization] AS gmso
            INNER JOIN Name AS n ON [n].[ID] = [gmso].[CO_ID]
     WHERE  [n].[COMPANY_RECORD] = 1 




GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSoaGroupSummaryMeeting]'))
    DROP VIEW [dbo].[vSoaGroupSummaryMeeting]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE VIEW [dbo].[vSoaGroupSummaryMeeting]
WITH SCHEMABINDING
AS
    SELECT  'EVENT-' + [Meet_Master].[MEETING] AS [GroupId],
            'Public' AS [ParentEntityTypeName],
            'Public Groups' AS [ParentEntityId],
            'EVENT' AS [GroupClassId],
            [Meet_Master].[TITLE] AS [Name]
      FROM  [dbo].[Meet_Master] 


GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSoaGroupSummaryMT]'))
    DROP VIEW [dbo].[vSoaGroupSummaryMT]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE VIEW [dbo].[vSoaGroupSummaryMT]
WITH SCHEMABINDING
AS
    SELECT  'MT-' + [Member_Types].[MEMBER_TYPE] AS [GroupId],
            'Public' AS [ParentEntityTypeName],
            'Public Groups' AS [ParentEntityId],
            'MT' AS [GroupClassId],
            [Member_Types].[DESCRIPTION] AS [Name],
            CAST([Member_Types].[DESCRIPTION] AS VARCHAR(6000)) AS [Description],
            [Member_Types].[MEMBER_RECORD] AS [IsMemberGroup]
      FROM  [dbo].[Member_Types] 


GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSoaGroupSummaryOrganization]'))
    DROP VIEW [dbo].[vSoaGroupSummaryOrganization]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE VIEW [dbo].[vSoaGroupSummaryOrganization]
WITH SCHEMABINDING
AS
    SELECT  'ORGRELATIONSHIP-' + [n].[ID] AS [GroupId],
            'Party' AS [ParentEntityTypeName],
            [n].[ID] AS [ParentEntityId],
            'ORGRELATIONSHIP' AS [GroupClassId],
            [n].[COMPANY] AS [Name]
      FROM  [dbo].[Name] AS [n]
     WHERE  [n].[COMPANY_RECORD] = 1 

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSoaGroupSummaryProduct]'))
    DROP VIEW [dbo].[vSoaGroupSummaryProduct]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE VIEW [dbo].[vSoaGroupSummaryProduct]
WITH SCHEMABINDING
AS
    SELECT  [Product].[PRODUCT_CODE] AS [GroupId],
            'Public' AS [ParentEntityTypeName],
            'Public Groups' AS [ParentEntityId],
            [Product].[PROD_TYPE] AS [GroupClassId],
            [Product].[TITLE] AS [Name]
      FROM  [dbo].[Product]
     WHERE  ( [Product].[PROD_TYPE] IN ( 'DUES', 'SUB', 'SEC', 'CHAPT', 'VOL',
                                         'MISC', 'COMMITTEE' ) ) 


GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSoaGroupSummaryRelationship]'))
    DROP VIEW [dbo].[vSoaGroupSummaryRelationship]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE VIEW [dbo].[vSoaGroupSummaryRelationship]
WITH SCHEMABINDING
AS
    SELECT  'RELATIONSHIP-' + [n].[ID] AS [GroupId],
            'Party' AS [ParentEntityTypeName],
            [n].[ID] AS [ParentEntityId],
            'RELATIONSHIP' AS [GroupClassId],
            'Relationships' AS [Name]
      FROM  [dbo].[Name] AS [n] 


GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSoaGroupSummary]'))
    DROP VIEW [dbo].[vSoaGroupSummary]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO


CREATE VIEW [dbo].[vSoaGroupSummary]
AS
    SELECT  [GroupId],
            [ParentEntityTypeName],
            [ParentEntityId],
            [GroupClassId],
            [Name],
            NULL AS [Description], 
         -- can't use Product.DESCRIPTION in an indexed view 
            CAST(0 AS BIT) AS [IsSimpleGroup],
            CAST(0 AS BIT) AS [IsMemberGroup],
            CAST(0 AS BIT) AS [IsPrimaryGroup]
      FROM  [dbo].[vSoaGroupSummaryProduct]
    UNION ALL
    SELECT  [GroupId],
            [ParentEntityTypeName],
            [ParentEntityId],
            [GroupClassId],
            [Name],
            NULL AS [Description], 
         -- can't used Meet_Mater.DESCRIPTION in an indexed view. can go get it here if needed 
            CAST(1 AS BIT) AS [IsSimpleGroup],
            CAST(0 AS BIT) AS [IsMemberGroup],
            CAST(0 AS BIT) AS [IsPrimaryGroup]
      FROM  [dbo].[vSoaGroupSummaryMeeting]
    UNION ALL
    SELECT  [GroupId],
            [ParentEntityTypeName],
            [ParentEntityId],
            [GroupClassId],
            [Name],
            [Description],
            CAST(1 AS BIT) AS [IsSimpleGroup],
            [IsMemberGroup],
            CAST(1 AS BIT) AS [IsPrimaryGroup]
      FROM  [dbo].[vSoaGroupSummaryMT]
    UNION ALL
    SELECT  [GroupId],
            [ParentEntityTypeName],
            [ParentEntityId],
            [GroupClassId],
            [Name],
            CAST('Relationships' AS VARCHAR(6000)) AS [Description],
            CAST(0 AS BIT) AS [IsSimpleGroup],
            CAST(0 AS BIT) AS [IsMemberGroup],
            CAST(0 AS BIT) AS [IsPrimaryGroup]
      FROM  [dbo].[vSoaGroupSummaryRelationship]
    UNION ALL
    SELECT  [GroupId],
            [ParentEntityTypeName],
            [ParentEntityId],
            [GroupClassId],
            [Name],
            CAST('Organizational Relationship' AS VARCHAR(6000)) AS [Description],
            CAST(0 AS BIT) AS [IsSimpleGroup],
            CAST(0 AS BIT) AS [IsMemberGroup],
            CAST(0 AS BIT) AS [IsPrimaryGroup]
      FROM  [dbo].[vSoaGroupSummaryOrganization] 

GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSoaInvoiceLine]'))
    DROP VIEW [dbo].[vSoaInvoiceLine]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO


CREATE VIEW [dbo].[vSoaInvoiceLine]
AS

SELECT CAST(il.[REFERENCE_NUM] AS VARCHAR(15)) + ':' + CAST(il.[LINE_NUM] AS VARCHAR(15)) AS InvoiceLineId,
       CAST(il.[REFERENCE_NUM] AS VARCHAR(20)) AS InvoiceId,
       il.[REFERENCE_NUM] AS InvoiceNumber,
       il.[LINE_NUM] AS LineNumber,
       il.[PRODUCT_CODE] AS ItemId,
       il.[ST_ID] AS ShipToPartyId,
       il.[BILL_QTY] AS Quantity,
       CAST(CASE WHEN il.[BILL_QTY] > 0 THEN (il.[CHARGES]/il.[BILL_QTY]) ELSE il.[CHARGES] END AS MONEY) AS UnitPrice,
       il.[CHARGES] AS ExtendedAmount,
       il.[CREDITS] AS PaymentAdjustmentAmount,
       ISNULL(SUM(t.[INVOICE_CREDITS] - t.[INVOICE_CHARGES]),0) AS PendingPaymentAdjustmentAmount,
       (il.[CHARGES] - il.[CREDITS] - ISNULL(SUM(t.[INVOICE_CREDITS] - t.[INVOICE_CHARGES]),0)) AS Balance
  FROM [dbo].[Invoice_Lines] il INNER JOIN [dbo].[Invoice] i ON il.[REFERENCE_NUM] = i.[REFERENCE_NUM]
		LEFT JOIN  [dbo].[Trans] t 
    ON (il.[REFERENCE_NUM] = t.[INVOICE_REFERENCE_NUM] AND il.[LINE_NUM] = t.[INVOICE_LINE_NUM] 
       AND t.[POSTED] < 2 AND t.[TRANSACTION_TYPE] = 'AR')   
 WHERE (i.[SOURCE_SYSTEM] != 'DUES' OR il.[REFERENCE_NUM] IN (SELECT MAX([INVOICE_REFERENCE_NUM]) FROM [dbo].[Subscriptions] WHERE STATUS = 'A' AND [ID] = il.[ST_ID]))         
GROUP BY il.[REFERENCE_NUM], il.[LINE_NUM], il.[PRODUCT_CODE], il.[ST_ID], il.[BILL_QTY], il.[CHARGES], il.[CREDITS]

UNION

SELECT InvoiceLineId,
       InvoiceId,
       InvoiceNumber,
       LineNumber,
       ItemId,
       ShipToPartyId,
       Quantity,
       UnitPrice,
       ExtendedAmount,
       PaymentAdjustmentAmount,
       PendingPaymentAdjustmentAmount,
       Balance
  FROM [dbo].[vSoaCashInvoiceLine]


GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSoaInvoiceSummary]'))
    DROP VIEW [dbo].[vSoaInvoiceSummary]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE VIEW [dbo].[vSoaInvoiceSummary]
AS

-- Non-dues invoices
SELECT 
       CAST(i.[REFERENCE_NUM] AS VARCHAR(20)) AS InvoiceId,
       i.[ORG_CODE] AS FinancialEntityId,
       i.[INVOICE_NUM] AS InvoiceNumber,
       i.[INVOICE_DATE] AS InvoiceDate,
       i.[BT_ID] AS BillToPartyId,
       i.[ST_ID] AS SoldToPartyId,
       i.[DESCRIPTION] AS Description,
       CASE WHEN EXISTS 
             (SELECT 1 FROM [dbo].[Invoice] sqi INNER JOIN [dbo].[Activity] a ON sqi.[ORIGINATING_TRANS_NUM] = a.[ORIGINATING_TRANS_NUM]
                      WHERE a.[ACTIVITY_TYPE] = 'PLEDGE' AND sqi.[REFERENCE_NUM] = i.[REFERENCE_NUM]) THEN 'Pledge'
            WHEN EXISTS 
             (SELECT 1 FROM [dbo].[Invoice] sqi INNER JOIN [dbo].[Activity] a ON sqi.[ORIGINATING_TRANS_NUM] = a.[ORIGINATING_TRANS_NUM]
                      WHERE a.[ACTIVITY_TYPE] = 'GIFT'AND sqi.[REFERENCE_NUM] = i.[REFERENCE_NUM]) THEN 'Gift'
            ELSE 'Regular' END 
       AS InvoiceType,
       i.[CHARGES] AS InvoiceAmount,
       i.[CREDITS] AS PaymentAdjustmentAmount,
       ISNULL(SUM(t.[INVOICE_CREDITS] - t.[INVOICE_CHARGES]),0) AS PendingPaymentAdjustmentAmount,
       (i.[BALANCE] - ISNULL(SUM(t.[INVOICE_CREDITS] - t.[INVOICE_CHARGES]),0)) AS Balance,
       'Accrual' AS AccountingMethod     
  FROM [dbo].[Invoice] i LEFT JOIN  [dbo].[Trans] t 
    ON (i.[REFERENCE_NUM] = t.[INVOICE_REFERENCE_NUM] AND t.[POSTED] < 2 AND t.[TRANSACTION_TYPE] = 'AR')
 WHERE i.[INVOICE_TYPE] != 'PP' AND i.[SOURCE_SYSTEM] != 'DUES' 
GROUP BY i.[REFERENCE_NUM], i.[ORG_CODE],  i.[INVOICE_NUM], i.[INVOICE_DATE], i.[BT_ID], i.[ST_ID], i.[DESCRIPTION], i.[CHARGES], i.[CREDITS], i.[SOURCE_SYSTEM], i.[BALANCE]

UNION

-- Union Accrual Dues
SELECT DISTINCT
       CAST(i.[REFERENCE_NUM] AS VARCHAR(20)) AS InvoiceId,
       i.[ORG_CODE] AS FinancialEntityId,
       i.[INVOICE_NUM] AS InvoiceNumber,
       i.[INVOICE_DATE] AS InvoiceDate,
       i.[BT_ID] AS BillToPartyId,
       i.[ST_ID] AS SoldToPartyId,
       i.[DESCRIPTION] AS Description,
       'SubscriptionBilling' AS InvoiceType,
       SUM(il.[ExtendedAmount]) AS InvoiceAmount,
       SUM(il.[PaymentAdjustmentAmount]) AS PaymentAdjustmentAmount,
       SUM(il.[PendingPaymentAdjustmentAmount]) AS PendingPaymentAdjustmentAmount,
       SUM(il.[Balance]) AS Balance,
       'Accrual' AS AccountingMethod     
  FROM [dbo].[Invoice] i INNER JOIN [dbo].[vSoaInvoiceLine] il ON i.[REFERENCE_NUM] = il.[InvoiceNumber] 
	LEFT JOIN  [dbo].[Trans] t ON (i.[REFERENCE_NUM] = t.[INVOICE_REFERENCE_NUM] AND t.[POSTED] < 2 AND t.[TRANSACTION_TYPE] = 'AR')
 WHERE i.[INVOICE_TYPE] != 'PP' AND i.[SOURCE_SYSTEM] = 'DUES'
GROUP BY i.[REFERENCE_NUM], i.[ORG_CODE],  i.[INVOICE_NUM], i.[INVOICE_DATE], i.[BT_ID], i.[ST_ID], i.[DESCRIPTION], i.[CHARGES], i.[CREDITS], i.[SOURCE_SYSTEM], i.[BALANCE]

UNION

-- Union Cash Dues
SELECT DISTINCT
       il.[InvoiceId] AS InvoiceId,
       (SELECT CASE WHEN (SELECT ISNULL([ShortValue],'') FROM [dbo].[System_Params] 
         WHERE [ParameterName] = 'AR_Control.DefaultEntityDues')  != '' THEN (SELECT [ShortValue] FROM [dbo].[System_Params] 
         WHERE [ParameterName] = 'AR_Control.DefaultEntityDues')
         ELSE (Select OrgCode from Org_Control where DefaultFlag = 1) END) AS FinancialEntityId,
       0 AS InvoiceNumber,
       MAX(s.BILL_DATE) AS InvoiceDate,
       s.[ID] AS BillToPartyId,
       s.[ID] AS SoldToPartyId,
       'Renewal Fees' AS Description,
       'SubscriptionBilling' AS InvoiceType,
       SUM(il.[ExtendedAmount])AS InvoiceAmount,
       SUM(il.[PaymentAdjustmentAmount]) AS PaymentAdjustmentAmount,
       SUM(il.[PendingPaymentAdjustmentAmount]) AS PendingPaymentAdjustmentAmount,
       SUM(il.[Balance]) AS Balance,
       'Cash' AS AccountingMethod
  FROM [dbo].[Subscriptions] s INNER JOIN [dbo].[vSoaInvoiceLine] il ON s.[ID] = il.[ShipToPartyId] AND s.[PRODUCT_CODE] = il.[ItemId] AND il.[LineNumber] = 0
 WHERE s.[INVOICE_REFERENCE_NUM] = 0
GROUP BY s.[ID], s.[INVOICE_LINE_NUM], il.[InvoiceId]


GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSoaItemEvent]'))
    DROP VIEW [dbo].[vSoaItemEvent]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE VIEW [dbo].[vSoaItemEvent]
WITH SCHEMABINDING
AS
    SELECT  'EVENT-' + [m].[MEETING] AS [ItemId],
            'EVENT-' + [m].[MEETING] AS [ProductCode],
            [m].[TITLE] AS [Name],
            CAST(NULL  AS VARCHAR(MAX)) AS [Description], -- can't have text in indexed view. we can add this back below if we need to.
            CAST(NULL AS VARCHAR(50)) AS [TaxCategory],
            'EVENT' AS [ItemClass],
            [m].[MEETING_URL] AS [ImageURL]
      FROM  [dbo].[Meet_Master] AS [m]

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSoaItem]'))
    DROP VIEW [dbo].[vSoaItem]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE VIEW [dbo].[vSoaItem]
AS
    SELECT  [p].[PRODUCT_CODE] AS [ItemId],
            [p].[PRODUCT_CODE] AS [ProductCode],
            [p].[TITLE] AS [Name],
            CAST(CASE WHEN [p].[WEB_DESC] IS NULL
                           OR [p].[WEB_DESC] LIKE '' THEN [p].[DESCRIPTION]
                      ELSE [p].[WEB_DESC]
                 END AS VARCHAR(MAX)) AS [Description],
            CAST(NULL AS VARCHAR(50)) AS [TaxCategory],
            [p].[PROD_TYPE] AS [ItemClass],
            [p].[IMAGE_URL] AS [ImageURL],
            [p].[THUMBNAIL_URL] AS [ThumbnailURL],
            [p].[RENEW_MONTHS],
            [p].[STOCK_ITEM],
            [p].[UNIT_OF_MEASURE],
            [p].[WEIGHT],
            [p].[TAXABLE],
            [p].[DECIMAL_POINTS],
            [p].[PRICE_1],
            [p].[PRICE_2],
            [p].[PRICE_3],
            [p].[COMPLIMENTARY],
            [p].[PST_TAXABLE],
            [p].[TAXABLE_VALUE],
            [p].[TAX_AUTHORITY],
            [p].[WEB_OPTION],
            [p].[IS_KIT],
            [p].[PREMIUM],
            [p].[FAIR_MARKET_VALUE],
            [p].[IS_FR_ITEM],
            [p].[APPEAL_CODE],
            [p].[CAMPAIGN_CODE]
      FROM  [dbo].[Product] AS [p]
     WHERE  ( [p].[PROD_TYPE] IN ( 'SALES', 'GIFT', 'DUES', 'SUB', 'MISC',
                                   'CHAPT', 'SEC', 'VOL', 'CERTIFY', 'MEETING' ) )
    UNION
    SELECT  [ItemId],
            [ProductCode],
            [Name],
            [Description],
            [TaxCategory],
            [ItemClass],
            [ImageURL],
            NULL,
            NULL,
            NULL,
            NULL,
            NULL,
            NULL,
            NULL,
            NULL,
            NULL,
            NULL,
            NULL,
            NULL,
            NULL,
            NULL,
            NULL,
            NULL,
            NULL,
            NULL,
            NULL,
            NULL,
            NULL
      FROM  [dbo].[vSoaItemEvent]

GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSoaItemClass]'))
    DROP VIEW [dbo].[vSoaItemClass]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vSoaItemClass]
AS

SELECT 'CERTIFY' AS ItemClassId, 'Certification' AS Name, 'Certification' AS Subscription
UNION
SELECT 'CHAPT' AS ItemClassId, 'Chapter' AS Name, 'Chapter' AS Subscription
UNION
SELECT 'DUES' AS ItemClassId, 'Dues' AS Name, 'Dues' AS Description
UNION
SELECT 'EVENT' AS ItemClassId, 'Event' AS Name, 'Event' AS Description
UNION
SELECT 'GIFT' AS ItemClassId, 'Gift' AS Name, 'Gift' AS Description
UNION
SELECT 'MISC' AS ItemClassId, 'Miscellaneous' AS Name, 'Miscellaneous' AS Description
UNION
SELECT 'SALES' AS ItemClassId, 'Sales' AS Name, 'Sales' AS Description
UNION
SELECT 'SEC' AS ItemClassId, 'Section' AS Name, 'Section' AS Description
UNION
SELECT 'SUB' AS ItemClassId, 'Subscription' AS Name, 'Subscription' AS Description
UNION
SELECT 'VOL' AS ItemClassId, 'Voluntary' AS Name, 'Voluntary' AS Description
UNION
SELECT 'MEETING' AS ItemClassId, 'Event Function' AS Name, 'Event Function' AS Description

GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSoaItemProductPrice]'))
    DROP VIEW [dbo].[vSoaItemProductPrice]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO





CREATE VIEW [dbo].[vSoaItemProductPrice]
AS
SELECT 
    p.[PRODUCT_CODE] as [ItemId],
    p.[CUSTOMER_TYPE] as [CustomerTypeCode],
    p.[RATE_1] AS [ItemPrice1],
    p.[RATE_2] AS [ItemPrice2],
    p.[RATE_3] AS [ItemPrice3],
    p.[COMPLIMENTARY] as [Complimentary]
FROM [dbo].[Product_Price] p


GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSoaMembershipSetting]'))
    DROP VIEW [dbo].[vSoaMembershipSetting]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [vSoaMembershipSetting]
AS  
SELECT  CAST([System_Params].[ParameterName] AS VARCHAR(50)) AS [MembershipSettingId],
        SUBSTRING([System_Params].[ParameterName], 16, 100) AS [Name],
        CAST(ISNULL([System_Params].[LongValue], [System_Params].[ShortValue]) AS VARCHAR(6000)) AS [Value]
  FROM  [dbo].[System_Params]
 WHERE  ([System_Params].[ParameterName] LIKE 'Member_Control%')


GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSoaPartyCommercePreferences]'))
    DROP VIEW [dbo].[vSoaPartyCommercePreferences]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE VIEW [dbo].[vSoaPartyCommercePreferences]
AS
SELECT [Name].[ID] AS [PartyCommercePreferencesId], [Name].[ID] as [PartyId], 
  (SELECT CONVERT(NVARCHAR(10),[ParameterValue]) FROM [SystemConfig] WHERE [ParameterName] = 'DefaultCurrencyCode' AND [SystemEntityKey] = '74E640E8-538D-438E-BBFD-AC48460B4758') AS [DefaultCurrencyCode],
  CASE WHEN [Name].[MEMBER_RECORD] = 1 THEN 'Member'
      ELSE 'Standard'
  END AS [PriceSheetName],
    CASE WHEN [Name].[MEMBER_RECORD] = 1 THEN 'Member pricing'
      ELSE 'Non-Member pricing'
  END AS [PriceSheetDescription]

FROM [Name];


GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSoaPartySummary]'))
    DROP VIEW [dbo].[vSoaPartySummary]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO


CREATE VIEW [dbo].[vSoaPartySummary]
AS  
SELECT  [Name].[ID] AS [PartyId],
        [Name].[ID] AS [Id],
        [Name].[STATUS] AS [Status],
        CASE WHEN [Name].[COMPANY_RECORD] = 1 THEN [Name].[COMPANY]
             ELSE [Name].[FULL_NAME]
        END AS [Name],
        CASE WHEN [Name].[COMPANY_RECORD] = 1 THEN [Name].[COMPANY_SORT]
             ELSE [Name].[LAST_FIRST]
        END AS [Sort],
        [Name].[CITY] AS [CityName],
        [Name].[STATE_PROVINCE] AS [CountrySubEntityName],
        [Name].[COUNTRY] AS [CountryName],
        CASE WHEN [Name].[WORK_PHONE] != '' THEN [Name].[WORK_PHONE]
             ELSE [Name].[HOME_PHONE]
        END AS [Phone],
        [Name].[EMAIL] AS [Email],
        CASE WHEN [Name].[STATUS] LIKE 'D%' THEN CAST(1 AS BIT)
             ELSE CAST(0 AS BIT)
        END AS [IsMarkedForDelete],
        [Name].[LAST_NAME] AS [LastName],
        [Name].[FIRST_NAME] AS [FirstName],
        [Name].[COMPANY] AS [OrganizationName],
        [Name].[DATE_ADDED] AS [CreatedOn],
        Null AS [CreatedBy],
        [Name].[LAST_UPDATED] AS [UpdatedOn],
        [Name].[UPDATED_BY] AS [UpdatedBy],
        [Name].[MEMBER_TYPE] AS [CustomerTypeCode]
  FROM [dbo].[Name]



GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSoaPartyItemPrice]'))
    DROP VIEW [dbo].[vSoaPartyItemPrice]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO




CREATE VIEW [dbo].[vSoaPartyItemPrice]
AS
SELECT     
      p.[PartyId], 
      p.[Id] AS [Id], 
      p.[Status] AS [PartyStatus], 
      p.[Name] AS [PartyName], 
    p.[Sort] AS [PartySort], 
    p.[CityName] AS [PartyCityName], 
    p.[CountrySubEntityName] AS [PartyCountrySubEntityName], 
    p.[CountryName] AS [PartyCountryName], 
    p.[Phone] AS [PartyPhone], 
    p.[Email] AS [PartyEmail], 
    p.[IsMarkedForDelete] AS [PartyIsMarkedForDelete], 
    p.[LastName] AS [PartyLastName], 
    p.[FirstName] AS [PartyFirstName], 
    p.[OrganizationName] AS [PartyOrganizationName],
    p.[CustomerTypeCode] AS [CustomerTypeCode],
    i.[ItemId],
    i.[ItemId] as [ProductCode], 
    i.[Name] AS [ItemName], 
    i.[Description] AS [ItemDescription], 
    i.[ItemClass] AS [ItemClass], 
    i.[PRICE_1] AS [ItemPrice1], 
    i.[PRICE_2] AS [ItemPrice2], 
    i.[PRICE_3] AS [ItemPrice3], 
    i.[COMPLIMENTARY] AS [ItemComplimentary], 
    i.[IS_KIT] AS [ItemIsKit],
    n.[MEMBER_RECORD] as [NameIsMember]
FROM [dbo].[vSoaPartySummary] p 
    INNER JOIN [dbo].[Name] n ON p.[Id] = n.[ID]
      CROSS JOIN [dbo].[vSoaItem] i





GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSoaPaymentMethod]'))
    DROP VIEW [dbo].[vSoaPaymentMethod]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE VIEW [dbo].[vSoaPaymentMethod]
AS
SELECT 'BillMe' AS [PaymentMethodId], 'Bill Me' AS [Name], 'BillMe' as [PaymentType], 
       0 AS [CSCRequired], 0 AS [IssueNumberRequired], 0 AS [IssueDateRequired]
UNION ALL
SELECT CASH_ACCOUNT_CODE AS [PaymentMethodId], 
       [DESCRIPTION] AS [Name], 
       CASE WHEN [ACCOUNT_TYPE] = 0 THEN 'Cash'
            WHEN [ACCOUNT_TYPE] = 1 THEN 'CreditCard'
            WHEN [ACCOUNT_TYPE] = 2 THEN 'Other'
            WHEN [ACCOUNT_TYPE] = 3 THEN 'DebitCard'
            ELSE 'Cash'
       END AS [PaymentType],
       CAST ([CSC_REQUIRED_WEB] AS BIT) AS [CSCRequired],
       CAST ([ISSUE_NO_FLAG] AS BIT) AS [IssueNumberRequired],
       CAST ([ISSUE_DATE_FLAG] AS BIT) AS [IssueDateRequired]
FROM [dbo].[Cash_Accounts]


GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSoaUserCommercePreferences]'))
    DROP VIEW [dbo].[vSoaUserCommercePreferences]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE VIEW [dbo].[vSoaUserCommercePreferences]
AS
SELECT [UserMain].[ContactMaster] AS [UserCommercePreferencesId], [UserMain].[ContactMaster] as [UserId], 
CASE WHEN [Users].[UserId] IS NOT NULL THEN CAST(1 AS BIT)
  ELSE CAST(0 AS BIT)
  END
  AS [IsStaff],
(SELECT CONVERT(NVARCHAR(10),[ParameterValue]) FROM [SystemConfig] WHERE [ParameterName] = 'DefaultCurrencyCode' AND [SystemEntityKey] = '74E640E8-538D-438E-BBFD-AC48460B4758') AS [DefaultCurrencyCode]
FROM [UserMain] 
LEFT OUTER JOIN [Users] ON [UserMain].[UserId] = [Users].[UserId]
WHERE [UserMain].[ContactMaster] != '';


GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSoaUserRole]'))
    DROP VIEW [dbo].[vSoaUserRole]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [vSoaUserRole] AS
WITH Levels (LevelCode) AS (
    SELECT 1 AS [LevelCode]
    UNION
    SELECT 2 AS [LevelCode]
    UNION
    SELECT 3 AS [LevelCode]
    UNION
    SELECT 4 AS [LevelCode]
    UNION
    SELECT 5 AS [LevelCode]
    UNION
    SELECT 6 AS [LevelCode]
    UNION
    SELECT 7 AS [LevelCode]
    UNION
    SELECT 8 AS [LevelCode]
)
SELECT s.[WEB_LOGIN] AS [UserName], 'CustomerLevel' + CAST(r.[LevelCode] AS varchar) AS [Role]
  FROM [dbo].[Users] AS u
       INNER JOIN Levels AS r ON u.[LevelMembership] >= r.[LevelCode] 
       INNER JOIN [dbo].[Name_Security] AS s ON s.[WEB_LOGIN] = u.[UserId]
UNION
SELECT s.[WEB_LOGIN] AS [UserName], 'BillingLevel' + CAST(r.[LevelCode] AS varchar) AS [Role]
  FROM [dbo].[Users] AS u
       INNER JOIN Levels AS r ON u.[LevelDues] >= r.[LevelCode] 
       INNER JOIN [dbo].[Name_Security] AS s ON s.[WEB_LOGIN] = u.[UserId]
UNION
SELECT s.[WEB_LOGIN] AS [UserName], 'CashARLevel' + CAST(r.[LevelCode] AS varchar) AS [Role]
  FROM [dbo].[Users] AS u
       INNER JOIN Levels AS r ON u.[LevelCashAR] >= r.[LevelCode] 
       INNER JOIN [dbo].[Name_Security] AS s ON s.[WEB_LOGIN] = u.[UserId]
UNION
SELECT s.[WEB_LOGIN] AS [UserName], 'EventsLevel' + CAST(r.[LevelCode] AS varchar) AS [Role]
  FROM [dbo].[Users] AS u
       INNER JOIN Levels AS r ON u.[LevelMeeting] >= r.[LevelCode] 
       INNER JOIN [dbo].[Name_Security] AS s ON s.[WEB_LOGIN] = u.[UserId]
UNION
SELECT s.[WEB_LOGIN] AS [UserName], 'OrdersLevel' + CAST(r.[LevelCode] AS varchar) AS [Role]
  FROM [dbo].[Users] AS u
       INNER JOIN Levels AS r ON u.[LevelOrderEntry] >= r.[LevelCode] 
       INNER JOIN [dbo].[Name_Security] AS s ON s.[WEB_LOGIN] = u.[UserId]
UNION
SELECT s.[WEB_LOGIN] AS [UserName], 'ReferralLevel' + CAST(r.[LevelCode] AS varchar) AS [Role]
  FROM [dbo].[Users] AS u
       INNER JOIN Levels AS r ON u.[LevelReferral] >= r.[LevelCode] 
       INNER JOIN [dbo].[Name_Security] AS s ON s.[WEB_LOGIN] = u.[UserId]
UNION
SELECT s.[WEB_LOGIN] AS [UserName], 'CertificationLevel' + CAST(r.[LevelCode] AS varchar) AS [Role]
  FROM [dbo].[Users] AS u
       INNER JOIN Levels AS r ON u.[LevelCert] >= r.[LevelCode] 
       INNER JOIN [dbo].[Name_Security] AS s ON s.[WEB_LOGIN] = u.[UserId]
UNION
SELECT s.[WEB_LOGIN] AS [UserName], 'FundraisingLevel' + CAST(r.[LevelCode] AS varchar) AS [Role]
  FROM [dbo].[Users] AS u
       INNER JOIN Levels AS r ON u.[LevelFundRaising] >= r.[LevelCode] 
       INNER JOIN [dbo].[Name_Security] AS s ON s.[WEB_LOGIN] = u.[UserId]
UNION
SELECT s.[WEB_LOGIN] AS [UserName], 'ServiceCentralLevel' + CAST(r.[LevelCode] AS varchar) AS [Role]
  FROM [dbo].[Users] AS u
       INNER JOIN Levels AS r ON u.[LevelSC] >= r.[LevelCode] 
       INNER JOIN [dbo].[Name_Security] AS s ON s.[WEB_LOGIN] = u.[UserId]
UNION
SELECT s.[WEB_LOGIN] AS [UserName], 'ExpoLevel' + CAST(r.[LevelCode] AS varchar) AS [Role]
  FROM [dbo].[Users] AS u
       INNER JOIN Levels AS r ON u.[LevelExpo] >= r.[LevelCode] 
       INNER JOIN [dbo].[Name_Security] AS s ON s.[WEB_LOGIN] = u.[UserId]
UNION
SELECT s.[WEB_LOGIN] AS [UserName], 'SysAdmin' + CAST(r.[LevelCode] AS varchar) AS [Role]
  FROM [dbo].[Users] AS u
       INNER JOIN Levels AS r ON u.[LevelSystem] >= r.[LevelCode] 
       INNER JOIN [dbo].[Name_Security] AS s ON s.[WEB_LOGIN] = u.[UserId]
UNION
SELECT s.[WEB_LOGIN] AS [UserName], n.[MEMBER_TYPE] AS [Role] 
  FROM [dbo].[Name] n 
        INNER JOIN [dbo].[Name_Security] AS s ON n.[ID] = s.[ID]
        INNER JOIN [dbo].[Users] u ON u.[UserId] = s.[WEB_LOGIN]
        WHERE n.[MEMBER_TYPE] <> ''
UNION
SELECT s.[WEB_LOGIN] AS [UserName], 'IsMember' AS [Role]
  FROM [dbo].[Name] n 
        INNER JOIN [dbo].[Name_Security] AS s ON n.[ID] = s.[ID]
        INNER JOIN [dbo].[Users] u ON u.[UserId] = s.[WEB_LOGIN]
        WHERE [MEMBER_RECORD] = 1
UNION
SELECT s.[WEB_LOGIN] AS [UserName], 'IsStaff' AS [Role]
  FROM [dbo].[Name] n 
        INNER JOIN [dbo].[Name_Security] AS s ON n.[ID] = s.[ID]
        INNER JOIN [dbo].[Users] u ON u.[UserId] = s.[WEB_LOGIN]
UNION
SELECT s.[WEB_LOGIN] AS [UserName], 'AuthenticatedUser' AS [Role]
  FROM [dbo].[Name] n 
        INNER JOIN [dbo].[Name_Security] AS s ON n.[ID] = s.[ID]
        INNER JOIN [dbo].[Users] u ON u.[UserId] = s.[WEB_LOGIN]


GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSoftCredit]'))
    DROP VIEW [dbo].[vSoftCredit]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
create  view vSoftCredit as
    select ts.SOFT_CREDIT_ID as ID,
           sum(ts.AMOUNT) as AMOUNT
    from Trans_SoftCredit ts
 group by ts.SOFT_CREDIT_ID

GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSoftCreditHistory]'))
    DROP VIEW [dbo].[vSoftCreditHistory]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE     VIEW [dbo].[vSoftCreditHistory] AS

-- View of fundraising history for soft credit.  This is a union of two
-- very different SELECTs:

-- The first SELECT statement interrogates the SalesHistorySoftCredit
-- table to find soft credit that has been recorded using this method.
-- These could be soft creditors that are part of a contact's soft credit 
-- group, or were specifically indicated at order entry time, or were added
-- as soft creditors after the fact.

-- The second SELECT gathers the household members of the donor and assigns
-- 100% soft credit to them.  Duplicates are not removed: if a household member
-- is also represented in SalesHistorySoftCredit, that contact will appear twice
-- in the result.
select h.BillToContactKey as 'DonorKey',
       max(h.TransactionDate) as 'Date',
       h.InvoiceNumber, 
       h.InvoiceLineNumber,
       h.ProductKey,
       sum(h.ExtendedPrice) as 'Donation',
       shsc.ContactKey as 'SoftCreditorKey',
       max(shsc.PercentCredit) as 'Percent',
       sum(shsc.Amount) as 'SoftCredit',
       'SalesHistory' as 'Reason'
from SalesHistory h
 join ContactMain c1 on h.BillToContactKey = c1.ContactKey
 left outer join SalesHistorySoftCredit shsc on shsc.SalesHistoryKey = h.SalesHistoryKey
 join ContactMain c2 on shsc.ContactKey = c2.ContactKey
 group by h.InvoiceNumber, h.InvoiceLineNumber, h.BillToContactKey, h.ProductKey, shsc.ContactKey

UNION
 
select gh.DonorKey, 
gh.Date, 
gh.InvoiceNumber, 
gh.InvoiceLineNumber, 
gh.ProductKey, 
gh.Amount, 
gm2.MemberContactKey as 'SoftCreditorKey', 
'100' as 'Percent', 
gh.Amount as 'SoftCredit',
'HouseholdMember' as 'Reason'
from Institute i
  join ContactMain cm on cm.ContactKey = i.ContactKey
  join ContactTypeRef ctr on ctr.ContactTypeKey = cm.ContactTypeKey
  join GroupMember gm on gm.GroupKey = i.InstituteGroupKey
  join GroupMember gm2 on gm2.GroupKey = i.InstituteGroupKey
  join vGivingHistory gh on gh.DonorKey = gm.MemberContactKey
where ctr.ContactTypeDesc = 'Household' and 
      gm2.IsActive = '1' and
      gm2.MemberContactKey != gm.MemberContactKey

GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSpecificDonations]'))
    DROP VIEW [dbo].[vSpecificDonations]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
Create VIEW [dbo].[vSpecificDonations]
   AS
	SELECT	
			MAX(TransactionDate)as Date,  
			MAX(ID) as ID,  
			MAX(OriginalTransaction) as OriginalTransaction,  
			MAX(GiftType) as GiftType,  
			MAX(Amount) as Amount,  
			MAX(SourceSystem) as SourceSystem,
			MAX(SolicitorID) as SolicitorID,  
			MAX(IsMatchingGift)    as IsMatchingGift,  
			MAX(RequestNumber) as RequestCode,  
			MAX(Fund) as Fund,  
			MAX(Appeal) as Appeal , 
			MAX(Campaign) as Campaign  
				FROM vDonationsDetail 
					GROUP BY OriginalTransaction

GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vWorking_Content]'))
    DROP VIEW [dbo].[vWorking_Content]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW vWorking_Content AS
SELECT a.*
  FROM Content a
 WHERE WorkflowStatusCode IN ('W','E','A','D')

GO

