
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
    SELECT  ID, 
            OriginalTransaction, 
            GiftReport.TransactionNumber, 
            SourceSystem, 
            TransactionDate, 
            DateReceived, 
            Amount, 
            FairMktValue,
            Fund, 
            AppealCode AS Appeal, 
            SolicitorID, 
            CheckNumber, 
            PaymentType, 
            CampaignCode AS Campaign, 
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
    FROM [dbo].[GiftReport]

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

CREATE VIEW [dbo].[vPledgeData] AS
    SELECT ID, 
           TransactionType, 
           PledgeReport.TransactionNumber, 
           InvoiceReferenceNumber, 
           TransactionDate, 
           DateReceived, 
           FiscalYear, 
           FiscalMonth, 
           AppealCode AS Appeal, 
           CampaignCode AS Campaign, 
           Fund, 
           SolicitorID, 
           SourceSystem, 
           MatchingTransaction, 
           IsMatchingGift, 
           MemorialID, 
           ListAs, 
           RequestNumber, 
           InstallmentDate, 
           LastPaymentDate, 
           PledgeAmount, 
           AdjustmentsAmount, 
           PaymentsAmount, 
           PledgeFairMarketValue, 
           MemorialNameText 
    FROM [dbo].[PledgeReport]

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


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vAutoPayExpectedDonations]'))
    DROP VIEW [dbo].[vAutoPayExpectedDonations]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE VIEW [dbo].[vAutoPayExpectedDonations]
AS
WITH    c AS ( SELECT   a.CustomerId ,
                        a.InstructionId ,
                        a.IntervalTypeCode ,
                        a.ProductCode AS Distribution,
                        a.AuthorizedPaymentAmount AS DonationAmount,
                        i.DUE_DATE AS DueDate ,
                        a.StartDate ,
                        i.REFERENCE_NUM AS LastInvoiceNumber ,
                        COALESCE(i.DUE_DATE, StartDate) AS LastInvoiced ,
                        a.EndDate,
                        rn = ROW_NUMBER() OVER ( PARTITION BY a.InstructionId ORDER BY i.DUE_DATE DESC )
               FROM     AutoPayInstruction a
                        LEFT OUTER JOIN Invoice i ON CAST(a.InstructionId AS varchar(40)) = i.CUSTOMER_REFERENCE
                        WHERE Status='Active' AND SourceSystem='FR'
             )
    SELECT  CustomerId ,
            InstructionId ,
            Distribution ,
            DonationAmount,
            CASE WHEN IntervalTypeCode = 0 THEN DATEADD(MM, 12, LastInvoiced)
                 WHEN IntervalTypeCode = 1 THEN DATEADD(MM, 3, LastInvoiced)
                 WHEN IntervalTypeCode = 2 THEN DATEADD(MM, 1, LastInvoiced)
                 WHEN IntervalTypeCode = 3 THEN DATEADD(D, 7, LastInvoiced)
                 ELSE NULL
            END AS NextPaymentDue
    FROM    c
    WHERE   rn = 1

GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vAutoPayInstructionDetail]'))
    DROP VIEW [dbo].[vAutoPayInstructionDetail]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE VIEW [dbo].[vAutoPayInstructionDetail]
AS
SELECT a.[InstructionId], a.[CustomerId] AS [ID], a.[Status], a.[PaymentMethodSummary], a.[SourceSystem], 
       a.[CancelledOn], a.[CancellationReason], a.[AuthorizedPaymentAmount], [i].[IntervalTypeName], 
       COALESCE(p.[TITLE],'DUES') as TITLE
  FROM [dbo].[AutoPayInstruction] a 
       INNER JOIN [dbo].[IntervalTypeRef] i ON a.[IntervalTypeCode] = i.[IntervalTypeCode] 
       LEFT JOIN [dbo].[Product] p ON a.[ProductCode] = p.[PRODUCT_CODE] 


GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vRecurringDonationPaymentAttemptsExceeded]'))
    DROP VIEW [dbo].[vRecurringDonationPaymentAttemptsExceeded]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO


CREATE VIEW [dbo].[vRecurringDonationPaymentAttemptsExceeded]
AS
     SELECT DISTINCT d.InvoiceNumber
       FROM [dbo].[DataVaultLogDetail] d
           INNER JOIN [dbo].[DataVaultAttempt] a ON d.DataVaultLogDetailKey = a.DataVaultLogDetailKey 
           INNER JOIN [dbo].[DataVaultLog] l ON a.DataVaultLogKey = l.DataVaultLogKey
      WHERE a.[Status] IN ('A','I') OR a.[Attempt] > 2

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSoaPendingARPaymentAdjustment]'))
    DROP VIEW [dbo].[vSoaPendingARPaymentAdjustment]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE VIEW [dbo].[vSoaPendingARPaymentAdjustment] WITH SCHEMABINDING
AS
SELECT [INVOICE_REFERENCE_NUM],
         [INVOICE_LINE_NUM],
         SUM([INVOICE_CREDITS] - [INVOICE_CHARGES]) AS Amount,
         COUNT_BIG(*) [Count]
  FROM [dbo].Trans 
 WHERE [POSTED] < 2 
       AND [INVOICE_REFERENCE_NUM] != 0 
       AND (([TRANSACTION_TYPE] = 'AR' AND [JOURNAL_TYPE] = 'PAY')
       OR  ([TRANSACTION_TYPE] = 'DIST' AND [JOURNAL_TYPE] IN ('CM','DM'))
       OR  ([SOURCE_SYSTEM] = 'MEETING' 
            AND (([TRANSACTION_TYPE] = 'AR' AND [JOURNAL_TYPE] = 'IN') 
            OR ([TRANSACTION_TYPE] = 'DIST' AND [JOURNAL_TYPE] = 'IN'))))  
  GROUP BY [INVOICE_REFERENCE_NUM], [INVOICE_LINE_NUM]
GO
IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaPendingARPaymentAdjustment]') AND [name] = N'PK_vSoaPendingARPaymentAdjustment')
BEGIN
  CREATE UNIQUE CLUSTERED INDEX PK_vSoaPendingARPaymentAdjustment ON [dbo].[vSoaPendingARPaymentAdjustment] (INVOICE_REFERENCE_NUM, INVOICE_LINE_NUM)
END
go


GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vAutoPayInvoicesDues]'))
    DROP VIEW [dbo].[vAutoPayInvoicesDues]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

 

CREATE VIEW [dbo].[vAutoPayInvoicesDues]

AS

       SELECT i.[Balance]

               - ISNULL(( SELECT   SUM([Amount])

                          FROM     vSoaPendingARPaymentAdjustment

                          WHERE    [INVOICE_REFERENCE_NUM] = i.[REFERENCE_NUM]

                        ), 0) AS 'PaymentAmount' ,

              i.[Description] ,

              i.[ST_ID] AS 'MemberID' ,

              Name.FULL_NAME AS 'MemberName' ,

              i.DUE_DATE ,

              i.REFERENCE_NUM AS 'InvoiceNumber' ,

              api.PaymentToken AS code_Token ,

              Name.ID AS 'PayerID' ,

              Name.Company

         FROM Invoice i

              INNER JOIN AutoPayInstruction api ON i.[ST_ID] = api.CustomerId

              INNER JOIN Name ON api.CustomerId = Name.ID

              INNER JOIN Batch b on i.BATCH_NUM = b.BATCH_NUM

        WHERE NOT EXISTS ( SELECT 1 AS Expr1

                           FROM   vRecurringDonationPaymentAttemptsExceeded

                           WHERE  i.[REFERENCE_NUM] = vRecurringDonationPaymentAttemptsExceeded.InvoiceNumber )

              AND i.[INVOICE_TYPE] = ''

              AND ( i.[Balance]

                    - ISNULL(( SELECT SUM([Amount])

                               FROM   vSoaPendingARPaymentAdjustment

                               WHERE  [INVOICE_REFERENCE_NUM] = i.[REFERENCE_NUM]

                              ), 0) <> 0 )

              AND api.SourceSystem = 'DUES'

              AND i.[SOURCE_SYSTEM] = 'DUES'

              AND api.CancelledOn IS NULL

              AND b.STATUS = 2

              AND i.REFERENCE_NUM = ( SELECT  MAX([INVOICE_REFERENCE_NUM])

                                      FROM    [dbo].[Subscriptions]

                                      WHERE   STATUS = 'A'

                                              AND [ID] = i.[ST_ID]

                                    )

 

 

 

 


GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vAutoPayInvoicesFundraising]'))
    DROP VIEW [dbo].[vAutoPayInvoicesFundraising]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE VIEW [dbo].[vAutoPayInvoicesFundraising]
AS
     SELECT i.[Balance]
            - ISNULL(( SELECT   SUM([Amount])
                       FROM     vSoaPendingARPaymentAdjustment
                       WHERE    [INVOICE_REFERENCE_NUM] = i.[REFERENCE_NUM]
                     ), 0) AS 'PaymentAmount' ,
            i.[Description] ,
            i.[DUE_DATE] ,
            i.[REFERENCE_NUM] AS 'InvoiceNumber' ,
            Name.[ID] AS 'DonorID' ,
            Name.[Company] ,
            api.[PaymentToken] AS code_Token ,
            Name.[FULL_NAME] AS 'FullName',
            api.[InstructionId]
       FROM Invoice i
            INNER JOIN AutoPayInstruction api ON i.[CUSTOMER_REFERENCE] = CAST(api.InstructionId AS varchar(40))
            INNER JOIN Name ON api.CustomerId = Name.ID
            INNER JOIN Batch b on i.BATCH_NUM = b.BATCH_NUM
      WHERE NOT EXISTS ( SELECT 1 AS Expr1
                           FROM   [dbo].[vRecurringDonationPaymentAttemptsExceeded] rdpae
                          WHERE  i.REFERENCE_NUM = rdpae.InvoiceNumber )
            AND i.[ORIGINATING_TRANS_NUM] > 0
            AND EXISTS ( SELECT 1
                          FROM   [dbo].[Activity] a
                          WHERE  a.[ORIGINATING_TRANS_NUM] = i.[ORIGINATING_TRANS_NUM]
                                AND a.[ACTIVITY_TYPE] = 'PLEDGE' )
            AND api.SourceSystem = 'FR'
            AND api.CancelledOn IS NULL
            AND i.[INVOICE_TYPE] = ''
            AND b.STATUS = 2
            AND ( i.[Balance]
                 - ISNULL(( SELECT SUM([Amount])
                              FROM   vSoaPendingARPaymentAdjustment
                             WHERE  [INVOICE_REFERENCE_NUM] = i.[REFERENCE_NUM]
                          ), 0) <> 0 )


GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vAutoPayInvoices]'))
    DROP VIEW [dbo].[vAutoPayInvoices]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vAutoPayInvoices]
AS
SELECT [Code_Token] AS codeToken , [Company],  [Description],  [DUE_DATE] AS [DueDate], [InvoiceNumber] AS [InvoiceNumber], 
       [MemberID] AS [CustomerID], [MemberName] AS [CustomerName], [PayerID] AS [PayerID], [PaymentAmount] AS [PaymentAmount], 
       'DUES' AS SourceSystem, 'SubscriptionBilling' AS InvoiceType   
  FROM [dbo].[vAutoPayInvoicesDues] 
 UNION ALL 
SELECT [Code_Token] AS codeToken, [Company], [Description], [DUE_DATE] AS [DueDate], [InvoiceNumber] AS [InvoiceNumber], 
       [DonorID] AS [CustomerID], [FullName] AS [CustomerName], [DonorID] AS [PayerID], [PaymentAmount] AS [PaymentAmount],
       'FR' AS SourceSystem, 'Pledge' AS InvoiceType    
  FROM [dbo].[vAutoPayInvoicesFundraising]   



GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSoaInvoiceLineCashBase]'))
    DROP VIEW [dbo].[vSoaInvoiceLineCashBase]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO


CREATE VIEW [dbo].[vSoaInvoiceLineCashBase] WITH SCHEMABINDING
AS
SELECT CAST(s.[ID] + ':' + s.[PRODUCT_CODE] AS VARCHAR(31)) AS InvoiceLineId,
       CAST('CASH:' + s.[ID] AS VARCHAR(20)) AS InvoiceId,
       s.[INVOICE_LINE_NUM] AS LineNumber,
       s.[PRODUCT_CODE] AS ItemId,
       s.[ID] AS ShipToPartyId,
       CASE WHEN s.[BILL_COPIES]!=0 THEN s.[BILL_COPIES] ELSE s.[COPIES] END  AS Quantity,
       (s.[PAYMENT_AMOUNT] + s.[ADJUSTMENT_AMOUNT]) AS PaymentAdjustmentAmount,
       s.[BILL_COPIES],
       s.[BILL_AMOUNT],
       s.[BALANCE],
       s.[PROD_TYPE],
       s.[BILL_DATE]
  FROM [dbo].[Product] p 
       INNER JOIN [dbo].[Subscriptions] s ON p.[PRODUCT_CODE] = s.[PRODUCT_CODE]
 WHERE s.[INVOICE_REFERENCE_NUM] = 0
   AND s.[STATUS] = 'A'
   AND (s.[BILL_DATE] IS NOT NULL OR s.[BILL_AMOUNT] != 0)


GO
IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaInvoiceLineCashBase]') AND [name] = N'PK_vSoaInvoiceLineCashBase')
BEGIN
  CREATE UNIQUE CLUSTERED INDEX PK_vSoaInvoiceLineCashBase ON [dbo].[vSoaInvoiceLineCashBase] (InvoiceLineId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaInvoiceLineCashBase]') AND [name] = N'IX_vSoaInvoiceLineCashBase_ShipToPartyId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaInvoiceLineCashBase_ShipToPartyId ON [dbo].[vSoaInvoiceLineCashBase] (ShipToPartyId)
  INCLUDE (ItemId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaInvoiceLineCashBase]') AND [name] = N'IX_vSoaInvoiceLineCashBase_InvoiceId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaInvoiceLineCashBase_InvoiceId ON [dbo].[vSoaInvoiceLineCashBase] (InvoiceId)
END
go


GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSoaPendingCashPaymentAdjustment]'))
    DROP VIEW [dbo].[vSoaPendingCashPaymentAdjustment]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE VIEW [dbo].[vSoaPendingCashPaymentAdjustment] WITH SCHEMABINDING
AS
SELECT [ST_ID],
	   [PRODUCT_CODE],
	   SUM(-([AMOUNT] + [ADJUSTMENT_AMOUNT])) AS Amount,
	   COUNT_BIG(*) [Count]
  FROM [dbo].Trans
  WHERE [POSTED] < 2 AND [TRANSACTION_TYPE] = 'DIST' AND [JOURNAL_TYPE] = 'PAY' AND [INVOICE_REFERENCE_NUM] = 0
  GROUP BY [ST_ID], [PRODUCT_CODE]
GO
IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaPendingCashPaymentAdjustment]') AND [name] = N'PK_vSoaPendingCashPaymentAdjustment')
BEGIN
  CREATE UNIQUE CLUSTERED INDEX PK_vSoaPendingCashPaymentAdjustment ON [dbo].[vSoaPendingCashPaymentAdjustment] (ST_ID, PRODUCT_CODE)
END
go


GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSoaInvoiceLineCash]'))
    DROP VIEW [dbo].[vSoaInvoiceLineCash]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE VIEW [dbo].[vSoaInvoiceLineCash] 
AS
SELECT s.InvoiceLineId,
       s.InvoiceId,
       s.LineNumber,
       s.ItemId,
       s.ShipToPartyId,
       s.Quantity,
       CAST(CASE WHEN s.[BILL_COPIES] > 0 
                 THEN (s.[BILL_AMOUNT]/s.[BILL_COPIES]) 
                 ELSE s.[BILL_AMOUNT]
             END AS MONEY) AS UnitPrice,       
       (CASE WHEN s.[PROD_TYPE] != 'VOL' 
             THEN s.[BILL_AMOUNT] 
             ELSE (CASE WHEN s.[BALANCE] - ISNULL(up.[Amount],0) <= 0
                        THEN PaymentAdjustmentAmount + ISNULL(up.[Amount], 0) 
                        ELSE s.[BILL_AMOUNT] 
                    END) 
         END) AS ExtendedAmount,
       PaymentAdjustmentAmount,
       ISNULL(up.Amount,0) AS PendingPaymentAdjustmentAmount,
       (CASE WHEN s.[PROD_TYPE] = 'VOL' 
             THEN (CASE WHEN s.[BALANCE] - ISNULL(up.[Amount], 0) <= 0 
                        THEN 0 
                        ELSE s.[BALANCE] - ISNULL(up.[Amount], 0) 
                    END) 
             ELSE (s.[BALANCE] - ISNULL(up.[Amount], 0)) 
         END) AS Balance,
       s.BILL_DATE
  FROM [dbo].[vSoaInvoiceLineCashBase] s WITH (NOEXPAND)
       LEFT JOIN [dbo].[vSoaPendingCashPaymentAdjustment] up WITH (NOEXPAND) ON s.[ShipToPartyId] = up.[ST_ID] AND s.[ItemId] = up.[PRODUCT_CODE]


GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSoaInvoiceSummaryCashBase]'))
    DROP VIEW [dbo].[vSoaInvoiceSummaryCashBase]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vSoaInvoiceSummaryCashBase] WITH SCHEMABINDING
AS
SELECT
       CAST('CASH:' + n.[ID] AS VARCHAR(20)) AS InvoiceId,
       n.[ORG_CODE] AS FinancialEntityId,
       0 AS InvoiceNumber,
       n.[ID] AS BillToPartyId,
       n.[ID] AS SoldToPartyId,
       -- added 07/2013 JHS to support PBI 38664
       CASE WHEN s.[ID] IS NULL THEN ''
            WHEN n.[MT_CHANGE_DATE] IS NULL THEN n.[MEMBER_TYPE]
            WHEN s.UPDATED_BY LIKE 'Renewal%' AND s.[LAST_UPDATED] < n.[MT_CHANGE_DATE]  THEN n.[PREVIOUS_MT]
            WHEN s.UPDATED_BY NOT LIKE 'Renewal%' AND CAST(s.[BILL_DATE] AS date) <= CAST(n.[MT_CHANGE_DATE] AS date) THEN n.[PREVIOUS_MT]
            ELSE n.[MEMBER_TYPE]
       END AS [BillingMemberType]
  FROM [dbo].[Name] n
       -- added 07/2013 JHS to support PBI 38664
       LEFT JOIN [dbo].[Subscriptions] s ON n.[ID] = s.[ID] 
            AND s.[PRODUCT_CODE] = (SELECT mt.[DUES_CODE_1] FROM [dbo].[Member_Types] mt WHERE n.[MEMBER_TYPE] = mt.[MEMBER_TYPE]) 
            AND s.[BALANCE] > 0
GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSoaInvoiceSummaryInvoiceBase]'))
    DROP VIEW [dbo].[vSoaInvoiceSummaryInvoiceBase]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE VIEW [dbo].[vSoaInvoiceSummaryInvoiceBase] WITH SCHEMABINDING
AS
SELECT CAST(i.[REFERENCE_NUM] AS VARCHAR(20)) AS [InvoiceId],
       i.[ORG_CODE] AS [FinancialEntityId],
       i.[INVOICE_NUM] AS [InvoiceNumber],
       i.[INVOICE_DATE] AS [InvoiceDate],
       i.[BT_ID] AS [BillToPartyId],
       i.[ST_ID] AS [SoldToPartyId],
       i.[DESCRIPTION] AS [Description],
       i.[CHARGES] AS [InvoiceAmount],
       i.[CREDITS] AS [PaymentAdjustmentAmount],
       i.[BALANCE] AS [Balance],
       i.[SOURCE_SYSTEM],
       i.[REFERENCE_NUM],
       i.[ORIGINATING_TRANS_NUM],
       i.[INVOICE_TYPE],
       i.[CUSTOMER_REFERENCE] -- added 25-Nov-2013 JHS to support AutoPayPledge InvoiceType
  FROM [dbo].[Invoice] i 

GO
IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaInvoiceSummaryInvoiceBase]') AND [name] = N'PK_vSoaInvoiceSummaryInvoiceBase')
BEGIN
  CREATE UNIQUE CLUSTERED INDEX PK_vSoaInvoiceSummaryInvoiceBase ON [dbo].[vSoaInvoiceSummaryInvoiceBase] (InvoiceId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaInvoiceSummaryInvoiceBase]') AND [name] = N'IX_vSoaInvoiceSummaryInvoiceBase_SoldToPartyId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaInvoiceSummaryInvoiceBase_SoldToPartyId ON [dbo].[vSoaInvoiceSummaryInvoiceBase] (SoldToPartyId, INVOICE_TYPE)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaInvoiceSummaryInvoiceBase]') AND [name] = N'IX_vSoaInvoiceSummaryInvoiceBase_BillToPartyId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaInvoiceSummaryInvoiceBase_BillToPartyId ON [dbo].[vSoaInvoiceSummaryInvoiceBase] (BillToPartyId, INVOICE_TYPE)
END
go


GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSoaInvoiceSummaryInvoice]'))
    DROP VIEW [dbo].[vSoaInvoiceSummaryInvoice]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO


CREATE VIEW [dbo].[vSoaInvoiceSummaryInvoice]
AS
SELECT i.[InvoiceId],
       i.[FinancialEntityId],
       i.[InvoiceNumber],
       i.[InvoiceDate],
       i.[BillToPartyId],
       i.[SoldToPartyId],
       i.[Description],
       i.[InvoiceAmount],
       i.[PaymentAdjustmentAmount],
       i.[Balance],
       i.[SOURCE_SYSTEM],
       i.[REFERENCE_NUM],
       i.[ORIGINATING_TRANS_NUM],
       i.[INVOICE_TYPE],
       CASE WHEN s.[ID] IS NULL THEN ''
            WHEN n.[MT_CHANGE_DATE] IS NULL THEN n.[MEMBER_TYPE]
            WHEN s.[BILL_DATE] < n.[MT_CHANGE_DATE] THEN n.[PREVIOUS_MT]
            ELSE n.[MEMBER_TYPE]
       END AS [BillingMemberType],
       i.[CUSTOMER_REFERENCE] -- added 25-Nov-2013 JHS to support AutoPayPledge InvoiceType
  FROM [dbo].[vSoaInvoiceSummaryInvoiceBase] i WITH (NOEXPAND)
       LEFT JOIN [dbo].[Name] n ON i.[SoldToPartyId] = n.[ID] 
       LEFT JOIN [dbo].[Subscriptions] s ON n.[ID] = s.[ID] 
                AND s.[PRODUCT_CODE] = (SELECT mt.[DUES_CODE_1] FROM [dbo].[Member_Types] mt WHERE n.[MEMBER_TYPE] = mt.[MEMBER_TYPE]) 
                AND s.[BALANCE] > 0
       WHERE i.[INVOICE_TYPE] != 'PP'    -- 11/2013 BE filter out prepayments PBI 39698            

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
SELECT i.[InvoiceId], 
         i.[FinancialEntityId],
           CASE WHEN i.[InvoiceNumber] = 0 THEN 'R' + CAST(i.[InvoiceId] AS varchar(10))
                ELSE CAST(i.[InvoiceNumber] AS varchar(12))
           END 
         AS InvoiceNumber, 
         i.[InvoiceDate], 
         i.[BillToPartyId], 
         i.[SoldToPartyId], 
         i.[Description], 
           CASE WHEN i.[SOURCE_SYSTEM] = 'DUES' THEN 'SubscriptionBilling'
                WHEN i.[SOURCE_SYSTEM] = 'MEETING' THEN 'Regular' -- added 4-Dec-2013 JHS
                WHEN i.[ORIGINATING_TRANS_NUM] > 0 AND MAX(i.[CUSTOMER_REFERENCE]) > '' AND EXISTS 
                  (SELECT 1 FROM [dbo].[Activity] a 
                      WHERE a.[ORIGINATING_TRANS_NUM] = i.[ORIGINATING_TRANS_NUM] AND a.[ACTIVITY_TYPE] = 'PLEDGE') THEN 'AutoPayPledge' -- added 25-Nov-2013 JHS to support AutoPayPledge InvoiceType
                WHEN i.[ORIGINATING_TRANS_NUM] > 0 AND EXISTS 
                  (SELECT 1 FROM [dbo].[Activity] a 
                      WHERE a.[ORIGINATING_TRANS_NUM] = i.[ORIGINATING_TRANS_NUM] AND a.[ACTIVITY_TYPE] = 'PLEDGE') THEN 'Pledge'
                WHEN i.[ORIGINATING_TRANS_NUM] > 0 AND EXISTS 
                   (SELECT 1 FROM [dbo].[Activity] a 
                      WHERE a.[ORIGINATING_TRANS_NUM] = i.[ORIGINATING_TRANS_NUM] AND a.[ACTIVITY_TYPE] = 'GIFT') THEN 'Gift'
                ELSE 'Regular' 
            END 
       AS InvoiceType,
       i.[InvoiceAmount], 
       i.[PaymentAdjustmentAmount], 
       SUM(ISNULL(pp.[Amount],0)) AS PendingPaymentAdjustmentAmount,
       i.[Balance] -SUM(ISNULL(pp.[Amount],0)) AS [Balance], 
       'Accrual' AS AccountingMethod,
       i.[BillingMemberType] 
  FROM [vSoaInvoiceSummaryInvoice] i 
  LEFT JOIN [dbo].[vSoaPendingARPaymentAdjustment] pp  WITH (NOEXPAND) ON pp.[INVOICE_REFERENCE_NUM] = i.[REFERENCE_NUM]
  WHERE i.[INVOICE_TYPE] != 'PP'
   AND ((i.[SOURCE_SYSTEM] != 'DUES' 
    OR i.REFERENCE_NUM = (SELECT MAX([INVOICE_REFERENCE_NUM]) FROM [dbo].[Subscriptions] WHERE STATUS = 'A' AND [ID] = i.[SoldToPartyId]))) 
GROUP BY i.[InvoiceId], i.[FinancialEntityId],  i.[InvoiceNumber], i.[InvoiceDate], i.[BillToPartyId], i.[SoldToPartyId], 
         i.[Description], i.[InvoiceAmount], i.[PaymentAdjustmentAmount], i.[Balance], i.[ORIGINATING_TRANS_NUM], i.[SOURCE_SYSTEM],
         i.[BillingMemberType] 

UNION ALL

/* BEGIN 2014-04-09 JHS */
/* Include any outstanding Accrual Dues Invoices that are not for the current Membership Billing */
SELECT i.[InvoiceId], 
       i.[FinancialEntityId],
         CASE WHEN i.[InvoiceNumber] = 0 THEN 'R' + CAST(i.[InvoiceId] AS varchar(10))
              ELSE CAST(i.[InvoiceNumber] AS varchar(12))
         END 
       AS InvoiceNumber, 
       i.[InvoiceDate], 
       i.[BillToPartyId], 
       i.[SoldToPartyId], 
       i.[Description], 
       'PastDueSubscriptionBilling' AS InvoiceType,
       i.[InvoiceAmount], 
       i.[PaymentAdjustmentAmount], 
       SUM(ISNULL(pp.[Amount],0)) AS PendingPaymentAdjustmentAmount,
       i.[Balance] -SUM(ISNULL(pp.[Amount],0)) AS [Balance], 
       'Accrual' AS AccountingMethod,
       i.[BillingMemberType] 
  FROM [vSoaInvoiceSummaryInvoice] i 
  LEFT JOIN [dbo].[vSoaPendingARPaymentAdjustment] pp  WITH (NOEXPAND) ON pp.[INVOICE_REFERENCE_NUM] = i.[REFERENCE_NUM]
  WHERE i.[INVOICE_TYPE] != 'PP'
   AND ((i.[SOURCE_SYSTEM] = 'DUES' 
   AND  i.REFERENCE_NUM != (SELECT MAX([INVOICE_REFERENCE_NUM]) FROM [dbo].[Subscriptions] WHERE STATUS = 'A' AND [ID] = i.[SoldToPartyId]))) 
GROUP BY i.[InvoiceId], i.[FinancialEntityId],  i.[InvoiceNumber], i.[InvoiceDate], i.[BillToPartyId], i.[SoldToPartyId], 
         i.[Description], i.[InvoiceAmount], i.[PaymentAdjustmentAmount], i.[Balance], i.[ORIGINATING_TRANS_NUM], i.[SOURCE_SYSTEM],
         i.[BillingMemberType] 

UNION ALL

/* END 2014-04-09 JHS */
SELECT 
       il.[InvoiceId] AS InvoiceId,
       (SELECT CASE WHEN (SELECT ISNULL([ShortValue],'') FROM [dbo].[System_Params] 
         WHERE [ParameterName] = 'AR_Control.DefaultEntityDues')  != '' THEN (SELECT [ShortValue] FROM [dbo].[System_Params] 
         WHERE [ParameterName] = 'AR_Control.DefaultEntityDues')
         ELSE (Select OrgCode from Org_Control where DefaultFlag = 1) END) AS FinancialEntityId,
       '0' AS InvoiceNumber,
       MAX(il.BILL_DATE) AS InvoiceDate,
       s.BillToPartyId,
       s.SoldToPartyId,
       'Renewal Fees' AS Description,
       'SubscriptionBilling' AS InvoiceType,
       SUM(il.[ExtendedAmount])AS InvoiceAmount,
       SUM(il.[PaymentAdjustmentAmount]) AS PaymentAdjustmentAmount,
       SUM(il.[PendingPaymentAdjustmentAmount]) AS PendingPaymentAdjustmentAmount,
       SUM(il.[Balance]) AS Balance,
       'Cash' AS AccountingMethod,
       s.[BillingMemberType] 
  FROM [dbo].[vSoaInvoiceSummaryCashBase] s 
  INNER JOIN [dbo].[vSoaInvoiceLineCash] il ON s.[InvoiceId] = il.[InvoiceId] AND s.[SoldToPartyId] = il.[ShipToPartyId]
GROUP BY s.BillToPartyId, s.SoldToPartyId, il.[InvoiceId], 
         s.[BillingMemberType] 


GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vAutoPayPaymentsDue]'))
    DROP VIEW [dbo].[vAutoPayPaymentsDue]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE VIEW [dbo].[vAutoPayPaymentsDue]
AS
SELECT api.PaymentToken, api.CustomerId, sis.Balance, sis.Description, sis.SoldToPartyId, sis.BillToPartyId, sis.InvoiceType, sis.AccountingMethod, i.DUE_DATE, 
       i.REFERENCE_NUM AS InvoiceId, api.SourceSystem, i.INVOICE_DATE AS InvoiceDate
  FROM Invoice AS i LEFT OUTER JOIN
       vSoaInvoiceSummary AS sis ON CAST(i.REFERENCE_NUM AS varchar(20)) = sis.InvoiceId INNER JOIN
       AutoPayInstruction AS api ON sis.BillToPartyId = api.CustomerId AND (i.CUSTOMER_REFERENCE = CAST(api.InstructionId AS VARCHAR(40)) OR
       i.CUSTOMER_REFERENCE = '') AND i.SOURCE_SYSTEM = api.SourceSystem
 WHERE (i.SOURCE_SYSTEM = 'DUES' OR
       i.SOURCE_SYSTEM = 'FR') AND (sis.InvoiceType = 'SubscriptionBilling' OR
       sis.InvoiceType = 'Pledge') AND (api.Status = 'Active') AND (sis.Balance > 0)



GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBatch]'))
    DROP VIEW [dbo].[vBatch]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE VIEW [dbo].[vBatch]
AS
SELECT [BATCH_NUM] AS [BATCH_NUMBER],
       [DESCRIPTION] AS [DESCRIPTION],
       [EFFECTIVE_DATE] AS [BATCH_DATE],
       [CONTROL_COUNT] AS [CONTROL_COUNT],
       [CONTROL_CASH] AS [CONTROL_AMOUNT],
       [TRANS_CASH] AS [ACTUAL_AMOUNT],
       [DATE_CREATED] AS [DATE_CREATED],
       [CREATED_BY] AS [CREATED_BY],
       [TRANS_COUNT] AS [TRANSACTION_COUNT],
       [WEB_BATCH] AS [WEB_BATCH],
       CASE
         WHEN [STATUS] = 6 THEN '2'
         ELSE [STATUS]
       END AS [Status]
  FROM [dbo].[Batch];



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
CREATE VIEW [dbo].[vBoAccessArea]
AS
SELECT AccessArea.Description,AccessArea.IsSystem,AccessArea.Name,AccessArea.UpdatedByUserKey,AccessArea.UpdatedOn,AccessArea.AccessAreaKey,AccessArea.CreatedByUserKey,AccessArea.CreatedOn,AccessArea.ProtectedAccessKey,AccessArea.IsContentACL
  FROM AccessArea
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
CREATE VIEW [dbo].[vBoAccessItem]
AS
SELECT AccessItem.AccessKey,AccessItem.Grantee,AccessItem.GroupKey,AccessItem.Permission,AccessItem.RoleKey,AccessItem.UserKey
  FROM AccessItem
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
CREATE VIEW [dbo].[vBoAccessMain]
AS
SELECT AccessMain.AccessKey,AccessMain.AccessScope,AccessMain.CreatedByUserKey,AccessMain.CreatedOn,AccessMain.UpdatedByUserKey,AccessMain.UpdatedOn
  FROM AccessMain
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
CREATE VIEW [dbo].[vBoActionPlan]
AS
SELECT ActionPlan.ActionManifest,ActionPlan.Description,ActionPlan.Name,ActionPlan.UpdatedByUserKey,ActionPlan.UpdatedOn,ActionPlan.ActionPlanKey,ActionPlan.OpportunityTypeKey,ActionPlan.CreatedByUserKey,ActionPlan.CreatedOn
  FROM ActionPlan
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
CREATE VIEW [dbo].[vBoActivity]
AS
SELECT Activity.ACTIVITY_TYPE AS ActivityType,Activity.AMOUNT AS Amount,Activity.CO_ID AS CompanyId,Activity.DESCRIPTION AS Description,Activity.ID AS Id,Activity.PAY_METHOD AS PayMethod,Activity.QUANTITY AS Quantity,Activity.SOURCE_CODE AS SourceCode,Activity.TRANSACTION_DATE AS TransactionDate,Activity.UF_1 AS Uf1,Activity.UF_2 AS Uf2,Activity.UF_3 AS Uf3
  FROM Activity
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
CREATE VIEW [dbo].[vBoAddress]
AS
SELECT AddressMain.UpdatedByUserKey,AddressMain.AddressStatusCode,AddressMain.IsPhysicalAddress,AddressMain.LastVerifiedOn,AddressMain.BadAddressReasonKey,AddressMain.UpdatedOn,AddressMain.FormattedAddress,AddressMain.AddressKey,AddressMain.CreatedByUserKey,AddressMain.CreatedOn,AddressMain.SystemEntityKey,AddressMain.AddressCategoryCode,AddressMain.OwnerContactKey
  FROM AddressMain
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
CREATE VIEW [dbo].[vBoAddressCategoryPreferences]
AS
SELECT AddressCategoryPreferences.ContactKey,AddressCategoryPreferences.AddressCategoryCode,AddressCategoryPreferences.NoSolicitationFlag,AddressCategoryPreferences.OptOutFlag
  FROM AddressCategoryPreferences
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
CREATE VIEW [dbo].[vBoAddressCategoryRef]
AS
SELECT AddressCategoryRef.AddressCategoryCode AS Code,AddressCategoryRef.AddressCategoryDesc AS Description,AddressCategoryRef.IsPhysicalAddress,AddressCategoryRef.AddressCategoryName AS Name,AddressCategoryRef.FormatMask
  FROM AddressCategoryRef
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
CREATE VIEW [dbo].[vBoAddressFormatRef]
AS
SELECT AddressFormatRef.AddressFormatDesc AS Name,AddressFormatRef.AddressFormatKey,AddressFormatRef.Description,AddressFormatRef.Formula,AddressFormatRef.IsHandModified,AddressFormatRef.UpdatedByUserKey,AddressFormatRef.UpdatedOn,AddressFormatRef.IsSystemDefault,AddressFormatRef.CreatedByUserKey,AddressFormatRef.CreatedOn
  FROM AddressFormatRef
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
CREATE VIEW [dbo].[vBoAddressPurposeContactType]
AS
SELECT AddressPurposeContactType.AddressPurposeContactTypeKey,AddressPurposeContactType.AddressPurposeKey,AddressPurposeContactType.AlwaysDisplayFlag,AddressPurposeContactType.ContactTypeKey,AddressPurposeContactType.DisplayOrder,AddressPurposeContactType.IsAddressRequired,AddressPurposeContactType.IsEmailRequired,AddressPurposeContactType.IsFaxRequired,AddressPurposeContactType.IsPhoneRequired,AddressPurposeContactType.IsSingleUse
  FROM AddressPurposeContactType
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
CREATE VIEW [dbo].[vBoAddressPurposeRef]
AS
SELECT AddressPurposeRef.AddressPurposeKey,AddressPurposeRef.IsSystem,AddressPurposeRef.IsActive,AddressPurposeRef.UpdatedByUserKey,AddressPurposeRef.UpdatedOn,AddressPurposeRef.AddressPurposeDesc AS Description,AddressPurposeRef.CreatedByUserKey,AddressPurposeRef.CreatedOn
  FROM AddressPurposeRef
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
CREATE VIEW [dbo].[vBoAddressStatusRef]
AS
SELECT AddressStatusRef.AddressStatusCode AS Code,AddressStatusRef.AddressStatusDesc AS Description,AddressStatusRef.IsSystem
  FROM AddressStatusRef
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
CREATE VIEW [dbo].[vBoAddressToUse]
AS
SELECT AddressToUse.CommunicationReasonKey,AddressToUse.ContactKey,AddressToUse.FullAddressKey,AddressToUse.FullAddressText,AddressToUse.SeasonalRevertFullAddressKey
  FROM AddressToUse
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
CREATE VIEW [dbo].[vBoAddressTypeRef]
AS
SELECT AddressTypeRef.AddressTypeKey,AddressTypeRef.IsActive,AddressTypeRef.IsSystem,AddressTypeRef.DisplayOrder,AddressTypeRef.AddressCategoryCode,AddressTypeRef.AddressTypeName AS Name
  FROM AddressTypeRef
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
CREATE VIEW [dbo].[vBoAppeal]
AS
SELECT AppealMain.Description,AppealMain.Name,AppealMain.StartDate,AppealMain.UpdatedByUserKey,AppealMain.UpdatedOn,AppealMain.AppealStatusCode,AppealMain.TotalRevenue,AppealMain.CostCollection,AppealMain.PredictedResponseRate,AppealMain.TargetRevenue,AppealMain.EndDate,AppealMain.AccessKey,AppealMain.AppealKey,AppealMain.CampaignKey,AppealMain.CreatedByUserKey,AppealMain.CreatedOn,AppealMain.ActualCost,AppealMain.EstimatedCost,AppealMain.ExtendedCost,AppealMain.FirstResponseDate,AppealMain.HighResponseAmount,AppealMain.LastResponseDate,AppealMain.LowResponseAmount,AppealMain.OverheadCost,AppealMain.TotalNegativeResponse,AppealMain.TotalPositiveResponse,AppealMain.TotalSolicited
  FROM AppealMain
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
CREATE VIEW [dbo].[vBoAppealParticipation]
AS
SELECT AppealParticipation.AppealKey,AppealParticipation.AppealParticipationKey,AppealParticipation.CreatedByUserKey,AppealParticipation.CreatedOn,AppealParticipation.RespondentUserKey,AppealParticipation.SolicitationKey,AppealParticipation.UpdatedByUserKey,AppealParticipation.UpdatedOn,AppealParticipation.SourceCodeKey,AppealParticipation.ResponseTypeCode
  FROM AppealParticipation
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
CREATE VIEW [dbo].[vBoAppealProduct]
AS
SELECT AppealProduct.AppealKey,AppealProduct.AppealProductKey,AppealProduct.ProductKey,AppealProduct.ProductCode
  FROM AppealProduct
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
CREATE VIEW [dbo].[vBoAppealStatusRef]
AS
SELECT AppealStatusRef.AppealStatusCode,AppealStatusRef.AppealStatusDesc,AppealStatusRef.AppealStatusName
  FROM AppealStatusRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoAsiExampleTestObject]'))
    DROP VIEW [dbo].[vBoAsiExampleTestObject]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoAsiExampleTestObject]
AS
SELECT Tag.AccessKey,Tag.AssignAccessKey,Tag.CreatedByUserKey,Tag.CreatedOn,Tag.IsCategory,Tag.TagAliasList,Tag.TagKey,Tag.TagName,Tag.UpdatedByUserKey,Tag.UpdatedOn,UniformTag.CreatedByUserKey AS CreatedByUserKey_1,UniformTag.CreatedOn AS CreatedOn_1,UniformTag.IsPrimary,UniformTag.TagKey AS TagKey_1,UniformTag.UniformKey
  FROM UniformTag
	INNER JOIN Tag
		ON UniformTag.TagKey = Tag.TagKey
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoAsiExampleTestObjectBranch]'))
    DROP VIEW [dbo].[vBoAsiExampleTestObjectBranch]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoAsiExampleTestObjectBranch]
AS
SELECT Tag.AccessKey,Tag.AssignAccessKey,Tag.CreatedByUserKey,Tag.CreatedOn,Tag.IsCategory,Tag.TagAliasList,Tag.TagKey,Tag.TagName,Tag.UpdatedByUserKey,Tag.UpdatedOn,UniformTag.CreatedByUserKey AS CreatedByUserKey_1,UniformTag.CreatedOn AS CreatedOn_1,UniformTag.IsPrimary,UniformTag.TagKey AS TagKey_1,UniformTag.UniformKey
  FROM UniformTag
	INNER JOIN Tag
		ON UniformTag.TagKey = Tag.TagKey
 WHERE UniformTag.IsPrimary=0
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
CREATE VIEW [dbo].[vBoAsyncStatusMonitor]
AS
SELECT AsyncStatusMonitor.AsyncStatusMonitorKey,AsyncStatusMonitor.BusinessItemKey,AsyncStatusMonitor.ComponentKey,AsyncStatusMonitor.CreatedOn,AsyncStatusMonitor.WorkflowQueueItemKey
  FROM AsyncStatusMonitor
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
CREATE VIEW [dbo].[vBoAtomPanelPurpose]
AS
SELECT AtomPanelPurposeRef.AtomPanelPurposeCode AS Code,AtomPanelPurposeRef.AtomPanelPurposeDesc AS Description,AtomPanelPurposeRef.AtomPanelPurposeName AS Name
  FROM AtomPanelPurposeRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoAutoPayInstruction]'))
    DROP VIEW [dbo].[vBoAutoPayInstruction]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoAutoPayInstruction]
AS
SELECT AutoPayInstruction.CancellationReason,AutoPayInstruction.CancelledOn,AutoPayInstruction.CreatedByUserKey,AutoPayInstruction.CreatedOn,AutoPayInstruction.CustomerId,AutoPayInstruction.EndDate,AutoPayInstruction.InstructionId,AutoPayInstruction.LinkedFromAutoPayInstructionId,AutoPayInstruction.Notes,AutoPayInstruction.PaymentMethodSummary,AutoPayInstruction.PaymentToken,AutoPayInstruction.ProcessingReference,AutoPayInstruction.SourceSystem,AutoPayInstruction.StartDate,AutoPayInstruction.Status,AutoPayInstruction.UpdatedByUserKey,AutoPayInstruction.UpdatedOn,AutoPayInstruction.PaymentMethodId,AutoPayInstruction.Appeal,AutoPayInstruction.AuthorizedPaymentAmount,AutoPayInstruction.Campaign,AutoPayInstruction.CollectionDay,AutoPayInstruction.Fund,AutoPayInstruction.IntervalTypeCode,AutoPayInstruction.PaymentTokenExpirationDate,AutoPayInstruction.ProductCode
  FROM AutoPayInstruction
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoAutoPayInstructionDetail]'))
    DROP VIEW [dbo].[vBoAutoPayInstructionDetail]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoAutoPayInstructionDetail]
AS
SELECT vAutoPayInstructionDetail.CancellationReason,vAutoPayInstructionDetail.CancelledOn,vAutoPayInstructionDetail.ID,vAutoPayInstructionDetail.PaymentMethodSummary,vAutoPayInstructionDetail.SourceSystem,vAutoPayInstructionDetail.Status,vAutoPayInstructionDetail.InstructionId,vAutoPayInstructionDetail.AuthorizedPaymentAmount,vAutoPayInstructionDetail.IntervalTypeName,vAutoPayInstructionDetail.TITLE
  FROM vAutoPayInstructionDetail
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoAutoPayInvoices]'))
    DROP VIEW [dbo].[vBoAutoPayInvoices]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoAutoPayInvoices]
AS
SELECT vAutoPayInvoices.Company,vAutoPayInvoices.Description,vAutoPayInvoices.CustomerID,vAutoPayInvoices.CustomerName,vAutoPayInvoices.InvoiceNumber,vAutoPayInvoices.PayerID,vAutoPayInvoices.PaymentAmount,vAutoPayInvoices.DueDate,vAutoPayInvoices.InvoiceType,vAutoPayInvoices.SourceSystem,vAutoPayInvoices.codeToken AS CodeToken
  FROM vAutoPayInvoices
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoAutoPayInvoicesDues]'))
    DROP VIEW [dbo].[vBoAutoPayInvoicesDues]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoAutoPayInvoicesDues]
AS
SELECT vAutoPayInvoicesDues.code_Token AS Code_Token,vAutoPayInvoicesDues.Company,vAutoPayInvoicesDues.Description,vAutoPayInvoicesDues.DUE_DATE,vAutoPayInvoicesDues.InvoiceNumber,vAutoPayInvoicesDues.MemberID,vAutoPayInvoicesDues.MemberName,vAutoPayInvoicesDues.PayerID,vAutoPayInvoicesDues.PaymentAmount
  FROM vAutoPayInvoicesDues
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoAutoPayInvoicesFundraising]'))
    DROP VIEW [dbo].[vBoAutoPayInvoicesFundraising]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoAutoPayInvoicesFundraising]
AS
SELECT vAutoPayInvoicesFundraising.code_Token AS Code_Token,vAutoPayInvoicesFundraising.Company,vAutoPayInvoicesFundraising.Description,vAutoPayInvoicesFundraising.DonorID,vAutoPayInvoicesFundraising.DUE_DATE,vAutoPayInvoicesFundraising.FullName,vAutoPayInvoicesFundraising.InvoiceNumber,vAutoPayInvoicesFundraising.PaymentAmount,vAutoPayInvoicesFundraising.InstructionId
  FROM vAutoPayInvoicesFundraising
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoAutoPayPaymentsDue]'))
    DROP VIEW [dbo].[vBoAutoPayPaymentsDue]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoAutoPayPaymentsDue]
AS
SELECT vAutoPayPaymentsDue.AccountingMethod,vAutoPayPaymentsDue.Balance,vAutoPayPaymentsDue.BillToPartyId,vAutoPayPaymentsDue.CustomerId,vAutoPayPaymentsDue.Description,vAutoPayPaymentsDue.DUE_DATE,vAutoPayPaymentsDue.InvoiceDate,vAutoPayPaymentsDue.InvoiceId,vAutoPayPaymentsDue.InvoiceType,vAutoPayPaymentsDue.PaymentToken,vAutoPayPaymentsDue.SoldToPartyId,vAutoPayPaymentsDue.SourceSystem
  FROM vAutoPayPaymentsDue
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
CREATE VIEW [dbo].[vBoBadAddressReasonRef]
AS
SELECT BadAddressReasonRef.BadAddressReasonKey,BadAddressReasonRef.BadAddressReasonDesc AS Description,BadAddressReasonRef.ErrorCode,BadAddressReasonRef.IsSystem,BadAddressReasonRef.ErrorMessage,BadAddressReasonRef.IsPhysical
  FROM BadAddressReasonRef
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
CREATE VIEW [dbo].[vBoBatchLineStatusRef]
AS
SELECT BatchLineStatusRef.BatchLineStatusCode,BatchLineStatusRef.BatchLineStatusDesc
  FROM BatchLineStatusRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoBatchSummary]'))
    DROP VIEW [dbo].[vBoBatchSummary]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoBatchSummary]
AS
SELECT vBatch.ACTUAL_AMOUNT,vBatch.BATCH_NUMBER,vBatch.CONTROL_AMOUNT,vBatch.CREATED_BY,vBatch.DESCRIPTION,vBatch.Status,vBatch.TRANSACTION_COUNT,vBatch.DATE_CREATED,vBatch.BATCH_DATE,vBatch.WEB_BATCH,vBatch.CONTROL_COUNT
  FROM vBatch
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoBillingCycles]'))
    DROP VIEW [dbo].[vBoBillingCycles]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoBillingCycles]
AS
SELECT DuesCycles.ACCOUNTING_METHOD,DuesCycles.BILL_CYCLE,DuesCycles.CATEGORIES,DuesCycles.CYCLE_NAME,DuesCycles.FIRST_REMINDER_ADDRESS,DuesCycles.FIRST_REMINDER_END,DuesCycles.FIRST_REMINDER_START,DuesCycles.FIRST_REMINDER_TEXT,DuesCycles.FIRST_REMINDER_TITLE,DuesCycles.FORCE_ADD_OTHER,DuesCycles.INCLUDE_ALL_CHAPTERS,DuesCycles.INCLUDE_ALL_MEM_ITEMS,DuesCycles.INCLUDE_ALL_SECTIONS,DuesCycles.INCLUDE_INACTIVE_MEMBERS,DuesCycles.INCLUDE_INACTIVE_SECTIONS,DuesCycles.INCLUDE_SUSPENDED_MEMBERS,DuesCycles.INCLUDE_ZERO_BALANCE,DuesCycles.INITIAL_BILL_ADDRESS,DuesCycles.INITIAL_BILL_END,DuesCycles.INITIAL_BILL_START,DuesCycles.INITIAL_BILL_TEXT,DuesCycles.INITIAL_BILL_TITLE,DuesCycles.IS_FOR_JOIN,DuesCycles.IS_FOR_RENEW,DuesCycles.MAJOR_SORT,DuesCycles.MASS_BILL_ACCT_METH,DuesCycles.MEM_TYPES,DuesCycles.MEMBER_SORT,DuesCycles.PRODUCT_CODES,DuesCycles.PRODUCT_SORT,DuesCycles.REPORT_FORM,DuesCycles.SECOND_REMINDER_ADDRESS,DuesCycles.SECOND_REMINDER_END,DuesCycles.SECOND_REMINDER_START,DuesCycles.SECOND_REMINDER_TEXT,DuesCycles.SECOND_REMINDER_TITLE,DuesCycles.UPDATE_COMP_AT_PAY
  FROM DuesCycles
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
CREATE VIEW [dbo].[vBoCampaign]
AS
SELECT CampaignMain.Description,CampaignMain.EndDate,CampaignMain.Name,CampaignMain.PrimaryOwnerUserKey,CampaignMain.StartDate,CampaignMain.UpdatedByUserKey,CampaignMain.UpdatedOn,CampaignMain.CampaignStatusCode,CampaignMain.PredictedResponseRate,CampaignMain.TotalRevenue,CampaignMain.CostCollection,CampaignMain.TargetRevenue,CampaignMain.LegacyCampaignCode,CampaignMain.AccessKey,CampaignMain.CampaignKey,CampaignMain.CreatedByUserKey,CampaignMain.CreatedOn,CampaignMain.SystemEntityKey,CampaignMain.ActualCost,CampaignMain.EstimatedCost,CampaignMain.ExtendedCost,CampaignMain.FirstResponseDate,CampaignMain.HighResponseAmount,CampaignMain.LastResponseDate,CampaignMain.LowResponseAmount,CampaignMain.OverheadCost,CampaignMain.TotalNegativeResponse,CampaignMain.TotalPositiveResponse,CampaignMain.TotalSolicited,CampaignMain.CampaignTypeCode
  FROM CampaignMain
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
CREATE VIEW [dbo].[vBoCampaignParticipation]
AS
SELECT CampaignParticipation.CampaignKey,CampaignParticipation.CampaignParticipationKey,CampaignParticipation.CreatedByUserKey,CampaignParticipation.CreatedOn,CampaignParticipation.RespondentUserKey,CampaignParticipation.UpdatedByUserKey,CampaignParticipation.UpdatedOn,CampaignParticipation.OptedOutOn,CampaignParticipation.OptOutSourceCodeKey,CampaignParticipation.ResponseTypeCode
  FROM CampaignParticipation
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
CREATE VIEW [dbo].[vBoCampaignStatusRef]
AS
SELECT CampaignStatusRef.CampaignStatusCode,CampaignStatusRef.CampaignStatusDesc,CampaignStatusRef.CampaignStatusName
  FROM CampaignStatusRef
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
CREATE VIEW [dbo].[vBoCampaignTypeRef]
AS
SELECT CampaignTypeRef.CampaignTypeCode,CampaignTypeRef.CampaignTypeDesc,CampaignTypeRef.CampaignTypeName
  FROM CampaignTypeRef
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
CREATE VIEW [dbo].[vBoCertificationModule]
AS
SELECT CertificationModule.CertificationModuleDate AS Date,CertificationModule.CertificationModuleDesc AS Description,CertificationModule.CertificationModuleKey,CertificationModule.CertificationModuleLocation AS Location,CertificationModule.CertificationModuleName AS Name,CertificationModule.CertificationModuleStatusCode AS StatusCode,CertificationModule.CreatedByUserKey,CertificationModule.CreatedOn,CertificationModule.NumberOfUnits,CertificationModule.RequiresApprovalFlag AS RequiresApproval,CertificationModule.RequiresGradeFlag AS RequiresGrade,CertificationModule.UpdatedByUserKey,CertificationModule.UpdatedOn,CertificationModule.CertificationStaffOnlyFlag AS CertificationStaffOnly,CertificationModule.CertificationModuleCode AS Code,CertificationModule.MarkedForDeleteOn,CertificationModule.FileAttachment,CertificationModule.AttachmentInstructions,CertificationModule.EnrolleeCanRecordFlag AS EnrolleeCanRecord
  FROM CertificationModule
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
CREATE VIEW [dbo].[vBoCertificationModuleGrade]
AS
SELECT CertificationModuleGrade.CertificationModuleGradeKey,CertificationModuleGrade.CertificationModuleKey,CertificationModuleGrade.CreatedByUserKey,CertificationModuleGrade.CreatedOn,CertificationModuleGrade.GradeKey,CertificationModuleGrade.PassFlag AS Pass,CertificationModuleGrade.UpdatedByUserKey,CertificationModuleGrade.UpdatedOn
  FROM CertificationModuleGrade
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
CREATE VIEW [dbo].[vBoCertificationModuleProduct]
AS
SELECT CertificationModuleProduct.CertificationModuleKey,CertificationModuleProduct.CertificationModuleProductKey,CertificationModuleProduct.CreatedByUserKey,CertificationModuleProduct.CreatedOn,CertificationModuleProduct.ProductCode,CertificationModuleProduct.UpdatedByUserKey,CertificationModuleProduct.UpdatedOn
  FROM CertificationModuleProduct
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
CREATE VIEW [dbo].[vBoCertificationModuleRegistration]
AS
SELECT CertificationModuleRegistration.CertificationModuleKey,CertificationModuleRegistration.CertificationModuleRegistrationKey,CertificationModuleRegistration.CertificationProgramRegistrationKey,CertificationModuleRegistration.CustomerExperienceKey,CertificationModuleRegistration.RegistrationDate,CertificationModuleRegistration.RegistrationStatusCode,CertificationModuleRegistration.EarnedUnits,CertificationModuleRegistration.FileAttachmentDocumentKey,CertificationModuleRegistration.AvailableUnits
  FROM CertificationModuleRegistration
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
CREATE VIEW [dbo].[vBoCertificationModuleStatus]
AS
SELECT CertificationModuleStatusRef.CertificationModuleStatusCode,CertificationModuleStatusRef.CertificationModuleStatusName
  FROM CertificationModuleStatusRef
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
CREATE VIEW [dbo].[vBoCertificationProgram]
AS
SELECT CertificationProgram.AddDesignationFlag,CertificationProgram.AutoEnrollFlag,CertificationProgram.CertificationProgramDescription,CertificationProgram.CertificationProgramStatusCode,CertificationProgram.CreatedByUserKey,CertificationProgram.CreatedOn,CertificationProgram.MinimumValue,CertificationProgram.RequiresApprovalFlag,CertificationProgram.UpdatedByUserKey,CertificationProgram.UpdatedOn,CertificationProgram.CertificationProgramGroupKey AS CertificationProgramGroup,CertificationProgram.DeadlinePeriodMultiplier,CertificationProgram.DeadlinePeriodTimeUnit,CertificationProgram.FormatCertificationNumber,CertificationProgram.GracePeriodMultiplier,CertificationProgram.GracePeriodTimeUnit,CertificationProgram.IsMultipleIterationFlag,CertificationProgram.MarkedForDeleteOn,CertificationProgram.PreRequiredProgramKey AS PreRequiredProgram,CertificationProgram.ProcessBlueprint,CertificationProgram.RequiredNumberOfUnits,CertificationProgram.StagesInOrder,CertificationProgram.MaximumValue,CertificationProgram.LastCertificationNumber,CertificationProgram.Designation,CertificationProgram.CertificationProgramName,CertificationProgram.CertificationProgramKey,CertificationProgram.ExperienceUnitKey
  FROM CertificationProgram
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
CREATE VIEW [dbo].[vBoCertificationProgramCertificationModule]
AS
SELECT CertificationProgramCertificationModule.CertificationModuleKey,CertificationProgramCertificationModule.CertificationProgramCertificationModuleKey,CertificationProgramCertificationModule.CertificationProgramKey
  FROM CertificationProgramCertificationModule
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
CREATE VIEW [dbo].[vBoCertificationProgramProduct]
AS
SELECT CertificationProgramProduct.CertificationProgramKey,CertificationProgramProduct.CertificationProgramProductKey,CertificationProgramProduct.CreatedByUserKey,CertificationProgramProduct.CreatedOn,CertificationProgramProduct.ProductCode,CertificationProgramProduct.UpdatedByUserKey,CertificationProgramProduct.UpdatedOn
  FROM CertificationProgramProduct
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
CREATE VIEW [dbo].[vBoCertificationProgramRegistration]
AS
SELECT CertificationProgramRegistration.ActionManifest,CertificationProgramRegistration.CertificationNumber,CertificationProgramRegistration.CertificationProgramKey,CertificationProgramRegistration.CertificationProgramRegistrationKey,CertificationProgramRegistration.CreatedByUserKey,CertificationProgramRegistration.CreatedOn,CertificationProgramRegistration.CurrentStageName,CertificationProgramRegistration.EarnedUnits,CertificationProgramRegistration.ExpirationDate,CertificationProgramRegistration.FormattedCertificationNumber,CertificationProgramRegistration.GracePeriodDate,CertificationProgramRegistration.RegistrationDate,CertificationProgramRegistration.RegistrationStatusCode,CertificationProgramRegistration.UpdatedByUserKey,CertificationProgramRegistration.UpdatedOn,CertificationProgramRegistration.ContactKey
  FROM CertificationProgramRegistration
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
CREATE VIEW [dbo].[vBoCertificationProgramRegistrationCertificationModule]
AS
SELECT CertificationProgramRegistrationCertificationModule.CertificationModuleKey,CertificationProgramRegistrationCertificationModule.CertificationProgramRegistrationCertificationModuleKey,CertificationProgramRegistrationCertificationModule.CertificationProgramRegistrationKey
  FROM CertificationProgramRegistrationCertificationModule
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
CREATE VIEW [dbo].[vBoChangeLog]
AS
SELECT ChangeLog.ActionType,ChangeLog.ChangeLogKey,ChangeLog.CreatedByUserKey,ChangeLog.CreatedOn,ChangeLog.Description,ChangeLog.ObjectKey,ChangeLog.ObjectTypeName,ChangeLog.OrganizationKey
  FROM ChangeLog
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
CREATE VIEW [dbo].[vBoChangeLogReport]
AS
SELECT vChangeLogReport.ActionType,vChangeLogReport.ChangeLogKey,vChangeLogReport.ContactMaster,vChangeLogReport.CreatedDate,vChangeLogReport.CurrentDescription,vChangeLogReport.CurrentValue,vChangeLogReport.Description,vChangeLogReport.ObjectTypeName,vChangeLogReport.OriginalDescription,vChangeLogReport.OriginalValue,vChangeLogReport.PropertyName,vChangeLogReport.UserId,vChangeLogReport.UserKey
  FROM vChangeLogReport
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
CREATE VIEW [dbo].[vBoChangeProperty]
AS
SELECT ChangeProperty.ChangeLogKey,ChangeProperty.CurrentDescription,ChangeProperty.CurrentValue,ChangeProperty.OriginalDescription,ChangeProperty.OriginalValue,ChangeProperty.PropertyName
  FROM ChangeProperty
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
CREATE VIEW [dbo].[vBoCheckCategoryRef]
AS
SELECT CheckCategoryRef.CheckCategoryCode,CheckCategoryRef.CheckCategoryDesc
  FROM CheckCategoryRef
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
CREATE VIEW [dbo].[vBoCommissionRateTypeRef]
AS
SELECT CommissionRateTypeRef.CommissionRateTypeCode,CommissionRateTypeRef.CommissionRateTypeDesc
  FROM CommissionRateTypeRef
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
CREATE VIEW [dbo].[vBoCommittee]
AS
SELECT Product.PROD_TYPE,Product.DESCRIPTION,Product.PRODUCT_CODE,Product.TITLE
  FROM Product
 WHERE PROD_TYPE = 'COMMITTEE' AND WEB_OPTION = 1
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCommunicationMessageTypeRef]'))
    DROP VIEW [dbo].[vBoCommunicationMessageTypeRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCommunicationMessageTypeRef]
AS
SELECT CommunicationMessageTypeRef.CommunicationMessageTypeCode,CommunicationMessageTypeRef.CommunicationMessageTypeName
  FROM CommunicationMessageTypeRef
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
CREATE VIEW [dbo].[vBoCommunicationReasonRef]
AS
SELECT CommunicationReasonRef.CommunicationReasonDesc AS DisplayDescription,CommunicationReasonRef.CommunicationReasonKey,CommunicationReasonRef.Formula,CommunicationReasonRef.IsDefaultType,CommunicationReasonRef.CannotOptOutFlag,CommunicationReasonRef.IsSolicitation,CommunicationReasonRef.DefaultOptOutFlag,CommunicationReasonRef.Status,CommunicationReasonRef.IsSystem,CommunicationReasonRef.CommunicationReasonName AS Description
  FROM CommunicationReasonRef
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
CREATE VIEW [dbo].[vBoCompanyNaicSic]
AS
SELECT CompanyNaicsSic.ContactKey,CompanyNaicsSic.IsSic,CompanyNaicsSic.NaicsSicCode
  FROM CompanyNaicsSic
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
CREATE VIEW [dbo].[vBoComparisonRef]
AS
SELECT ComparisonRef.ComparisonCode,ComparisonRef.ComparisonDesc
  FROM ComparisonRef
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
CREATE VIEW [dbo].[vBoComponentRegistry]
AS
SELECT ComponentRegistry.ComponentKey,ComponentRegistry.Name,ComponentRegistry.InterfaceName,ComponentRegistry.AssemblyName,ComponentRegistry.ComponentEditLink,ComponentRegistry.ComponentExecuteLink,ComponentRegistry.ComponentNewLink,ComponentRegistry.ComponentSummaryContentKey,ComponentRegistry.ConfigureWebUserControl,ComponentRegistry.ConfigureWindowsControl,ComponentRegistry.DeploymentPackageCode,ComponentRegistry.Description,ComponentRegistry.IsBusinessItem,ComponentRegistry.IsTyped,ComponentRegistry.MarkedForDeleteOn,ComponentRegistry.TypeName
  FROM ComponentRegistry
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
CREATE VIEW [dbo].[vBoContact]
AS
SELECT ContactMain.ContactStatusCode,ContactMain.FullName,ContactMain.NoSolicitationFlag AS NoSolicitation,ContactMain.SortName,ContactMain.SyncContactID,ContactMain.TaxIDNumber,ContactMain.UpdatedByUserKey,ContactMain.UpdatedOn,ContactMain.ID,ContactMain.PreferredAddressCategoryCode,ContactMain.IsSortNameOverridden,ContactMain.IsInstitute,ContactMain.AccessKey,ContactMain.ContactKey,ContactMain.CreatedByUserKey,ContactMain.CreatedOn,ContactMain.MajorKey,ContactMain.PrimaryMembershipGroupKey,ContactMain.TextOnlyEmailFlag,ContactMain.ContactTypeKey,ContactMain.IsIDEditable,ContactMain.OptOutFlag AS OptOut
  FROM ContactMain
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
CREATE VIEW [dbo].[vBoContactAddress]
AS
SELECT ContactAddress.AddressKey,ContactAddress.ContactAddressKey,ContactAddress.ContactKey,ContactAddress.AddressTypeKey,ContactAddress.IsOptOut,ContactAddress.IsPreferredOverall,ContactAddress.NoSolicitationFlag AS NoSolicitation,ContactAddress.AddressCategoryCode,ContactAddress.IsPreferredForCategory
  FROM ContactAddress
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
CREATE VIEW [dbo].[vBoContactBiography]
AS
SELECT ContactBiography.ContactKey,ContactBiography.InBusinessSinceYear,ContactBiography.IsPublic,ContactBiography.Locations,ContactBiography.Summary,ContactBiography.Text,ContactBiography.UpdatedByUserKey,ContactBiography.UpdatedOn,ContactBiography.BiographyReferences
  FROM ContactBiography
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
CREATE VIEW [dbo].[vBoContactCommunicationReasonPreferences]
AS
SELECT ContactCommunicationReasonPreferences.CommunicationReasonKey,ContactCommunicationReasonPreferences.ContactCommunicationReasonPreferencesKey,ContactCommunicationReasonPreferences.ContactKey,ContactCommunicationReasonPreferences.NoCommunicationByEmailFlag AS NoCommunicationByEmail,ContactCommunicationReasonPreferences.NoCommunicationByFaxFlag AS NoCommunicationByFax,ContactCommunicationReasonPreferences.NoCommunicationByMailFlag AS NoCommunicationByMail,ContactCommunicationReasonPreferences.NoCommunicationByPhoneFlag AS NoCommunicationByPhone,ContactCommunicationReasonPreferences.PreferredAddressCategoryCode,ContactCommunicationReasonPreferences.OptInFlag AS OptIn,ContactCommunicationReasonPreferences.CreatedByUserKey,ContactCommunicationReasonPreferences.CreatedOn,ContactCommunicationReasonPreferences.UpdatedByUserKey,ContactCommunicationReasonPreferences.UpdatedOn
  FROM ContactCommunicationReasonPreferences
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
CREATE VIEW [dbo].[vBoContactDetailReport]
AS
SELECT vContactDetailReport.BirthDate,vContactDetailReport.ContactId,vContactDetailReport.ContactKey,vContactDetailReport.ContactName,vContactDetailReport.ContactSortName,vContactDetailReport.ContactStatus,vContactDetailReport.Designation,vContactDetailReport.FirstName,vContactDetailReport.Gender,vContactDetailReport.GroupKey,vContactDetailReport.GroupMemberBranchName,vContactDetailReport.GroupMemberDropDate,vContactDetailReport.GroupMemberEffectiveDate,vContactDetailReport.GroupMemberExpDate,vContactDetailReport.GroupMemberJoinDate,vContactDetailReport.GroupMemberStatusCode,vContactDetailReport.GroupMemberTypeSpecificData,vContactDetailReport.GroupName,vContactDetailReport.GroupRole,vContactDetailReport.GroupType,vContactDetailReport.Informal,vContactDetailReport.IsActiveGroupMember,vContactDetailReport.IsInstitute,vContactDetailReport.LastName,vContactDetailReport.MiddleName,vContactDetailReport.NoSolicitationFlag,vContactDetailReport.PreferredAddressCategoryCode,vContactDetailReport.PrefixLong,vContactDetailReport.PrefixShort,vContactDetailReport.PrimaryInstituteContactKey,vContactDetailReport.PrimaryInstituteName,vContactDetailReport.PrimaryInstituteTitle,vContactDetailReport.PrimaryMembershipGroupKey,vContactDetailReport.SuffixLong,vContactDetailReport.SuffixShort,vContactDetailReport.TaxIDNumber,vContactDetailReport.ContactType
  FROM vContactDetailReport
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
CREATE VIEW [dbo].[vBoContactDuplicateCheckFormula]
AS
SELECT ContactDuplicateCheckFormula.ContactDuplicateCheckFormulaKey,ContactDuplicateCheckFormula.CreatedByUserKey,ContactDuplicateCheckFormula.CreatedOn,ContactDuplicateCheckFormula.FormulaName,ContactDuplicateCheckFormula.FormulaText,ContactDuplicateCheckFormula.FormulaType,ContactDuplicateCheckFormula.MatchPercent,ContactDuplicateCheckFormula.SystemEntityKey,ContactDuplicateCheckFormula.UpdatedByUserKey,ContactDuplicateCheckFormula.UpdatedOn
  FROM ContactDuplicateCheckFormula
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
CREATE VIEW [dbo].[vBoContactDuplicateCheckFormulaTypeRef]
AS
SELECT ContactDuplicateCheckFormulaTypeRef.ContactDuplicateCheckFormulaTypeCode,ContactDuplicateCheckFormulaTypeRef.ContactDuplicateCheckFormulaTypeDesc,ContactDuplicateCheckFormulaTypeRef.ContactDuplicateCheckFormulaTypeName
  FROM ContactDuplicateCheckFormulaTypeRef
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
CREATE VIEW [dbo].[vBoContactEducation]
AS
SELECT ContactEducation.ContactEducationKey AS EducationKey,ContactEducation.ContactKey,ContactEducation.School,ContactEducation.UpdatedByUserKey,ContactEducation.UpdatedOn,ContactEducation.EducationLevelCode,ContactEducation.EndYear,ContactEducation.StartYear,ContactEducation.Specialty
  FROM ContactEducation
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
CREATE VIEW [dbo].[vBoContactFundraising]
AS
SELECT ContactFundraising.ContactKey,ContactFundraising.SoftCreditGroupKey,ContactFundraising.SolicitorGroupKey,ContactFundraising.ReceiptPreferenceCode
  FROM ContactFundraising
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
CREATE VIEW [dbo].[vBoContactLog]
AS
SELECT ContactLog.ContactLogKey,ContactLog.CreatedOn,ContactLog.Description,ContactLog.OutputOn,ContactLog.SourceCodeCode,ContactLog.CreatedByUserKey,ContactLog.OrganizationKey,ContactLog.ContactKey
  FROM ContactLog
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
CREATE VIEW [dbo].[vBoContactOffering]
AS
SELECT ContactOffering.ContactKey,ContactOffering.ContactOfferingKey
  FROM ContactOffering
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
CREATE VIEW [dbo].[vBoContactOfferingRef]
AS
SELECT ContactOfferingRef.ContactOfferingDesc AS Description,ContactOfferingRef.ContactOfferingKey
  FROM ContactOfferingRef
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
CREATE VIEW [dbo].[vBoContactPicture]
AS
SELECT ContactPicture.ContactKey,ContactPicture.ContactPictureKey,ContactPicture.Description,ContactPicture.PicturePurposeKey,ContactPicture.UpdatedByUserKey,ContactPicture.UpdatedOn,ContactPicture.Picture,ContactPicture.MimeType,ContactPicture.IsPreferred
  FROM ContactPicture
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
CREATE VIEW [dbo].[vBoContactReport]
AS
SELECT vContactReport.ContactId,vContactReport.ContactKey,vContactReport.ContactName,vContactReport.ContactSortName,vContactReport.ContactStatus,vContactReport.IsInstitute,vContactReport.NoSolicitationFlag,vContactReport.PreferredAddressCategoryCode,vContactReport.PrimaryMembershipGroupKey,vContactReport.TaxIDNumber,vContactReport.ContactTypeKey
  FROM vContactReport
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
CREATE VIEW [dbo].[vBoContactSalutation]
AS
SELECT ContactSalutation.IsOverridden,ContactSalutation.SalutationText,ContactSalutation.ContactKey,ContactSalutation.SalutationKey,ContactSalutation.ContactSalutationKey,ContactSalutation.IsDeletable
  FROM ContactSalutation
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
CREATE VIEW [dbo].[vBoContactSkill]
AS
SELECT ContactSkill.ContactKey,ContactSkill.ContactSkillKey
  FROM ContactSkill
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
CREATE VIEW [dbo].[vBoContactSkillRef]
AS
SELECT ContactSkillRef.ContactSkillDesc AS Description,ContactSkillRef.ContactSkillKey
  FROM ContactSkillRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoContactSocialNetwork]'))
    DROP VIEW [dbo].[vBoContactSocialNetwork]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoContactSocialNetwork]
AS
SELECT ContactSocialNetwork.ContactKey,ContactSocialNetwork.ContactSocialNetworkKey,ContactSocialNetwork.SocialNetworkKey,ContactSocialNetwork.SocialNetworkUserId,ContactSocialNetwork.SocialNetworkUserName,ContactSocialNetwork.SocialNetworkToken,ContactSocialNetwork.UseSocialNetworkProfilePhoto
  FROM ContactSocialNetwork
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
CREATE VIEW [dbo].[vBoContactStatusRef]
AS
SELECT ContactStatusRef.ContactStatusCode AS Code,ContactStatusRef.ContactStatusDesc AS Description,ContactStatusRef.IsSystem
  FROM ContactStatusRef
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
CREATE VIEW [dbo].[vBoContactTypeRef]
AS
SELECT ContactTypeRef.ContactTypeDesc AS Description,ContactTypeRef.ContactTypeKey,ContactTypeRef.GroupTypeKey,ContactTypeRef.IsInstitute
  FROM ContactTypeRef
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
CREATE VIEW [dbo].[vBoContentChangeRequest]
AS
SELECT ContentChangeRequest.ContentChangeRequestKey,ContentChangeRequest.ContentDocumentVersionKey,ContentChangeRequest.ContentRequestStatusCode,ContentChangeRequest.AssignedByUserKey,ContentChangeRequest.AssignedToUserKey,ContentChangeRequest.RequestText,ContentChangeRequest.RequestDateTime,ContentChangeRequest.ReassignedToUserKey
  FROM ContentChangeRequest
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoContentFilter]'))
    DROP VIEW [dbo].[vBoContentFilter]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoContentFilter]
AS
SELECT ContentFilter.BooleanValue,ContentFilter.DateTimeValue,ContentFilter.DecimalValue,ContentFilter.DocumentVersionKey,ContentFilter.PropertyName,ContentFilter.StringValue
  FROM ContentFilter
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
CREATE VIEW [dbo].[vBoContentManagerAuthorityGroup]
AS
SELECT ContentManagerAuthorityGroup.GroupKey,ContentManagerAuthorityGroup.IsMasterAdmin
  FROM ContentManagerAuthorityGroup
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
CREATE VIEW [dbo].[vBoContentUserDefinedFieldValue]
AS
SELECT ContentUserDefinedFieldValue.ContentDocumentVersionKey,ContentUserDefinedFieldValue.UserDefinedFieldKey,ContentUserDefinedFieldValue.Value,ContentUserDefinedFieldValue.ValueText
  FROM ContentUserDefinedFieldValue
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
CREATE VIEW [dbo].[vBoContentWorkflow]
AS
SELECT ContentWorkflowParameters.ContentAuthorityGroupKey,ContentWorkflowParameters.DocumentVersionKey,ContentWorkflowParameters.ExpirationDate,ContentWorkflowParameters.NumberOfDaysBeforeExpiration,ContentWorkflowParameters.OwnerGroupMemberKey,ContentWorkflowParameters.PublishedVersion,ContentWorkflowParameters.RecycleAtExpiration
  FROM ContentWorkflowParameters
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
CREATE VIEW [dbo].[vBoCostMethodRef]
AS
SELECT CostMethodRef.CostMethodCode,CostMethodRef.CostMethodDesc,CostMethodRef.CostMethodName
  FROM CostMethodRef
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
CREATE VIEW [dbo].[vBoCostTier]
AS
SELECT CostTier.CostTierKey,CostTier.DateReceived,CostTier.ProductInventoryKey,CostTier.ProductKey,CostTier.QuantityOnHand,CostTier.QuantityReceived,CostTier.TotalCost,CostTier.UnitCost,CostTier.UomKey,CostTier.WarehouseKey,CostTier.OriginalReceiptKey,CostTier.CostMethodCode
  FROM CostTier
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
CREATE VIEW [dbo].[vBoCountryRef]
AS
SELECT CountryRef.ChapterGroupKey,CountryRef.CountryCode,CountryRef.CountryName,CountryRef.DefaultShippingMethod,CountryRef.IntraStateCode,CountryRef.IsHandModified,CountryRef.MailGroup,CountryRef.SyncCountryName,CountryRef.UpdatedByUserKey,CountryRef.UpdatedOn,CountryRef.VATCountryCode,CountryRef.AddressFormatKey,CountryRef.IsActive,CountryRef.ISO3DigitCode,CountryRef.CountryKey
  FROM CountryRef
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
CREATE VIEW [dbo].[vBoCreditTypeRef]
AS
SELECT CreditTypeRef.CreditTypeCode,CreditTypeRef.CreditTypeDesc
  FROM CreditTypeRef
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
CREATE VIEW [dbo].[vBoCsActivity]
AS
SELECT Activity.ACTION_CODES AS ActionCodes,Activity.ACTIVITY_TYPE AS ActivityType,Activity.AMOUNT AS Amount,Activity.CAMPAIGN_CODE AS CampaignCode,Activity.CATEGORY AS Category,Activity.CO_ID AS CompanyId,Activity.DESCRIPTION AS Description,Activity.EFFECTIVE_DATE AS EffectiveDate,Activity.GRACE_PERIOD AS GracePeriod,Activity.ID,Activity.MEMBER_TYPE AS MemberType,Activity.NEXT_INSTALL_DATE AS NextInstallDate,Activity.NOTE AS Note,Activity.NOTE_2 AS FollowUp,Activity.ORG_CODE AS EntityCode,Activity.OTHER_CODE AS OtherCode,Activity.PAY_METHOD AS PayMethod,Activity.PRODUCT_CODE AS ProductCode,Activity.QUANTITY AS Quantity,Activity.RECURRING_REQUEST AS RecurringRequest,Activity.SEQN AS Sequence,Activity.SOLICITOR_ID AS SolicitorId,Activity.SOURCE_CODE AS SourceCode,Activity.SOURCE_SYSTEM AS SourceSystem,Activity.STATUS_CODE AS StatusCode,Activity.TAXABLE_VALUE AS TaxableValue,Activity.THRU_DATE AS ThruDate,Activity.TICKLER_DATE AS ReminderDate,Activity.TRANSACTION_DATE AS TransactionDate,Activity.UF_1 AS UserField1,Activity.UF_2 AS UserField2,Activity.UF_3 AS UserField3,Activity.UF_4 AS UserField4,Activity.UF_5 AS UserField5,Activity.UF_6 AS UserField6,Activity.UF_7 AS UserField7,Activity.UNITS AS Units,Activity.ORIGINATING_TRANS_NUM,Activity.MEM_TRIB_CODE AS MemberTributeCode
  FROM Activity
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCsActivityBasic]'))
    DROP VIEW [dbo].[vBoCsActivityBasic]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCsActivityBasic]
AS
SELECT Activity.ACTION_CODES AS ActionCodes,Activity.ACTIVITY_TYPE AS ActivityType,Activity.AMOUNT AS Amount,Activity.CAMPAIGN_CODE AS CampaignCode,Activity.CATEGORY AS Category,Activity.CO_ID AS CompanyId,Activity.DESCRIPTION AS Description,Activity.EFFECTIVE_DATE AS EffectiveDate,Activity.GRACE_PERIOD AS GracePeriod,Activity.ID,Activity.MEMBER_TYPE AS MemberType,Activity.NEXT_INSTALL_DATE AS NextInstallDate,Activity.NOTE AS Note,Activity.NOTE_2 AS FollowUp,Activity.ORG_CODE AS OrgCode,Activity.OTHER_CODE AS OtherCode,Activity.PAY_METHOD AS PayMethod,Activity.PRODUCT_CODE AS ProductCode,Activity.QUANTITY AS Quantity,Activity.RECURRING_REQUEST AS RecurringRequest,Activity.SEQN AS Sequence,Activity.SOLICITOR_ID AS SolicitorId,Activity.SOURCE_CODE AS SourceCode,Activity.SOURCE_SYSTEM AS SourceSystem,Activity.STATUS_CODE AS StatusCode,Activity.TAXABLE_VALUE AS TaxableValue,Activity.THRU_DATE AS ThruDate,Activity.TICKLER_DATE AS ReminderDate,Activity.TRANSACTION_DATE AS TransactionDate,Activity.UF_1 AS UserField1,Activity.UF_2 AS UserField2,Activity.UF_3 AS UserField3,Activity.UF_4 AS UserField4,Activity.UF_5 AS UserField5,Activity.UF_6 AS UserField6,Activity.UF_7 AS UserField7,Activity.UNITS AS Units,Activity.ORIGINATING_TRANS_NUM AS OriginatingTransactionNumber,Activity.MEM_TRIB_CODE AS MemberTributeCode,Activity.BATCH_NUM AS BatchNumber
  FROM Activity
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
CREATE VIEW [dbo].[vBoCsActivityTypes]
AS
SELECT Product_Type.DESCRIPTION AS Description,Product_Type.PROD_TYPE AS ActivityType,Product_Type.PROFILE_SORT AS ProfileSortOrder,Product_Type.USER_EDIT AS UserEditable
  FROM Product_Type
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
CREATE VIEW [dbo].[vBoCsAddress]
AS
SELECT Name_Address.ADDRESS_1 AS Address1,Name_Address.ADDRESS_2 AS Address2,Name_Address.ADDRESS_3 AS Address3,Name_Address.ADDRESS_FORMAT AS AddressFormat,Name_Address.ADDRESS_NUM AS AddressNumber,Name_Address.BAD_ADDRESS AS BadAddress,Name_Address.BAR_CODE AS BarCode,Name_Address.CITY AS City,Name_Address.COUNTRY AS Country,Name_Address.COUNTY AS County,Name_Address.CRRT,Name_Address.EMAIL AS Email,Name_Address.FAX AS Fax,Name_Address.FULL_ADDRESS AS FullAddress,Name_Address.ID,Name_Address.LAST_UPDATED AS LastUpdated,Name_Address.LAST_VERIFIED AS LastVerified,Name_Address.MAIL_CODE AS MailCode,Name_Address.PHONE AS Phone,Name_Address.PREFERRED_BILL AS PreferredBill,Name_Address.PREFERRED_MAIL AS PreferredMail,Name_Address.PREFERRED_SHIP AS PreferredShip,Name_Address.PURPOSE AS AddressPurpose,Name_Address.STATE_HOUSE AS StateHouse,Name_Address.STATE_PROVINCE AS StateProvince,Name_Address.STATE_SENATE AS StateSenate,Name_Address.US_CONGRESS AS UsCongress,Name_Address.ZIP AS Zip
  FROM Name_Address
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
CREATE VIEW [dbo].[vBoCsAppeal]
AS
SELECT Appeal.APPEAL_CODE,Appeal.APPEAL_TYPE,Appeal.BEGINS_DATE,Appeal.CAMPAIGN_CODE,Appeal.DESCRIPTION,Appeal.ENDS_DATE,Appeal.FUND,Appeal.GOAL,Appeal.IS_PERPETUAL,Appeal.QUANTITY_DROPPED,Appeal.TIME_STAMP,Appeal.TITLE
  FROM Appeal
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCsAsiNrdsAssociation]'))
    DROP VIEW [dbo].[vBoCsAsiNrdsAssociation]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCsAsiNrdsAssociation]
AS
SELECT AsiNrdsAssociation.AssociationId,AsiNrdsAssociation.AssociationType,AsiNrdsAssociation.CLPresidentElectId,AsiNrdsAssociation.CLPresidentId,AsiNrdsAssociation.CLSecretaryId,AsiNrdsAssociation.CLTreasurerId,AsiNrdsAssociation.ElectionMonth,AsiNrdsAssociation.Email,AsiNrdsAssociation.EOFaxAreaCode,AsiNrdsAssociation.EOFaxNumber,AsiNrdsAssociation.EOFullName,AsiNrdsAssociation.ExecutiveOfficerId,AsiNrdsAssociation.FaxAreaCode,AsiNrdsAssociation.FaxNumber,AsiNrdsAssociation.FLPresidentElectId,AsiNrdsAssociation.FLPresidentId,AsiNrdsAssociation.FLSecretaryId,AsiNrdsAssociation.FLTreasurerId,AsiNrdsAssociation.ID,AsiNrdsAssociation.LastCertificationDate,AsiNrdsAssociation.MailAddressCity,AsiNrdsAssociation.MailAddressState,AsiNrdsAssociation.MailAddressStreet1,AsiNrdsAssociation.MailAddressStreet2,AsiNrdsAssociation.MailAddressZip,AsiNrdsAssociation.MailAddressZip6,AsiNrdsAssociation.NARTimestamp,AsiNrdsAssociation.PhoneAreaCode,AsiNrdsAssociation.PhoneNumber,AsiNrdsAssociation.PLPresidentElectId,AsiNrdsAssociation.PLPresidentId,AsiNrdsAssociation.PLSecretaryId,AsiNrdsAssociation.PLTreasurerId,AsiNrdsAssociation.PointOfEntry,AsiNrdsAssociation.PrimaryStateCode,AsiNrdsAssociation.Status,AsiNrdsAssociation.StatusChangedDate,AsiNrdsAssociation.StreetAddressCity,AsiNrdsAssociation.StreetAddressState,AsiNrdsAssociation.StreetAddressStreet1,AsiNrdsAssociation.StreetAddressStreet2,AsiNrdsAssociation.StreetAddressZip,AsiNrdsAssociation.StreetAddressZip6,AsiNrdsAssociation.TIME_STAMP,AsiNrdsAssociation.Webpage,AsiNrdsAssociation.SecondaryStateCode1,AsiNrdsAssociation.SecondaryStateCode2,AsiNrdsAssociation.SecondaryStateCode3,AsiNrdsAssociation.AssociationName
  FROM AsiNrdsAssociation
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCsAsiNrdsMember]'))
    DROP VIEW [dbo].[vBoCsAsiNrdsMember]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCsAsiNrdsMember]
AS
SELECT AsiNrdsMember.ArbitrationEthicsPending,AsiNrdsMember.AssociationId,AsiNrdsMember.BirthDate,AsiNrdsMember.CellPhoneAreaCode,AsiNrdsMember.CellPhoneNumber,AsiNrdsMember.DesignatedRealtor,AsiNrdsMember.DuesWaivedLocalFlag,AsiNrdsMember.DuesWaivedNationalFlag,AsiNrdsMember.DuesWaivedStateFlag,AsiNrdsMember.Email,AsiNrdsMember.FirstName,AsiNrdsMember.Gender,AsiNrdsMember.Generation,AsiNrdsMember.HomeAddressCity,AsiNrdsMember.HomeAddressState,AsiNrdsMember.HomeAddressStreet1,AsiNrdsMember.HomeAddressStreet2,AsiNrdsMember.HomeAddressZip,AsiNrdsMember.HomeAddressZip6,AsiNrdsMember.HomePhoneArea,AsiNrdsMember.HomePhoneNumber,AsiNrdsMember.ID,AsiNrdsMember.JoinedDate,AsiNrdsMember.JunkMailFlag,AsiNrdsMember.LastName,AsiNrdsMember.LocalJoinDate,AsiNrdsMember.MailAddressCity,AsiNrdsMember.MailAddressState,AsiNrdsMember.MailAddressStreet1,AsiNrdsMember.MailAddressStreet2,AsiNrdsMember.MailAddressZip,AsiNrdsMember.MailAddressZip6,AsiNrdsMember.MemberId,AsiNrdsMember.MemberType,AsiNrdsMember.MiddleName,AsiNrdsMember.MlsAssociationId,AsiNrdsMember.MlsId,AsiNrdsMember.NARTimestamp,AsiNrdsMember.NationalDuesPaidDate,AsiNrdsMember.Nickname,AsiNrdsMember.NrdsInsertDate,AsiNrdsMember.OccupationName,AsiNrdsMember.OfficeId,AsiNrdsMember.OfficeVoiceExtension,AsiNrdsMember.OnlineStatus,AsiNrdsMember.OnlineStatusDate,AsiNrdsMember.OnRosterFlag,AsiNrdsMember.OrientationDate,AsiNrdsMember.PagerAreaCode,AsiNrdsMember.PagerNumber,AsiNrdsMember.PersonalFaxAreaCode,AsiNrdsMember.PersonalFaxNumber,AsiNrdsMember.PointOfEntry,AsiNrdsMember.PreferredFax,AsiNrdsMember.PreferredMail,AsiNrdsMember.PreferredPhone,AsiNrdsMember.PreferredPublication,AsiNrdsMember.PreviousNonmemberFlag,AsiNrdsMember.PrimaryFieldOfBusiness,AsiNrdsMember.PrimaryIndicator,AsiNrdsMember.PrimaryStateAssociationId,AsiNrdsMember.ReinstatementCode,AsiNrdsMember.ReinstatementDate,AsiNrdsMember.RELicense,AsiNrdsMember.Salutation,AsiNrdsMember.SecondaryFieldOfBusiness1,AsiNrdsMember.SecondaryFieldOfBusiness2,AsiNrdsMember.SecondaryFieldOfBusiness3,AsiNrdsMember.Ssn,AsiNrdsMember.StateDuesPaidDate,AsiNrdsMember.Status,AsiNrdsMember.StatusDate,AsiNrdsMember.StopEmailFlag,AsiNrdsMember.StopFaxFlag,AsiNrdsMember.StopMailFlag,AsiNrdsMember.Subclass,AsiNrdsMember.TIME_STAMP,AsiNrdsMember.Title,AsiNrdsMember.WebPage
  FROM AsiNrdsMember
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCsAsiNrdsMemberDemographic]'))
    DROP VIEW [dbo].[vBoCsAsiNrdsMemberDemographic]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCsAsiNrdsMemberDemographic]
AS
SELECT AsiNrdsMemberDemographic.Amount,AsiNrdsMemberDemographic.AssociationId,AsiNrdsMemberDemographic.Category,AsiNrdsMemberDemographic.Comment,AsiNrdsMemberDemographic.GroupCode,AsiNrdsMemberDemographic.ID,AsiNrdsMemberDemographic.MemberId,AsiNrdsMemberDemographic.NARTimestamp,AsiNrdsMemberDemographic.Number,AsiNrdsMemberDemographic.PaymentCode,AsiNrdsMemberDemographic.PointOfEntry,AsiNrdsMemberDemographic.SEQN,AsiNrdsMemberDemographic.Status,AsiNrdsMemberDemographic.StatusDate,AsiNrdsMemberDemographic.TIME_STAMP
  FROM AsiNrdsMemberDemographic
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCsAsiNrdsMemberDesignation]'))
    DROP VIEW [dbo].[vBoCsAsiNrdsMemberDesignation]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCsAsiNrdsMemberDesignation]
AS
SELECT AsiNrdsMemberDesignation.Abr,AsiNrdsMemberDesignation.AbrDate,AsiNrdsMemberDesignation.Abrm,AsiNrdsMemberDesignation.AbrmDate,AsiNrdsMemberDesignation.Alc,AsiNrdsMemberDesignation.AlcDate,AsiNrdsMemberDesignation.Arm,AsiNrdsMemberDesignation.ArmDate,AsiNrdsMemberDesignation.Ccim,AsiNrdsMemberDesignation.CcimDate,AsiNrdsMemberDesignation.Cips,AsiNrdsMemberDesignation.CipsDate,AsiNrdsMemberDesignation.Cpm,AsiNrdsMemberDesignation.CpmDate,AsiNrdsMemberDesignation.Crb,AsiNrdsMemberDesignation.CrbDate,AsiNrdsMemberDesignation.Cre,AsiNrdsMemberDesignation.CreDate,AsiNrdsMemberDesignation.Crs,AsiNrdsMemberDesignation.CrsDate,AsiNrdsMemberDesignation.Gaa,AsiNrdsMemberDesignation.GaaDate,AsiNrdsMemberDesignation.Gri,AsiNrdsMemberDesignation.GriDate,AsiNrdsMemberDesignation.ID,AsiNrdsMemberDesignation.Ltg,AsiNrdsMemberDesignation.LtgDate,AsiNrdsMemberDesignation.NARTimestamp,AsiNrdsMemberDesignation.Raa,AsiNrdsMemberDesignation.RaaDate,AsiNrdsMemberDesignation.Rce,AsiNrdsMemberDesignation.RceDate,AsiNrdsMemberDesignation.Sior,AsiNrdsMemberDesignation.SiorDate,AsiNrdsMemberDesignation.TIME_STAMP
  FROM AsiNrdsMemberDesignation
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCsAsiNrdsMemberEducation]'))
    DROP VIEW [dbo].[vBoCsAsiNrdsMemberEducation]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCsAsiNrdsMemberEducation]
AS
SELECT AsiNrdsMemberEducation.AssociationId,AsiNrdsMemberEducation.CertificateName,AsiNrdsMemberEducation.Comments,AsiNrdsMemberEducation.CourseCode,AsiNrdsMemberEducation.CourseCompletionDate,AsiNrdsMemberEducation.CourseDescription,AsiNrdsMemberEducation.CourseNumber,AsiNrdsMemberEducation.CourseStartDate,AsiNrdsMemberEducation.DateSentToLocalAssociation,AsiNrdsMemberEducation.DateSentToNarIsc,AsiNrdsMemberEducation.DateSentToStateAgency,AsiNrdsMemberEducation.DateSentToStateAssociation,AsiNrdsMemberEducation.DeliveryMethod,AsiNrdsMemberEducation.DesignationCreditHours,AsiNrdsMemberEducation.GroupCode,AsiNrdsMemberEducation.HostingAssociationId,AsiNrdsMemberEducation.ID,AsiNrdsMemberEducation.Instructor1Name,AsiNrdsMemberEducation.Instructor1StateLicenseNumber,AsiNrdsMemberEducation.Instructor2Name,AsiNrdsMemberEducation.Instructor2StateLicenseNumber,AsiNrdsMemberEducation.MemberId,AsiNrdsMemberEducation.NARTimestamp,AsiNrdsMemberEducation.PaymentAmount,AsiNrdsMemberEducation.PaymentCode,AsiNrdsMemberEducation.PointOfEntry,AsiNrdsMemberEducation.SEQN,AsiNrdsMemberEducation.SponsoringAssociationId,AsiNrdsMemberEducation.StateAgencyCourseCode,AsiNrdsMemberEducation.StateCEHours,AsiNrdsMemberEducation.TestMailingAddress,AsiNrdsMemberEducation.TestScore,AsiNrdsMemberEducation.TestScoreDateOfChange,AsiNrdsMemberEducation.TestScoreOperator,AsiNrdsMemberEducation.TestStatus,AsiNrdsMemberEducation.TIME_STAMP,AsiNrdsMemberEducation.TotalHoursEarnedToDate
  FROM AsiNrdsMemberEducation
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCsAsiNrdsMemberFinancial]'))
    DROP VIEW [dbo].[vBoCsAsiNrdsMemberFinancial]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCsAsiNrdsMemberFinancial]
AS
SELECT AsiNrdsMemberFinancial.AssociationId,AsiNrdsMemberFinancial.BillingYear,AsiNrdsMemberFinancial.ContributionType,AsiNrdsMemberFinancial.DuesPaidDate,AsiNrdsMemberFinancial.ECControlNumber,AsiNrdsMemberFinancial.ID,AsiNrdsMemberFinancial.IncurringMemberFirstName,AsiNrdsMemberFinancial.IncurringMemberId,AsiNrdsMemberFinancial.IncurringMemberLastName,AsiNrdsMemberFinancial.MemberFirstName,AsiNrdsMemberFinancial.MemberId,AsiNrdsMemberFinancial.MemberLastName,AsiNrdsMemberFinancial.MemberSsn,AsiNrdsMemberFinancial.NARTimestamp,AsiNrdsMemberFinancial.OfficeId,AsiNrdsMemberFinancial.PaymentAmount,AsiNrdsMemberFinancial.PaymentType,AsiNrdsMemberFinancial.PointOfEntry,AsiNrdsMemberFinancial.PrimaryAssociationId,AsiNrdsMemberFinancial.SEQN,AsiNrdsMemberFinancial.Sequence,AsiNrdsMemberFinancial.Source,AsiNrdsMemberFinancial.TIME_STAMP,AsiNrdsMemberFinancial.ValidateFinancialPaymentType
  FROM AsiNrdsMemberFinancial
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCsAsiNrdsMemberSupplemental]'))
    DROP VIEW [dbo].[vBoCsAsiNrdsMemberSupplemental]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCsAsiNrdsMemberSupplemental]
AS
SELECT AsiNrdsMemberSupplemental.AssociationId,AsiNrdsMemberSupplemental.ID,AsiNrdsMemberSupplemental.LocalJoinDate,AsiNrdsMemberSupplemental.MemberId,AsiNrdsMemberSupplemental.MemberType,AsiNrdsMemberSupplemental.NARTimestamp,AsiNrdsMemberSupplemental.OfficeId,AsiNrdsMemberSupplemental.RELicense,AsiNrdsMemberSupplemental.SEQN,AsiNrdsMemberSupplemental.Status,AsiNrdsMemberSupplemental.StatusDate,AsiNrdsMemberSupplemental.Subclass,AsiNrdsMemberSupplemental.TIME_STAMP
  FROM AsiNrdsMemberSupplemental
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCsAsiNrdsOffice]'))
    DROP VIEW [dbo].[vBoCsAsiNrdsOffice]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCsAsiNrdsOffice]
AS
SELECT AsiNrdsOffice.AdditionalPhoneAreaCode,AsiNrdsOffice.AdditionalPhoneNumber,AsiNrdsOffice.AssociationId,AsiNrdsOffice.BillingOfficeId,AsiNrdsOffice.BranchType,AsiNrdsOffice.BusinessName,AsiNrdsOffice.ContactDRId,AsiNrdsOffice.ContactManagerId,AsiNrdsOffice.ContactUnlicensed,AsiNrdsOffice.CorporateLicense,AsiNrdsOffice.CorporateName,AsiNrdsOffice.District,AsiNrdsOffice.DRFirstName,AsiNrdsOffice.DRLastName,AsiNrdsOffice.Email,AsiNrdsOffice.FaxAreaCode,AsiNrdsOffice.FaxNumber,AsiNrdsOffice.FormalName,AsiNrdsOffice.FranchiseId,AsiNrdsOffice.ID,AsiNrdsOffice.JoinedDate,AsiNrdsOffice.JunkMailFlag,AsiNrdsOffice.MailAddressCity,AsiNrdsOffice.MailAddressState,AsiNrdsOffice.MailAddressStreet1,AsiNrdsOffice.MailAddressStreet2,AsiNrdsOffice.MailAddressZip,AsiNrdsOffice.MailAddressZip6,AsiNrdsOffice.MainOfficeId,AsiNrdsOffice.MlsId,AsiNrdsOffice.MlsOnlineStatus,AsiNrdsOffice.MlsOnlineStatusDate,AsiNrdsOffice.NARTimestamp,AsiNrdsOffice.NMSalespersonCount,AsiNrdsOffice.OfficeId,AsiNrdsOffice.OfficeType,AsiNrdsOffice.OnRosterFlag,AsiNrdsOffice.ParentCompanyId,AsiNrdsOffice.PhoneAreaCode,AsiNrdsOffice.PhoneNumber,AsiNrdsOffice.PointOfEntry,AsiNrdsOffice.PrimaryIndicator,AsiNrdsOffice.PrimaryStateCode,AsiNrdsOffice.SortSequence,AsiNrdsOffice.Status,AsiNrdsOffice.StatusDate,AsiNrdsOffice.StopFaxFlag,AsiNrdsOffice.StopMailFlag,AsiNrdsOffice.StreetAddressCity,AsiNrdsOffice.StreetAddressState,AsiNrdsOffice.StreetAddressStreet1,AsiNrdsOffice.StreetAddressStreet2,AsiNrdsOffice.StreetAddressZip,AsiNrdsOffice.StreetAddressZip6,AsiNrdsOffice.TaxId,AsiNrdsOffice.TIME_STAMP,AsiNrdsOffice.Webpage
  FROM AsiNrdsOffice
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCsAsiNrdsOfficeSupplemental]'))
    DROP VIEW [dbo].[vBoCsAsiNrdsOfficeSupplemental]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCsAsiNrdsOfficeSupplemental]
AS
SELECT AsiNrdsOfficeSupplemental.AssociationId,AsiNrdsOfficeSupplemental.ID,AsiNrdsOfficeSupplemental.NARTimestamp,AsiNrdsOfficeSupplemental.NMSalespersonCount,AsiNrdsOfficeSupplemental.OfficeId,AsiNrdsOfficeSupplemental.SEQN,AsiNrdsOfficeSupplemental.Status,AsiNrdsOfficeSupplemental.StatusDate,AsiNrdsOfficeSupplemental.TIME_STAMP
  FROM AsiNrdsOfficeSupplemental
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
CREATE VIEW [dbo].[vBoCsCalls]
AS
SELECT Activity.ACTION_CODES AS Actions,Activity.CO_ID AS CompanyId,Activity.ID,Activity.NOTE AS Note,Activity.NOTE_2 AS FollowUp,Activity.SEQN AS SequenceNumber,Activity.SOURCE_CODE AS AssignedTo,Activity.TICKLER_DATE AS FollowUpDate,Activity.TRANSACTION_DATE AS Date
  FROM Activity
 WHERE Activity.ACTIVITY_TYPE = 'CALL'
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
CREATE VIEW [dbo].[vBoCsCampaign]
AS
SELECT Campaign.BEGINS_DATE,Campaign.CAMPAIGN_CODE,Campaign.DEFAULT_FUND,Campaign.DESCRIPTION,Campaign.ENDS_DATE,Campaign.GOAL,Campaign.IS_PERPETUAL,Campaign.TIME_STAMP,Campaign.TITLE
  FROM Campaign
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
CREATE VIEW [dbo].[vBoCsCommittee]
AS
SELECT Activity.ACTIVITY_TYPE AS ActivityType,Activity.CO_ID AS CompanyId,Activity.ID,Activity.OTHER_CODE AS CommitteeCode,Activity.SEQN AS SequenceNumber,Activity.ACTION_CODES AS Position,Activity.EFFECTIVE_DATE AS FromDate,Activity.THRU_DATE AS ThruDate,Activity.CATEGORY AS Other,Activity.TRANSACTION_DATE AS LastUpdated,Activity.UNITS AS NoMail,Activity.NOTE AS Notes
  FROM Activity
 WHERE Activity.ACTIVITY_TYPE in ('COMMITTEE','PROPOSED','APPLICANT')
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
CREATE VIEW [dbo].[vBoCsCommitteeCode]
AS
SELECT Product.DESCRIPTION AS Description,Product.GROUP_2 AS PaidThruValidation,Product.GROUP_3 AS TheGroup,Product.NOTE AS Note,Product.PRODUCT_CODE AS ProductCode,Product.PRODUCT_MINOR AS Code,Product.STATUS AS Status,Product.TITLE AS Title
  FROM Product
 WHERE Product.PROD_TYPE = 'COMMITTEE'
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


CREATE VIEW [dbo].[vCsCommitteeMember]
AS 
SELECT n.[ID],
       n.[FULL_NAME] AS FullName,
       n.[TITLE] AS Title,
       n.[COMPANY] AS Organization,
       n.[WORK_PHONE] AS WorkPhone,
       n.[HOME_PHONE] AS HomePhone,
       n.[FAX] AS Fax,
       n.[TOLL_FREE] AS TollFreePhone,
       n.[LAST_FIRST] AS LastFirst,
       n.[EMAIL] AS Email,
       n.[EXCLUDE_DIRECTORY] AS ExcludeDirectory,
       n.[STATUS] AS [Status],
       nBill.[FULL_ADDRESS] AS BillingAddress,
       nMail.[FULL_ADDRESS] AS MailingAddress,
       p.[TITLE] AS CommitteeName,
       p.[DESCRIPTION] AS CommitteeDescription,
       p.[GROUP_3] AS CommitteeGroup,
       cp.[TITLE] AS Position,
       cp.[RANK] AS PositionRank,
       p.[NOTE] AS Note,
       a.[EFFECTIVE_DATE] AS TermStart,
       a.[THRU_DATE] AS TermEnd,
       a.[PRODUCT_CODE] AS CommitteeProductCode,
       a.[ACTIVITY_TYPE] AS Type,
       CASE WHEN (a.[ACTIVITY_TYPE] = 'COMMITTEE' AND ((a.[EFFECTIVE_DATE] IS NULL AND (a.[THRU_DATE] IS NULL OR DATEADD(DAY, 1, a.[THRU_DATE]) > GETDATE())) OR (a.[EFFECTIVE_DATE] <= GETDATE() AND (a.[THRU_DATE] IS NULL OR DATEADD(DAY, 1, a.[THRU_DATE]) > GETDATE()))))
            THEN 'A'
            ELSE 'I'
       END AS [CommitteeStatus],
       CASE WHEN n.[COMPANY_RECORD] = 1 THEN n.[COMPANY] ELSE n.[FULL_NAME] END AS CommitteeMemberName
  FROM [dbo].[Activity] AS a
       INNER JOIN [dbo].[Name] AS n ON a.[ID] = n.[ID]
       INNER JOIN [dbo].[Product] AS p ON a.[PRODUCT_CODE] = p.[PRODUCT_CODE]
       INNER JOIN [dbo].[Name_Address] AS nMail ON n.[MAIL_ADDRESS_NUM] = nMail.[ADDRESS_NUM]
       INNER JOIN [dbo].[Name_Address] AS nBill ON n.[BILL_ADDRESS_NUM] = nBill.[ADDRESS_NUM]
       LEFT OUTER JOIN [dbo].[Committee_Position] AS cp ON a.ACTION_CODES = cp.POSITION_CODE
WHERE p.[PROD_TYPE] = 'COMMITTEE';



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
CREATE VIEW [dbo].[vBoCsCommitteeMember]
AS
SELECT vCsCommitteeMember.BillingAddress,vCsCommitteeMember.CommitteeDescription,vCsCommitteeMember.CommitteeGroup,vCsCommitteeMember.CommitteeName,vCsCommitteeMember.CommitteeProductCode,vCsCommitteeMember.Email,vCsCommitteeMember.Fax,vCsCommitteeMember.FullName,vCsCommitteeMember.HomePhone,vCsCommitteeMember.ID,vCsCommitteeMember.LastFirst AS LAST_FIRST,vCsCommitteeMember.MailingAddress,vCsCommitteeMember.Note,vCsCommitteeMember.Organization,vCsCommitteeMember.Position,vCsCommitteeMember.PositionRank,vCsCommitteeMember.TermEnd,vCsCommitteeMember.TermStart,vCsCommitteeMember.Title,vCsCommitteeMember.TollFreePhone,vCsCommitteeMember.WorkPhone,vCsCommitteeMember.ExcludeDirectory,vCsCommitteeMember.Status,vCsCommitteeMember.Type,vCsCommitteeMember.CommitteeStatus,vCsCommitteeMember.CommitteeMemberName
  FROM vCsCommitteeMember
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
CREATE VIEW [dbo].[vBoCsCommitteeMemberGroup]
AS
SELECT vCsCommittee.CommitteeGroup,vCsCommittee.CommitteeName,vCsCommittee.CommitteeProductCode
  FROM vCsCommittee
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
CREATE VIEW [dbo].[vBoCsCommitteePosition]
AS
SELECT Committee_Position.POSITION_CODE AS PositionCode,Committee_Position.RANK AS Rank,Committee_Position.TITLE AS Title
  FROM Committee_Position
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
CREATE VIEW [dbo].[vBoCsContact]
AS
SELECT Name.ADDRESS_NUM_1 AS AddressNumber1,Name.ADDRESS_NUM_2 AS AddressNumber2,Name.ADDRESS_NUM_3 AS AddressNumber3,Name.BAR_CODE AS BarCode,Name.BILL_ADDRESS_NUM AS BillAddressNum,Name.BIRTH_DATE AS BirthDate,Name.CATEGORY AS Category,Name.CHAPTER AS Chapter,Name.CO_ID AS CompanyId,Name.CO_MEMBER_TYPE AS CompanyMemberType,Name.COMPANY AS Company,Name.COMPANY_SORT AS CompanySort,Name.CONTACT_RANK AS ContactRank,Name.COUNTRY AS Country,Name.COUNTY AS County,Name.CRRT AS Crrt,Name.DATE_ADDED AS DateAdded,Name.DESIGNATION AS Designation,Name.DUP_MATCH_KEY AS DupMatchKey,Name.EMAIL AS Email,Name.EXCLUDE_DIRECTORY AS ExcludeDirectory,Name.EXCLUDE_MAIL AS ExcludeMail,Name.FAX AS Fax,Name.FULL_ADDRESS AS FullAddress,Name.FUNCTIONAL_TITLE AS FunctionalTitle,Name.GENDER AS Gender,Name.HOME_PHONE AS HomePhone,Name.INFORMAL AS Informal,Name.INTENT_TO_EDIT AS IntentToEdit,Name.JOIN_DATE AS JoinDate,Name.LAST_FIRST AS LastFirst,Name.LAST_NAME AS LastName,Name.LAST_UPDATED AS LastUpdated,Name.MAIL_ADDRESS_NUM AS MailAddressNumber,Name.MAIL_CODE AS MailCode,Name.MAJOR_KEY AS MajorKey,Name.MEMBER_RECORD AS IsMember,Name.MEMBER_STATUS AS MemberStatus,Name.MEMBER_STATUS_DATE AS MemberStatusDate,Name.MEMBER_TYPE AS MemberType,Name.MIDDLE_NAME AS MiddleName,Name.MT_CHANGE_DATE AS MemberTypeChangeDate,Name.ORG_CODE AS EntityCode,Name.PAID_THRU AS PaidThrough,Name.PREFIX AS Prefix,Name.PREVIOUS_MT AS PreviousMemberType,Name.SIC_CODE AS SicCode,Name.SOURCE_CODE AS SourceCode,Name.STATE_HOUSE AS StateHouse,Name.STATE_PROVINCE AS StateProvince,Name.STATE_SENATE AS StateSenate,Name.STATUS AS Status,Name.SUFFIX AS Suffix,Name.TITLE AS Title,Name.UPDATED_BY AS UpdatedBy,Name.US_CONGRESS AS UsCongress,Name.WEBSITE AS Website,Name.WORK_PHONE AS WorkPhone,Name.ZIP AS Zip,Name.FIRST_NAME AS FirstName,Name.CITY AS City,Name.TOLL_FREE AS TollFree,Name.BT_ID AS BillToID,Name.SHIP_ADDRESS_NUM AS ShipAddressNum,Name.ID,Name_Fin.BACKORDERS AS Backorders,Name_Fin.CREDIT_LIMIT AS CreditLimit,Name_Fin.NO_STATEMENTS AS NoStatements,Name_Fin.RENEW_MONTHS AS RenewMonths,Name_Fin.RENEWED_THRU AS RenewedThru,Name_Fin.TAX_AUTHOR_DEFAULT AS DefaultTaxAuthority,Name_Fin.TAX_EXEMPT AS TaxExempt,Name_Fin.TERMS_CODE AS DefaultTermsCode,Name_Fin.USE_VAT_TAXATION AS VatExempt,Name_Fin.VAT_COUNTRY AS VatCountry,Name_Fin.VAT_REG_NUMBER AS VatRegNumber,Name.COMPANY_RECORD AS IsCompany,Name.FULL_NAME AS FullName
  FROM Name
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
CREATE VIEW [dbo].[vBoCsContactRelatedCompany]
AS
SELECT vContactRelatedCompany.City,vContactRelatedCompany.Company,vContactRelatedCompany.CompanyId,vContactRelatedCompany.ContactKey,vContactRelatedCompany.ContactRank,vContactRelatedCompany.Country,vContactRelatedCompany.CurrentCompanyId,vContactRelatedCompany.CurrentContactKey,vContactRelatedCompany.CurrentId,vContactRelatedCompany.Designation,vContactRelatedCompany.Email,vContactRelatedCompany.Fax,vContactRelatedCompany.FullAddress,vContactRelatedCompany.FullName,vContactRelatedCompany.FunctionalTitle,vContactRelatedCompany.HomePhone,vContactRelatedCompany.ID,vContactRelatedCompany.Informal,vContactRelatedCompany.IsCompany,vContactRelatedCompany.LastFirst,vContactRelatedCompany.MemberType,vContactRelatedCompany.Prefix,vContactRelatedCompany.StateProvince,vContactRelatedCompany.Status,vContactRelatedCompany.Suffix,vContactRelatedCompany.Title,vContactRelatedCompany.TollFree,vContactRelatedCompany.WorkPhone,vContactRelatedCompany.Zip
  FROM vContactRelatedCompany
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
CREATE VIEW [dbo].[vBoCsCountryNames]
AS
SELECT Country_Names.ADDRESS_FORMAT AS AddressFormat,Country_Names.COUNTRY AS Country,Country_Names.DEFAULT_SHIPPING_METHOD AS DefaultShippingMethod,Country_Names.INTRASTAT_CODE AS VatIntrastatCode,Country_Names.MAIL_GROUP AS MailGroup,Country_Names.VAT_COUNTRY_CODE AS VatCountryCode
  FROM Country_Names
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
    FROM [dbo].[DonationReport]

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
CREATE VIEW [dbo].[vBoCsDonations]
AS
SELECT vDonations.Amount,vDonations.CheckNumber,vDonations.DateReceived,vDonations.FiscalMonth,vDonations.FiscalYear,vDonations.GiftType,vDonations.ID,vDonations.InvoiceRefNum,vDonations.IsMatchingGift,vDonations.ListAs,vDonations.MatchingTransaction,vDonations.MemorialID,vDonations.MemorialNameText,vDonations.OriginalTransaction,vDonations.PaymentType,vDonations.RequestNumber,vDonations.SolicitorID,vDonations.SourceSystem,vDonations.TransactionDate
  FROM vDonations
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
CREATE VIEW [dbo].[vBoCsDonationsDetail]
AS
SELECT vDonationsDetail.Amount,vDonationsDetail.Appeal,vDonationsDetail.Campaign,vDonationsDetail.CheckNumber,vDonationsDetail.DateReceived,vDonationsDetail.FiscalMonth,vDonationsDetail.FiscalYear,vDonationsDetail.Fund,vDonationsDetail.GiftType,vDonationsDetail.ID,vDonationsDetail.InvoiceRefNum,vDonationsDetail.IsMatchingGift,vDonationsDetail.ListAs,vDonationsDetail.MatchingTransaction,vDonationsDetail.MemorialID,vDonationsDetail.MemorialNameText,vDonationsDetail.OriginalTransaction,vDonationsDetail.PaymentType,vDonationsDetail.RequestNumber,vDonationsDetail.SolicitorID,vDonationsDetail.SourceSystem,vDonationsDetail.TransactionDate
  FROM vDonationsDetail
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
CREATE VIEW [dbo].[vBoCsDonorData]
AS
SELECT Name_FR.DO_NOT_EMAIL AS DoNotEmail,Name_FR.DO_NOT_PHONE AS DoNotPhone,Name_FR.DO_NOT_SELL AS DoNotSell,Name_FR.DO_NOT_SOLICIT AS DoNotSolicit,Name_FR.ID,Name_FR.Last_Receipt_Printed_Date AS LastReceiptPrintDate,Name_FR.LIST_AS AS ListAs,Name_FR.PREFERRED_DIST_CODE AS PreferredDistribution,Name_FR.Receipt_Interval AS ReceiptInterval,Name_FR.SOLICITOR_ID AS SolicitorID
  FROM Name_FR
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
CREATE VIEW [dbo].[vBoCsDuesHistory]
AS
SELECT Activity.ACTIVITY_TYPE AS ActivityType,Activity.AMOUNT AS Amount,Activity.CO_ID AS CompanyId,Activity.DESCRIPTION AS Description,Activity.EFFECTIVE_DATE AS EffectiveDate,Activity.ID,Activity.PRODUCT_CODE AS ProductCode,Activity.SEQN AS SequenceNumber,Activity.SOURCE_CODE AS SourceCode,Activity.THRU_DATE AS PaidThru,Activity.TRANSACTION_DATE AS TransactionDate
  FROM Activity
 WHERE Activity.ACTIVITY_TYPE = 'DUES'
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
CREATE VIEW [dbo].[vBoCsEvent]
AS
SELECT Meet_Master.ADDRESS_1 AS Address1,Meet_Master.ADDRESS_2 AS Address2,Meet_Master.ADDRESS_3 AS Address3,Meet_Master.BEGIN_DATE AS BeginDate,Meet_Master.CITY AS City,Meet_Master.CONTACT_ID AS ContactId,Meet_Master.COORDINATORS AS Coordinators,Meet_Master.COUNTRY AS Country,Meet_Master.DESCRIPTION AS Description,Meet_Master.DIRECTIONS AS Directions,Meet_Master.EARLY_CUTOFF AS EarlyCutoff,Meet_Master.EMAIL_REGISTRATION AS EmailRegistration,Meet_Master.END_DATE AS EndDate,Meet_Master.HEAD_COUNT AS Attendees,Meet_Master.IS_FR_MEET AS IsFrMeeting,Meet_Master.LATE_CUTOFF AS LateCutoff,Meet_Master.MAX_REGISTRANTS AS MaxRegistrants,Meet_Master.MEET_APPEAL AS MeetAppeal,Meet_Master.MEET_CAMPAIGN AS MeetCampaign,Meet_Master.MEETING AS EventCode,Meet_Master.MEETING_IMAGE_NAME AS MeetingImageName,Meet_Master.MEETING_TYPE AS MeetingType,Meet_Master.MEETING_URL AS MeetingUrl,Meet_Master.NOTES AS Notes,Meet_Master.ORG_CODE AS EntityCode,Meet_Master.REG_CUTOFF AS RegCutoff,Meet_Master.STATE_PROVINCE AS StateProvince,Meet_Master.STATUS AS Status,Meet_Master.TITLE AS Title,Meet_Master.TOTAL_CANCELATIONS AS TotalCancelations,Meet_Master.TOTAL_REGISTRANTS AS TotalRegistrants,Meet_Master.TOTAL_REVENUE AS TotalRevenue,Meet_Master.WEB_ENABLED AS WebEnabled,Meet_Master.WEB_VIEW_ONLY AS WebViewOnly,Meet_Master.ZIP AS Zip,Meet_Master.PUBLISH_END_DATE AS PublishEndDate,Meet_Master.PUBLISH_START_DATE AS PublishStartDate,Meet_Master.REGISTRATION_START_DATE AS RegistrationStartDate,Meet_Master.REGISTRATION_END_DATE AS RegistrationEndDate
  FROM Meet_Master
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
CREATE VIEW [dbo].[vBoCsEventHistory]
AS
SELECT Activity.ACTIVITY_TYPE AS ActivityType,Activity.AMOUNT AS Fees,Activity.CO_ID AS CompanyId,Activity.DESCRIPTION AS Event,Activity.ID,Activity.PRODUCT_CODE AS EventCode,Activity.SEQN AS SequenceNumber,Activity.SOURCE_CODE AS SourceCode,Activity.TRANSACTION_DATE AS EventDate
  FROM Activity
 WHERE Activity.ACTIVITY_TYPE = 'MEETING'
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
CREATE VIEW [dbo].[vBoCsExchangeRate]
AS
SELECT Exchange_Rate.CurrencyCode,Exchange_Rate.ExchangeRate
  FROM Exchange_Rate
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
CREATE VIEW [dbo].[vBoCsFunction]
AS
SELECT Product.DEFERRED_INCOME_ACCOUNT AS DeferredIncomeAccount,Product.DESCRIPTION AS FunctionDescription,Product.INCOME_ACCOUNT AS DefaultIncomeAccount,Product.PRICE_1 AS DefaultEarlyFees,Product.PRICE_2 AS DefaultRegularFees,Product.PRICE_3 AS DefaultLateFees,Product.PRODUCT_CODE AS ProductCode,Product.PRODUCT_MAJOR AS EventCode,Product.PRODUCT_MINOR AS FunctionCode,Product.PST_TAXABLE AS PSTTaxable,Product.STATUS AS Status,Product.TAX_AUTHORITY AS VatTaxAuthority,Product.TAXABLE AS GSTTaxable,Product.TAXABLE_VALUE AS FairMarketValue,Product.TITLE AS Title,Product_Function.ACTUAL_ATTENDANCE AS ActualAttendance,Product_Function.AUTO_ENROLL AS AutomaticOption,Product_Function.BEGIN_DATE_TIME AS BeginDate,Product_Function.CEU_AMOUNT AS CeuAmount,Product_Function.CEU_ENTERED AS CeuEntered,Product_Function.CEU_TYPE AS CeuType,Product_Function.CONFLICT_CODE AS ConflictCode,Product_Function.END_DATE_TIME AS EndDate,Product_Function.EXPECTED_ATTENDANCE AS ExpectedAttendance,Product_Function.FUNCTION_TYPE AS FunctionType,Product_Function.GUARANTEED_ATTENDANCE AS GuaranteedAttendance,Product_Function.LAST_TICKET AS LastTicket,Product_Function.MAXIMUM_ATTENDANCE AS MaximumAttendance,Product_Function.MINIMUM_ATTENDANCE AS MinimumAttendance,Product_Function.PARENT AS Parent,Product_Function.PRINT_TICKET AS PrintTicket,Product_Function.SEQ AS SequenceNumber,Product_Function.SETTINGS AS Settings,Product_Function.WEB_ENABLED AS WebEnabled,Product_Inventory.LTD_INCOME AS TotalFees,Product_Inventory.LTD_QUANTITY AS TotalRegistrants,Product_Function.EVENT_CATEGORY AS EventCategory,Product_Function.EVENT_TRACK AS EventTrack,Product_Function.IS_EVENT_REGISTRATION_OPTION AS IsEventRegistrationOption
  FROM Product
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
CREATE VIEW [dbo].[vBoCsFunctionFees]
AS
SELECT Product_Price.COMPLIMENTARY AS Complimentary,Product_Price.CUSTOMER_TYPE AS RegistrantClass,Product_Price.INCOME_ACCOUNT AS IncomeAccount,Product_Price.PRODUCT_CODE AS ProductCode,Product_Price.RATE_1 AS EarlyFees,Product_Price.RATE_2 AS RegularFees,Product_Price.RATE_3 AS LateFees,Product_Price.RULE_TYPE AS RuleType
  FROM Product_Price
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
CREATE VIEW [dbo].[vBoCsGeneralLookupTables]
AS
SELECT Gen_Tables.CODE AS Code,Gen_Tables.DESCRIPTION AS Description,Gen_Tables.SUBSTITUTE AS SubstituteValue,Gen_Tables.TABLE_NAME AS TableName
  FROM Gen_Tables
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
CREATE VIEW [dbo].[vBoCsGenTablesUnion]
AS
SELECT vGenTablesUnion.CODE AS Code,vGenTablesUnion.DESCRIPTION AS Description,vGenTablesUnion.TABLE_NAME AS TableName
  FROM vGenTablesUnion
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
CREATE VIEW [dbo].[vBoCsInventory]
AS
SELECT Product_Inventory.ADJUSTMENT_ACCOUNT AS AdjustmentAccount,Product_Inventory.AVERAGE_COST AS AverageCost,Product_Inventory.COG_ACCOUNT AS CogAccount,Product_Inventory.EXPECTED_ARRIVAL_DATE AS ExpectedArrivalDate,Product_Inventory.FIRST_ORDER_DATE AS FirstOrderDate,Product_Inventory.INCOME_ACCOUNT AS IncomeAccount,Product_Inventory.INVENTORY_ACCOUNT AS InventoryAccount,Product_Inventory.LAST_ORDER_DATE AS LastOrderDate,Product_Inventory.LAST_RECEIVED_DATE AS LastReceivedDate,Product_Inventory.LATEST_COST AS LatestCost,Product_Inventory.LOCATION AS Location,Product_Inventory.LTD_INCOME AS LtdIncome,Product_Inventory.LTD_ORDERS AS LtdOrders,Product_Inventory.LTD_QUANTITY AS LtdQuantitySold,Product_Inventory.MINIMUM_ORDER_POINT AS MinimumOrderPoint,Product_Inventory.MINIMUM_ORDER_QUANTITY AS MinimumOrderQuantity,Product_Inventory.PRODUCT_CODE AS ProductCode,Product_Inventory.QUANTITY_AVAILABLE AS QuantityAvailable,Product_Inventory.QUANTITY_BACKORDERED AS QuantityBackordered,Product_Inventory.QUANTITY_COMMITTED AS QuantityCommitted,Product_Inventory.QUANTITY_ON_HAND AS QuantityOnHand,Product_Inventory.QUANTITY_ON_ORDER AS QuantityOnOrder,Product_Inventory.QUANTITY_RESERVED AS QuantityReserved,Product_Inventory.STANDARD_COST AS StandardCost,Product_Inventory.TOTAL_COST AS TotalCost
  FROM Product_Inventory
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
CREATE VIEW [dbo].[vBoCsInvoice]
AS
SELECT Invoice.ADJUSTMENTS,Invoice.AR_ACCOUNT,Invoice.AVAILABLE_DISC,Invoice.BALANCE,Invoice.BATCH_NUM,Invoice.BILL_TO_CC,Invoice.BT_ID,Invoice.CHARGES,Invoice.CREDIT_STATUS,Invoice.CREDITS,Invoice.CUSTOMER_NAME,Invoice.CUSTOMER_REFERENCE,Invoice.DESCRIPTION,Invoice.DISCOUNT_DATE,Invoice.DUE_DATE,Invoice.EFFECTIVE_DATE,Invoice.HAS_BEEN_BILLED,Invoice.INSTALL_BILL_DATE,Invoice.INVOICE_DATE,Invoice.INVOICE_NUM,Invoice.INVOICE_TYPE,Invoice.IS_MULTI_ORG,Invoice.NOTE,Invoice.NUM_LINES,Invoice.ORG_CODE,Invoice.ORIGINATING_TRANS_NUM,Invoice.REFERENCE_NUM,Invoice.SOURCE_CODE,Invoice.SOURCE_SYSTEM,Invoice.ST_ID,Invoice.TERMS_CODE
  FROM Invoice
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
CREATE VIEW [dbo].[vBoCsIsoCurrencyCodes]
AS
SELECT Iso_Currency_Codes.CurrencyCode,Iso_Currency_Codes.CurrencyName
  FROM Iso_Currency_Codes
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
CREATE VIEW [dbo].[vBoCsLetters]
AS
SELECT Activity.ACTIVITY_TYPE AS ActivityType,Activity.CO_ID AS CompanyId,Activity.DESCRIPTION AS Letter,Activity.ID AS Id,Activity.NOTE AS LetterText,Activity.SEQN AS SequenceNumber,Activity.SOURCE_CODE AS SentBy,Activity.TRANSACTION_DATE AS Date
  FROM Activity
 WHERE Activity.ACTIVITY_TYPE = 'LETTER'
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
CREATE VIEW [dbo].[vBoCsMatchingPlans]
AS
SELECT Name_MatchPlan.FORM_NUMBER AS FormNumber,Name_MatchPlan.FROM_AMOUNT AS MinimumContribution,Name_MatchPlan.FROM_DATE AS StartDate,Name_MatchPlan.ID,Name_MatchPlan.NOTES AS Notes,Name_MatchPlan.PERCENTAGE AS MatchPercentage,Name_MatchPlan.SEQN AS SequenceNumber,Name_MatchPlan.TO_AMOUNT AS MaximumContribution,Name_MatchPlan.TO_DATE AS EndDate
  FROM Name_MatchPlan
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
CREATE VIEW [dbo].[vBoCsMemberType]
AS
SELECT Member_Types.BILL_COMPANY AS BillCompany,Member_Types.COMPANY_RECORD AS IsCompany,Member_Types.DESCRIPTION AS Description,Member_Types.DUES_CODE_1 AS MainDuesCode,Member_Types.MEMBER_RECORD AS IsMember,Member_Types.MEMBER_TYPE AS MemberType
  FROM Member_Types
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCsName_Indexes]'))
    DROP VIEW [dbo].[vBoCsName_Indexes]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCsName_Indexes]
AS
SELECT Name_Indexes.ID,Name_Indexes.INDEX_NAME AS IndexName,Name_Indexes.INDEX_VALUE AS IndexValue
  FROM Name_Indexes
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCsName_Staff]'))
    DROP VIEW [dbo].[vBoCsName_Staff]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCsName_Staff]
AS
SELECT Name_Staff.DESCRIPTION,Name_Staff.HOURS_PER_WEEK,Name_Staff.ID,Name_Staff.IS_SALESMAN,Name_Staff.IS_VOLUNTEER,Name_Staff.TITLE
  FROM Name_Staff
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCsNameFin]'))
    DROP VIEW [dbo].[vBoCsNameFin]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCsNameFin]
AS
SELECT Name_Fin.BACKORDERS,Name_Fin.BT_ID,Name_Fin.CREDIT_LIMIT,Name_Fin.ID,Name_Fin.NO_STATEMENTS,Name_Fin.RENEW_MONTHS,Name_Fin.TAX_AUTHOR_DEFAULT,Name_Fin.TAX_EXEMPT,Name_Fin.TERMS_CODE,Name_Fin.USE_VAT_TAXATION,Name_Fin.VAT_COUNTRY,Name_Fin.VAT_REG_NUMBER,Name.DATE_ADDED,Name.JOIN_DATE,Name.LAST_UPDATED,Name_Fin.RENEWED_THRU
  FROM Name_Fin
	INNER JOIN Name
		ON Name_Fin.ID = Name.ID
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
CREATE VIEW [dbo].[vBoCsNameLog]
AS
SELECT Name_Log.DATE_TIME,Name_Log.ID,Name_Log.LOG_TEXT,Name_Log.LOG_TYPE,Name_Log.SUB_TYPE,Name_Log.USER_ID
  FROM Name_Log
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
CREATE VIEW [dbo].[vBoCsNameNote]
AS
SELECT Name_Note.DATE_ADDED,Name_Note.ID,Name_Note.LAST_UPDATED,Name_Note.NOTE,Name_Note.NOTE_NUM,Name_Note.PURPOSE,Name_Note.UPDATED_BY
  FROM Name_Note
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
CREATE VIEW [dbo].[vBoCsNameUser]
AS
SELECT Name.FIRST_NAME AS FirstName,Name.ID AS Id,Name.LAST_FIRST AS LastName,Name.MEMBER_TYPE AS MemberType,UserMain.UserId,UserMain.UserKey
  FROM UserMain
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
CREATE VIEW [dbo].[vBoCsNotificationList]
AS
SELECT Name_Notify.ID,Name_Notify.MEM_TRIBUTE_CODE AS MemorialTributeType,Name_Notify.MERGE_CODE AS MergeCode,Name_Notify.NOTIFY_ID AS NotifyID,Name_Notify.RELATIONSHIP AS Relationship,Name_Notify.SALUTATION_CODE AS SalutationCode,Name_Notify.SENDER_CODE AS SenderCode
  FROM Name_Notify
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
CREATE VIEW [dbo].[vBoCsOrderHistory]
AS
SELECT Activity.ACTIVITY_TYPE AS ActivityType,Activity.AMOUNT AS Amount,Activity.CO_ID AS CompanyId,Activity.DESCRIPTION AS ProductName,Activity.ID,Activity.MEMBER_TYPE AS MemberType,Activity.PRODUCT_CODE AS ProductCode,Activity.QUANTITY AS Quantity,Activity.SEQN AS SequenceNumber,Activity.SOURCE_CODE AS SourceCode,Activity.TRANSACTION_DATE AS TransactionDate
  FROM Activity
 WHERE Activity.ACTIVITY_TYPE = 'ORDER'
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
CREATE VIEW [dbo].[vBoCsOrderLines]
AS
SELECT vCsOrderLines.Description,vCsOrderLines.Discount,vCsOrderLines.ExtendedAmount,vCsOrderLines.ExtendedCost,vCsOrderLines.GSTTaxable,vCsOrderLines.IncomeAccount,vCsOrderLines.LineNumber,vCsOrderLines.Location,vCsOrderLines.Note,vCsOrderLines.OrderNumber,vCsOrderLines.ProductCode,vCsOrderLines.QuantityBackordered,vCsOrderLines.QuantityCommitted,vCsOrderLines.QuantityOrdered,vCsOrderLines.QuantityReserved,vCsOrderLines.QuantityShipped,vCsOrderLines.Tax1,vCsOrderLines.Taxable,vCsOrderLines.UnitCost,vCsOrderLines.UnitPrice,vCsOrderLines.VATTaxAuthority,vCsOrderLines.VATTaxRate
  FROM vCsOrderLines
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
CREATE VIEW [dbo].[vBoCsOrders]
AS
SELECT Orders.ADDRESS_1 AS Address1,Orders.ADDRESS_2 AS Address2,Orders.ADDRESS_3 AS Address3,Orders.ADDRESS_FORMAT AS AddressFormat,Orders.BALANCE AS Balance,Orders.BATCH_NUM AS BatchNumber,Orders.BT_ID AS BillToId,Orders.CITY AS City,Orders.CO_ID AS CompanyId,Orders.CO_MEMBER_TYPE AS CompanyMemberType,Orders.COMPANY AS Company,Orders.COMPANY_SORT AS CompanySort,Orders.COUNTRY AS Country,Orders.CUSTOMER_REFERENCE AS CustomerReference,Orders.EMAIL AS Email,Orders.FREIGHT_1 AS Freight1,Orders.FREIGHT_2 AS Freight2,Orders.FULL_ADDRESS AS FullAddress,Orders.FULL_NAME AS FullName,Orders.HANDLING_1 AS Handling1,Orders.HANDLING_2 AS Handling2,Orders.HOLD_CODE AS HoldCode,Orders.HOLD_COMMENT AS HoldComment,Orders.HOLD_FLAG AS HoldFlag,Orders.INVOICE_REFERENCE_NUM AS InvoiceReferenceNumber,Orders.MEMBER_TYPE AS MemberType,Orders.NOTES AS Notes,Orders.ORDER_DATE AS OrderDate,Orders.ORDER_NUMBER AS OrderNumber,Orders.ORDER_TYPE_CODE AS OrderTypeCode,Orders.ORG_CODE AS EntityCode,Orders.PAY_TYPE AS PayType,Orders.PHONE AS Phone,Orders.SOURCE_CODE AS SourceCode,Orders.ST_ID AS ShipToId,Orders.STAGE AS Stage,Orders.STATE_PROVINCE AS StateProvince,Orders.STATUS AS Status,Orders.TAX_1 AS Tax1,Orders.TAX_2 AS Tax2,Orders.TAX_3 AS Tax3,Orders.TAX_RATE_1 AS TaxRate1,Orders.TAX_RATE_2 AS TaxRate2,Orders.TAX_RATE_3 AS TaxRate3,Orders.TITLE AS Title,Orders.TOTAL_CHARGES AS TotalCharges,Orders.TOTAL_PAYMENTS AS TotalPayments,Orders.TOTAL_QUANTITY_BACKORDERED AS TotalQuantityBackordered,Orders.TOTAL_QUANTITY_ORDERED AS TotalQuantityOrdered,Orders.ZIP AS Zip,Orders.SOURCE_SYSTEM
  FROM Orders
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
CREATE VIEW [dbo].[vBoCsOrderType]
AS
SELECT Order_Type.CODE AS Code,Order_Type.DESCRIPTION AS Description
  FROM Order_Type
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
CREATE VIEW [dbo].[vBoCsOrg_Control]
AS
SELECT Org_Control.CoVATRegNumber,Org_Control.DefaultArAccount,Org_Control.DefaultCancellationAccount,Org_Control.DefaultCashAccount,Org_Control.DefaultFlag,Org_Control.DefaultFreightAccount,Org_Control.DefaultHandlingAccount,Org_Control.DefaultIncomeAccount,Org_Control.DefaultPrepaidOrderAccount,Org_Control.DefaultTaxAccount,Org_Control.DefaultTransferClearingAccount,Org_Control.DefaultWriteOffOffsetAccount,Org_Control.DiscountAccount,Org_Control.FinanceAccount,Org_Control.GSTRemitNumber,Org_Control.InvoiceAddress,Org_Control.IsFund,Org_Control.LetterheadAddress,Org_Control.Logo,Org_Control.OrgCode,Org_Control.OrgName,Org_Control.RefundApAccount,Org_Control.RefundClearingAccount,Org_Control.Registration_Num,Org_Control.TaxAuthority,Org_Control.TIME_STAMP,Org_Control.UseCanadianTaxation,Org_Control.UseVATTaxation,Org_Control.VATBranchID,Org_Control.VATCountry,Org_Control.VATRegNumber
  FROM Org_Control
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
CREATE VIEW [dbo].[vBoCsPledges]
AS
SELECT vPledge.AdjustmentsAmount,vPledge.Appeal,vPledge.Campaign,vPledge.DateReceived,vPledge.FiscalMonth,vPledge.FiscalYear,vPledge.Fund,vPledge.ID AS Id,vPledge.InstallmentDate,vPledge.InvoiceReferenceNumber,vPledge.IsMatchingGift,vPledge.LastPaymentDate,vPledge.ListAs,vPledge.MatchingTransaction,vPledge.MemorialID,vPledge.MemorialNameText,vPledge.NetPledgeAmount,vPledge.PaymentsAmount,vPledge.PledgeAmount,vPledge.PledgeBalance,vPledge.PledgeFairMarketValue,vPledge.RequestNumber,vPledge.SolicitorID,vPledge.SourceSystem,vPledge.TransactionDate,vPledge.TransactionNumber
  FROM vPledge
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
       p.WEB_DESC, p.WEB_OPTION, op.IsSuperProduct, op.SellOnWeb, opcl.IsFeatured,p.IS_KIT,p.PRICE_FROM_COMPONENTS,
       p.PUBLISH_START_DATE AS PublishStartDate, p.PUBLISH_END_DATE AS PublishEndDate
   FROM [dbo].[Product] p
        LEFT OUTER JOIN [dbo].[OrderProduct] op ON p.PRODUCT_CODE = op.ProductCode
        LEFT OUTER JOIN [dbo].[OrderProductCategoryLookup] opcl ON op.OrderProductID = opcl.OrderProductID


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
CREATE VIEW [dbo].[vBoCsProduct]
AS
SELECT vProduct.APPLY_IMAGE,vProduct.APPLY_THUMBNAIL,vProduct.DeferredIncomeAccount,vProduct.Description,vProduct.IMAGE_URL,vProduct.IncomeAccount,vProduct.IsFeatured,vProduct.IsSuperProduct,vProduct.Price1,vProduct.Price2,vProduct.Price3,vProduct.ProductCategory,vProduct.ProductCode,vProduct.ProductMajor,vProduct.ProductMinor,vProduct.ProductType,vProduct.SellOnWeb,vProduct.Status,vProduct.THUMBNAIL_URL,vProduct.Title,vProduct.TitleKey,vProduct.WEB_DESC,vProduct.WEB_OPTION,vProduct.PublishEndDate,vProduct.PublishStartDate
  FROM vProduct
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
CREATE VIEW [dbo].[vBoCsProductCategory]
AS
SELECT Product_Cat.DESCRIPTION AS Description,Product_Cat.PRODUCT_CATEGORY AS ProductCategory,Product_Cat.UF_1 AS UserDefinedField1,Product_Cat.UF_2 AS UserDefinedField2,Product_Cat.UF_3 AS UserDefinedField3,Product_Cat.UF_4 AS UserDefinedField4
  FROM Product_Cat
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
CREATE VIEW [dbo].[vBoCsProductType]
AS
SELECT Product_Type.PROD_TYPE AS ProductType,Product_Type.DESCRIPTION AS Description
  FROM Product_Type
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
CREATE VIEW [dbo].[vBoCsRegFunctions]
AS
SELECT vCsRegFunctions.BillToId,vCsRegFunctions.Company,vCsRegFunctions.CompanySort,vCsRegFunctions.Description,vCsRegFunctions.ExtendedAmount,vCsRegFunctions.FullName,vCsRegFunctions.IncomeAccount,vCsRegFunctions.InvoiceDate,vCsRegFunctions.InvoiceNumber,vCsRegFunctions.InvoiceReferenceNumber,vCsRegFunctions.IsFrOrder,vCsRegFunctions.Note,vCsRegFunctions.OrderDate,vCsRegFunctions.OrderNumber,vCsRegFunctions.ProductCode,vCsRegFunctions.QuantityOrdered,vCsRegFunctions.RegisteredQuantity,vCsRegFunctions.ShipToId,vCsRegFunctions.Status,vCsRegFunctions.Tax1,vCsRegFunctions.TaxRate,vCsRegFunctions.UnitPrice
  FROM vCsRegFunctions
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
CREATE VIEW [dbo].[vBoCsRegistrantClasses]
AS
SELECT Meet_Reg_Class.DESCRIPTION AS Description,Meet_Reg_Class.LONG_DESCRIPTION AS LongDescription,Meet_Reg_Class.REGISTRANT_CLASS AS RegistrantClass
  FROM Meet_Reg_Class
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
CREATE VIEW [dbo].[vBoCsRegistration]
AS
SELECT vCsRegistration.Balance,vCsRegistration.BillToId,vCsRegistration.Company,vCsRegistration.CompanyMemberType,vCsRegistration.CompanySort,vCsRegistration.EventCode,vCsRegistration.FullName,vCsRegistration.LastFirst,vCsRegistration.LineTaxable,vCsRegistration.LineTotal,vCsRegistration.MemberType,vCsRegistration.OrderDate,vCsRegistration.OrderNumber,vCsRegistration.OrderTypeCode,vCsRegistration.RegistrantClass,vCsRegistration.ShipToId,vCsRegistration.Status,vCsRegistration.TotalCharges,vCsRegistration.TotalPayments
  FROM vCsRegistration
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
CREATE VIEW [dbo].[vBoCsRelationship]
AS
SELECT vRelationship.BeginDate,vRelationship.EndDate,vRelationship.FunctionalTitle,vRelationship.GroupCode,vRelationship.ID,vRelationship.Note,vRelationship.RelatedToID,vRelationship.RelatedToName,vRelationship.Relationship,vRelationship.Status,vRelationship.Title
  FROM vRelationship
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
CREATE VIEW [dbo].[vBoCsRelationshipTypes]
AS
SELECT Relationship_Types.DESCRIPTION AS Description,Relationship_Types.RELATION_TYPE AS RelationType
  FROM Relationship_Types
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
CREATE VIEW [dbo].[vBoCsSalesHistory]
AS
SELECT Activity.ACTIVITY_TYPE AS ActivityType,Activity.AMOUNT AS Amount,Activity.CO_ID AS CompanyId,Activity.DESCRIPTION AS ProductName,Activity.ID,Activity.PRODUCT_CODE AS ProductCode,Activity.QUANTITY AS Quantity,Activity.SEQN AS SequenceNumber,Activity.SOURCE_CODE AS SourceCode,Activity.SOURCE_SYSTEM AS SourceSystem,Activity.TRANSACTION_DATE AS TransactionDate
  FROM Activity
 WHERE Activity.ACTIVITY_TYPE = 'SALES' AND Activity.SOURCE_SYSTEM='AR'
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
CREATE VIEW [dbo].[vBoCsSalutations]
AS
SELECT Name_Salutation.ID,Name_Salutation.SALUTATION_TEXT AS SalutationText,Name_Salutation.SALUTATION_TYPE AS SalutationCode
  FROM Name_Salutation
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
CREATE VIEW [dbo].[vBoCsSolicitorData]
AS
SELECT Name_Staff.DESCRIPTION AS Comments,Name_Staff.HOURS_PER_WEEK AS HoursPerWeek,Name_Staff.ID,Name_Staff.IS_SALESMAN AS IsSolicitor,Name_Staff.IS_VOLUNTEER AS IsVolunteer
  FROM Name_Staff
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
CREATE VIEW [dbo].[vBoCsStaffUser]
AS
SELECT Users.Disabled,Users.Password,Users.UserId,Users.AccessKeywords,Users.CheckTickler,Users.EditTypes,Users.IsCasualUser,Users.LevelCashAR,Users.LevelCert,Users.LevelDues,Users.LevelExpo,Users.LevelFundRaising,Users.LevelMeeting,Users.LevelMembership,Users.LevelOrderEntry,Users.LevelReferral,Users.LevelSC,Users.LevelSystem,Users.Signature,Users.StandardClosing1,Users.StandardClosing2
  FROM Users
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
CREATE VIEW [dbo].[vBoCsStateProvinceCodes]
AS
SELECT State_Codes.STATE_PROVINCE AS StateProvince,State_Codes.TITLE AS Title
  FROM State_Codes
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
CREATE VIEW [dbo].[vBoCsSubscriptions]
AS
SELECT Subscriptions.APPEAL_CODE AS AppealCode,Subscriptions.BALANCE AS Balance,Subscriptions.BEGIN_DATE AS BeginDate,Subscriptions.BILL_AMOUNT AS BillAmount,Subscriptions.BILL_COPIES AS BillCopies,Subscriptions.BILL_DATE AS BillDate,Subscriptions.BILL_THRU AS BillThrough,Subscriptions.BILL_TYPE AS BillType,Subscriptions.BT_ID AS BillToId,Subscriptions.CAMPAIGN_CODE AS CampaignCode,Subscriptions.CANCEL_REASON AS CancelReason,Subscriptions.COMPLIMENTARY AS Complimentary,Subscriptions.COPIES AS Copies,Subscriptions.COPIES_PAID AS CopiesPaid,Subscriptions.FAIR_MARKET_VALUE AS FairMarketValue,Subscriptions.FUTURE_COPIES AS FutureCopies,Subscriptions.FUTURE_CREDITS AS FutureCredits,Subscriptions.ID,Subscriptions.INVOICE_LINE_NUM AS InvoiceLineNumber,Subscriptions.INVOICE_REFERENCE_NUM AS InvoiceReferenceNumber,Subscriptions.IS_FR_ITEM AS IsFRItem,Subscriptions.LAST_ISSUE AS LastIssue,Subscriptions.LAST_ISSUE_DATE AS LastIssueDate,Subscriptions.LAST_PAID_THRU AS LastPaidThrough,Subscriptions.ORG_CODE AS EntityCode,Subscriptions.PAID_BEGIN AS PaidBegin,Subscriptions.PAID_THRU AS PaidThrough,Subscriptions.PAYMENT_AMOUNT AS PaymentAmount,Subscriptions.PAYMENT_DATE AS PaymentDate,Subscriptions.PREF_BILL AS BillAddressNumber,Subscriptions.PREF_MAIL AS MailAddressNumber,Subscriptions.PREVIOUS_BALANCE AS PreviousBalance,Subscriptions.PRIOR_YEARS AS PriorYears,Subscriptions.PROD_TYPE AS ProductType,Subscriptions.PRODUCT_CODE AS ProductCode,Subscriptions.REMINDER_COUNT AS ReminderCount,Subscriptions.REMINDER_DATE AS ReminderDate,Subscriptions.RENEW_MONTHS AS RenewMonths,Subscriptions.SOURCE_CODE AS SourceCode,Subscriptions.STATUS AS Status,Subscriptions.BILL_BEGIN AS BillBegin
  FROM Subscriptions
 WHERE Subscriptions.PROD_TYPE in ('DUES', 'SUB','SEC','MISC','VOL','CHAPT')
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCsSubscriptionsChapters]'))
    DROP VIEW [dbo].[vBoCsSubscriptionsChapters]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCsSubscriptionsChapters]
AS
SELECT Subscriptions.ID,Subscriptions.STATUS,Product.PRODUCT_CODE,Product.PRODUCT_MINOR
  FROM Product
	INNER JOIN Subscriptions
		ON Product.PRODUCT_CODE = Subscriptions.PRODUCT_CODE
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
CREATE VIEW [dbo].[vBoCsSystemParams]
AS
SELECT System_Params.LongValue,System_Params.ParameterName,System_Params.ShortValue
  FROM System_Params
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCsTerms]'))
    DROP VIEW [dbo].[vBoCsTerms]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCsTerms]
AS
SELECT Terms.DESCRIPTION,Terms.DISC_DAYS,Terms.DISC_PERCENT,Terms.DUE_DAYS,Terms.TERMS_CODE
  FROM Terms
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
CREATE VIEW [dbo].[vBoCsTransSoftCredit]
AS
SELECT Trans_SoftCredit.AMOUNT AS Amount,Trans_SoftCredit.FUNDRAISER_TYPE AS FundraiserType,Trans_SoftCredit.ORIGINATING_ACTIVITY_SEQN AS OriginatingActivitySeqn,Trans_SoftCredit.PERCENTAGE AS Percentage,Trans_SoftCredit.PRODUCT_CODE AS ProductCode,Trans_SoftCredit.SOFT_CREDIT_ID AS SoftCreditId,Trans_SoftCredit.TIME_STAMP AS TimeStamp,Trans_SoftCredit.TRANS_NUMBER AS TransactionNumber
  FROM Trans_SoftCredit
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
CREATE VIEW [dbo].[vBoCsWebSecurityGroup]
AS
SELECT Security_Groups.SECURITY_GROUP AS Name,Security_Groups.SECURITY_GROUP_DESCR AS Description
  FROM Security_Groups
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
CREATE VIEW [dbo].[vBoCsWebUser]
AS
SELECT Name_Security.EXPIRATION_DATE AS ExpirationDate,Name_Security.ID,Name_Security.LOGIN_DISABLED AS IsDisabled,Name_Security.WEB_LOGIN AS UserId,Name_Security_Groups.ID AS SecurityGroupID,Name_Security_Groups.SECURITY_GROUP AS SecurityGroup,Name_Security.UPDATED_BY AS UpdatedBy
  FROM Name_Security
	INNER JOIN Name_Security_Groups
		ON Name_Security.ID = Name_Security_Groups.ID
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vUDBOCultivatingFor]'))
    DROP VIEW [dbo].[vUDBOCultivatingFor]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE VIEW [dbo].[vUDBOCultivatingFor]
AS
SELECT s.RowID AS [ContactKey],
       CAST(MAX(CASE WHEN s.PropertyName = 'CultivationStage' THEN s.PropertyStringValue ELSE NULL END) AS nvarchar(80)) AS [CultivationStage],
       CAST(MAX(CASE WHEN s.PropertyName = 'EstimatedValue' THEN s.PropertyDecimalValue ELSE NULL END) AS decimal(19, 4)) AS [EstimatedValue],
       CAST(MAX(CASE WHEN s.PropertyName = 'GiftType' THEN s.PropertyStringValue ELSE NULL END) AS nvarchar(80)) AS [GiftType],
       CAST(MAX(CASE WHEN s.PropertyName = 'Note' THEN s.PropertyStringValue ELSE NULL END) AS nvarchar(400)) AS [Note],
       MAX(CASE WHEN s.PropertyName = 'PlannedAskDate' THEN s.PropertyDateTimeValue ELSE NULL END) AS [PlannedAskDate],
       CAST(MAX(CASE WHEN s.PropertyName = 'Quality' THEN s.PropertyStringValue ELSE NULL END) AS nvarchar(200)) AS [Quality]
  FROM [dbo].[UserDefinedSingleInstanceProperty] s
 WHERE s.TableName = 'CultivatingFor'
 GROUP BY s.RowID

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCultivatingFor]'))
    DROP VIEW [dbo].[vBoCultivatingFor]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCultivatingFor]
AS
SELECT vUDBOCultivatingFor.ContactKey,vUDBOCultivatingFor.CultivationStage,vUDBOCultivatingFor.EstimatedValue,vUDBOCultivatingFor.GiftType,vUDBOCultivatingFor.Note,vUDBOCultivatingFor.PlannedAskDate,vUDBOCultivatingFor.Quality
  FROM vUDBOCultivatingFor
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vUDMBOCultivationActivity]'))
    DROP VIEW [dbo].[vUDMBOCultivationActivity]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE VIEW [dbo].[vUDMBOCultivationActivity]
AS
SELECT m.RowID AS [ContactKey], m.RowSequence as [Ordinal],
       CAST(MAX(CASE WHEN m.PropertyName = 'FollowUpNote' THEN m.PropertyStringValue ELSE NULL END) AS nvarchar(400)) AS [FollowUpNote],
       MAX(CASE WHEN m.PropertyName = 'FollowUpDate' THEN m.PropertyDateTimeValue ELSE NULL END) AS [FollowUpDate],
       CAST(MAX(CASE WHEN m.PropertyName = 'Note' THEN m.PropertyStringValue ELSE NULL END) AS nvarchar(400)) AS [Note],
       MAX(CASE WHEN m.PropertyName = 'Date' THEN m.PropertyDateTimeValue ELSE NULL END) AS [Date],
       CAST(MAX(CASE WHEN m.PropertyName = 'TypeOfActivity' THEN m.PropertyStringValue ELSE NULL END) AS nvarchar(80)) AS [TypeOfActivity]
  FROM [dbo].[UserDefinedMultiInstanceProperty] m
 WHERE m.TableName = 'CultivationActivity'
 GROUP BY m.RowID, m.RowSequence

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoCultivationActivity]'))
    DROP VIEW [dbo].[vBoCultivationActivity]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoCultivationActivity]
AS
SELECT vUDMBOCultivationActivity.ContactKey,vUDMBOCultivationActivity.Ordinal,vUDMBOCultivationActivity.FollowUpNote,vUDMBOCultivationActivity.FollowUpDate,vUDMBOCultivationActivity.Note,vUDMBOCultivationActivity.Date,vUDMBOCultivationActivity.TypeOfActivity
  FROM vUDMBOCultivationActivity
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
CREATE VIEW [dbo].[vBoCultureRef]
AS
SELECT CultureRef.CultureCode,CultureRef.CultureDesc
  FROM CultureRef
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
CREATE VIEW [dbo].[vBoCustomerExperience]
AS
SELECT CustomerExperience.CustomerExperienceKey,CustomerExperience.CustomerExperienceNote AS Note,CustomerExperience.CustomerExperienceStatusCode,CustomerExperience.CreatedByUserKey,CustomerExperience.CreatedOn,CustomerExperience.ContactKey
  FROM CustomerExperience
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
CREATE VIEW [dbo].[vBoCustomerExperienceStatus]
AS
SELECT CustomerExperienceStatusRef.CustomerExperienceStatusCode,CustomerExperienceStatusRef.CustomerExperienceStatusName AS Name
  FROM CustomerExperienceStatusRef
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
CREATE VIEW [dbo].[vBoCustomerExperienceStatusChange]
AS
SELECT CustomerExperienceStatusChange.CreatedByUserKey,CustomerExperienceStatusChange.CreatedOn,CustomerExperienceStatusChange.CustomerExperienceKey,CustomerExperienceStatusChange.CustomerExperienceStatusChangeKey,CustomerExperienceStatusChange.CustomerExperienceStatusChangeNote,CustomerExperienceStatusChange.CustomerExperienceStatusCode,CustomerExperienceStatusChange.StatusChangedOn,CustomerExperienceStatusChange.UpdatedByUserKey,CustomerExperienceStatusChange.UpdatedOn,CustomerExperienceStatusChange.StatusChangedContactKey
  FROM CustomerExperienceStatusChange
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
	CASE WHEN [dbo].[CertificationModuleRegistration].AvailableUnits IS NULL
	THEN [dbo].[CertificationModule].NumberOfUnits 
	ELSE [dbo].[CertificationModuleRegistration].AvailableUnits 
	END AS NumberOfUnits,
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
       [dbo].[Program].[ExperienceUnitKey], 
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
       [dbo].[vNetContact].[Company]
 FROM [dbo].[OfferedCustomerExperience] 
      INNER JOIN [dbo].[Offering] ON [dbo].[OfferedCustomerExperience].[OfferingKey] = [dbo].[Offering].[OfferingKey] 
      INNER JOIN [dbo].[ExperienceDefinition] ON [dbo].[Offering].[ExperienceDefinitionKey] = [dbo].[ExperienceDefinition].[ExperienceDefinitionKey] 
      INNER JOIN [dbo].[Program] ON [dbo].[ExperienceDefinition].[ProgramKey] = [dbo].[Program].[ProgramKey] 
      LEFT OUTER JOIN [dbo].[Location] ON [dbo].[Offering].[LocationKey] = [dbo].[Location].[LocationKey] 
      LEFT OUTER JOIN [dbo].[vNetContact] ON [dbo].[Offering].[ContactKey] = [dbo].[vNetContact].[ContactKey]



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
      [dbo].[ExperienceDefinition].[ExperienceDefinitionCode], 
      [dbo].[ExperienceDefinition].[ExperienceDefinitionDesc], 
      CASE WHEN [dbo].[ExperienceDefinition].[ExperienceDefinitionName] IS NULL
      THEN [dbo].[CertificationModule].[CertificationModuleName]
      ELSE [dbo].[ExperienceDefinition].[ExperienceDefinitionName]
      END AS ExperienceDefinitionName,    
      CASE WHEN [dbo].[ExperienceDefinition].[NumberOfUnits] IS NULL
      THEN [dbo].[CertificationModule].NumberOfUnits 
      ELSE [dbo].[ExperienceDefinition].[NumberOfUnits] 
      END AS NumberOfUnits,   
      CASE WHEN [dbo].[ExperienceDefinition].[RequiresGradeFlag] IS NULL
      THEN [dbo].[CertificationModule].[RequiresGradeFlag]
      ELSE [dbo].[ExperienceDefinition].[RequiresGradeFlag]
      END AS RequiresGradeFlag,     
      CASE WHEN [dbo].[ExperienceDefinition].[RequiresApprovalFlag] IS NULL
      THEN [dbo].[CertificationModule].[RequiresApprovalFlag]
      ELSE [dbo].[ExperienceDefinition].[RequiresApprovalFlag]
      END AS RequiresApprovalFlag,  
      [dbo].[ExperienceDefinition].[ExperienceDefinitionLocation],
      [dbo].[UnofferedCustomerExperience].[CompletionDate] AS 'ExperienceDefinitionDate', 
      [dbo].[ExperienceDefinition].[ExperienceDefinitionStatusCode], 
      CASE WHEN [dbo].[Program].[ProgramName] IS NULL
      THEN [dbo].[CertificationProgram].CertificationProgramName
      ELSE [dbo].[Program].[ProgramName]
      END AS ProgramName, 
      [dbo].[Program].[UserDefinedExperiencesFlag], 
      [dbo].[Program].[ExperienceUnitKey], 
      [dbo].[Program].[MinimumValue], 
      [dbo].[Program].[MaximumValue], 
      [dbo].[Program].[ProgramDescr], 
      [dbo].[Program].[ProgramStatusCode], 
      [dbo].[UnofferedCustomerExperience].[UnofferedCustomerExperienceKey], 
      CASE WHEN [dbo].[UnofferedCustomerExperience].[UnofferedCustomerExperienceGrade] IS NULL
      THEN [dbo].[GradeRef].[GradeValue]
      ELSE [dbo].[UnofferedCustomerExperience].[UnofferedCustomerExperienceGrade]
      END AS UnofferedCustomerExperienceGrade,  
      CASE WHEN [dbo].[Program].[ProgramKey] IS NULL
      THEN [dbo].[CertificationProgram].CertificationProgramKey
      ELSE [dbo].[Program].[ProgramKey]
      END AS ProgramKey

FROM 
      [dbo].[UnofferedCustomerExperience] 
            LEFT JOIN [dbo].[ExperienceDefinition] ON [dbo].[UnofferedCustomerExperience].[ExperienceDefinitionKey] = [dbo].[ExperienceDefinition].[ExperienceDefinitionKey] 
            LEFT JOIN [dbo].[CertificationModule] ON [dbo].[UnofferedCustomerExperience].[ExperienceDefinitionKey] = [dbo].[CertificationModule].CertificationModuleKey
            LEFT JOIN [dbo].[CertificationModuleRegistration] ON [dbo].[CertificationModuleRegistration].CustomerExperienceKey = [dbo].[UnofferedCustomerExperience].UnofferedCustomerExperienceKey
            LEFT JOIN [dbo].[CertificationProgramRegistration] ON [dbo].[CertificationProgramRegistration].[CertificationProgramRegistrationKey] = [dbo].[CertificationModuleRegistration].[CertificationProgramRegistrationKey] 
            LEFT JOIN [dbo].[CertificationProgram] ON [dbo].[CertificationProgramRegistration].[CertificationProgramKey] = [dbo].[CertificationProgram].[CertificationProgramKey] 
            LEFT JOIN [dbo].[Program] ON [dbo].[ExperienceDefinition].[ProgramKey] = [dbo].[Program].[ProgramKey]
            LEFT OUTER JOIN [dbo].[GradeRef] ON [dbo].[UnofferedCustomerExperience].[UnOfferedCustomerExperienceGradeKey] = [dbo].[GradeRef].[GradeKey]

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
	[dbo].[Program].[ExperienceUnitKey], 
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
CREATE VIEW [dbo].[vBoCustomerExperienceView]
AS
SELECT vCustomerExperiences.CustomerExperienceKey,vCustomerExperiences.DateExp,vCustomerExperiences.ExperienceName,vCustomerExperiences.Location,vCustomerExperiences.Program,vCustomerExperiences.Units,vCustomerExperiences.Grade,vCustomerExperiences.RequiresGradeFlag,vCustomerExperiences.ProgramKey
  FROM vCustomerExperiences
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
CREATE VIEW [dbo].[vBoDataType]
AS
SELECT DataTypeRef.DataTypeCode,DataTypeRef.DataTypeDesc AS Description,DataTypeRef.DataTypeName AS Name,DataTypeRef.DefaultHIControlTypeCode
  FROM DataTypeRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoDataVaultAttemptStatusRef]'))
    DROP VIEW [dbo].[vBoDataVaultAttemptStatusRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoDataVaultAttemptStatusRef]
AS
SELECT DataVaultAttemptStatusRef.DataVaultAttemptStatusCode,DataVaultAttemptStatusRef.DataVaultAttemptStatusDesc
  FROM DataVaultAttemptStatusRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vDataVaultBatchSummary]'))
    DROP VIEW [dbo].[vDataVaultBatchSummary]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE VIEW [dbo].[vDataVaultBatchSummary]
AS

SELECT l.CreatedOn, l.Status,
       c.FullName AS [CreatedBy],
       (SELECT COUNT(0) FROM DataVaultAttempt a WHERE a.DataVaultLogKey=l.DataVaultLogKey) AS [Submitted],
       (SELECT COUNT(0) FROM DataVaultAttempt a WHERE a.DataVaultLogKey=l.DataVaultLogKey AND Status IN ('F','C','U')) AS [Processed],
       (SELECT COUNT(0) FROM DataVaultAttempt a WHERE a.DataVaultLogKey=l.DataVaultLogKey AND Status IN ('C')) AS [Successful],
       (SELECT COUNT(0) FROM DataVaultAttempt a WHERE a.DataVaultLogKey=l.DataVaultLogKey AND Status IN ('F','U')) AS [Failed],   
       l.DataVaultLogKey,BatchKey   
 FROM DataVaultLog l
       INNER JOIN ContactMain c ON c.ContactKey = l.CreatedByUserKey


GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoDataVaultBatchSummary]'))
    DROP VIEW [dbo].[vBoDataVaultBatchSummary]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoDataVaultBatchSummary]
AS
SELECT vDataVaultBatchSummary.CreatedBy,vDataVaultBatchSummary.CreatedOn,vDataVaultBatchSummary.DataVaultLogKey,vDataVaultBatchSummary.Failed,vDataVaultBatchSummary.Processed,vDataVaultBatchSummary.Submitted,vDataVaultBatchSummary.Successful,vDataVaultBatchSummary.BatchKey,vDataVaultBatchSummary.Status
  FROM vDataVaultBatchSummary
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoDataVaultLog]'))
    DROP VIEW [dbo].[vBoDataVaultLog]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoDataVaultLog]
AS
SELECT DataVaultLog.BatchKey,DataVaultLog.BatchPart,DataVaultLog.CreatedByUserKey,DataVaultLog.CreatedOn,DataVaultLog.DataVaultLogKey,DataVaultLog.Status,DataVaultLog.UpdatedByUserKey,DataVaultLog.UpdatedOn
  FROM DataVaultLog
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoDataVaultLogAttempt]'))
    DROP VIEW [dbo].[vBoDataVaultLogAttempt]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoDataVaultLogAttempt]
AS
SELECT DataVaultAttempt.Attempt,DataVaultAttempt.DataVaultAttemptKey,DataVaultAttempt.DataVaultLogDetailKey,DataVaultAttempt.DataVaultLogKey,DataVaultAttempt.FailedMessage,DataVaultAttempt.Status
  FROM DataVaultAttempt
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoDataVaultLogDetail]'))
    DROP VIEW [dbo].[vBoDataVaultLogDetail]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoDataVaultLogDetail]
AS
SELECT DataVaultLogDetail.Balance,DataVaultLogDetail.DataVaultLogDetailKey,DataVaultLogDetail.InvoiceNumber,DataVaultLogDetail.LastAttempt,DataVaultLogDetail.PaymentToken
  FROM DataVaultLogDetail
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoDataVaultStatusRef]'))
    DROP VIEW [dbo].[vBoDataVaultStatusRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoDataVaultStatusRef]
AS
SELECT DataVaultStatusRef.DataVaultStatusCode,DataVaultStatusRef.DataVaultStatusDesc
  FROM DataVaultStatusRef
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
CREATE VIEW [dbo].[vBoDeploymentPackageRef]
AS
SELECT DeploymentPackageRef.DeploymentPackageCode,DeploymentPackageRef.DeploymentPackageDesc,DeploymentPackageRef.DocumentSystemPath
  FROM DeploymentPackageRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSoaItemAdditionalCharges]'))
    DROP VIEW [dbo].[vSoaItemAdditionalCharges]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
--Allow the projection of fake tax, freight and handling products so they can be displayed as invoice line items.
CREATE VIEW [dbo].[vSoaItemAdditionalCharges]
AS
SELECT 
       'ADDLCHARGES/TAX' AS [ItemId],
       'ADDLCHARGES/TAX' AS [ProductCode],
       'Tax' AS [Name],
       'Tax' AS [Description]
UNION
SELECT 
       'ADDLCHARGES/FREIGHT' AS [ItemId],
       'ADDLCHARGES/FREIGHT' AS [ProductCode],
       'Freight Charges' AS [Name],
       'Freight Charges' AS [Description]
UNION
SELECT 
       'ADDLCHARGES/HANDLING' AS [ItemId],
       'ADDLCHARGES/HANDLING' AS [ProductCode],
       'Handling Charges' AS [Name],
       'Handling Charges' AS [Description]

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
IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaItemEvent]') AND [name] = N'PK_vSoaItemEvent')
BEGIN
  CREATE UNIQUE CLUSTERED INDEX PK_vSoaItemEvent ON [dbo].[vSoaItemEvent] (ItemId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaItemEvent]') AND [name] = N'IX_vSoaItemEvent')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaItemEvent ON [dbo].[vSoaItemEvent] (ProductCode)
END
go


GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSoaItemMembershipGstIncKit]'))
    DROP VIEW [dbo].[vSoaItemMembershipGstIncKit]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE VIEW [dbo].[vSoaItemMembershipGstIncKit]
AS
    SELECT  p.[PRODUCT_CODE] + '_KIT' AS [ItemId],
            p.[PRODUCT_CODE] + '_KIT' AS [ProductCode],
            p.[PROD_TYPE] AS [ItemClass],
            'Kit' AS [ItemSetType],
            CONVERT(BIT,1) AS [IsComponentPriced],
            CONVERT(BIT,1) AS [IS_KIT],
            p.[PRODUCT_CODE] AS [PrimaryItem],
            g.[PRODUCT_CODE] AS [TaxItem]
      FROM  [dbo].[Product] p
            INNER JOIN [dbo].[Product] g ON p.[PRODUCT_CODE] + '_GST' = g.[PRODUCT_CODE]
                AND g.[PROD_TYPE] = p.[PROD_TYPE]
     WHERE  p.[PROD_TYPE] IN ( 'DUES', 'SUB', 'MISC', 'CHAPT', 'SEC')

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
  WITH PrimaryDuesItems(MemberType, ItemId) AS (    
    SELECT mt.[MEMBER_TYPE], mt.[DUES_CODE_1] FROM Member_Types mt WHERE DUES_CODE_1 != 'CHAPT%' AND DUES_CODE_1 != ''
    )  
-- This CTE identifies details about each Billing Cycle that is defined to be used for Join or Renewal
  ,BillingCycles(CycleName, IS_FOR_JOIN, IS_FOR_RENEW, CycleType) AS (
    SELECT [dc].[CYCLE_NAME], [dc].[IS_FOR_JOIN], [dc].[IS_FOR_RENEW],
            -- This property derives whether the billing cycle should be projected as a Membership or Subscription Product.
            -- If it does not meet the criteria for either, then this value will be NULL (i.e., it is not a valid as a Join/Renewal Item)
            CASE WHEN [dc].[MEM_TYPES] != '*ALL*' AND [dc].[MEM_TYPES] NOT LIKE '%,%' AND [dc].[MEM_TYPES] NOT LIKE ''
                    THEN CASE WHEN (EXISTS (SELECT Element 
                                             FROM asi_SplitString([dc].[PRODUCT_CODES], ',') 
                                            WHERE Element IN (SELECT ItemId FROM PrimaryDuesItems WHERE MemberType = [dc].[MEM_TYPES])
                                          ))
                                   OR ([dc].[INCLUDE_ALL_MEM_ITEMS] = 1 AND EXISTS (SELECT ItemId FROM PrimaryDuesItems WHERE MemberType = [dc].[MEM_TYPES]))
                                  THEN 'Membership'
                              ELSE CASE WHEN NOT EXISTS (SELECT Element FROM asi_SplitString([dc].[PRODUCT_CODES], ',') WHERE Element IN (SELECT ItemId FROM PrimaryDuesItems))
                                             AND [dc].[IS_FOR_JOIN] = 1 
                                             AND [dc].[INCLUDE_ALL_MEM_ITEMS] = 0 -- This is here to prevent Add Member Types cycles from projecting as Susbscription Joins
                                             AND EXISTS (SELECT * FROM SystemConfig WHERE ParameterName = 'Asi.Billing.EnableNonDuesSubscription' AND ParameterValue = CONVERT(Bit,1))
                                        THEN 'Subscription'
                                        ELSE CAST(NULL AS varchar(255))
                                   END
                          END
                 WHEN NOT EXISTS (SELECT Element FROM asi_SplitString([dc].[PRODUCT_CODES], ',') WHERE Element IN (SELECT ItemId FROM PrimaryDuesItems)) 
                        AND [dc].[IS_FOR_JOIN] = 1 
                        AND [dc].[INCLUDE_ALL_MEM_ITEMS] = 0 -- This is here to prevent Add Member Types cycles from projecting as Susbscription Joins
                        AND EXISTS (SELECT * FROM SystemConfig WHERE ParameterName = 'Asi.Billing.EnableNonDuesSubscription' AND ParameterValue = CONVERT(Bit,1))
                    THEN 'Subscription'
                 ELSE CAST(NULL AS varchar(255))
            END AS CycleType
      FROM [dbo].[DuesCycles] AS [dc] 
     WHERE [dc].[IS_FOR_JOIN] = 1
        OR [dc].[IS_FOR_RENEW] = 1  
    )
    SELECT  [p].[PRODUCT_CODE] AS [ItemId],
            [p].[PRODUCT_CODE] AS [ProductCode],
            [p].[TITLE] AS [Name],
            CAST(CASE WHEN [p].[WEB_DESC] IS NULL OR [p].[WEB_DESC] LIKE '' THEN [p].[DESCRIPTION]
                      ELSE [p].[WEB_DESC]
                 END AS VARCHAR(MAX)) AS [Description],
            CAST(NULL AS VARCHAR(50)) AS [TaxCategory],
            CASE
                WHEN [p].[PROD_TYPE] = 'SALES' THEN [p].[PROD_TYPE] + '-' + [p].[CATEGORY]
                ELSE [p].[PROD_TYPE]
            END AS [ItemClass],                     -- 02/2013 PJR added
            [p].[IMAGE_URL] AS [ImageURL],
            [p].[THUMBNAIL_URL] AS [ThumbnailURL],
            [p].[RENEW_MONTHS],
            [p].[STOCK_ITEM],
            [p].[UNIT_OF_MEASURE],
            [p].[WEIGHT],
            [p].[TAXABLE],
            [p].[TAX_BY_LOCATION],
            [p].[TAXCATEGORY_CODE],
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
            [p].[CAMPAIGN_CODE],
            CASE 
                WHEN [p].[PROD_TYPE] = 'MEETING' THEN
                    (SELECT TOP 1 [REG_CLASS_STORED_PROC] 
                        FROM [dbo].[Meet_Master] [mm] 
                        WHERE [mm].[MEETING] = [p].[PRODUCT_MAJOR]) 
                ELSE NULL
            END AS [RegistrantClassProcedure],
            CAST(NULL AS VARCHAR(50)) AS [ItemSetType],-- 2012/05/07 JHS Added to support BillingItemSets work
            NULL AS [MinimumAllowed],-- 2012/05/07 JHS Added to support BillingItemSets work
            NULL AS [MaximumAllowed],-- 2012/05/07 JHS Added to support BillingItemSets work
            [p].INCOME_ACCOUNT AS [IncomeAccountCode],                  -- 02/2013 PJR added
            [p].DEFERRED_INCOME_ACCOUNT AS [DeferredIncomeAccountCode], -- 02/2013 PJR added
            [p].INVENTORY_ACCOUNT AS [InventoryAccountCode],            -- 02/2013 PJR added
            [p].ADJUSTMENT_ACCOUNT AS [InventoryAdjustmentAccountCode], -- 02/2013 PJR added
            [p].COG_ACCOUNT AS [CostOfGoodsAccountCode],                -- 02/2013 PJR added
            [p].[PRICE_FROM_COMPONENTS] AS [IsComponentPriced],         -- 2014/04 BE added
            [p].[PUBLISH_START_DATE] AS [PublishStartDate],             -- 01/2014 SU added
            [P].[PUBLISH_END_DATE] AS [PublishEndDate],                -- 01/2014 SU added
            0 AS [DisplayOrder]
      FROM  [dbo].[Product] AS [p]
     WHERE  ( [p].[PROD_TYPE] IN ( 'SALES', 'GIFT', 'CERTIFY', 'MEETING' ) )
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
            NULL,
            NULL,
            NULL,
            NULL,
            CAST(NULL AS VARCHAR(50)) AS [ItemSetType],-- 2012/05/07 JHS Added to support BillingItemSets work
            NULL AS [MinimumAllowed],-- 2012/05/07 JHS Added to support BillingItemSets work
            NULL AS [MaximumAllowed],-- 2012/05/07 JHS Added to support BillingItemSets work
            NULL AS [IncomeAccountCode],                -- 02/2013 PJR added
            NULL AS [DeferredIncomeAccountCode],        -- 02/2013 PJR added
            NULL AS [InventoryAccountCode],             -- 02/2013 PJR added
            NULL AS [InventoryAdjustmentAccountCode],   -- 02/2013 PJR added
            NULL AS [CostOfGoodsAccountCode],           -- 02/2013 PJR added
            0 AS [IsComponentPriced],                -- 2014/04 BE added
            NULL AS [PublishStartDate],             -- 01/2014 SU added
            NULL AS [PublishEndDate],                -- 01/2014 SU added
            0 AS [DisplayOrder]
      FROM  [dbo].[vSoaItemEvent] WITH (NOEXPAND)
    UNION-- 2012/05/07 JHS Added to support BillingItemSets work
    -- Include all Membership Products that can be used as a component of membership billing
    SELECT  [p].[PRODUCT_CODE] AS [ItemId],
            [p].[PRODUCT_CODE] AS [ProductCode],
            [p].[TITLE] AS [Name],
            CAST(CASE WHEN [p].[WEB_DESC] IS NULL OR [p].[WEB_DESC] LIKE '' THEN [p].[DESCRIPTION]
                      ELSE [p].[WEB_DESC]
                 END AS VARCHAR(MAX)) AS [Description],
            CAST(NULL AS VARCHAR(50)) AS [TaxCategory],
            [p].[PROD_TYPE] AS [ItemClass],
            [p].[IMAGE_URL] AS [ImageURL],
            [p].[THUMBNAIL_URL] AS [ThumbnailURL],
            NULL AS [RENEW_MONTHS],
            NULL AS [STOCK_ITEM],
            NULL AS [UNIT_OF_MEASURE],
            NULL AS [WEIGHT],
            NULL AS [TAXABLE],
            NULL AS [TAX_BY_LOCATION],
            NULL AS [TAXCATEGORY_CODE],
            NULL AS [DECIMAL_POINTS],
            [p].[PRICE_1],
            [p].[PRICE_2],
            [p].[PRICE_3],
            NULL AS [COMPLIMENTARY],
            NULL AS [PST_TAXABLE],
            NULL AS [TAXABLE_VALUE],
            NULL AS [TAX_AUTHORITY],
            NULL AS [WEB_OPTION],
            NULL AS [IS_KIT],
            NULL AS [PREMIUM],
            NULL AS [FAIR_MARKET_VALUE],
            NULL AS [IS_FR_ITEM],
            NULL AS [APPEAL_CODE],
            NULL AS [CAMPAIGN_CODE],
            NULL AS [RegistrantClassProcedure],
            NULL AS [ItemSetType],
            NULL AS [MinimumAllowed],
            NULL AS [MaximumAllowed],
            [p].INCOME_ACCOUNT AS [IncomeAccountCode],                  -- 02/2013 PJR added
            [p].DEFERRED_INCOME_ACCOUNT AS [DeferredIncomeAccountCode], -- 02/2013 PJR added
            [p].INVENTORY_ACCOUNT AS [InventoryAccountCode],            -- 02/2013 PJR added
            [p].ADJUSTMENT_ACCOUNT AS [InventoryAdjustmentAccountCode], -- 02/2013 PJR added
            [p].COG_ACCOUNT AS [CostOfGoodsAccountCode],                -- 02/2013 PJR added
            0 AS [IsComponentPriced],                -- 2014/04 BE added
            NULL AS [PublishStartDate],             -- 01/2014 SU added
            NULL AS [PublishEndDate],                -- 01/2014 SU added
            0 AS [DisplayOrder]
      FROM  [dbo].[Product] AS [p]
     WHERE  ( [p].[PROD_TYPE] IN ( 'DUES', 'SUB', 'MISC', 'CHAPT', 'SEC', 'VOL' ) )
    UNION-- 2012/05/07 JHS Added to support BillingItemSets work
    -- Include all Membership Item Set Products for each Billing Cycle
    SELECT  UPPER(REPLACE([dc].[CycleName],' ','_')) + '/' + [pt].[PROD_TYPE] AS [ItemId],
            UPPER(REPLACE([dc].[CycleName],' ','_')) + '/' + [pt].[PROD_TYPE] AS [ProductCode], 
            [pt].[DESCRIPTION] AS [Name],
            --CAST(NULL  AS VARCHAR(MAX)) AS [Description], -- can't have text in indexed view. we can add this back below if we need to.
            '' AS [Description], -- no description available yet
            CAST(NULL AS VARCHAR(50)) AS [TaxCategory],            
            CASE WHEN [dc].[CycleType]='Membership' THEN 'MEMBERSHIP' ELSE 'SUBSCRIPTION' END AS [ItemClass],
            NULL AS [ImageURL],
            NULL AS [ThumbnailURL],
            NULL AS [RENEW_MONTHS],
            NULL AS [STOCK_ITEM],
            NULL AS [UNIT_OF_MEASURE],
            NULL AS [WEIGHT],
            NULL AS [TAXABLE],
            NULL AS [TAX_BY_LOCATION],
            NULL AS [TAXCATEGORY_CODE],
            NULL AS [DECIMAL_POINTS], 
            NULL AS [PRICE_1],
            NULL AS [PRICE_2],
            NULL AS [PRICE_3],
            NULL AS [COMPLIMENTARY],
            NULL AS [PST_TAXABLE],
            NULL AS [TAXABLE_VALUE],
            NULL AS [TAX_AUTHORITY],
            NULL AS [WEB_OPTION],
            NULL AS [IS_KIT],
            NULL AS [PREMIUM],
     NULL AS [FAIR_MARKET_VALUE],
            NULL AS [IS_FR_ITEM],
            NULL AS [APPEAL_CODE],
            NULL AS [CAMPAIGN_CODE],
            NULL AS [RegistrantClassProcedure],
            CASE WHEN PROD_TYPE='CHAPT' THEN 'PickOne' ELSE 'MenuOfOptions' END as [ItemSetType],
            0 AS [MinimumAllowed],
            CASE 
                WHEN pt.PROD_TYPE = 'CHAPT' THEN 1      -- 07/2013 JHS added to support restriction on only one Chapter
                ELSE 0                                  
            END AS [MaximumAllowed],
            NULL AS [IncomeAccountCode],                -- 02/2013 PJR added
            NULL AS [DeferredIncomeAccountCode],        -- 02/2013 PJR added
            NULL AS [InventoryAccountCode],             -- 02/2013 PJR added
            NULL AS [InventoryAdjustmentAccountCode],   -- 02/2013 PJR added
            NULL AS [CostOfGoodsAccountCode],           -- 02/2013 PJR added
            0 AS [IsComponentPriced],                   -- 2014/04 BE added
            NULL AS [PublishStartDate],             -- 01/2014 SU added
            NULL AS [PublishEndDate],                -- 01/2014 SU added
            CASE WHEN PROD_TYPE='DUES' THEN 1
                 WHEN PROD_TYPE='CHAPT' THEN 2
                 WHEN PROD_TYPE='MISC' THEN 3
                 WHEN PROD_TYPE='SEC' THEN 4
                 WHEN PROD_TYPE='SUB' THEN 5
                 WHEN PROD_TYPE='VOL' THEN 6
                 ELSE 0 END AS [DisplayOrder] -- use this in asc order to get proper order
      FROM  [dbo].[Product_Type] AS [pt]
      CROSS JOIN  BillingCycles AS [dc]
     WHERE  [pt].[PROD_TYPE] IN ( 'DUES', 'SUB', 'MISC', 'CHAPT', 'SEC', 'VOL' )
     UNION --need one for each dues cycle, for example: ItemId:MEMBERSHIP-JOIN_NOW, product_code:Join_Now, name:Join Now, descr:Join Now
    SELECT  'MEMBERSHIP-' + UPPER(REPLACE([dc].[CycleName],' ','_')) AS [ItemId],
            UPPER(REPLACE([dc].[CycleName],' ','_')) AS [ProductCode],
            [dc].[CycleName] AS [Name], -- [NAME] must use [dc].[CYCLE_NAME] for ItemLinqDefinition to work
            '' AS [Description], -- no description available yet
            NULL AS [TaxCategory],
            'MEMBERSHIP' AS [ItemClass],
            NULL AS [ImageURL],
            NULL AS [ThumbnailURL],
            NULL AS [RENEW_MONTHS],
            NULL AS [STOCK_ITEM],
            NULL AS [UNIT_OF_MEASURE],
            NULL AS [WEIGHT],
            NULL AS [TAXABLE],
            NULL AS [TAX_BY_LOCATION],
            NULL AS [TAXCATEGORY_CODE],
            NULL AS [DECIMAL_POINTS],
            NULL AS [PRICE_1],
            NULL AS [PRICE_2],
            NULL AS [PRICE_3],
            NULL AS [COMPLIMENTARY],
            NULL AS [PST_TAXABLE],
            NULL AS [TAXABLE_VALUE],
            NULL AS [TAX_AUTHORITY],
            NULL AS [WEB_OPTION],
            NULL AS [IS_KIT],
            NULL AS [PREMIUM],
            NULL AS [FAIR_MARKET_VALUE],
            NULL AS [IS_FR_ITEM],
            NULL AS [APPEAL_CODE],
            NULL AS [CAMPAIGN_CODE],
            NULL AS [RegistrantClassProcedure],
            'MenuOfOptions' as [ItemSetType],
            0 as [MinimumAllowed],
            0 as [MaximumAllowed],
            NULL AS [IncomeAccountCode],                -- 02/2013 PJR added
            NULL AS [DeferredIncomeAccountCode],        -- 02/2013 PJR added
            NULL AS [InventoryAccountCode],             -- 02/2013 PJR added
            NULL AS [InventoryAdjustmentAccountCode],   -- 02/2013 PJR added
            NULL AS [CostOfGoodsAccountCode],           -- 02/2013 PJR added
            0 AS [IsComponentPriced],                   -- 2014/04 BE added
            NULL AS [PublishStartDate],             -- 01/2014 SU added
            NULL AS [PublishEndDate],                -- 01/2014 SU added
            0 AS [DisplayOrder]
      FROM  BillingCycles AS [dc]
     WHERE  [dc].[CycleType] = 'Membership' 
    
     UNION 
    
    -- This section projects any Billing Cycle that meets the criteria to be a valid SUBSCRIPTION ItemSet
    SELECT  'SUBSCRIPTION-' + UPPER(REPLACE([dc].[CycleName],' ','_')) AS [ItemId],
            UPPER(REPLACE([dc].[CycleName],' ','_')) AS [ProductCode],
            [dc].[CycleName] AS [Name], -- [NAME] must use [dc].[CYCLE_NAME] for ItemLinqDefinition to work
            '' AS [Description], -- no description available yet
            NULL AS [TaxCategory],
            'SUBSCRIPTION' AS [ItemClass],
            NULL AS [ImageURL],
            NULL AS [ThumbnailURL],
            NULL AS [RENEW_MONTHS],
            NULL AS [STOCK_ITEM],
            NULL AS [UNIT_OF_MEASURE],
            NULL AS [WEIGHT],
            NULL AS [TAXABLE],
            NULL AS [TAX_BY_LOCATION],
            NULL AS [TAXCATEGORY_CODE],
            NULL AS [DECIMAL_POINTS],
            NULL AS [PRICE_1],
            NULL AS [PRICE_2],
            NULL AS [PRICE_3],
            NULL AS [COMPLIMENTARY],
            NULL AS [PST_TAXABLE],
            NULL AS [TAXABLE_VALUE],
            NULL AS [TAX_AUTHORITY],
            NULL AS [WEB_OPTION],
            NULL AS [IS_KIT],
            NULL AS [PREMIUM],
            NULL AS [FAIR_MARKET_VALUE],
            NULL AS [IS_FR_ITEM],
            NULL AS [APPEAL_CODE],
            NULL AS [CAMPAIGN_CODE],
            NULL AS [RegistrantClassProcedure],
            'MenuOfOptions' as [ItemSetType],
            0 as [MinimumAllowed],
            0 as [MaximumAllowed],
            NULL AS [IncomeAccountCode],                -- 02/2013 PJR added
            NULL AS [DeferredIncomeAccountCode],        -- 02/2013 PJR added
            NULL AS [InventoryAccountCode],             -- 02/2013 PJR added
            NULL AS [InventoryAdjustmentAccountCode],   -- 02/2013 PJR added
            NULL AS [CostOfGoodsAccountCode],           -- 02/2013 PJR added
            0 AS [IsComponentPriced],                   -- 2014/04 BE added
            NULL AS [PublishStartDate],             -- 01/2014 SU added
            NULL AS [PublishEndDate],                -- 01/2014 SU added
            0 AS [DisplayOrder]
      FROM  BillingCycles AS [dc]
     WHERE  [dc].[CycleType] = 'Subscription'
     UNION  -- Added 12/17/2012 by JHS to support Join Now Billings
    SELECT  UPPER(REPLACE([dc].[CycleName],' ','_')) + '/' + [p].[PRODUCT_CODE] AS [ItemId],
            UPPER(REPLACE([dc].[CycleName],' ','_')) + '/' + [p].[PRODUCT_CODE] AS [ProductCode],
            [p].[TITLE] AS [Name],
            CAST(CASE WHEN [p].[WEB_DESC] IS NULL OR [p].[WEB_DESC] LIKE '' THEN [p].[DESCRIPTION]
                ELSE [p].[WEB_DESC]
                 END AS VARCHAR(MAX)) AS [Description],
            CAST(NULL AS VARCHAR(50)) AS [TaxCategory],
            [p].[PROD_TYPE] AS [ItemClass],
            [p].[IMAGE_URL] AS [ImageURL],
            [p].[THUMBNAIL_URL] AS [ThumbnailURL],
            NULL AS [RENEW_MONTHS],
            NULL AS [STOCK_ITEM],
            NULL AS [UNIT_OF_MEASURE],
            NULL AS [WEIGHT],
            NULL AS [TAXABLE],
            NULL AS [TAX_BY_LOCATION],
            NULL AS [TAXCATEGORY_CODE],
            NULL AS [DECIMAL_POINTS],
            [p].[PRICE_1],
            [p].[PRICE_2],
            [p].[PRICE_3],
            NULL AS [COMPLIMENTARY],
            NULL AS [PST_TAXABLE],
            NULL AS [TAXABLE_VALUE],
            NULL AS [TAX_AUTHORITY],
            NULL AS [WEB_OPTION],
            NULL AS [IS_KIT],
            NULL AS [PREMIUM],
            NULL AS [FAIR_MARKET_VALUE],
            NULL AS [IS_FR_ITEM],
            NULL AS [APPEAL_CODE],
            NULL AS [CAMPAIGN_CODE],
            NULL AS [RegistrantClassProcedure],
            NULL AS [ItemSetType],
            CASE 
                WHEN p.PROD_TYPE = 'DUES' THEN 1
                ELSE 0
            END as [MinimumAllowed],
            CASE 
                WHEN p.PROD_TYPE = 'DUES' THEN 1
                ELSE 0
            END as [MaximumAllowed],
            [p].INCOME_ACCOUNT AS [IncomeAccountCode],                  -- 02/2013 PJR added
            [p].DEFERRED_INCOME_ACCOUNT AS [DeferredIncomeAccountCode], -- 02/2013 PJR added
            [p].INVENTORY_ACCOUNT AS [InventoryAccountCode],            -- 02/2013 PJR added
            [p].ADJUSTMENT_ACCOUNT AS [InventoryAdjustmentAccountCode], -- 02/2013 PJR added
            [p].COG_ACCOUNT AS [CostOfGoodsAccountCode],                -- 02/2013 PJR added
            0 AS [IsComponentPriced],                   -- 2014/04 BE added
            NULL AS [PublishStartDate],             -- 01/2014 SU added
            NULL AS [PublishEndDate],                -- 01/2014 SU added
            0 AS [DisplayOrder]
      FROM  [dbo].[Product] AS [p]
      CROSS JOIN  BillingCycles AS [dc] 
     WHERE  ( [p].[PROD_TYPE] IN ( 'DUES', 'SUB', 'MISC', 'CHAPT', 'SEC', 'VOL' ) )
     UNION  -- Added 12/5/2013 JHS to support Additional Charges Items needed for Invoice projections 
    SELECT  [ItemId],
            [ProductCode],
            [Name],
            [Description],
            NULL AS [TaxCategory],
            'ADDLCHARGES' AS [ItemClass],
            NULL AS [ImageURL],
            NULL AS [ThumbnailURL],
            NULL AS [RENEW_MONTHS],
            NULL AS [STOCK_ITEM],
            NULL AS [UNIT_OF_MEASURE],
            NULL AS [WEIGHT],
            NULL AS [TAXABLE],
            NULL AS [TAX_BY_LOCATION],
            NULL AS [TAXCATEGORY_CODE],
            NULL AS [DECIMAL_POINTS],
            NULL AS [PRICE_1],
            NULL AS [PRICE_2],
            NULL AS [PRICE_3],
            NULL AS [COMPLIMENTARY],
            NULL AS [PST_TAXABLE],
            NULL AS [TAXABLE_VALUE],
            NULL AS [TAX_AUTHORITY],
            NULL AS [WEB_OPTION],
            NULL AS [IS_KIT],
            NULL AS [PREMIUM],
            NULL AS [FAIR_MARKET_VALUE],
            NULL AS [IS_FR_ITEM],
            NULL AS [APPEAL_CODE],
            NULL AS [CAMPAIGN_CODE],
            NULL AS [RegistrantClassProcedure],
            CAST(NULL AS VARCHAR(50)) AS [ItemSetType],
            NULL AS [MinimumAllowed],
            NULL AS [MaximumAllowed],
            NULL AS [IncomeAccountCode],
            NULL AS [DeferredIncomeAccountCode],
            NULL AS [InventoryAccountCode], 
            NULL AS [InventoryAdjustmentAccountCode],
            NULL AS [CostOfGoodsAccountCode],
            0 AS [IsComponentPriced],
            NULL AS [PublishStartDate],             -- 01/2014 SU added
            NULL AS [PublishEndDate],                -- 01/2014 SU added
            0 AS [DisplayOrder]
      FROM  [dbo].[vSoaItemAdditionalCharges]
     UNION 
    SELECT  UPPER(REPLACE([dc].[CycleName],' ','_')) + '/' + [k].[ItemId] AS [ItemId],
            UPPER(REPLACE([dc].[CycleName],' ','_')) + '/' + [k].[ProductCode] AS [ProductCode],
            [p].[TITLE] AS [Name],
            CAST(CASE WHEN [p].[WEB_DESC] IS NULL OR [p].[WEB_DESC] LIKE '' THEN [p].[DESCRIPTION]
                ELSE [p].[WEB_DESC]
                 END AS VARCHAR(MAX)) AS [Description],
            CAST(NULL AS VARCHAR(50)) AS [TaxCategory],
            [p].[PROD_TYPE] AS [ItemClass],
            [p].[IMAGE_URL] AS [ImageURL],
            [p].[THUMBNAIL_URL] AS [ThumbnailURL],
            NULL AS [RENEW_MONTHS],
            NULL AS [STOCK_ITEM],
            NULL AS [UNIT_OF_MEASURE],
            NULL AS [WEIGHT],
            NULL AS [TAXABLE],
            NULL AS [TAX_BY_LOCATION],
            NULL AS [TAXCATEGORY_CODE],
            NULL AS [DECIMAL_POINTS],
            NULL AS [PRICE_1],
            NULL AS [PRICE_2],
            NULL AS [PRICE_3],
            NULL AS [COMPLIMENTARY],
            NULL AS [PST_TAXABLE],
            NULL AS [TAXABLE_VALUE],
            NULL AS [TAX_AUTHORITY],
            NULL AS [WEB_OPTION],
            CAST(1 AS BIT) AS [IS_KIT],
            NULL AS [PREMIUM],
            NULL AS [FAIR_MARKET_VALUE],
            NULL AS [IS_FR_ITEM],
            NULL AS [APPEAL_CODE],
            NULL AS [CAMPAIGN_CODE],
            NULL AS [RegistrantClassProcedure],
            'Kit' AS [ItemSetType],
            CASE 
                WHEN p.PROD_TYPE = 'DUES' THEN 1
                ELSE 0
            END as [MinimumAllowed],
            CASE 
                WHEN p.PROD_TYPE = 'DUES' THEN 1
                ELSE 0
            END as [MaximumAllowed],
            NULL AS [IncomeAccountCode],
            NULL AS [DeferredIncomeAccountCode],
            NULL AS [InventoryAccountCode],
            NULL AS [InventoryAdjustmentAccountCode],
            NULL AS [CostOfGoodsAccountCode],
            CAST(1 AS BIT) AS [IsComponentPriced],
            NULL AS [PublishStartDate],
            NULL AS [PublishEndDate],
            0 AS [DisplayOrder]
      FROM  [dbo].[vSoaItemMembershipGstIncKit] AS [k]
      INNER JOIN [dbo].[Product] AS [p] ON [k].[PrimaryItem] = [p].[PRODUCT_CODE]
      CROSS JOIN BillingCycles AS [dc] 


GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoDiscountableItem]'))
    DROP VIEW [dbo].[vBoDiscountableItem]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoDiscountableItem]
AS
SELECT vSoaItem.Description,vSoaItem.IS_KIT,vSoaItem.IsComponentPriced,vSoaItem.ItemClass,vSoaItem.ItemId,vSoaItem.Name,vSoaItem.ProductCode,vSoaItem.WEB_OPTION
  FROM vSoaItem
 WHERE (ItemClass='MEETING' OR ItemClass LIKE 'SALES-%') AND NOT (IS_KIT = 1 AND IsComponentPriced != 0)
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
-- ItemClass is a projection of the Product_Cat table (soft-coded Item Classes in v10 code base) for SALES items combined with a
-- defined list of hard-coded Item Classes used for specific non-SALES items. Only SALES items (ItemClassId LIKE 'SALES-%') entries
-- should be exposed in the Item Definition UI for item class.

  -- SALES Items --
SELECT  'SALES-' + [pc].[PRODUCT_CATEGORY] AS [ItemClassId],
        [pc].[DESCRIPTION] AS [Name],
        [pc].[DESCRIPTION] AS [Description],
        [pc].[STOCK_ITEM] AS [HasPhysicalInventory],            -- Added to support ItemDefinition default values
        CAST(CASE WHEN [pc].[TAXABLE] = 0 THEN 'Non-Taxable'
                  ELSE 'Taxable'
              END AS VARCHAR(50)) AS [TaxCategory],             -- Added to support ItemDefinition default values
        [pc].[INCOME_ACCOUNT] as [IncomeAccount],               -- Added to support ItemDefinition default values
        
        [pc].[INVENTORY_ACCOUNT] as [InventoryAccount],         -- Added to support future ItemDefinition default values
        [pc].[COG_ACCOUNT] as [CostOfGoodsAccount],             -- Added to support future ItemDefinition default values
        [pc].[ADJUSTMENTS_ACCOUNT] as [AdjustmentsAccount],      -- Added to support future ItemDefinition default values
        CAST(NULL AS VARCHAR(50)) AS [DeferredIncomeAccount]    -- Added to support event function item default values
  FROM  Product_Cat pc

UNION
  -- non-SALES Items --
SELECT 'CERTIFY' AS ItemClassId, 'Certification' AS Name, 'Certification' AS Description, 
        CAST(0 AS BIT) AS [HasPhysicalInventory], CAST(NULL AS VARCHAR(50)) AS [TaxCategory], CAST(NULL AS VARCHAR(50)) AS [IncomeAccount], 
        CAST(NULL AS VARCHAR(50)) AS [InventoryAccount], CAST(NULL AS VARCHAR(50)) AS [CostOfGoodsAccount], CAST(NULL AS VARCHAR(50)) AS [AdjustmentsAccount],
        CAST(NULL AS VARCHAR(50)) AS [DeferredIncomeAccount]
UNION
SELECT 'CHAPT' AS ItemClassId, 'Chapter' AS Name, 'Chapter' AS Description, 
        CAST(0 AS BIT) AS [HasPhysicalInventory], CAST(NULL AS VARCHAR(50)) AS [TaxCategory], CAST(NULL AS VARCHAR(50)) AS [IncomeAccount], 
        CAST(NULL AS VARCHAR(50)) AS [InventoryAccount], CAST(NULL AS VARCHAR(50)) AS [CostOfGoodsAccount], CAST(NULL AS VARCHAR(50)) AS [AdjustmentsAccount],
        CAST(NULL AS VARCHAR(50)) AS [DeferredIncomeAccount]
UNION
SELECT 'DUES' AS ItemClassId, 'Dues' AS Name, 'Dues' AS Description, 
        CAST(0 AS BIT) AS [HasPhysicalInventory], CAST(NULL AS VARCHAR(50)) AS [TaxCategory], CAST(NULL AS VARCHAR(50)) AS [IncomeAccount], 
        CAST(NULL AS VARCHAR(50)) AS [InventoryAccount], CAST(NULL AS VARCHAR(50)) AS [CostOfGoodsAccount], CAST(NULL AS VARCHAR(50)) AS [AdjustmentsAccount],
        CAST(NULL AS VARCHAR(50)) AS [DeferredIncomeAccount]
UNION
SELECT 'EVENT' AS ItemClassId, 'Event' AS Name, 'Event' AS Description, 
        CAST(0 AS BIT) AS [HasPhysicalInventory], CAST(NULL AS VARCHAR(50)) AS [TaxCategory], CAST(NULL AS VARCHAR(50)) AS [IncomeAccount], 
        CAST(NULL AS VARCHAR(50)) AS [InventoryAccount], CAST(NULL AS VARCHAR(50)) AS [CostOfGoodsAccount], CAST(NULL AS VARCHAR(50)) AS [AdjustmentsAccount],
        CAST(NULL AS VARCHAR(50)) AS [DeferredIncomeAccount]
UNION
SELECT 'GIFT' AS ItemClassId, 'Gift' AS Name, 'Gift' AS Description, 
        CAST(0 AS BIT) AS [HasPhysicalInventory], CAST(NULL AS VARCHAR(50)) AS [TaxCategory], CAST(NULL AS VARCHAR(50)) AS [IncomeAccount], 
        CAST(NULL AS VARCHAR(50)) AS [InventoryAccount], CAST(NULL AS VARCHAR(50)) AS [CostOfGoodsAccount], CAST(NULL AS VARCHAR(50)) AS [AdjustmentsAccount],
        CAST(NULL AS VARCHAR(50)) AS [DeferredIncomeAccount]
UNION
SELECT 'MISC' AS ItemClassId, 'Miscellaneous' AS Name, 'Miscellaneous' AS Description, 
        CAST(0 AS BIT) AS [HasPhysicalInventory], CAST(NULL AS VARCHAR(50)) AS [TaxCategory], CAST(NULL AS VARCHAR(50)) AS [IncomeAccount], 
        CAST(NULL AS VARCHAR(50)) AS [InventoryAccount], CAST(NULL AS VARCHAR(50)) AS [CostOfGoodsAccount], CAST(NULL AS VARCHAR(50)) AS [AdjustmentsAccount],
        CAST(NULL AS VARCHAR(50)) AS [DeferredIncomeAccount]
UNION
SELECT 'SEC' AS ItemClassId, 'Section' AS Name, 'Section' AS Description, 
        CAST(0 AS BIT) AS [HasPhysicalInventory], CAST(NULL AS VARCHAR(50)) AS [TaxCategory], CAST(NULL AS VARCHAR(50)) AS [IncomeAccount], 
        CAST(NULL AS VARCHAR(50)) AS [InventoryAccount], CAST(NULL AS VARCHAR(50)) AS [CostOfGoodsAccount], CAST(NULL AS VARCHAR(50)) AS [AdjustmentsAccount],
        CAST(NULL AS VARCHAR(50)) AS [DeferredIncomeAccount]
UNION
SELECT 'SUB' AS ItemClassId, 'Subscription' AS Name, 'Subscription' AS Description, 
        CAST(0 AS BIT) AS [HasPhysicalInventory], CAST(NULL AS VARCHAR(50)) AS [TaxCategory], CAST(NULL AS VARCHAR(50)) AS [IncomeAccount], 
        CAST(NULL AS VARCHAR(50)) AS [InventoryAccount], CAST(NULL AS VARCHAR(50)) AS [CostOfGoodsAccount], CAST(NULL AS VARCHAR(50)) AS [AdjustmentsAccount],
        CAST(NULL AS VARCHAR(50)) AS [DeferredIncomeAccount]
UNION
SELECT 'VOL' AS ItemClassId, 'Voluntary' AS Name, 'Voluntary' AS Description, 
        CAST(0 AS BIT) AS [HasPhysicalInventory], CAST(NULL AS VARCHAR(50)) AS [TaxCategory], CAST(NULL AS VARCHAR(50)) AS [IncomeAccount], 
        CAST(NULL AS VARCHAR(50)) AS [InventoryAccount], CAST(NULL AS VARCHAR(50)) AS [CostOfGoodsAccount], CAST(NULL AS VARCHAR(50)) AS [AdjustmentsAccount],
        CAST(NULL AS VARCHAR(50)) AS [DeferredIncomeAccount]
UNION
SELECT 'MEETING' AS ItemClassId, 'Event Function' AS Name, 'Event Function' AS Description, 
        CAST(0 AS BIT) AS [HasPhysicalInventory], CAST(NULL AS VARCHAR(50)) AS [TaxCategory], CAST(NULL AS VARCHAR(50)) AS [IncomeAccount], 
        CAST(NULL AS VARCHAR(50)) AS [InventoryAccount], CAST(NULL AS VARCHAR(50)) AS [CostOfGoodsAccount], CAST(NULL AS VARCHAR(50)) AS [AdjustmentsAccount],
        CAST(NULL AS VARCHAR(50)) AS [DeferredIncomeAccount]
UNION
SELECT 'MEMBERSHIP' AS ItemClassId, 'Membership' AS Name, 'Membership' AS Description, 
        CAST(0 AS BIT) AS [HasPhysicalInventory], CAST(NULL AS VARCHAR(50)) AS [TaxCategory], CAST(NULL AS VARCHAR(50)) AS [IncomeAccount], 
        CAST(NULL AS VARCHAR(50)) AS [InventoryAccount], CAST(NULL AS VARCHAR(50)) AS [CostOfGoodsAccount], CAST(NULL AS VARCHAR(50)) AS [AdjustmentsAccount],
        CAST(NULL AS VARCHAR(50)) AS [DeferredIncomeAccount]
-- This section is added to support projecting certain Billing Cycles as SUBSCRIPTION Items
UNION
SELECT 'SUBSCRIPTION' AS ItemClassId, 'Subscription' AS Name, 'Subscription' AS Description, 
        CAST(0 AS BIT) AS [HasPhysicalInventory], CAST(NULL AS VARCHAR(50)) AS [TaxCategory], CAST(NULL AS VARCHAR(50)) AS [IncomeAccount], 
        CAST(NULL AS VARCHAR(50)) AS [InventoryAccount], CAST(NULL AS VARCHAR(50)) AS [CostOfGoodsAccount], CAST(NULL AS VARCHAR(50)) AS [AdjustmentsAccount],
        CAST(NULL AS VARCHAR(50)) AS [DeferredIncomeAccount]

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoDiscountableItemClass]'))
    DROP VIEW [dbo].[vBoDiscountableItemClass]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoDiscountableItemClass]
AS
SELECT vSoaItemClass.Description,vSoaItemClass.ItemClassId,vSoaItemClass.Name
  FROM vSoaItemClass
 WHERE ItemClassId='EVENT' OR ItemClassId='MEETING' OR ItemClassId LIKE 'SALES-%'
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
CREATE VIEW [dbo].[vBoDocument]
AS
SELECT DocumentMain.Blob,DocumentMain.DefaultChildAccessKey,DocumentMain.IsSystem,DocumentMain.UpdatedByUserKey,DocumentMain.UpdatedOn,DocumentMain.LockedByUserKey,DocumentMain.LockedOn,DocumentMain.AccessKey,DocumentMain.CreatedByUserKey,DocumentMain.CreatedOn,DocumentMain.DocumentKey,DocumentMain.ContainsChildrenFlag,DocumentMain.AlternateName,DocumentMain.DocumentDescription AS Description,DocumentMain.DocumentName AS Name,DocumentMain.DocumentStatusCode,DocumentMain.DocumentTypeCode,DocumentMain.DocumentVersionKey,DocumentMain.StatusUpdatedByUserKey,DocumentMain.StatusUpdatedOn,DocumentMain.BranchedFromDocumentKey,DocumentMain.RelatedDocumentVersionKey,DocumentMain.VersionComment,DocumentMain.VersionLabel,DocumentMain.DocumentCode,DocumentMain.SystemKey
  FROM DocumentMain
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
CREATE VIEW [dbo].[vBoDocumentHierarchy]
AS
SELECT Hierarchy.Depth,Hierarchy.HierarchyKey,Hierarchy.IsChildAMemberOfParent,Hierarchy.ParentHierarchyKey,Hierarchy.RootHierarchyKey,Hierarchy.SortOrder,Hierarchy.UniformKey,Hierarchy.UniformType,Hierarchy.HierarchyCode,DocumentMain.IsSystem,DocumentMain.UpdatedByUserKey,DocumentMain.UpdatedOn,DocumentMain.DocumentName,DocumentMain.DocumentDescription,DocumentMain.DocumentTypeCode,DocumentMain.DocumentStatusCode,DocumentMain.DocumentKey,DocumentMain.AlternateName,DocumentMain.AccessKey
  FROM Hierarchy
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
CREATE VIEW [dbo].[vBoDocumentStorage]
AS
SELECT DocumentStorage.Blob,DocumentStorage.CreatedByUserKey,DocumentStorage.CreatedOn,DocumentStorage.Description,DocumentStorage.DocumentStorageKey,DocumentStorage.FileTypeCode,DocumentStorage.Name,DocumentStorage.UpdatedByUserKey,DocumentStorage.UpdatedOn,DocumentStorage.UploadedByUserKey,DocumentStorage.UploadedOn
  FROM DocumentStorage
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
CREATE VIEW [dbo].[vBoDocumentType]
AS
SELECT DocumentTypeRef.DocumentTypeCode,DocumentTypeRef.DocumentTypeName,DocumentTypeRef.DocumentTypeDesc,DocumentTypeRef.TrackVersionsFlag,DocumentTypeRef.TaskHelperAssemblyName,DocumentTypeRef.DocumentNewLink,DocumentTypeRef.DocumentEditLink,DocumentTypeRef.DocumentExecuteLink,DocumentTypeRef.DocumentIconURL,DocumentTypeRef.FolderIconURL,DocumentTypeRef.PublishWorkflowDocumentKey,DocumentTypeRef.RecycleWorkflowDocumentKey,DocumentTypeRef.TaskHelperTypeName,DocumentTypeRef.DocumentSummaryLink,DocumentTypeRef.ShortcutIconURL,DocumentTypeRef.IsExportable,DocumentTypeRef.DocumentDownloadLink
  FROM DocumentTypeRef
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
CREATE VIEW [dbo].[vBoDonation]
AS
SELECT vDonations.Amount,vDonations.CheckNumber,vDonations.DateReceived,vDonations.FiscalMonth,vDonations.FiscalYear,vDonations.GiftType,vDonations.ID,vDonations.InvoiceRefNum,vDonations.IsMatchingGift,vDonations.ListAs,vDonations.MatchingTransaction,vDonations.MemorialID,vDonations.MemorialNameText,vDonations.OriginalTransaction,vDonations.PaymentType,vDonations.RequestNumber,vDonations.SolicitorID,vDonations.SourceSystem,vDonations.TransactionDate
  FROM vDonations
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
CREATE VIEW [dbo].[vBoDonorClubParticipationDetail]
AS
SELECT GroupMemberDetail.CreatedByUserKey,GroupMemberDetail.CreatedOn,GroupMemberDetail.EffectiveDate,GroupMemberDetail.ExpirationDate,GroupMemberDetail.GroupMemberKey,GroupMemberDetail.GroupRoleKey,GroupMemberDetail.UpdatedByUserKey,GroupMemberDetail.UpdatedOn,GroupMemberDetail.TypeSpecificData,GroupMemberDetail.TypeSpecificFlag,GroupMemberDetail.TypeSpecificKey,GroupMemberDetail.TypeSpecificInt,GroupMemberDetail.GroupMemberStatusCode,GroupMemberDetail.IsActive,GroupMemberDetail.GroupMemberDetailKey,GroupMemberDetail.GroupKey,GroupMemberDetail.RecurringTransactionInstructionKey
  FROM GroupMemberDetail
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vUDBOEducationInProgress]'))
    DROP VIEW [dbo].[vUDBOEducationInProgress]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE VIEW [dbo].[vUDBOEducationInProgress]
AS
SELECT s.RowID AS [ContactKey],
       MAX(CASE WHEN s.PropertyName = 'ProjectedGraduationDate' THEN s.PropertyDateTimeValue ELSE NULL END) AS [ProjectedGraduationDate],
       CAST(MAX(CASE WHEN s.PropertyName = 'FieldOfStudy' THEN s.PropertyStringValue ELSE NULL END) AS nvarchar(80)) AS [FieldOfStudy],
       CAST(MAX(CASE WHEN s.PropertyName = 'SchoolAttending' THEN s.PropertyStringValue ELSE NULL END) AS nvarchar(80)) AS [SchoolAttending]
  FROM [dbo].[UserDefinedSingleInstanceProperty] s
 WHERE s.TableName = 'EducationInProgress'
 GROUP BY s.RowID

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoEducationInProgress]'))
    DROP VIEW [dbo].[vBoEducationInProgress]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoEducationInProgress]
AS
SELECT vUDBOEducationInProgress.ContactKey,vUDBOEducationInProgress.ProjectedGraduationDate,vUDBOEducationInProgress.FieldOfStudy,vUDBOEducationInProgress.SchoolAttending
  FROM vUDBOEducationInProgress
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
CREATE VIEW [dbo].[vBoEducationLevelRef]
AS
SELECT EducationLevelRef.EducationLevelCode AS Code,EducationLevelRef.EducationLevelDesc AS Description,EducationLevelRef.IsHandModified
  FROM EducationLevelRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vEngagementMeasure]'))
    DROP VIEW [dbo].[vEngagementMeasure]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE VIEW [dbo].[vEngagementMeasure]
AS 
SELECT a.ACTIVITY_TYPE AS [Type],
       p.[DESCRIPTION] AS [TypeLabel],
       a.[SEQN] AS [Seqn],
       a.[AMOUNT] AS [Amount],
       a.[CO_ID] AS [CompanyId],
       a.[DESCRIPTION] AS [Description],
       a.[ID] AS [Id],
       a.[QUANTITY] AS [Quantity],
       a.[SOURCE_CODE] AS [SourceCode],
       a.[TRANSACTION_DATE] AS [Date],
       DATEDIFF(yy,a.[TRANSACTION_DATE],GETDATE()) AS [YearsAgo],
       CASE WHEN DATEDIFF(yy,a.[TRANSACTION_DATE],GETDATE()) = 0 THEN 'Current 12 Months'
            WHEN DATEDIFF(yy,a.[TRANSACTION_DATE],GETDATE()) = 1 THEN ' Previous 12 Months'
            ELSE ' Older'
        END AS [YearsAgoLabel]
  FROM [dbo].[Activity] a 
       INNER JOIN [dbo].[Product_Type] p ON a.[ACTIVITY_TYPE] = p.[PROD_TYPE];

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoEngagementMeasure]'))
    DROP VIEW [dbo].[vBoEngagementMeasure]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoEngagementMeasure]
AS
SELECT vEngagementMeasure.Amount,vEngagementMeasure.CompanyId,vEngagementMeasure.Description,vEngagementMeasure.Id,vEngagementMeasure.Quantity,vEngagementMeasure.SourceCode,vEngagementMeasure.YearsAgo,vEngagementMeasure.Date,vEngagementMeasure.Type,vEngagementMeasure.TypeLabel,vEngagementMeasure.YearsAgoLabel,vEngagementMeasure.Seqn
  FROM vEngagementMeasure
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vEventRegistrantsReport]'))
    DROP VIEW [dbo].[vEventRegistrantsReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO



CREATE VIEW [dbo].[vEventRegistrantsReport]
AS
SELECT NULL AS [GroupMemberStatusCode],
       OB.[COMPANY] AS [PrimaryInstituteName],
       OB.[TITLE] AS [PrimaryInstituteTitle],
       UPPER(OB.[LAST_NAME] + ', ' + OB.[FIRST_NAME]) AS [ContactSortName],
       OB.[ADDRESS_1] AS [Address1],
       OB.[ADDRESS_2] AS [Address2],
       OB.[ADDRESS_3] AS [Address3],
       OB.[CITY] AS [CITY],
       OB.[COUNTRY] AS [CountryName],
       OB.[STATE_PROVINCE] AS [StateProvinceDesc],
       OM.[MEETING] AS [EventKey],
       O.[ST_ID] AS [ContactKey],
       OB.[FULL_NAME] AS [ContactName],
       O.[ORDER_DATE] AS [EffectiveDate],
       OM.[MEETING] AS [EventName],
       NULL AS [RegistrationType],
       NULL AS [EventGroupKey],
       NULL AS [EventProductKey],
       CASE 
       WHEN O.[STATUS] = ''
       THEN 'Registered'
       ELSE ''
       END AS [GroupMemberStatusDesc],
       CASE 
       WHEN O.[STATUS] = ''
       THEN 'Registered'
       ELSE ''
       END AS [GroupMemberIsActive],
       OB.[ZIP] AS [PostalCode],
       OB.[FIRST_NAME] AS [FirstName],
       OB.[LAST_NAME] AS [LastName],
       OB.[INFORMAL] AS [Informal],
       OB.[BADGE_TYPE] AS [BadgeType],
       O.[STATUS] AS [Status],
       O.[ORDER_NUMBER] AS [OrderNumber],
       COALESCE(OM.[PARENT_ORDER_NUMBER], O.[ORDER_NUMBER]) AS [ParentOrderNumber],
       O.[LAST_FIRST] AS [LastFirst],
       O.[EMAIL] AS [Email],
       ISNULL(GOF.[FULL_NAME],'') AS [GuestOf],
       COALESCE(GOF.LAST_FIRST, UPPER(OB.[LAST_NAME] + ', ' + OB.[FIRST_NAME])) + ' - ' + CONVERT(VARCHAR, CONVERT(INT, COALESCE(OM.[PARENT_ORDER_NUMBER], O.[ORDER_NUMBER]))) AS [AlphaByParentOrder] 
  FROM [dbo].[Meet_Master] MM
       INNER JOIN [dbo].[Order_Meet] OM ON [MM].[MEETING] = OM.[MEETING]
       INNER JOIN [dbo].[Orders] O ON OM.[ORDER_NUMBER] = O.[ORDER_NUMBER]
       INNER JOIN [dbo].[Order_Badge] OB ON O.[ORDER_NUMBER] = OB.[ORDER_NUMBER]
       LEFT OUTER JOIN [dbo].[Orders] GOF ON GOF.ORDER_NUMBER = OM.PARENT_ORDER_NUMBER


GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoEventRegistrantsReport]'))
    DROP VIEW [dbo].[vBoEventRegistrantsReport]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoEventRegistrantsReport]
AS
SELECT vEventRegistrantsReport.Address1,vEventRegistrantsReport.Address2,vEventRegistrantsReport.Address3,vEventRegistrantsReport.AlphaByParentOrder,vEventRegistrantsReport.BadgeType,vEventRegistrantsReport.CITY,vEventRegistrantsReport.ContactKey,vEventRegistrantsReport.ContactName,vEventRegistrantsReport.ContactSortName,vEventRegistrantsReport.CountryName,vEventRegistrantsReport.EffectiveDate,vEventRegistrantsReport.Email,vEventRegistrantsReport.EventGroupKey,vEventRegistrantsReport.EventKey,vEventRegistrantsReport.EventName,vEventRegistrantsReport.EventProductKey,vEventRegistrantsReport.FirstName,vEventRegistrantsReport.GroupMemberIsActive,vEventRegistrantsReport.GroupMemberStatusCode,vEventRegistrantsReport.GroupMemberStatusDesc,vEventRegistrantsReport.GuestOf,vEventRegistrantsReport.Informal,vEventRegistrantsReport.LastFirst,vEventRegistrantsReport.LastName,vEventRegistrantsReport.OrderNumber,vEventRegistrantsReport.ParentOrderNumber,vEventRegistrantsReport.PostalCode,vEventRegistrantsReport.PrimaryInstituteName,vEventRegistrantsReport.PrimaryInstituteTitle,vEventRegistrantsReport.RegistrationType,vEventRegistrantsReport.StateProvinceDesc,vEventRegistrantsReport.Status
  FROM vEventRegistrantsReport
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
CREATE VIEW [dbo].[vBoExecutionModeRef]
AS
SELECT ExecutionModeRef.ExecutionModeCode,ExecutionModeRef.ExecutionModeDesc,ExecutionModeRef.ExecutionModeName
  FROM ExecutionModeRef
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
	[dbo].[CustomerExperience].[ContactKey], 
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
	[dbo].[vOfferedCustomerExperience].[ExperienceUnitKey]

FROM
	[dbo].[CustomerExperience]
		INNER JOIN [dbo].[vOfferedCustomerExperience] ON [dbo].[CustomerExperience].[CustomerExperienceKey] = [dbo].[vOfferedCustomerExperience].[OfferedCustomerExperienceKey]

UNION ALL
SELECT
	[CustomerExperience1].[CustomerExperienceKey], 
	[CustomerExperience1].[ContactKey], 
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
	[dbo].[vUnofferedCustomerExperience].[ExperienceUnitKey]

FROM
	[dbo].[CustomerExperience] AS CustomerExperience1 
		INNER JOIN [dbo].[vUnofferedCustomerExperience] ON [CustomerExperience1].[CustomerExperienceKey] = [dbo].[vUnofferedCustomerExperience].[UnofferedCustomerExperienceKey]

UNION ALL
SELECT
	[CustomerExperience2].[CustomerExperienceKey], 
	[CustomerExperience2].[ContactKey], 
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
	[dbo].[vUserDefinedCustomerExperience].[ExperienceUnitKey]

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
CREATE VIEW [dbo].[vBoExperienceCountSummary]
AS
SELECT vExperienceCountSummary.CustomerExperienceKey,vExperienceCountSummary.Date,vExperienceCountSummary.Description,vExperienceCountSummary.ExperienceDefinitionKey,vExperienceCountSummary.LocationKey,vExperienceCountSummary.LocationName,vExperienceCountSummary.Name,vExperienceCountSummary.NumberOfUnits,vExperienceCountSummary.ProgramKey,vExperienceCountSummary.ProgramName,vExperienceCountSummary.Provider,vExperienceCountSummary.RequiresApprovalFlag,vExperienceCountSummary.RequiresGradeFlag,vExperienceCountSummary.OfferingKey,vExperienceCountSummary.ExperienceDefinitionName,vExperienceCountSummary.OfferingName,vExperienceCountSummary.ExperienceUnitKey,vExperienceCountSummary.ContactKey
  FROM vExperienceCountSummary
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
CREATE VIEW [dbo].[vBoExperienceDefinition]
AS
SELECT ExperienceDefinition.ExperienceDefinitionCode AS Code,ExperienceDefinition.ExperienceDefinitionDate AS Date,ExperienceDefinition.ExperienceDefinitionDesc AS Description,ExperienceDefinition.ExperienceDefinitionKey,ExperienceDefinition.ExperienceDefinitionLocation AS Location,ExperienceDefinition.ExperienceDefinitionName AS Name,ExperienceDefinition.ExperienceDefinitionStatusCode,ExperienceDefinition.NumberOfUnits,ExperienceDefinition.ProgramKey,ExperienceDefinition.RequiresApprovalFlag,ExperienceDefinition.RequiresGradeFlag,ExperienceDefinition.UpdatedByUserKey,ExperienceDefinition.UpdatedOn,ExperienceDefinition.CreatedByUserKey,ExperienceDefinition.CreatedOn,ExperienceDefinition.MarkedForDeleteOn
  FROM ExperienceDefinition
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
CREATE VIEW [dbo].[vBoExperienceDefinitionStatus]
AS
SELECT ExperienceDefinitionStatusRef.ExperienceDefinitionStatusCode AS Code,ExperienceDefinitionStatusRef.ExperienceDefinitionStatusName AS Name
  FROM ExperienceDefinitionStatusRef
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
	[dbo].[CustomerExperience].[ContactKey], 
	[dbo].[vOfferedCustomerExperience].[ProgramKey], 
	[dbo].[vOfferedCustomerExperience].[ProgramName], 
	[dbo].[vOfferedCustomerExperience].[ExperienceDefinitionKey], 
	[dbo].[vOfferedCustomerExperience].[ExperienceDefinitionName], 
	[dbo].[vOfferedCustomerExperience].[OfferingKey], 
	[dbo].[vOfferedCustomerExperience].[OfferingName], 
	[dbo].[vOfferedCustomerExperience].[ContactKey] AS Provider, 
	[dbo].[vOfferedCustomerExperience].[OfferingName] AS Name, 
	[dbo].[ContactMain].[FullName], 
	[dbo].[ContactMain].[SortName], 
	ISNULL([dbo].[GradeRef].[GradeValue], [dbo].[vOfferedCustomerExperience].[OfferedCustomerExperienceGrade]) AS Grade, 
	[dbo].[CustomerExperience].[CustomerExperienceStatusCode] AS StatusCode, 
	[dbo].[CustomerExperienceStatusRef].[CustomerExperienceStatusName] AS StatusName, 
	[dbo].[vOfferedCustomerExperience].[NumberOfUnits], 
	[dbo].[vOfferedCustomerExperience].[OfferingDate] AS Date

FROM 
	[dbo].[CustomerExperience] 
		INNER JOIN [dbo].[vOfferedCustomerExperience] ON [dbo].[CustomerExperience].[CustomerExperienceKey] = [dbo].[vOfferedCustomerExperience].[OfferedCustomerExperienceKey] 
		INNER JOIN [dbo].[ContactMain] ON [dbo].[CustomerExperience].[ContactKey] = [dbo].[ContactMain].[ContactKey] 
		INNER JOIN [dbo].[CustomerExperienceStatusRef] ON [dbo].[CustomerExperience].[CustomerExperienceStatusCode] = [dbo].[CustomerExperienceStatusRef].[CustomerExperienceStatusCode] 
		LEFT JOIN [dbo].[GradeRef] ON [dbo].[vOfferedCustomerExperience].[OfferedCustomerExperienceGradeKey] = [dbo].[GradeRef].[GradeKey]

UNION ALL
SELECT 
	[CustomerExperience1].[CustomerExperienceKey], 
	[CustomerExperience1].[ContactKey], 
	[dbo].[vUnofferedCustomerExperience].[ProgramKey], 
	[dbo].[vUnofferedCustomerExperience].[ProgramName], 
	[dbo].[vUnofferedCustomerExperience].[ExperienceDefinitionKey], 
	[dbo].[vUnofferedCustomerExperience].[ExperienceDefinitionName], 
	NULL AS OfferingKey, 
	NULL AS OfferingName, 
	NULL AS Provider, 
	[dbo].[vUnofferedCustomerExperience].[ExperienceDefinitionName] AS Name, 
	[ContactMain1].[FullName], 
	[ContactMain1].[SortName], 
	[dbo].[vUnofferedCustomerExperience].[UnofferedCustomerExperienceGrade] AS Grade, 
	[CustomerExperience1].[CustomerExperienceStatusCode] AS StatusCode, 
	[CustomerExperienceStatusCodeRef1].[CustomerExperienceStatusName] AS StatusName, 
	[dbo].[vUnofferedCustomerExperience].[NumberOfUnits], 
	[dbo].[vUnofferedCustomerExperience].[ExperienceDefinitionDate] AS Date

FROM 
	[dbo].[CustomerExperience] AS [CustomerExperience1] 
		INNER JOIN [dbo].[vUnofferedCustomerExperience] ON [CustomerExperience1].[CustomerExperienceKey] = [dbo].[vUnofferedCustomerExperience].[UnofferedCustomerExperienceKey] 
		INNER JOIN [dbo].[ContactMain] AS [ContactMain1] ON [CustomerExperience1].[ContactKey] = [ContactMain1].[ContactKey] 
		INNER JOIN [dbo].[CustomerExperienceStatusRef] AS [CustomerExperienceStatusCodeRef1] ON [CustomerExperience1].[CustomerExperienceStatusCode] = [CustomerExperienceStatusCodeRef1].[CustomerExperienceStatusCode]

UNION ALL
SELECT 
	[CustomerExperience2].[CustomerExperienceKey], 
	[CustomerExperience2].[ContactKey], 
	[dbo].[vUserDefinedCustomerExperience].[ProgramKey], 
	[dbo].[vUserDefinedCustomerExperience].[ProgramName], 
	NULL AS ExperienceDefinitionKey, 
	NULL AS ExperienceDefinitionName, 
	NULL AS OfferingKey, 
	NULL AS OfferingName, 
	NULL AS Provider, 
	[dbo].[vUserDefinedCustomerExperience].[UserDefinedCustomerExperienceName] AS Name, 
	[ContactMain2].[FullName], 
	[ContactMain2].[SortName], 
	NULL AS Grade, 
	[CustomerExperience2].[CustomerExperienceStatusCode] AS StatusCode, 
	[CustomerExperienceStatusCodeRef2].[CustomerExperienceStatusName] AS StatusName, 
	[dbo].[vUserDefinedCustomerExperience].[UserDefinedCustomerExperienceUnits] AS NumberOfUnits, 
	[dbo].[vUserDefinedCustomerExperience].[CompletionDate] AS Date

FROM 
	[dbo].[CustomerExperience] AS [CustomerExperience2] 
		INNER JOIN [dbo].[vUserDefinedCustomerExperience] ON [CustomerExperience2].[CustomerExperienceKey] = [dbo].[vUserDefinedCustomerExperience].[UserDefinedCustomerExperienceKey] 
		INNER JOIN [dbo].[ContactMain] AS [ContactMain2] ON [CustomerExperience2].[ContactKey] = [ContactMain2].[ContactKey] 
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
CREATE VIEW [dbo].[vBoExperienceRoster]
AS
SELECT vExperienceRoster.CustomerExperienceKey,vExperienceRoster.Date,vExperienceRoster.ExperienceDefinitionKey,vExperienceRoster.ExperienceDefinitionName,vExperienceRoster.FullName,vExperienceRoster.Grade,vExperienceRoster.Name,vExperienceRoster.OfferingKey,vExperienceRoster.OfferingName,vExperienceRoster.ProgramKey,vExperienceRoster.ProgramName,vExperienceRoster.SortName,vExperienceRoster.StatusCode,vExperienceRoster.StatusName,vExperienceRoster.Provider,vExperienceRoster.NumberOfUnits,vExperienceRoster.ContactKey
  FROM vExperienceRoster
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoExperienceUnit]'))
    DROP VIEW [dbo].[vBoExperienceUnit]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoExperienceUnit]
AS
SELECT ExperienceUnit.ExperienceUnitDesc AS Description,ExperienceUnit.ExperienceUnitKey,ExperienceUnit.ExperienceUnitName AS Name
  FROM ExperienceUnit
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
CREATE VIEW [dbo].[vBoFileTypeRef]
AS
SELECT FileTypeRef.FileTypeCode,FileTypeRef.FileTypeDesc,FileTypeRef.IconFileName,FileTypeRef.MimeType
  FROM FileTypeRef
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
CREATE VIEW [dbo].[vBoFinancialEntityDueTo]
AS
SELECT FinancialEntityDueTo.FinancialEntityDueToKey,FinancialEntityDueTo.FromFinancialEntityKey,FinancialEntityDueTo.FromFinEntityGLAccountKey,FinancialEntityDueTo.ToFinancialEntityKey,FinancialEntityDueTo.ToFinEntityGLAccountKey
  FROM FinancialEntityDueTo
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
CREATE VIEW [dbo].[vBoFirstPaymentDateTypeRef]
AS
SELECT FirstPaymentDateTypeRef.FirstPaymentDateTypeCode AS Code,FirstPaymentDateTypeRef.FirstPaymentDateTypeDesc AS Description,FirstPaymentDateTypeRef.FirstPaymentDateTypeName AS Name
  FROM FirstPaymentDateTypeRef
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
CREATE VIEW [dbo].[vBoFullAddress]
AS
SELECT FullAddress.AdditionalLine1,FullAddress.AdditionalLine2,FullAddress.ContactKey,FullAddress.DaytimePhoneAddressKey,FullAddress.EmailAddressKey,FullAddress.EveningPhoneAddressKey,FullAddress.FaxAddressKey,FullAddress.FullAddressKey,FullAddress.PhysicalAddressKey,FullAddress.SalutationKey,FullAddress.FullAddressDesc AS Description,FullAddress.AddressPurposeKey,FullAddress.AddresseeText,FullAddress.IsAddresseeOverridden
  FROM FullAddress
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
  CRR.CommunicationReasonName, CRR.IsDefaultType, FA.FullAddressKey, FA.ContactKey, 
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
CREATE VIEW [dbo].[vBoFullAddressAllReport]
AS
SELECT vFullAddressAllReport.Address1,vFullAddressAllReport.Address2,vFullAddressAllReport.Address3,vFullAddressAllReport.BarCode,vFullAddressAllReport.CarrierRoute,vFullAddressAllReport.City,vFullAddressAllReport.ContactKey,vFullAddressAllReport.CountryCode,vFullAddressAllReport.CountryName,vFullAddressAllReport.County,vFullAddressAllReport.DeliveryPointBarCode,vFullAddressAllReport.FullAddressKey,vFullAddressAllReport.FullAddressPurpose,vFullAddressAllReport.IsDefaultType,vFullAddressAllReport.Latitude,vFullAddressAllReport.LineOfTravel,vFullAddressAllReport.Longitude,vFullAddressAllReport.MailCode,vFullAddressAllReport.PostalCode,vFullAddressAllReport.PreferredAddressCategory,vFullAddressAllReport.PreferredAddressCategoryCode,vFullAddressAllReport.Region,vFullAddressAllReport.SalutationKey,vFullAddressAllReport.SeasonalRevertFullAddressKey,vFullAddressAllReport.StateProvinceCode,vFullAddressAllReport.StateProvinceDesc,vFullAddressAllReport.StateSenate,vFullAddressAllReport.USCongress,vFullAddressAllReport.DayTimePhone,vFullAddressAllReport.Email,vFullAddressAllReport.EveningPhone,vFullAddressAllReport.Fax,vFullAddressAllReport.PhysicalAddress,vFullAddressAllReport.CommunicationReasonName
  FROM vFullAddressAllReport
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
	ACR.AddressCategoryName AS PreferredAddressCategory, CRR.CommunicationReasonName, CRR.IsDefaultType, FA.FullAddressKey, FA.ContactKey, 
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
CREATE VIEW [dbo].[vBoFullAddressPrimaryReport]
AS
SELECT vFullAddressPrimaryReport.Address1,vFullAddressPrimaryReport.Address2,vFullAddressPrimaryReport.Address3,vFullAddressPrimaryReport.BarCode,vFullAddressPrimaryReport.CarrierRoute,vFullAddressPrimaryReport.City,vFullAddressPrimaryReport.ContactKey,vFullAddressPrimaryReport.CountryCode,vFullAddressPrimaryReport.CountryName,vFullAddressPrimaryReport.County,vFullAddressPrimaryReport.DeliveryPointBarCode,vFullAddressPrimaryReport.FullAddressKey,vFullAddressPrimaryReport.FullAddressPurpose,vFullAddressPrimaryReport.IsDefaultType,vFullAddressPrimaryReport.Latitude,vFullAddressPrimaryReport.LineOfTravel,vFullAddressPrimaryReport.Longitude,vFullAddressPrimaryReport.MailCode,vFullAddressPrimaryReport.PostalCode,vFullAddressPrimaryReport.PreferredAddressCategory,vFullAddressPrimaryReport.PreferredAddressCategoryCode,vFullAddressPrimaryReport.PrimaryDayTimePhone,vFullAddressPrimaryReport.PrimaryEmail,vFullAddressPrimaryReport.PrimaryEveningPhone,vFullAddressPrimaryReport.PrimaryFax,vFullAddressPrimaryReport.PrimaryPhysicalAddress,vFullAddressPrimaryReport.Region,vFullAddressPrimaryReport.SalutationKey,vFullAddressPrimaryReport.SeasonalRevertFullAddressKey,vFullAddressPrimaryReport.StateProvinceCode,vFullAddressPrimaryReport.StateProvinceDesc,vFullAddressPrimaryReport.StateSenate,vFullAddressPrimaryReport.USCongress
  FROM vFullAddressPrimaryReport
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
CREATE VIEW [dbo].[vBoFund]
AS
SELECT Fund.Description,Fund.Name,Fund.UpdatedByUserKey,Fund.UpdatedOn,Fund.FinancialEntityKey,Fund.FundFamilyKey,Fund.AccessKey,Fund.CreatedByUserKey,Fund.CreatedOn,Fund.FundKey
  FROM Fund
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
CREATE VIEW [dbo].[vBoFundFamilyRef]
AS
SELECT FundFamilyRef.FundFamilyKey,FundFamilyRef.Code,FundFamilyRef.Description
  FROM FundFamilyRef
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
CREATE VIEW [dbo].[vBoFundFundType]
AS
SELECT FundFundType.FundFundTypeKey,FundFundType.FundKey,FundFundType.FundTypeKey
  FROM FundFundType
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
CREATE VIEW [dbo].[vBoFundraisingPreferenceRef]
AS
SELECT FundraisingPreferenceRef.FundraisingPreferenceCode,FundraisingPreferenceRef.FundraisingPreferenceDesc,FundraisingPreferenceRef.FundraisingPreferenceName
  FROM FundraisingPreferenceRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoFundraisingProfileDonorData]'))
    DROP VIEW [dbo].[vBoFundraisingProfileDonorData]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoFundraisingProfileDonorData]
AS
SELECT Name_FR.ID,Name_FR.Receipt_Interval,Name_FR.DO_NOT_EMAIL,Name_FR.DO_NOT_SELL,Name_FR.DO_NOT_PHONE,Name_FR.DO_NOT_SOLICIT,Name_FR.SOLICITOR_ID
  FROM Name_FR
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
CREATE VIEW [dbo].[vBoFundType]
AS
SELECT FundTypeRef.FundTypeKey,FundTypeRef.Code,FundTypeRef.Description
  FROM FundTypeRef
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
CREATE VIEW [dbo].[vBoGatewayResultRef]
AS
SELECT GatewayResultRef.GatewayResultCode,GatewayResultRef.GatewayResultDesc
  FROM GatewayResultRef
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
CREATE VIEW [dbo].[vBoGatewayTransactionRef]
AS
SELECT GatewayTransactionRef.GatewayTransactionDesc,GatewayTransactionRef.GatewayTransactionCode,GatewayTransactionRef.GatewayTransactionName
  FROM GatewayTransactionRef
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
CREATE VIEW [dbo].[vBoGatewayTypeRef]
AS
SELECT GatewayTypeRef.BusinessObjectName,GatewayTypeRef.EditGuiContentCode,GatewayTypeRef.GatewayComponentKey,GatewayTypeRef.GatewayTypeCode AS Code,GatewayTypeRef.GatewayTypeDesc AS Description
  FROM GatewayTypeRef
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
CREATE VIEW [dbo].[vBoGift]
AS
SELECT vGift.Amount,vGift.AmountAsMoney,vGift.Appeal,vGift.Campaign,vGift.CheckNumber,vGift.DateReceived,vGift.FairMktValue,vGift.FiscalMonth,vGift.FiscalYear,vGift.Fund,vGift.GiftType,vGift.ID,vGift.InstallmentDate,vGift.InvoiceReferenceNumber,vGift.IsMatchingGift,vGift.ListAs,vGift.MatchingTransaction,vGift.MemorialID,vGift.MemorialNameText,vGift.OriginalTransaction,vGift.PaymentType,vGift.PledgeID,vGift.ReceiptID,vGift.RequestNumber,vGift.SolicitorID,vGift.SourceSystem,vGift.TransactionDate,vGift.TransactionNumber
  FROM vGift
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
CREATE VIEW [dbo].[vBoGiftAidClaim]
AS
SELECT vGiftAidClaim.ClaimFromDate,vGiftAidClaim.ClaimToDate,vGiftAidClaim.DateOfPayment,vGiftAidClaim.DonationAmount,vGiftAidClaim.GiftAidReference,vGiftAidClaim.GiftAidTaxRate,vGiftAidClaim.HmrcReference,vGiftAidClaim.IsIncludedInClaim,vGiftAidClaim.TaxPayer
  FROM vGiftAidClaim
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
CREATE VIEW [dbo].[vBoGiftAidClaimDetail]
AS
SELECT GiftAidClaimDetail.ContactId,GiftAidClaimDetail.DonationAmount,GiftAidClaimDetail.GiftAidClaimDetailKey,GiftAidClaimDetail.GiftAidClaimHeaderKey,GiftAidClaimDetail.GiftAidDeclarationKey,GiftAidClaimDetail.GiftAidTaxRate,GiftAidClaimDetail.HmrcReference,GiftAidClaimDetail.IsIncludedInClaim,GiftAidClaimDetail.IsTaxReclaimAllocatedtoGeneralFund,GiftAidClaimDetail.LabelName,GiftAidClaimDetail.TaxPayerFirstName,GiftAidClaimDetail.TaxPayerLastName,GiftAidClaimDetail.TaxPayerTitle,GiftAidClaimDetail.TaxReclaimAmount,GiftAidClaimDetail.TransactionId,GiftAidClaimDetail.TransactionPaidDate
  FROM GiftAidClaimDetail
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
CREATE VIEW [dbo].[vBoGiftAidClaimHeader]
AS
SELECT GiftAidClaimHeader.ClaimFromDate,GiftAidClaimHeader.ClaimToDate,GiftAidClaimHeader.CreatedOn,GiftAidClaimHeader.GiftAidClaimHeaderKey,GiftAidClaimHeader.GiftAidStatus,GiftAidClaimHeader.GiftAidTaxRate,GiftAidClaimHeader.Reference,GiftAidClaimHeader.UpdatedOn,GiftAidClaimHeader.CreatedByUserKey,GiftAidClaimHeader.UpdatedByUserKey
  FROM GiftAidClaimHeader
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
CREATE VIEW [dbo].[vBoGiftAidDeclaration]
AS
SELECT GiftAidDeclaration.CreatedByUserKey,GiftAidDeclaration.CreatedOn,GiftAidDeclaration.DeclarationEndDate,GiftAidDeclaration.DeclarationMethodKey,GiftAidDeclaration.DeclarationNotes,GiftAidDeclaration.DeclarationReceivedDate,GiftAidDeclaration.DeclarationStartDate,GiftAidDeclaration.GiftAidDeclarationKey,GiftAidDeclaration.IsConfirmationRequired,GiftAidDeclaration.IsTaxRecoveredUnrestricted,GiftAidDeclaration.UpdatedOn,GiftAidDeclaration.ID,GiftAidDeclaration.ConfirmationSentDate,GiftAidDeclaration.Status,GiftAidDeclaration.UpdatedByUserKey,GiftAidDeclaration.StatusUpdatedDate,GiftAidDeclaration.AppealCode,GiftAidDeclaration.IsUsing6YearRule,GiftAidDeclaration.TaxpayerPrefix,GiftAidDeclaration.IsHighRateTaxpayer,GiftAidDeclaration.TaxpayerCity,GiftAidDeclaration.TaxpayerAddress2,GiftAidDeclaration.TaxpayerFirstName,GiftAidDeclaration.TaxpayerLastName,GiftAidDeclaration.TaxpayerAddress1,GiftAidDeclaration.TaxpayerAddress3,GiftAidDeclaration.TaxpayerCountry,GiftAidDeclaration.TaxpayerCounty,GiftAidDeclaration.TaxpayerPostcode
  FROM GiftAidDeclaration
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
CREATE VIEW [dbo].[vGiftHistorySummary] AS
  
    -- Populate a CTE to store a summarization of gift-related transaction information
    WITH TblGifts(OriginalTransNum, DonorId, Amount, TransactionDate, GiftCalendarYear, Appeal) AS
    ( SELECT gr.OriginalTransaction, 
             gr.ID, 
             SUM(gr.Amount), 
             MIN(gr.TransactionDate), 
             YEAR(MIN(gr.TransactionDate)),
             MAX(gr.AppealCode)
        FROM [dbo].[GiftReport] gr 
      GROUP BY gr.OriginalTransaction, gr.ID
      HAVING SUM(gr.Amount) <> 0
    )

    -- Verify query
    -- SELECT * FROM TblGifts

    -- Populate a CTE for identifying date ranges for evaluating consecutive years
   ,Years(Seqn, DonorId, GiftYear) AS
   ( SELECT ROW_NUMBER() OVER (ORDER BY g.DonorId asc, 
            -- This next block is used three times in this CTE and can probably be refactored to improve performance
            CASE
                WHEN DATEADD(YYYY,DATEDIFF(yy, g.TransactionDate, GETDATE()),g.TransactionDate) > GETDATE() THEN YEAR(g.TransactionDate)+1
                ELSE YEAR(g.TransactionDate)
             END asc) AS Seqn,
            g.DonorId AS DonorId,
            -- This next block is used three times in this CTE and can probably be refactored to improve performance
            CASE
                WHEN DATEADD(YYYY,DATEDIFF(yy, g.TransactionDate, GETDATE()),g.TransactionDate) > GETDATE() THEN YEAR(g.TransactionDate)+1
                ELSE YEAR(g.TransactionDate)
             END AS GiftYear
       FROM TblGifts g
     GROUP BY g.DonorId,
            ---- This next block is used three times in this CTE and can probably be refactored to improve performance
            CASE
                WHEN DATEADD(YYYY,DATEDIFF(yy, g.TransactionDate, GETDATE()),g.TransactionDate) > GETDATE() THEN YEAR(g.TransactionDate)+1
                ELSE YEAR(g.TransactionDate)
             END
   )

    -- Verify query
    -- SELECT * FROM Years
   
   -- Populate a CTE to calculate groups of consecutive years of giving
   ,consecYears AS 
       (
        SELECT t1.DonorId, 
               t1.GiftYear AS startOfGroup, 
               MIN(t2.GiftYear) AS endOfGroup, 
               MIN(t2.GiftYear) - t1.GiftYear + 1 AS sizeOfGroup 
          FROM ( SELECT DonorId, 
                        GiftYear 
                   FROM Years tbl1 
                  WHERE NOT EXISTS 
                       (
                        SELECT 1 
                          FROM Years tbl2 
                         WHERE tbl1.DonorId = tbl2.DonorId 
                           AND tbl1.GiftYear = tbl2.GiftYear + 1
                        )
                ) t1
            INNER JOIN 
               ( SELECT DonorId, 
                        GiftYear 
                   FROM Years tbl1 
                  WHERE NOT EXISTS 
                       (
                        SELECT 1 
                          FROM Years tbl2 
                         WHERE tbl2.DonorId = tbl1.DonorId 
                           AND tbl2.GiftYear = tbl1.GiftYear + 1 
                        )
                ) t2
             ON t1.DonorId = t2.DonorId 
            AND t1.GiftYear <= t2.GiftYear
        GROUP BY t1.DonorId, t1.GiftYear
      -- This UNION added 2013/03/11 by JHS to ensure ConsecutiveYear resets correctly
      UNION 
        SELECT t.DonorId, YEAR(GETDATE()), YEAR(GETDATE()),0
          FROM Years t
         WHERE NOT EXISTS (SELECT 1 FROM Years y WHERE t.DonorId = y.DonorId AND y.GiftYear = (YEAR(GETDATE())))
       ) 

    -- Verify query
    -- SELECT * FROM consecYears ORDER BY DonorId, startOfGroup ASC
   
   -- Populate a CTE to calculate the current group of consecutive years, if any
   ,ConsecutiveYears(DonorId,Amount) AS
       (
        SELECT DonorId, MAX(sizeOfGroup)
          FROM consecYears
         WHERE endOfGroup = (YEAR(GETDATE()))
        GROUP BY DonorId 
       )
   
    -- Verify query
    -- SELECT * FROM ConsecutiveYears ORDER BY DonorId
   
   -- Populate a CTE to calculate details about gifts in the last 12 months
   ,Last12Months(DonorId,GiftCount,GiftAmount) AS
       (
        SELECT g.DonorId, COUNT(g.OriginalTransNum), SUM(g.Amount)
          FROM TblGifts g 
         WHERE g.TransactionDate >= DATEADD(YY,-1,DATEADD(dd,1,GETDATE()))
           AND g.TransactionDate <= GETDATE()
        GROUP BY g.DonorId
       ) 
   
    -- Verify query
    -- SELECT * FROM Last12Months ORDER BY DonorId

    ,cteGiftHistorySummary(ID,FirstGiftDate,FirstGiftAmount,FirstGiftAppeal,NextLastGiftDate,NextLastGiftAmount,NextLastGiftAppeal,LastGiftDate,LastGiftAmount,LastGiftAppeal,LowestGiftAmount,HighestGiftAmount,NumberOfGifts,LifetimeGiftValue,AverageGiftValue,ConsecutiveYearsGiving,ConsecutiveYearsGivingToDate,GiftsInLast12Months,GiftValueLast12Months) AS (
     SELECT ghs.DonorId,
            ghs.FirstGiftDate,
            ghs.FirstGiftAmount,
            ghs.FirstGiftAppeal,
            ghs.NextLastGiftDate,
            ghs.NextLastGiftAmount,
            ghs.NextLastGiftAppeal,
            ghs.LastGiftDate,
            ghs.LastGiftAmount,
            ghs.LastGiftAppeal,
            ghs.LowestGiftAmount,
            ghs.HighestGiftAmount,
            ghs.NumberOfGifts,
            ghs.LifetimeGiftValue,
            ghs.AverageGiftValue,
            ghs.ConsecutiveYearsGiving,
            NULL,
            NULL,
            NULL
       FROM GiftHistorySummary ghs
     UNION
     SELECT cy.DonorId,
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
            cy.Amount,
            NULL,
            NULL
       FROM ConsecutiveYears cy 
     UNION
     SELECT l.DonorId,
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
            l.GiftCount,
            l.GiftAmount
       FROM Last12Months l 
 )
SELECT gh.ID,
       MAX(gh.FirstGiftDate) AS FirstGiftDate,
       MAX(gh.FirstGiftAmount) AS FirstGiftAmount,
       MAX(gh.FirstGiftAppeal) AS FirstGiftAppeal,
       MAX(gh.NextLastGiftDate) AS NextLastGiftDate,
       MAX(gh.NextLastGiftAmount) AS NextLastGiftAmount,
       MAX(gh.NextLastGiftAppeal) AS NextLastGiftAppeal,
       MAX(gh.LastGiftDate) AS LastGiftDate,
       MAX(gh.LastGiftAmount) AS LastGiftAmount,
       MAX(gh.LastGiftAppeal) AS LastGiftAppeal,
       MAX(gh.LowestGiftAmount) AS LowestGiftAmount,
       MAX(gh.HighestGiftAmount) AS HighestGiftAmount,
       MAX(gh.NumberOfGifts) AS NumberOfGifts,
       MAX(gh.LifetimeGiftValue) AS LifetimeGiftValue,
       MAX(gh.AverageGiftValue) AS AverageGiftValue,
       MAX(gh.ConsecutiveYearsGiving) AS ConsecutiveYearsGiving,
       MAX(gh.ConsecutiveYearsGivingToDate) AS ConsecutiveYearsGivingToDate,
       MAX(gh.GiftsInLast12Months) AS GiftsInLast12Months,
       MAX(gh.GiftValueLast12Months) AS GiftValueLast12Months
  FROM cteGiftHistorySummary gh  
  GROUP BY ID


GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vGiftArray]'))
    DROP VIEW [dbo].[vGiftArray]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE VIEW [dbo].[vGiftArray] 
AS
    SELECT [n].[ID],
           ROUND(([ghs].[LastGiftAmount] + ([ghs].[LastGiftAmount] * 0.1)) *2, -1)/2 * 1 AS A,
           ROUND(([ghs].[LastGiftAmount] + ([ghs].[LastGiftAmount] * 0.1)) *2, -1)/2 * 2 AS B,
           ROUND(([ghs].[LastGiftAmount] + ([ghs].[LastGiftAmount] * 0.1)) *2, -1)/2 * 4 AS C,
           ROUND(([ghs].[LastGiftAmount] + ([ghs].[LastGiftAmount] * 0.1)) *2, -1)/2 * 8 AS D
      FROM [dbo].[Name] n
           LEFT JOIN [dbo].[vGiftHistorySummary] ghs on n.ID = ghs.ID
     WHERE ISNULL( [ghs].[LastGiftAmount], 0 ) > 0

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoGiftArray]'))
    DROP VIEW [dbo].[vBoGiftArray]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoGiftArray]
AS
SELECT vGiftArray.A,vGiftArray.B,vGiftArray.C,vGiftArray.D,vGiftArray.ID
  FROM vGiftArray
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
AS  
   --- FR single Pledge, FR installment and Accrual Dues billing.  Amount is net pledge after CM/DM
    SELECT MAX(v.ID) AS ID,
           MAX(v.TransactionNumber) AS OriginalTransaction,
           MAX(v.InvoiceReferenceNumber) AS InvoiceRefNum,
           MAX(v.SourceSystem) AS SourceSystem,
           MAX(v.TransactionDate) AS TransactionDate,
           MAX(v.DateReceived) as DateReceived ,    
           SUM(v.NetPledgeAmount) AS Amount,
           MAX(v.SolicitorID) AS SolicitorID,
           '' AS CheckNumber,
           MAX(v.Appeal) AS Appeal,
           MAX(v.Campaign) AS Campaign,
           MAX(v.Fund) AS Fund,
           '' AS PaymentType,
           MAX(v.FiscalMonth) AS FiscalMonth,
           MAX(v.FiscalYear) AS FiscalYear,
           ( CASE WHEN MAX(v.SourceSystem) = 'DUES' THEN 'Membership'
                  WHEN MAX(v.SourceSystem) = 'FR' THEN 'Pledge'
             END ) AS GiftType,
           MAX(v.MatchingTransaction) AS MatchingTransaction,
           MAX(v.IsMatchingGift) AS IsMatchingGift,
           MAX(v.MemorialID) AS MemorialID,
           MAX(v.ListAs) AS ListAs,
           MAX(v.RequestNumber) AS RequestNumber,
           MAX(v.MemorialNameText) AS MemorialNameText,
           CAST(0.00 AS MONEY) AS SoftCreditAmount,
           '' AS SoftCreditDonorID
      FROM [dbo].vPledge v
     WHERE v.SourceSystem in ('FR','DUES')
     GROUP BY v.ID,
           v.TransactionNumber,
           v.Fund,
           v.Campaign,
           v.Appeal
     
     UNION
     
 -----  FR Single Gift including the Negative Single Gift payment from Cash Receipt
 
       SELECT MAX(g.ID) AS ID,
           MAX(g.OriginalTransaction) AS OriginalTransaction,
           MAX(g.InvoiceReferenceNumber) AS InvoiceRefNum,
           MAX(g.SourceSystem) AS SourceSystem,
           MAX(g.TransactionDate) AS TransactionDate,
           MAX(g.DateReceived) AS DateReceived,    
           (MAX(g.Amount)+ isnull(SUM(c.AMOUNT),0)) AS Amount,
           MAX(g.SolicitorID) AS SolicitorID,
           MAX(g.CheckNumber) AS CheckNumber,
           MAX(g.AppealCode) AS Appeal,
           MAX(g.CampaignCode) AS Campaign,
           MAX(g.Fund) AS Fund,
           MAX(g.PaymentType) AS PaymentType,
           MAX(g.FiscalMonth) AS FiscalMonth,
           MAX(g.FiscalYear) AS FiscalYear,
           ( CASE WHEN MAX(g.PaymentType) =  'In Kind'
                       THEN 'In Kind'
                       ELSE 'Cash'
             END) AS GiftType,
           MAX(g.MatchingTransaction) as MatchingTransaction,
           MAX(g.IsMatchingGift) as  IsMatchingGift,
           MAX(g.MemorialID) As MemorialID,
           MAX(g.ListAs) AS ListAs,
           MAX(g.RequestNumber) AS RequestNumber,
           MAX(g.MemorialNameText) AS MemorialNameText,
           CAST(0.00 AS MONEY) AS SoftCreditAmount,
           '' AS SoftCreditDonorID
      FROM [dbo].GiftReport g
           LEFT OUTER JOIN [dbo].GiftReport c on g.InvoiceReferenceNumber = c.InvoiceReferenceNumber
                      and c.GiftType = 'Pledge Payment'
                      and g.Fund = c.Fund
     WHERE g.SourceSystem = 'FR' and g.GiftType = 'GIFT'
     GROUP by g.ID, g.OriginalTransaction, g.Fund, g.CampaignCode, g.AppealCode

    UNION
    
 ----- Meeting Registration
    SELECT ID,
           OriginalTransaction,
           InvoiceReferenceNumber AS InvoiceRefNum,
           SourceSystem,
           TransactionDate,
           DateReceived,
           Amount,
           '' AS SolicitorID,
           '' AS CheckNumber,
           AppealCode AS Appeal,
           CampaignCode AS Campaign,
           Fund,
           '' AS PaymentType,
           FiscalMonth,
           FiscalYear,
           'Event' AS GiftType,
           0 AS MatchingTransaction,
           0 AS IsMatchingGift,
           '' AS MemorialID,
           '' AS ListAs,
           0 AS RequestNumber,
           '' AS MemorialNameText,
           CAST(0.00 AS MONEY) AS SoftCreditAmount,
           '' AS SoftCreditDonorID
      FROM [dbo].GiftReport 
     WHERE SourceSystem =  'MEETING'

    UNION
    
 -----  Cash Dues Payment
    SELECT ID,
           OriginalTransaction,
           0 AS InvoiceRefNum,
           SourceSystem,
           TransactionDate,
           DateReceived,
           Amount,
           '' AS SolicitorID,
           CheckNumber,
           AppealCode AS Appeal,
           CampaignCode AS Campaign,
           Fund,
           PaymentType,
           FiscalMonth,
           FiscalYear,
           'Membership' AS GiftType,
           0 AS MatchingTransaction,
           0 AS IsMatchingGift,
           '' AS MemorialID,
           '' AS ListAs,
           0 AS RequestNumber,
           '' AS MemorialNameText,
           CAST(0.00 AS MONEY) AS SoftCreditAmount,
           '' AS SoftCreditDonorID
      FROM [dbo].GiftReport
     WHERE SourceSystem IN ( 'DUES', 'SC' ) AND GiftType = 'GIFT'


    UNION
    
    ---  Select Soft Credit
    
      SELECT MAX(s.[SOFT_CREDIT_ID]) ID,
           MAX(d.OriginalTransaction) OriginalTransaction,
           MAX(d.InvoiceRefNum) AS InvoiceRefNum,
           MAX(d.SourceSystem) SourceSystem,
           MAX(d.TransactionDate) TransactionDate,
           MAX(d.DateReceived) DateReceived,
           CAST(0.00 AS MONEY) AS Amount,
           MAX(d.SolicitorID) SolicitorID,
           MAX(d.CheckNumber) AS CheckNumber,
           MAX(a.[SOURCE_CODE]) AS Appeal,
           MAX(a.[CAMPAIGN_CODE]) AS Campaign,
           MAX(a.[ORG_CODE]) AS Fund,
           MAX(d.PaymentType) AS PaymentType,
           MAX(d.FiscalMonth) AS FiscalMonth,
           MAX(d.FiscalYear) AS FiscalYear,
           'Soft Credit' AS GiftType,
           MAX(d.MatchingTransaction) AS MatchingTransaction,
           MAX(d.IsMatchingGift) AS IsMatchingGift,
           MAX(d.MemorialID) AS MemorialID,
           MAX(d.ListAs) AS ListAs,
           MAX(d.RequestNumber) AS RequestNumber,
           MAX(d.MemorialNameText) AS MemorialNameText,
           SUM(s.[AMOUNT]) AS SoftCreditAmount,
           MAX(d.ID) AS SoftCreditDonorID
      FROM [dbo].DonationReport d
           INNER JOIN [dbo].[Trans_SoftCredit] s ON s.[TRANS_NUMBER] = d.OriginalTransaction
           INNER JOIN [dbo].[Activity] a ON s.[ORIGINATING_ACTIVITY_SEQN] = a.[SEQN]
     WHERE d.SourceSystem = 'FR'
     GROUP BY d.ID,
           d.OriginalTransaction,
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
      SELECT ID, 
             OriginalTransaction, 
             TransactionNumber, 
             SourceSystem, 
             TransactionDate, 
             CASE
                 WHEN SourceSystem = 'FR' THEN DateReceived
                 ELSE TransactionDate 
             END AS DateReceived,
             Amount, 
             Fund, 
             AppealCode AS Appeal, 
             SolicitorID, 
             CheckNumber, 
             PaymentType, 
             CampaignCode AS Campaign, 
             FiscalYear, 
             FiscalMonth, 
             CASE
                 WHEN SourceSystem = 'MEETING' THEN 'Event'
                 ELSE GiftType 
             END AS GiftType, 
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
             MemorialTributeType,
             CONVERT(varchar(512),MemorialTributeMessage) AS MemorialTributeMessage,
             TributeNotificationContactID
        FROM [dbo].[GiftReport]


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

CREATE VIEW [dbo].[vGiftHistory] 
AS
    SELECT d.[OriginalTransaction],
           d.[Fund],
           d.[Campaign],
           d.[Appeal],
           DATEPART(year,d.[TransactionDate]) AS CalendarYear,  
           d.[FiscalYear],
           d.[ID],
           d.[TransactionDate],
           d.[DateReceived],     
           CASE WHEN (SELECT COUNT(v.OriginalTransaction) 
                        FROM vGiftHistoryBase v 
                       WHERE d.OriginalTransaction = v.OriginalTransaction AND d.ID = v.ID) > 1 THEN 'Split-' + d.GiftType
                ELSE d.GiftType 
            END AS GiftType,
           d.[SolicitorID],  
           CASE
                 WHEN d.[GiftType] = 'Soft Credit' THEN 0
                 ELSE d.[Amount] END AS Amount,            
           CASE
                 WHEN d.[GiftType] = 'Soft Credit' THEN 0
                 ELSE SUM(ISNULL(g.[Amount],0)) END AS Received,
           (d.Amount - (CASE WHEN d.[GiftType] = 'Soft Credit' THEN 0
                             ELSE SUM(ISNULL(g.[Amount],0)) 
                         END )) AS Balance,
            d.[SoftCreditAmount] AS SoftCredit,
            d.[SoftCreditDonorID],
           (d.Amount + d.[SoftCreditAmount]) AS TotalCredits,
            g.MemorialNameText,
            g.MemorialTributeType,
            g.MemorialTributeMessage,
            g.TributeNotificationContactID                           
       FROM [dbo].[vGiftHistoryBase] d 
            LEFT OUTER JOIN [dbo].[vGiftsReceivedBase] g ON d.[OriginalTransaction] = g.[OriginalTransaction] 
                                                        AND d.[Fund] = g.[Fund]
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
                d.[SoftCreditDonorID],
                g.MemorialNameText,
                g.MemorialTributeType,
                g.MemorialTributeMessage,
                g.TributeNotificationContactID 


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
CREATE VIEW [dbo].[vBoGiftHistory]
AS
SELECT vGiftHistory.Amount,vGiftHistory.Appeal,vGiftHistory.Balance,vGiftHistory.CalendarYear,vGiftHistory.Campaign,vGiftHistory.DateReceived,vGiftHistory.FiscalYear,vGiftHistory.Fund,vGiftHistory.GiftType,vGiftHistory.ID,vGiftHistory.OriginalTransaction,vGiftHistory.Received,vGiftHistory.SoftCredit,vGiftHistory.SoftCreditDonorID,vGiftHistory.SolicitorID,vGiftHistory.TotalCredits,vGiftHistory.TransactionDate,vGiftHistory.MemorialTributeMessage,vGiftHistory.MemorialTributeType,vGiftHistory.TributeNotificationContactID,vGiftHistory.MemorialNameText
  FROM vGiftHistory
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
CREATE VIEW [dbo].[vBoGiftHistorySummary]
AS
SELECT vGiftHistorySummary.ConsecutiveYearsGiving,vGiftHistorySummary.FirstGiftAmount,vGiftHistorySummary.FirstGiftAppeal,vGiftHistorySummary.FirstGiftDate,vGiftHistorySummary.HighestGiftAmount,vGiftHistorySummary.ID,vGiftHistorySummary.LastGiftAmount,vGiftHistorySummary.LastGiftAppeal,vGiftHistorySummary.LastGiftDate,vGiftHistorySummary.LifetimeGiftValue,vGiftHistorySummary.LowestGiftAmount,vGiftHistorySummary.NextLastGiftAmount,vGiftHistorySummary.NextLastGiftAppeal,vGiftHistorySummary.NextLastGiftDate,vGiftHistorySummary.NumberofGifts,vGiftHistorySummary.AverageGiftValue,vGiftHistorySummary.ConsecutiveYearsGivingToDate,vGiftHistorySummary.GiftsInLast12Months,vGiftHistorySummary.GiftValueLast12Months
  FROM vGiftHistorySummary
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
            CASE WHEN (SELECT COUNT(v.OriginalTransaction) 
                         FROM vGiftHistoryBase v
                        WHERE g.OriginalTransaction = v.OriginalTransaction and g.ID = v.ID) > 1 THEN 'Split-' + g.GiftType
                 ELSE g.GiftType 
             END AS GiftType,
            g.[PaymentType] AS PaymentMethod,
            g.[SolicitorID],  
            g.[Amount],
            g.MemorialNameText,
            g.MemorialTributeType,
            g.MemorialTributeMessage,
            g.TributeNotificationContactID                                             
       FROM [dbo].[vGiftsReceivedBase] g
      GROUP BY g.[OriginalTransaction],
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
               g.[Amount],   
               g.MemorialNameText,
               g.MemorialTributeType,
               g.MemorialTributeMessage,
               g.TributeNotificationContactID                           


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
CREATE VIEW [dbo].[vBoGiftsReceived]
AS
SELECT vGiftsReceived.Amount,vGiftsReceived.Appeal,vGiftsReceived.CalendarYear,vGiftsReceived.Campaign,vGiftsReceived.DateReceived,vGiftsReceived.FiscalYear,vGiftsReceived.Fund,vGiftsReceived.GiftType,vGiftsReceived.ID,vGiftsReceived.OriginalTransaction,vGiftsReceived.PaymentMethod,vGiftsReceived.SolicitorID,vGiftsReceived.TransactionDate,vGiftsReceived.TransactionNumber,vGiftsReceived.MemorialTributeMessage,vGiftsReceived.MemorialTributeType,vGiftsReceived.TributeNotificationContactID,vGiftsReceived.MemorialNameText
  FROM vGiftsReceived
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
CREATE VIEW [dbo].[vBoGLEntryTypeRef]
AS
SELECT GLEntryTypeRef.GLEntryTypeDesc,GLEntryTypeRef.GLEntryTypeCode
  FROM GLEntryTypeRef
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
CREATE VIEW [dbo].[vBoGLExportSummaryLevelRef]
AS
SELECT GLExportSummaryLevelRef.GLExportSummaryLevelCode,GLExportSummaryLevelRef.GLExportSummaryLevelDesc,GLExportSummaryLevelRef.GLExportSummaryLevelName
  FROM GLExportSummaryLevelRef
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
CREATE VIEW [dbo].[vBoGLSourceItemTypeRef]
AS
SELECT GLSourceItemTypeRef.GLSourceItemTypeDesc,GLSourceItemTypeRef.GLSourceItemTypeCode
  FROM GLSourceItemTypeRef
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
CREATE VIEW [dbo].[vBoGrade]
AS
SELECT GradeRef.GradeKey,GradeRef.GradeValue AS Value
  FROM GradeRef
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
CREATE VIEW [dbo].[vBoGroup]
AS
SELECT GroupMain.Description,GroupMain.Name,GroupMain.UpdatedByUserKey,GroupMain.UpdatedOn,GroupMain.IsSystem,GroupMain.GroupTypeKey,GroupMain.OwnerAccessKey,GroupMain.OverrideOwnerGroupKey,GroupMain.Priority,GroupMain.IsAutoGenerated,GroupMain.AccessKey,GroupMain.CreatedByUserKey,GroupMain.CreatedOn,GroupMain.GroupKey,GroupMain.SystemEntityKey,GroupMain.IsInvitationOnly,GroupMain.IsSimpleGroup,GroupMain.IsSingleRole,GroupMain.GroupStatusCode AS StatusCode,GroupMain.InheritRolesFlag AS InheritRoles
  FROM GroupMain
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
CREATE VIEW [dbo].[vBoGroupInfo]
AS
SELECT vGroupInfo.DropDate,vGroupInfo.GroupDesc,vGroupInfo.GroupKey,vGroupInfo.GroupMemberKey,vGroupInfo.GroupName,vGroupInfo.GroupStatusCode,vGroupInfo.GroupTypeDesc,vGroupInfo.GroupTypeKey,vGroupInfo.GroupTypeName,vGroupInfo.InheritRolesFlag,vGroupInfo.IsActiveMember,vGroupInfo.IsAutoGenerated,vGroupInfo.IsDateLimited,vGroupInfo.IsSimpleGroup,vGroupInfo.JoinDate,vGroupInfo.MemberContactKey
  FROM vGroupInfo
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
CREATE VIEW [dbo].[vBoGroupInstanceRole]
AS
SELECT GroupInstanceRole.GroupKey,GroupInstanceRole.GroupRoleKey,GroupInstanceRole.IsRequired,GroupInstanceRole.SortRank,GroupInstanceRole.IsUnique,GroupInstanceRole.DefaultMemberStatusCode,GroupInstanceRole.IsDefault,GroupInstanceRole.GroupInstanceRoleKey
  FROM GroupInstanceRole
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
CREATE VIEW [dbo].[vBoGroupLinkReport]
AS
SELECT vGroupLinkReport.OpportunityId,vGroupLinkReport.OpportunityKey,vGroupLinkReport.OpportunityOwnerGroupKey,vGroupLinkReport.RegionalManager,vGroupLinkReport.Salesman
  FROM vGroupLinkReport
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
CREATE VIEW [dbo].[vBoGroupMember]
AS
SELECT GroupMember.CreatedByUserKey,GroupMember.CreatedOn,GroupMember.DropDate,GroupMember.GroupKey,GroupMember.GroupMemberKey,GroupMember.JoinDate,GroupMember.MemberContactKey,GroupMember.UpdatedByUserKey,GroupMember.UpdatedOn,GroupMember.IsActive
  FROM GroupMember
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
CREATE VIEW [dbo].[vBoGroupMemberDetail]
AS
SELECT GroupMemberDetail.CreatedByUserKey,GroupMemberDetail.CreatedOn,GroupMemberDetail.EffectiveDate,GroupMemberDetail.ExpirationDate,GroupMemberDetail.GroupMemberKey,GroupMemberDetail.GroupRoleKey,GroupMemberDetail.UpdatedByUserKey,GroupMemberDetail.UpdatedOn,GroupMemberDetail.TypeSpecificData,GroupMemberDetail.TypeSpecificFlag,GroupMemberDetail.TypeSpecificKey,GroupMemberDetail.TypeSpecificInt,GroupMemberDetail.GroupMemberStatusCode,GroupMemberDetail.IsActive,GroupMemberDetail.GroupMemberDetailKey,GroupMemberDetail.GroupKey,GroupMemberDetail.RecurringTransactionInstructionKey
  FROM GroupMemberDetail
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
CREATE VIEW [dbo].[vBoGroupMemberOptions]
AS
SELECT GroupMemberOptions.GroupBillingFullAddressKey,GroupMemberOptions.GroupContactFullAddressKey,GroupMemberOptions.GroupMemberKey,GroupMemberOptions.OptOutFlag
  FROM GroupMemberOptions
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
CREATE VIEW [dbo].[vBoGroupMemberStatusRef]
AS
SELECT GroupMemberStatusRef.GroupMemberStatusCode,GroupMemberStatusRef.IsActiveStatus,GroupMemberStatusRef.GroupMemberStatusDesc AS Description
  FROM GroupMemberStatusRef
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
CREATE VIEW [dbo].[vBoGroupPerspective]
AS
SELECT GroupPerspective.GroupKey,GroupPerspective.GroupPerspectiveKey,GroupPerspective.IsDefaultFlag AS IsDefault,GroupPerspective.PerspectiveKey
  FROM GroupPerspective
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
CREATE VIEW [dbo].[vBoGroupReport]
AS
SELECT vGroupReport.GroupKey,vGroupReport.GroupMemberKey,vGroupReport.GroupName,vGroupReport.MemberContactKey,vGroupReport.GroupTypeName,vGroupReport.DropDate,vGroupReport.GroupMemberStatusCode,vGroupReport.GroupRoleDesc,vGroupReport.GroupStatusDesc,vGroupReport.IsActive,vGroupReport.JoinDate,vGroupReport.TypeSpecificData,vGroupReport.EffectiveDate,vGroupReport.ExpirationDate,vGroupReport.InheritRolesFlag,vGroupReport.IsAutoGenerated,vGroupReport.IsInvitationOnly,vGroupReport.IsSimpleGroup,vGroupReport.IsSingleRole,vGroupReport.IsSystem,vGroupReport.Priority,vGroupReport.SystemEntityKey,vGroupReport.GroupDescription,vGroupReport.GroupMemberStatusDesc
  FROM vGroupReport
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
CREATE VIEW [dbo].[vBoGroupRoleRef]
AS
SELECT GroupRoleRef.GroupRoleDesc AS Description,GroupRoleRef.GroupRoleKey,GroupRoleRef.IsActive,GroupRoleRef.IsSystem,GroupRoleRef.GroupRoleName AS Name
  FROM GroupRoleRef
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
CREATE VIEW [dbo].[vBoGroupStatusRef]
AS
SELECT GroupStatusRef.GroupStatusCode,GroupStatusRef.GroupStatusDesc AS Description,GroupStatusRef.IsActiveStatus,GroupStatusRef.IsDefault
  FROM GroupStatusRef
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
CREATE VIEW [dbo].[vBoGroupTypeMemberStatus]
AS
SELECT GroupTypeMemberStatus.GroupMemberStatusCode,GroupTypeMemberStatus.GroupTypeKey,GroupTypeMemberStatus.IsActiveStatus,GroupTypeMemberStatus.Priority,GroupTypeMemberStatus.GroupTypeMemberStatusKey
  FROM GroupTypeMemberStatus
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
CREATE VIEW [dbo].[vBoGroupTypeRef]
AS
SELECT GroupTypeRef.GroupTypeKey,GroupTypeRef.IsDateLimited,GroupTypeRef.IsPaymentRequired,GroupTypeRef.IsSystem,GroupTypeRef.DefaultGroupStatusCode,GroupTypeRef.IsInvitationOnly,GroupTypeRef.IsSimpleGroup,GroupTypeRef.MemberQueryFolderKey,GroupTypeRef.GroupMemberBranchName,GroupTypeRef.InheritRolesFlag,GroupTypeRef.IsSingleRole,GroupTypeRef.GroupTypeDesc AS Description,GroupTypeRef.GroupTypeName AS Name,GroupTypeRef.CreatedByUserKey,GroupTypeRef.CreatedOn,GroupTypeRef.UpdatedByUserKey,GroupTypeRef.UpdatedOn,GroupTypeRef.LandingPageContentKey,GroupTypeRef.IsRelationshipGroup
  FROM GroupTypeRef
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
CREATE VIEW [dbo].[vBoGroupTypeRole]
AS
SELECT GroupTypeRole.GroupRoleKey,GroupTypeRole.GroupTypeKey,GroupTypeRole.IsRequired,GroupTypeRole.SortRank,GroupTypeRole.IsUnique,GroupTypeRole.DefaultMemberStatusCode,GroupTypeRole.IsDefault,GroupTypeRole.IsSystem,GroupTypeRole.GroupTypeRoleKey
  FROM GroupTypeRole
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
CREATE VIEW [dbo].[vBoHandlingPriceRef]
AS
SELECT HandlingPriceRef.HandlingPriceCode,HandlingPriceRef.HandlingPriceDesc,HandlingPriceRef.DisplayPrompt
  FROM HandlingPriceRef
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
CREATE VIEW [dbo].[vBoHierarchy]
AS
SELECT Hierarchy.Depth,Hierarchy.HierarchyKey,Hierarchy.IsChildAMemberOfParent,Hierarchy.ParentHierarchyKey,Hierarchy.RootHierarchyKey,Hierarchy.SortOrder,Hierarchy.UniformKey,Hierarchy.UniformType,Hierarchy.HierarchyCode
  FROM Hierarchy
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
CREATE VIEW [dbo].[vBoHierarchyRoot]
AS
SELECT HierarchyRoot.RootHierarchyKey AS HierarchyRootKey,HierarchyRoot.HierarchyRootName AS Name,HierarchyRoot.HierarchyRootDescription AS Description,HierarchyRoot.UniformType,HierarchyRoot.OrganizationKey,HierarchyRoot.AccessKey,HierarchyRoot.CreatedByUserKey,HierarchyRoot.CreatedOn,HierarchyRoot.UpdatedByUserKey,HierarchyRoot.UpdatedOn
  FROM HierarchyRoot
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
CREATE VIEW [dbo].[vBoHINonPhysicalContactAddress]
AS
SELECT AddressMain.AddressStatusCode,AddressMain.BadAddressReasonKey,AddressMain.FormattedAddress,ContactAddress.AddressCategoryCode,ContactAddress.AddressKey,ContactAddress.AddressTypeKey,ContactAddress.ContactAddressKey,ContactAddress.ContactKey,AddressTypeRef.DisplayOrder AS AddressTypeDisplayOrder
  FROM ContactAddress
	INNER JOIN AddressMain
		ON ContactAddress.AddressKey = AddressMain.AddressKey
	INNER JOIN AddressTypeRef
		ON ContactAddress.AddressTypeKey = AddressTypeRef.AddressTypeKey
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
CREATE VIEW [dbo].[vBoIndividual]
AS
SELECT ContactMain.ContactStatusCode,ContactMain.FullName,ContactMain.NoSolicitationFlag AS NoSolicitation,ContactMain.SortName,ContactMain.SyncContactID,ContactMain.TaxIDNumber,ContactMain.UpdatedByUserKey,ContactMain.UpdatedOn,ContactMain.ID,ContactMain.PreferredAddressCategoryCode,ContactMain.IsSortNameOverridden,ContactMain.IsInstitute,ContactMain.AccessKey,ContactMain.ContactKey,ContactMain.CreatedByUserKey,ContactMain.CreatedOn,ContactMain.MajorKey,ContactMain.PrimaryMembershipGroupKey,ContactMain.TextOnlyEmailFlag,ContactMain.ContactTypeKey,ContactMain.IsIDEditable,ContactMain.OptOutFlag AS OptOut,Individual.BirthDate,Individual.FirstName,Individual.Gender,Individual.Informal,Individual.LastName,Individual.MiddleName,Individual.PrefixCode,Individual.SuffixCode,Individual.Designation,Individual.PrimaryInstituteContactKey,Individual.PrimaryInstituteName,Individual.PrimaryInstituteTitle
  FROM ContactMain
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
CREATE VIEW [dbo].[vBoInstitute]
AS
SELECT ContactMain.ContactStatusCode,ContactMain.FullName,ContactMain.NoSolicitationFlag AS NoSolicitation,ContactMain.SortName,ContactMain.SyncContactID,ContactMain.TaxIDNumber,ContactMain.UpdatedByUserKey,ContactMain.UpdatedOn,ContactMain.ID,ContactMain.PreferredAddressCategoryCode,ContactMain.IsSortNameOverridden,ContactMain.IsInstitute,ContactMain.AccessKey,ContactMain.ContactKey,ContactMain.CreatedByUserKey,ContactMain.CreatedOn,ContactMain.MajorKey,ContactMain.PrimaryMembershipGroupKey,ContactMain.TextOnlyEmailFlag,ContactMain.ContactTypeKey,ContactMain.IsIDEditable,ContactMain.OptOutFlag AS OptOut,Institute.InstituteGroupKey,Institute.InstituteName,Institute.PrimaryContactKey
  FROM ContactMain
	INNER JOIN Institute
		ON ContactMain.ContactKey = Institute.ContactKey
 WHERE ContactMain.IsInstitute = 1
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoInteractionLog]'))
    DROP VIEW [dbo].[vBoInteractionLog]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoInteractionLog]
AS
SELECT CommunicationLog.Communication,CommunicationLog.CommunicationLogKey,CommunicationLog.CommunicationLogStatusCode,CommunicationLog.CommunicationReasonKey,CommunicationLog.CreatedByUserKey,CommunicationLog.CreatedOn,CommunicationLog.Html,CommunicationLog.SourceCodeKey,CommunicationLog.SourceProcess,CommunicationLog.Subject,CommunicationLog.Text,CommunicationLog.UpdatedByUserKey,CommunicationLog.UpdatedOn,CommunicationLogRecipient.Address,CommunicationLogRecipient.CommunicationLogKey AS CommunicationLogKey_1,CommunicationLogRecipient.CommunicationLogRecipientKey,CommunicationLogRecipient.ContactKey,CommunicationLogRecipient.CreatedByUserKey AS CreatedByUserKey_1,CommunicationLogRecipient.CreatedOn AS CreatedOn_1,CommunicationLogRecipient.IsSpam,CommunicationLogRecipient.IsUnsubscribed,CommunicationLogRecipient.LastCommunicationLogEventTypeCode,CommunicationLogRecipient.LastEventReason,CommunicationLogRecipient.MessageType,CommunicationLogRecipient.UpdatedByUserKey AS UpdatedByUserKey_1,CommunicationLogRecipient.UpdatedOn AS UpdatedOn_1,CommunicationLogRecipient.LastEventDateTime,CommunicationLogRecipient.MessageId
  FROM CommunicationLogRecipient
	INNER JOIN CommunicationLog
		ON CommunicationLogRecipient.CommunicationLogKey = CommunicationLog.CommunicationLogKey
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
CREATE VIEW [dbo].[vBoIntervalTypeRef]
AS
SELECT IntervalTypeRef.IntervalTypeCode,IntervalTypeRef.IntervalTypeDesc,IntervalTypeRef.IntervalTypeName
  FROM IntervalTypeRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoInvoiceSummary]'))
    DROP VIEW [dbo].[vBoInvoiceSummary]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoInvoiceSummary]
AS
SELECT vSoaInvoiceSummary.AccountingMethod,vSoaInvoiceSummary.Balance,vSoaInvoiceSummary.BillToPartyId,vSoaInvoiceSummary.Description,vSoaInvoiceSummary.FinancialEntityId,vSoaInvoiceSummary.InvoiceAmount,vSoaInvoiceSummary.InvoiceDate,vSoaInvoiceSummary.InvoiceId,vSoaInvoiceSummary.InvoiceNumber,vSoaInvoiceSummary.InvoiceType,vSoaInvoiceSummary.PaymentAdjustmentAmount,vSoaInvoiceSummary.PendingPaymentAdjustmentAmount,vSoaInvoiceSummary.SoldToPartyId
  FROM vSoaInvoiceSummary
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
CREATE VIEW [dbo].[vBoInvoiceTypeRef]
AS
SELECT InvoiceTypeRef.InvoiceTypeCode,InvoiceTypeRef.InvoiceTypeDesc
  FROM InvoiceTypeRef
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
CREATE VIEW [dbo].[vBoJournalEntryTypeRef]
AS
SELECT JournalEntryTypeRef.JournalEntryTypeDesc,JournalEntryTypeRef.JournalEntryTypeCode
  FROM JournalEntryTypeRef
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
CREATE VIEW [dbo].[vBoLicense]
AS
SELECT License.LicenseKey,License.LicenseDesc AS Description,License.LicenseName AS Name
  FROM License
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
CREATE VIEW [dbo].[vBoLicenseMain]
AS
SELECT LicenseMain.EffectiveDate,LicenseMain.ExpirationDate,LicenseMain.LicenseKey,LicenseMain.LicenseMasterKey,LicenseMain.NamedLicenseCount,LicenseMain.OrganizationKey,LicenseMain.UnnamedLicenseCount,LicenseMain.Checksum
  FROM LicenseMain
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
CREATE VIEW [dbo].[vBoLicenseMap]
AS
SELECT LicenseMap.LicenseKey,LicenseMap.LicenseType
  FROM LicenseMap
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
CREATE VIEW [dbo].[vBoLicenseMapMaster]
AS
SELECT LicenseMapMaster.CreatedByUserKey,LicenseMapMaster.CreatedOn,LicenseMapMaster.LicenseKey,LicenseMapMaster.LicenseType,LicenseMapMaster.UpdatedByUserKey,LicenseMapMaster.UpdatedOn
  FROM LicenseMapMaster
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
CREATE VIEW [dbo].[vBoLicenseMaster]
AS
SELECT LicenseMaster.EffectiveDate,LicenseMaster.ExpirationDate,LicenseMaster.LicenseKey,LicenseMaster.LicenseMasterKey,LicenseMaster.NamedLicenseCount,LicenseMaster.UnnamedLicenseCount,LicenseMaster.UpdatedByUserKey,LicenseMaster.UpdatedOn,LicenseMaster.LicenseOrganizationKey,LicenseMaster.Checksum,LicenseMaster.CreatedByUserKey,LicenseMaster.CreatedOn
  FROM LicenseMaster
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
CREATE VIEW [dbo].[vBoLicenseOrganization]
AS
SELECT LicenseOrganization.CreatedByUserKey,LicenseOrganization.Name,LicenseOrganization.UpdatedByUserKey,LicenseOrganization.Description,LicenseOrganization.LicenseOrganizationKey
  FROM LicenseOrganization
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
CREATE VIEW [dbo].[vBoLicenseTypeRef]
AS
SELECT LicenseTypeRef.CreatedByUserKey,LicenseTypeRef.CreatedOn,LicenseTypeRef.Description,LicenseTypeRef.LicenseType,LicenseTypeRef.UpdatedByUserKey,LicenseTypeRef.UpdatedOn
  FROM LicenseTypeRef
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
CREATE VIEW [dbo].[vBoLicenseUser]
AS
SELECT LicenseUser.LicenseKey,LicenseUser.UserKey,LicenseUser.CreatedByUserKey,LicenseUser.CreatedOn
  FROM LicenseUser
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
CREATE VIEW [dbo].[vBoLinePricingRef]
AS
SELECT LinePricingRef.LinePricingCode,LinePricingRef.LinePricingDesc,LinePricingRef.LinePricingName
  FROM LinePricingRef
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
CREATE VIEW [dbo].[vBoListElement]
AS
SELECT ListItem.CreatedByUserKey,ListItem.CreatedOn,ListItem.IsDisabled,ListItem.ListItemKey,ListItem.ListKey,ListItem.ObjectKey,ListItem.LinkedObjectKey
  FROM ListItem
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
CREATE VIEW [dbo].[vBoListEntity]
AS
SELECT ListMain.ListKey,ListMain.MemberObjectType
  FROM ListMain
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
CREATE VIEW [dbo].[vBoLocaleRef]
AS
SELECT LocaleRef.LocaleCode,LocaleRef.LocaleKey
  FROM LocaleRef
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
CREATE VIEW [dbo].[vBoLocation]
AS
SELECT Location.ContactKey,Location.CreatedByUserKey,Location.CreatedOn,Location.LocationDescription,Location.LocationKey,Location.LocationName,Location.LocationStatusCode,Location.UpdatedByUserKey,Location.UpdatedOn
  FROM Location
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
CREATE VIEW [dbo].[vBoLocationStatus]
AS
SELECT LocationStatusRef.LocationStatusCode,LocationStatusRef.LocationStatusName
  FROM LocationStatusRef
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
CREATE VIEW [dbo].[vBoMailCodeRef]
AS
SELECT MailCodeRef.MailCode AS Code,MailCodeRef.MailCodeDesc AS Description,MailCodeRef.UpdatedByUserKey,MailCodeRef.UpdatedOn
  FROM MailCodeRef
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
CREATE VIEW [dbo].[vBoMatchingGift]
AS
SELECT MatchingGift.MatchedAmount,MatchingGift.MatchingGiftKey,MatchingGift.MatchingGiftPlanKey,MatchingGift.MatchingGiftRelationshipKey,MatchingGift.MatchingContactKey,MatchingGift.MatchingGiftInfo,MatchingGift.MatchingOrderLineKey,MatchingGift.OriginalOrderLineKey
  FROM MatchingGift
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
CREATE VIEW [dbo].[vBoMatchingGiftPlan]
AS
SELECT MatchingGiftPlan.CorporateGiftContactKey,MatchingGiftPlan.EffectiveDate,MatchingGiftPlan.MatchingGiftContactKey,MatchingGiftPlan.MatchingGiftPlanTypeKey,MatchingGiftPlan.MatchingMode,MatchingGiftPlan.MatchingRatio,MatchingGiftPlan.MaximumMatchPeriod,MatchingGiftPlan.Name,MatchingGiftPlan.PlanProcedure,MatchingGiftPlan.PreferredMatchingProductKey,MatchingGiftPlan.RulesDescription,MatchingGiftPlan.TerminationDate,MatchingGiftPlan.UpdatedByUserKey,MatchingGiftPlan.UpdatedOn,MatchingGiftPlan.IsAutomatch,MatchingGiftPlan.OwnerContactKey,MatchingGiftPlan.MaximumMatchAmount,MatchingGiftPlan.IsGiftQualified,MatchingGiftPlan.IsPledgeQualified,MatchingGiftPlan.AccessKey,MatchingGiftPlan.CreatedByUserKey,MatchingGiftPlan.CreatedOn,MatchingGiftPlan.MatchingGiftPlanKey,MatchingGiftPlan.SystemEntityKey
  FROM MatchingGiftPlan
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
CREATE VIEW [dbo].[vBoMatchingGiftPlanFundType]
AS
SELECT MatchingGiftPlanFundType.FundTypeKey,MatchingGiftPlanFundType.MatchingGiftPlanFundTypeKey,MatchingGiftPlanFundType.MatchingGiftPlanKey
  FROM MatchingGiftPlanFundType
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
CREATE VIEW [dbo].[vBoMatchingGiftPlanRelationship]
AS
SELECT MatchingGiftPlanRelationship.MatchingGiftPlanKey,MatchingGiftPlanRelationship.MatchingGiftPlanRelationshipKey,MatchingGiftPlanRelationship.RelationshipTypeKey
  FROM MatchingGiftPlanRelationship
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
CREATE VIEW [dbo].[vBoMatchingGiftPlanRule]
AS
SELECT MatchingGiftPlanRule.MatchingGiftPlanKey,MatchingGiftPlanRule.MatchingGiftPlanRuleKey,MatchingGiftPlanRule.RuleKey
  FROM MatchingGiftPlanRule
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
CREATE VIEW [dbo].[vBoMatchingGiftPlanTypeRef]
AS
SELECT MatchingGiftPlanTypeRef.IsActive,MatchingGiftPlanTypeRef.MatchingGiftPlanDesc,MatchingGiftPlanTypeRef.MatchingGiftPlanTypeKey
  FROM MatchingGiftPlanTypeRef
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
CREATE VIEW [dbo].[vBoMatchingModeRef]
AS
SELECT MatchingModeRef.MatchingModeCode,MatchingModeRef.MatchingModeDesc,MatchingModeRef.MatchingModeName
  FROM MatchingModeRef
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
CREATE VIEW [dbo].[vBoMatchingPeriodRef]
AS
SELECT MatchingPeriodRef.MatchingPeriodCode,MatchingPeriodRef.MatchingPeriodDesc,MatchingPeriodRef.MatchingPeriodName
  FROM MatchingPeriodRef
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
CREATE VIEW [dbo].[vBoMemorialTribute]
AS
SELECT MemorialTribute.FRProductKey,MemorialTribute.MemorialTributeCodeKey,MemorialTribute.NotificationGroupKey,MemorialTribute.MemorialTributeKey,MemorialTribute.Description,MemorialTribute.HonoreeContactKey,MemorialTribute.UseDefaultDescriptionFlag
  FROM MemorialTribute
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
CREATE VIEW [dbo].[vBoMemorialTributeCodeRef]
AS
SELECT MemorialTributeCodeRef.MemorialTributeCodeKey,MemorialTributeCodeRef.Code,MemorialTributeCodeRef.Description
  FROM MemorialTributeCodeRef
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
CREATE VIEW [dbo].[vBoMemorialTributeNotificationMember]
AS
SELECT GroupMember.CreatedByUserKey,GroupMember.CreatedOn,GroupMember.DropDate,GroupMember.GroupKey,GroupMember.GroupMemberKey,GroupMember.JoinDate,GroupMember.MemberContactKey,GroupMember.UpdatedByUserKey,GroupMember.UpdatedOn,GroupMember.IsActive,MemorialTributeNotificationMember.RelationshipKey,MemorialTributeNotificationMember.MemorialTributeNotificationPreferenceCode
  FROM GroupMember
	INNER JOIN MemorialTributeNotificationMember
		ON GroupMember.GroupMemberKey = MemorialTributeNotificationMember.GroupMemberKey
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
CREATE VIEW [dbo].[vBoMethodSetTypeRef]
AS
SELECT MethodSetTypeRef.MethodSetTypeCode AS Code,MethodSetTypeRef.MethodSetTypeDesc AS Description
  FROM MethodSetTypeRef
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
CREATE VIEW [dbo].[vBoNavigationHierarchy]
AS
SELECT Hierarchy.Depth,Hierarchy.HierarchyKey,Hierarchy.IsChildAMemberOfParent,Hierarchy.ParentHierarchyKey,Hierarchy.RootHierarchyKey,Hierarchy.SortOrder,Hierarchy.UniformKey,Hierarchy.UniformType,Hierarchy.HierarchyCode,Perspective.PerspectiveKey,Perspective.PerspectiveName,Perspective.WebsiteKey,DocumentMain.AlternateName,DocumentMain.Blob,DocumentMain.DocumentCode,DocumentMain.DocumentDescription,DocumentMain.DocumentKey,DocumentMain.DocumentName,DocumentMain.DocumentStatusCode,DocumentMain.DocumentTypeCode,DocumentMain.DocumentVersionKey,DocumentMain.IsSystem,DocumentMain.RelatedDocumentVersionKey,DocumentMain.UpdatedByUserKey,DocumentMain.UpdatedOn
  FROM Hierarchy
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
CREATE VIEW [dbo].[vBoNavigationHierarchyCM]
AS
SELECT Hierarchy.Depth,Hierarchy.HierarchyKey,Hierarchy.IsChildAMemberOfParent,Hierarchy.ParentHierarchyKey,Hierarchy.RootHierarchyKey,Hierarchy.SortOrder,Hierarchy.UniformKey,Hierarchy.UniformType,Hierarchy.HierarchyCode,Perspective.PerspectiveKey,Perspective.PerspectiveName,Perspective.WebsiteKey,DocumentMain.DocumentName,DocumentMain.DocumentKey,DocumentMain.DocumentDescription,DocumentMain.DocumentStatusCode,DocumentMain.DocumentTypeCode,DocumentMain.IsSystem,DocumentMain.UpdatedByUserKey,DocumentMain.UpdatedOn,DocumentMain.Blob,DocumentMain.DocumentCode,DocumentMain.AlternateName,DocumentMain.DocumentVersionKey,DocumentMain.RelatedDocumentVersionKey
  FROM DocumentMain
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
CREATE VIEW [dbo].[vBoNavigationPane]
AS
SELECT NavigationPaneRef.DynamicDisplayLevels,NavigationPaneRef.HighlightTopAncestorFlag,NavigationPaneRef.NavigationPaneCode AS Code,NavigationPaneRef.NavigationPaneName AS Name,NavigationPaneRef.StartingLevel,NavigationPaneRef.StaticDisplayLevels
  FROM NavigationPaneRef
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
CREATE VIEW [dbo].[vBoNavigationWorkflow]
AS
SELECT NavigationWorkflowParameters.DocumentVersionKey,NavigationWorkflowParameters.NotifyContactKey,NavigationWorkflowParameters.RemoveAfterDays
  FROM NavigationWorkflowParameters
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
CREATE VIEW [dbo].[vBoNetContact]
AS
SELECT Name.ADDRESS_NUM_1 AS AddressNumber1,Name.ADDRESS_NUM_2 AS AddressNumber2,Name.ADDRESS_NUM_3 AS AddressNumber3,Name.BAR_CODE AS BarCode,Name.BILL_ADDRESS_NUM AS BillAddressNum,Name.BIRTH_DATE AS BirthDate,Name.CATEGORY AS Category,Name.CHAPTER AS Chapter,Name.CO_ID AS CompanyId,Name.CO_MEMBER_TYPE AS CompanyMemberType,Name.COMPANY AS Company,Name.COMPANY_SORT AS CompanySort,Name.CONTACT_RANK AS ContactRank,Name.COUNTRY AS Country,Name.COUNTY AS County,Name.CRRT AS Crrt,Name.DATE_ADDED AS DateAdded,Name.DESIGNATION AS Designation,Name.DUP_MATCH_KEY AS DupMatchKey,Name.EMAIL AS Email,Name.EXCLUDE_DIRECTORY AS ExcludeDirectory,Name.EXCLUDE_MAIL AS ExcludeMail,Name.FAX AS Fax,Name.FULL_ADDRESS AS FullAddress,Name.FUNCTIONAL_TITLE AS FunctionalTitle,Name.GENDER AS Gender,Name.HOME_PHONE AS HomePhone,Name.INFORMAL AS Informal,Name.INTENT_TO_EDIT AS IntentToEdit,Name.JOIN_DATE AS JoinDate,Name.LAST_FIRST AS LastFirst,Name.LAST_NAME AS LastName,Name.LAST_UPDATED AS LastUpdated,Name.MAIL_ADDRESS_NUM AS MailAddressNumber,Name.MAIL_CODE AS MailCode,Name.MAJOR_KEY AS MajorKey,Name.MEMBER_RECORD AS IsMember,Name.MEMBER_STATUS AS MemberStatus,Name.MEMBER_STATUS_DATE AS MemberStatusDate,Name.MEMBER_TYPE AS MemberType,Name.MIDDLE_NAME AS MiddleName,Name.MT_CHANGE_DATE AS MemberTypeChangeDate,Name.ORG_CODE AS EntityCode,Name.PAID_THRU AS PaidThrough,Name.PREFIX AS Prefix,Name.PREVIOUS_MT AS PreviousMemberType,Name.SIC_CODE AS SicCode,Name.SOURCE_CODE AS SourceCode,Name.STATE_HOUSE AS StateHouse,Name.STATE_PROVINCE AS StateProvince,Name.STATE_SENATE AS StateSenate,Name.STATUS AS Status,Name.SUFFIX AS Suffix,Name.TITLE AS Title,Name.UPDATED_BY AS UpdatedBy,Name.US_CONGRESS AS UsCongress,Name.WEBSITE AS Website,Name.WORK_PHONE AS WorkPhone,Name.ZIP AS Zip,Name.FIRST_NAME AS FirstName,Name.CITY AS City,Name.TOLL_FREE AS TollFree,Name.BT_ID AS BillToID,Name.SHIP_ADDRESS_NUM AS ShipAddressNum,Name.ID,ContactMain.ContactKey,ContactMain.CreatedByUserKey,ContactMain.CreatedOn,ContactMain.UpdatedByUserKey,ContactMain.UpdatedOn,ContactMain.AccessKey,ContactMain.FullName,ContactMain.IsInstitute AS IsCompany,Name_Fin.BACKORDERS AS Backorders,Name_Fin.CREDIT_LIMIT AS CreditLimit,Name_Fin.NO_STATEMENTS AS NoStatements,Name_Fin.RENEW_MONTHS AS RenewMonths,Name_Fin.RENEWED_THRU AS RenewedThru,Name_Fin.TAX_AUTHOR_DEFAULT AS DefaultTaxAuthority,Name_Fin.TAX_EXEMPT AS TaxExempt,Name_Fin.TERMS_CODE AS DefaultTermsCode,Name_Fin.USE_VAT_TAXATION AS VatExempt,Name_Fin.VAT_COUNTRY AS VatCountry,Name_Fin.VAT_REG_NUMBER AS VatRegNumber,ContactMain.ContactStatusCode,ContactMain.SortName,ContactMain.TaxIDNumber
  FROM ContactMain
	INNER JOIN Name
		ON ContactMain.SyncContactID = Name.ID
	INNER JOIN Name_Fin
		ON Name.ID = Name_Fin.ID
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
CREATE VIEW [dbo].[vBoNote]
AS
SELECT Note.NoteForUniformKey,Note.NotePurposeKey,Note.NoteText,Note.UpdatedByUserKey,Note.UpdatedOn,Note.AccessKey,Note.CreatedByUserKey,Note.CreatedOn,Note.NoteKey
  FROM Note
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
CREATE VIEW [dbo].[vBoNotePurposeRef]
AS
SELECT NotePurposeRef.NotePurposeKey,NotePurposeRef.NotePurposeDesc
  FROM NotePurposeRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoNrdsLog]'))
    DROP VIEW [dbo].[vBoNrdsLog]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoNrdsLog]
AS
SELECT AsiNrdsLog.Direction,AsiNrdsLog.ID,AsiNrdsLog.LogDateTime,AsiNrdsLog.Message,AsiNrdsLog.NrdsId,AsiNrdsLog.RecordType,AsiNrdsLog.Status
  FROM AsiNrdsLog
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
CREATE VIEW [dbo].[vBoOfferedCustomerExperience]
AS
SELECT CustomerExperience.CustomerExperienceKey,CustomerExperience.CustomerExperienceNote AS Note,CustomerExperience.CustomerExperienceStatusCode,CustomerExperience.CreatedByUserKey,CustomerExperience.CreatedOn,CustomerExperience.ContactKey,OfferedCustomerExperience.OfferedCustomerExperienceGrade AS Grade,OfferedCustomerExperience.OfferedCustomerExperienceKey,OfferedCustomerExperience.OfferingKey,OfferedCustomerExperience.OfferedCustomerExperienceGradeKey,OfferedCustomerExperience.OfferedCustomerExperienceDate
  FROM CustomerExperience
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
CREATE VIEW [dbo].[vBoOffering]
AS
SELECT Offering.ContactKey AS Provider,Offering.ExperienceDefinitionKey,Offering.LocationKey AS Location,Offering.OfferingCode AS Code,Offering.OfferingDate AS Date,Offering.OfferingDesc AS Description,Offering.OfferingKey,Offering.OfferingName AS Name,Offering.UpdatedByUserKey,Offering.UpdatedOn,Offering.CreatedByUserKey,Offering.CreatedOn,Offering.MarkedForDeleteOn,Offering.OfferingStatusCode AS StatusCode,Offering.AllowChangesFlag AS AllowChanges,Offering.LinkedProgramKey,Offering.LinkedItemCode,Offering.OfferingType,Offering.PurchaseMarksCompletionFlag AS PurchaseMarksCompletion
  FROM Offering
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
CREATE VIEW [dbo].[vBoOfferingStatus]
AS
SELECT OfferingStatusRef.OfferingStatusCode AS Code,OfferingStatusRef.OfferingStatusName AS Name
  FROM OfferingStatusRef
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
CREATE VIEW [dbo].[vBoOppDonorContact]
AS
SELECT vOppDonorContact.Actual,vOppDonorContact.Address,vOppDonorContact.City,vOppDonorContact.ContactRank,vOppDonorContact.Country,vOppDonorContact.CurrentStage,vOppDonorContact.DecisionDate,vOppDonorContact.Designation,vOppDonorContact.Distribution,vOppDonorContact.Email,vOppDonorContact.Fax,vOppDonorContact.FunctionalTitle,vOppDonorContact.GroupName,vOppDonorContact.GroupTypeName,vOppDonorContact.HomePhone,vOppDonorContact.Id,vOppDonorContact.Informal,vOppDonorContact.LastFirst,vOppDonorContact.MemberType,vOppDonorContact.Name,vOppDonorContact.OpportunityId,vOppDonorContact.OpportunityKey,vOppDonorContact.OpportunityName,vOppDonorContact.OpportunityStatus,vOppDonorContact.Potential,vOppDonorContact.Prefix,vOppDonorContact.ProspectAddress,vOppDonorContact.ProspectCity,vOppDonorContact.ProspectContactRank,vOppDonorContact.ProspectCountry,vOppDonorContact.ProspectDesignation,vOppDonorContact.ProspectEmail,vOppDonorContact.ProspectFax,vOppDonorContact.ProspectFunctionalTitle,vOppDonorContact.ProspectHomePhone,vOppDonorContact.ProspectId,vOppDonorContact.ProspectInformal,vOppDonorContact.ProspectLastFirst,vOppDonorContact.ProspectMemberType,vOppDonorContact.ProspectName,vOppDonorContact.ProspectPrefix,vOppDonorContact.ProspectStateProvince,vOppDonorContact.ProspectStatus,vOppDonorContact.ProspectSuffix,vOppDonorContact.ProspectTitle,vOppDonorContact.ProspectTollFree,vOppDonorContact.ProspectWorkPhone,vOppDonorContact.ProspectZip,vOppDonorContact.Quality,vOppDonorContact.ResponseMedia,vOppDonorContact.StateProvince,vOppDonorContact.Status,vOppDonorContact.Suffix,vOppDonorContact.TimingProbability,vOppDonorContact.Title,vOppDonorContact.TollFree,vOppDonorContact.WinProbability,vOppDonorContact.WorkPhone,vOppDonorContact.Zip
  FROM vOppDonorContact
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
CREATE VIEW [dbo].[vBoOppMemberContact]
AS
SELECT vOppMemberContact.Actual,vOppMemberContact.Address,vOppMemberContact.City,vOppMemberContact.ContactRank,vOppMemberContact.Country,vOppMemberContact.CurrentStage,vOppMemberContact.DecisionDate,vOppMemberContact.Designation,vOppMemberContact.Email,vOppMemberContact.Fax,vOppMemberContact.FunctionalTitle,vOppMemberContact.GroupName,vOppMemberContact.GroupType,vOppMemberContact.HomePhone,vOppMemberContact.Id,vOppMemberContact.Informal,vOppMemberContact.LastFirst,vOppMemberContact.MemberType,vOppMemberContact.Name,vOppMemberContact.OpportunityId,vOppMemberContact.OpportunityKey,vOppMemberContact.OpportunityName,vOppMemberContact.OpportunityStatus,vOppMemberContact.Potential,vOppMemberContact.Prefix,vOppMemberContact.ProspectAddress,vOppMemberContact.ProspectCity,vOppMemberContact.ProspectContactRank,vOppMemberContact.ProspectCountry,vOppMemberContact.ProspectDesignation,vOppMemberContact.ProspectEmail,vOppMemberContact.ProspectFax,vOppMemberContact.ProspectFunctionalTitle,vOppMemberContact.ProspectHomePhone,vOppMemberContact.ProspectId,vOppMemberContact.ProspectInformal,vOppMemberContact.ProspectLastFirst,vOppMemberContact.ProspectMemberType,vOppMemberContact.ProspectName,vOppMemberContact.ProspectPrefix,vOppMemberContact.ProspectStateProvince,vOppMemberContact.ProspectStatus,vOppMemberContact.ProspectSuffix,vOppMemberContact.ProspectTitle,vOppMemberContact.ProspectTollFree,vOppMemberContact.ProspectWorkPhone,vOppMemberContact.ProspectZip,vOppMemberContact.Quality,vOppMemberContact.ResponseMedia,vOppMemberContact.StateProvince,vOppMemberContact.Status,vOppMemberContact.Subscription,vOppMemberContact.Suffix,vOppMemberContact.TimingProbability,vOppMemberContact.Title,vOppMemberContact.TollFree,vOppMemberContact.Units,vOppMemberContact.WinProbability,vOppMemberContact.WorkPhone,vOppMemberContact.Zip
  FROM vOppMemberContact
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
CREATE VIEW [dbo].[vBoOpportunityClassRef]
AS
SELECT OpportunityClassRef.OpportunityClassCode,OpportunityClassRef.OpportunityClassDesc,OpportunityClassRef.OpportunityClassName
  FROM OpportunityClassRef
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
CREATE VIEW [dbo].[vBoOpportunityCompetitor]
AS
SELECT OpportunityCompetitor.CompetitorWonOpportunityFlag AS CompetitorWonOpportunity,OpportunityCompetitor.CreatedByUserKey,OpportunityCompetitor.CreatedOn,OpportunityCompetitor.DemoGivenFlag AS DemoGiven,OpportunityCompetitor.Notes,OpportunityCompetitor.OpportunityCompetitorKey,OpportunityCompetitor.OpportunityKey,OpportunityCompetitor.UpdatedByUserKey,OpportunityCompetitor.UpdatedOn,OpportunityCompetitor.CompetitorContactKey
  FROM OpportunityCompetitor
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
CREATE VIEW [dbo].[vBoOpportunityDefaultStatusRef]
AS
SELECT OpportunityDefaultStatusRef.OpportunityDefaultStatusCode,OpportunityDefaultStatusRef.OpportunityDefaultStatusDesc,OpportunityDefaultStatusRef.OpportunityDefaultStatusName
  FROM OpportunityDefaultStatusRef
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
CREATE VIEW [dbo].[vBoOpportunityHistory]
AS
SELECT OpportunityHistory.Notes,OpportunityHistory.OpportunityHistoryKey,OpportunityHistory.OpportunityKey,OpportunityHistory.PropertyName,OpportunityHistory.UpdatedByUserKey,OpportunityHistory.UpdatedOn,OpportunityHistory.CurrentValue,OpportunityHistory.OriginalValue
  FROM OpportunityHistory
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
CREATE VIEW [dbo].[vBoOpportunityReport]
AS
SELECT vOpportunityReport.Actual,vOpportunityReport.CreatedOn,vOpportunityReport.CurrentStage,vOpportunityReport.DecisionDate,vOpportunityReport.ExpirationDate,vOpportunityReport.GroupName,vOpportunityReport.GroupTypeKey,vOpportunityReport.OpportunityClass,vOpportunityReport.OpportunityId,vOpportunityReport.OpportunityKey,vOpportunityReport.OpportunityName,vOpportunityReport.OpportunityOwnerGroupKey,vOpportunityReport.OpportunityStatus,vOpportunityReport.OpportunityType,vOpportunityReport.OpportunityTypeKey,vOpportunityReport.OwnerId,vOpportunityReport.OwnerName,vOpportunityReport.Potential,vOpportunityReport.ProductInterest,vOpportunityReport.ProspectCompany,vOpportunityReport.ProspectId,vOpportunityReport.ProspectName,vOpportunityReport.Quality,vOpportunityReport.ResponseMedia,vOpportunityReport.SourceCodeKey,vOpportunityReport.TimingProbability,vOpportunityReport.Units,vOpportunityReport.UpdatedOn,vOpportunityReport.WinProbability,vOpportunityReport.OpportunityContactGroupKey,vOpportunityReport.OwnerRole
  FROM vOpportunityReport
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
CREATE VIEW [dbo].[vBoOpportunitySalesReport]
AS
SELECT vOpportunitySalesReport.ActualSales,vOpportunitySalesReport.ContactName,vOpportunitySalesReport.ContactSubRoleNames,vOpportunitySalesReport.CurrentActionPlanStageName,vOpportunitySalesReport.DecisionDate,vOpportunitySalesReport.Description,vOpportunitySalesReport.ExpirationDate,vOpportunitySalesReport.GroupRoleDesc,vOpportunitySalesReport.Id,vOpportunitySalesReport.OpportunityClass,vOpportunitySalesReport.OpportunityKey,vOpportunitySalesReport.OpportunityType,vOpportunitySalesReport.OwnerName,vOpportunitySalesReport.OwnerSubRoleNames,vOpportunitySalesReport.PotentialSales,vOpportunitySalesReport.Product,vOpportunitySalesReport.ProspectName,vOpportunitySalesReport.Quality,vOpportunitySalesReport.ResponseMedia,vOpportunitySalesReport.OpportunityStatusCode AS Status,vOpportunitySalesReport.TimingProbability,vOpportunitySalesReport.Units,vOpportunitySalesReport.WinProbability
  FROM vOpportunitySalesReport
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
CREATE VIEW [dbo].[vBoOpportunityStatusRef]
AS
SELECT OpportunityStatusRef.OpportunityStatusCode,OpportunityStatusRef.OpportunityStatusDesc,OpportunityStatusRef.OpportunityStatusName
  FROM OpportunityStatusRef
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
CREATE VIEW [dbo].[vBoOpportunityTaskUser]
AS
SELECT vOpportunityTaskUser.Category,vOpportunityTaskUser.DueDate,vOpportunityTaskUser.OpportunityKey,vOpportunityTaskUser.StartDate,vOpportunityTaskUser.Subject,vOpportunityTaskUser.TaskItemKey,vOpportunityTaskUser.TaskItemStatusName,vOpportunityTaskUser.UserKey
  FROM vOpportunityTaskUser
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
CREATE VIEW [dbo].[vBoOpportunityType]
AS
SELECT OpportunityType.AllowCompetitorsFlag,OpportunityType.DefaultActionPlanKey,OpportunityType.DefaultOwnerKey,OpportunityType.DefaultStatus,OpportunityType.Description,OpportunityType.Name,OpportunityType.UpdatedByUserKey,OpportunityType.UpdatedOn,OpportunityType.OpportunityClass,OpportunityType.OpportunityTypeKey,OpportunityType.AccessKey,OpportunityType.SystemEntityKey,OpportunityType.CreatedByUserKey,OpportunityType.CreatedOn,OpportunityType.ContactGroupTypeKey,OpportunityType.OwnerGroupTypeKey,OpportunityType.OpportunityCreationGroupKey
  FROM OpportunityType
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
CREATE VIEW [dbo].[vBoOppSalesContact]
AS
SELECT vOppSalesContact.ActualSales,vOppSalesContact.Address,vOppSalesContact.City,vOppSalesContact.ContactRank,vOppSalesContact.Country,vOppSalesContact.CurrentStage,vOppSalesContact.DecisionDate,vOppSalesContact.Designation,vOppSalesContact.Email,vOppSalesContact.Fax,vOppSalesContact.FunctionalTitle,vOppSalesContact.GroupName,vOppSalesContact.GroupType,vOppSalesContact.HomePhone,vOppSalesContact.Id,vOppSalesContact.Informal,vOppSalesContact.LastFirst,vOppSalesContact.MemberType,vOppSalesContact.Name,vOppSalesContact.OpportunityId,vOppSalesContact.OpportunityKey,vOppSalesContact.OpportunityName,vOppSalesContact.OpportunityStatus,vOppSalesContact.PotentialSales,vOppSalesContact.Prefix,vOppSalesContact.Product,vOppSalesContact.ProspectAddress,vOppSalesContact.ProspectCity,vOppSalesContact.ProspectContactRank,vOppSalesContact.ProspectCountry,vOppSalesContact.ProspectDesignation,vOppSalesContact.ProspectEmail,vOppSalesContact.ProspectFax,vOppSalesContact.ProspectFunctionalTitle,vOppSalesContact.ProspectHomePhone,vOppSalesContact.ProspectId,vOppSalesContact.ProspectInformal,vOppSalesContact.ProspectLastFirst,vOppSalesContact.ProspectMemberType,vOppSalesContact.ProspectName,vOppSalesContact.ProspectPrefix,vOppSalesContact.ProspectStateProvince,vOppSalesContact.ProspectStatus,vOppSalesContact.ProspectSuffix,vOppSalesContact.ProspectTitle,vOppSalesContact.ProspectTollFree,vOppSalesContact.ProspectWorkPhone,vOppSalesContact.ProspectZip,vOppSalesContact.Quality,vOppSalesContact.ResponseMedia,vOppSalesContact.StateProvince,vOppSalesContact.Status,vOppSalesContact.Suffix,vOppSalesContact.TimingProbability,vOppSalesContact.Title,vOppSalesContact.TollFree,vOppSalesContact.Units,vOppSalesContact.WinProbability,vOppSalesContact.WorkPhone,vOppSalesContact.Zip
  FROM vOppSalesContact
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
CREATE VIEW [dbo].[vBoOrderCategory]
AS
SELECT OrderCategory.OrderCategoryID,OrderCategory.Title
  FROM OrderCategory
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
CREATE VIEW [dbo].[vBoOrderFulfillmentStatusRef]
AS
SELECT OrderFulfillmentStatusRef.OrderFulfillmentStatusCode,OrderFulfillmentStatusRef.OrderFulfillmentStatusDesc
  FROM OrderFulfillmentStatusRef
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
CREATE VIEW [dbo].[vBoOrderStateRef]
AS
SELECT OrderStateRef.OrderStateCode,OrderStateRef.OrderStateDesc
  FROM OrderStateRef
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
CREATE VIEW [dbo].[vBoOrganization]
AS
SELECT OrganizationMain.CreatedByUserKey,OrganizationMain.CreatedOn,OrganizationMain.Description,OrganizationMain.Name,OrganizationMain.OrganizationKey,OrganizationMain.UpdatedByUserKey,OrganizationMain.UpdatedOn,OrganizationMain.DefaultDepartmentGroupKey,OrganizationMain.IsDefault
  FROM OrganizationMain
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
CREATE VIEW [dbo].[vBoPackage]
AS
SELECT PackageMain.Description,PackageMain.ExpirationDate,PackageMain.Name,PackageMain.OutputMethodKey,PackageMain.UpdatedByUserKey,PackageMain.UpdatedOn,PackageMain.PackageMessageKey,PackageMain.Cost,PackageMain.PackageStatusCode,PackageMain.CreatedByUserKey,PackageMain.CreatedOn,PackageMain.PackageKey,PackageMain.SystemEntityKey
  FROM PackageMain
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
CREATE VIEW [dbo].[vBoPackageItem]
AS
SELECT PackageItem.SupplementKey,PackageItem.UpdatedByUserKey,PackageItem.UpdatedOn,PackageItem.PackageItemKey,PackageItem.PackageKey,PackageItem.CreatedByUserKey,PackageItem.CreatedOn
  FROM PackageItem
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
CREATE VIEW [dbo].[vBoPackageStatusRef]
AS
SELECT PackageStatusRef.PackageStatusCode,PackageStatusRef.PackageStatusDesc
  FROM PackageStatusRef
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
	[dbo].[CustomerExperience].[ContactKey], 
	[dbo].[vOfferedCustomerExperience].[ProgramKey], 
	[dbo].[vOfferedCustomerExperience].[ProgramName], 
	[dbo].[vOfferedCustomerExperience].[ExperienceDefinitionKey], 
	[dbo].[vOfferedCustomerExperience].[ExperienceDefinitionName], 
	[dbo].[vOfferedCustomerExperience].[OfferingKey], 
	[dbo].[vOfferedCustomerExperience].[OfferingName], 
	[dbo].[vOfferedCustomerExperience].[ContactKey] AS Provider, 
	[dbo].[vOfferedCustomerExperience].[OfferingName] AS Name, 
	[dbo].[vNetContact].[LastName], 
	[dbo].[vNetContact].[FirstName], 
	[dbo].[vNetContact].[FullName],
	[dbo].[vNetContact].[SortName], 
	[dbo].[vNetContact].[Company] AS CompanyName, 
	[dbo].[vNetContact].[FullAddress], 
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
		INNER JOIN [dbo].[vNetContact] ON [dbo].[CustomerExperience].[ContactKey] = [dbo].[vNetContact].[ContactKey] 
		INNER JOIN [dbo].[CustomerExperienceStatusRef] ON [dbo].[CustomerExperience].[CustomerExperienceStatusCode] = [dbo].[CustomerExperienceStatusRef].[CustomerExperienceStatusCode] 
		LEFT JOIN [dbo].[GradeRef] ON [dbo].[vOfferedCustomerExperience].[OfferedCustomerExperienceGradeKey] = [dbo].[GradeRef].[GradeKey]

UNION ALL
SELECT 
	[CustomerExperience1].[CustomerExperienceKey], 
	[CustomerExperience1].[ContactKey], 
	[dbo].[vUnofferedCustomerExperience].[ProgramKey], 
	[dbo].[vUnofferedCustomerExperience].[ProgramName], 
	[dbo].[vUnofferedCustomerExperience].[ExperienceDefinitionKey], 
	[dbo].[vUnofferedCustomerExperience].[ExperienceDefinitionName], 
	NULL AS OfferingKey, 
	NULL AS OfferingName, 
	NULL AS Provider, 
	[dbo].[vUnofferedCustomerExperience].[ExperienceDefinitionName] AS Name, 
	[vNetContact1].[LastName], 
	[vNetContact1].[FirstName], 
	[vNetContact1].[FullName], 
	[vNetContact1].[SortName], 
	[vNetContact1].[Company] AS CompanyName, 
	[vNetContact1].[FullAddress], 
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
		INNER JOIN [dbo].[vNetContact] AS [vNetContact1] ON [CustomerExperience1].[ContactKey] = [vNetContact1].[ContactKey] 
		INNER JOIN [dbo].[CustomerExperienceStatusRef] AS [CustomerExperienceStatusCodeRef1] ON [CustomerExperience1].[CustomerExperienceStatusCode] = [CustomerExperienceStatusCodeRef1].[CustomerExperienceStatusCode]

UNION ALL
SELECT 
	[CustomerExperience2].[CustomerExperienceKey], 
	[CustomerExperience2].[ContactKey], 
	[dbo].[vUserDefinedCustomerExperience].[ProgramKey], 
	[dbo].[vUserDefinedCustomerExperience].[ProgramName], 
	NULL AS ExperienceDefinitionKey, 
	NULL AS ExperienceDefinitionName, 
	NULL AS OfferingKey, 
	NULL AS OfferingName, 
	NULL AS Provider, 
	[dbo].[vUserDefinedCustomerExperience].[UserDefinedCustomerExperienceName] AS Name, 
	[vNetContact2].[LastName], 
	[vNetContact2].[FirstName], 
	[vNetContact2].[FullName], 
	[vNetContact2].[SortName], 
	[vNetContact2].[Company] AS CompanyName, 
	[vNetContact2].[FullAddress], 
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
		INNER JOIN [dbo].[vNetContact] AS [vNetContact2] ON [CustomerExperience2].[ContactKey] = [vNetContact2].[ContactKey] 
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
CREATE VIEW [dbo].[vBoParticipantRoster]
AS
SELECT vParticipantRoster.CompanyName,vParticipantRoster.CustomerExperienceKey,vParticipantRoster.Date,vParticipantRoster.ExperienceDefinitionKey,vParticipantRoster.ExperienceDefinitionName,vParticipantRoster.FirstName,vParticipantRoster.FullAddress,vParticipantRoster.FullName,vParticipantRoster.Grade,vParticipantRoster.LastName,vParticipantRoster.LocationKey,vParticipantRoster.Name,vParticipantRoster.NumberOfUnits,vParticipantRoster.OfferingKey,vParticipantRoster.OfferingName,vParticipantRoster.ProgramKey,vParticipantRoster.ProgramName,vParticipantRoster.Provider,vParticipantRoster.SortName,vParticipantRoster.StatusCode,vParticipantRoster.StatusName,vParticipantRoster.LocationName,vParticipantRoster.ContactKey
  FROM vParticipantRoster
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
CREATE VIEW [dbo].[vBoPaymentApplicationRestrictionRef]
AS
SELECT PaymentApplicationRestrictionRef.PaymentApplicationRestrictionCode,PaymentApplicationRestrictionRef.PaymentApplicationRestrictionDesc
  FROM PaymentApplicationRestrictionRef
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
CREATE VIEW [dbo].[vBoPaymentDetailStatusRef]
AS
SELECT PaymentDetailStatusRef.PaymentDetailStatusCode,PaymentDetailStatusRef.PaymentDetailStatusDesc,PaymentDetailStatusRef.PaymentDetailStatusName
  FROM PaymentDetailStatusRef
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
CREATE VIEW [dbo].[vBoPaymentMethodSet]
AS
SELECT PaymentMethodSet.ContextId,PaymentMethodSet.IsDefault,PaymentMethodSet.IsSystem,PaymentMethodSet.PaymentMethodSetDesc,PaymentMethodSet.PaymentMethodSetId,PaymentMethodSet.PaymentMethodSetName
  FROM PaymentMethodSet
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
CREATE VIEW [dbo].[vBoPerspective]
AS
SELECT Perspective.PerspectiveKey,Perspective.RootHierarchyKey,Perspective.WebsiteKey,Perspective.PerspectiveName,Perspective.HomePageHierarchyKey
  FROM Perspective
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
CREATE VIEW [dbo].[vBoPhysicalAddress]
AS
SELECT AddressMain.UpdatedByUserKey,AddressMain.AddressStatusCode,AddressMain.IsPhysicalAddress,AddressMain.LastVerifiedOn,AddressMain.BadAddressReasonKey,AddressMain.UpdatedOn,AddressMain.FormattedAddress,AddressMain.AddressKey,AddressMain.CreatedByUserKey,AddressMain.CreatedOn,AddressMain.SystemEntityKey,AddressMain.AddressCategoryCode,AddressMain.OwnerContactKey,PhysicalAddress.Address1,PhysicalAddress.Address2,PhysicalAddress.Address3,PhysicalAddress.BarCode,PhysicalAddress.CarrierRoute,PhysicalAddress.City,PhysicalAddress.County,PhysicalAddress.DeliveryPointBarCode,PhysicalAddress.Latitude,PhysicalAddress.LineOfTravel,PhysicalAddress.Longitude,PhysicalAddress.MailCode,PhysicalAddress.PostalCode,PhysicalAddress.Region,PhysicalAddress.StateHouse,PhysicalAddress.StateSenate,PhysicalAddress.TimeZoneKey,PhysicalAddress.USCongress,PhysicalAddress.CountryCode,PhysicalAddress.StateProvinceCode
  FROM AddressMain
	INNER JOIN PhysicalAddress
		ON AddressMain.AddressKey = PhysicalAddress.AddressKey
 WHERE AddressMain.IsPhysicalAddress = '1'
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
CREATE VIEW [dbo].[vBoPicture]
AS
SELECT Picture.Alt,Picture.Data,Picture.ImageKey AS PictureKey,Picture.ImageUrl,Picture.MimeType
  FROM Picture
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
CREATE VIEW [dbo].[vBoPicturePurposeRef]
AS
SELECT PicturePurposeRef.PicturePurposeDesc AS Description,PicturePurposeRef.PicturePurposeKey
  FROM PicturePurposeRef
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
CREATE VIEW [dbo].[vBoPipeline]
AS
SELECT Pipeline.Name,Pipeline.OrderTypeKey,Pipeline.PipelineKey
  FROM Pipeline
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
CREATE VIEW [dbo].[vBoPipelineStage]
AS
SELECT PipelineStage.ComponentKey,PipelineStage.Name,PipelineStage.PipelineKey,PipelineStage.Sequence,PipelineStage.PipelineStageKey
  FROM PipelineStage
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
CREATE VIEW [dbo].[vBoPostalCodeRef]
AS
SELECT PostalCodeRef.PostalCode AS Code,PostalCodeRef.ChapterGroupKey,PostalCodeRef.City,PostalCodeRef.CountryCode,PostalCodeRef.County,PostalCodeRef.CountyFIPS,PostalCodeRef.IsHandEntered,PostalCodeRef.IsHandModified,PostalCodeRef.Region,PostalCodeRef.UpdatedByUserKey,PostalCodeRef.UpdatedOn,PostalCodeRef.IsActive,PostalCodeRef.StateProvinceCode,PostalCodeRef.PostalCodeKey
  FROM PostalCodeRef
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
CREATE VIEW [dbo].[vBoPotentialMatchingGift]
AS
SELECT PotentialMatchingGift.DateCreated,PotentialMatchingGift.DateMatchingFormSubmitted,PotentialMatchingGift.DateMatchingGiftFormReceived,PotentialMatchingGift.MatchingGiftInformation,PotentialMatchingGift.MatchingGiftPlanKey,PotentialMatchingGift.MatchingGiftRelationshipKey,PotentialMatchingGift.UpdatedByUserKey,PotentialMatchingGift.UpdatedOn,PotentialMatchingGift.Amount,PotentialMatchingGift.OrderLineKey,PotentialMatchingGift.CreatedByUserKey,PotentialMatchingGift.CreatedOn,PotentialMatchingGift.PotentialMatchingGiftKey,PotentialMatchingGift.SystemEntityKey
  FROM PotentialMatchingGift
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
CREATE VIEW [dbo].[vBoPrefixRef]
AS
SELECT PrefixRef.PrefixCode AS Code,PrefixRef.PrefixDesc AS Description,PrefixRef.SyncPrefixCode,PrefixRef.Gender,PrefixRef.PrefixKey
  FROM PrefixRef
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
CREATE VIEW [dbo].[vBoPriceBasisRef]
AS
SELECT PriceBasisRef.PriceBasisCode,PriceBasisRef.PriceBasisDesc,PriceBasisRef.PriceBasisName
  FROM PriceBasisRef
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
CREATE VIEW [dbo].[vBoPricingTypeRef]
AS
SELECT PricingTypeRef.PricingTypeCode,PricingTypeRef.PricingTypeDesc,PricingTypeRef.PricingTypeName
  FROM PricingTypeRef
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
CREATE VIEW [dbo].[vBoProcessTypeDefaultOwnerAllUsers]
AS
SELECT vProcessTypeDefaultOwnerAllUsers.FullName,vProcessTypeDefaultOwnerAllUsers.UserId,vProcessTypeDefaultOwnerAllUsers.UserKey
  FROM vProcessTypeDefaultOwnerAllUsers
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
CREATE VIEW [dbo].[vBoProductStatusRef]
AS
SELECT ProductStatusRef.ProductStatusCode,ProductStatusRef.ProductStatusDesc,ProductStatusRef.ProductStatusName
  FROM ProductStatusRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vUDBOProfile_Page]'))
    DROP VIEW [dbo].[vUDBOProfile_Page]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE VIEW [dbo].[vUDBOProfile_Page]
AS
SELECT s.RowID AS [ContactKey],
       CAST(MAX(CASE WHEN s.PropertyName = 'Type' THEN s.PropertyStringValue ELSE NULL END) AS nvarchar(80)) AS [Type],
       CAST(MAX(CASE WHEN s.PropertyName = 'CompanySize' THEN s.PropertyStringValue ELSE NULL END) AS nvarchar(80)) AS [CompanySize],
       CAST(MAX(CASE WHEN s.PropertyName = 'Founded' THEN s.PropertyStringValue ELSE NULL END) AS nvarchar(80)) AS [Founded],
       CAST(MAX(CASE WHEN s.PropertyName = 'Facebook' THEN s.PropertyStringValue ELSE NULL END) AS nvarchar(100)) AS [Facebook],
       CAST(MAX(CASE WHEN s.PropertyName = 'LinkedIn' THEN s.PropertyStringValue ELSE NULL END) AS nvarchar(100)) AS [LinkedIn],
       CAST(MAX(CASE WHEN s.PropertyName = 'Education' THEN s.PropertyStringValue ELSE NULL END) AS nvarchar(400)) AS [Education],
       CAST(MAX(CASE WHEN s.PropertyName = 'PastExperience' THEN s.PropertyStringValue ELSE NULL END) AS nvarchar(400)) AS [PastExperience],
       CAST(MAX(CASE WHEN s.PropertyName = 'CurrentPosition' THEN s.PropertyStringValue ELSE NULL END) AS nvarchar(400)) AS [CurrentPosition],
       CAST(MAX(CASE WHEN s.PropertyName = 'About' THEN s.PropertyStringValue ELSE NULL END) AS nvarchar(400)) AS [About]
  FROM [dbo].[UserDefinedSingleInstanceProperty] s
 WHERE s.TableName = 'Profile_Page'
 GROUP BY s.RowID

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoProfile_Page]'))
    DROP VIEW [dbo].[vBoProfile_Page]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoProfile_Page]
AS
SELECT vUDBOProfile_Page.ContactKey,vUDBOProfile_Page.Type,vUDBOProfile_Page.CompanySize,vUDBOProfile_Page.Founded,vUDBOProfile_Page.Facebook,vUDBOProfile_Page.LinkedIn,vUDBOProfile_Page.Education,vUDBOProfile_Page.PastExperience,vUDBOProfile_Page.CurrentPosition,vUDBOProfile_Page.About
  FROM vUDBOProfile_Page
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
CREATE VIEW [dbo].[vBoProgram]
AS
SELECT Program.MinimumValue AS Minimum,Program.ProgramKey,Program.ProgramName AS Name,Program.MaximumValue AS Maximum,Program.UserDefinedExperiencesFlag AS UserDefinedExperiences,Program.ProgramStatusCode,Program.CreatedByUserKey,Program.CreatedOn,Program.UpdatedByUserKey,Program.UpdatedOn,Program.RequiresApprovalFlag AS RequiresApproval,Program.ProgramDescr AS Description,Program.MarkedForDeleteOn,Program.ExperienceUnitKey
  FROM Program
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
CREATE VIEW [dbo].[vBoProgramGroup]
AS
SELECT ProgramGroup.CreatedByUserKey,ProgramGroup.CreatedOn,ProgramGroup.ProgramGroupDescription,ProgramGroup.ProgramGroupKey,ProgramGroup.ProgramGroupName,ProgramGroup.ProgramGroupStatusCode,ProgramGroup.UpdatedByUserKey,ProgramGroup.UpdatedOn,ProgramGroup.MarkedForDeleteOn
  FROM ProgramGroup
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
CREATE VIEW [dbo].[vBoProgramGroupStatus]
AS
SELECT ProgramGroupStatusRef.ProgramGroupStatusCode,ProgramGroupStatusRef.ProgramGroupStatusName
  FROM ProgramGroupStatusRef
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
CREATE VIEW [dbo].[vBoProgramStatus]
AS
SELECT ProgramStatusRef.ProgramStatusCode AS Code,ProgramStatusRef.ProgramStatusName AS Name
  FROM ProgramStatusRef
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
CREATE VIEW [dbo].[vBoPromotionRuleRef]
AS
SELECT PromotionRuleRef.PromotionRuleCode,PromotionRuleRef.PromotionRuleDesc,PromotionRuleRef.PromotionRuleName
  FROM PromotionRuleRef
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
CREATE VIEW [dbo].[vBoPropertyDefinition]
AS
SELECT PropertyDefinition.AllowMultiSelectFlag,PropertyDefinition.DataTypeCode,PropertyDefinition.DisplayMask,PropertyDefinition.HIControlHeight,PropertyDefinition.HIControlRepeatColumns,PropertyDefinition.HIControlRepeatDirection,PropertyDefinition.HIControlTypeCode,PropertyDefinition.HIControlWidth,PropertyDefinition.IsRequired,PropertyDefinition.Label,PropertyDefinition.MaxLength,PropertyDefinition.PropertyDefinitionKey,PropertyDefinition.Scale,PropertyDefinition.ValueList,PropertyDefinition.ValueListQueryDisplayColumn,PropertyDefinition.ValueListQueryDocumentVersionKey,PropertyDefinition.ValueListQueryFolder,PropertyDefinition.ValueListQueryPersistColumn,PropertyDefinition.ForeignObjectDocumentVersionKey,PropertyDefinition.DefaultValue,PropertyDefinition.UseFinder
  FROM PropertyDefinition
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
CREATE VIEW [dbo].[vBoProspect]
AS
SELECT Prospect.Address1,Prospect.Address2,Prospect.Address3,Prospect.City,Prospect.Country,Prospect.Email,Prospect.FirstName,Prospect.FullName,Prospect.HomePhone,Prospect.LastName,Prospect.MiddleName,Prospect.Organization,Prospect.PostalCode,Prospect.Prefix,Prospect.ProspectKey,Prospect.StateProvince,Prospect.Suffix,Prospect.Title,Prospect.WorkPhone,Prospect.Fax,Prospect.ProspectID,Prospect.ImisID,Prospect.LastFirst,Prospect.ImportDate,Prospect.ListCode,Prospect.CompanySort
  FROM Prospect
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
CREATE VIEW [dbo].[vBoPublishMessageLog]
AS
SELECT PublishMessageLog.DisplayFlag,PublishMessageLog.Location,PublishMessageLog.MessageDateTime,PublishMessageLog.MessageNumber,PublishMessageLog.MessageText,PublishMessageLog.PublishMessageLogKey,PublishMessageLog.PublishRequestDetailKey,PublishMessageLog.PublishRequestKey,PublishMessageLog.PublishServerCode
  FROM PublishMessageLog
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
CREATE VIEW [dbo].[vBoPublishPriority]
AS
SELECT PublishPriorityRef.PublishPriorityCode AS Code,PublishPriorityRef.PublishPriorityDesc AS Description
  FROM PublishPriorityRef
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
CREATE VIEW [dbo].[vBoPublishRequest]
AS
SELECT PublishRequest.DocumentKey,PublishRequest.PublishPriorityCode,PublishRequest.PublishRequestKey,PublishRequest.RequestDateTime,PublishRequest.UserKey,PublishRequest.PublishedDateTime
  FROM PublishRequest
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
CREATE VIEW [dbo].[vBoPublishRequestDetail]
AS
SELECT PublishRequestDetail.Frequency,PublishRequestDetail.IsDelete,PublishRequestDetail.IsRegenerate,PublishRequestDetail.PublishedDateTime,PublishRequestDetail.PublishRequestDetailKey,PublishRequestDetail.PublishRequestKey,PublishRequestDetail.PublishRequestStatusCode,PublishRequestDetail.PublishServerCode,PublishRequestDetail.ContentDocumentKey,PublishRequestDetail.NumOfAttempts
  FROM PublishRequestDetail
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
CREATE VIEW [dbo].[vBoPublishRequestStatus]
AS
SELECT PublishRequestStatusRef.PublishRequestStatusCode,PublishRequestStatusRef.PublishRequestStatusDesc,PublishRequestStatusRef.PublishRequestStatusName
  FROM PublishRequestStatusRef
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
CREATE VIEW [dbo].[vBoPublishServer]
AS
SELECT PublishServerRef.AlternateServerIPAddress,PublishServerRef.Frequency,PublishServerRef.IISSecurityDomain,PublishServerRef.IISSecurityPassword,PublishServerRef.IISSecurityUserName,PublishServerRef.IsDefault,PublishServerRef.PublishingSpeed,PublishServerRef.PublishServerCode AS Code,PublishServerRef.PublishServerDesc AS Description,PublishServerRef.ServerIPAddress,PublishServerRef.UseServiceRequest,PublishServerRef.LocalProtectedPath,PublishServerRef.LocalPublishPath,PublishServerRef.CreatedByUserKey,PublishServerRef.CreatedOn,PublishServerRef.UpdatedByUserKey,PublishServerRef.UpdatedOn
  FROM PublishServerRef
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
CREATE VIEW [dbo].[vBoQualityRef]
AS
SELECT QualityRef.QualityCode,QualityRef.QualityDesc,QualityRef.QualityName
  FROM QualityRef
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
CREATE VIEW [dbo].[vBoReceipt]
AS
SELECT ReceiptMain.AccessKey,ReceiptMain.CreatedByUserKey,ReceiptMain.CreatedOn,ReceiptMain.IsNumberAutoGenerated,ReceiptMain.IssuedOn,ReceiptMain.IssuedToContactKey,ReceiptMain.Notes,ReceiptMain.ReceiptKey,ReceiptMain.ReceiptNumber,ReceiptMain.ReceiptTypeKey,ReceiptMain.SystemEntityKey,ReceiptMain.UpdatedByUserKey,ReceiptMain.UpdatedOn
  FROM ReceiptMain
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
CREATE VIEW [dbo].[vBoReceiptLine]
AS
SELECT ReceiptLine.ReceiptKey,ReceiptLine.ReceiptLineKey,ReceiptLine.LineDescription,ReceiptLine.LineNumber,ReceiptLine.PaymentKey,ReceiptLine.ProductKey,ReceiptLine.ReceiptedAmount,ReceiptLine.SourceReceiptLineKey
  FROM ReceiptLine
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
CREATE VIEW [dbo].[vBoReceiptReport]
AS
SELECT vReceiptReport.FullName,vReceiptReport.ID,vReceiptReport.IssuedOn,vReceiptReport.ReceiptKey,vReceiptReport.ReceiptLineAmount,vReceiptReport.ReceiptNumber,vReceiptReport.ReceiptTypeDesc,vReceiptReport.ContactAddress,vReceiptReport.ReceiptLineKey,vReceiptReport.IsNumberAutoGenerated,vReceiptReport.Notes,vReceiptReport.ReceiptLineDescription,vReceiptReport.ReceiptTitle
  FROM vReceiptReport
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
CREATE VIEW [dbo].[vBoReceiptType]
AS
SELECT ReceiptTypeRef.ReceiptTypeDesc,ReceiptTypeRef.ReceiptTypeKey,ReceiptTypeRef.ReceiptTitle
  FROM ReceiptTypeRef
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
CREATE VIEW [dbo].[vBoRecurringDonationCommitment]
AS
SELECT RecurringDonationCommitment.Appeal,RecurringDonationCommitment.Campaign,RecurringDonationCommitment.CommitmentNotes,RecurringDonationCommitment.CommitmentStatusInd,RecurringDonationCommitment.ContactKey,RecurringDonationCommitment.CreatedByUserKey,RecurringDonationCommitment.CreatedOn,RecurringDonationCommitment.Distribution,RecurringDonationCommitment.DonationAmount,RecurringDonationCommitment.EndDate,RecurringDonationCommitment.Fund,RecurringDonationCommitment.MatchReference,RecurringDonationCommitment.PaymentMethod,RecurringDonationCommitment.RecurringDonationCommitmentKey,RecurringDonationCommitment.RecurringDonationFrequencyCode,RecurringDonationCommitment.StartDate,RecurringDonationCommitment.UpdatedByUserKey,RecurringDonationCommitment.UpdatedOn,RecurringDonationCommitment.BankAccountName,RecurringDonationCommitment.BankAccountNumber,RecurringDonationCommitment.BranchSortCode
  FROM RecurringDonationCommitment
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
CREATE VIEW [dbo].[vBoRecurringDonationExpectedPayment]
AS
SELECT RecurringDonationExpectedPayment.Appeal,RecurringDonationExpectedPayment.BankAccountName,RecurringDonationExpectedPayment.BankAccountNumber,RecurringDonationExpectedPayment.BranchSortCode,RecurringDonationExpectedPayment.Campaign,RecurringDonationExpectedPayment.CreatedByUserKey,RecurringDonationExpectedPayment.CreatedOn,RecurringDonationExpectedPayment.Distribution,RecurringDonationExpectedPayment.DonationAmount,RecurringDonationExpectedPayment.Fund,RecurringDonationExpectedPayment.MatchReference,RecurringDonationExpectedPayment.Narrative,RecurringDonationExpectedPayment.OpportunityKey,RecurringDonationExpectedPayment.PaymentMethod,RecurringDonationExpectedPayment.RecurringDonationCommitmentKey,RecurringDonationExpectedPayment.RecurringDonationExpectedPaymentKey,RecurringDonationExpectedPayment.RecurringDonationExpectedPaymentSetKey,RecurringDonationExpectedPayment.RecurringDonationExpectedPaymentStatusCode,RecurringDonationExpectedPayment.ResultingTransLineNum,RecurringDonationExpectedPayment.ResultingTransNum,RecurringDonationExpectedPayment.UpdatedByUserKey,RecurringDonationExpectedPayment.UpdatedOn
  FROM RecurringDonationExpectedPayment
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
CREATE VIEW [dbo].[vBoRecurringDonationExpectedPaymentSet]
AS
SELECT RecurringDonationExpectedPaymentSet.CreatedByUserKey,RecurringDonationExpectedPaymentSet.CreatedOn,RecurringDonationExpectedPaymentSet.ExpectedPaymentDate,RecurringDonationExpectedPaymentSet.RecurringDonationExpectedPaymentSetKey,RecurringDonationExpectedPaymentSet.RecurringDonationExpectedPaymentSetStatusCode,RecurringDonationExpectedPaymentSet.UpdatedByUserKey,RecurringDonationExpectedPaymentSet.UpdatedOn
  FROM RecurringDonationExpectedPaymentSet
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
CREATE VIEW [dbo].[vBoRecurringDonationExpectedPaymentSetList]
AS
SELECT vRecurringDonationExpectedPaymentSetList.AmountProcessed,vRecurringDonationExpectedPaymentSetList.AmountWaiting,vRecurringDonationExpectedPaymentSetList.DateRun,vRecurringDonationExpectedPaymentSetList.MonthYear,vRecurringDonationExpectedPaymentSetList.NumberProcessed,vRecurringDonationExpectedPaymentSetList.NumberWaiting,vRecurringDonationExpectedPaymentSetList.RecurringDonationExpectedPaymentSetKey,vRecurringDonationExpectedPaymentSetList.RunStatus
  FROM vRecurringDonationExpectedPaymentSetList
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
CREATE VIEW [dbo].[vBoRecurringDonationExpectedPaymentSetStatus]
AS
SELECT RecurringDonationExpectedPaymentSetStatusRef.RecurringDonationExpectedPaymentSetStatusCode,RecurringDonationExpectedPaymentSetStatusRef.RecurringDonationExpectedPaymentSetStatusDesc AS Description,RecurringDonationExpectedPaymentSetStatusRef.RecurringDonationExpectedPaymentSetStatusName AS Name
  FROM RecurringDonationExpectedPaymentSetStatusRef
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
CREATE VIEW [dbo].[vBoRecurringDonationExpectedPaymentStatus]
AS
SELECT RecurringDonationExpectedPaymentStatusRef.RecurringDonationExpectedPaymentStatusCode,RecurringDonationExpectedPaymentStatusRef.RecurringDonationExpectedPaymentStatusDesc AS Description,RecurringDonationExpectedPaymentStatusRef.RecurringDonationExpectedPaymentStatusName AS Name
  FROM RecurringDonationExpectedPaymentStatusRef
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
CREATE VIEW [dbo].[vBoRecurringDonationFrequencyRef]
AS
SELECT RecurringDonationFrequencyRef.Description,RecurringDonationFrequencyRef.RecurringDonationFrequencyCode,RecurringDonationFrequencyRef.RecurringDonationFrequencyName
  FROM RecurringDonationFrequencyRef
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
CREATE VIEW [dbo].[vBoRecurringDonationMatchStatus]
AS
SELECT RecurringDonationMatchStatusRef.RecurringDonationMatchStatusCode,RecurringDonationMatchStatusRef.RecurringDonationMatchStatusDesc AS Description
  FROM RecurringDonationMatchStatusRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoRecurringDonationPaymentAttemptsExceeded]'))
    DROP VIEW [dbo].[vBoRecurringDonationPaymentAttemptsExceeded]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoRecurringDonationPaymentAttemptsExceeded]
AS
SELECT vRecurringDonationPaymentAttemptsExceeded.InvoiceNumber
  FROM vRecurringDonationPaymentAttemptsExceeded
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
CREATE VIEW [dbo].[vBoRegisteredComponent]
AS
SELECT ComponentRegistry.AssemblyName,ComponentRegistry.ConfigureWebUserControl,ComponentRegistry.ConfigureWindowsControl,ComponentRegistry.Description,ComponentRegistry.InterfaceName,ComponentRegistry.Name,ComponentRegistry.TypeName,ComponentRegistry.ComponentKey,ComponentRegistry.IsBusinessItem,ComponentRegistry.IsTyped,ComponentRegistry.ComponentEditLink,ComponentRegistry.ComponentExecuteLink,ComponentRegistry.ComponentNewLink,ComponentRegistry.ComponentSummaryContentKey,ComponentRegistry.DeploymentPackageCode
  FROM ComponentRegistry
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
CREATE VIEW [dbo].[vBoRegistrationStatus]
AS
SELECT RegistrationStatusRef.RegistrationStatusCode AS Code,RegistrationStatusRef.RegistrationStatusName AS Name
  FROM RegistrationStatusRef
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
CREATE VIEW [dbo].[vBoRegistrationStatusChange]
AS
SELECT RegistrationStatusChange.CertificationProgramRegistrationKey,RegistrationStatusChange.CreatedByUserKey,RegistrationStatusChange.CreatedOn,RegistrationStatusChange.RegistrationStatusChangeKey,RegistrationStatusChange.RegistrationStatusCode,RegistrationStatusChange.StatusChangedOn,RegistrationStatusChange.UpdatedByUserKey,RegistrationStatusChange.UpdatedOn,RegistrationStatusChange.RegistrationStatusChangeNote,RegistrationStatusChange.StatusChangedContactKey
  FROM RegistrationStatusChange
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
CREATE VIEW [dbo].[vBoRegistrationStatusChangeGrouped]
AS
SELECT vRegistrationStatusChangeGrouped.RegistrationStatusChangeKey
  FROM vRegistrationStatusChangeGrouped
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
CREATE VIEW [dbo].[vBoRelationship]
AS
SELECT RelationshipMain.EffectiveDate,RelationshipMain.EndDate,RelationshipMain.RelationshipKey,RelationshipMain.RelationshipTypeKey,RelationshipMain.SubjectUniformKey,RelationshipMain.TargetUniformKey
  FROM RelationshipMain
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
CREATE VIEW [dbo].[vBoRelationshipCategory]
AS
SELECT RelationshipCategoryRef.IsActive,RelationshipCategoryRef.IsSystem,RelationshipCategoryRef.RelationshipCategoryDescription AS Description,RelationshipCategoryRef.RelationshipCategoryKey,RelationshipCategoryRef.RelationshipCategoryName AS Name
  FROM RelationshipCategoryRef
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
CREATE VIEW [dbo].[vBoRelationshipTypeCategory]
AS
SELECT RelationshipTypeCategory.RelationshipTypeCategoryKey,RelationshipTypeCategory.RelationshipTypeKey,RelationshipTypeCategory.RelationshipCategoryKey,RelationshipTypeCategory.IsSystem,RelationshipTypeCategory.IsActive
  FROM RelationshipTypeCategory
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
CREATE VIEW [dbo].[vBoRelationshipTypeRef]
AS
SELECT RelationshipTypeRef.IsSystem,RelationshipTypeRef.ReciprocalRelationshipTypeKey,RelationshipTypeRef.RelationshipTypeDesc AS Description,RelationshipTypeRef.RelationshipTypeKey
  FROM RelationshipTypeRef
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
CREATE VIEW [dbo].[vBoReportIndexReport]
AS
SELECT vReportIndexReport.DocumentKey,vReportIndexReport.DocumentNodeKey,vReportIndexReport.FolderName,vReportIndexReport.ModuleName,vReportIndexReport.ParentDocumentNodeKey,vReportIndexReport.ReportName,vReportIndexReport.Description,vReportIndexReport.RootFolderName,vReportIndexReport.SubFolderName
  FROM vReportIndexReport
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
CREATE VIEW [dbo].[vBoResponseMediaRef]
AS
SELECT ResponseMediaRef.ResponseMediaCode,ResponseMediaRef.ResponseMediaDesc
  FROM ResponseMediaRef
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
CREATE VIEW [dbo].[vBoResponseTypeRef]
AS
SELECT ResponseTypeRef.ResponseTypeCode,ResponseTypeRef.ResponseTypeDesc,ResponseTypeRef.ResponseTypeName
  FROM ResponseTypeRef
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
CREATE VIEW [dbo].[vBoRestockPriceRef]
AS
SELECT RestockPriceRef.RestockPriceCode,RestockPriceRef.RestockPriceDesc,RestockPriceRef.DisplayPrompt
  FROM RestockPriceRef
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
CREATE VIEW [dbo].[vBoRFMAnalysis]
AS
SELECT DocumentMain.Blob,DocumentMain.DefaultChildAccessKey,DocumentMain.DocumentDescription AS Description,DocumentMain.DocumentKey,DocumentMain.DocumentTypeCode AS DocumentType,DocumentMain.LockedByUserKey,DocumentMain.LockedOn,DocumentMain.DocumentName AS Name,DocumentMain.UpdatedByUserKey,DocumentMain.UpdatedOn,RFMMain.Combined,RFMMain.FirstContact,RFMMain.Frequency,RFMMain.HighAmount,RFMMain.LastContact,RFMMain.LowAmount,RFMMain.Monetary,RFMMain.NumContacts,RFMMain.NumDays,RFMMain.Recency,RFMMain.RFMKey,RFMMain.Total,RFMMain.TotalAmount,RFMMain.ContactKey,RFMMain.HighContact,RFMMain.FirstContactAmount,DocumentMain.CreatedByUserKey,DocumentMain.CreatedOn
  FROM DocumentMain
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
CREATE VIEW [dbo].[vBoRole]
AS
SELECT RoleMain.Description,RoleMain.IsSystem,RoleMain.Name,RoleMain.RoleKey,RoleMain.UpdatedByUserKey,RoleMain.UpdatedOn
  FROM RoleMain
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
CREATE VIEW [dbo].[vBoRoundingMultipleRef]
AS
SELECT RoundingMultipleRef.RoundingMultipleCode,RoundingMultipleRef.RoundingMultipleDesc,RoundingMultipleRef.RoundingMultipleKey
  FROM RoundingMultipleRef
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
CREATE VIEW [dbo].[vBoRule]
AS
SELECT RuleMain.Description,RuleMain.Name,RuleMain.UpdatedByUserKey,RuleMain.UpdatedOn,RuleMain.BeginDate,RuleMain.EndDate,RuleMain.IsActive,RuleMain.ObjectMapperComponentKey,RuleMain.RuleEvaluatorComponentKey,RuleMain.Priority,RuleMain.CreatedByUserKey,RuleMain.CreatedOn,RuleMain.RuleKey,RuleMain.SystemEntityKey
  FROM RuleMain
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
CREATE VIEW [dbo].[vBoRuleCriterion]
AS
SELECT RuleCriterion.Name,RuleCriterion.ObjectName,RuleCriterion.RuleCriterionKey,RuleCriterion.RuleKey,RuleCriterion.UpdatedByUserKey,RuleCriterion.UpdatedOn
  FROM RuleCriterion
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
CREATE VIEW [dbo].[vBoRuleFilter]
AS
SELECT RuleFilter.ComparisonCode,RuleFilter.PropertyName,RuleFilter.RuleCriterionKey,RuleFilter.RuleFilterKey,RuleFilter.ValueOne,RuleFilter.ValueOneTypeName,RuleFilter.ValueTwo,RuleFilter.ValueTwoTypeName,RuleFilter.UpdatedByUserKey,RuleFilter.UpdatedOn
  FROM RuleFilter
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
CREATE VIEW [dbo].[vBoSalesHistory]
AS
SELECT SalesHistory.BillToContactKey,SalesHistory.ExtendedCost,SalesHistory.ExtendedPrice,SalesHistory.InvoiceTypeCode,SalesHistory.OrderDate,SalesHistory.OrderNumber,SalesHistory.OrderTypeKey,SalesHistory.PriceSheetKey,SalesHistory.ProductKey,SalesHistory.QuantitySold,SalesHistory.ResponseMediaCode,SalesHistory.SalesHistoryKey,SalesHistory.ShipToContactKey,SalesHistory.SoldToContactKey,SalesHistory.SourceCodeKey,SalesHistory.TransactionDate,SalesHistory.UndiscountedExtendedPrice,SalesHistory.UomKey,SalesHistory.WarehouseKey,SalesHistory.CommissionPlanKey,SalesHistory.SalesTeamGroupKey,SalesHistory.SalesLocationKey,SalesHistory.Description,SalesHistory.InvoiceLineNumber,SalesHistory.InvoiceNumber,SalesHistory.IsPledge,SalesHistory.ListAs,SalesHistory.PromotionDiscountKey,SalesHistory.SourceSalesHistoryKey,SalesHistory.AccessKey,SalesHistory.CreatedByUserKey,SalesHistory.CreatedOn,SalesHistory.SystemEntityKey
  FROM SalesHistory
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
CREATE VIEW [dbo].[vBoSalesHistoryMemorialTribute]
AS
SELECT SalesHistoryMemorialTribute.ContactKey,SalesHistoryMemorialTribute.Description,SalesHistoryMemorialTribute.SalesHistoryKey,SalesHistoryMemorialTribute.SalesHistoryMemorialTributeKey
  FROM SalesHistoryMemorialTribute
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
CREATE VIEW [dbo].[vBoSalesHistorySoftCredit]
AS
SELECT SalesHistorySoftCredit.Amount,SalesHistorySoftCredit.ContactKey,SalesHistorySoftCredit.PercentCredit,SalesHistorySoftCredit.SalesHistorySoftCreditKey,SalesHistorySoftCredit.SalesHistoryKey
  FROM SalesHistorySoftCredit
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
CREATE VIEW [dbo].[vBoSalesLocationStatusRef]
AS
SELECT SalesLocationStatusRef.SalesLocationStatusCode,SalesLocationStatusRef.SalesLocationStatusDesc,SalesLocationStatusRef.SalesLocationStatusName
  FROM SalesLocationStatusRef
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
CREATE VIEW [dbo].[vBoSalutationRef]
AS
SELECT SalutationRef.AutoCreateFlag AS AutoCreate,SalutationRef.IsActive,SalutationRef.IsDefault,SalutationRef.IsOverrideable,SalutationRef.SalutationDesc AS Description,SalutationRef.SalutationKey,SalutationRef.IndividualFormula,SalutationRef.InstituteFormula,SalutationRef.NeedsGenerationFlag AS NeedsGeneration,SalutationRef.NeedsUpdateFlag AS NeedsUpdate
  FROM SalutationRef
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
CREATE VIEW [dbo].[vBoScheduledTask]
AS
SELECT ScheduledTask.AtomGraph,ScheduledTask.AtomKey,ScheduledTask.Category,ScheduledTask.CreatedByUserKey,ScheduledTask.CreatedOn,ScheduledTask.Description,ScheduledTask.IsDisabled,ScheduledTask.KeepAlive,ScheduledTask.MostRecentRun,ScheduledTask.MostRecentWorkflowInstanceKey,ScheduledTask.RunAsUserKey,ScheduledTask.Schedule,ScheduledTask.ScheduledTaskKey,ScheduledTask.SelectionLock,ScheduledTask.SingleInstanceConcurrency,ScheduledTask.UpdatedByUserKey,ScheduledTask.UpdatedOn,ScheduledTask.WorkflowInputParameters
  FROM ScheduledTask
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
CREATE VIEW [dbo].[vBoScheduledTaskHistory]
AS
SELECT ScheduledTaskHistory.CompletionStatus,ScheduledTaskHistory.FinishedOn,ScheduledTaskHistory.LogText,ScheduledTaskHistory.ScheduledTaskHistoryKey,ScheduledTaskHistory.ScheduledTaskKey,ScheduledTaskHistory.StartedOn,ScheduledTaskHistory.WorkflowInstanceKey
  FROM ScheduledTaskHistory
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
CREATE VIEW [dbo].[vBoScheduledTaskService]
AS
SELECT ScheduledTaskService.BaseDirectory,ScheduledTaskService.CategoryFilter,ScheduledTaskService.MachineName,ScheduledTaskService.MaxWorkerCount,ScheduledTaskService.ScheduledTaskServiceKey,ScheduledTaskService.ServiceName,ScheduledTaskService.ServiceStatus,ScheduledTaskService.UpdatedOn
  FROM ScheduledTaskService
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
CREATE VIEW [dbo].[vBoSeasonalFullAddress]
AS
SELECT SeasonalFullAddress.BeginDate,SeasonalFullAddress.EndDate,SeasonalFullAddress.FullAddressKey,SeasonalFullAddress.IsSeasonalAnnually,SeasonalFullAddress.ReplacesFullAddressKey,SeasonalFullAddress.SeasonalFullAddressKey
  FROM SeasonalFullAddress
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
CREATE VIEW [dbo].[vBoSegmentationDef]
AS
SELECT SegmentDefinition.Description,SegmentDefinition.Name,SegmentDefinition.NSelectElements,SegmentDefinition.QueryDocumentKey,SegmentDefinition.UpdatedByUserKey,SegmentDefinition.UpdatedOn,SegmentDefinition.ExecutionOrder,SegmentDefinition.IsJobNSelect,ListMain.MemberObjectType,SegmentDefinition.CreatedByUserKey,SegmentDefinition.CreatedOn,SegmentDefinition.SegmentationJobKey,ListMain.ListKey AS SegmentDefinitionKey
  FROM ListMain
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
CREATE VIEW [dbo].[vBoSegmentationJob]
AS
SELECT SegmentationJob.Description,SegmentationJob.InactiveDate,SegmentationJob.LastListCreatedByUserKey,SegmentationJob.LastListCreatedOn,SegmentationJob.MemberObjectType,SegmentationJob.Name,SegmentationJob.NSelectSegmentElements,SegmentationJob.NSelectSegments,SegmentationJob.SegmentationJobStatusCode,SegmentationJob.SupersetQueryDocumentKey,SegmentationJob.UpdatedByUserKey,SegmentationJob.UpdatedOn,SegmentationJob.UseNSelectFlag,SegmentationJob.IsExecutionEnabled,SegmentationJob.AccessKey,SegmentationJob.CreatedByUserKey,SegmentationJob.CreatedOn,SegmentationJob.SegmentationJobKey,SegmentationJob.SystemEntityKey
  FROM SegmentationJob
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
CREATE VIEW [dbo].[vBoSegmentationJobStatusRef]
AS
SELECT SegmentationJobStatusRef.SegmentationJobStatusCode,SegmentationJobStatusRef.SegmentationJobStatusDesc,SegmentationJobStatusRef.SegmentationJobStatusName
  FROM SegmentationJobStatusRef
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
CREATE VIEW [dbo].[vBoSequenceCounter]
AS
SELECT SequenceCounter.CounterName,SequenceCounter.CurrentValue,SequenceCounter.OrganizationKey,SequenceCounter.SystemEntityKey
  FROM SequenceCounter
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
CREATE VIEW [dbo].[vBoShipPriceRef]
AS
SELECT ShipPriceRef.ShipPriceCode,ShipPriceRef.ShipPriceDesc,ShipPriceRef.DisplayPrompt
  FROM ShipPriceRef
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
IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupSummaryMeeting]') AND [name] = N'PK_vSoaGroupSummaryMeeting')
BEGIN
  CREATE UNIQUE CLUSTERED INDEX PK_vSoaGroupSummaryMeeting ON [dbo].[vSoaGroupSummaryMeeting] (GroupId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupSummaryMeeting]') AND [name] = N'IX_vSoaGroupSummaryMeeting_ParentEntityId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaGroupSummaryMeeting_ParentEntityId ON [dbo].[vSoaGroupSummaryMeeting] (ParentEntityId)
  INCLUDE (Name, GroupClassId, ParentEntityTypeName)
END
go


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
IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupSummaryMT]') AND [name] = N'PK_vSoaGroupSummaryMT')
BEGIN
  CREATE UNIQUE CLUSTERED INDEX PK_vSoaGroupSummaryMT ON [dbo].[vSoaGroupSummaryMT] (GroupId)
END
go


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
            [n].[COMPANY] AS [Name], 
            [n].[COMPANY_RECORD]
      FROM  [dbo].[Name] AS [n]

GO
IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupSummaryOrganization]') AND [name] = N'PK_vSoaGroupSummaryOrganization')
BEGIN
  CREATE UNIQUE CLUSTERED INDEX PK_vSoaGroupSummaryOrganization ON [dbo].[vSoaGroupSummaryOrganization] (GroupId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupSummaryOrganization]') AND [name] = N'IX_vSoaGroupSummaryOrganization_ParentEntityId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaGroupSummaryOrganization_ParentEntityId ON [dbo].[vSoaGroupSummaryOrganization] (ParentEntityId, COMPANY_RECORD)
  INCLUDE (GroupClassId, ParentEntityTypeName, Name)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupSummaryOrganization]') AND [name] = N'IX_vSoaGroupSummaryOrganization_CompanyRecord')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaGroupSummaryOrganization_CompanyRecord ON [dbo].[vSoaGroupSummaryOrganization] (COMPANY_RECORD)
  INCLUDE (ParentEntityId, GroupClassId)
END
go


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
IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupSummaryProduct]') AND [name] = N'PK_vSoaGroupSummaryProduct')
BEGIN
  CREATE UNIQUE CLUSTERED INDEX PK_vSoaGroupSummaryProduct ON [dbo].[vSoaGroupSummaryProduct] (GroupId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupSummaryProduct]') AND [name] = N'IX_vSoaGroupSummaryProduct_ParentEntityId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaGroupSummaryProduct_ParentEntityId ON [dbo].[vSoaGroupSummaryProduct] (ParentEntityId)
  INCLUDE (Name, GroupClassId, ParentEntityTypeName)
END
go


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
            CASE WHEN ([n].[COMPANY] <> ''
                      AND [n].[COMPANY_RECORD] = '1')
                      THEN [n].[COMPANY] 
                      ELSE [n].[FULL_NAME]
                      END + ' Relationship' AS [Name]            
      FROM  [dbo].[Name] AS [n] 

GO
IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupSummaryRelationship]') AND [name] = N'PK_vSoaGroupSummaryRelationship')
BEGIN
  CREATE UNIQUE CLUSTERED INDEX PK_vSoaGroupSummaryRelationship ON [dbo].[vSoaGroupSummaryRelationship] (GroupId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupSummaryRelationship]') AND [name] = N'IX_vSoaGroupSummaryRelationship_ParentEntityId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaGroupSummaryRelationship_ParentEntityId ON [dbo].[vSoaGroupSummaryRelationship] (ParentEntityId)
  INCLUDE (Name, ParentEntityTypeName, GroupClassId)
END
go


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
    SELECT  [gsp].[GroupId],
            [gsp].[ParentEntityTypeName],
            [gsp].[ParentEntityId],
            [gsp].[GroupClassId],
            [gsp].[Name],
            [p].[DESCRIPTION] AS [Description], 
            CAST(0 AS BIT) AS [IsSimpleGroup],
            CAST(0 AS BIT) AS [IsMemberGroup],
            CAST(0 AS BIT) AS [IsPrimaryGroup]
      FROM  [dbo].[vSoaGroupSummaryProduct] gsp WITH (NOEXPAND)
      INNER JOIN [dbo].[Product] p On [gsp].[GroupId] = p.[PRODUCT_CODE]
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
      FROM  [dbo].[vSoaGroupSummaryMeeting] WITH (NOEXPAND)
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
      FROM  [dbo].[vSoaGroupSummaryMT] WITH (NOEXPAND)
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
      FROM  [dbo].[vSoaGroupSummaryRelationship] WITH (NOEXPAND)
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
      FROM  [dbo].[vSoaGroupSummaryOrganization] WITH (NOEXPAND)
     WHERE  [COMPANY_RECORD] = 1



GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoSoaGroup]'))
    DROP VIEW [dbo].[vBoSoaGroup]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoSoaGroup]
AS
SELECT vSoaGroupSummary.Description,vSoaGroupSummary.GroupClassId,vSoaGroupSummary.GroupId,vSoaGroupSummary.IsMemberGroup,vSoaGroupSummary.IsPrimaryGroup,vSoaGroupSummary.IsSimpleGroup,vSoaGroupSummary.Name,vSoaGroupSummary.ParentEntityId,vSoaGroupSummary.ParentEntityTypeName
  FROM vSoaGroupSummary
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
SELECT CAST(p.[PRODUCT_CODE] + ':' + a.[ID] AS VARCHAR(50)) AS [GroupMemberId],
       CAST(p.[PRODUCT_CODE] AS VARCHAR(50)) AS [GroupId],
       a.[ID] AS [PartyId],
       a.[SEQN] AS [Seqn]
  FROM [dbo].[Activity] AS a
       INNER JOIN [dbo].[Product] AS p ON a.[PRODUCT_CODE] = p.[PRODUCT_CODE]
WHERE a.[ACTIVITY_TYPE] = 'COMMITTEE' 

GO
IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupMemberSummaryCommittee]') AND [name] = N'PK_vSoaGroupMemberSummaryCommittee')
BEGIN
  CREATE UNIQUE CLUSTERED INDEX PK_vSoaGroupMemberSummaryCommittee ON [dbo].[vSoaGroupMemberSummaryCommittee] (Seqn)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupMemberSummaryCommittee]') AND [name] = N'IX_vSoaGroupMemberSummaryCommittee_PartyId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaGroupMemberSummaryCommittee_PartyId ON [dbo].[vSoaGroupMemberSummaryCommittee] (PartyId)
  INCLUDE (GroupMemberId, GroupId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupMemberSummaryCommittee]') AND [name] = N'IX_vSoaGroupMemberSummaryCommittee_GroupId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaGroupMemberSummaryCommittee_GroupId ON [dbo].[vSoaGroupMemberSummaryCommittee] (GroupId)
  INCLUDE (PartyId, GroupMemberId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupMemberSummaryCommittee]') AND [name] = N'IX_vSoaGroupMemberSummaryCommittee')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaGroupMemberSummaryCommittee ON [dbo].[vSoaGroupMemberSummaryCommittee] (GroupMemberId)
END
go


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
    SELECT  CAST('EVENT-' + [mm].[MEETING] + ':' + CAST([o].[ORDER_NUMBER] AS varchar(15)) AS varchar(50)) AS GroupMemberId,
            CAST('EVENT-' + [mm].[MEETING] AS varchar(50)) AS [GroupId],
            [o].[ST_ID] AS [PartyId],
            CAST(NULL AS varchar(70)) AS [PartyName],
            CAST(1 AS bit) AS [IsActive],
            [o].[ORDER_DATE] AS [JoinDate],
            NULL AS [DropDate]
      FROM  [dbo].[Meet_Master] AS [mm]
            INNER JOIN [dbo].[Order_Meet] AS [om] ON [mm].[MEETING] = [om].[MEETING]
            INNER JOIN [dbo].[Orders] AS [o] ON [om].[ORDER_NUMBER] = [o].[ORDER_NUMBER]
     WHERE  [o].[STAGE] != 'CANCELED' 
            AND [o].[STATUS] != 'C'

GO
IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupMemberSummaryEvent]') AND [name] = N'PK_vSoaGroupMemberSummaryEvent')
BEGIN
  CREATE UNIQUE CLUSTERED INDEX PK_vSoaGroupMemberSummaryEvent ON [dbo].[vSoaGroupMemberSummaryEvent] (GroupMemberId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupMemberSummaryEvent]') AND [name] = N'IX_vSoaGroupMemberSummaryEvent_PartyId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaGroupMemberSummaryEvent_PartyId ON [dbo].[vSoaGroupMemberSummaryEvent] (PartyId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupMemberSummaryEvent]') AND [name] = N'IX_vSoaGroupMemberSummaryEvent_GroupId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaGroupMemberSummaryEvent_GroupId ON [dbo].[vSoaGroupMemberSummaryEvent] (GroupId)
END
go


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
IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupMemberSummaryMT]') AND [name] = N'PK_vSoaGroupMemberSummaryMT')
BEGIN
  CREATE UNIQUE CLUSTERED INDEX PK_vSoaGroupMemberSummaryMT ON [dbo].[vSoaGroupMemberSummaryMT] (GroupMemberId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupMemberSummaryMT]') AND [name] = N'IX_vSoaGroupMemberSummaryMT_PartyId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaGroupMemberSummaryMT_PartyId ON [dbo].[vSoaGroupMemberSummaryMT] (PartyId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupMemberSummaryMT]') AND [name] = N'IX_vSoaGroupMemberSummaryMT_GroupId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaGroupMemberSummaryMT_GroupId ON [dbo].[vSoaGroupMemberSummaryMT] (GroupId, IsActive)
  INCLUDE (PartyName, JoinDate, PartyId, GroupMemberId, DropDate)
END
go


GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSoaGroupMemberSummaryOrganization_Company]'))
    DROP VIEW [dbo].[vSoaGroupMemberSummaryOrganization_Company]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO


CREATE VIEW [dbo].[vSoaGroupMemberSummaryOrganization_Company]
WITH SCHEMABINDING
AS
    SELECT  CAST('ORGRELATIONSHIP-' + [n].[CO_ID] + ':' + [n].[ID] AS VARCHAR(50)) AS [GroupMemberId],
            CAST('ORGRELATIONSHIP-' + [n].[CO_ID] AS VARCHAR(50)) AS [GroupId],
            [n].[ID] AS [PartyId],
            [n].[FULL_NAME] AS [PartyName],
            [n].[CO_ID]
      FROM  [dbo].[Name] AS [n]
     WHERE  [n].[CO_ID] != '' 

GO
IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupMemberSummaryOrganization_Company]') AND [name] = N'PK_vSoaGroupMemberSummaryOrganization_Company')
BEGIN
  CREATE UNIQUE CLUSTERED INDEX PK_vSoaGroupMemberSummaryOrganization_Company ON [dbo].[vSoaGroupMemberSummaryOrganization_Company] (GroupMemberId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupMemberSummaryOrganization_Company]') AND [name] = N'IX_vSoaGroupMemberSummaryOrganization_Company_PartyId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaGroupMemberSummaryOrganization_Company_PartyId ON [dbo].[vSoaGroupMemberSummaryOrganization_Company] (PartyId)
  INCLUDE (CO_ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupMemberSummaryOrganization_Company]') AND [name] = N'IX_vSoaGroupMemberSummaryOrganization_Company_GroupId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaGroupMemberSummaryOrganization_Company_GroupId ON [dbo].[vSoaGroupMemberSummaryOrganization_Company] (GroupId)
END
go


GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSoaGroupMemberSummaryOrganization_Relationship]'))
    DROP VIEW [dbo].[vSoaGroupMemberSummaryOrganization_Relationship]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO


CREATE VIEW [dbo].[vSoaGroupMemberSummaryOrganization_Relationship]
WITH SCHEMABINDING
AS
    SELECT  CAST('ORGRELATIONSHIP-' + [r].[ID] + ':' + [n].[ID] AS VARCHAR(50)) AS [GroupMemberId],
            CAST('ORGRELATIONSHIP-' + [r].[ID] AS VARCHAR(50)) AS [GroupId],
            [n].[ID] AS [PartyId],
            [n].[FULL_NAME] AS [PartyName],
            [r].[ID] AS [CO_ID]
      FROM  [dbo].[Relationship] AS [r] 
                INNER JOIN [dbo].[Name] AS [n] ON R.[TARGET_ID] = n.[ID]
     WHERE  [r].[RELATION_TYPE] = '_ORG-ADMIN'

GO
IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupMemberSummaryOrganization_Relationship]') AND [name] = N'PK_vSoaGroupMemberSummaryOrganization_Relationship')
BEGIN
  CREATE UNIQUE CLUSTERED INDEX PK_vSoaGroupMemberSummaryOrganization_Relationship ON [dbo].[vSoaGroupMemberSummaryOrganization_Relationship] (GroupMemberId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupMemberSummaryOrganization_Relationship]') AND [name] = N'IX_vSoaGroupMemberSummaryOrganization_Relationship_PartyId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaGroupMemberSummaryOrganization_Relationship_PartyId ON [dbo].[vSoaGroupMemberSummaryOrganization_Relationship] (PartyId)
  INCLUDE (CO_ID)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupMemberSummaryOrganization_Relationship]') AND [name] = N'IX_vSoaGroupMemberSummaryOrganization_Relationship_GroupId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaGroupMemberSummaryOrganization_Relationship_GroupId ON [dbo].[vSoaGroupMemberSummaryOrganization_Relationship] (GroupId)
END
go


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
AS
    SELECT  [GroupMemberId],
            [GroupId],
            [PartyId],
            [PartyName],
            [CO_ID]
      FROM  [dbo].[vSoaGroupMemberSummaryOrganization_Company] WITH (NOEXPAND)
    UNION ALL
    SELECT  [GroupMemberId],
            [GroupId],
            [PartyId],
            [PartyName],
            [CO_ID]
      FROM  [dbo].[vSoaGroupMemberSummaryOrganization_Relationship] gsc WITH (NOEXPAND)


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
    SELECT  CAST(SUBSTRING('RELATIONSHIP-' + [r].[ID] + ':'
                           + CASE WHEN [r].[TARGET_ID] > ''
                                  THEN [r].[TARGET_ID]
                                  ELSE [r].[TARGET_NAME]
                             END, 1, 50) AS VARCHAR(50)) AS [GroupMemberId],
            CAST('RELATIONSHIP-' + [r].[ID] AS VARCHAR(50)) AS [GroupId],
            [r].[ID] AS [GroupOwnerId],
            [r].[TARGET_ID] AS [PartyId],
            CAST([r].[TARGET_NAME] AS VARCHAR(70)) AS [PartyName],
            [r].[SEQN]
      FROM  [dbo].[Relationship] AS r
      WHERE [r].[RELATION_TYPE] != '_ORG-ADMIN'

GO
IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupMemberSummaryRelationship]') AND [name] = N'PK_vSoaGroupMemberSummaryRelationship')
BEGIN
  CREATE UNIQUE CLUSTERED INDEX PK_vSoaGroupMemberSummaryRelationship ON [dbo].[vSoaGroupMemberSummaryRelationship] (GroupMemberId, SEQN)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupMemberSummaryRelationship]') AND [name] = N'IX_vSoaGroupMemberSummaryRelationship_PartyId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaGroupMemberSummaryRelationship_PartyId ON [dbo].[vSoaGroupMemberSummaryRelationship] (PartyId)
  INCLUDE (GroupId, GroupOwnerId, PartyName)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupMemberSummaryRelationship]') AND [name] = N'IX_vSoaGroupMemberSummaryRelationship_GroupId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaGroupMemberSummaryRelationship_GroupId ON [dbo].[vSoaGroupMemberSummaryRelationship] (GroupId)
END
go


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
IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupMemberSummarySubscription]') AND [name] = N'PK_vSoaGroupMemberSummarySubscription')
BEGIN
  CREATE UNIQUE CLUSTERED INDEX PK_vSoaGroupMemberSummarySubscription ON [dbo].[vSoaGroupMemberSummarySubscription] (GroupMemberId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupMemberSummarySubscription]') AND [name] = N'IX_vSoaGroupMemberSummarySubscription_PartyId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaGroupMemberSummarySubscription_PartyId ON [dbo].[vSoaGroupMemberSummarySubscription] (PartyId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupMemberSummarySubscription]') AND [name] = N'IX_vSoaGroupMemberSummarySubscription_GroupId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaGroupMemberSummarySubscription_GroupId ON [dbo].[vSoaGroupMemberSummarySubscription] (GroupId)
  INCLUDE (PartyName, BEGIN_DATE, DropDate, GroupMemberId, JoinDate, PAID_THRU, PartyId)
END
go


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
                        OR DATEADD(DAY, 1, [PAID_THRU]) > GETDATE()
                      )
                      AND ( [BEGIN_DATE] IS NULL
                            OR [BEGIN_DATE] < GETDATE()
                          ) THEN CAST(1 AS BIT)
                 ELSE CAST(0 AS BIT)
            END AS [IsActive],
            [JoinDate],
            [DropDate]
      FROM  [dbo].[vSoaGroupMemberSummarySubscription] WITH (NOEXPAND)
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
                                        AND [a].[PRODUCT_CODE] = [GroupId]
                                        AND ( ( [a].[EFFECTIVE_DATE] IS NULL
                                                AND ( [a].[THRU_DATE] IS NULL
                                                      OR DATEADD(DAY, 1, [a].[THRU_DATE]) > GETDATE()
                                                    )
                                              )
                                              OR ( [a].[EFFECTIVE_DATE] <= GETDATE()
                                                   AND ( [a].[THRU_DATE] IS NULL
                                                         OR DATEADD(DAY, 1, [a].[THRU_DATE]) > GETDATE()
                                                       )
                                                 )
                                            ) ) THEN CAST(1 AS BIT)
                 ELSE CAST(0 AS BIT)
            END AS [IsActive],
            NULL AS [JoinDate],
            NULL AS [DropDate]
      FROM  [dbo].[vSoaGroupMemberSummaryCommittee] WITH (NOEXPAND)
    UNION ALL
    SELECT  [GroupMemberId],
            [GroupId],
            [PartyId],
            [PartyName],
            [IsActive],
            [JoinDate],
            [DropDate]
      FROM  [dbo].[vSoaGroupMemberSummaryEvent] WITH (NOEXPAND)
    UNION ALL
    SELECT  [GroupMemberId],
            [GroupId],
            [PartyId],
            [PartyName],
            [IsActive],
            [JoinDate],
            [DropDate]
      FROM  [dbo].[vSoaGroupMemberSummaryMT] WITH (NOEXPAND)
    UNION ALL
    SELECT  DISTINCT
            [GroupMemberId],
            [GroupId],
            [PartyId],
            [PartyName],
            CASE WHEN EXISTS ( SELECT   1
                                 FROM   [dbo].[Relationship] AS [r]
                                WHERE   ( [r].[TARGET_ID] = [PartyId] AND [r].[ID] = [GroupOwnerId] )
                                        AND ( [r].[STATUS] = NULL
                                              OR RTRIM([r].[STATUS]) = ''
                                              OR [r].[STATUS] = 'A'
                                            )
                                        AND ( ( [r].[EFFECTIVE_DATE] IS NULL
                                                AND ( [r].[THRU_DATE] IS NULL
                                                      OR DATEADD(DAY, 1, [r].[THRU_DATE]) > GETDATE()
                                                    )
                                              )
                                              OR ( [r].[EFFECTIVE_DATE] <= GETDATE()
                                                   AND ( [r].[THRU_DATE] IS NULL
                                                         OR DATEADD(DAY, 1, [r].[THRU_DATE]) > GETDATE()
                                                       )
                                                 )
                                            )
                                        ) THEN CAST(1 AS BIT)
                 ELSE CAST(0 AS BIT)
            END AS [IsActive],
            NULL AS [JoinDate],
            NULL AS [DropDate]
      FROM  [dbo].[vSoaGroupMemberSummaryRelationship] WITH (NOEXPAND)
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



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoSoaGroupMember]'))
    DROP VIEW [dbo].[vBoSoaGroupMember]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoSoaGroupMember]
AS
SELECT vSoaGroupMemberSummary.DropDate,vSoaGroupMemberSummary.GroupId,vSoaGroupMemberSummary.GroupMemberId,vSoaGroupMemberSummary.IsActive,vSoaGroupMemberSummary.JoinDate,vSoaGroupMemberSummary.PartyId,vSoaGroupMemberSummary.PartyName
  FROM vSoaGroupMemberSummary
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
SELECT CAST(p.[PRODUCT_CODE] + ':' + [a].[ID] + ':' + CAST(a.[SEQN] AS varchar(10)) AS varchar(50)) AS [GroupMemberDetailId],
       CAST(p.[PRODUCT_CODE] + ':' + [a].[ID] AS varchar(50)) AS [GroupMemberId],
       a.[ID] AS [PartyId],
       a.[EFFECTIVE_DATE] AS [EffectiveDate],
       a.[THRU_DATE] AS [ExpirationDate],
       a.[ACTION_CODES] AS [ActionCodes]
  FROM [dbo].[Activity] a
       INNER JOIN [dbo].[Product] p ON a.[PRODUCT_CODE] = p.[PRODUCT_CODE]
WHERE [a].[ACTIVITY_TYPE] = 'COMMITTEE' 

GO
IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupMemberDetailCommittee]') AND [name] = N'PK_vSoaGroupMemberDetailCommittee')
BEGIN
  CREATE UNIQUE CLUSTERED INDEX PK_vSoaGroupMemberDetailCommittee ON [dbo].[vSoaGroupMemberDetailCommittee] (GroupMemberDetailId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupMemberDetailCommittee]') AND [name] = N'IX_vSoaGroupMemberDetailCommittee_GroupMemberId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaGroupMemberDetailCommittee_GroupMemberId ON [dbo].[vSoaGroupMemberDetailCommittee] (GroupMemberId)
END
go


GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSoaGroupMemberDetailOrganization_Company]'))
    DROP VIEW [dbo].[vSoaGroupMemberDetailOrganization_Company]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO



CREATE VIEW [dbo].[vSoaGroupMemberDetailOrganization_Company]
WITH SCHEMABINDING
AS
    SELECT  CAST('ORGRELATIONSHIP-' + [n].[CO_ID] + ':' + [n].[ID] AS VARCHAR(50)) AS [GroupMemberDetailId],
            CAST('ORGRELATIONSHIP-' + [n].[CO_ID] + ':' + [n].[ID] AS VARCHAR(50)) AS [GroupMemberId],
            [n].[ID] AS [PartyId],
            CAST(1 AS BIT) AS [IsActive],
            CAST('ORGRELATIONSHIP:MEMBER' AS VARCHAR(30)) AS [GroupRoleId],
            CAST('Member' AS VARCHAR(100)) AS [RoleName],
            CAST([n].[TITLE] AS VARCHAR(100)) AS [Title]
      FROM  [dbo].[Name] AS [n]
     WHERE  [n].[CO_ID] != '' 


GO
IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupMemberDetailOrganization_Company]') AND [name] = N'PK_vSoaGroupMemberDetailOrganization_Company')
BEGIN
  CREATE UNIQUE CLUSTERED INDEX PK_vSoaGroupMemberDetailOrganization_Company ON [dbo].[vSoaGroupMemberDetailOrganization_Company] (GroupMemberDetailId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupMemberDetailOrganization_Company]') AND [name] = N'IX_vSoaGroupMemberDetailOrganization_Company')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaGroupMemberDetailOrganization_Company ON [dbo].[vSoaGroupMemberDetailOrganization_Company] (GroupMemberId)
END
go


GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSoaGroupMemberDetailOrganization_Relationship]'))
    DROP VIEW [dbo].[vSoaGroupMemberDetailOrganization_Relationship]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO



CREATE VIEW [dbo].[vSoaGroupMemberDetailOrganization_Relationship]
WITH SCHEMABINDING
AS
    SELECT  CAST('ORGRELATIONSHIP-' + r.[ID] + ':' + r.[TARGET_ID] + ':' + CAST([r].[SEQN] AS VARCHAR(10)) AS VARCHAR(50)) AS [GroupMemberDetailId],
            CAST('ORGRELATIONSHIP-' + r.[ID] + ':' + r.[TARGET_ID] AS VARCHAR(50)) AS [GroupMemberId],
            r.[TARGET_ID] AS [PartyId],
            CAST(1 AS BIT) AS [IsActive],
            CAST('COMPANYADMINISTRATOR' AS VARCHAR(30)) AS [GroupRoleId],
            CAST(rt.[DESCRIPTION] AS VARCHAR(100)) AS [RoleName],
            r.[TITLE] AS [Title]
      FROM  [dbo].[Relationship] AS r 
            INNER JOIN [dbo].[Relationship_Types] rt ON r.[RELATION_TYPE] = rt.[RELATION_TYPE]
     WHERE  [r].[RELATION_TYPE] = '_ORG-ADMIN'



GO
IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupMemberDetailOrganization_Relationship]') AND [name] = N'PK_vSoaGroupMemberDetailOrganization_Relationship')
BEGIN
  CREATE UNIQUE CLUSTERED INDEX PK_vSoaGroupMemberDetailOrganization_Relationship ON [dbo].[vSoaGroupMemberDetailOrganization_Relationship] (GroupMemberDetailId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupMemberDetailOrganization_Relationship]') AND [name] = N'IX_vSoaGroupMemberDetailOrganization_Relationship')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaGroupMemberDetailOrganization_Relationship ON [dbo].[vSoaGroupMemberDetailOrganization_Relationship] (GroupMemberId)
END
go


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
AS
    SELECT  [GroupMemberDetailId],
            [GroupMemberId],
            [PartyId],
            [IsActive],
            [GroupRoleId],
            [RoleName],
            [Title]
      FROM  [dbo].[vSoaGroupMemberDetailOrganization_Company] WITH (NOEXPAND)
    UNION ALL
    SELECT  [GroupMemberDetailId],
            [GroupMemberId],
            [PartyId],
            [IsActive],
            [GroupRoleId],
            [RoleName],
            [Title]
      FROM  [dbo].[vSoaGroupMemberDetailOrganization_Relationship] WITH (NOEXPAND)


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
     WHERE [rt].[RELATION_TYPE] != '_ORG-ADMIN'

GO
IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupMemberDetailRelationship]') AND [name] = N'PK_vSoaGroupMemberDetailRelationship')
BEGIN
  CREATE UNIQUE CLUSTERED INDEX PK_vSoaGroupMemberDetailRelationship ON [dbo].[vSoaGroupMemberDetailRelationship] (GroupMemberDetailId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupMemberDetailRelationship]') AND [name] = N'IX_vSoaGroupMemberDetailRelationship_GroupMemberId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaGroupMemberDetailRelationship_GroupMemberId ON [dbo].[vSoaGroupMemberDetailRelationship] (GroupMemberId)
END
go


GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSoaGroupMemberDetailSubscriptionAdmin]'))
    DROP VIEW [dbo].[vSoaGroupMemberDetailSubscriptionAdmin]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO


CREATE VIEW [dbo].[vSoaGroupMemberDetailSubscriptionAdmin]
WITH SCHEMABINDING
AS    
    SELECT CAST(p1.[PRODUCT_CODE] + ':' + s.[ID]+ ':GA' AS varchar(50)) AS [GroupMemberDetailId],
           CAST(p1.[PRODUCT_CODE] + ':' + s.[ID] AS varchar(50)) AS [GroupMemberId],
           s.[ID] AS [PartyId],
           CAST(NULL AS datetime) AS [EffectiveDate],
           CAST(NULL AS datetime) AS [ExpirationDate],
           CAST('CHAPT:ADMIN' AS varchar(30)) AS [GroupRoleId],
           CAST('Chapter Administrator' AS varchar(100)) AS [RoleName],
           CAST(NULL AS varchar(100)) AS [RoleDescription],
           CAST(NULL AS int) AS [RolePriority],
           CAST(NULL AS varchar(100)) AS [RoleReciprocalName],
           CAST(NULL AS varchar(100)) AS [RoleReciprocalDescription],
           CAST(NULL AS varchar(100)) AS [Title],
           CAST(NULL AS varchar(6000)) AS [Note]
      FROM [dbo].[Subscriptions] AS s
           INNER JOIN [dbo].[Product] AS p1 ON s.[PRODUCT_CODE] = p1.[PRODUCT_CODE]
     WHERE p1.[PROD_TYPE]= 'CHAPT' AND s.[IS_GROUP_ADMIN] = 1
GO
IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupMemberDetailSubscriptionAdmin]') AND [name] = N'PK_vSoaGroupMemberDetailSubscriptionAdmin')
BEGIN
  CREATE UNIQUE CLUSTERED INDEX PK_vSoaGroupMemberDetailSubscriptionAdmin ON [dbo].[vSoaGroupMemberDetailSubscriptionAdmin] (GroupMemberDetailId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupMemberDetailSubscriptionAdmin]') AND [name] = N'IX_vSoaGroupMemberDetailSubscriptionAdmin_GroupMemberId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaGroupMemberDetailSubscriptionAdmin_GroupMemberId ON [dbo].[vSoaGroupMemberDetailSubscriptionAdmin] (GroupMemberId)
END
go


GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSoaGroupMemberDetailSubscriptionBase]'))
    DROP VIEW [dbo].[vSoaGroupMemberDetailSubscriptionBase]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO


CREATE VIEW [dbo].[vSoaGroupMemberDetailSubscriptionBase]
WITH SCHEMABINDING
AS
    SELECT CAST(p1.[PRODUCT_CODE] + ':' + s.[ID] AS varchar(50)) AS [GroupMemberDetailId],
           CAST(p1.[PRODUCT_CODE] + ':' + s.[ID] AS varchar(50)) AS [GroupMemberId],
           s.[ID] AS [PartyId],
           s.[BEGIN_DATE] AS [EffectiveDate],
           s.[PAID_THRU] AS [ExpirationDate],
           CAST('SUBSCRIPTION:MEMBER' AS varchar(30)) AS [GroupRoleId],
           CAST('Member' AS varchar(100)) AS [RoleName],
           CAST(NULL AS varchar(100)) AS [RoleDescription],
           CAST(NULL AS int) AS [RolePriority],
           CAST(NULL AS varchar(100)) AS [RoleReciprocalName],
           CAST(NULL AS varchar(100)) AS [RoleReciprocalDescription],
           CAST(NULL AS varchar(100)) AS [Title],
           CAST(NULL AS varchar(6000)) AS [Note]
      FROM [dbo].[Subscriptions] AS s
           INNER JOIN [dbo].[Product] AS p1 ON s.[PRODUCT_CODE] = p1.[PRODUCT_CODE]
     WHERE p1.[PROD_TYPE] IN ( 'DUES', 'SUB', 'SEC', 'CHAPT', 'VOL', 'MISC' )                                    
GO
IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupMemberDetailSubscriptionBase]') AND [name] = N'PK_vSoaGroupMemberDetailSubscriptionBase')
BEGIN
  CREATE UNIQUE CLUSTERED INDEX PK_vSoaGroupMemberDetailSubscriptionBase ON [dbo].[vSoaGroupMemberDetailSubscriptionBase] (GroupMemberDetailId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaGroupMemberDetailSubscriptionBase]') AND [name] = N'IX_vSoaGroupMemberDetailSubscriptionBase_GroupMemberId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaGroupMemberDetailSubscriptionBase_GroupMemberId ON [dbo].[vSoaGroupMemberDetailSubscriptionBase] (GroupMemberId)
END
go


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
AS
    SELECT [GroupMemberDetailId],
           [GroupMemberId],
           [PartyId],
           [EffectiveDate],
           [ExpirationDate],
           [GroupRoleId],
           [RoleName],
           [RoleDescription],
           [RolePriority],
           [RoleReciprocalName],
           [RoleReciprocalDescription],
           [Title],
           [Note]
      FROM [dbo].[vSoaGroupMemberDetailSubscriptionBase] WITH (NOEXPAND)
     UNION
    SELECT [GroupMemberDetailId],
           [GroupMemberId],
           [PartyId],
           [EffectiveDate],
           [ExpirationDate],
           [GroupRoleId],
           [RoleName],
           [RoleDescription],
           [RolePriority],
           [RoleReciprocalName],
           [RoleReciprocalDescription],
           [Title],
           [Note]
      FROM [dbo].[vSoaGroupMemberDetailSubscriptionAdmin] WITH (NOEXPAND)


                                     

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
SELECT [GroupMemberDetailId],
       [GroupMemberId],
       [PartyId],
       [EffectiveDate],
       [ExpirationDate],
       CAST(CASE WHEN ( [ExpirationDate] IS NULL OR [ExpirationDate] > DATEADD(DAY, 1, GETDATE()) ) 
                  AND ( [EffectiveDate] IS NULL OR [EffectiveDate] < GETDATE() ) 
                 THEN 1
                 ELSE 0
            END AS bit) AS [IsActive],
       [GroupRoleId],
       [RoleName],
       [RoleDescription],
       [RolePriority],
       [RoleReciprocalName],
       [RoleReciprocalDescription],
       [Title],
       [Note],
       CAST(NULL AS varchar(100)) AS [RoleReciprocalOverwrite],
       CAST(NULL AS varchar(100)) AS [RoleReciprocalOverwriteDesc]
  FROM [dbo].[vSoaGroupMemberDetailSubscription] 
UNION ALL
SELECT [GroupMemberDetailId],
       [GroupMemberId],
       [PartyId],
       [EffectiveDate],
       [ExpirationDate],
       CAST(CASE WHEN ( [ExpirationDate] IS NULL OR [ExpirationDate] > DATEADD(DAY, 1, GETDATE()) )
                  AND ( [EffectiveDate] IS NULL OR [EffectiveDate] < GETDATE() ) 
                 THEN 1
                 ELSE 0
            END AS bit) AS [IsActive],
       CASE WHEN cp.[POSITION_CODE] IS NOT NULL
            THEN CAST('COMMITTEE:' + cp.[POSITION_CODE] AS varchar(30))
            ELSE CAST(NULL AS varchar(30))
       END AS [GroupRoleId],
       CAST(cp.[TITLE] AS varchar(100)) AS [RoleName],
       CAST(NULL AS varchar(100)) AS [RoleDescription],
       cp.[RANK] AS [RolePriority],
       CAST(NULL AS varchar(100)) AS [RoleReciprocalName],
       CAST(NULL AS varchar(100)) AS [RoleReciprocalDescription],
       CAST(NULL AS varchar(100)) AS [Title],
       CAST(NULL AS varchar(6000)) AS [Note],
       CAST(NULL AS varchar(100)) AS [RoleReciprocalOverwrite],
       CAST(NULL AS varchar(100)) AS [RoleReciprocalOverwriteDesc]
  FROM [dbo].[vSoaGroupMemberDetailCommittee] AS [gmdc] WITH (NOEXPAND)
       LEFT OUTER JOIN [dbo].[Committee_Position] AS cp ON [gmdc].[ActionCodes] = cp.[POSITION_CODE]
                                                         AND [gmdc].[ActionCodes] != ''
UNION ALL
SELECT gmdr.[GroupMemberDetailId],
       gmdr.[GroupMemberId],
       gmdr.[PartyId],
       gmdr.[EffectiveDate],
       gmdr.[ExpirationDate],
       CAST(CASE WHEN ( gmdr.[ExpirationDate] IS NULL OR gmdr.[ExpirationDate] > DATEADD(DAY, 1, GETDATE()) )
                  AND ( gmdr.[EffectiveDate] IS NULL OR gmdr.[EffectiveDate] < GETDATE() )
                  AND ( gmdr.[STATUS] IS NULL OR RTRIM(gmdr.[STATUS]) = '' OR gmdr.[STATUS] = 'A' ) 
                 THEN 1
                 ELSE 0
            END AS bit) AS [IsActive],
       gmdr.[GroupRoleId],
       gmdr.[RoleName],
       gmdr.[RoleDescription],
       gmdr.[RolePriority],
       CAST(rrt.[RELATION_TYPE] AS varchar(100)) AS [RoleReciprocalName],
       CAST(rrt.[DESCRIPTION] AS varchar(100)) AS [RoleReciprocalDescription],
       gmdr.[Title],
       CAST(r.[NOTE] AS varchar(6000)) AS [Note],
       CAST(r.[TARGET_RELATION_TYPE] AS varchar(100)) AS [RoleReciprocalOverwrite],
       CAST(rro.[DESCRIPTION] AS varchar(100)) AS [RoleReciprocalOverwriteDesc]
  FROM [dbo].[vSoaGroupMemberDetailRelationship] AS gmdr WITH (NOEXPAND)
       INNER JOIN [dbo].[Relationship] r ON r.SEQN = gmdr.[SEQN]
       INNER JOIN [dbo].[Relationship_Types] [crt] ON [crt].[RELATION_TYPE] = gmdr.[RoleName]
       LEFT OUTER JOIN [dbo].[Relationship_Types] rrt ON rrt.[RELATION_TYPE] =[crt].[RECIPROCAL_TYPE]
       LEFT OUTER JOIN [dbo].[Relationship_Types] rro ON rro.[RELATION_TYPE] =r.[TARGET_RELATION_TYPE]
UNION ALL                                                                      
SELECT [GroupMemberDetailId],
       [GroupMemberId],
       [PartyId],
       NULL AS [EffectiveDate],
       NULL AS [ExpirationDate],
       CAST(1 AS BIT) AS [IsActive],
       [GroupRoleId],
       [RoleName],
       CAST(NULL AS varchar(100)) AS [RoleDescription],
       CAST(NULL AS int) AS [RolePriority],
       CAST(NULL AS varchar(100)) AS [RoleReciprocalName],
       CAST(NULL AS varchar(100)) AS [RoleReciprocalDescription],
       [Title],
       CAST(NULL AS varchar(6000)) AS [Note],
       CAST(NULL AS varchar(100)) AS [RoleReciprocalOverwrite],
       CAST(NULL AS varchar(100)) AS [RoleReciprocalOverwriteDesc]
  FROM [dbo].[vSoaGroupMemberDetailOrganization] 




GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoSoaGroupMemberDetail]'))
    DROP VIEW [dbo].[vBoSoaGroupMemberDetail]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoSoaGroupMemberDetail]
AS
SELECT vSoaGroupMemberDetail.EffectiveDate,vSoaGroupMemberDetail.ExpirationDate,vSoaGroupMemberDetail.GroupMemberDetailId,vSoaGroupMemberDetail.GroupMemberId,vSoaGroupMemberDetail.GroupRoleId,vSoaGroupMemberDetail.IsActive,vSoaGroupMemberDetail.Note,vSoaGroupMemberDetail.PartyId,vSoaGroupMemberDetail.RoleDescription,vSoaGroupMemberDetail.RoleName,vSoaGroupMemberDetail.RolePriority,vSoaGroupMemberDetail.RoleReciprocalDescription,vSoaGroupMemberDetail.RoleReciprocalName,vSoaGroupMemberDetail.RoleReciprocalOverwrite,vSoaGroupMemberDetail.RoleReciprocalOverwriteDesc,vSoaGroupMemberDetail.Title
  FROM vSoaGroupMemberDetail
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vUDBOSocialNetworkLinks]'))
    DROP VIEW [dbo].[vUDBOSocialNetworkLinks]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE VIEW [dbo].[vUDBOSocialNetworkLinks]
AS
SELECT s.RowID AS [ContactKey],
       CAST(MAX(CASE WHEN s.PropertyName = 'FacebookId' THEN s.PropertyStringValue ELSE NULL END) AS nvarchar(80)) AS [FacebookId]
  FROM [dbo].[UserDefinedSingleInstanceProperty] s
 WHERE s.TableName = 'SocialNetworkLinks'
 GROUP BY s.RowID

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoSocialNetworkLinks]'))
    DROP VIEW [dbo].[vBoSocialNetworkLinks]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoSocialNetworkLinks]
AS
SELECT vUDBOSocialNetworkLinks.ContactKey,vUDBOSocialNetworkLinks.FacebookId
  FROM vUDBOSocialNetworkLinks
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoSocialNetworkRef]'))
    DROP VIEW [dbo].[vBoSocialNetworkRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoSocialNetworkRef]
AS
SELECT SocialNetworkRef.BaseURL,SocialNetworkRef.SocialNetworkKey,SocialNetworkRef.SocialNetworkName
  FROM SocialNetworkRef
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
CREATE VIEW [dbo].[vBoSoftCreditRelationshipType]
AS
SELECT SoftCreditRelationshipType.Percentage,SoftCreditRelationshipType.RelationshipTypeKey,SoftCreditRelationshipType.UpdatedByUserKey,SoftCreditRelationshipType.UpdatedOn,SoftCreditRelationshipType.SoftCreditRelationshipKey
  FROM SoftCreditRelationshipType
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
CREATE VIEW [dbo].[vBoSolicitation]
AS
SELECT SolicitationMain.Description,SolicitationMain.Name,SolicitationMain.UpdatedByUserKey,SolicitationMain.UpdatedOn,SolicitationMain.SolicitationStatusCode,SolicitationMain.CostCollection,SolicitationMain.PredictedResponseRate,SolicitationMain.TargetRevenue,SolicitationMain.TotalRevenue,SolicitationMain.EndDate,SolicitationMain.StartDate,SolicitationMain.ReminderDate,SolicitationMain.AppealKey,SolicitationMain.CreatedByUserKey,SolicitationMain.CreatedOn,SolicitationMain.SolicitationKey,SolicitationMain.AccessKey,SolicitationMain.ActualCost,SolicitationMain.EstimatedCost,SolicitationMain.ExtendedCost,SolicitationMain.FirstResponseDate,SolicitationMain.HighResponseAmount,SolicitationMain.LastResponseDate,SolicitationMain.LowResponseAmount,SolicitationMain.OverheadCost,SolicitationMain.TotalNegativeResponse,SolicitationMain.TotalPositiveResponse,SolicitationMain.TotalSolicited
  FROM SolicitationMain
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
CREATE VIEW [dbo].[vBoSolicitationStatusRef]
AS
SELECT SolicitationStatusRef.SolicitationStatusCode,SolicitationStatusRef.SolicitationStatusDesc,SolicitationStatusRef.SolicitationStatusName
  FROM SolicitationStatusRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoSolicitors]'))
    DROP VIEW [dbo].[vBoSolicitors]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoSolicitors]
AS
SELECT Name_Staff.ID,Name.FULL_NAME,Name_Staff.IS_VOLUNTEER,Name_Staff.IS_SALESMAN
  FROM Name
	INNER JOIN Name_Staff
		ON Name.ID = Name_Staff.ID
 WHERE Name_Staff.IS_SALESMAN=1
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
CREATE VIEW [dbo].[vBoSourceCode]
AS
SELECT ListMain.MemberObjectType,SourceCode.CostCollection,SourceCode.Description,SourceCode.ExternalListCount,SourceCode.Name,SourceCode.PackageKey,SourceCode.PredictedResponseRate,SourceCode.ResponsesTotalledOn,SourceCode.SourceCodeStatusCode,SourceCode.TotalRevenue,SourceCode.UpdatedByUserKey,SourceCode.UpdatedOn,SourceCode.LastDropDate,SourceCode.TotalSolicited,SourceCode.OverheadCost,SourceCode.EstimatedCost,SourceCode.SourceCodeTypeCode,SourceCode.FirstResponseDate,SourceCode.HighResponseAmount,SourceCode.LastResponseDate,SourceCode.LowResponseAmount,SourceCode.ExternalFileName,SourceCode.TotalNegativeResponse,SourceCode.TotalPositiveResponse,SourceCode.TargetRevenue,SourceCode.Code,SourceCode.CreatedByUserKey,SourceCode.CreatedOn,SourceCode.SolicitationKey,SourceCode.SourceCodeKey,SourceCode.AccessKey
  FROM SourceCode
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
CREATE VIEW [dbo].[vBoSourceCodeStatusRef]
AS
SELECT SourceCodeStatusRef.SourceCodeStatusCode,SourceCodeStatusRef.SourceCodeStatusDesc,SourceCodeStatusRef.SourceCodeStatusName
  FROM SourceCodeStatusRef
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
CREATE VIEW [dbo].[vBoSourceCodeTypeRef]
AS
SELECT SourceCodeTypeRef.SourceCodeTypeCode,SourceCodeTypeRef.SourceCodeTypeDesc,SourceCodeTypeRef.SourceCodeTypeName
  FROM SourceCodeTypeRef
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
CREATE VIEW [dbo].[vBoSourceList]
AS
SELECT SolicitationSource.SolicitationSourceKey,SolicitationSource.UpdatedByUserKey,SolicitationSource.UpdatedOn,SolicitationSource.DisplayText,SolicitationSource.NavigationHint,SolicitationSource.OriginListType,SolicitationSource.OriginListKeys,SolicitationSource.SelectorComponentKey,SolicitationSource.CreatedByUserKey,SolicitationSource.CreatedOn,SolicitationSource.SourceCodeKey
  FROM SolicitationSource
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
CREATE VIEW [dbo].[vBoStandardPage]
AS
SELECT StandardPageRef.StandardPageCode,StandardPageRef.StandardPageDesc AS Description,StandardPageRef.StandardPageUrl AS Url
  FROM StandardPageRef
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
CREATE VIEW [dbo].[vBoStateProvinceRef]
AS
SELECT StateProvinceRef.CountryCode,StateProvinceRef.ChapterGroupKey,StateProvinceRef.IsActive,StateProvinceRef.IsHandModified,StateProvinceRef.UpdatedByUserKey,StateProvinceRef.UpdatedOn,StateProvinceRef.StateProvinceCode AS Code,StateProvinceRef.StateProvinceDesc AS Description
  FROM StateProvinceRef
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
CREATE VIEW [dbo].[vBoStoreFeaturedProducts]
AS
SELECT vStoreFeaturedProducts.Description,vStoreFeaturedProducts.IsSuperProduct,vStoreFeaturedProducts.OrderProductID,vStoreFeaturedProducts.ProductCode,vStoreFeaturedProducts.SellOnWeb,vStoreFeaturedProducts.Title
  FROM vStoreFeaturedProducts
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
CREATE VIEW [dbo].[vBoSuffixRef]
AS
SELECT SuffixRef.SuffixCode AS Code,SuffixRef.SuffixDesc AS Description,SuffixRef.SyncSuffixCode,SuffixRef.SuffixKey
  FROM SuffixRef
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
CREATE VIEW [dbo].[vBoSupplement]
AS
SELECT SupplementMain.Description,SupplementMain.Name,SupplementMain.UpdatedByUserKey,SupplementMain.UpdatedOn,SupplementMain.SupplementStatusCode,SupplementMain.Cost,SupplementMain.CostCollection,SupplementMain.CreatedByUserKey,SupplementMain.CreatedOn,SupplementMain.SupplementKey,SupplementMain.SystemEntityKey,SupplementMain.NotificationGroupKey,SupplementMain.SupplementTypeKey,SupplementMain.DocumentVersionKey,SupplementMain.AccessKey
  FROM SupplementMain
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
CREATE VIEW [dbo].[vBoSupplementStatusRef]
AS
SELECT SupplementStatusRef.SupplementStatusCode,SupplementStatusRef.SupplementStatusDesc,SupplementStatusRef.SupplementStatusName
  FROM SupplementStatusRef
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
CREATE VIEW [dbo].[vBoSupplementTypeRef]
AS
SELECT SupplementTypeRef.SupplementTypeDesc AS Description,SupplementTypeRef.SupplementTypeKey,SupplementTypeRef.IsEnclosure
  FROM SupplementTypeRef
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
CREATE VIEW [dbo].[vBoSystemConfigParameterValue]
AS
SELECT SystemConfig.ParameterName,SystemConfig.ParameterValue,SystemConfig.Description,SystemConfig.CreatedByUserKey,SystemConfig.CreatedOn,SystemConfig.OrganizationKey,SystemConfig.SystemConfigKey AS SystemParamKey,SystemConfig.SystemEntityKey,SystemConfig.UpdatedByUserKey,SystemConfig.UpdatedOn,vSystemConfigParameterDefinition.AllowMultiSelectFlag,vSystemConfigParameterDefinition.DataTypeCode,vSystemConfigParameterDefinition.DefaultParameterValue,vSystemConfigParameterDefinition.Description AS Description_1,vSystemConfigParameterDefinition.DisplayMask,vSystemConfigParameterDefinition.HIControlHeight,vSystemConfigParameterDefinition.HIControlRepeatColumns,vSystemConfigParameterDefinition.HIControlRepeatDirection,vSystemConfigParameterDefinition.HIControlTypeCode,vSystemConfigParameterDefinition.HIControlWidth,vSystemConfigParameterDefinition.Label,vSystemConfigParameterDefinition.MaxLength,vSystemConfigParameterDefinition.OrganizationKey AS OrganizationKey_1,vSystemConfigParameterDefinition.ParameterName AS ParameterName_1,vSystemConfigParameterDefinition.PropertyDefinitionKey,vSystemConfigParameterDefinition.Scale,vSystemConfigParameterDefinition.SystemConfigPageDesc,vSystemConfigParameterDefinition.SystemConfigPageKey,vSystemConfigParameterDefinition.SystemConfigPageName,vSystemConfigParameterDefinition.SystemEntityKey AS SystemEntityKey_1,vSystemConfigParameterDefinition.SystemKeyword,vSystemConfigParameterDefinition.ValueList,vSystemConfigParameterDefinition.ValueListQueryDisplayColumn,vSystemConfigParameterDefinition.ValueListQueryDocumentVersionKey,vSystemConfigParameterDefinition.ValueListQueryFolder,vSystemConfigParameterDefinition.ValueListQueryPersistColumn,vSystemConfigParameterDefinition.IsDefault,vSystemConfigParameterDefinition.SortOrder,vSystemConfigParameterDefinition.IsRequired
  FROM vSystemConfigParameterDefinition
	INNER JOIN SystemConfig
		ON vSystemConfigParameterDefinition.SystemEntityKey = SystemConfig.SystemEntityKey
		AND vSystemConfigParameterDefinition.ParameterName = SystemConfig.ParameterName
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoSystemConfigXml]'))
    DROP VIEW [dbo].[vBoSystemConfigXml]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoSystemConfigXml]
AS
SELECT SystemConfigXml.SystemConfigXmlCode,SystemConfigXml.ConfigValue
  FROM SystemConfigXml
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
CREATE VIEW [dbo].[vBoSystemEntity]
AS
SELECT SystemEntity.Description,SystemEntity.IsActive,SystemEntity.IsDefault,SystemEntity.Name,SystemEntity.SystemKeyword,SystemEntity.UpdatedByUserKey,SystemEntity.UpdatedOn,SystemEntity.ApplicationAccessKey,SystemEntity.AccessKey,SystemEntity.CreatedByUserKey,SystemEntity.CreatedOn,SystemEntity.OrganizationKey,SystemEntity.SystemEntityKey
  FROM SystemEntity
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
CREATE VIEW [dbo].[vBoSystemParam]
AS
SELECT SystemConfig.ParameterName,SystemConfig.ParameterValue,SystemConfig.Description,SystemConfig.CreatedByUserKey,SystemConfig.CreatedOn,SystemConfig.OrganizationKey,SystemConfig.SystemConfigKey AS SystemParamKey,SystemConfig.SystemEntityKey,SystemConfig.UpdatedByUserKey,SystemConfig.UpdatedOn
  FROM SystemConfig
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
CREATE VIEW [dbo].[vBoTag]
AS
SELECT Tag.AccessKey,Tag.AssignAccessKey,Tag.CreatedByUserKey,Tag.CreatedOn,Tag.TagDescription AS Description,Tag.TagKey,Tag.TagName AS Name,Tag.UpdatedByUserKey,Tag.UpdatedOn,Tag.IsCategory,Tag.TagAliasList
  FROM Tag
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
CREATE VIEW [dbo].[vBoTagHierarchy]
AS
SELECT Hierarchy.Depth,Hierarchy.HierarchyCode,Hierarchy.HierarchyKey,Hierarchy.IsChildAMemberOfParent,Hierarchy.ParentHierarchyKey,Hierarchy.RootHierarchyKey,Hierarchy.SortOrder,Hierarchy.UniformKey,Hierarchy.UniformType,Tag.AccessKey,Tag.AssignAccessKey,Tag.TagKey,Tag.TagName,Tag.CreatedByUserKey,Tag.CreatedOn,Tag.TagDescription,Tag.UpdatedByUserKey,Tag.UpdatedOn,Tag.IsCategory,Tag.TagAliasList
  FROM Hierarchy
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
CREATE VIEW [dbo].[vBoTagRelatedName]
AS
SELECT TagRelatedName.RelatedName,TagRelatedName.TagKey,TagRelatedName.TagRelationshipTypeCode
  FROM TagRelatedName
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
CREATE VIEW [dbo].[vBoTagRelationship]
AS
SELECT TagRelationship.SubjectTagKey,TagRelationship.TagRelationshipKey,TagRelationship.TagRelationshipTypeCode,TagRelationship.TargetTagKey
  FROM TagRelationship
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
CREATE VIEW [dbo].[vBoTagRelationshipType]
AS
SELECT TagRelationshipTypeRef.TagRelationshipTypeDesc AS Description,TagRelationshipTypeRef.TagRelationshipTypeName AS Name,TagRelationshipTypeRef.ReciprocalTagRelationshipTypeCode AS ReciprocalCode,TagRelationshipTypeRef.TagRelationshipTypeCode AS Code
  FROM TagRelationshipTypeRef
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
CREATE VIEW [dbo].[vBoTask]
AS
SELECT TaskMain.AccessKey,TaskMain.Comments,TaskMain.CreatedByUserKey,TaskMain.CreatedOn,TaskMain.Subject,TaskMain.TaskKey,TaskMain.TaskStatusCode,TaskMain.TaskStatusDate AS StatusDate,TaskMain.TaskTypeCode,TaskMain.UpdatedByUserKey,TaskMain.UpdatedOn,TaskMain.WorkflowInstanceKey,TaskMain.AssigneeKey,TaskMain.AssigneeGroupKey,TaskMain.AssigneeUserKey,TaskMain.CompletedByUserKey,TaskMain.CompletedOn,TaskMain.DueDate,TaskMain.StartDate,TaskMain.TaskPriorityCode
  FROM TaskMain
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
CREATE VIEW [dbo].[vBoTaskItem]
AS
SELECT TaskItem.Category,TaskItem.CompletedByUserKey,TaskItem.CompletedOn,TaskItem.DueDate,TaskItem.Priority,TaskItem.StartDate,TaskItem.StatusDate,TaskItem.Subject,TaskItem.UpdatedByUserKey,TaskItem.UpdatedOn,TaskItem.Comment,TaskItem.IsGroupTask,TaskItem.AssignedToKey,TaskItem.TaskItemStatusCode,TaskItem.NotifyCreatorCode,TaskItem.AccessKey,TaskItem.CreatedByUserKey,TaskItem.CreatedOn,TaskItem.TaskItemKey,TaskItem.OpportunityKey
  FROM TaskItem
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
CREATE VIEW [dbo].[vBoTaskItemStatusRef]
AS
SELECT TaskItemStatusRef.TaskItemStatusDesc,TaskItemStatusRef.TaskItemStatusName,TaskItemStatusRef.TaskItemStatusCode
  FROM TaskItemStatusRef
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
CREATE VIEW [dbo].[vBoTaskNotifyCreatorRef]
AS
SELECT TaskNotifyCreatorRef.TaskNotifyCreatorCode,TaskNotifyCreatorRef.TaskNotifyCreatorDesc,TaskNotifyCreatorRef.TaskNotifyCreatorName
  FROM TaskNotifyCreatorRef
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
CREATE VIEW [dbo].[vBoTaskPriority]
AS
SELECT TaskPriorityRef.TaskPriorityCode,TaskPriorityRef.TaskPriorityDesc,TaskPriorityRef.TaskPriorityName
  FROM TaskPriorityRef
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
CREATE VIEW [dbo].[vBoTaskStatus]
AS
SELECT TaskStatusRef.TaskStatusCode AS Code,TaskStatusRef.TaskStatusName AS Name,TaskStatusRef.TaskStatusDesc AS Description,TaskStatusRef.IsComplete
  FROM TaskStatusRef
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
CREATE VIEW [dbo].[vBoTaskType]
AS
SELECT TaskTypeRef.TaskTypeCode AS Code,TaskTypeRef.TaskTypeName AS Name,TaskTypeRef.TaskTypeDesc AS Description
  FROM TaskTypeRef
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
CREATE VIEW [dbo].[vBoTaxAuthorityCategory]
AS
SELECT TaxAuthorityCategory.TaxAuthorityCategoryKey,TaxAuthorityCategory.TaxAuthorityKey,TaxAuthorityCategory.TaxCategoryKey,TaxAuthorityCategory.TaxRate,TaxAuthorityCategory.UpdatedByUserKey,TaxAuthorityCategory.UpdatedOn,TaxAuthorityCategory.MaxAmount,TaxAuthorityCategory.TaxRate2,TaxAuthorityCategory.QualifiesForExemptionFlag,TaxAuthorityCategory.EndDate,TaxAuthorityCategory.StartDate,TaxAuthorityCategory.CreatedByUserKey,TaxAuthorityCategory.CreatedOn,TaxAuthorityCategory.CombineRatesFlag,TaxAuthorityCategory.IsExemptFromIncludedTax,TaxAuthorityCategory.IsTaxInclusive,TaxAuthorityCategory.IsPerItem
  FROM TaxAuthorityCategory
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
CREATE VIEW [dbo].[vBoTaxAuthorityFinancialEntity]
AS
SELECT TaxAuthorityFinancialEntity.CreatedByUserKey,TaxAuthorityFinancialEntity.CreatedOn,TaxAuthorityFinancialEntity.FinancialEntityKey,TaxAuthorityFinancialEntity.TaxAuthorityFinancialEntityKey,TaxAuthorityFinancialEntity.TaxAuthorityKey,TaxAuthorityFinancialEntity.UpdatedByUserKey,TaxAuthorityFinancialEntity.UpdatedOn,TaxAuthorityFinancialEntity.TaxLiabilityGLAccountKey,TaxAuthorityFinancialEntity.TaxRegistrationID
  FROM TaxAuthorityFinancialEntity
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
CREATE VIEW [dbo].[vBoTaxAuthorityLevelRef]
AS
SELECT TaxAuthorityLevelRef.TaxAuthorityLevelDesc AS Description,TaxAuthorityLevelRef.TaxAuthorityLevelCode AS Code,TaxAuthorityLevelRef.TaxAuthorityLevelKey
  FROM TaxAuthorityLevelRef
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
CREATE VIEW [dbo].[vBoTaxScheduleAuthority]
AS
SELECT TaxScheduleAuthority.TaxAuthorityKey,TaxScheduleAuthority.TaxScheduleAuthorityKey,TaxScheduleAuthority.TaxScheduleKey,TaxScheduleAuthority.UpdatedByUserKey,TaxScheduleAuthority.UpdatedOn,TaxScheduleAuthority.CreatedByUserKey,TaxScheduleAuthority.CreatedOn,TaxScheduleAuthority.IsTaxable
  FROM TaxScheduleAuthority
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
CREATE VIEW [dbo].[vBoTimeZoneRef]
AS
SELECT TimeZoneRef.GMTOffsetMinutes,TimeZoneRef.IsActive,TimeZoneRef.IsDaylightSaving,TimeZoneRef.IsHandModified,TimeZoneRef.TimeZoneDesc AS Description,TimeZoneRef.TimeZoneKey,TimeZoneRef.UpdatedByUserKey,TimeZoneRef.UpdatedOn
  FROM TimeZoneRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vTransactionDetail]'))
    DROP VIEW [dbo].[vTransactionDetail]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE VIEW [dbo].[vTransactionDetail]
AS
SELECT t.[BATCH_NUM] AS [BATCH_NUM],
       t.[TRANS_NUMBER] AS [TRANS_NUMBER],
       t.[LINE_NUMBER] AS [LINE_NUMBER],
       t.[SUB_LINE_NUMBER] AS [SUB_LINE_NUMBER],
       t.[TRANSACTION_DATE] AS [TRANSACTION_DATE],
       t.[JOURNAL_TYPE] AS [JOURNAL_TYPE],
       t.[TRANSACTION_TYPE] AS [TRANSACTION_TYPE],
       t.[BT_ID] AS [BT_ID],
       t.[ST_ID] AS [ST_ID],
       CASE 
         WHEN n.[COMPANY_RECORD]=1 THEN n.[COMPANY]
         ELSE n.[FULL_NAME]
       END AS [SHIP_TO_CUSTOMER_NAME],
       t.[PRODUCT_CODE] AS [PRODUCT_CODE],
       t.[DESCRIPTION] AS [DESCRIPTION],
       t.[AMOUNT] AS [AMOUNT],
       t.[ADJUSTMENT_AMOUNT] AS [ADJUSTMENT_AMOUNT],
       t.[INVOICE_CHARGES] AS [INVOICE_CHARGES],
       t.[INVOICE_CREDITS] AS [INVOICE_CREDITS],
       t.[QUANTITY] AS [QUANTITY],
       t.[UNIT_PRICE] AS [UNIT_PRICE],
       t.[INVOICE_REFERENCE_NUM] AS [INVOICE_REFERENCE_NUM],
       t.[REFERENCE_1] AS [REFERENCE_1],
       t.[OWNER_ORG_CODE] AS [OWNER_ORG_CODE],
       t.[GL_ACCT_ORG_CODE] AS [GL_ACCT_ORG_CODE],
       t.[GL_ACCOUNT] AS [GL_ACCOUNT],
       gt.[DESCRIPTION] AS [GL_ACCOUNT_NAME],
       t.[DEFERRED_GL_ACCOUNT] AS [DEFERRED_GL_ACCOUNT],
       t.[PSEUDO_ACCOUNT] AS [PSEUDO_ACCOUNT],
       t.[SOURCE_CODE] AS [SOURCE_CODE],
       t.[EFFECTIVE_DATE] AS [EFFECTIVE_DATE],
       t.[PAID_THRU] AS [PAID_THRU],
       t.[MONTHS_PAID] AS [MONTHS_PAID],
       t.[ACTIVITY_SEQN] AS [ACTIVITY_SEQN]
  FROM [dbo].[Trans] t
       LEFT OUTER JOIN [dbo].[Name] n on t.[ST_ID]=n.[ID]
       LEFT OUTER JOIN [dbo].[Gen_Tables] gt on t.[GL_ACCOUNT]=gt.[CODE] AND gt.[TABLE_NAME]='GL_ACCOUNT'
       WHERE (t.[AMOUNT] <> 0 OR t.[ADJUSTMENT_AMOUNT] <> 0 OR t.[PAID_THRU] IS NOT NULL);



GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoTransactionDetail]'))
    DROP VIEW [dbo].[vBoTransactionDetail]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoTransactionDetail]
AS
SELECT vTransactionDetail.ACTIVITY_SEQN,vTransactionDetail.ADJUSTMENT_AMOUNT,vTransactionDetail.AMOUNT,vTransactionDetail.BATCH_NUM,vTransactionDetail.DESCRIPTION,vTransactionDetail.EFFECTIVE_DATE,vTransactionDetail.GL_ACCOUNT,vTransactionDetail.GL_ACCOUNT_NAME,vTransactionDetail.GL_ACCT_ORG_CODE,vTransactionDetail.INVOICE_CHARGES,vTransactionDetail.INVOICE_CREDITS,vTransactionDetail.INVOICE_REFERENCE_NUM,vTransactionDetail.LINE_NUMBER,vTransactionDetail.MONTHS_PAID,vTransactionDetail.OWNER_ORG_CODE,vTransactionDetail.PAID_THRU,vTransactionDetail.PRODUCT_CODE,vTransactionDetail.QUANTITY,vTransactionDetail.REFERENCE_1,vTransactionDetail.SHIP_TO_CUSTOMER_NAME,vTransactionDetail.ST_ID,vTransactionDetail.SUB_LINE_NUMBER,vTransactionDetail.TRANS_NUMBER,vTransactionDetail.TRANSACTION_TYPE,vTransactionDetail.UNIT_PRICE,vTransactionDetail.BT_ID,vTransactionDetail.DEFERRED_GL_ACCOUNT,vTransactionDetail.JOURNAL_TYPE,vTransactionDetail.PSEUDO_ACCOUNT,vTransactionDetail.SOURCE_CODE,vTransactionDetail.TRANSACTION_DATE
  FROM vTransactionDetail
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vTransactionSummary]'))
    DROP VIEW [dbo].[vTransactionSummary]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE VIEW  [dbo].[vTransactionSummary] AS
WITH TransSummary 
AS (
-- Provide a summary result for each set of Trans rows that have the same TRANS_NUMBER.
-- WARNING:  This view has numerous subqueries, and will therefore have very poor performance
-- in a SELECT with no filter on, for example, TRANS_NUMBER or BATCH_NUM (which is the original
-- intended usage of this view)
SELECT tr.[TRANS_NUMBER],
       tr.[TRANSACTION_DATE],
       tr.[BATCH_NUM],
       tr.[BT_ID],
       CASE
         -- k.   Refund request - inserted this 9/22/2014
         WHEN tr.[JOURNAL_TYPE] = 'REF' THEN 'Refund Request'
         -- a.   Payment - if at least 1 row's TRANSACTION_TYPE = 'PAY' and CHECK_NUMBER position 1 <> '*'
         WHEN [dbo].[asi_HasTransType](tr.[TRANS_NUMBER], 'PAY', 0)=1 THEN 'Payment'
         -- b.   Application of Open Credit - if at least 1 row's TRANSACTION_TYPE = 'PAY' and CHECK_NUMBER position 1 = '*'
         WHEN [dbo].[asi_HasTransType](tr.[TRANS_NUMBER], 'PAY', 1)=1 THEN 'Application of Open Credit'
         -- c.   Application of Prepayment - if there is no PAY row and the journal type is DM and at least one row has a TRANSACTION_TYPE of 'PP'.
         WHEN [dbo].[asi_HasTransType](tr.[TRANS_NUMBER], 'PAY', NULL)=0 AND tr.[JOURNAL_TYPE]='DM' AND [dbo].[asi_HasTransType](tr.[TRANS_NUMBER], 'PP', NULL) = 1 THEN 'Application of Prepayment'
         -- d.   Inventory - if there is no PAY row, no AR row if BT_ID is blank and the SOURCE_SYSTEM in ('PRODUCT','ORDER'). - simplified, no need to test for no 'Pay' on 9/22/2014
         WHEN tr.BT_ID = '' AND tr.[SOURCE_SYSTEM] IN ('PRODUCT','ORDER') THEN 'Inventory'
         -- f.   Pledge - If there is no Pay row and the Journal Type is IN and the SOURCE_SYSTEM is FR - simplified, no need to test for no 'Pay' on 9/22/2014
         WHEN tr.[JOURNAL_TYPE]='IN' AND tr.[SOURCE_SYSTEM]='FR' THEN 'Pledge'
         -- g.   Invoice - If there is no PAY row and the Journal Type is IN and the SOURCE_SYSTEM <> FR. - simplified, no need to test for no 'Pay' on 9/22/2014
         --      (ELR) Also included Cash Dues Transactions that are converted to accrual invoices
         WHEN ((tr.[JOURNAL_TYPE]='IN' AND tr.[SOURCE_SYSTEM]<>'FR')OR(tr.[SOURCE_SYSTEM]='DUES' AND tr.[JOURNAL_TYPE]='PAY' AND tr.[INVOICE_REFERENCE_NUM] <> 0)) THEN 'Invoice'
         -- h.   Credit Memo - If there is no PAY row and the journal type is CM. - simplified, no need to test for no 'Pay' on 9/22/2014
         WHEN tr.[JOURNAL_TYPE]='CM' THEN 'Credit Memo'
         -- i.   Debit Memo - if there is no PAY row and no PP row and the journal type is DM. - simplified, no need to test for no 'Pay' or "PP" rows on 9/22/2014
         WHEN tr.[JOURNAL_TYPE]='DM' THEN 'Debit Memo'
         -- l.   Other - if none of the above conditions are met. - simplified, removed "Unknown" and made "Other" the Catch All 9/22/2014
         ELSE 'Other'
       END AS [CATEGORY],
       (SELECT TOP 1 t.[DESCRIPTION] 
          FROM dbo.Trans t 
         WHERE t.[TRANS_NUMBER]=tr.[TRANS_NUMBER] 
      ORDER BY t.[LINE_NUMBER], t.[SUB_LINE_NUMBER]) 
            AS [DESCRIPTION],
        (SELECT TOP 1 t.[DATE_ENTERED] 
          FROM dbo.Trans t 
         WHERE t.[TRANS_NUMBER]=tr.[TRANS_NUMBER] 
      ORDER BY t.[LINE_NUMBER], t.[SUB_LINE_NUMBER]) 
            AS [DATE_ENTERED],
       tr.ENTERED_BY,
       (SELECT COUNT(t.[TRANS_NUMBER]) 
          FROM dbo.Trans t 
         WHERE t.[TRANS_NUMBER]=tr.[TRANS_NUMBER]
         and (t.[AMOUNT] <> 0 OR t.[ADJUSTMENT_AMOUNT] <> 0 OR t.PAID_THRU IS Not NULL))
            AS [LINE_COUNT],
       tr.[JOURNAL_TYPE],
       tr.[SOURCE_SYSTEM],
       -- tr.SOURCE_CODE,    Changed to return only the first source code - AS OF 9/22/2014
        (SELECT TOP 1 t.[SOURCE_CODE] 
          FROM dbo.Trans t 
         WHERE t.[TRANS_NUMBER]=tr.[TRANS_NUMBER] 
      ORDER BY t.[LINE_NUMBER], t.[SUB_LINE_NUMBER]) 
            AS [SOURCE_CODE],
       (SELECT TOP 1 t.[CHECK_NUMBER] 
          FROM [dbo].[Trans] t 
         WHERE t.[TRANS_NUMBER]=tr.[TRANS_NUMBER] 
               AND t.[TRANSACTION_TYPE]='PAY' 
      ORDER BY t.[LINE_NUMBER], t.[SUB_LINE_NUMBER]) 
            AS [CHECK_NUMBER],
       (SELECT TOP 1 t.CC_NUMBER    
          FROM dbo.Trans t 
         WHERE t.[TRANS_NUMBER]=tr.[TRANS_NUMBER] 
               AND t.[TRANSACTION_TYPE]='PAY' 
      ORDER BY t.[LINE_NUMBER], t.[SUB_LINE_NUMBER]) 
            AS [CC_NUMBER],
                -- ELR - Added CC_NAME so it can be printed on the detail Batch Report
       (SELECT TOP 1 t.CC_NAME    
          FROM dbo.Trans t 
         WHERE t.[TRANS_NUMBER]=tr.[TRANS_NUMBER] 
               AND t.[TRANSACTION_TYPE]='PAY' 
      ORDER BY t.[LINE_NUMBER], t.[SUB_LINE_NUMBER]) 
            AS [CC_NAME],
       (SELECT TOP 1 t.CC_AUTHORIZE 
          FROM dbo.Trans t 
         WHERE t.[TRANS_NUMBER]=tr.[TRANS_NUMBER] 
               AND t.[TRANSACTION_TYPE]='PAY' 
      ORDER BY t.[LINE_NUMBER], t.[SUB_LINE_NUMBER]) 
            AS [CC_AUTHORIZE],
       (SELECT TOP 1 t.GATEWAY_REF  
          FROM dbo.Trans t 
         WHERE t.[TRANS_NUMBER]=tr.[TRANS_NUMBER] 
               AND t.[TRANSACTION_TYPE]='PAY' 
      ORDER BY t.[LINE_NUMBER], t.[SUB_LINE_NUMBER]) 
            AS [GATEWAY_REF],
       tr.[GL_ACCOUNT],
       tr.[GL_ACCT_ORG_CODE],
       tr.[OWNER_ORG_CODE],
       CASE
         -- Don't return null unless there is not a PAY row for this transaction that matches CASH_ACCOUNT_CODE
         WHEN ca.[ACCOUNT_TYPE] IS NULL 
           THEN (SELECT TOP 1 ca2.[ACCOUNT_TYPE] 
                   FROM dbo.Trans t 
                        INNER JOIN [dbo].[Cash_Accounts] ca2 ON t.[CHECK_NUMBER]=ca2.[CASH_ACCOUNT_CODE] 
                  WHERE t.[TRANS_NUMBER]=tr.[TRANS_NUMBER] AND t.[TRANSACTION_TYPE]='PAY' 
               ORDER BY t.[LINE_NUMBER], t.[SUB_LINE_NUMBER])
         ELSE ca.[ACCOUNT_TYPE]
       END AS [CASH_ACCOUNT_TYPE],
        -- Populate invoice reference num except for a cash receipts transaction
       CASE
         WHEN tr.[JOURNAL_TYPE] = 'PAY' and tr.[SOURCE_SYSTEM] <> 'DUES'
            THEN 0
         ELSE 
            (SELECT TOP 1 t.[INVOICE_REFERENCE_NUM] 
              FROM dbo.Trans t 
              WHERE t.[TRANS_NUMBER]=tr.[TRANS_NUMBER] 
             ORDER BY t.[LINE_NUMBER], t.[SUB_LINE_NUMBER])            
        END AS [INVOICE_REFERENCE_NUM],
        -- ELR - ADDED CUSTOMER_REFERENCE SO THAT WE HAVE ACCESS TO THE PURCHASE ORDER NUMBER
       tr.[CUSTOMER_REFERENCE],
       tr.[FISCAL_PERIOD],
       tr.[POSTED]
  FROM [dbo].[Trans] tr
       LEFT OUTER JOIN [dbo].[Cash_Accounts] ca ON tr.[CHECK_NUMBER] = ca.[CASH_ACCOUNT_CODE]
) -- end CTE
SELECT DISTINCT
       ts.[TRANS_NUMBER],
       ts.[TRANSACTION_DATE],
       ts.[BATCH_NUM],
       ts.[BT_ID],
       CASE 
         WHEN n.[COMPANY_RECORD]=1 THEN n.[COMPANY]
         ELSE 
           CASE
             WHEN n.[COMPANY] <> '' AND n.[COMPANY] IS NOT NULL THEN n.[FULL_NAME] + ', ' + n.[COMPANY]
             ELSE n.[FULL_NAME]
           END
       END AS [CUSTOMER],
       n.[MAJOR_KEY],
       CASE 
         WHEN n.[COMPANY_RECORD]=1 THEN n.[COMPANY_SORT]
         ELSE n.[LAST_FIRST]
       END AS [SORT_NAME],
       ts.[CATEGORY],
       CASE
         WHEN ts.[CATEGORY] IN ('Payment','Application of Open Credit') THEN 
           (SELECT TOP 1 [Trans].[GL_ACCT_ORG_CODE]
              FROM dbo.Trans 
             WHERE [Trans].[TRANS_NUMBER]=ts.[TRANS_NUMBER] AND [Trans].[TRANSACTION_TYPE]='PAY')
         WHEN (i.[IS_MULTI_ORG] = 0 or ts.[POSTED] < 2 or ts.[INVOICE_REFERENCE_NUM] = 0) THEN ts.[OWNER_ORG_CODE]
         ELSE 'VARIOUS'
       END AS [FINANCIAL_ENTITY],
       CASE
         WHEN ts.[CATEGORY] = 'Payment' THEN
           CASE
             WHEN ts.[CASH_ACCOUNT_TYPE] IS NULL THEN 'Check'
             WHEN ts.[CASH_ACCOUNT_TYPE] = 1 THEN 'Credit Card'
             WHEN ts.[CASH_ACCOUNT_TYPE] = 2 THEN 'In Kind'
             WHEN ts.[CASH_ACCOUNT_TYPE] = 3 THEN 'Debit Card'
             WHEN ts.[CASH_ACCOUNT_TYPE] = 4 THEN 'Service'
             ELSE 'Cash'
           END
         ELSE ''
       END AS [PAYMENT_CATEGORY],
       CASE
         WHEN ts.[CATEGORY] = 'Payment' THEN
           CASE
             WHEN ts.[CASH_ACCOUNT_TYPE] IS NULL THEN 'Check'
             ELSE ts.[CHECK_NUMBER]
           END
         ELSE ''
       END AS [PAYMENT_METHOD],
       CASE
         WHEN ts.[CATEGORY] = 'Payment' THEN
           CASE
             WHEN ts.[CASH_ACCOUNT_TYPE] IS NULL THEN 'Check ' + ts.[CHECK_NUMBER]
             WHEN ts.[CASH_ACCOUNT_TYPE] = 1 THEN
             CASE
               WHEN ts.[CC_NUMBER] <> '' AND ts.[CC_NUMBER] IS NOT NULL THEN ts.[CHECK_NUMBER] + ' ending in ' + SUBSTRING(ts.[CC_NUMBER], LEN(ts.[CC_NUMBER])-3, 4)
               ELSE ts.[CHECK_NUMBER]
             END
             ELSE ts.[CHECK_NUMBER]
           END
         WHEN ts.[CATEGORY] = 'Application of Open Credit' THEN 'Transfer of Open Credit from Ref# ' + SUBSTRING(ts.[CHECK_NUMBER], 2, LEN(ts.[CHECK_NUMBER])-1)
         WHEN ts.[CATEGORY] = 'Pledge' THEN 'Pledge Transaction'
         WHEN ts.[CATEGORY] = 'Inventory' THEN 'Inventory Transaction'
         WHEN ts.[CATEGORY] = 'Other' THEN 'Other Transaction' 
         ELSE ts.[DESCRIPTION]
       END AS [SUMMARY_DESCRIPTION],
       COALESCE((CASE
         WHEN ts.[CATEGORY] IN ('Payment', 'Application of Open Credit') THEN
           (SELECT SUM(t.[AMOUNT]) 
              FROM dbo.Trans t 
             WHERE t.[TRANS_NUMBER]=ts.[TRANS_NUMBER] AND t.[TRANSACTION_TYPE]='PAY')
         WHEN ts.[CATEGORY] = 'Application of Prepayment' THEN 
           (SELECT TOP 1 t.[AMOUNT] 
              FROM [dbo].[Trans] t 
             WHERE t.[TRANS_NUMBER]=ts.[TRANS_NUMBER] AND t.[TRANSACTION_TYPE]='PP' 
          ORDER BY t.[LINE_NUMBER], t.[SUB_LINE_NUMBER])
         WHEN ts.[CATEGORY] IN ('Pledge', 'Invoice', 'Credit Memo', 'Debit Memo') THEN 
           (SELECT SUM(t.[AMOUNT]) 
              FROM [dbo].[Trans] t 
             WHERE t.[TRANS_NUMBER]=ts.[TRANS_NUMBER] AND t.[TRANSACTION_TYPE]<>'DIST')
         WHEN ts.[CATEGORY] IN ('Inventory', 'Other','Refund Request') THEN 
           (SELECT SUM(t.[AMOUNT]) 
              FROM [dbo].[Trans] t 
             WHERE t.[TRANS_NUMBER]=ts.[TRANS_NUMBER] AND t.[AMOUNT]>=0) 
         ELSE 0 
       END), 0)  AS [SUMMARY_AMOUNT],
       ts.[DATE_ENTERED],
       ts.[LINE_COUNT],
       ts.[ENTERED_BY],
       ts.[JOURNAL_TYPE],
       ts.[SOURCE_SYSTEM],
       ts.[SOURCE_CODE],
       ts.[CHECK_NUMBER],
       ts.[CC_NUMBER],
       ts.[CC_NAME],
       ts.[CC_AUTHORIZE],
       ts.[GATEWAY_REF],
       -- Faster to move the following to the CTE?
       CASE
         WHEN ts.[CATEGORY] = 'Payment' THEN 
           (SELECT TOP 1 t.GL_ACCOUNT 
              FROM dbo.Trans t 
             WHERE t.[TRANS_NUMBER]=ts.[TRANS_NUMBER] AND t.[TRANSACTION_TYPE]='PAY' 
          ORDER BY t.[LINE_NUMBER], t.[SUB_LINE_NUMBER])
         ELSE ''
       END AS [CASH_GL_ACCOUNT],
       -- 25. Invoice Reference Num - Value of [Trans].INVOICE_REFERENCE_NUM
        ts.[INVOICE_REFERENCE_NUM],
         -- 26. Invoice Number - Value of Invoice.INVOICE_NUM where [Trans].INVOICE_REFERENCE_NUM = Invoice.REFERENCE_NUM.  (NOTE:  This would not be populated if a) Invoice Reference Num is zero or b) the Invoice does not exist)
       -- Populate Invoice Num if INVOICE_REFERENCE_NUM is non-zero
       CASE 
         WHEN (ts.[INVOICE_REFERENCE_NUM] <> 0 AND ts.[POSTED] >= 2)THEN i.[INVOICE_NUM]
         ELSE 0
       END
       AS [INVOICE_NUM],
        -- 27. Originating Trans Num - Value of Invoice.ORIGINATING_TRANS_NUM (NOTE:  This would not be populated if a) Invoice Reference Num is zero or b) the Invoice does not exist)
       CASE 
         WHEN (ts.[INVOICE_REFERENCE_NUM] <> 0 AND ts.[POSTED] >= 2) THEN i.[ORIGINATING_TRANS_NUM]
         ELSE 0
       END AS [ORIGINATING_TRANS_NUM],
        -- ELR - ADDED CUSTOMER_REFERENCE SO THAT WE HAVE ACCESS TO THE PURCHASE ORDER NUMBER
       ts.[CUSTOMER_REFERENCE],
       ts.[FISCAL_PERIOD],
       ts.[POSTED]
FROM TransSummary ts
      LEFT OUTER JOIN [dbo].[Name] n ON ts.[BT_ID]=n.[ID]
      LEFT OUTER JOIN [dbo].[Invoice] i ON ts.[INVOICE_REFERENCE_NUM]=i.[REFERENCE_NUM]
      WHERE ts.[LINE_COUNT] > 0;



GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoTransactionSummary]'))
    DROP VIEW [dbo].[vBoTransactionSummary]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoTransactionSummary]
AS
SELECT vTransactionSummary.BATCH_NUM,vTransactionSummary.BT_ID,vTransactionSummary.CASH_GL_ACCOUNT,vTransactionSummary.CATEGORY,vTransactionSummary.CC_AUTHORIZE,vTransactionSummary.CC_NUMBER,vTransactionSummary.CHECK_NUMBER,vTransactionSummary.CUSTOMER,vTransactionSummary.DATE_ENTERED,vTransactionSummary.ENTERED_BY,vTransactionSummary.FINANCIAL_ENTITY,vTransactionSummary.FISCAL_PERIOD,vTransactionSummary.GATEWAY_REF,vTransactionSummary.INVOICE_NUM,vTransactionSummary.JOURNAL_TYPE,vTransactionSummary.MAJOR_KEY,vTransactionSummary.ORIGINATING_TRANS_NUM,vTransactionSummary.PAYMENT_CATEGORY,vTransactionSummary.PAYMENT_METHOD,vTransactionSummary.POSTED,vTransactionSummary.SORT_NAME,vTransactionSummary.SOURCE_SYSTEM,vTransactionSummary.SUMMARY_AMOUNT,vTransactionSummary.SUMMARY_DESCRIPTION,vTransactionSummary.TRANS_NUMBER,vTransactionSummary.TRANSACTION_DATE,vTransactionSummary.CC_NAME,vTransactionSummary.INVOICE_REFERENCE_NUM,vTransactionSummary.LINE_COUNT,vTransactionSummary.SOURCE_CODE,vTransactionSummary.CUSTOMER_REFERENCE
  FROM vTransactionSummary
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
CREATE VIEW [dbo].[vBoUniformLink]
AS
SELECT UniformLink.SubjectUniformKey,UniformLink.SystemEntityKey,UniformLink.TargetUniformKey,UniformLink.UniformLinkKey
  FROM UniformLink
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
CREATE VIEW [dbo].[vBoUniformRegistry]
AS
SELECT UniformRegistry.ComponentKey,UniformRegistry.UniformKey
  FROM UniformRegistry
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
CREATE VIEW [dbo].[vBoUniformTag]
AS
SELECT UniformTag.CreatedByUserKey,UniformTag.CreatedOn,UniformTag.TagKey,UniformTag.UniformKey,UniformTag.IsPrimary
  FROM UniformTag
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
CREATE VIEW [dbo].[vBoUnofferedCustomerExperience]
AS
SELECT CustomerExperience.CustomerExperienceKey,CustomerExperience.CustomerExperienceNote AS Note,CustomerExperience.CustomerExperienceStatusCode,CustomerExperience.CreatedByUserKey,CustomerExperience.CreatedOn,CustomerExperience.ContactKey,UnofferedCustomerExperience.ExperienceDefinitionKey,UnofferedCustomerExperience.UnofferedCustomerExperienceGrade AS Grade,UnofferedCustomerExperience.UnofferedCustomerExperienceKey,UnofferedCustomerExperience.CompletionDate AS CompletionDate_1,UnofferedCustomerExperience.UnOfferedCustomerExperienceGradeKey
  FROM CustomerExperience
	INNER JOIN UnofferedCustomerExperience
		ON CustomerExperience.CustomerExperienceKey = UnofferedCustomerExperience.UnofferedCustomerExperienceKey
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
CREATE VIEW [dbo].[vBoURLMapping]
AS
SELECT URLMapping.DirectoryName,URLMapping.URL,URLMapping.URLMappingKey,URLMapping.WebsiteDocumentVersionKey,URLMapping.TargetDocumentVersionKey,URLMapping.URLMappingDesc,URLMapping.URLParameters,URLMapping.URLMappingTypeCode
  FROM URLMapping
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoURLMappingTypeRef]'))
    DROP VIEW [dbo].[vBoURLMappingTypeRef]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoURLMappingTypeRef]
AS
SELECT URLMappingTypeRef.URLMappingTypeCode,URLMappingTypeRef.URLMappingTypeName,URLMappingTypeRef.URLMappingTypeRefDesc
  FROM URLMappingTypeRef
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
CREATE VIEW [dbo].[vBoUser]
AS
SELECT UserMain.ContactMaster,UserMain.EffectiveDate,UserMain.ExpirationDate,UserMain.IsDisabled,UserMain.UpdatedByUserKey,UserMain.UpdatedOn,UserMain.UserId,UserMain.CreatedByUserKey,UserMain.CreatedOn,UserMain.UserKey,UserMain.DefaultDepartmentGroupKey,UserMain.DefaultPerspectiveKey,UserMain.ProviderKey
  FROM UserMain
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
CREATE VIEW [dbo].[vBoUserDefinedCustomerExperience]
AS
SELECT CustomerExperience.CustomerExperienceKey,CustomerExperience.CustomerExperienceNote AS Note,CustomerExperience.CustomerExperienceStatusCode,CustomerExperience.CreatedByUserKey,CustomerExperience.CreatedOn,CustomerExperience.ContactKey,UserDefinedCustomerExperience.CompletionDate,UserDefinedCustomerExperience.ProgramKey,UserDefinedCustomerExperience.UserDefinedCustomerExperienceDesc AS Description,UserDefinedCustomerExperience.UserDefinedCustomerExperienceKey,UserDefinedCustomerExperience.UserDefinedCustomerExperienceLocation AS Location,UserDefinedCustomerExperience.UserDefinedCustomerExperienceName AS Name,UserDefinedCustomerExperience.UserDefinedCustomerExperienceUnits AS Units
  FROM CustomerExperience
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
CREATE VIEW [dbo].[vBoUserDefinedField]
AS
SELECT UserDefinedFieldRef.PropertyDefinitionKey,UserDefinedFieldRef.SortOrder,UserDefinedFieldRef.SystemEntityKey,UserDefinedFieldRef.UseInSearchFlag,UserDefinedFieldRef.UserDefinedFieldKey,UserDefinedFieldRef.UserDefinedFieldName AS Name
  FROM UserDefinedFieldRef
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
CREATE VIEW [dbo].[vBoUserRole]
AS
SELECT UserRole.RoleKey,UserRole.UserKey
  FROM UserRole
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
CREATE VIEW [dbo].[vBoUserToken]
AS
SELECT UserToken.Grantee,UserToken.UserKey
  FROM UserToken
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
CREATE VIEW [dbo].[vBoVerticalAlignmentRef]
AS
SELECT VerticalAlignmentRef.VerticalAlignmentDesc AS Description,VerticalAlignmentRef.VerticalAlignmentCode AS Code,VerticalAlignmentRef.VerticalAlignmentName AS Name
  FROM VerticalAlignmentRef
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vUDBOVolunteersInterests]'))
    DROP VIEW [dbo].[vUDBOVolunteersInterests]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE VIEW [dbo].[vUDBOVolunteersInterests]
AS
SELECT s.RowID AS [ContactKey],
       CAST(MAX(CASE WHEN s.PropertyName = 'EmergencyContact' THEN s.PropertyStringValue ELSE NULL END) AS nvarchar(80)) AS [EmergencyContact],
       CAST(MAX(CASE WHEN s.PropertyName = 'CarMakeAndModel' THEN s.PropertyStringValue ELSE NULL END) AS nvarchar(80)) AS [CarMakeAndModel],
       CAST(COALESCE(MAX(CASE WHEN s.PropertyName = 'FridayAM' THEN CAST(s.PropertyBooleanValue AS int) ELSE NULL END), 0) AS bit) AS [FridayAM],
       CAST(COALESCE(MAX(CASE WHEN s.PropertyName = 'FridayPM' THEN CAST(s.PropertyBooleanValue AS int) ELSE NULL END), 0) AS bit) AS [FridayPM],
       CAST(MAX(CASE WHEN s.PropertyName = 'LicensePlateNumber' THEN s.PropertyStringValue ELSE NULL END) AS nvarchar(80)) AS [LicensePlateNumber],
       CAST(COALESCE(MAX(CASE WHEN s.PropertyName = 'MondayAM' THEN CAST(s.PropertyBooleanValue AS int) ELSE NULL END), 0) AS bit) AS [MondayAM],
       CAST(COALESCE(MAX(CASE WHEN s.PropertyName = 'MondayPM' THEN CAST(s.PropertyBooleanValue AS int) ELSE NULL END), 0) AS bit) AS [MondayPM],
       CAST(COALESCE(MAX(CASE WHEN s.PropertyName = 'SaturdayAM' THEN CAST(s.PropertyBooleanValue AS int) ELSE NULL END), 0) AS bit) AS [SaturdayAM],
       CAST(COALESCE(MAX(CASE WHEN s.PropertyName = 'SundayAM' THEN CAST(s.PropertyBooleanValue AS int) ELSE NULL END), 0) AS bit) AS [SundayAM],
       CAST(COALESCE(MAX(CASE WHEN s.PropertyName = 'ThursdayAM' THEN CAST(s.PropertyBooleanValue AS int) ELSE NULL END), 0) AS bit) AS [ThursdayAM],
       CAST(COALESCE(MAX(CASE WHEN s.PropertyName = 'ThursdayPM' THEN CAST(s.PropertyBooleanValue AS int) ELSE NULL END), 0) AS bit) AS [ThursdayPM],
       CAST(COALESCE(MAX(CASE WHEN s.PropertyName = 'TuesdayAM' THEN CAST(s.PropertyBooleanValue AS int) ELSE NULL END), 0) AS bit) AS [TuesdayAM],
       CAST(COALESCE(MAX(CASE WHEN s.PropertyName = 'TuesdayPM' THEN CAST(s.PropertyBooleanValue AS int) ELSE NULL END), 0) AS bit) AS [TuesdayPM],
       CAST(COALESCE(MAX(CASE WHEN s.PropertyName = 'WednesdayAM' THEN CAST(s.PropertyBooleanValue AS int) ELSE NULL END), 0) AS bit) AS [WednesdayAM],
       CAST(COALESCE(MAX(CASE WHEN s.PropertyName = 'WednesdayPM' THEN CAST(s.PropertyBooleanValue AS int) ELSE NULL END), 0) AS bit) AS [WednesdayPM]
  FROM [dbo].[UserDefinedSingleInstanceProperty] s
 WHERE s.TableName = 'VolunteersInterests'
 GROUP BY s.RowID

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vBoVolunteersInterests]'))
    DROP VIEW [dbo].[vBoVolunteersInterests]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vBoVolunteersInterests]
AS
SELECT vUDBOVolunteersInterests.ContactKey,vUDBOVolunteersInterests.EmergencyContact,vUDBOVolunteersInterests.CarMakeAndModel,vUDBOVolunteersInterests.FridayAM,vUDBOVolunteersInterests.FridayPM,vUDBOVolunteersInterests.LicensePlateNumber,vUDBOVolunteersInterests.MondayAM,vUDBOVolunteersInterests.MondayPM,vUDBOVolunteersInterests.SaturdayAM,vUDBOVolunteersInterests.SundayAM,vUDBOVolunteersInterests.ThursdayAM,vUDBOVolunteersInterests.ThursdayPM,vUDBOVolunteersInterests.TuesdayAM,vUDBOVolunteersInterests.TuesdayPM,vUDBOVolunteersInterests.WednesdayAM,vUDBOVolunteersInterests.WednesdayPM
  FROM vUDBOVolunteersInterests
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
CREATE VIEW [dbo].[vBoWarehouseStatusRef]
AS
SELECT WarehouseStatusRef.WarehouseStatusCode,WarehouseStatusRef.WarehouseStatusDesc
  FROM WarehouseStatusRef
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
CREATE VIEW [dbo].[vBoWarehouseTypeRef]
AS
SELECT WarehouseTypeRef.WarehouseTypeCode,WarehouseTypeRef.WarehouseTypeDesc
  FROM WarehouseTypeRef
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
CREATE VIEW [dbo].[vBoWebUserControlRef]
AS
SELECT WebUserControlRef.WebUserControlName,WebUserControlRef.WebUserControlPath,WebUserControlRef.ParameterControlPath
  FROM WebUserControlRef
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
CREATE VIEW [dbo].[vBoWorkflowInstanceReport]
AS
SELECT vWorkflowInstanceReport.IsLocked,vWorkflowInstanceReport.LockedByName,vWorkflowInstanceReport.LogText,vWorkflowInstanceReport.WorkflowInstanceKey,vWorkflowInstanceReport.WorkflowStatus,vWorkflowInstanceReport.InitiatedByName,vWorkflowInstanceReport.InitiatedByUserKey,vWorkflowInstanceReport.InitiatedOn,vWorkflowInstanceReport.ProcessName
  FROM vWorkflowInstanceReport
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
CREATE VIEW [dbo].[vBoWorkflowProcess]
AS
SELECT WorkflowInstance.InstanceGraph,WorkflowInstance.LockedByUserKey,WorkflowInstance.LockedOn,WorkflowInstance.ProcessId,WorkflowInstance.WorkflowInstanceKey
  FROM WorkflowInstance
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
CREATE VIEW [dbo].[vBoWorkflowQueueItem]
AS
SELECT WorkflowQueue.CreatedByUserKey,WorkflowQueue.CreatedOn,WorkflowQueue.DateExecuted,WorkflowQueue.Description,WorkflowQueue.SelectionKey,WorkflowQueue.Stage,WorkflowQueue.WorkFlowQueueItemStatusCode,WorkflowQueue.TaskItemKey,WorkflowQueue.UpdatedByUserKey,WorkflowQueue.UpdatedOn,WorkflowQueue.WorkFlowQueueKey,WorkflowQueue.WorkItems,WorkflowQueue.TaskItemAccessKey
  FROM WorkflowQueue
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
CREATE VIEW [dbo].[vBoWorkflowQueueItemWithStatus]
AS
SELECT vWorkflowQueueWithStatus.Status,vWorkflowQueueWithStatus.CreatedByUserKey,vWorkflowQueueWithStatus.CreatedOn,vWorkflowQueueWithStatus.DateExecuted,vWorkflowQueueWithStatus.Description,vWorkflowQueueWithStatus.SelectionKey,vWorkflowQueueWithStatus.Stage,vWorkflowQueueWithStatus.TaskItemAccessKey,vWorkflowQueueWithStatus.TaskItemKey,vWorkflowQueueWithStatus.UpdatedByUserKey,vWorkflowQueueWithStatus.UpdatedOn,vWorkflowQueueWithStatus.WorkFlowQueueKey,vWorkflowQueueWithStatus.WorkItems
  FROM vWorkflowQueueWithStatus
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
CREATE VIEW [dbo].[vBoWorkflowQueueStatusRef]
AS
SELECT WorkflowQueueStatusRef.WorkflowQueueStatusCode,WorkflowQueueStatusRef.WorkflowQueueStatusDesc,WorkflowQueueStatusRef.WorkflowQueueStatusName
  FROM WorkflowQueueStatusRef
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
CREATE VIEW [dbo].[vBoWorkflowServiceReport]
AS
SELECT WorkflowService.BaseDirectory,WorkflowService.CategoryFilter,WorkflowService.MachineName,WorkflowService.MaxWorkerCount,WorkflowService.ServiceName,WorkflowService.UpdatedOn,WorkflowService.WorkflowServiceKey,WorkflowService.WorkFlowServiceStatusCode
  FROM WorkflowService
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
CREATE VIEW [dbo].[vBoWorkflowServiceWorkerReport]
AS
SELECT vWorkflowServiceWorkerReport.Category,vWorkflowServiceWorkerReport.CreatedOn,vWorkflowServiceWorkerReport.Description,vWorkflowServiceWorkerReport.EnqueuedOn,vWorkflowServiceWorkerReport.PerformerName,vWorkflowServiceWorkerReport.Priority,vWorkflowServiceWorkerReport.WorkflowInstanceKey,vWorkflowServiceWorkerReport.WorkflowServiceKey,vWorkflowServiceWorkerReport.WorkItemQueueKey
  FROM vWorkflowServiceWorkerReport
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
CREATE VIEW [dbo].[vBoWorkflowStatusRef]
AS
SELECT WorkflowStatusRef.WorkflowStatusCode,WorkflowStatusRef.WorkflowStatusDesc,WorkflowStatusRef.WorkflowStatusName
  FROM WorkflowStatusRef
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
CREATE VIEW [dbo].[vBoWorkItem]
AS
SELECT WorkItemQueue.ActivityId,WorkItemQueue.Category,WorkItemQueue.Description,WorkItemQueue.EnqueuedOn,WorkItemQueue.ExecutionMode,WorkItemQueue.IsInteractive,WorkItemQueue.KeepAlive,WorkItemQueue.PackageId,WorkItemQueue.PerformerKey,WorkItemQueue.Priority,WorkItemQueue.ProcessId,WorkItemQueue.SelectedOn,WorkItemQueue.SelectionLock,WorkItemQueue.WorkflowInstanceKey,WorkItemQueue.WorkItemGraph,WorkItemQueue.WorkItemQueueKey,WorkItemQueue.BeginOn,WorkItemQueue.RecoveryPoint
  FROM WorkItemQueue
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
CREATE VIEW [dbo].[vBoWorkItemQueueReport]
AS
SELECT vWorkItemQueueReport.Category,vWorkItemQueueReport.Description,vWorkItemQueueReport.EnqueuedOn,vWorkItemQueueReport.IsInteractive,vWorkItemQueueReport.IsLocked,vWorkItemQueueReport.PerformerName,vWorkItemQueueReport.Priority,vWorkItemQueueReport.WorkflowInstanceKey,vWorkItemQueueReport.WorkItemQueueKey,vWorkItemQueueReport.BeginOn,vWorkItemQueueReport.PerformerKey,vWorkItemQueueReport.RecoveryPoint,vWorkItemQueueReport.SelectionLock,vWorkItemQueueReport.ContactTypeDesc
  FROM vWorkItemQueueReport
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

CREATE  VIEW [dbo].[vContent_TemplatePath]
AS
/*
This View is a part of SP - amsp_GetTaggedPage, created in order to improve perfomance of the SP.
*/
SELECT C.*, N.TemplatePath
  FROM Content C WITH (UPDLOCK),  
	   Nav_Menu N WITH (UPDLOCK), 
	   Nav_Menu Nb WITH (UPDLOCK)
 WHERE C.NavMenuID = N.NavMenuID
   AND N.AncestorNavMenuID = Nb.NavMenuID
   AND ISNULL(N.HideFlag,'N') <> 'Y'
   AND ISNULL(Nb.HideFlag,'N') <> 'Y'
   AND C.WorkflowStatusCode = 'P'

GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vControlTypeProperty]'))
    DROP VIEW [dbo].[vControlTypeProperty]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE VIEW [dbo].[vControlTypeProperty]
AS
SELECT lct.[LocalizationControlTypeName] AS ControlName, 
       lct.[AssemblyName], 
       lcp.[LocalizationControlPropertyName] AS PropertyName, 
       lcp.[TypeName], 
       lcp.[IsPhrase], 
       lcp.[HasWhiteSpace], 
       lcp.[IsCollection]
FROM [dbo].[LocalizationControlType] lct
     INNER JOIN [dbo].[LocalizationControlProperty] lcp ON lct.[LocalizationControlTypeId] = lcp.[LocalizationControlTypeId]

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
		MAX(TRANSACTION_DATE)as Date,  
		MAX(ID) as ID,  
		MAX(ORIGINATING_TRANS_NUM) as OriginalTransaction,  
		MAX(ACTIVITY_TYPE) as GiftType,  
		SUM(AMOUNT) as Amount, 
		MAX(SOURCE_SYSTEM) as SourceSystem, 
		MAX(SOLICITOR_ID) as SolicitorId,     
		MAX(UF_4) as RequestCode, 
		MAX(PRODUCT_CODE) as ProductCode,  
		MAX(ORG_CODE) as FundCode, 
		MAX(SOURCE_CODE) as AppealCode , 
		MAX(CAMPAIGN_CODE) as CampaignCode  
			FROM Activity 
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


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vEventFunctionRegistrants]'))
    DROP VIEW [dbo].[vEventFunctionRegistrants]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO


CREATE VIEW [dbo].[vEventFunctionRegistrants]
AS
SELECT ol.[PRODUCT_CODE] AS [EventFunctionKey],
       pf.[IS_EVENT_REGISTRATION_OPTION] AS [IsRegistrationOption],
       NULL AS [GroupKey],
       p.[ProductKey],
       NULL AS [GroupName],
       NULL AS [GroupMemberStatusCode],
       NULL AS [GroupMemberTypeSpecificData],
       NULL AS [EffectiveDate],
       cm.[ContactKey],
       o.[FULL_NAME] AS [ContactName],
       o.[LAST_FIRST] AS [ContactSortName],
       o.[COMPANY] AS [PrimaryInstituteName],
       o.[TITLE] AS [PrimaryInstituteTitle],
       CASE 
            WHEN o.STATUS = 'C'
            THEN 0
            ELSE 1
       END AS GroupMemberIsActive,
       p.[TITLE] AS [FunctionName],
       om.[MEETING] AS [EventKey],
       mm.[TITLE] AS [EventName],
       CASE 
            WHEN ol.[QUANTITY_ORDERED] = 1
            THEN 'Registered'
            WHEN ol.[QUANTITY_ORDERED] = 0
                  AND ISDATE(ol.[ADDED_TO_WAIT_LIST]) = 1
                  THEN 'Wait List'
            ELSE 'Registered Canceled'
       END AS GroupMemberStatusDesc,
       CASE 
            WHEN o.[STATUS] = 'C'
            THEN 'REGC'
            WHEN o.[STATUS] <> 'C' 
                          AND ol.[QUANTITY_ORDERED] = 0
                  AND ISDATE(ol.[ADDED_TO_WAIT_LIST]) = 1
            THEN 'REGW'
            ELSE 'REG'
       END AS GroupMemberStatusCode_1,
       ol.[QUANTITY_ORDERED] AS [Quantity],
       n.[EMAIL] AS [PrimaryEmail],
       ol.[ADDED_TO_WAIT_LIST] AS 'Wait List'
FROM [dbo].Order_Meet om
      INNER JOIN Meet_Master mm ON om.[MEETING] = mm.[MEETING]
      INNER JOIN Order_Lines ol ON om.[ORDER_NUMBER] = ol.[ORDER_NUMBER]
      INNER JOIN Orders o ON ol.[ORDER_NUMBER] = o.[ORDER_NUMBER]
      INNER JOIN Product p ON ol.[PRODUCT_CODE] = p.[PRODUCT_CODE]
      INNER JOIN Product_Function pf ON p.[PRODUCT_CODE] = pf.[PRODUCT_CODE]
      INNER JOIN ContactMain cm ON cm.[SyncContactID]  = o.[ST_ID]
      INNER JOIN Name n ON cm.[ID] = n.[ID]


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

CREATE view [dbo].[vGifts] AS
  SELECT MIN(Activity.ID)                 ID,
         MIN(Activity.TRANSACTION_DATE) TRANSACTION_DATE,
         MIN(Activity.SOURCE_CODE)      SOURCE_CODE,
        -SUM(Trans.AMOUNT)             AMOUNT,
         MAX(Trans.TRANS_NUMBER)        TRANS_NUMBER,
         MIN(Activity.CAMPAIGN_CODE)    CAMPAIGN_CODE,
         MIN(Activity.SOLICITOR_ID)     SOLICITOR_ID, 
         SUM (Activity.TAXABLE_VALUE)   TAXABLE_VALUE,
         MAX(Activity.OTHER_CODE)       OTHER_CODE,
         MAX(Activity.DESCRIPTION)      DESCRIPTION,     
         MAX(UF_1)                      UF_1,     
         MAX(Trans.INSTALL_BILL_DATE)   INSTALL_BILL_DATE,
         MAX(Trans.OWNER_ORG_CODE)      OWNER_ORG_CODE,
         MAX(Activity.SEQN)             SEQN,
         MAX(Trans.MERGE_CODE)          MERGE_CODE,
         MAX(Trans.MEM_TRIB_NAME_TEXT)  TRIBUTEE,
         MAX(Activity.MEM_TRIB_CODE)    MEM_TRIB_CODE,
         MAX(CONVERT(VARCHAR(512),Activity.NOTE_2)) AS NOTE_2,
         MAX(Trans_Notify.NOTIFY_ID)    NOTIFY_ID      
    FROM Trans 
         LEFT OUTER JOIN Activity on Trans.ACTIVITY_SEQN = Activity.SEQN 
         LEFT OUTER JOIN Trans_Notify ON Trans_Notify.TRANS_NUMBER = Activity.ORIGINATING_TRANS_NUM
   WHERE Trans.TRANSACTION_TYPE = 'DIST' 
         AND Trans.JOURNAL_TYPE = 'IN'
         AND Trans.INSTALL_BILL_DATE is null
         AND Trans.SOURCE_SYSTEM = 'FR'
   GROUP BY Trans.TRANS_NUMBER


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


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vGroupMemberSubscription]'))
    DROP VIEW [dbo].[vGroupMemberSubscription]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE VIEW [dbo].[vGroupMemberSubscription]
AS SELECT 
          gmd.[GroupMemberDetailId],
          gm.[PartyId],
          gm.[GroupId],
          gmd.[GroupRoleId],
          gm.[JoinDate],
          gm.[DropDate],
          gm.[IsActive],
          s.[BALANCE],
          s.[COPIES]
     FROM vSoaGroupMemberSummary AS gm
          INNER JOIN vSoaGroupMemberDetail AS gmd ON gm.[GroupMemberId] = gmd.[GroupMemberId]
          INNER JOIN Subscriptions AS s ON gm.[GroupId] = s.[PRODUCT_CODE] AND gm.[PartyId] = s.[ID];


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


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vOrderDetail_VAT_Analysis]'))
    DROP VIEW [dbo].[vOrderDetail_VAT_Analysis]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE VIEW [dbo].[vOrderDetail_VAT_Analysis]
AS
WITH CTE AS (
     SELECT ol.[ORDER_NUMBER] AS [OrderNumber], ol.[TAX_AUTHORITY] AS [TaxAuthorityCode], MAX(p.[TITLE]) AS [TaxAuthority], 
            SUM(ol.[EXTENDED_AMOUNT] - ol.[TAX_1]) AS [NetAmount], 
            SUM(ol.[TAX_1]) AS [Tax]
       FROM [dbo].[Order_Lines] ol 
            LEFT OUTER JOIN [dbo].[Product] p ON ol.[TAX_AUTHORITY] = p.[PRODUCT_MINOR] AND p.[PRODUCT_MINOR] <> ''
      WHERE ol.[Taxable] = 1
      GROUP BY ol.[ORDER_NUMBER], ol.[TAX_AUTHORITY]

     UNION ALL

     SELECT o.[ORDER_NUMBER] AS [OrderNumber], o.[VAT_TAX_CODE_FH] AS [TaxAuthorityCode], MAX(p.[TITLE]) AS [TaxAuthority], 
            SUM(o.[FREIGHT_1] + o.[FREIGHT_2] - o.[FREIGHT_TAX] + o.[HANDLING_1] + o.[HANDLING_2] - o.[HANDLING_TAX]) AS [NetAmount], 
            SUM(o.[FREIGHT_TAX] + o.[HANDLING_TAX]) AS [Tax]
       FROM [dbo].[Orders] o 
            LEFT OUTER JOIN [dbo].[Product] p ON o.[VAT_TAX_CODE_FH] = p.[PRODUCT_MINOR] AND p.[PRODUCT_MINOR] <> ''
      GROUP BY o.[ORDER_NUMBER], o.[VAT_TAX_CODE_FH]
)
SELECT [OrderNumber], [TaxAuthorityCode], SUM([NetAmount]) AS [NetAmount], SUM([Tax]) AS [Tax], MAX([TaxAuthority]) AS [TaxAuthority]
  FROM CTE
GROUP BY [OrderNumber], [TaxAuthorityCode]

GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vOrg_Control]'))
    DROP VIEW [dbo].[vOrg_Control]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE VIEW [dbo].[vOrg_Control] AS 
SELECT 
   Org_Control.OrgName,
   Org_Control.DefaultFlag,
   Org_Control.LetterheadAddress
FROM [dbo].[Org_Control]




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


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vPhrasesTranslated]'))
    DROP VIEW [dbo].[vPhrasesTranslated]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE VIEW [dbo].[vPhrasesTranslated]
AS
SELECT lp.[Phrase],        lpt.[LocalizationCultureId],        lpt.[TranslatedPhrase]
FROM dbo.[LocalizationPhrase] lp
    INNER JOIN dbo.[LocalizationPhraseTranslated] lpt ON lp.[LocalizationPhraseId] = lpt.[LocalizationPhraseId]

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


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSoaBillToParty]'))
    DROP VIEW [dbo].[vSoaBillToParty]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO








CREATE VIEW [dbo].[vSoaBillToParty]
AS
--- UNION of several SELECTs in an outer SELECT to eliminate duplicates 
-- and have the list results sorted highest-to-lowest based on the assigned ranking values (0 being the highest ranking)
SELECT bt.[PartyId], bt.[BillToPartyId], bt.[Ranking] AS [Ranking]
  FROM 
  (
        --***********************************************************************
        -- 9/16/2013 - Do not include the Name_Fin BillTo ID for the time being.
        --***********************************************************************
        -- Bill to as defined in each party commerce setting for institutes - Ranking 0
        --SELECT [ID] AS [PartyId],  
        --       [BT_ID] AS [BillToPartyId], 
        --       0 AS [Ranking]
        --  FROM [Name_Fin] 
        -- WHERE [BT_ID] <> ''
        -- UNION
    
        -- "Myself"  - Ranking 2
        SELECT [ID] AS [PartyId], 
               [ID] AS [BillToPartyId], 
               2 AS [Ranking] 
          FROM [dbo].[Name]
         UNION ALL
        
        --Institute the party is a CA of - Ranking 3
        SELECT r.[TARGET_ID] AS [PartyId], 
               r.[ID] AS [BillToPartyId], 
               3 AS [Ranking]
          FROM [dbo].[Relationship] r
         WHERE r.[RELATION_TYPE] = '_ORG-ADMIN'
          AND (SELECT [ParameterValue] FROM [dbo].[SystemConfig] WHERE [SystemConfigKey]='FF8F9D37-0BD8-4536-8A58-0FFC1A614E98') = 'CompanyAdminsOnly'

         UNION ALL
        
        -- Institutes the party is a member of - Ranking 3, or 1 (if default)
        SELECT n.[ID] AS [PartyId], 
               n.[CO_ID] AS [BillToPartyId], 
                (CASE (SELECT [ParameterValue] FROM [dbo].[SystemConfig] WHERE [SystemConfigKey]='FF8F9D37-0BD8-4536-8A58-0FFC1A614E98')
                    WHEN N'AllUsersPrimaryOrgIsDefault' THEN 1
                    ELSE 3
                END) AS [Ranking]         
          FROM [dbo].[Name] n 
               INNER JOIN [dbo].[ContactMain] c ON n.[ID] = c.[SyncContactID]
               LEFT OUTER JOIN [dbo].[UserRole] u ON c.[ContactKey] = u.[UserKey] 
         WHERE n.[STATUS] = 'A' -- ONLY INCLUDE IF THE PERSON IS AN ACTIVE USER
           AND n.[CO_ID] <> ''
           AND (SELECT [ParameterValue] FROM [dbo].[SystemConfig] WHERE [SystemConfigKey]='FF8F9D37-0BD8-4536-8A58-0FFC1A614E98') <> 'CompanyAdminsOnly'
  ) bt










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

CREATE VIEW [dbo].[vSoaChangeLog]
AS

SELECT 'Party-' + [ID] +'-' + CONVERT(varchar(20), CONVERT(bigint, CONVERT(varbinary(8), TIME_STAMP))) AS [ChangeLogId],
       'Party' AS [IdentityEntityTypeName], 
       [ID] AS [IdentityIdentityElement],
       [DATE_TIME] AS [ChangeDate], 
       [SUB_TYPE] AS [Subtype], 
       [USER_ID] AS [ChangedByUserId],
       [LOG_TEXT] AS [LogText],
       '' AS ObjectTypeName, '' AS PropertyName, '' AS OriginalValue, '' AS CurrentValue
  FROM [Name_Log]

  UNION

SELECT DISTINCT 
         'Party-' + CM.ID + '-' + CONVERT(varchar, CL.[CreatedOn], 126) + '-' + CP.PropertyName  AS [ChangeLogId],
    'Party' AS [IdentityEntityTypeName],
    CAST(CM.ID AS varchar(12)) AS [IdentityIdentityElement],
    CL.[CreatedOn] AS [ChangeDate],
    CASE WHEN CL.[ActionType] = 1 THEN 'DELETE'
         ELSE 'CHANGE'
    END AS [Subtype],
    UM.[UserId] AS [ChangedByUserId],
    'ChangeLog' AS [LogText],
    CL.ObjectTypeName, CP.PropertyName, CP.OriginalValue, CP.CurrentValue
  FROM [dbo].[ChangeLog] CL 
       INNER JOIN [dbo].[ChangeProperty] CP ON CL.[ChangeLogKey] = CP.[ChangeLogKey] 
       INNER JOIN [dbo].[ContactMain] CM ON CL.[ObjectKey] = CM.[ContactKey]
       INNER JOIN [dbo].[UserMain] UM ON CL.[CreatedByUserKey] = UM.[UserKey] 




GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSoaContexts]'))
    DROP VIEW [dbo].[vSoaContexts]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE VIEW [dbo].[vSoaContexts] 
AS
    SELECT  dm.[AlternateName] AS ContextName,
            dm.[DocumentName] AS ContextCode,
            dm.[DocumentVersionKey] AS ContextId
      FROM [dbo].[DocumentMain] dm
     WHERE  dm.[DocumentTypeCode] = 'WEB'
       AND  dm.[DocumentStatusCode] = 40
       AND  dm.[IsSystem] = 0

GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSoaEmailAddresses]'))
    DROP VIEW [dbo].[vSoaEmailAddresses]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE VIEW [dbo].[vSoaEmailAddresses]
   AS SELECT DISTINCT [ID] AS PartyId, [Email] 
        FROM [dbo].[Name] 
       WHERE [Email] <> '' 

    UNION

      SELECT DISTINCT [ID] AS PartyId,[Email]
        FROM [dbo].[Name_Address]
       WHERE [EMAIL] <> ''


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
            CASE WHEN LEN([Meet_Master].[ZIP]) > 0 THEN [Meet_Master].[ZIP] + ' ' ELSE '' END +
            CASE WHEN LEN([Meet_Master].[COUNTRY]) > 0 THEN [Meet_Master].[COUNTRY] + ' ' ELSE '' END
          AS VARCHAR(200))
       AS [FacilityName],
       [Meet_Master].[MEETING_IMAGE_NAME] AS [ImageUrl],
       CAST(CASE 
              WHEN [Meet_Master].[WEB_VIEW_ONLY] = 1 THEN 1
              WHEN [Meet_Master].[EMAIL_REGISTRATION] = 1 THEN 1
              WHEN (SELECT COUNT(1) FROM Product p WHERE p.PRODUCT_MAJOR = Meet_Master.MEETING) > 0 THEN 3
              ELSE 1
            END
          AS INT) 
        AS [EventFunctionRegistrationTypeCode],
       [Meet_Master].[EARLY_CUTOFF] AS [EarlyCutoffDate],
       [Meet_Master].[REG_CUTOFF] AS [RegularCutoffDate],
       [Meet_Master].[LATE_CUTOFF] AS [LateCutoffDate],
       [Meet_Master].[TOTAL_CANCELATIONS] AS [CancelationsCount],
       [Meet_Master].[ADD_GUESTS] AS [CanAddGuests],
       [Meet_Master].[REG_OTHERS] AS [AllowRegisterOthers],
       [Meet_Master].[WEB_VIEW_ONLY] AS [ViewOnly],
       [Meet_Master].[WEB_DESC] AS [AdditionalDescription],
       [Meet_Master].[EMAIL_REGISTRATION] AS [EmailRegistration],
       [Meet_Master].[ALLOW_REG_EDIT] AS [AllowRegistrationEdit],
       [Meet_Master].[REG_EDIT_CUTOFF] AS [RegistrationEditCutoffDate],
       [Meet_Master].[FORM_DEFINITION_ID] AS [FormDefinitionKey],
       [Meet_Master].[FORM_DEFINITION_SECTION_ID] AS [FormDefinitionSectionKey],
       [Meet_Master].[PUBLISH_START_DATE] AS [PublishStartDate],
       [Meet_Master].[PUBLISH_END_DATE] AS [PublishEndDate],
       [Meet_Master].[REGISTRATION_START_DATE] AS [RegistrationStartDate],
       [Meet_Master].[REGISTRATION_END_DATE] AS [RegistrationEndDate],
       [Meet_Master].[REGISTRATION_CLOSED_MESSAGE] AS [RegistrationClosedMessage],
       [Meet_Master].[WEB_ENABLED] AS [WebEnabled],
       [Meet_Master].[DEFAULT_PROGRAMITEM_DISPLAYMODE] AS [DefaultProgramItemDisplayMode]
  FROM [dbo].[Meet_Master]



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
       p.[IMAGE_URL] as [ImageURL],
       p.[WEB_DESC] as [AdditionalDescription],
       f.[FUNCTION_TYPE] AS [CategoryId],
       f.[FUNCTION_TYPE] AS [CategoryName],
       CAST('' AS VARCHAR (50)) AS [Status],
       f.[BEGIN_DATE_TIME] AS [StartDateTime],
       f.[END_DATE_TIME] AS [EndDateTime],
       CAST('' AS VARCHAR (100)) AS [FacilityName],
       CAST(3 AS INT) AS [EventFunctionRegistrationTypeCode],
       f.[EVENT_TRACK] AS [EventTrack],
       f.[SEQ] AS [SortOrder],
       f.[EVENT_CATEGORY] AS [EventCategory],
       f.[IS_EVENT_REGISTRATION_OPTION] AS [IsEventRegistrationOption],
       f.[MAXIMUM_ATTENDANCE] AS [Capacity],
       f.[WEB_MULTI_REG] AS [MaxQuantityPerRegistrant],
       f.[CONFLICT_CODE] AS [ConflictCodes],
       f.[FORM_DEFINITION_SECTION_ID] as [FormDefinitionSectionKey]
  FROM [dbo].[Product] p 
       INNER JOIN [dbo].[Product_Function] f ON p.[PRODUCT_CODE] = f.[PRODUCT_CODE]
       INNER JOIN [dbo].[Meet_Master] e ON p.[PRODUCT_MAJOR] = e.[MEETING]
 WHERE p.[PROD_TYPE] = 'MEETING'
       AND f.[FUNCTION_TYPE] = 'REG'
       AND f.[WEB_ENABLED] = 1            -- PBI 37115 - support for backward compatibility




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
SELECT  DISTINCT
          [GeneralReferenceId] = GT.TABLE_NAME + ':' + GT.SUBSTITUTE
        , [Table] = GT.TABLE_NAME
        , [Name] = GT.SUBSTITUTE
        , [Description] = CASE WHEN GT.DESCRIPTION = '' THEN GT.SUBSTITUTE ELSE GT.DESCRIPTION END
FROM    Gen_Tables GT
WHERE   GT.SUBSTITUTE <> ''

UNION

SELECT  DISTINCT
          [GeneralReferenceId] = GT.TABLE_NAME + ':' + GT.CODE
        , [Table] = GT.TABLE_NAME
        , [Name] = GT.CODE
        , [Description] = CASE WHEN GT.DESCRIPTION = '' THEN GT.CODE ELSE GT.DESCRIPTION END
FROM    Gen_Tables GT
WHERE   GT.SUBSTITUTE = ''
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



CREATE VIEW [dbo].[vSoaGroupClassSummary]
AS SELECT CAST('DUES' AS varchar(20)) AS [GroupClassId],
          'Dues' AS Name,
          '' AS [Description],
          CAST(1 AS bit) AS [IsReadOnly],
          CAST(0 AS bit) AS [IsRelationshipGroup],
          CAST(0 AS bit) AS [IsSimpleGroup],
          CAST(1 AS bit) AS [IsPartyMergeValidationRequired]
   UNION
   SELECT CAST('SUB' AS varchar(20)) AS [GroupClassId],
          'Subscription' AS [Name],
          '' AS [Description],
          CAST(1 AS bit) AS [IsReadOnly],
          CAST(0 AS bit) AS [IsRelationshipGroup],
          CAST(0 AS bit) AS [IsSimpleGroup],
          CAST(1 AS bit) AS [IsPartyMergeValidationRequired]
   UNION
   SELECT CAST('SEC' AS varchar(20)) AS [GroupClassId],
          'Section' AS [Name],
          '' AS [Description],
          CAST(1 AS bit) AS [IsReadOnly],
          CAST(0 AS bit) AS [IsRelationshipGroup],
          CAST(0 AS bit) AS [IsSimpleGroup],
          CAST(1 AS bit) AS [IsPartyMergeValidationRequired]
   UNION
   SELECT CAST('CHAPT' AS varchar(20)) AS [GroupClassId],
          'Chapter' AS [Name],
          '' AS [Description],
          CAST(0 AS bit) AS [IsReadOnly],
          CAST(0 AS bit) AS [IsRelationshipGroup],
          CAST(0 AS bit) AS [IsSimpleGroup],
          CAST(1 AS bit) AS [IsPartyMergeValidationRequired]
   UNION
   SELECT CAST('VOL' AS varchar(20)) AS [GroupClassId],
          'Voluntary Contribution' AS [Name],
          '' AS [Description],
          CAST(1 AS bit) AS [IsReadOnly],
          CAST(0 AS bit) AS [IsRelationshipGroup],
          CAST(0 AS bit) AS [IsSimpleGroup],
          CAST(0 AS bit) AS [IsPartyMergeValidationRequired]
   UNION
   SELECT CAST('MISC' AS varchar(20)) AS [GroupClassId],
          'Miscellaneous' AS [Name],
          '' AS [Description],
          CAST(1 AS bit) AS [IsReadOnly],
          CAST(0 AS bit) AS [IsRelationshipGroup],
          CAST(0 AS bit) AS [IsSimpleGroup],
          CAST(1 AS bit) AS [IsPartyMergeValidationRequired]
   UNION
   SELECT CAST('COMMITTEE' AS varchar(20)) AS [GroupClassId],
          'Committee' AS [Name],
          '' AS [Description],
          CAST(0 AS bit) AS [IsReadOnly],
          CAST(0 AS bit) AS [IsRelationshipGroup],
          CAST(0 AS bit) AS [IsSimpleGroup],
          CAST(0 AS bit) AS [IsPartyMergeValidationRequired]
   UNION
   SELECT CAST('MT' AS varchar(20)) AS [GroupClassId],
          'Member Type' AS [Name],
          '' AS [Description],
          CAST(1 AS bit) AS [IsReadOnly],
          CAST(0 AS bit) AS [IsRelationshipGroup],
          CAST(1 AS bit) AS [IsSimpleGroup],
          CAST(0 AS bit) AS [IsPartyMergeValidationRequired]
   UNION
   SELECT CAST('EVENT' AS varchar(20)) AS [GroupClassId],
          'Event' AS [Name],
          '' AS [Description],
          CAST(1 AS bit) AS [IsReadOnly],
          CAST(0 AS bit) AS [IsRelationshipGroup],
          CAST(1 AS bit) AS [IsSimpleGroup],
          CAST(0 AS bit) AS [IsPartyMergeValidationRequired]
   UNION
   SELECT CAST('RELATIONSHIP' AS varchar(20)) AS [GroupClassId],
          'Relationship' AS [Name],
          '' AS [Description],
          CAST(0 AS bit) AS [IsReadOnly],
          CAST(1 AS bit) AS [IsRelationshipGroup],
          CAST(0 AS bit) AS [IsSimpleGroup],
          CAST(0 AS bit) AS [IsPartyMergeValidationRequired]
   UNION
   SELECT CAST('ORGRELATIONSHIP' AS varchar(20)) AS [GroupClassId],
          'Organization' AS [Name],
          '' AS [Description],
          CAST(0 AS bit) AS [IsReadOnly],
          CAST(0 AS bit) AS [IsRelationshipGroup],
          CAST(0 AS bit) AS [IsSimpleGroup],
          CAST(0 AS bit) AS [IsPartyMergeValidationRequired];




GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSoaInvoiceLineARBase]'))
    DROP VIEW [dbo].[vSoaInvoiceLineARBase]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE VIEW [dbo].[vSoaInvoiceLineARBase] WITH SCHEMABINDING
AS
SELECT CAST(il.[REFERENCE_NUM] AS VARCHAR(15)) + ':' + CAST(il.[LINE_NUM] AS VARCHAR(15)) AS InvoiceLineId,
       CAST(il.[REFERENCE_NUM] AS VARCHAR(20)) AS InvoiceId,
       il.[LINE_NUM] AS LineNumber,
       il.[PRODUCT_CODE] AS ItemId,
       il.[ST_ID] AS ShipToPartyId,
       il.[BILL_QTY] AS Quantity,
       CAST(CASE WHEN il.[BILL_QTY] > 0 THEN (il.[CHARGES]/il.[BILL_QTY]) ELSE il.[CHARGES] END AS MONEY) AS UnitPrice,
       il.[CHARGES] AS ExtendedAmount,
       il.[CREDITS] AS PaymentAdjustmentAmount,
       il.[REFERENCE_NUM]
  FROM [dbo].[Invoice_Lines] il 
GO
IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaInvoiceLineARBase]') AND [name] = N'PK_vSoaInvoiceLineARBase')
BEGIN
  CREATE UNIQUE CLUSTERED INDEX PK_vSoaInvoiceLineARBase ON [dbo].[vSoaInvoiceLineARBase] (InvoiceLineId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaInvoiceLineARBase]') AND [name] = N'IX_vSoaInvoiceLineARBase_ShipToPartyId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaInvoiceLineARBase_ShipToPartyId ON [dbo].[vSoaInvoiceLineARBase] (ShipToPartyId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaInvoiceLineARBase]') AND [name] = N'IX_vSoaInvoiceLineARBase_ReferenceNum')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaInvoiceLineARBase_ReferenceNum ON [dbo].[vSoaInvoiceLineARBase] (REFERENCE_NUM)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaInvoiceLineARBase]') AND [name] = N'IX_vSoaInvoiceLineARBase_InvoiceId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaInvoiceLineARBase_InvoiceId ON [dbo].[vSoaInvoiceLineARBase] (InvoiceId, LineNumber)
END
go


GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSoaInvoiceLineAR]'))
    DROP VIEW [dbo].[vSoaInvoiceLineAR]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE VIEW [dbo].[vSoaInvoiceLineAR] 
AS
SELECT il.InvoiceLineId,
       il.InvoiceId,
       il.LineNumber,
       il.ItemId,
       il.ShipToPartyId,
       il.Quantity,
       il.UnitPrice,
       il.ExtendedAmount,
       il.PaymentAdjustmentAmount,
       ISNULL(pp.[Amount],0) AS PendingPaymentAdjustmentAmount,
       (il.ExtendedAmount - il.PaymentAdjustmentAmount - ISNULL(pp.[Amount],0)) AS Balance,
       CAST(null AS datetime) BILL_DATE
  FROM [dbo].[vSoaInvoiceLineARBase] il WITH (NOEXPAND)
  LEFT JOIN  [dbo].[vSoaPendingARPaymentAdjustment] pp WITH(NOEXPAND) ON il.[REFERENCE_NUM] = pp.[INVOICE_REFERENCE_NUM] AND il.[LineNumber] = pp.[INVOICE_LINE_NUM]




GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSoaInvoiceLineRegularBase]'))
    DROP VIEW [dbo].[vSoaInvoiceLineRegularBase]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE VIEW [dbo].[vSoaInvoiceLineRegularBase] WITH SCHEMABINDING
AS
SELECT CAST(o.[INVOICE_REFERENCE_NUM] AS varchar(15)) + ':' + CAST(o.[ORDER_NUMBER] AS varchar(15)) + ':' + CAST(ol.[LINE_NUMBER] AS varchar(15)) AS InvoiceLineId,
       CAST(o.[INVOICE_REFERENCE_NUM] AS varchar(20)) AS InvoiceId,
       CAST(SUBSTRING(CAST(o.[ORDER_NUMBER] AS varchar(15)), 0, CHARINDEX('.', CAST(o.[ORDER_NUMBER] AS varchar(15)))) + REPLICATE('0', 3 - LEN(CAST(CAST(ol.[LINE_NUMBER] AS int) AS varchar(15)))) + CAST(CAST(ol.[LINE_NUMBER] AS int) AS varchar(15)) AS varchar(20)) AS LineNumber,
       ol.[PRODUCT_CODE] AS ItemId,
       o.[ST_ID] AS ShipToPartyId,
       CAST(ol.[QUANTITY_ORDERED] AS int) AS Quantity,
       CAST(ol.[UNIT_PRICE] AS money) AS UnitPrice,
       ol.[EXTENDED_AMOUNT] AS ExtendedAmount,
       o.[INVOICE_REFERENCE_NUM] AS ReferenceNum
  FROM [dbo].[Orders] o
       INNER JOIN [dbo].[Order_Lines] ol ON o.[ORDER_NUMBER] = ol.[ORDER_NUMBER]
WHERE o.INVOICE_REFERENCE_NUM > 0
   AND ol.QUANTITY_ORDERED > 0

GO
IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaInvoiceLineRegularBase]') AND [name] = N'PK_vSoaInvoiceLineRegularBase')
BEGIN
  CREATE UNIQUE CLUSTERED INDEX PK_vSoaInvoiceLineRegularBase ON [dbo].[vSoaInvoiceLineRegularBase] (InvoiceLineId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaInvoiceLineRegularBase]') AND [name] = N'IX_vSoaInvoiceLineRegularBase_ShipToPartyId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaInvoiceLineRegularBase_ShipToPartyId ON [dbo].[vSoaInvoiceLineRegularBase] (ShipToPartyId)
  INCLUDE (ItemId, ExtendedAmount, InvoiceId, UnitPrice, LineNumber, Quantity)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaInvoiceLineRegularBase]') AND [name] = N'IX_vSoaInvoiceLineRegularBase_ReferenceNum')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaInvoiceLineRegularBase_ReferenceNum ON [dbo].[vSoaInvoiceLineRegularBase] (ReferenceNum)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaInvoiceLineRegularBase]') AND [name] = N'IX_vSoaInvoiceLineRegularBase_InvoiceId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaInvoiceLineRegularBase_InvoiceId ON [dbo].[vSoaInvoiceLineRegularBase] (InvoiceId, LineNumber)
  INCLUDE (ShipToPartyId, ExtendedAmount, Quantity, UnitPrice, ItemId)
END
go


GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSoaInvoiceLineRegularFreightBase]'))
    DROP VIEW [dbo].[vSoaInvoiceLineRegularFreightBase]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE VIEW [dbo].[vSoaInvoiceLineRegularFreightBase] WITH SCHEMABINDING
AS
SELECT CAST(o.[INVOICE_REFERENCE_NUM] AS VARCHAR(15)) + ':' + CAST(o.[ORDER_NUMBER] AS VARCHAR(15)) + ':' + CAST('FREIGHT' AS VARCHAR(15)) AS InvoiceLineId, 
       CAST(o.[INVOICE_REFERENCE_NUM] AS varchar(20)) AS InvoiceId,
       0 AS LineNumber,
       'ADDLCHARGES/FREIGHT' AS ItemId,
       o.[ST_ID] AS ShipToPartyId,
       1 AS Quantity, 
       o.[FREIGHT_1]+o.[FREIGHT_2] AS UnitPrice,
       o.[FREIGHT_1]+o.[FREIGHT_2] AS ExtendedAmount,
       o.[INVOICE_REFERENCE_NUM] AS ReferenceNum
  FROM [dbo].[Orders] o
WHERE o.INVOICE_REFERENCE_NUM > 0
   AND o.[FREIGHT_1]+o.[FREIGHT_2] > 0

GO
IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaInvoiceLineRegularFreightBase]') AND [name] = N'PK_vSoaInvoiceLineRegularFreightBase')
BEGIN
  CREATE UNIQUE CLUSTERED INDEX PK_vSoaInvoiceLineRegularFreightBase ON [dbo].[vSoaInvoiceLineRegularFreightBase] (InvoiceLineId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaInvoiceLineRegularFreightBase]') AND [name] = N'IX_vSoaInvoiceLineRegularFreightBase_ShipToPartyId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaInvoiceLineRegularFreightBase_ShipToPartyId ON [dbo].[vSoaInvoiceLineRegularFreightBase] (ShipToPartyId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaInvoiceLineRegularFreightBase]') AND [name] = N'IX_vSoaInvoiceLineRegularFreightBase_ReferenceNum')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaInvoiceLineRegularFreightBase_ReferenceNum ON [dbo].[vSoaInvoiceLineRegularFreightBase] (ReferenceNum)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaInvoiceLineRegularFreightBase]') AND [name] = N'IX_vSoaInvoiceLineRegularFreightBase_InvoiceId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaInvoiceLineRegularFreightBase_InvoiceId ON [dbo].[vSoaInvoiceLineRegularFreightBase] (InvoiceId, LineNumber)
END
go


GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSoaInvoiceLineRegularHandlingBase]'))
    DROP VIEW [dbo].[vSoaInvoiceLineRegularHandlingBase]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE VIEW [dbo].[vSoaInvoiceLineRegularHandlingBase] WITH SCHEMABINDING
AS
SELECT CAST(o.[INVOICE_REFERENCE_NUM] AS VARCHAR(15)) + ':' + CAST(o.[ORDER_NUMBER] AS VARCHAR(15)) + ':' + CAST('HANDLING' AS VARCHAR(15)) AS InvoiceLineId, 
       CAST(o.[INVOICE_REFERENCE_NUM] AS varchar(20)) AS InvoiceId,
       0 AS LineNumber,
       'ADDLCHARGES/HANDLING' AS ItemId,
       o.[ST_ID] AS ShipToPartyId,
       1 AS Quantity, 
       o.[HANDLING_1]+o.[HANDLING_2]  AS UnitPrice,
       o.[HANDLING_1]+o.[HANDLING_2] AS ExtendedAmount,
       o.[INVOICE_REFERENCE_NUM] AS ReferenceNum
  FROM [dbo].[Orders] o
WHERE o.INVOICE_REFERENCE_NUM > 0
   AND o.[HANDLING_1]+o.[HANDLING_2] > 0

GO
IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaInvoiceLineRegularHandlingBase]') AND [name] = N'PK_vSoaInvoiceLineRegularHandlingBase')
BEGIN
  CREATE UNIQUE CLUSTERED INDEX PK_vSoaInvoiceLineRegularHandlingBase ON [dbo].[vSoaInvoiceLineRegularHandlingBase] (InvoiceLineId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaInvoiceLineRegularHandlingBase]') AND [name] = N'IX_vSoaInvoiceLineRegularHandlingBase_ShipToPartyId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaInvoiceLineRegularHandlingBase_ShipToPartyId ON [dbo].[vSoaInvoiceLineRegularHandlingBase] (ShipToPartyId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaInvoiceLineRegularHandlingBase]') AND [name] = N'IX_vSoaInvoiceLineRegularHandlingBase_ReferenceNum')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaInvoiceLineRegularHandlingBase_ReferenceNum ON [dbo].[vSoaInvoiceLineRegularHandlingBase] (ReferenceNum)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaInvoiceLineRegularHandlingBase]') AND [name] = N'IX_vSoaInvoiceLineRegularHandlingBase_InvoiceId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaInvoiceLineRegularHandlingBase_InvoiceId ON [dbo].[vSoaInvoiceLineRegularHandlingBase] (InvoiceId, LineNumber)
END
go


GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSoaInvoiceLineRegularTaxBase]'))
    DROP VIEW [dbo].[vSoaInvoiceLineRegularTaxBase]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE VIEW [dbo].[vSoaInvoiceLineRegularTaxBase] WITH SCHEMABINDING
AS
SELECT CAST(o.[INVOICE_REFERENCE_NUM] AS VARCHAR(15)) + ':' + CAST(o.[ORDER_NUMBER] AS VARCHAR(15)) + ':' + CAST('TAX' AS VARCHAR(15)) AS InvoiceLineId, 
       CAST(o.[INVOICE_REFERENCE_NUM] AS varchar(20)) AS InvoiceId,
       0 AS LineNumber,
       'ADDLCHARGES/TAX' AS ItemId,
       o.[ST_ID] AS ShipToPartyId,
       1 AS Quantity, 
       o.[TAX_1]+o.[TAX_2]+o.[TAX_3] + o.[FREIGHT_TAX] + o.[HANDLING_TAX] AS UnitPrice,
       o.[TAX_1]+o.[TAX_2]+o.[TAX_3] + o.[FREIGHT_TAX] + o.[HANDLING_TAX] AS ExtendedAmount,
       o.[INVOICE_REFERENCE_NUM] AS ReferenceNum
  FROM [dbo].[Orders] o  
 WHERE o.INVOICE_REFERENCE_NUM > 0
   AND o.[TAX_1]+o.[TAX_2]+o.[TAX_3] + o.[FREIGHT_TAX] + o.[HANDLING_TAX] > 0

GO
IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaInvoiceLineRegularTaxBase]') AND [name] = N'PK_vSoaInvoiceLineRegularTaxBase')
BEGIN
  CREATE UNIQUE CLUSTERED INDEX PK_vSoaInvoiceLineRegularTaxBase ON [dbo].[vSoaInvoiceLineRegularTaxBase] (InvoiceLineId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaInvoiceLineRegularTaxBase]') AND [name] = N'IX_vSoaInvoiceLineRegularTaxBase_ShipToPartyId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaInvoiceLineRegularTaxBase_ShipToPartyId ON [dbo].[vSoaInvoiceLineRegularTaxBase] (ShipToPartyId)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaInvoiceLineRegularTaxBase]') AND [name] = N'IX_vSoaInvoiceLineRegularTaxBase_ReferenceNum')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaInvoiceLineRegularTaxBase_ReferenceNum ON [dbo].[vSoaInvoiceLineRegularTaxBase] (ReferenceNum)
END
go

IF NOT EXISTS (SELECT * FROM sysindexes WHERE [id] = OBJECT_ID(N'[dbo].[vSoaInvoiceLineRegularTaxBase]') AND [name] = N'IX_vSoaInvoiceLineRegularTaxBase_InvoiceId')
BEGIN
  CREATE NONCLUSTERED INDEX IX_vSoaInvoiceLineRegularTaxBase_InvoiceId ON [dbo].[vSoaInvoiceLineRegularTaxBase] (InvoiceId, LineNumber)
END
go


GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSoaInvoiceLineRegular]'))
    DROP VIEW [dbo].[vSoaInvoiceLineRegular]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE VIEW [dbo].[vSoaInvoiceLineRegular] 
AS
SELECT il.InvoiceLineId,
       il.InvoiceId ,
       il.LineNumber,
       il.ItemId,
       il.ShipToPartyId,
       il.Quantity,
       il.UnitPrice,
       il.ExtendedAmount,
       0 AS PaymentAdjustmentAmount,
       0 AS PendingPaymentAdjustmentAmount,
       il.[ExtendedAmount] AS Balance       
  FROM [dbo].[vSoaInvoiceLineRegularBase] il WITH (NOEXPAND)
UNION ALL
SELECT il.InvoiceLineId,
       il.InvoiceId,
       il.LineNumber,
       il.ItemId,
       il.ShipToPartyId,
       il.Quantity,
       il.UnitPrice,
       il.ExtendedAmount,
       0 AS PaymentAdjustmentAmount,
       0 AS PendingPaymentAdjustmentAmount,
       il.[ExtendedAmount] AS Balance
  FROM [dbo].[vSoaInvoiceLineRegularTaxBase] il WITH (NOEXPAND)
UNION ALL
SELECT il.InvoiceLineId,
       CAST(il.InvoiceId AS varchar(20)) AS InvoiceId,
       il.LineNumber,
       il.ItemId,
       il.ShipToPartyId,
       il.Quantity,
       il.UnitPrice,
       il.ExtendedAmount,
       0 AS PaymentAdjustmentAmount,
       0 AS PendingPaymentAdjustmentAmount,
       il.[ExtendedAmount] AS Balance
  FROM [dbo].[vSoaInvoiceLineRegularFreightBase] il WITH (NOEXPAND)
UNION ALL
SELECT il.InvoiceLineId,
       CAST(il.InvoiceId AS varchar(20)) AS InvoiceId,
       il.LineNumber,
       il.ItemId,
       il.ShipToPartyId,
       il.Quantity,
       il.UnitPrice,
       il.ExtendedAmount,
       0 AS PaymentAdjustmentAmount,
       0 AS PendingPaymentAdjustmentAmount,
       il.[ExtendedAmount] AS Balance
  FROM [dbo].[vSoaInvoiceLineRegularHandlingBase] il WITH (NOEXPAND)

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

------------------------------------------------------------------------------------------

CREATE VIEW [dbo].[vSoaInvoiceLine]
AS
SELECT InvoiceLineId,
       InvoiceId,
       LineNumber,
       ItemId,
       ShipToPartyId,
       Quantity,
       UnitPrice,
       ExtendedAmount,
       PaymentAdjustmentAmount,
       PendingPaymentAdjustmentAmount,
       Balance,
       BILL_DATE
  FROM [dbo].[vSoaInvoiceLineCash]
UNION ALL
SELECT InvoiceLineId,
       InvoiceId,
       LineNumber,
       ItemId,
       ShipToPartyId,
       Quantity,
       UnitPrice,
       ExtendedAmount,
       PaymentAdjustmentAmount,
       PendingPaymentAdjustmentAmount,
       Balance,
       BILL_DATE
  FROM [dbo].[vSoaInvoiceLineAR]       
 UNION ALL
SELECT InvoiceLineId,
       InvoiceId,
       LineNumber,
       ItemId,
       ShipToPartyId,
       Quantity,
       UnitPrice,
       ExtendedAmount,
       PaymentAdjustmentAmount,
       PendingPaymentAdjustmentAmount,
       Balance,
       NULL AS BILL_DATE
  FROM [dbo].[vSoaInvoiceLineRegular]

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
  (SELECT CONVERT(NVARCHAR(10),[ParameterValue]) FROM [SystemConfig] WHERE [ParameterName] = 'DefaultCurrencyCode' AND [SystemEntityKey] = (SELECT [SystemEntityKey] FROM [dbo].[SystemEntity] WHERE [SystemKeyword] = 'Organization')) AS [DefaultCurrencyCode],
  CASE WHEN [Name].[MEMBER_RECORD] = 1 THEN 'Member'
      ELSE 'Standard'
  END AS [PriceSheetName],
    CASE WHEN [Name].[MEMBER_RECORD] = 1 THEN 'Member pricing'
      ELSE 'Non-Member pricing'
  END AS [PriceSheetDescription]

FROM [Name];


GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSoaPartyEventAvailability]'))
    DROP VIEW [dbo].[vSoaPartyEventAvailability]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO


    CREATE
    VIEW [dbo].[vSoaPartyEventAvailability]  
    AS
    SELECT party.[ID] + ':' + eventSummary.[MEETING] AS [PartyEventAvailabilityId],
           party.[ID] AS [PartyId], 
           eventSummary.[MEETING] AS [EventId],
           eventSummary.[TOTAL_REGISTRANTS] as [RegistrationsCount],
           eventSummary.[TOTAL_CANCELATIONS] as [CancelationsCount],
           eventSummary.[WEB_VIEW_ONLY] AS [ViewOnly],
           eventSummary.[WEB_ENABLED] as [WebEnabled],
           eventSummary.[EMAIL_REGISTRATION] AS [EmailRegistration]
    FROM [dbo].[Name] party
         CROSS JOIN [dbo].[Meet_Master] eventSummary

GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSoaPartyEventRegistrantInfoBase]'))
    DROP VIEW [dbo].[vSoaPartyEventRegistrantInfoBase]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE
VIEW [dbo].[vSoaPartyEventRegistrantInfoBase]
AS WITH allRegistrations
       AS (
       SELECT o.[ST_ID] AS [PartyId],
              om.[MEETING] AS [EventId],
              o.[ORDER_NUMBER] AS [OrderNumber],
              o.[STATUS] AS RegistrationStatus,
              COALESCE(o.[UPDATED_DATE_TIME], o.[ORDER_DATE]) AS LastChangeDate,
              CAST((CASE WHEN o.[STATUS] = 'C'
                         THEN 0
                         ELSE 10
                    END) AS int) AS DisplayPriority
         FROM [dbo].[Order_Meet] AS om
              INNER JOIN [dbo].[Orders] AS o ON o.[ORDER_NUMBER] = om.[ORDER_NUMBER]
       ),
topRegistrations
       AS (
       SELECT ROW_NUMBER() OVER (PARTITION BY [PartyId],
                                              [EventId] ORDER BY [DisplayPriority]DESC, [LastChangeDate] DESC) AS [Relevance],
              [PartyId],
              [EventId],
              [OrderNumber]
         FROM allRegistrations AS a
       )
       SELECT [PartyId],
              [EventId],
              [OrderNumber]
         FROM topRegistrations
        WHERE [Relevance] = 1
     

GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSoaPartyEventRegistrantInfo]'))
    DROP VIEW [dbo].[vSoaPartyEventRegistrantInfo]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE
VIEW [dbo].[vSoaPartyEventRegistrantInfo]
AS
SELECT o.[ST_ID] as [PartyId], om.[MEETING] as [EventId], ob.[ORDER_NUMBER] as [OrderNumber],  
       ob.[TITLE] as [DisplayOrganizationTitle], ob.[COMPANY] as [DisplayOrganizationName], ob.[INFORMAL] as [DisplayName],
       ob.[PREFIX] as [NamePrefix], ob.[FIRST_NAME] as [FirstName], ob.[MIDDLE_NAME] as [MiddleName], ob.[LAST_NAME] as [LastName], 
       ob.[SUFFIX] as [NameSuffix], ob.[DESIGNATION] as [Designation], ob.[FULL_NAME] as [FullName], ob.[FULL_ADDRESS] as [FullAddress],
       ob.[ADDRESS_NUM] as [AddressId],
       ob.[ADDRESS_1] as [AddressLine1], ob.[ADDRESS_2] as [AddressLine2], ob.[ADDRESS_3] as [AddressLine3], 
       ob.[CITY] as [CityName], ob.[STATE_PROVINCE] as [CountrySubEntityCode], ob.[ZIP] as [PostalCode], ob.[COUNTRY] as [CountryName], 
       ob.[BAR_CODE] as [BarCode]
  FROM [dbo].[Order_Badge] ob 
    INNER JOIN [dbo].[Orders] o on o.[ORDER_NUMBER] = ob.[ORDER_NUMBER] 
    INNER JOIN [dbo].[Order_Meet] om on o.[ORDER_NUMBER]  = om.[ORDER_NUMBER]
    INNER JOIN [dbo].[vSoaPartyEventRegistrantInfoBase] rb ON o.[ST_ID] = rb.[PartyId] AND o.[ORDER_NUMBER] = rb.[OrderNumber]
WHERE ob.[BADGE_TYPE] = 'PRIMARY' or ob.[BADGE_TYPE] = 'GUEST'


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
        [Name].[MEMBER_TYPE] AS [CustomerTypeCode],
		(SELECT TOP 1 [ContactKey] FROM [dbo].[ContactMain] WHERE [dbo].[Name].[ID] = [dbo].[ContactMain].[ID]) AS [UniformId]
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
    n.[MEMBER_RECORD] as [NameIsMember],
    i.[RegistrantClassProcedure] as [RegistrantClassProcedure]
FROM [dbo].[vSoaPartySummary] p 
    INNER JOIN [dbo].[Name] n ON p.[Id] = n.[ID]
      CROSS JOIN [dbo].[vSoaItem] i

GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSoaPartyReference]'))
    DROP VIEW [dbo].[vSoaPartyReference]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vSoaPartyReference]
AS
SELECT dbo.ContactMain.ContactKey AS PartyId, 
	dbo.ContactMain.ContactStatusCode AS StatusCode, 
	dbo.ContactMain.FullName AS Name, 
	dbo.ContactMain.SortName AS Sort, 
	dbo.ContactMain.ID, 
    dbo.ContactStatusRef.ContactStatusCode AS PartyStatusId, 
	dbo.ContactStatusRef.ContactStatusDesc AS PartyStatusName, 
	dbo.ContactStatusRef.ContactStatusDesc AS PartyStatusDescription,
	CASE WHEN dbo.ContactMain.MarkedForDeleteOn IS NULL THEN CAST(0 AS BIT)
         ELSE CAST(1 AS BIT)
    END AS [IsMarkedForDelete]

FROM            dbo.ContactMain INNER JOIN
                         dbo.ContactStatusRef ON dbo.ContactMain.ContactStatusCode = dbo.ContactStatusRef.ContactStatusCode


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
SELECT 'BillMe' AS [PaymentMethodId], 'Pay Later' AS [Name], 'BillMe' as [PaymentType], 
       0 AS [CSCRequired], 0 AS [IssueNumberRequired], 0 AS [IssueDateRequired], 'You will be billed for the balance due' AS [Message]
UNION ALL
SELECT CASH_ACCOUNT_CODE AS [PaymentMethodId], 
       [DESCRIPTION] AS [Name], 
       CASE WHEN [ACCOUNT_TYPE] = 0 THEN 'Cash'
            WHEN [ACCOUNT_TYPE] = 1 THEN 'CreditCard'
            WHEN [ACCOUNT_TYPE] = 2 THEN 'Other'
            WHEN [ACCOUNT_TYPE] = 3 THEN 'DebitCard'
            WHEN [ACCOUNT_TYPE] = 4 THEN 'Service'
            ELSE 'Cash'
       END AS [PaymentType],
       CAST ([CSC_REQUIRED_WEB] AS BIT) AS [CSCRequired],
       CAST ([ISSUE_NO_FLAG] AS BIT) AS [IssueNumberRequired],
       CAST ([ISSUE_DATE_FLAG] AS BIT) AS [IssueDateRequired], 
       CASE WHEN [ACCOUNT_TYPE] = 0 THEN 'Cash'
            ELSE [DESCRIPTION]
       END AS [Message]
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
(SELECT CONVERT(NVARCHAR(10),[ParameterValue]) FROM [SystemConfig] WHERE [ParameterName] = 'DefaultCurrencyCode' AND [SystemEntityKey] = (SELECT [SystemEntityKey] FROM [dbo].[SystemEntity] WHERE [SystemKeyword] = 'Organization')) AS [DefaultCurrencyCode]
FROM [UserMain] 
LEFT OUTER JOIN [Users] ON [UserMain].[UserId] = [Users].[UserId]
WHERE [UserMain].[ContactMaster] != '';



GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vSoaUserReference]'))
    DROP VIEW [dbo].[vSoaUserReference]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE VIEW [dbo].[vSoaUserReference]
AS 
    SELECT [UserKey] AS [UserId],
          [UserId] AS [Name]
    FROM  [dbo].[UserMain]

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


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vUDBOCsName_Staff]'))
    DROP VIEW [dbo].[vUDBOCsName_Staff]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE VIEW [dbo].[vUDBOCsName_Staff]
AS
SELECT s.RowID AS [ContactKey],
       MAX(CASE WHEN s.PropertyName = 'HoursPerWeek' THEN s.PropertyIntValue ELSE NULL END) AS [HoursPerWeek],
       CAST(MAX(CASE WHEN s.PropertyName = 'Title' THEN s.PropertyStringValue ELSE NULL END) AS nvarchar(80)) AS [Title],
       CAST(MAX(CASE WHEN s.PropertyName = 'IsVolunteer' THEN CAST(s.PropertyBooleanValue AS int) ELSE NULL END) AS bit) AS [IsVolunteer],
       CAST(MAX(CASE WHEN s.PropertyName = 'IsSalesman' THEN CAST(s.PropertyBooleanValue AS int) ELSE NULL END) AS bit) AS [IsSalesman],
       CAST(MAX(CASE WHEN s.PropertyName = 'Description' THEN s.PropertyStringValue ELSE NULL END) AS nvarchar(80)) AS [Description]
  FROM [dbo].[UserDefinedSingleInstanceProperty] s
 WHERE s.TableName = 'CsName_Staff'
 GROUP BY s.RowID

GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vUserDefinedDynamicBusinessObjectSources]'))
    DROP VIEW [dbo].[vUserDefinedDynamicBusinessObjectSources]
GO

SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

CREATE VIEW [dbo].[vUserDefinedDynamicBusinessObjectSources]
AS
SELECT ObjectName, IsMultiInstance
  FROM ObjectMetaData
 WHERE IsUserDefined = 1
UNION
SELECT TABLE_NAME, ALLOW_MULTIPLE_INSTANCES
  FROM UD_Table


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

