
SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[AccessArea]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[AccessArea] (
    [AccessAreaKey] uniqueidentifier NOT NULL CONSTRAINT [DF_AccessArea_AccessAreaKey] DEFAULT (newid()),
    [Name] nvarchar(50) NOT NULL CONSTRAINT [DF_AccessArea_Name] DEFAULT (''),
    [Description] nvarchar(250) NOT NULL CONSTRAINT [DF_AccessArea_Description] DEFAULT (''),
    [IsSystem] bit NOT NULL CONSTRAINT [DF_AccessArea_IsSystem] DEFAULT (0),
    [ProtectedAccessKey] uniqueidentifier NOT NULL,
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [UpdatedOn] datetime NOT NULL CONSTRAINT [DF_AccessArea_UpdatedOn] DEFAULT (getdate()),
    [IsSharedACLOnly] bit NULL CONSTRAINT [DF_AccessArea_IsSharedACLOnly] DEFAULT (0),
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedOn] datetime NOT NULL,
    [MarkedForDeleteOn] datetime NULL,
    [IsContentACL] bit NOT NULL CONSTRAINT [DF_AccessArea_IsContentACL] DEFAULT (0)
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[AccessItem]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[AccessItem] (
    [AccessKey] uniqueidentifier NOT NULL,
    [Grantee] uniqueidentifier NOT NULL,
    [Permission] int NOT NULL CONSTRAINT [DF_AccessItem_Permission] DEFAULT (0),
    [GroupKey] uniqueidentifier NULL,
    [RoleKey] uniqueidentifier NULL,
    [UserKey] uniqueidentifier NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[AccessMain]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[AccessMain] (
    [AccessKey] uniqueidentifier NOT NULL CONSTRAINT [DF_AccessMain_AccessKey] DEFAULT (newid()),
    [AccessScope] nvarchar(20) NOT NULL CONSTRAINT [DF_AccessMain_AccessScope] DEFAULT ('Local'),
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedOn] datetime NOT NULL CONSTRAINT [DF_AccessMain_CreatedOn] DEFAULT (getdate()),
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [UpdatedOn] datetime NOT NULL CONSTRAINT [DF_AccessMain_UpdatedOn] DEFAULT (getdate()),
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[AccountingMethodRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[AccountingMethodRef] (
    [AccountingMethodCode] nchar(1) NOT NULL,
    [AccountMethodDesc] nvarchar(50) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[AccountPending]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[AccountPending] (
    [AccountPendingID] int IDENTITY(1,1) NOT NULL,
    [Username] varchar(60) NULL,
    [Password] varchar(32) NULL,
    [Prefix] varchar(25) NULL,
    [FirstName] varchar(20) NOT NULL,
    [MiddleName] varchar(20) NULL,
    [LastName] varchar(30) NOT NULL,
    [Suffix] varchar(10) NULL,
    [Designation] varchar(32) NULL,
    [Informal] varchar(20) NULL,
    [Title] varchar(80) NULL,
    [Organization] varchar(80) NULL,
    [Address1] varchar(40) NOT NULL,
    [Address2] varchar(40) NULL,
    [Address3] varchar(40) NULL,
    [County] varchar(25) NULL,
    [City] varchar(40) NOT NULL,
    [StateProvince] varchar(15) NOT NULL,
    [PostalCode] varchar(10) NOT NULL,
    [Country] varchar(25) NOT NULL,
    [AddressPurpose] varchar(20) NULL,
    [Email] varchar(100) NOT NULL,
    [Website] varchar(255) NULL,
    [WorkPhone] varchar(25) NULL,
    [HomePhone] varchar(25) NULL,
    [TollFree] varchar(25) NULL,
    [Fax] varchar(25) NULL,
    [BirthDate] datetime NULL,
    [Gender] varchar(8) NULL,
    [SICCode] varchar(10) NULL,
    [ExcludeDirectory] bit NULL,
    [ExcludeMail] bit NULL,
    [RecordAdded] int NOT NULL,
    [UserDefinedField] text NULL,
    [MemberType] varchar(5) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[AclPermissionTypeRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[AclPermissionTypeRef] (
    [AclPermissionTypeCode] int NOT NULL,
    [AclPermissionTypeName] nvarchar(40) NOT NULL,
    [AclPermissionTypeDesc] nvarchar(50) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[ActionPlan]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ActionPlan] (
    [ActionPlanKey] uniqueidentifier NOT NULL CONSTRAINT [DF_ActionPlan_ActionPlanKey] DEFAULT (newid()),
    [Name] nvarchar(50) NOT NULL,
    [Description] nvarchar(200) NULL,
    [ActionManifest] ntext NULL,
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [UpdatedOn] datetime NOT NULL,
    [OpportunityTypeKey] uniqueidentifier NULL,
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedOn] datetime NOT NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Activity]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Activity] (
    [SEQN] int NOT NULL CONSTRAINT [DF_Activity_SEQN] DEFAULT (0),
    [ID] varchar(10) NOT NULL CONSTRAINT [DF_Activity_ID] DEFAULT (''),
    [ACTIVITY_TYPE] varchar(10) NOT NULL CONSTRAINT [DF_Activity_ACTIVITY_TYPE] DEFAULT (''),
    [TRANSACTION_DATE] datetime NULL,
    [EFFECTIVE_DATE] datetime NULL,
    [PRODUCT_CODE] varchar(31) NOT NULL CONSTRAINT [DF_Activity_PRODUCT_CODE] DEFAULT (''),
    [OTHER_CODE] varchar(30) NOT NULL CONSTRAINT [DF_Activity_OTHER_CODE] DEFAULT (''),
    [DESCRIPTION] varchar(255) NOT NULL CONSTRAINT [DF_Activity_DESCRIPTION] DEFAULT (''),
    [SOURCE_SYSTEM] varchar(10) NOT NULL CONSTRAINT [DF_Activity_SOURCE_SYSTEM] DEFAULT (''),
    [SOURCE_CODE] varchar(40) NOT NULL CONSTRAINT [DF_Activity_SOURCE_CODE] DEFAULT (''),
    [QUANTITY] numeric(15, 2) NOT NULL CONSTRAINT [DF_Activity_QUANTITY] DEFAULT (0),
    [AMOUNT] money NOT NULL CONSTRAINT [DF_Activity_AMOUNT] DEFAULT (0),
    [CATEGORY] varchar(15) NOT NULL CONSTRAINT [DF_Activity_CATEGORY] DEFAULT (''),
    [UNITS] numeric(15, 2) NOT NULL CONSTRAINT [DF_Activity_UNITS] DEFAULT (0),
    [THRU_DATE] datetime NULL,
    [MEMBER_TYPE] varchar(5) NOT NULL CONSTRAINT [DF_Activity_MEMBER_TYPE] DEFAULT (''),
    [ACTION_CODES] varchar(255) NOT NULL CONSTRAINT [DF_Activity_ACTION_CODES] DEFAULT (''),
    [PAY_METHOD] varchar(50) NOT NULL CONSTRAINT [DF_Activity_PAY_METHOD] DEFAULT (''),
    [TICKLER_DATE] datetime NULL,
    [NOTE] text NULL,
    [NOTE_2] text NULL,
    [BATCH_NUM] varchar(15) NOT NULL CONSTRAINT [DF_Activity_BATCH_NUM] DEFAULT (''),
    [CO_ID] varchar(10) NOT NULL CONSTRAINT [DF_Activity_CO_ID] DEFAULT (''),
    [OBJECT] image NULL,
    [INTENT_TO_EDIT] varchar(80) NOT NULL CONSTRAINT [DF_Activity_INTENT_TO_EDIT] DEFAULT (''),
    [UF_1] varchar(255) NOT NULL CONSTRAINT [DF_Activity_UF_1] DEFAULT (''),
    [UF_2] varchar(255) NOT NULL CONSTRAINT [DF_Activity_UF_2] DEFAULT (''),
    [UF_3] varchar(255) NOT NULL CONSTRAINT [DF_Activity_UF_3] DEFAULT (''),
    [UF_4] numeric(15, 4) NOT NULL CONSTRAINT [DF_Activity_UF_4] DEFAULT (0),
    [UF_5] numeric(15, 4) NOT NULL CONSTRAINT [DF_Activity_UF_5] DEFAULT (0),
    [UF_6] datetime NULL,
    [UF_7] datetime NULL,
    [ORIGINATING_TRANS_NUM] int NOT NULL CONSTRAINT [DF_Activity_ORIGINATING_TRANS_NUM] DEFAULT (0),
    [ORG_CODE] varchar(5) NOT NULL CONSTRAINT [DF_Activity_ORG_CODE] DEFAULT (''),
    [CAMPAIGN_CODE] varchar(10) NOT NULL CONSTRAINT [DF_Activity_CAMPAIGN_CODE] DEFAULT (''),
    [OTHER_ID] varchar(10) NOT NULL CONSTRAINT [DF_Activity_OTHER_ID] DEFAULT (''),
    [SOLICITOR_ID] varchar(10) NOT NULL CONSTRAINT [DF_Activity_SOLICITOR_ID] DEFAULT (''),
    [TAXABLE_VALUE] money NOT NULL CONSTRAINT [DF_Activity_TAXABLE_VALUE] DEFAULT (0),
    [ATTACH_SEQN] int NOT NULL CONSTRAINT [DF_Activity_ATTACH_SEQN] DEFAULT (0),
    [ATTACH_TOTAL] int NOT NULL CONSTRAINT [DF_Activity_ATTACH_TOTAL] DEFAULT (0),
    [RECURRING_REQUEST] bit NOT NULL CONSTRAINT [DF_Activity_RECURRING_REQUEST] DEFAULT (0),
    [STATUS_CODE] varchar(1) NULL,
    [NEXT_INSTALL_DATE] datetime NULL,
    [GRACE_PERIOD] int NULL,
    [MEM_TRIB_CODE] varchar(10) NOT NULL CONSTRAINT [DF_Activity_MEM_TRIB_CODE] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Activity_Attach]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Activity_Attach] (
    [ATTACH_SEQN] int NOT NULL CONSTRAINT [DF_Activity_Attach_ATTACH_SEQN] DEFAULT (0),
    [TEMPLATE] varchar(255) NOT NULL CONSTRAINT [DF_Activity_Attach_TEMPLATE] DEFAULT (''),
    [ATTACH_TEXT] text NOT NULL CONSTRAINT [DF_Activity_Attach_ATTACH_TEXT] DEFAULT (''),
    [ACTIVITY_SEQN] int NOT NULL CONSTRAINT [DF_Activity_Attach_ACTIVITY_SEQN] DEFAULT (0),
    [FILE_NAME] varchar(255) NOT NULL CONSTRAINT [DF_Activity_Attach_FILE_NAME] DEFAULT (''),
    [FILE_TIMESTAMP] datetime NULL,
    [INTENT_TO_EDIT] varchar(80) NOT NULL CONSTRAINT [DF_Activity_Attach_INTENT_TO_EDIT] DEFAULT (''),
    [ATTACH_IMAGE] image NULL,
    [READ_ONLY] bit NOT NULL CONSTRAINT [DF_Activity_Attach_READ_ONLY] DEFAULT (0),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Activity_tmpID]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Activity_tmpID] (
    [ID_COL] varchar(10) NOT NULL CONSTRAINT [DF_Activity_tmpID_ID_COL] DEFAULT (''),
    [UserID_Date] varchar(50) NOT NULL CONSTRAINT [DF_Activity_tmpID_UserID_Date] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[ActivityImporter]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ActivityImporter] (
    [SEQN] int NOT NULL CONSTRAINT [DF_ActivityImporter_SEQN] DEFAULT (0),
    [ID] varchar(10) NOT NULL CONSTRAINT [DF_ActivityImporter_ID] DEFAULT (''),
    [ACTIVITY_TYPE] varchar(10) NOT NULL CONSTRAINT [DF_ActivityImporter_ACTIVITY_TYPE] DEFAULT (''),
    [TRANSACTION_DATE] datetime NULL,
    [EFFECTIVE_DATE] datetime NULL,
    [PRODUCT_CODE] varchar(31) NOT NULL CONSTRAINT [DF_ActivityImporter_PRODUCT_CODE] DEFAULT (''),
    [OTHER_CODE] varchar(30) NOT NULL CONSTRAINT [DF_ActivityImporter_OTHER_CODE] DEFAULT (''),
    [DESCRIPTION] varchar(255) NOT NULL CONSTRAINT [DF_ActivityImporter_DESCRIPTION] DEFAULT (''),
    [SOURCE_SYSTEM] varchar(10) NOT NULL CONSTRAINT [DF_ActivityImporter_SOURCE_SYSTEM] DEFAULT (''),
    [SOURCE_CODE] varchar(40) NOT NULL CONSTRAINT [DF_ActivityImporter_SOURCE_CODE] DEFAULT (''),
    [QUANTITY] numeric(15, 2) NOT NULL CONSTRAINT [DF_ActivityImporter_QUANTITY] DEFAULT (0),
    [AMOUNT] money NOT NULL CONSTRAINT [DF_ActivityImporter_AMOUNT] DEFAULT (0),
    [CATEGORY] varchar(15) NOT NULL CONSTRAINT [DF_ActivityImporter_CATEGORY] DEFAULT (''),
    [UNITS] numeric(15, 2) NOT NULL CONSTRAINT [DF_ActivityImporter_UNITS] DEFAULT (0),
    [THRU_DATE] datetime NULL,
    [MEMBER_TYPE] varchar(5) NOT NULL CONSTRAINT [DF_ActivityImporter_MEMBER_TYPE] DEFAULT (''),
    [ACTION_CODES] varchar(40) NOT NULL CONSTRAINT [DF_ActivityImporter_ACTION_CODES] DEFAULT (''),
    [PAY_METHOD] varchar(50) NOT NULL CONSTRAINT [DF_ActivityImporter_PAY_METHOD] DEFAULT (''),
    [TICKLER_DATE] datetime NULL,
    [BATCH_NUM] varchar(15) NOT NULL CONSTRAINT [DF_ActivityImporter_BATCH_NUM] DEFAULT (''),
    [CO_ID] varchar(10) NOT NULL CONSTRAINT [DF_ActivityImporter_CO_ID] DEFAULT (''),
    [UF_1] varchar(255) NOT NULL CONSTRAINT [DF_ActivityImporter_UF_1] DEFAULT (''),
    [UF_2] varchar(255) NOT NULL CONSTRAINT [DF_ActivityImporter_UF_2] DEFAULT (''),
    [UF_3] varchar(255) NOT NULL CONSTRAINT [DF_ActivityImporter_UF_3] DEFAULT (''),
    [UF_4] numeric(15, 4) NOT NULL CONSTRAINT [DF_ActivityImporter_UF_4] DEFAULT (0),
    [UF_5] numeric(15, 4) NOT NULL CONSTRAINT [DF_ActivityImporter_UF_5] DEFAULT (0),
    [UF_6] datetime NULL,
    [UF_7] datetime NULL,
    [ORIGINATING_TRANS_NUM] int NOT NULL CONSTRAINT [DF_ActivityImporter_ORIGINATING_TRANS_NUM] DEFAULT (0),
    [ORG_CODE] varchar(5) NOT NULL CONSTRAINT [DF_ActivityImporter_ORG_CODE] DEFAULT (''),
    [CAMPAIGN_CODE] varchar(10) NOT NULL CONSTRAINT [DF_ActivityImporter_CAMPAIGN_CODE] DEFAULT (''),
    [OTHER_ID] varchar(10) NOT NULL CONSTRAINT [DF_ActivityImporter_OTHER_ID] DEFAULT (''),
    [SOLICITOR_ID] varchar(10) NOT NULL CONSTRAINT [DF_ActivityImporter_SOLICITOR_ID] DEFAULT (''),
    [TAXABLE_VALUE] money NOT NULL CONSTRAINT [DF_ActivityImporter_TAXABLE_VALUE] DEFAULT (0),
    [UserID_Date] varchar(50) NOT NULL CONSTRAINT [DF_ActivityImporter_UserID_Date] DEFAULT (''),
    [RECURRING_REQUEST] bit NOT NULL CONSTRAINT [DF_ActivityImporter_RECURRING_REQUEST] DEFAULT (0),
    [STATUS_CODE] varchar(1) NOT NULL CONSTRAINT [DF_ActivityImporter_STATUS_CODE] DEFAULT (''),
    [NEXT_INSTALL_DATE] datetime NULL,
    [NOTE] text NULL,
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[AddressCategoryPreferences]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[AddressCategoryPreferences] (
    [ContactKey] uniqueidentifier NOT NULL,
    [AddressCategoryCode] int NOT NULL,
    [NoSolicitationFlag] bit NOT NULL,
    [OptOutFlag] bit NOT NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[AddressCategoryRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[AddressCategoryRef] (
    [AddressCategoryCode] int NOT NULL,
    [AddressCategoryDesc] nvarchar(50) NOT NULL,
    [IsPhysicalAddress] bit NOT NULL,
    [AddressCategoryName] nvarchar(20) NOT NULL,
    [FormatMask] nvarchar(255) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[AddressFormatRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[AddressFormatRef] (
    [AddressFormatKey] uniqueidentifier NOT NULL,
    [AddressFormatDesc] nvarchar(60) NOT NULL,
    [Formula] nvarchar(255) NOT NULL,
    [Description] nvarchar(255) NULL,
    [IsHandModified] bit NOT NULL CONSTRAINT [DF_AddressFormatRef_IsHandModified] DEFAULT (0),
    [UpdatedOn] datetime NOT NULL CONSTRAINT [DF_AddressFormatRef_UpdatedOn] DEFAULT (getdate()),
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [IsSystemDefault] bit NOT NULL CONSTRAINT [DF_AddressFormatRef_IsSystemDefault] DEFAULT (0),
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedOn] datetime NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[AddressMain]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[AddressMain] (
    [AddressKey] uniqueidentifier NOT NULL,
    [IsPhysicalAddress] bit NOT NULL,
    [AddressStatusCode] nchar(1) NOT NULL,
    [FormattedAddress] nvarchar(300) NOT NULL,
    [LastVerifiedOn] datetime NULL,
    [BadAddressReasonKey] uniqueidentifier NULL,
    [UpdatedOn] datetime NOT NULL,
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedOn] datetime NOT NULL,
    [SystemEntityKey] uniqueidentifier NOT NULL,
    [AddressCategoryCode] int NOT NULL CONSTRAINT [DF_AddressMain_AddressCategoryCode] DEFAULT (0),
    [OwnerContactKey] uniqueidentifier NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[AddressPurposeContactType]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[AddressPurposeContactType] (
    [AddressPurposeContactTypeKey] uniqueidentifier NOT NULL,
    [AddressPurposeKey] uniqueidentifier NOT NULL,
    [ContactTypeKey] uniqueidentifier NOT NULL,
    [IsSingleUse] bit NOT NULL,
    [DisplayOrder] smallint NOT NULL,
    [IsAddressRequired] bit NOT NULL,
    [IsPhoneRequired] bit NOT NULL,
    [IsFaxRequired] bit NOT NULL,
    [IsEmailRequired] bit NOT NULL,
    [AlwaysDisplayFlag] bit NOT NULL CONSTRAINT [DF_AddressPurposeContactType_AlwaysDisplayFlag] DEFAULT (0),
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[AddressPurposeRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[AddressPurposeRef] (
    [AddressPurposeKey] uniqueidentifier NOT NULL,
    [AddressPurposeDesc] nvarchar(20) NOT NULL,
    [IsSystem] bit NOT NULL,
    [UpdatedOn] datetime NOT NULL,
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [IsActive] bit NOT NULL,
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedOn] datetime NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[AddressStatusRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[AddressStatusRef] (
    [AddressStatusCode] nchar(1) NOT NULL,
    [AddressStatusDesc] nvarchar(50) NOT NULL,
    [IsSystem] bit NOT NULL CONSTRAINT [DF_AddressStatusRef_IsSystem] DEFAULT (0)
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[AddressToUse]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[AddressToUse] (
    [ContactKey] uniqueidentifier NOT NULL,
    [CommunicationReasonKey] uniqueidentifier NOT NULL,
    [FullAddressKey] uniqueidentifier NOT NULL,
    [SeasonalRevertFullAddressKey] uniqueidentifier NULL,
    [FullAddressText] nvarchar(1000) NULL,
    [IsOverridden] bit NOT NULL CONSTRAINT [DF_AddressToUse_IsOverridden] DEFAULT (0),
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[AddressTypeRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[AddressTypeRef] (
    [AddressTypeKey] uniqueidentifier NOT NULL,
    [AddressTypeName] nvarchar(20) NOT NULL,
    [IsSystem] bit NOT NULL CONSTRAINT [DF_AddressTypeRef_IsSystem] DEFAULT (0),
    [IsActive] bit NOT NULL,
    [DisplayOrder] smallint NOT NULL,
    [AddressCategoryCode] int NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Admin_Section_Ref]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Admin_Section_Ref] (
    [AdminSectionCode] varchar(255) NOT NULL,
    [AdminSectionDesc] varchar(255) NOT NULL,
    [WorkflowTaggingInd] char(1) NULL,
    [ComponentCode] char(2) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Admin_Security]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Admin_Security] (
    [ContactID] numeric(18, 0) NOT NULL,
    [AdminSectionCode] varchar(255) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Admin_Security_Log]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Admin_Security_Log] (
    [ContactID] numeric(18, 0) NULL,
    [AdminSectionCode] varchar(255) NULL,
    [AccessDateTime] datetime NOT NULL,
    [IPAddress] varchar(15) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Affect_Cert_Register_ie]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Affect_Cert_Register_ie] (
    [SEQN] int NOT NULL CONSTRAINT [DF_Affect_Cert_Register_ie_SEQN] DEFAULT (0),
    [STUDENT_ID] varchar(10) NOT NULL CONSTRAINT [DF_Affect_Cert_Register_ie_STUDENT_ID] DEFAULT (''),
    [BT_ID] varchar(10) NOT NULL CONSTRAINT [DF_Affect_Cert_Register_ie_BT_ID] DEFAULT ('')
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Affect_Name_Fin_ie]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Affect_Name_Fin_ie] (
    [ID] varchar(10) NOT NULL CONSTRAINT [DF_Affect_Name_Fin_ie_ID] DEFAULT (''),
    [BT_ID] varchar(10) NOT NULL CONSTRAINT [DF_Affect_Name_Fin_ie_BT_ID] DEFAULT ('')
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Affect_Name_ie]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Affect_Name_ie] (
    [ID] varchar(10) NOT NULL CONSTRAINT [DF_Affect_Name_ie_ID] DEFAULT (''),
    [CO_ID] varchar(10) NOT NULL CONSTRAINT [DF_Affect_Name_ie_CO_ID] DEFAULT (''),
    [BT_ID] varchar(10) NOT NULL CONSTRAINT [DF_Affect_Name_ie_BT_ID] DEFAULT ('')
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Appeal]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Appeal] (
    [APPEAL_CODE] varchar(40) NOT NULL CONSTRAINT [DF_Appeal_APPEAL_CODE] DEFAULT (''),
    [TITLE] varchar(60) NULL,
    [DESCRIPTION] varchar(255) NULL,
    [CAMPAIGN_CODE] varchar(10) NOT NULL CONSTRAINT [DF_Appeal_CAMPAIGN_CODE] DEFAULT (''),
    [FUND] varchar(5) NOT NULL CONSTRAINT [DF_Appeal_FUND] DEFAULT (''),
    [GOAL] numeric(15, 2) NOT NULL CONSTRAINT [DF_Appeal_GOAL] DEFAULT (0),
    [BEGINS_DATE] datetime NULL,
    [ENDS_DATE] datetime NULL,
    [IS_PERPETUAL] tinyint NOT NULL CONSTRAINT [DF_Appeal_IS_PERPETUAL] DEFAULT (0),
    [APPEAL_TYPE] varchar(10) NOT NULL CONSTRAINT [DF_Appeal_APPEAL_TYPE] DEFAULT (''),
    [QUANTITY_DROPPED] int NULL,
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Appeal_Premiums]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Appeal_Premiums] (
    [APPEAL_CODE] varchar(40) NOT NULL CONSTRAINT [DF_Appeal_Premiums_APPEAL_CODE] DEFAULT (''),
    [PRODUCT_CODE] varchar(31) NULL,
    [AUTO_ASSIGN_TO_GIFT] bit NULL CONSTRAINT [DF_Appeal_Premiums_AUTO_ASSIGN_TO_GIFT] DEFAULT (0),
    [MIN_GIFT_AMOUNT] numeric(15, 2) NULL,
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[AppealMain]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[AppealMain] (
    [AppealKey] uniqueidentifier NOT NULL,
    [Name] nvarchar(50) NOT NULL CONSTRAINT [DF_AppealMain_Name] DEFAULT (''),
    [Description] nvarchar(200) NULL CONSTRAINT [DF_AppealMain_Description] DEFAULT (''),
    [AppealStatusCode] int NOT NULL CONSTRAINT [DF_AppealMain_AppealStatusCode] DEFAULT (0),
    [CostCollection] ntext NULL,
    [TotalRevenue] decimal(18, 4) NOT NULL CONSTRAINT [DF_AppealMain_TotalRevenue] DEFAULT (0),
    [TargetRevenue] decimal(18, 4) NOT NULL CONSTRAINT [DF_AppealMain_TargetRevenue] DEFAULT (0),
    [PredictedResponseRate] decimal(5, 4) NOT NULL CONSTRAINT [DF_AppealMain_PredictedResponseRate] DEFAULT (0),
    [StartDate] datetime NULL,
    [EndDate] datetime NULL,
    [UpdatedOn] datetime NOT NULL,
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [LowResponseAmount] decimal(18, 4) NOT NULL CONSTRAINT [DF_AppealMain_LowResponseAmount] DEFAULT (0),
    [HighResponseAmount] decimal(18, 4) NOT NULL CONSTRAINT [DF_AppealMain_HighResponseAmount] DEFAULT (0),
    [ActualCost] decimal(18, 4) NOT NULL CONSTRAINT [DF_AppealMain_ActualCost] DEFAULT (0),
    [EstimatedCost] decimal(18, 4) NOT NULL CONSTRAINT [DF_AppealMain_EstimatedCost] DEFAULT (0),
    [ExtendedCost] decimal(18, 4) NOT NULL CONSTRAINT [DF_AppealMain_ExtendedCost] DEFAULT (0),
    [OverheadCost] decimal(18, 4) NOT NULL CONSTRAINT [DF_AppealMain_OverheadCost] DEFAULT (0),
    [FirstResponseDate] datetime NULL,
    [LastResponseDate] datetime NULL,
    [TotalPositiveResponse] int NOT NULL CONSTRAINT [DF_AppealMain_TotalPositiveResponse] DEFAULT (0),
    [TotalNegativeResponse] int NOT NULL CONSTRAINT [DF_AppealMain_TotalNegativeResponse] DEFAULT (0),
    [TotalSolicited] int NOT NULL CONSTRAINT [DF_AppealMain_TotalSolicited] DEFAULT (0),
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedOn] datetime NOT NULL,
    [AccessKey] uniqueidentifier NOT NULL,
    [CampaignKey] uniqueidentifier NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[AppealParticipation]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[AppealParticipation] (
    [AppealParticipationKey] uniqueidentifier NOT NULL,
    [AppealKey] uniqueidentifier NOT NULL,
    [RespondentUserKey] uniqueidentifier NOT NULL,
    [SolicitationKey] uniqueidentifier NOT NULL,
    [ResponseTypeCode] int NOT NULL,
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedOn] datetime NULL,
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [UpdatedOn] datetime NOT NULL,
    [SourceCodeKey] uniqueidentifier NOT NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[AppealProduct]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[AppealProduct] (
    [AppealProductKey] uniqueidentifier NOT NULL,
    [AppealKey] uniqueidentifier NOT NULL,
    [ProductCode] nvarchar(31) NOT NULL,
    [MarkedForDeleteOn] datetime NULL,
    [ProductKey] uniqueidentifier NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[AppealStatusRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[AppealStatusRef] (
    [AppealStatusCode] int NOT NULL,
    [AppealStatusDesc] nvarchar(50) NOT NULL,
    [AppealStatusName] nvarchar(20) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[AsiGPSData]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[AsiGPSData] (
    [PeriodBegin] datetime NOT NULL,
    [PeriodEnd] datetime NOT NULL,
    [TotalMembers] int NOT NULL,
    [Recruit1] decimal(18, 9) NULL,
    [Recruit2] decimal(18, 9) NULL,
    [Recruit3] decimal(18, 9) NULL,
    [Engage1] decimal(18, 9) NULL,
    [Engage2] decimal(18, 9) NULL,
    [Engage3] decimal(18, 9) NULL,
    [Engage4] decimal(18, 9) NULL,
    [Engage5] decimal(18, 9) NULL,
    [Engage6] decimal(18, 9) NULL,
    [Grow1] decimal(18, 9) NULL,
    [Grow2] decimal(18, 9) NULL,
    [Grow3] decimal(18, 9) NULL,
    [Grow4] decimal(18, 9) NULL,
    [IndexRecruit] decimal(18, 9) NULL,
    [IndexEngage] decimal(18, 9) NULL,
    [IndexGrowth] decimal(18, 9) NULL,
    [IndexOverallPerformance] decimal(18, 9) NULL,
    [RunDate] datetime NOT NULL,
    [SerialNo] varchar(255) NULL,
    [RowType] varchar(20) NULL,
    [TotalRevenue] decimal(18, 9) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[AsiGPSMeasureRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[AsiGPSMeasureRef] (
    [AsiGPSMeasureKey] uniqueidentifier NOT NULL,
    [AsiGPSMeasureType] nvarchar(50) NOT NULL,
    [AsiGPSMeasureName] nvarchar(50) NOT NULL,
    [AsiGPSMeasureDesc] nvarchar(100) NOT NULL,
    [AsiGPSMeasureParameter] nvarchar(50) NOT NULL,
    [IsSystem] bit NOT NULL CONSTRAINT [DF_AsiGPSMeasureRef_IsSystem] DEFAULT (0),
    [IsActive] bit NOT NULL CONSTRAINT [DF_AsiGPSMeasureRef_IsActive] DEFAULT (0),
    [DisplayOrder] smallint NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[AsiGPSPivotData]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[AsiGPSPivotData] (
    [PeriodBegin] datetime NOT NULL,
    [PeriodEnd] datetime NOT NULL,
    [TotalMembers] int NOT NULL,
    [DataYear] int NOT NULL,
    [ReportLabel] varchar(40) NOT NULL,
    [Dimension] varchar(40) NOT NULL,
    [Ordinal] int NOT NULL,
    [MeasureName] varchar(30) NOT NULL,
    [MeasureValue] decimal(18, 9) NULL,
    [RunDate] datetime NOT NULL,
    [SerialNo] varchar(255) NULL,
    [RowType] varchar(20) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[AsiNrdsAssociation]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[AsiNrdsAssociation] (
    [ID] varchar(10) NOT NULL CONSTRAINT [DF_AsiNrdsAssociation_ID] DEFAULT (''),
    [AssociationId] varchar(4) NOT NULL CONSTRAINT [DF_AsiNrdsAssociation_AssociationId] DEFAULT (''),
    [AssociationName] varchar(60) NOT NULL CONSTRAINT [DF_AsiNrdsAssociation_AssociationName] DEFAULT (''),
    [AssociationType] varchar(1) NOT NULL CONSTRAINT [DF_AsiNrdsAssociation_AssociationType] DEFAULT (''),
    [CLPresidentId] varchar(9) NOT NULL CONSTRAINT [DF_AsiNrdsAssociation_CLPresidentId] DEFAULT (''),
    [CLPresidentElectId] varchar(9) NOT NULL CONSTRAINT [DF_AsiNrdsAssociation_CLPresidentElectId] DEFAULT (''),
    [CLSecretaryId] varchar(9) NOT NULL CONSTRAINT [DF_AsiNrdsAssociation_CLSecretaryId] DEFAULT (''),
    [CLTreasurerId] varchar(9) NOT NULL CONSTRAINT [DF_AsiNrdsAssociation_CLTreasurerId] DEFAULT (''),
    [ElectionMonth] varchar(2) NOT NULL CONSTRAINT [DF__AsiNrdsAs__Elect__0D357924] DEFAULT (''),
    [Email] varchar(80) NOT NULL CONSTRAINT [DF_AsiNrdsAssociation_Email] DEFAULT (''),
    [EOFaxAreaCode] varchar(3) NOT NULL CONSTRAINT [DF_AsiNrdsAssociation_EOFaxAreaCode] DEFAULT (''),
    [EOFaxNumber] varchar(7) NOT NULL CONSTRAINT [DF_AsiNrdsAssociation_EOFaxNumber] DEFAULT (''),
    [EOFullName] varchar(30) NOT NULL CONSTRAINT [DF_AsiNrdsAssociation_EOFullName] DEFAULT (''),
    [ExecutiveOfficerId] varchar(9) NOT NULL CONSTRAINT [DF_AsiNrdsAssociation_ExecutiveOfficerId] DEFAULT (''),
    [FaxAreaCode] varchar(3) NOT NULL CONSTRAINT [DF_AsiNrdsAssociation_FaxAreaCode] DEFAULT (''),
    [FaxNumber] varchar(7) NOT NULL CONSTRAINT [DF_AsiNrdsAssociation_FaxNumber] DEFAULT (''),
    [FLPresidentId] varchar(9) NOT NULL CONSTRAINT [DF_AsiNrdsAssociation_FLPresidentId] DEFAULT (''),
    [FLPresidentElectId] varchar(9) NOT NULL CONSTRAINT [DF_AsiNrdsAssociation_FLPresidentElectId] DEFAULT (''),
    [FLSecretaryId] varchar(9) NOT NULL CONSTRAINT [DF_AsiNrdsAssociation_FLSecretaryId] DEFAULT (''),
    [FLTreasurerId] varchar(9) NOT NULL CONSTRAINT [DF_AsiNrdsAssociation_FLTreasurerId] DEFAULT (''),
    [LastCertificationDate] datetime NULL,
    [MailAddressStreet1] varchar(30) NOT NULL CONSTRAINT [DF_AsiNrdsAssociation_MailAddressStreet1] DEFAULT (''),
    [MailAddressStreet2] varchar(30) NOT NULL CONSTRAINT [DF_AsiNrdsAssociation_MailAddressStreet2] DEFAULT (''),
    [MailAddressCity] varchar(21) NOT NULL CONSTRAINT [DF_AsiNrdsAssociation_MailAddressCity] DEFAULT (''),
    [MailAddressState] varchar(2) NOT NULL CONSTRAINT [DF_AsiNrdsAssociation_MailAddressState] DEFAULT (''),
    [MailAddressZip] varchar(5) NOT NULL CONSTRAINT [DF_AsiNrdsAssociation_MailAddressZip] DEFAULT (''),
    [MailAddressZip6] varchar(6) NOT NULL CONSTRAINT [DF_AsiNrdsAssociation_MailAddressZip6] DEFAULT (''),
    [PhoneAreaCode] varchar(3) NOT NULL CONSTRAINT [DF_AsiNrdsAssociation_PhoneAreaCode] DEFAULT (''),
    [PhoneNumber] varchar(7) NOT NULL CONSTRAINT [DF_AsiNrdsAssociation_PhoneNumber] DEFAULT (''),
    [PointOfEntry] varchar(9) NOT NULL CONSTRAINT [DF_AsiNrdsAssociation_PointOfEntry] DEFAULT (''),
    [PrimaryStateCode] varchar(4) NOT NULL CONSTRAINT [DF_AsiNrdsAssociation_PrimaryStateCode] DEFAULT (''),
    [PLPresidentId] varchar(9) NOT NULL CONSTRAINT [DF_AsiNrdsAssociation_PLPresidentId] DEFAULT (''),
    [PLPresidentElectId] varchar(9) NOT NULL CONSTRAINT [DF_AsiNrdsAssociation_PLPresidentElectId] DEFAULT (''),
    [PLSecretaryId] varchar(9) NOT NULL CONSTRAINT [DF_AsiNrdsAssociation_PLSecretaryId] DEFAULT (''),
    [PLTreasurerId] varchar(9) NOT NULL CONSTRAINT [DF_AsiNrdsAssociation_PLTreasurerId] DEFAULT (''),
    [SecondaryStateCode1] varchar(4) NOT NULL CONSTRAINT [DF_AsiNrdsAssociation_SecondaryStateCode1] DEFAULT (''),
    [SecondaryStateCode2] varchar(4) NOT NULL CONSTRAINT [DF_AsiNrdsAssociation_SecondaryStateCode2] DEFAULT (''),
    [SecondaryStateCode3] varchar(4) NOT NULL CONSTRAINT [DF_AsiNrdsAssociation_SecondaryStateCode3] DEFAULT (''),
    [Status] varchar(1) NOT NULL CONSTRAINT [DF_AsiNrdsAssociation_Status] DEFAULT (''),
    [StatusChangedDate] datetime NULL,
    [StreetAddressStreet1] varchar(30) NOT NULL CONSTRAINT [DF_AsiNrdsAssociation_StreetAddressStreet1] DEFAULT (''),
    [StreetAddressStreet2] varchar(30) NOT NULL CONSTRAINT [DF_AsiNrdsAssociation_StreetAddressStreet2] DEFAULT (''),
    [StreetAddressCity] varchar(21) NOT NULL CONSTRAINT [DF_AsiNrdsAssociation_StreetAddressCity] DEFAULT (''),
    [StreetAddressState] varchar(2) NOT NULL CONSTRAINT [DF_AsiNrdsAssociation_StreetAddressState] DEFAULT (''),
    [StreetAddressZip] varchar(5) NOT NULL CONSTRAINT [DF_AsiNrdsAssociation_StreetAddressZip] DEFAULT (''),
    [StreetAddressZip6] varchar(6) NOT NULL CONSTRAINT [DF_AsiNrdsAssociation_StreetAddressZip6] DEFAULT (''),
    [Webpage] varchar(80) NOT NULL CONSTRAINT [DF_AsiNrdsAssociation_Webpage] DEFAULT (''),
    [NARTimestamp] varchar(20) NOT NULL CONSTRAINT [DF_AsiNrdsAssociation_NARTimestamp] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[AsiNrdsLog]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[AsiNrdsLog] (
    [LogDateTime] datetime NULL,
    [Direction] nvarchar(20) NULL,
    [RecordType] nvarchar(20) NULL,
    [Status] nvarchar(20) NULL,
    [Message] nvarchar(max) NULL,
    [ID] varchar(10) NULL,
    [NrdsId] varchar(10) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[AsiNrdsMember]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[AsiNrdsMember] (
    [ID] varchar(10) NOT NULL CONSTRAINT [DF_AsiNrdsMember_ID] DEFAULT (''),
    [ArbitrationEthicsPending] bit NOT NULL CONSTRAINT [DF_AsiNrdsMember_ArbitrationEthicsPending] DEFAULT (0),
    [AssociationId] varchar(4) NOT NULL CONSTRAINT [DF_AsiNrdsMember_AssociationId] DEFAULT (''),
    [BirthDate] datetime NULL,
    [CellPhoneAreaCode] varchar(3) NOT NULL CONSTRAINT [DF_AsiNrdsMember_CellPhoneAreaCode] DEFAULT (''),
    [CellPhoneNumber] varchar(7) NOT NULL CONSTRAINT [DF_AsiNrdsMember_CellPhoneNumber] DEFAULT (''),
    [DesignatedRealtor] bit NOT NULL CONSTRAINT [DF_AsiNrdsMember_DesignatedRealtor] DEFAULT (0),
    [DuesWaivedLocalFlag] bit NOT NULL CONSTRAINT [DF_AsiNrdsMember_DuesWaivedLocalFlag] DEFAULT (0),
    [DuesWaivedNationalFlag] bit NOT NULL CONSTRAINT [DF_AsiNrdsMember_DuesWaivedNationalFlag] DEFAULT (0),
    [DuesWaivedStateFlag] bit NOT NULL CONSTRAINT [DF_AsiNrdsMember_DuesWaivedStateFlag] DEFAULT (0),
    [Email] varchar(80) NOT NULL CONSTRAINT [DF_AsiNrdsMember_Email] DEFAULT (''),
    [FirstName] varchar(12) NOT NULL CONSTRAINT [DF_AsiNrdsMember_FirstName] DEFAULT (''),
    [Gender] varchar(1) NOT NULL CONSTRAINT [DF_AsiNrdsMember_Gender] DEFAULT (''),
    [Generation] varchar(3) NOT NULL CONSTRAINT [DF_AsiNrdsMember_Generation] DEFAULT (''),
    [HomeAddressStreet1] varchar(30) NOT NULL CONSTRAINT [DF_AsiNrdsMember_HomeAddressStreet1] DEFAULT (''),
    [HomeAddressStreet2] varchar(30) NOT NULL CONSTRAINT [DF_AsiNrdsMember_HomeAddressStreet2] DEFAULT (''),
    [HomeAddressCity] varchar(21) NOT NULL CONSTRAINT [DF_AsiNrdsMember_HomeAddressCity] DEFAULT (''),
    [HomeAddressState] varchar(2) NOT NULL CONSTRAINT [DF_AsiNrdsMember_HomeAddressState] DEFAULT (''),
    [HomeAddressZip] varchar(5) NOT NULL CONSTRAINT [DF_AsiNrdsMember_HomeAddressZip] DEFAULT (''),
    [HomeAddressZip6] varchar(6) NOT NULL CONSTRAINT [DF_AsiNrdsMember_HomeAddressZip6] DEFAULT (''),
    [HomePhoneArea] varchar(3) NOT NULL CONSTRAINT [DF_AsiNrdsMember_HomePhoneArea] DEFAULT (''),
    [HomePhoneNumber] varchar(7) NOT NULL CONSTRAINT [DF_AsiNrdsMember_HomePhoneNumber] DEFAULT (''),
    [JoinedDate] datetime NULL,
    [JunkMailFlag] bit NOT NULL CONSTRAINT [DF_AsiNrdsMember_JunkMailFlag] DEFAULT (0),
    [LastName] varchar(30) NOT NULL CONSTRAINT [DF_AsiNrdsMember_LastName] DEFAULT (''),
    [LocalJoinDate] datetime NULL,
    [MailAddressStreet1] varchar(30) NOT NULL CONSTRAINT [DF_AsiNrdsMember_MailAddressStreet1] DEFAULT (''),
    [MailAddressStreet2] varchar(30) NOT NULL CONSTRAINT [DF_AsiNrdsMember_MailAddressStreet2] DEFAULT (''),
    [MailAddressCity] varchar(21) NOT NULL CONSTRAINT [DF_AsiNrdsMember_MailAddressCity] DEFAULT (''),
    [MailAddressState] varchar(2) NOT NULL CONSTRAINT [DF_AsiNrdsMember_MailAddressState] DEFAULT (''),
    [MailAddressZip] varchar(5) NOT NULL CONSTRAINT [DF_AsiNrdsMember_MailAddressZip] DEFAULT (''),
    [MailAddressZip6] varchar(6) NOT NULL CONSTRAINT [DF_AsiNrdsMember_MailAddressZip6] DEFAULT (''),
    [MemberId] varchar(9) NOT NULL CONSTRAINT [DF_AsiNrdsMember_MemberId] DEFAULT (''),
    [MemberType] varchar(3) NOT NULL CONSTRAINT [DF_AsiNrdsMember_MemberType] DEFAULT (''),
    [MiddleName] varchar(12) NOT NULL CONSTRAINT [DF_AsiNrdsMember_MiddleName] DEFAULT (''),
    [MlsAssociationId] varchar(4) NOT NULL CONSTRAINT [DF_AsiNrdsMember_MlsAssociationId] DEFAULT (''),
    [MlsId] varchar(9) NOT NULL CONSTRAINT [DF_AsiNrdsMember_MlsId] DEFAULT (''),
    [NationalDuesPaidDate] datetime NULL,
    [Nickname] varchar(12) NOT NULL CONSTRAINT [DF_AsiNrdsMember_Nickname] DEFAULT (''),
    [NrdsInsertDate] datetime NULL,
    [OccupationName] varchar(20) NOT NULL CONSTRAINT [DF_AsiNrdsMember_OccupationName] DEFAULT (''),
    [OfficeId] varchar(9) NOT NULL CONSTRAINT [DF_AsiNrdsMember_OfficeId] DEFAULT (''),
    [OfficeVoiceExtension] varchar(6) NOT NULL CONSTRAINT [DF_AsiNrdsMember_OfficeVoiceExtension] DEFAULT (''),
    [OnlineStatus] varchar(1) NOT NULL CONSTRAINT [DF_AsiNrdsMember_OnlineStatus] DEFAULT (''),
    [OnlineStatusDate] datetime NULL,
    [OrientationDate] datetime NULL,
    [OnRosterFlag] bit NOT NULL CONSTRAINT [DF_AsiNrdsMember_OnRosterFlag] DEFAULT (0),
    [PagerAreaCode] varchar(3) NOT NULL CONSTRAINT [DF_AsiNrdsMember_PagerAreaCode] DEFAULT (''),
    [PagerNumber] varchar(7) NOT NULL CONSTRAINT [DF_AsiNrdsMember_PagerNumber] DEFAULT (''),
    [PersonalFaxAreaCode] varchar(3) NOT NULL CONSTRAINT [DF_AsiNrdsMember_PersonalFaxAreaCode] DEFAULT (''),
    [PersonalFaxNumber] varchar(7) NOT NULL CONSTRAINT [DF_AsiNrdsMember_PersonalFaxNumber] DEFAULT (''),
    [PointOfEntry] varchar(9) NOT NULL CONSTRAINT [DF_AsiNrdsMember_PointOfEntry] DEFAULT (''),
    [PreferredFax] varchar(1) NOT NULL CONSTRAINT [DF_AsiNrdsMember_PreferredFax] DEFAULT (''),
    [PreferredMail] varchar(1) NOT NULL CONSTRAINT [DF_AsiNrdsMember_PreferredMail] DEFAULT (''),
    [PreferredPhone] varchar(1) NOT NULL CONSTRAINT [DF_AsiNrdsMember_PreferredPhone] DEFAULT (''),
    [PreferredPublication] varchar(1) NOT NULL CONSTRAINT [DF_AsiNrdsMember_PreferredPublication] DEFAULT (''),
    [PreviousNonmemberFlag] bit NOT NULL CONSTRAINT [DF_AsiNrdsMember_PreviousNonmemberFlag] DEFAULT (0),
    [PrimaryFieldOfBusiness] varchar(3) NOT NULL CONSTRAINT [DF_AsiNrdsMember_PrimaryFieldOfBusiness] DEFAULT (''),
    [PrimaryIndicator] varchar(1) NOT NULL CONSTRAINT [DF_AsiNrdsMember_PrimaryIndicator] DEFAULT (''),
    [PrimaryStateAssociationId] varchar(4) NOT NULL CONSTRAINT [DF_AsiNrdsMember_PrimaryStateAssociationId] DEFAULT (''),
    [ReinstatementCode] varchar(1) NOT NULL CONSTRAINT [DF_AsiNrdsMember_ReinstatementCode] DEFAULT (''),
    [ReinstatementDate] datetime NULL,
    [RELicense] varchar(11) NOT NULL CONSTRAINT [DF_AsiNrdsMember_RELicense] DEFAULT (''),
    [Salutation] varchar(24) NOT NULL CONSTRAINT [DF_AsiNrdsMember_Salutation] DEFAULT (''),
    [SecondaryFieldOfBusiness1] varchar(3) NOT NULL CONSTRAINT [DF_AsiNrdsMember_SecondaryFieldOfBusiness1] DEFAULT (''),
    [SecondaryFieldOfBusiness2] varchar(3) NOT NULL CONSTRAINT [DF_AsiNrdsMember_SecondaryFieldOfBusiness2] DEFAULT (''),
    [SecondaryFieldOfBusiness3] varchar(3) NOT NULL CONSTRAINT [DF_AsiNrdsMember_SecondaryFieldOfBusiness3] DEFAULT (''),
    [Ssn] varchar(9) NOT NULL CONSTRAINT [DF_AsiNrdsMember_Permission] DEFAULT (''),
    [StateDuesPaidDate] datetime NULL,
    [Status] varchar(1) NOT NULL CONSTRAINT [DF_AsiNrdsMember_Status] DEFAULT (''),
    [StatusDate] datetime NULL,
    [StopEmailFlag] bit NOT NULL CONSTRAINT [DF_AsiNrdsMember_StopEmailFlag] DEFAULT (0),
    [StopFaxFlag] bit NOT NULL CONSTRAINT [DF_AsiNrdsMember_StopFaxFlag] DEFAULT (0),
    [StopMailFlag] bit NOT NULL CONSTRAINT [DF_AsiNrdsMember_StopMailFlag] DEFAULT (0),
    [Subclass] varchar(4) NOT NULL CONSTRAINT [DF_AsiNrdsMember_Subclass] DEFAULT (''),
    [Title] varchar(4) NOT NULL CONSTRAINT [DF_AsiNrdsMember_Title] DEFAULT (''),
    [WebPage] varchar(80) NOT NULL CONSTRAINT [DF_AsiNrdsMember_WebPage] DEFAULT (''),
    [NARTimestamp] varchar(20) NOT NULL CONSTRAINT [DF_AsiNrdsMember_NARTimestamp] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[AsiNrdsMemberDemographic]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[AsiNrdsMemberDemographic] (
    [ID] varchar(10) NOT NULL CONSTRAINT [DF_AsiNrdsMemberDemographic_ID] DEFAULT (''),
    [SEQN] int NOT NULL CONSTRAINT [DF_AsiNrdsMemberDemographic_SEQN] DEFAULT (0),
    [Amount] varchar(9) NOT NULL CONSTRAINT [DF_AsiNrdsMemberDemographic_Amount] DEFAULT (''),
    [AssociationId] varchar(4) NOT NULL CONSTRAINT [DF_AsiNrdsMemberDemographic_AssociationId] DEFAULT (''),
    [Category] varchar(4) NOT NULL CONSTRAINT [DF_AsiNrdsMemberDemographic_Category] DEFAULT (''),
    [Comment] varchar(80) NOT NULL CONSTRAINT [DF_AsiNrdsMemberDemographic_Comment] DEFAULT (''),
    [GroupCode] varchar(6) NOT NULL CONSTRAINT [DF_AsiNrdsMemberDemographic_GroupCode] DEFAULT (''),
    [MemberId] varchar(9) NOT NULL CONSTRAINT [DF_AsiNrdsMemberDemographic_MemberId] DEFAULT (''),
    [Number] varchar(9) NOT NULL CONSTRAINT [DF_AsiNrdsMemberDemographic_Number] DEFAULT (''),
    [PaymentCode] varchar(1) NOT NULL CONSTRAINT [DF_AsiNrdsMemberDemographic_PaymentCode] DEFAULT (''),
    [PointOfEntry] varchar(9) NOT NULL CONSTRAINT [DF_AsiNrdsMemberDemographic_PointOfEntry] DEFAULT (''),
    [Status] varchar(4) NOT NULL CONSTRAINT [DF_AsiNrdsMemberDemographic_Status] DEFAULT (''),
    [StatusDate] datetime NULL,
    [NARTimestamp] varchar(20) NOT NULL CONSTRAINT [DF_AsiNrdsMemberDemographic_NARTimestamp] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[AsiNrdsMemberDesignation]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[AsiNrdsMemberDesignation] (
    [ID] varchar(10) NOT NULL CONSTRAINT [DF_AsiNrdsMemberDesignation_Permission] DEFAULT (''),
    [Abr] bit NOT NULL CONSTRAINT [DF_AsiNrdsMemberDesignation_Abr] DEFAULT (0),
    [AbrDate] datetime NULL,
    [Abrm] bit NOT NULL CONSTRAINT [DF_AsiNrdsMemberDesignation_Abrm] DEFAULT (0),
    [AbrmDate] datetime NULL,
    [Alc] bit NOT NULL CONSTRAINT [DF_AsiNrdsMemberDesignation_Alc] DEFAULT (0),
    [AlcDate] datetime NULL,
    [Arm] bit NOT NULL CONSTRAINT [DF_AsiNrdsMemberDesignation_Arm] DEFAULT (0),
    [ArmDate] datetime NULL,
    [Ccim] bit NOT NULL CONSTRAINT [DF_AsiNrdsMemberDesignation_Ccim] DEFAULT (0),
    [CcimDate] datetime NULL,
    [Cips] bit NOT NULL CONSTRAINT [DF_AsiNrdsMemberDesignation_Cips] DEFAULT (0),
    [CipsDate] datetime NULL,
    [Cpm] bit NOT NULL CONSTRAINT [DF_AsiNrdsMemberDesignation_Cpm] DEFAULT (0),
    [CpmDate] datetime NULL,
    [Crb] bit NOT NULL CONSTRAINT [DF_AsiNrdsMemberDesignation_Crb] DEFAULT (0),
    [CrbDate] datetime NULL,
    [Cre] bit NOT NULL CONSTRAINT [DF_AsiNrdsMemberDesignation_Cre] DEFAULT (0),
    [CreDate] datetime NULL,
    [Crs] bit NOT NULL CONSTRAINT [DF_AsiNrdsMemberDesignation_Crs] DEFAULT (0),
    [CrsDate] datetime NULL,
    [Gaa] bit NOT NULL CONSTRAINT [DF_AsiNrdsMemberDesignation_Gaa] DEFAULT (0),
    [GaaDate] datetime NULL,
    [Gri] bit NOT NULL CONSTRAINT [DF_AsiNrdsMemberDesignation_Gri] DEFAULT (0),
    [GriDate] datetime NULL,
    [Ltg] bit NOT NULL CONSTRAINT [DF_AsiNrdsMemberDesignation_Ltg] DEFAULT (0),
    [LtgDate] datetime NULL,
    [Raa] bit NOT NULL CONSTRAINT [DF_AsiNrdsMemberDesignation_Raa] DEFAULT (0),
    [RaaDate] datetime NULL,
    [Rce] bit NOT NULL CONSTRAINT [DF_AsiNrdsMemberDesignation_Rce] DEFAULT (0),
    [RceDate] datetime NULL,
    [Sior] bit NOT NULL CONSTRAINT [DF_AsiNrdsMemberDesignation_Sior] DEFAULT (0),
    [SiorDate] datetime NULL,
    [NARTimestamp] varchar(20) NOT NULL CONSTRAINT [DF_AsiNrdsMemberDesignation_NARTimestamp] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[AsiNrdsMemberEducation]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[AsiNrdsMemberEducation] (
    [ID] varchar(10) NOT NULL CONSTRAINT [DF_AsiNrdsMemberEducation_ID] DEFAULT (''),
    [SEQN] int NOT NULL CONSTRAINT [DF_AsiNrdsMemberEducation_SEQN] DEFAULT (0),
    [AssociationId] varchar(4) NOT NULL CONSTRAINT [DF_AsiNrdsMemberEducation_AssociationId] DEFAULT (''),
    [CertificateName] varchar(40) NOT NULL CONSTRAINT [DF_AsiNrdsMemberEducation_CertificateName] DEFAULT (''),
    [Comments] varchar(80) NOT NULL CONSTRAINT [DF_AsiNrdsMemberEducation_Comments] DEFAULT (''),
    [CourseCode] varchar(7) NOT NULL CONSTRAINT [DF_AsiNrdsMemberEducation_CourseCode] DEFAULT (''),
    [CourseCompletionDate] datetime NULL,
    [CourseDescription] varchar(40) NOT NULL CONSTRAINT [DF_AsiNrdsMemberEducation_CourseDescription] DEFAULT (''),
    [CourseNumber] varchar(15) NOT NULL CONSTRAINT [DF_AsiNrdsMemberEducation_CourseNumber] DEFAULT (''),
    [CourseStartDate] datetime NULL,
    [DateSentToLocalAssociation] datetime NULL,
    [DateSentToNarIsc] datetime NULL,
    [DateSentToStateAgency] datetime NULL,
    [DateSentToStateAssociation] datetime NULL,
    [DeliveryMethod] varchar(6) NOT NULL CONSTRAINT [DF_AsiNrdsMemberEducation_DeliveryMethod] DEFAULT (''),
    [DesignationCreditHours] varchar(5) NOT NULL CONSTRAINT [DF_AsiNrdsMemberEducation_DesignationCreditHours] DEFAULT (''),
    [GroupCode] varchar(7) NOT NULL CONSTRAINT [DF_AsiNrdsMemberEducation_GroupCode] DEFAULT (''),
    [HostingAssociationId] varchar(4) NOT NULL CONSTRAINT [DF_AsiNrdsMemberEducation_HostingAssociationId] DEFAULT (''),
    [Instructor1Name] varchar(20) NOT NULL CONSTRAINT [DF_AsiNrdsMemberEducation_Instructor1Name] DEFAULT (''),
    [Instructor1StateLicenseNumber] varchar(11) NOT NULL CONSTRAINT [DF_AsiNrdsMemberEducation_Instructor1StateLicenseNumber] DEFAULT (''),
    [Instructor2Name] varchar(20) NOT NULL CONSTRAINT [DF_AsiNrdsMemberEducation_Instructor2Name] DEFAULT (''),
    [Instructor2StateLicenseNumber] varchar(11) NOT NULL CONSTRAINT [DF_AsiNrdsMemberEducation_Instructor2StateLicenseNumber] DEFAULT (''),
    [MemberId] varchar(9) NOT NULL CONSTRAINT [DF_AsiNrdsMemberEducation_MemberId] DEFAULT (''),
    [PaymentAmount] varchar(7) NOT NULL CONSTRAINT [DF_AsiNrdsMemberEducation_PaymentAmount] DEFAULT (''),
    [PaymentCode] varchar(1) NOT NULL CONSTRAINT [DF_AsiNrdsMemberEducation_PaymentCode] DEFAULT (''),
    [PointOfEntry] varchar(9) NOT NULL CONSTRAINT [DF_AsiNrdsMemberEducation_PointOfEntry] DEFAULT (''),
    [SponsoringAssociationId] varchar(4) NOT NULL CONSTRAINT [DF_AsiNrdsMemberEducation_SponsoringAssociationId] DEFAULT (''),
    [StateAgencyCourseCode] varchar(15) NOT NULL CONSTRAINT [DF_AsiNrdsMemberEducation_StateAgencyCourseCode] DEFAULT (''),
    [StateCEHours] varchar(5) NOT NULL CONSTRAINT [DF_AsiNrdsMemberEducation_StateCEHours] DEFAULT (''),
    [TestMailingAddress] varchar(1) NOT NULL CONSTRAINT [DF_AsiNrdsMemberEducation_TestMailingAddress] DEFAULT (''),
    [TestScore] varchar(5) NOT NULL CONSTRAINT [DF_AsiNrdsMemberEducation_TestScore] DEFAULT (''),
    [TestScoreDateOfChange] datetime NULL,
    [TestScoreOperator] varchar(10) NOT NULL CONSTRAINT [DF_AsiNrdsMemberEducation_TestScoreOperator] DEFAULT (''),
    [TestStatus] varchar(1) NOT NULL CONSTRAINT [DF_AsiNrdsMemberEducation_TestStatus] DEFAULT (''),
    [TotalHoursEarnedToDate] varchar(5) NOT NULL CONSTRAINT [DF_AsiNrdsMemberEducation_TotalHoursEarnedToDate] DEFAULT (''),
    [NARTimestamp] varchar(20) NOT NULL CONSTRAINT [DF_AsiNrdsMemberEducation_NARTimestamp] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[AsiNrdsMemberFinancial]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[AsiNrdsMemberFinancial] (
    [ID] varchar(10) NOT NULL CONSTRAINT [DF_AsiNrdsMemberFinancial_ID] DEFAULT (''),
    [SEQN] int NOT NULL CONSTRAINT [DF_AsiNrdsMemberFinancial_SEQN] DEFAULT (0),
    [AssociationId] varchar(4) NOT NULL CONSTRAINT [DF_AsiNrdsMemberFinancial_AssociationId] DEFAULT (''),
    [BillingYear] varchar(4) NOT NULL CONSTRAINT [DF_AsiNrdsMemberFinancial_BillingYear] DEFAULT (''),
    [ContributionType] varchar(1) NOT NULL CONSTRAINT [DF_AsiNrdsMemberFinancial_ContributionType] DEFAULT (''),
    [DuesPaidDate] datetime NULL,
    [ECControlNumber] varchar(12) NOT NULL CONSTRAINT [DF_AsiNrdsMemberFinancial_ECControlNumber] DEFAULT (''),
    [IncurringMemberId] varchar(9) NOT NULL CONSTRAINT [DF_AsiNrdsMemberFinancial_IncurringMemberId] DEFAULT (''),
    [IncurringMemberFirstName] varchar(12) NOT NULL CONSTRAINT [DF_AsiNrdsMemberFinancial_IncurringMemberFirstName] DEFAULT (''),
    [IncurringMemberLastName] varchar(17) NOT NULL CONSTRAINT [DF_AsiNrdsMemberFinancial_IncurringMemberLastName] DEFAULT (''),
    [MemberId] varchar(9) NOT NULL CONSTRAINT [DF_AsiNrdsMemberFinancial_MemberId] DEFAULT (''),
    [MemberFirstName] varchar(12) NOT NULL CONSTRAINT [DF_AsiNrdsMemberFinancial_MemberFirstName] DEFAULT (''),
    [MemberLastName] varchar(17) NOT NULL CONSTRAINT [DF_AsiNrdsMemberFinancial_MemberLastName] DEFAULT (''),
    [MemberSsn] varchar(9) NOT NULL CONSTRAINT [DF_AsiNrdsMemberFinancial_MemberSsn] DEFAULT (''),
    [OfficeId] varchar(9) NOT NULL CONSTRAINT [DF_AsiNrdsMemberFinancial_OfficeId] DEFAULT (''),
    [PaymentAmount] varchar(9) NOT NULL CONSTRAINT [DF_AsiNrdsMemberFinancial_PaymentAmount] DEFAULT (''),
    [PaymentType] varchar(8) NOT NULL CONSTRAINT [DF_AsiNrdsMemberFinancial_PaymentType] DEFAULT (''),
    [PointOfEntry] varchar(9) NOT NULL CONSTRAINT [DF_AsiNrdsMemberFinancial_PointOfEntry] DEFAULT (''),
    [PrimaryAssociationId] varchar(4) NOT NULL CONSTRAINT [DF_AsiNrdsMemberFinancial_PrimaryAssociationId] DEFAULT (''),
    [Sequence] varchar(20) NOT NULL CONSTRAINT [DF_AsiNrdsMemberFinancial_Sequence] DEFAULT (''),
    [Source] varchar(2) NOT NULL CONSTRAINT [DF_AsiNrdsMemberFinancial_Source] DEFAULT (''),
    [ValidateFinancialPaymentType] bit NOT NULL CONSTRAINT [DF_AsiNrdsMemberFinancial_ValidateFinancialPaymentType] DEFAULT (0),
    [NARTimestamp] varchar(20) NOT NULL CONSTRAINT [DF_AsiNrdsMemberFinancial_NARTimestamp] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[AsiNrdsMemberSupplemental]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[AsiNrdsMemberSupplemental] (
    [ID] varchar(10) NOT NULL CONSTRAINT [DF_AsiNrdsMemberSupplemental_ID] DEFAULT (''),
    [SEQN] int NOT NULL CONSTRAINT [DF_AsiNrdsMemberSupplemental_SEQN] DEFAULT (0),
    [AssociationId] varchar(4) NOT NULL CONSTRAINT [DF_AsiNrdsMemberSupplemental_AssociationId] DEFAULT (''),
    [LocalJoinDate] datetime NULL,
    [MemberId] varchar(9) NOT NULL CONSTRAINT [DF_AsiNrdsMemberSupplemental_MemberId] DEFAULT (''),
    [MemberType] varchar(4) NOT NULL CONSTRAINT [DF_AsiNrdsMemberSupplemental_MemberType] DEFAULT (''),
    [OfficeId] varchar(9) NOT NULL CONSTRAINT [DF_AsiNrdsMemberSupplemental_OfficeId] DEFAULT (''),
    [RELicense] varchar(11) NOT NULL CONSTRAINT [DF_AsiNrdsMemberSupplemental_RELicense] DEFAULT (''),
    [Status] varchar(1) NOT NULL CONSTRAINT [DF_AsiNrdsMemberSupplemental_Status] DEFAULT (''),
    [StatusDate] datetime NULL,
    [Subclass] varchar(4) NOT NULL CONSTRAINT [DF_AsiNrdsMemberSupplemental_Subclass] DEFAULT (''),
    [NARTimestamp] varchar(20) NOT NULL CONSTRAINT [DF_AsiNrdsMemberSupplemental_NARTimestamp] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[AsiNrdsOffice]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[AsiNrdsOffice] (
    [ID] varchar(10) NOT NULL CONSTRAINT [DF_AsiNrdsOffice_ID] DEFAULT (''),
    [AdditionalPhoneAreaCode] varchar(3) NOT NULL CONSTRAINT [DF_AsiNrdsOffice_AdditionalPhoneAreaCode] DEFAULT (''),
    [AdditionalPhoneNumber] varchar(7) NOT NULL CONSTRAINT [DF_AsiNrdsOffice_AdditionalPhoneNumber] DEFAULT (''),
    [AssociationId] varchar(4) NOT NULL CONSTRAINT [DF_AsiNrdsOffice_AssociationId] DEFAULT (''),
    [BillingOfficeId] varchar(9) NOT NULL CONSTRAINT [DF_AsiNrdsOffice_BillingOfficeId] DEFAULT (''),
    [BranchType] varchar(1) NOT NULL CONSTRAINT [DF_AsiNrdsOffice_BranchType] DEFAULT (''),
    [BusinessName] varchar(30) NOT NULL CONSTRAINT [DF_AsiNrdsOffice_BusinessName] DEFAULT (''),
    [ContactDRId] varchar(9) NOT NULL CONSTRAINT [DF_AsiNrdsOffice_ContactDRId] DEFAULT (''),
    [ContactManagerId] varchar(9) NOT NULL CONSTRAINT [DF_AsiNrdsOffice_ContactManagerId] DEFAULT (''),
    [ContactUnlicensed] varchar(30) NOT NULL CONSTRAINT [DF_AsiNrdsOffice_ContactUnlicensed] DEFAULT (''),
    [CorporateLicense] varchar(12) NOT NULL CONSTRAINT [DF_AsiNrdsOffice_CorporateLicense] DEFAULT (''),
    [CorporateName] varchar(30) NOT NULL CONSTRAINT [DF_AsiNrdsOffice_CorporateName] DEFAULT (''),
    [District] varchar(4) NOT NULL CONSTRAINT [DF_AsiNrdsOffice_District] DEFAULT (''),
    [DRFirstName] varchar(12) NOT NULL CONSTRAINT [DF_AsiNrdsOffice_DRFirstName] DEFAULT (''),
    [DRLastName] varchar(17) NOT NULL CONSTRAINT [DF_AsiNrdsOffice_DRLastName] DEFAULT (''),
    [Email] varchar(80) NOT NULL CONSTRAINT [DF_AsiNrdsOffice_Email] DEFAULT (''),
    [FaxAreaCode] varchar(3) NOT NULL CONSTRAINT [DF_AsiNrdsOffice_FaxAreaCode] DEFAULT (''),
    [FaxNumber] varchar(7) NOT NULL CONSTRAINT [DF_AsiNrdsOffice_FaxNumber] DEFAULT (''),
    [FormalName] varchar(100) NOT NULL CONSTRAINT [DF_AsiNrdsOffice_FormalName] DEFAULT (''),
    [FranchiseId] varchar(9) NOT NULL CONSTRAINT [DF_AsiNrdsOffice_FranchiseId] DEFAULT (''),
    [JoinedDate] datetime NULL,
    [JunkMailFlag] bit NOT NULL CONSTRAINT [DF_AsiNrdsOffice_JunkMailFlag] DEFAULT (0),
    [MailAddressStreet1] varchar(30) NOT NULL CONSTRAINT [DF_AsiNrdsOffice_MailAddressStreet1] DEFAULT (''),
    [MailAddressStreet2] varchar(30) NOT NULL CONSTRAINT [DF_AsiNrdsOffice_MailAddressStreet2] DEFAULT (''),
    [MailAddressCity] varchar(21) NOT NULL CONSTRAINT [DF_AsiNrdsOffice_MailAddressCity] DEFAULT (''),
    [MailAddressState] varchar(2) NOT NULL CONSTRAINT [DF_AsiNrdsOffice_MailAddressState] DEFAULT (''),
    [MailAddressZip] varchar(5) NOT NULL CONSTRAINT [DF_AsiNrdsOffice_MailAddressZip] DEFAULT (''),
    [MailAddressZip6] varchar(6) NOT NULL CONSTRAINT [DF_AsiNrdsOffice_MailAddressZip6] DEFAULT (''),
    [MainOfficeId] varchar(9) NOT NULL CONSTRAINT [DF_AsiNrdsOffice_MainOfficeId] DEFAULT (''),
    [MlsId] varchar(10) NOT NULL CONSTRAINT [DF_AsiNrdsOffice_MlsId] DEFAULT (''),
    [MlsOnlineStatus] varchar(1) NOT NULL CONSTRAINT [DF_AsiNrdsOffice_MlsOnlineStatus] DEFAULT (''),
    [MlsOnlineStatusDate] datetime NULL,
    [NMSalespersonCount] varchar(5) NOT NULL CONSTRAINT [DF_AsiNrdsOffice_NMSalespersonCount] DEFAULT (''),
    [OfficeId] varchar(9) NOT NULL CONSTRAINT [DF_AsiNrdsOffice_OfficeId] DEFAULT (''),
    [OfficeType] varchar(4) NOT NULL CONSTRAINT [DF_AsiNrdsOffice_OfficeType] DEFAULT (''),
    [OnRosterFlag] bit NOT NULL CONSTRAINT [DF_AsiNrdsOffice_OnRosterFlag] DEFAULT (0),
    [ParentCompanyId] varchar(9) NOT NULL CONSTRAINT [DF_AsiNrdsOffice_ParentCompanyId] DEFAULT (''),
    [PhoneAreaCode] varchar(3) NOT NULL CONSTRAINT [DF_AsiNrdsOffice_PhoneAreaCode] DEFAULT (''),
    [PhoneNumber] varchar(7) NOT NULL CONSTRAINT [DF_AsiNrdsOffice_PhoneNumber] DEFAULT (''),
    [PointOfEntry] varchar(9) NOT NULL CONSTRAINT [DF_AsiNrdsOffice_PointOfEntry] DEFAULT (''),
    [PrimaryIndicator] varchar(1) NOT NULL CONSTRAINT [DF_AsiNrdsOffice_PrimaryIndicator] DEFAULT (''),
    [PrimaryStateCode] varchar(4) NOT NULL CONSTRAINT [DF_AsiNrdsOffice_PrimaryStateCode] DEFAULT (''),
    [SortSequence] varchar(16) NOT NULL CONSTRAINT [DF_AsiNrdsOffice_SortSequence] DEFAULT (''),
    [Status] varchar(1) NOT NULL CONSTRAINT [DF_AsiNrdsOffice_Status] DEFAULT (''),
    [StatusDate] datetime NULL,
    [StopFaxFlag] bit NOT NULL CONSTRAINT [DF_AsiNrdsOffice_StopFaxFlag] DEFAULT (0),
    [StopMailFlag] bit NOT NULL CONSTRAINT [DF_AsiNrdsOffice_StopMailFlag] DEFAULT (0),
    [StreetAddressStreet1] varchar(30) NOT NULL CONSTRAINT [DF_AsiNrdsOffice_StreetAddressStreet1] DEFAULT (''),
    [StreetAddressStreet2] varchar(30) NOT NULL CONSTRAINT [DF_AsiNrdsOffice_StreetAddressStreet2] DEFAULT (''),
    [StreetAddressCity] varchar(21) NOT NULL CONSTRAINT [DF_AsiNrdsOffice_StreetAddressCity] DEFAULT (''),
    [StreetAddressState] varchar(2) NOT NULL CONSTRAINT [DF_AsiNrdsOffice_StreetAddressState] DEFAULT (''),
    [StreetAddressZip] varchar(5) NOT NULL CONSTRAINT [DF_AsiNrdsOffice_StreetAddressZip] DEFAULT (''),
    [StreetAddressZip6] varchar(6) NOT NULL CONSTRAINT [DF_AsiNrdsOffice_StreetAddressZip6] DEFAULT (''),
    [TaxId] varchar(12) NOT NULL CONSTRAINT [DF_AsiNrdsOffice_TaxId] DEFAULT (''),
    [Webpage] varchar(80) NOT NULL CONSTRAINT [DF_AsiNrdsOffice_Webpage] DEFAULT (''),
    [NARTimestamp] varchar(20) NOT NULL CONSTRAINT [DF_AsiNrdsOffice_NARTimestamp] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[AsiNrdsOfficeSupplemental]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[AsiNrdsOfficeSupplemental] (
    [ID] varchar(10) NOT NULL CONSTRAINT [DF_AsiNrdsOfficeSupplemental_ID] DEFAULT (''),
    [SEQN] int NOT NULL CONSTRAINT [DF_AsiNrdsOfficeSupplemental_SEQN] DEFAULT (''),
    [AssociationId] varchar(4) NOT NULL CONSTRAINT [DF_AsiNrdsOfficeSupplemental_AssociationId] DEFAULT (''),
    [NMSalespersonCount] varchar(5) NOT NULL CONSTRAINT [DF_AsiNrdOfficeSupplementals_NMSalespersonCount] DEFAULT (''),
    [OfficeId] varchar(9) NOT NULL CONSTRAINT [DF_AsiNrdsOfficeSupplemental_OfficeId] DEFAULT (''),
    [Status] varchar(1) NOT NULL CONSTRAINT [DF_AsiNrdsOfficeSupplemental_Status] DEFAULT (''),
    [StatusDate] datetime NULL,
    [NARTimestamp] varchar(20) NOT NULL CONSTRAINT [DF_AsiNrdsOfficeSupplemental_NARTimestamp] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[AsiNrdsQueue]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[AsiNrdsQueue] (
    [ID] varchar(10) NOT NULL,
    [Direction] nvarchar(20) NULL,
    [NrdsId] varchar(10) NULL,
    [RecordType] varchar(20) NULL,
    [QueuedDateTime] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[AsyncStatusMonitor]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[AsyncStatusMonitor] (
    [AsyncStatusMonitorKey] uniqueidentifier NOT NULL,
    [ComponentKey] uniqueidentifier NOT NULL,
    [BusinessItemKey] uniqueidentifier NOT NULL,
    [WorkflowQueueItemKey] uniqueidentifier NOT NULL,
    [CreatedOn] datetime NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[AtomPanel]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[AtomPanel] (
    [AtomPanelKey] uniqueidentifier NOT NULL,
    [ComponentKey] uniqueidentifier NOT NULL,
    [AtomPanelName] nvarchar(100) NOT NULL,
    [AtomPanelStatusCode] smallint NOT NULL,
    [AtomPanelTypeCode] smallint NOT NULL,
    [AtomPanelPurposeCode] smallint NOT NULL,
    [AtomPanelFactoryStateCode] smallint NOT NULL,
    [DefaultForPurposeFlag] bit NOT NULL CONSTRAINT [DF_AtomPanel_DefaultForPurposeFlag] DEFAULT (0),
    [AtomPanelDescription] nvarchar(2000) NULL,
    [AtomPanelDesign] ntext NOT NULL,
    [UpdatedOn] datetime NOT NULL,
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[AtomPanelFactoryStateRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[AtomPanelFactoryStateRef] (
    [AtomPanelFactoryStateCode] smallint NOT NULL,
    [AtomPanelFactoryStateDesc] nvarchar(50) NOT NULL,
    [AtomPanelFactoryStateName] nvarchar(20) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[AtomPanelPurposeRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[AtomPanelPurposeRef] (
    [AtomPanelPurposeCode] smallint NOT NULL,
    [AtomPanelPurposeDesc] nvarchar(50) NOT NULL,
    [AtomPanelPurposeName] nvarchar(50) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[AtomPanelStatusRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[AtomPanelStatusRef] (
    [AtomPanelStatusCode] smallint NOT NULL,
    [AtomPanelStatusDesc] nvarchar(20) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[AtomPanelTemplate]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[AtomPanelTemplate] (
    [WebsiteKey] uniqueidentifier NOT NULL,
    [AtomPanelTemplateTypeCode] int NOT NULL,
    [TemplateName] nvarchar(30) NOT NULL,
    [TemplateXML] ntext NOT NULL,
    [DesignToPainterXSLT] ntext NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[AtomPanelTemplateTypeRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[AtomPanelTemplateTypeRef] (
    [AtomPanelTemplateTypeCode] int NOT NULL,
    [AtomPanelTemplateTypeDesc] nvarchar(50) NOT NULL,
    [PainterToDesignXSLT] ntext NOT NULL,
    [TemplateToPainterXSLT] ntext NOT NULL,
    [MultiPageFlag] bit NOT NULL,
    [ChildFlag] bit NOT NULL,
    [AtomPanelTemplateTypeName] nvarchar(20) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[AtomPanelTypeRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[AtomPanelTypeRef] (
    [AtomPanelTypeCode] smallint NOT NULL,
    [AtomPanelTypeDesc] nvarchar(50) NOT NULL,
    [AtomPanelTypeName] nvarchar(20) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[AtomPanelWebsite]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[AtomPanelWebsite] (
    [AtomPanelKey] uniqueidentifier NOT NULL,
    [WebsiteKey] uniqueidentifier NOT NULL,
    [WebUserControlPath] nvarchar(255) NULL,
    [LastCompiledOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[AutoPayInstruction]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[AutoPayInstruction] (
    [InstructionId] uniqueidentifier NOT NULL,
    [Status] nvarchar(10) NOT NULL,
    [CustomerId] varchar(10) NOT NULL,
    [PaymentMethodId] varchar(10) NOT NULL,
    [PaymentMethodSummary] varchar(50) NOT NULL,
    [PaymentToken] uniqueidentifier NOT NULL,
    [StartDate] datetime NULL,
    [EndDate] datetime NULL,
    [ProcessingReference] nvarchar(100) NOT NULL CONSTRAINT [DF_AutoPayInstruction_ProcessingReference] DEFAULT (''),
    [Notes] nvarchar(max) NULL,
    [SourceSystem] varchar(10) NOT NULL,
    [LinkedFromAutoPayInstructionId] uniqueidentifier NULL,
    [CancelledOn] datetime NULL,
    [CancellationReason] nvarchar(1000) NULL,
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedOn] datetime NOT NULL CONSTRAINT [DF_AutoPayInstruction_CreatedOn] DEFAULT (getdate()),
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [UpdatedOn] datetime NOT NULL CONSTRAINT [DF_AutoPayInstruction_UpdatedOn] DEFAULT (getdate()),
    [AuthorizedPaymentAmount] numeric(18, 4) NOT NULL CONSTRAINT [DF_AutoPayInstruction_AuthorizedPaymentAmount] DEFAULT (0),
    [IntervalTypeCode] int NOT NULL CONSTRAINT [DF_AutoPayInstruction_IntervalTypeCode] DEFAULT (0),
    [CollectionDay] int NOT NULL CONSTRAINT [DF_AutoPayInstruction_CollectionDay] DEFAULT (0),
    [ProductCode] varchar(31) NULL CONSTRAINT [DF_AutoPayInstruction_ProductCode] DEFAULT (NULL),
    [Appeal] varchar(40) NOT NULL CONSTRAINT [DF_AutoPayInstruction_Appeal] DEFAULT (''),
    [Campaign] varchar(10) NOT NULL CONSTRAINT [DF_AutoPayInstruction_Campaign] DEFAULT (''),
    [Fund] varchar(10) NOT NULL CONSTRAINT [DF_AutoPayInstruction_Fund] DEFAULT (''),
    [PaymentTokenExpirationDate] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[AVSBillingLog]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[AVSBillingLog] (
    [AVSBillingLogKey] uniqueidentifier NOT NULL,
    [IPIMISServer] nvarchar(15) NOT NULL,
    [IPBrowser] nvarchar(15) NOT NULL,
    [UserType] nvarchar(10) NULL,
    [VerificationType] nvarchar(10) NULL,
    [CountryCode] nchar(3) NOT NULL,
    [iMISSerialNumber] nvarchar(255) NOT NULL,
    [CreatedOn] datetime NULL CONSTRAINT [DF_AVSBillingLog_CreatedOn] DEFAULT (getdate()),
    [UpdatedOn] datetime NULL,
    [IsSuccesfulTransaction] bit NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[BadAddressReasonRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[BadAddressReasonRef] (
    [BadAddressReasonKey] uniqueidentifier NOT NULL,
    [BadAddressReasonDesc] nvarchar(100) NOT NULL,
    [ErrorCode] nvarchar(20) NULL,
    [ErrorMessage] nvarchar(1000) NULL,
    [IsSystem] bit NOT NULL,
    [IsPhysical] bit NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Basket_Dues]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Basket_Dues] (
    [ID] varchar(10) NOT NULL CONSTRAINT [DF_Basket_Dues_ID] DEFAULT (''),
    [PRODUCT_CODE] varchar(31) NOT NULL CONSTRAINT [DF_Basket_Dues_PRODUCT_CODE] DEFAULT (''),
    [BILL_DATE] datetime NULL,
    [BALANCE] money NOT NULL CONSTRAINT [DF_Basket_Dues_BALANCE] DEFAULT (0),
    [BILL_BEGIN] datetime NULL,
    [BILL_THRU] datetime NULL,
    [BILL_COPIES] int NULL,
    [PAID_THRU] datetime NULL,
    [STATUS] varchar(5) NOT NULL CONSTRAINT [DF_Basket_Dues_STATUS] DEFAULT (''),
    [RENEW_MONTHS] tinyint NOT NULL CONSTRAINT [DF_Basket_Dues_RENEW_MONTHS] DEFAULT (0),
    [PRICE_1] money NOT NULL CONSTRAINT [DF_Basket_Dues_PRICE_1] DEFAULT (0),
    [PROD_TYPE] varchar(10) NOT NULL CONSTRAINT [DF_Basket_Dues_PROD_TYPE] DEFAULT (''),
    [TITLE] varchar(60) NOT NULL CONSTRAINT [DF_Basket_Dues_TITLE] DEFAULT (''),
    [INCOME_ACCOUNT] varchar(50) NOT NULL CONSTRAINT [DF_Basket_Dues_INCOME_ACCOUNT] DEFAULT (''),
    [DEFERRED_INCOME_ACCOUNT] varchar(50) NOT NULL CONSTRAINT [DF_Basket_Dues_DEFERRED_INCOME_ACCOUNT] DEFAULT (''),
    [PRICE_RULES_EXIST] bit NOT NULL CONSTRAINT [DF_Basket_Dues_PRICE_RULES_EXIST] DEFAULT (0),
    [PAYMENT_PRIORITY] int NOT NULL CONSTRAINT [DF_Basket_Dues_PAYMENT_PRIORITY] DEFAULT (0),
    [CFTOKEN] varchar(60) NOT NULL CONSTRAINT [DF_Basket_Dues_CFTOKEN] DEFAULT (''),
    [IP_ADDRESS] varchar(50) NOT NULL CONSTRAINT [DF_Basket_Dues_IP_ADDRESS] DEFAULT (''),
    [CFID] varchar(60) NOT NULL CONSTRAINT [DF_Basket_Dues_CFID] DEFAULT (''),
    [DESCRIPTION] varchar(50) NOT NULL CONSTRAINT [DF_Basket_Dues_DESCRIPTION] DEFAULT (''),
    [ORG_CODE] varchar(5) NOT NULL CONSTRAINT [DF_Basket_Dues_ORG_CODE] DEFAULT (''),
    [IS_FR_ITEM] bit NOT NULL CONSTRAINT [DF_Basket_Dues_IS_FR_ITEM] DEFAULT (0),
    [APPEAL_CODE] varchar(40) NOT NULL CONSTRAINT [DF_Basket_Dues_APPEAL_CODE] DEFAULT (''),
    [CAMPAIGN_CODE] varchar(10) NOT NULL CONSTRAINT [DF_Basket_Dues_CAMPAIGN_CODE] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Basket_Function]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Basket_Function] (
    [ID] varchar(10) NOT NULL CONSTRAINT [DF_Basket_Function_ID] DEFAULT (''),
    [IP_ADDRESS] varchar(30) NOT NULL CONSTRAINT [DF_Basket_Function_IP_ADDRESS] DEFAULT (''),
    [ST_ID] varchar(10) NOT NULL CONSTRAINT [DF_Basket_Function_ST_ID] DEFAULT (''),
    [PRODUCT_MINOR] varchar(15) NOT NULL CONSTRAINT [DF_Basket_Function_PRODUCT_MINOR] DEFAULT (''),
    [PRODUCT_MAJOR] varchar(15) NOT NULL CONSTRAINT [DF_Basket_Function_PRODUCT_MAJOR] DEFAULT (''),
    [PRODUCT_CODE] varchar(31) NOT NULL CONSTRAINT [DF_Basket_Function_PRODUCT_CODE] DEFAULT (''),
    [TITLE] varchar(60) NOT NULL CONSTRAINT [DF_Basket_Function_TITLE] DEFAULT (''),
    [BEGIN_DATE] datetime NULL,
    [END_DATE] datetime NULL,
    [BEGIN_TIME] datetime NULL,
    [END_TIME] datetime NULL,
    [EXTENDED_AMOUNT] money NOT NULL CONSTRAINT [DF_Basket_Function_EXTENDED_AMOUNT] DEFAULT (0),
    [INCOME_ACCOUNT] varchar(50) NOT NULL CONSTRAINT [DF_Basket_Function_INCOME_ACCOUNT] DEFAULT (''),
    [DEFERRED_INCOME_ACCOUNT] varchar(50) NOT NULL CONSTRAINT [DF_Basket_Function_DEFERRED_INCOME_ACCOUNT] DEFAULT (''),
    [QUANTITY_ORDERED] float NOT NULL CONSTRAINT [DF_Basket_Function_QUANTITY_ORDERED] DEFAULT (0),
    [ORG_CODE] varchar(5) NOT NULL CONSTRAINT [DF_Basket_Function_ORG_CODE] DEFAULT (''),
    [IS_FR_ITEM] bit NOT NULL CONSTRAINT [DF_Basket_Function_IS_FR_ITEM] DEFAULT (0),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Basket_Meeting]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Basket_Meeting] (
    [ID] varchar(10) NOT NULL CONSTRAINT [DF_Basket_Meeting_ID] DEFAULT (''),
    [IP_ADDRESS] varchar(30) NOT NULL CONSTRAINT [DF_Basket_Meeting_IP_ADDRESS] DEFAULT (''),
    [ST_ID] varchar(10) NOT NULL CONSTRAINT [DF_Basket_Meeting_ST_ID] DEFAULT (''),
    [MEETING] varchar(15) NOT NULL CONSTRAINT [DF_Basket_Meeting_MEETING] DEFAULT (''),
    [TITLE] varchar(60) NOT NULL CONSTRAINT [DF_Basket_Meeting_TITLE] DEFAULT (''),
    [TOTAL_CHARGES] money NOT NULL CONSTRAINT [DF_Basket_Meeting_TOTAL_CHARGES] DEFAULT (0),
    [DELEGATE] varchar(10) NOT NULL CONSTRAINT [DF_Basket_Meeting_DELEGATE] DEFAULT (''),
    [REGISTRANT_CLASS] varchar(5) NOT NULL CONSTRAINT [DF_Basket_Meeting_REGISTRANT_CLASS] DEFAULT (''),
    [MODULE] varchar(20) NOT NULL CONSTRAINT [DF_Basket_Meeting_MODULE] DEFAULT (''),
    [CFTOKEN] varchar(60) NOT NULL CONSTRAINT [DF_Basket_Meeting_CFTOKEN] DEFAULT (''),
    [CFID] varchar(60) NOT NULL CONSTRAINT [DF_Basket_Meeting_CFID] DEFAULT (''),
    [ORG_CODE] varchar(5) NOT NULL CONSTRAINT [DF_Basket_Meeting_ORG_CODE] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Basket_Order]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Basket_Order] (
    [ID] varchar(10) NOT NULL CONSTRAINT [DF_Basket_Order_ID] DEFAULT (''),
    [CFID] varchar(60) NOT NULL CONSTRAINT [DF_Basket_Order_CFID] DEFAULT (''),
    [CFTOKEN] varchar(60) NOT NULL CONSTRAINT [DF_Basket_Order_CFTOKEN] DEFAULT (''),
    [IP_ADDRESS] varchar(30) NOT NULL CONSTRAINT [DF_Basket_Order_IP_ADDRESS] DEFAULT (''),
    [PRODUCT_CODE] varchar(31) NOT NULL CONSTRAINT [DF_Basket_Order_PRODUCT_CODE] DEFAULT (''),
    [QUANTITY_ORDERED] float NOT NULL CONSTRAINT [DF_Basket_Order_QUANTITY_ORDERED] DEFAULT (0),
    [EXTENDED_AMOUNT] money NOT NULL CONSTRAINT [DF_Basket_Order_EXTENDED_AMOUNT] DEFAULT (0),
    [TITLE] varchar(60) NOT NULL CONSTRAINT [DF_Basket_Order_TITLE] DEFAULT (''),
    [BASKET_DATE] datetime NULL,
    [PRICE] money NOT NULL CONSTRAINT [DF_Basket_Order_PRICE] DEFAULT (0),
    [UF_1] varchar(30) NOT NULL CONSTRAINT [DF_Basket_Order_UF_1] DEFAULT (''),
    [UF_2] varchar(30) NOT NULL CONSTRAINT [DF_Basket_Order_UF_2] DEFAULT (''),
    [UF_3] varchar(30) NOT NULL CONSTRAINT [DF_Basket_Order_UF_3] DEFAULT (''),
    [UF_4] varchar(30) NOT NULL CONSTRAINT [DF_Basket_Order_UF_4] DEFAULT (''),
    [LOCATION] varchar(10) NOT NULL CONSTRAINT [DF_Basket_Order_LOCATION] DEFAULT (''),
    [BIN] varchar(10) NOT NULL CONSTRAINT [DF_Basket_Order_BIN] DEFAULT (''),
    [CATEGORY] varchar(10) NOT NULL CONSTRAINT [DF_Basket_Order_CATEGORY] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Basket_Payment]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Basket_Payment] (
    [ID] varchar(10) NOT NULL CONSTRAINT [DF_Basket_Payment_ID] DEFAULT (''),
    [IP_ADDRESS] varchar(30) NOT NULL CONSTRAINT [DF_Basket_Payment_IP_ADDRESS] DEFAULT (''),
    [PAY_TYPE] varchar(10) NOT NULL CONSTRAINT [DF_Basket_Payment_PAY_TYPE] DEFAULT (''),
    [PAY_NUMBER] varchar(25) NOT NULL CONSTRAINT [DF_Basket_Payment_PAY_NUMBER] DEFAULT (''),
    [CREDIT_CARD_EXPIRES] varchar(10) NOT NULL CONSTRAINT [DF_Basket_Payment_CREDIT_CARD_EXPIRES] DEFAULT (''),
    [CREDIT_CARD_NAME] varchar(30) NOT NULL CONSTRAINT [DF_Basket_Payment_CREDIT_CARD_NAME] DEFAULT (''),
    [ENCRYPT_CREDIT_CARD_EXPIRES] varchar(100) NOT NULL CONSTRAINT [DF_Basket_Payment_ENCRYPT_CREDIT_CARD_EXPIRES] DEFAULT (''),
    [ENCRYPT_PAY_NUMBER] varchar(100) NOT NULL CONSTRAINT [DF_Basket_Payment_ENCRYPT_PAY_NUMBER] DEFAULT (''),
    [ENCRYPT_CSC] varchar(100) NOT NULL CONSTRAINT [DF_Basket_Payment_ENCRYPT_CSC] DEFAULT (''),
    [ISSUE_DATE] varchar(10) NOT NULL CONSTRAINT [DF_Basket_Payment_ISSUE_DATE] DEFAULT (''),
    [ISSUE_NUMBER] varchar(2) NOT NULL CONSTRAINT [DF_Basket_Payment_ISSUE_NUMBER] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Batch]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Batch] (
    [BATCH_NUM] varchar(15) NOT NULL CONSTRAINT [DF_Batch_BATCH_NUM] DEFAULT (''),
    [ORG_CODE] varchar(5) NOT NULL CONSTRAINT [DF_Batch_ORG_CODE] DEFAULT (''),
    [STATUS] tinyint NOT NULL CONSTRAINT [DF_Batch_STATUS] DEFAULT (0),
    [DESCRIPTION] varchar(60) NOT NULL CONSTRAINT [DF_Batch_DESCRIPTION] DEFAULT (''),
    [DATE_CREATED] datetime NULL,
    [CREATED_BY] varchar(60) NOT NULL CONSTRAINT [DF_Batch_CREATED_BY] DEFAULT (''),
    [LAST_UPDATED] datetime NULL,
    [UPDATED_BY] varchar(60) NOT NULL CONSTRAINT [DF_Batch_UPDATED_BY] DEFAULT (''),
    [CONTROLLED] bit NOT NULL CONSTRAINT [DF_Batch_CONTROLLED] DEFAULT (0),
    [CONTROL_COUNT] int NOT NULL CONSTRAINT [DF_Batch_CONTROL_COUNT] DEFAULT (0),
    [CONTROL_CASH] money NOT NULL CONSTRAINT [DF_Batch_CONTROL_CASH] DEFAULT (0),
    [TRANS_COUNT] int NOT NULL CONSTRAINT [DF_Batch_TRANS_COUNT] DEFAULT (0),
    [TRANS_CASH] money NOT NULL CONSTRAINT [DF_Batch_TRANS_CASH] DEFAULT (0),
    [CASH_PSUEDO] varchar(50) NOT NULL CONSTRAINT [DF_Batch_CASH_PSUEDO] DEFAULT (''),
    [CASH_GL_ACCT] varchar(30) NOT NULL CONSTRAINT [DF_Batch_CASH_GL_ACCT] DEFAULT (''),
    [AR_PSUEDO] varchar(50) NOT NULL CONSTRAINT [DF_Batch_AR_PSUEDO] DEFAULT (''),
    [AR_GL_ACCT] varchar(30) NOT NULL CONSTRAINT [DF_Batch_AR_GL_ACCT] DEFAULT (''),
    [EFFECTIVE_DATE] datetime NULL,
    [CASH_ENTITY] varchar(5) NOT NULL CONSTRAINT [DF_Batch_CASH_ENTITY] DEFAULT (''),
    [CASH_ACCOUNT_CODE] varchar(10) NOT NULL CONSTRAINT [DF_Batch_CASH_ACCOUNT_CODE] DEFAULT (''),
    [INTENT_TO_EDIT] varchar(80) NOT NULL CONSTRAINT [DF_Batch_INTENT_TO_EDIT] DEFAULT (''),
    [SOURCE_SYSTEM] varchar(10) NOT NULL CONSTRAINT [DF_Batch_SOURCE_SYSTEM] DEFAULT (''),
    [DUES_CYCLE_FLAG] bit NOT NULL CONSTRAINT [DF_Batch_DUES_CYCLE_FLAG] DEFAULT (0),
    [MEETING] varchar(10) NOT NULL CONSTRAINT [DF_Batch_MEETING] DEFAULT (''),
    [HAS_EXPORTED_TRANS] bit NOT NULL CONSTRAINT [DF_Batch_HAS_EXPORTED_TRANS] DEFAULT (0),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[BatchActionRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[BatchActionRef] (
    [BatchActionCode] int NOT NULL,
    [BatchActionDesc] nvarchar(30) NOT NULL,
    [BatchActionName] nvarchar(20) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[BatchLineStatusRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[BatchLineStatusRef] (
    [BatchLineStatusCode] int NOT NULL,
    [BatchLineStatusDesc] nvarchar(30) NOT NULL,
    [BatchLineStatusName] nvarchar(10) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[BatchSetup]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[BatchSetup] (
    [BatchSetupKey] uniqueidentifier NOT NULL,
    [WorkObjectName] nvarchar(100) NOT NULL,
    [PostObjectName] nvarchar(100) NOT NULL,
    [DepartmentGroupKey] uniqueidentifier NULL,
    [BatchNumberFormat] nchar(20) NOT NULL,
    [BatchTypeCode] int NOT NULL,
    [BatchTypeName] nvarchar(50) NULL,
    [AutoPostFlag] bit NOT NULL CONSTRAINT [DF_BatchSetup_AutoPostFlag] DEFAULT (0),
    [AutoCreateFlag] bit NOT NULL CONSTRAINT [DF_BatchSetup_AutoCreateFlag] DEFAULT (0),
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedOn] datetime NOT NULL,
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [UpdatedOn] datetime NOT NULL,
    [SystemEntityKey] uniqueidentifier NOT NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[BatchStatusRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[BatchStatusRef] (
    [BatchStatusCode] int NOT NULL,
    [BatchStatusDesc] nvarchar(50) NOT NULL,
    [BatchStatusName] nvarchar(10) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[BillingSetup]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[BillingSetup] (
    [ProductCode] varchar(31) NULL,
    [Title] varchar(64) NULL,
    [Description] varchar(256) NULL,
    [OrderProductCode] varchar(31) NULL,
    [MemberTypes] varchar(30) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Campaign]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Campaign] (
    [CAMPAIGN_CODE] varchar(10) NOT NULL CONSTRAINT [DF_Campaign_CAMPAIGN_CODE] DEFAULT (''),
    [TITLE] varchar(60) NOT NULL CONSTRAINT [DF_Campaign_TITLE] DEFAULT (''),
    [DESCRIPTION] varchar(255) NOT NULL CONSTRAINT [DF_Campaign_DESCRIPTION] DEFAULT (''),
    [DEFAULT_FUND] varchar(5) NOT NULL CONSTRAINT [DF_Campaign_DEFAULT_FUND] DEFAULT (''),
    [GOAL] numeric(15, 2) NOT NULL CONSTRAINT [DF_Campaign_GOAL] DEFAULT (0),
    [BEGINS_DATE] datetime NULL,
    [ENDS_DATE] datetime NULL,
    [IS_PERPETUAL] tinyint NOT NULL CONSTRAINT [DF_Campaign_IS_PERPETUAL] DEFAULT (0),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[CampaignMain]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[CampaignMain] (
    [CampaignKey] uniqueidentifier NOT NULL,
    [Name] nvarchar(100) NOT NULL,
    [LegacyCampaignCode] nvarchar(10) NOT NULL,
    [CampaignTypeCode] int NOT NULL CONSTRAINT [DF_CampaignMain_CampaignTypeCode] DEFAULT (2),
    [Description] nvarchar(200) NULL CONSTRAINT [DF_CampaignMain_Description] DEFAULT (''),
    [CampaignStatusCode] int NOT NULL CONSTRAINT [DF_CampaignMain_CampaignStatusCode] DEFAULT (0),
    [CostCollection] ntext NULL,
    [TargetRevenue] decimal(18, 4) NOT NULL CONSTRAINT [DF_CampaignMain_TargetRevenue] DEFAULT (0),
    [PredictedResponseRate] decimal(5, 4) NOT NULL CONSTRAINT [DF_CampaignMain_PredictedResponseRate] DEFAULT (0),
    [TotalRevenue] decimal(18, 4) NOT NULL CONSTRAINT [DF_CampaignMain_TotalRevenue] DEFAULT (0),
    [PrimaryOwnerUserKey] uniqueidentifier NOT NULL,
    [StartDate] datetime NULL,
    [EndDate] datetime NULL,
    [UpdatedOn] datetime NOT NULL CONSTRAINT [DF_CampaignMain_UpdatedOn] DEFAULT (getdate()),
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [LowResponseAmount] decimal(18, 4) NOT NULL CONSTRAINT [DF_CampaignMain_LowResponseAmount] DEFAULT (0),
    [HighResponseAmount] decimal(18, 4) NOT NULL CONSTRAINT [DF_CampaignMain_HighResponseAmount] DEFAULT (0),
    [ActualCost] decimal(18, 4) NOT NULL CONSTRAINT [DF_CampaignMain_ActualCost] DEFAULT (0),
    [EstimatedCost] decimal(18, 4) NOT NULL CONSTRAINT [DF_CampaignMain_EstimatedCost] DEFAULT (0),
    [ExtendedCost] decimal(18, 4) NOT NULL CONSTRAINT [DF_CampaignMain_ExtendedCost] DEFAULT (0),
    [OverheadCost] decimal(18, 4) NOT NULL CONSTRAINT [DF_CampaignMain_OverheadCost] DEFAULT (0),
    [FirstResponseDate] datetime NULL,
    [LastResponseDate] datetime NULL,
    [TotalPositiveResponse] int NOT NULL CONSTRAINT [DF_CampaignMain_TotalPositiveResponse] DEFAULT (0),
    [TotalNegativeResponse] int NOT NULL CONSTRAINT [DF_CampaignMain_TotalNegativeResponse] DEFAULT (0),
    [TotalSolicited] int NOT NULL CONSTRAINT [DF_CampaignMain_TotalSolicited] DEFAULT (0),
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedOn] datetime NOT NULL,
    [MarkedForDeleteOn] datetime NULL,
    [AccessKey] uniqueidentifier NOT NULL,
    [SystemEntityKey] uniqueidentifier NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[CampaignParticipation]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[CampaignParticipation] (
    [CampaignParticipationKey] uniqueidentifier NOT NULL,
    [CampaignKey] uniqueidentifier NOT NULL,
    [RespondentUserKey] uniqueidentifier NOT NULL,
    [ResponseTypeCode] int NOT NULL,
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedOn] datetime NOT NULL,
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [UpdatedOn] datetime NOT NULL,
    [MarkedForDeleteOn] datetime NULL,
    [OptOutSourceCodeKey] uniqueidentifier NULL,
    [OptedOutOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[CampaignStatusRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[CampaignStatusRef] (
    [CampaignStatusCode] int NOT NULL,
    [CampaignStatusDesc] nvarchar(50) NOT NULL,
    [CampaignStatusName] nvarchar(20) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[CampaignTypeRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[CampaignTypeRef] (
    [CampaignTypeCode] int NOT NULL,
    [CampaignTypeDesc] nvarchar(50) NOT NULL,
    [CampaignTypeName] nvarchar(20) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Cart]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Cart] (
    [CartKey] uniqueidentifier NOT NULL,
    [UserId] nvarchar(50) NULL,
    [ComboOrder] nvarchar(max) NULL,
    [CreatedBy] nvarchar(50) NULL,
    [CreatedOn] datetime NULL,
    [UpdatedBy] nvarchar(50) NULL,
    [UpdatedOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[CartBilling]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[CartBilling] (
    [CartBillingId] int IDENTITY(1,1) NOT NULL,
    [CartItemId] int NOT NULL,
    [ProductCode] varchar(31) NOT NULL,
    [Title] varchar(60) NULL,
    [DuesType] varchar(10) NULL,
    [Price] money NOT NULL,
    [ID] varchar(10) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[CartEvent]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[CartEvent] (
    [CartEventID] int IDENTITY(1,1) NOT NULL,
    [CartItemID] int NOT NULL,
    [RegistrantID] varchar(10) NULL,
    [EventCode] varchar(15) NOT NULL,
    [Title] varchar(60) NOT NULL,
    [RegistrantClass] varchar(5) NOT NULL,
    [Complete] bit NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[CartEventFunction]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[CartEventFunction] (
    [CartEventFunctionID] int IDENTITY(1,1) NOT NULL,
    [CartEventID] int NOT NULL,
    [FunctionCode] varchar(31) NULL,
    [Quantity] int NOT NULL,
    [Title] varchar(60) NOT NULL,
    [Price] money NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[CartItem]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[CartItem] (
    [CartItemID] int IDENTITY(1,1) NOT NULL,
    [UserID] varchar(64) NOT NULL,
    [ItemType] varchar(64) NULL,
    [Created] datetime NOT NULL,
    [LastUpdated] datetime NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[CartOrder]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[CartOrder] (
    [CartOrderID] int IDENTITY(1,1) NOT NULL,
    [CartItemID] int NOT NULL,
    [Quantity] int NOT NULL,
    [Price] money NOT NULL,
    [Title] varchar(60) NOT NULL,
    [ProductCode] varchar(31) NOT NULL,
    [OrderProductID] int NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Cash_Accounts]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Cash_Accounts] (
    [CASH_ACCOUNT_CODE] varchar(10) NOT NULL CONSTRAINT [DF_Cash_Accounts_CASH_ACCOUNT_CODE] DEFAULT (''),
    [DESCRIPTION] varchar(40) NOT NULL CONSTRAINT [DF_Cash_Accounts_DESCRIPTION] DEFAULT (''),
    [ACCOUNT_TYPE] tinyint NOT NULL CONSTRAINT [DF_Cash_Accounts_ACCOUNT_TYPE] DEFAULT (0),
    [ORG_CODE] varchar(5) NOT NULL CONSTRAINT [DF_Cash_Accounts_ORG_CODE] DEFAULT (''),
    [GL_ACCOUNT] varchar(50) NOT NULL CONSTRAINT [DF_Cash_Accounts_GL_ACCOUNT] DEFAULT (''),
    [CCAuthAcctCode] varchar(20) NOT NULL CONSTRAINT [DF_Cash_Accounts_CCAuthAcctCode] DEFAULT (''),
    [CSC_REQUIRED_WEB] bit NOT NULL CONSTRAINT [DF_Cash_Accounts_CSC_REQUIRED_WEB] DEFAULT (0),
    [CSC_REQUIRED_CS] bit NOT NULL CONSTRAINT [DF_Cash_Accounts_CSC_REQUIRED_CS] DEFAULT (0),
    [ISSUE_NO_FLAG] tinyint NOT NULL CONSTRAINT [DF_Cash_Accounts_ISSUE_NO_FLAG] DEFAULT (0),
    [ISSUE_DATE_FLAG] tinyint NOT NULL CONSTRAINT [DF_Cash_Accounts_ISSUE_DATE_FLAG] DEFAULT (0),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[CCAuthAcct]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[CCAuthAcct] (
    [CCAuthAcctCode] varchar(20) NOT NULL CONSTRAINT [DF_CCAuthAcct_CCAuthAcctCode] DEFAULT (''),
    [CCAuthAcctDescription] varchar(255) NOT NULL CONSTRAINT [DF_CCAuthAcct_CCAuthAcctDescription] DEFAULT (''),
    [CCAuthMode] tinyint NOT NULL CONSTRAINT [DF_CCAuthAcct_CCAuthMode] DEFAULT (0),
    [CCAuthAdminEmail] varchar(255) NOT NULL CONSTRAINT [DF_CCAuthAcct_CCAuthAdminEmail] DEFAULT (''),
    [CCAuthURL] varchar(255) NOT NULL CONSTRAINT [DF_CCAuthAcct_CCAuthURL] DEFAULT (''),
    [CCAuthGateway] varchar(255) NOT NULL CONSTRAINT [DF_CCAuthAcct_CCAuthGateway] DEFAULT (''),
    [CCAuthPort] int NOT NULL CONSTRAINT [DF_CCAuthAcct_CCAuthPort] DEFAULT (0),
    [CCAuthUser] varchar(255) NOT NULL CONSTRAINT [DF_CCAuthAcct_CCAuthUser] DEFAULT (''),
    [CCAuthPassword] varchar(255) NOT NULL CONSTRAINT [DF_CCAuthAcct_CCAuthPassword] DEFAULT (''),
    [CCAuthVerisignPartner] varchar(255) NOT NULL CONSTRAINT [DF_CCAuthAcct_CCAuthVerisignPartner] DEFAULT (''),
    [CCAuthVerisignVendor] varchar(255) NOT NULL CONSTRAINT [DF_CCAuthAcct_CCAuthVerisignVendor] DEFAULT (''),
    [CCAuthTimeout] int NOT NULL CONSTRAINT [DF_CCAuthAcct_CCAuthTimeout] DEFAULT (0),
    [CCAuthVerisignProxyServer] varchar(255) NOT NULL CONSTRAINT [DF_CCAuthAcct_CCAuthVerisignProxyServer] DEFAULT (''),
    [CCAuthVerisignProxyPort] varchar(255) NOT NULL CONSTRAINT [DF_CCAuthAcct_CCAuthVerisignProxyPort] DEFAULT (''),
    [CCAuthVerisignProxyUser] varchar(255) NOT NULL CONSTRAINT [DF_CCAuthAcct_CCAuthVerisignProxyUser] DEFAULT (''),
    [CCAuthVerisignProxyPassword] varchar(255) NOT NULL CONSTRAINT [DF_CCAuthAcct_CCAuthVerisignProxyPassword] DEFAULT (''),
    [CCAuthVoidURL] varchar(255) NOT NULL CONSTRAINT [DF_CCAuthAcct_CCAuthVoidURL] DEFAULT (''),
    [CCAuthReturnURL] varchar(255) NOT NULL CONSTRAINT [DF_CCAuthAcct_CCAuthReturnURL] DEFAULT (''),
    [CCAuthQueryURL] varchar(255) NOT NULL CONSTRAINT [DF_CCAuthAcct_CCAuthQueryURL] DEFAULT (''),
    [CCAuthCaptureURL] varchar(255) NOT NULL CONSTRAINT [DF_CCAuthAcct_CCAuthCaptureURL] DEFAULT (''),
    [CCAuthConfPath] varchar(255) NOT NULL CONSTRAINT [DF_CCAuthAcct_CCAuthConfPath] DEFAULT (''),
    [CCAuthSaveCscBeforeAuth] tinyint NOT NULL CONSTRAINT [DF_CCAuthAcct_CCAuthSaveCscBeforeAuth] DEFAULT (0),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Cert_Comp_Cat]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Cert_Comp_Cat] (
    [CATEGORY] varchar(31) NOT NULL CONSTRAINT [DF_Cert_Comp_Cat_CATEGORY] DEFAULT (''),
    [DESCRIPTION] varchar(100) NOT NULL CONSTRAINT [DF_Cert_Comp_Cat_DESCRIPTION] DEFAULT (''),
    [UNITS_REQUIRED] numeric(15, 2) NOT NULL CONSTRAINT [DF_Cert_Comp_Cat_UNITS_REQUIRED] DEFAULT (0),
    [SUPER_CATEGORY] bit NOT NULL CONSTRAINT [DF_Cert_Comp_Cat_SUPER_CATEGORY] DEFAULT (0),
    [SUBCATEGORY_NAMES] text NULL,
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Cert_Prog_Lines]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Cert_Prog_Lines] (
    [PROGRAM_ID] varchar(31) NOT NULL CONSTRAINT [DF_Cert_Prog_Lines_PROGRAM_ID] DEFAULT (''),
    [COMPONENT_CODE] varchar(31) NOT NULL CONSTRAINT [DF_Cert_Prog_Lines_COMPONENT_CODE] DEFAULT (''),
    [COMPONENT_CATEGORY] varchar(31) NOT NULL CONSTRAINT [DF_Cert_Prog_Lines_COMPONENT_CATEGORY] DEFAULT (''),
    [LINE_NUMBER] int NOT NULL CONSTRAINT [DF_Cert_Prog_Lines_LINE_NUMBER] DEFAULT (0),
    [LINE_TYPE] varchar(10) NOT NULL CONSTRAINT [DF_Cert_Prog_Lines_LINE_TYPE] DEFAULT (''),
    [UNITS_REQUIRED_FOR_CREDIT] numeric(15, 2) NOT NULL CONSTRAINT [DF_Cert_Prog_Lines_UNITS_REQUIRED_FOR_CREDIT] DEFAULT (0),
    [REQUIREMENT_TYPE] tinyint NOT NULL CONSTRAINT [DF_Cert_Prog_Lines_REQUIREMENT_TYPE] DEFAULT (0),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Cert_Program]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Cert_Program] (
    [ID] varchar(31) NOT NULL CONSTRAINT [DF_Cert_Program_ID] DEFAULT (''),
    [INDUSTRY_CODE] varchar(50) NOT NULL CONSTRAINT [DF_Cert_Program_INDUSTRY_CODE] DEFAULT (''),
    [TITLE] varchar(50) NOT NULL CONSTRAINT [DF_Cert_Program_TITLE] DEFAULT (''),
    [DESCRIPTION] text NULL,
    [STATUS] varchar(1) NOT NULL CONSTRAINT [DF_Cert_Program_STATUS] DEFAULT (''),
    [INITIAL_BEGIN_DATE] datetime NULL,
    [INITIAL_END_DATE] datetime NULL,
    [INITIAL_REGISTRATION_DEADLINE] datetime NULL,
    [INITIAL_DATE_RULE] tinyint NOT NULL CONSTRAINT [DF_Cert_Program_INITIAL_DATE_RULE] DEFAULT (0),
    [BEGIN_DATE_FIELD] varchar(255) NOT NULL CONSTRAINT [DF_Cert_Program_BEGIN_DATE_FIELD] DEFAULT (''),
    [INITIAL_COMPLETION_MONTHS] int NOT NULL CONSTRAINT [DF_Cert_Program_INITIAL_COMPLETION_MONTHS] DEFAULT (0),
    [COORDINATORS] text NULL,
    [INCOME_ACCOUNT] varchar(50) NOT NULL CONSTRAINT [DF_Cert_Program_INCOME_ACCOUNT] DEFAULT (''),
    [DEFERRED_INCOME_ACCOUNT] varchar(50) NOT NULL CONSTRAINT [DF_Cert_Program_DEFERRED_INCOME_ACCOUNT] DEFAULT (''),
    [PRICE_1] numeric(15, 2) NOT NULL CONSTRAINT [DF_Cert_Program_PRICE_1] DEFAULT (0),
    [PRICE_2] numeric(15, 2) NOT NULL CONSTRAINT [DF_Cert_Program_PRICE_2] DEFAULT (0),
    [PRICE_RULES_EXIST] bit NOT NULL CONSTRAINT [DF_Cert_Program_PRICE_RULES_EXIST] DEFAULT (0),
    [TAXABLE] bit NOT NULL CONSTRAINT [DF_Cert_Program_TAXABLE] DEFAULT (0),
    [PST_TAXABLE] bit NOT NULL CONSTRAINT [DF_Cert_Program_PST_TAXABLE] DEFAULT (0),
    [TAX_TAXABLE] bit NOT NULL CONSTRAINT [DF_Cert_Program_TAX_TAXABLE] DEFAULT (0),
    [TAX_AUTHORITY] varchar(20) NOT NULL CONSTRAINT [DF_Cert_Program_TAX_AUTHORITY] DEFAULT (''),
    [PREREQUISITES] text NULL,
    [NOTES] text NULL,
    [CURRENTLY_ENROLLED] int NOT NULL CONSTRAINT [DF_Cert_Program_CURRENTLY_ENROLLED] DEFAULT (0),
    [TOTAL_PASSED] int NOT NULL CONSTRAINT [DF_Cert_Program_TOTAL_PASSED] DEFAULT (0),
    [TOTAL_FAILED] int NOT NULL CONSTRAINT [DF_Cert_Program_TOTAL_FAILED] DEFAULT (0),
    [UF_1] varchar(100) NOT NULL CONSTRAINT [DF_Cert_Program_UF_1] DEFAULT (''),
    [UF_2] varchar(100) NOT NULL CONSTRAINT [DF_Cert_Program_UF_2] DEFAULT (''),
    [UF_3] varchar(100) NOT NULL CONSTRAINT [DF_Cert_Program_UF_3] DEFAULT (''),
    [UF_4] varchar(100) NOT NULL CONSTRAINT [DF_Cert_Program_UF_4] DEFAULT (''),
    [PROGRAM_TYPE] tinyint NOT NULL CONSTRAINT [DF_Cert_Program_PROGRAM_TYPE] DEFAULT (0),
    [DATE_ESTABLISHED] datetime NULL,
    [AUTO_ENROLL_FOR_MAINT] bit NOT NULL CONSTRAINT [DF_Cert_Program_AUTO_ENROLL_FOR_MAINT] DEFAULT (0),
    [ROTATE_DATE_RULE] tinyint NOT NULL CONSTRAINT [DF_Cert_Program_ROTATE_DATE_RULE] DEFAULT (0),
    [ROTATE_BEGIN_DATE] datetime NULL,
    [ROTATE_COMPLETION_MONTHS] tinyint NOT NULL CONSTRAINT [DF_Cert_Program_ROTATE_COMPLETION_MONTHS] DEFAULT (0),
    [UNITS_TO_COMPLETE] int NOT NULL CONSTRAINT [DF_Cert_Program_UNITS_TO_COMPLETE] DEFAULT (0),
    [UNITS_TO_MAINTAIN] int NOT NULL CONSTRAINT [DF_Cert_Program_UNITS_TO_MAINTAIN] DEFAULT (0),
    [ENABLE_GRACE_PERIOD] bit NOT NULL CONSTRAINT [DF_Cert_Program_ENABLE_GRACE_PERIOD] DEFAULT (0),
    [GRACE_PERIOD_MONTHS] tinyint NOT NULL CONSTRAINT [DF_Cert_Program_GRACE_PERIOD_MONTHS] DEFAULT (0),
    [GRACE_PERIOD_FOR_INIT] bit NOT NULL CONSTRAINT [DF_Cert_Program_GRACE_PERIOD_FOR_INIT] DEFAULT (0),
    [GRACE_PERIOD_FOR_MAINT] bit NOT NULL CONSTRAINT [DF_Cert_Program_GRACE_PERIOD_FOR_MAINT] DEFAULT (0),
    [DESIGNATION_1] varchar(20) NOT NULL CONSTRAINT [DF_Cert_Program_DESIGNATION_1] DEFAULT (''),
    [DESIGNATION_2] varchar(20) NOT NULL CONSTRAINT [DF_Cert_Program_DESIGNATION_2] DEFAULT (''),
    [DESIGNATION_3] varchar(20) NOT NULL CONSTRAINT [DF_Cert_Program_DESIGNATION_3] DEFAULT (''),
    [JOINT_PROGRAM] varchar(31) NOT NULL CONSTRAINT [DF_Cert_Program_JOINT_PROGRAM] DEFAULT (''),
    [INITIAL_DATE_CALC] varchar(50) NOT NULL CONSTRAINT [DF_Cert_Program_INITIAL_DATE_CALC] DEFAULT (''),
    [ROTATE_DATE_CALC] varchar(50) NOT NULL CONSTRAINT [DF_Cert_Program_ROTATE_DATE_CALC] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Cert_Register]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Cert_Register] (
    [SEQN] int NOT NULL CONSTRAINT [DF_Cert_Register_SEQN] DEFAULT (0),
    [STUDENT_ID] varchar(10) NOT NULL CONSTRAINT [DF_Cert_Register_STUDENT_ID] DEFAULT (''),
    [BT_ID] varchar(10) NOT NULL CONSTRAINT [DF_Cert_Register_BT_ID] DEFAULT (''),
    [REGISTRATION_ITEM] varchar(31) NOT NULL CONSTRAINT [DF_Cert_Register_REGISTRATION_ITEM] DEFAULT (''),
    [REG_TYPE] varchar(1) NOT NULL CONSTRAINT [DF_Cert_Register_REG_TYPE] DEFAULT (''),
    [DESCRIPTION] varchar(255) NOT NULL CONSTRAINT [DF_Cert_Register_DESCRIPTION] DEFAULT (''),
    [STATUS] varchar(1) NOT NULL CONSTRAINT [DF_Cert_Register_STATUS] DEFAULT (''),
    [UNITS_EARNED] numeric(15, 2) NOT NULL CONSTRAINT [DF_Cert_Register_UNITS_EARNED] DEFAULT (0),
    [GRADE_TEXT] varchar(25) NOT NULL CONSTRAINT [DF_Cert_Register_GRADE_TEXT] DEFAULT (''),
    [ENROLLED_DATE] datetime NULL,
    [COMPLETION_DATE] datetime NULL,
    [CANCELED_DATE] datetime NULL,
    [GOOD_THRU_DATE] datetime NULL,
    [DEADLINE] datetime NULL,
    [TOTAL_CHARGES] numeric(15, 2) NOT NULL CONSTRAINT [DF_Cert_Register_TOTAL_CHARGES] DEFAULT (0),
    [ORDER_NUMBER] numeric(15, 2) NOT NULL CONSTRAINT [DF_Cert_Register_ORDER_NUMBER] DEFAULT (0),
    [ACTIVITY_SEQN] int NOT NULL CONSTRAINT [DF_Cert_Register_ACTIVITY_SEQN] DEFAULT (0),
    [PROGRAM_ID] varchar(31) NOT NULL CONSTRAINT [DF_Cert_Register_PROGRAM_ID] DEFAULT (''),
    [BOARD_NOTIFIED] bit NOT NULL CONSTRAINT [DF_Cert_Register_BOARD_NOTIFIED] DEFAULT (0),
    [STUDENT_NOTIFIED] bit NOT NULL CONSTRAINT [DF_Cert_Register_STUDENT_NOTIFIED] DEFAULT (0),
    [BOARD_NOTIFIED_DATE] datetime NULL,
    [STUDENT_NOTIFIED_DATE] datetime NULL,
    [NOTES] text NULL,
    [UF_1] bit NOT NULL CONSTRAINT [DF_Cert_Register_UF_1] DEFAULT (0),
    [UF_2] bit NOT NULL CONSTRAINT [DF_Cert_Register_UF_2] DEFAULT (0),
    [UF_3] varchar(100) NOT NULL CONSTRAINT [DF_Cert_Register_UF_3] DEFAULT (''),
    [UF_4] varchar(100) NOT NULL CONSTRAINT [DF_Cert_Register_UF_4] DEFAULT (''),
    [REQUIREMENT_TYPE] tinyint NOT NULL CONSTRAINT [DF_Cert_Register_REQUIREMENT_TYPE] DEFAULT (0),
    [PROGRAM_REG_SEQN] int NOT NULL CONSTRAINT [DF_Cert_Register_PROGRAM_REG_SEQN] DEFAULT (0),
    [IN_GRACE_PERIOD] bit NOT NULL CONSTRAINT [DF_Cert_Register_IN_GRACE_PERIOD] DEFAULT (0),
    [COMPONENT_INSTANCE] varchar(31) NOT NULL CONSTRAINT [DF_Cert_Register_COMPONENT_INSTANCE] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[CertificationModule]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[CertificationModule] (
    [CertificationModuleKey] uniqueidentifier NOT NULL,
    [CertificationModuleName] nvarchar(50) NOT NULL,
    [CertificationModuleCode] nvarchar(50) NOT NULL,
    [CertificationModuleDesc] nvarchar(250) NULL,
    [NumberOfUnits] decimal(18, 8) NULL,
    [RequiresGradeFlag] bit NOT NULL,
    [RequiresApprovalFlag] bit NOT NULL,
    [CertificationStaffOnlyFlag] bit NOT NULL,
    [CertificationModuleLocation] nvarchar(50) NULL,
    [CertificationModuleDate] datetime NULL,
    [CertificationModuleStatusCode] nchar(2) NULL,
    [UpdatedOn] datetime NOT NULL,
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedOn] datetime NOT NULL,
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [MarkedForDeleteOn] datetime NULL,
    [AttachmentInstructions] nvarchar(250) NULL,
    [FileAttachment] tinyint NOT NULL CONSTRAINT [DF_CertificationModule_FileAttachment] DEFAULT (0),
    [EnrolleeCanRecordFlag] bit NOT NULL CONSTRAINT [DF_CertificationModule_EnrolleeCanRecordFlag] DEFAULT (1)
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[CertificationModuleGrade]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[CertificationModuleGrade] (
    [CertificationModuleGradeKey] uniqueidentifier NOT NULL,
    [CertificationModuleKey] uniqueidentifier NOT NULL,
    [GradeKey] uniqueidentifier NOT NULL,
    [PassFlag] bit NOT NULL,
    [UpdatedOn] datetime NOT NULL,
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedOn] datetime NOT NULL,
    [CreatedByUserKey] uniqueidentifier NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[CertificationModuleProduct]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[CertificationModuleProduct] (
    [CertificationModuleProductKey] uniqueidentifier NOT NULL,
    [CertificationModuleKey] uniqueidentifier NOT NULL,
    [ProductCode] varchar(31) NOT NULL,
    [UpdatedOn] datetime NOT NULL,
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedOn] datetime NOT NULL,
    [CreatedByUserKey] uniqueidentifier NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[CertificationModuleRegistration]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[CertificationModuleRegistration] (
    [CertificationModuleRegistrationKey] uniqueidentifier NOT NULL,
    [CertificationProgramRegistrationKey] uniqueidentifier NOT NULL,
    [CertificationModuleKey] uniqueidentifier NOT NULL,
    [CustomerExperienceKey] uniqueidentifier NULL,
    [RegistrationDate] datetime NOT NULL,
    [RegistrationStatusCode] char(2) NOT NULL,
    [EarnedUnits] decimal(18, 9) NULL,
    [FileAttachmentDocumentKey] uniqueidentifier NULL,
    [AvailableUnits] decimal(18, 9) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[CertificationModuleStatusRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[CertificationModuleStatusRef] (
    [CertificationModuleStatusCode] nchar(2) NOT NULL,
    [CertificationModuleStatusName] nvarchar(50) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[CertificationProgram]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[CertificationProgram] (
    [CertificationProgramKey] uniqueidentifier NOT NULL,
    [CertificationProgramName] nvarchar(250) NULL,
    [CertificationProgramDescription] nvarchar(250) NULL,
    [AddDesignationFlag] bit NOT NULL,
    [AutoEnrollFlag] bit NOT NULL,
    [ExperienceUnitKey] uniqueidentifier NULL,
    [MinimumValue] decimal(18, 0) NULL,
    [MaximumValue] decimal(18, 0) NULL,
    [CertificationProgramStatusCode] nchar(2) NOT NULL,
    [RequiresApprovalFlag] bit NOT NULL CONSTRAINT [DF_CertificationProgram_RequiresApprovalFlag] DEFAULT ('0'),
    [ProcessBlueprint] ntext NULL,
    [RequiredNumberOfUnits] numeric(18, 8) NULL,
    [StagesInOrder] bit NOT NULL,
    [DeadlinePeriodTimeUnit] bigint NOT NULL,
    [DeadlinePeriodMultiplier] int NOT NULL,
    [GracePeriodTimeUnit] bigint NULL,
    [GracePeriodMultiplier] int NULL,
    [CertificationProgramGroupKey] uniqueidentifier NULL,
    [PreRequiredProgramKey] uniqueidentifier NULL,
    [IsMultipleIterationFlag] bit NOT NULL CONSTRAINT [DF_CertificationProgram_IsMultipleIterationFlag] DEFAULT ('0'),
    [FormatCertificationNumber] ntext NULL,
    [CreatedOn] datetime NOT NULL,
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [UpdatedOn] datetime NULL,
    [UpdatedByUserKey] uniqueidentifier NULL,
    [MarkedForDeleteOn] datetime NULL,
    [LastCertificationNumber] int NULL,
    [Designation] nvarchar(20) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[CertificationProgramCertificationModule]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[CertificationProgramCertificationModule] (
    [CertificationProgramKey] uniqueidentifier NOT NULL,
    [CertificationModuleKey] uniqueidentifier NOT NULL,
    [CertificationProgramCertificationModuleKey] uniqueidentifier NOT NULL CONSTRAINT [DF_CertificationProgramCertificationModule_CertificationProgramCertificationModuleKey] DEFAULT (newid())
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[CertificationProgramProduct]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[CertificationProgramProduct] (
    [CertificationProgramProductKey] uniqueidentifier NOT NULL,
    [CertificationProgramKey] uniqueidentifier NOT NULL,
    [ProductCode] varchar(31) NOT NULL,
    [UpdatedOn] datetime NOT NULL,
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedOn] datetime NOT NULL,
    [CreatedByUserKey] uniqueidentifier NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[CertificationProgramRegistration]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[CertificationProgramRegistration] (
    [CertificationProgramRegistrationKey] uniqueidentifier NOT NULL,
    [CertificationProgramKey] uniqueidentifier NOT NULL,
    [RegistrationDate] datetime NOT NULL,
    [GracePeriodDate] datetime NOT NULL,
    [ExpirationDate] datetime NOT NULL,
    [ActionManifest] ntext NOT NULL,
    [RegistrationStatusCode] char(2) NOT NULL,
    [CurrentStageName] nvarchar(200) NULL,
    [EarnedUnits] decimal(18, 9) NULL,
    [FormattedCertificationNumber] ntext NULL,
    [CertificationNumber] int NULL,
    [CreatedOn] datetime NOT NULL,
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [UpdatedOn] datetime NULL,
    [UpdatedByUserKey] uniqueidentifier NULL,
    [ContactKey] uniqueidentifier NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[CertificationProgramRegistrationCertificationModule]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[CertificationProgramRegistrationCertificationModule] (
    [CertificationProgramRegistrationKey] uniqueidentifier NOT NULL,
    [CertificationModuleKey] uniqueidentifier NOT NULL,
    [CertificationProgramRegistrationCertificationModuleKey] uniqueidentifier NOT NULL CONSTRAINT [DF_CertificationProgramRegistrationCertificationModule_CertificationProgramRegistrationCertificationModuleKey] DEFAULT (newid())
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[ChangeLog]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ChangeLog] (
    [ChangeLogKey] uniqueidentifier NOT NULL CONSTRAINT [DF_ChangeLog_ChangeLogKey] DEFAULT (newid()),
    [OrganizationKey] uniqueidentifier NOT NULL,
    [ObjectTypeName] nvarchar(100) NOT NULL,
    [ObjectKey] uniqueidentifier NOT NULL,
    [ActionType] tinyint NULL,
    [Description] nvarchar(250) NULL,
    [CreatedOn] datetime NOT NULL,
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[ChangeProperty]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ChangeProperty] (
    [ChangeLogKey] uniqueidentifier NOT NULL,
    [PropertyName] nvarchar(100) NOT NULL,
    [OriginalValue] nvarchar(250) NULL,
    [OriginalDescription] nvarchar(250) NULL,
    [CurrentValue] nvarchar(250) NULL,
    [CurrentDescription] nvarchar(250) NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[CheckCategoryRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[CheckCategoryRef] (
    [CheckCategoryCode] int NOT NULL,
    [CheckCategoryDesc] nvarchar(50) NOT NULL,
    [CheckCategoryName] nvarchar(20) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[CM5Migration]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[CM5Migration] (
    [ImportItemID] varchar(50) NULL,
    [ImportItemType] varchar(50) NULL,
    [NewItemKey] uniqueidentifier NULL,
    [ImportedDateTime] datetime NULL CONSTRAINT [DF_CM5Migration_ImportedDateTime] DEFAULT (getdate()),
    [Message] ntext NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[CM5MigrationVariableMapping]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[CM5MigrationVariableMapping] (
    [SystemConfigParameterName] nvarchar(255) NOT NULL,
    [SystemVariableName] varchar(40) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Cmty_Administrators]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Cmty_Administrators] (
    [COMMUNITY_SEQ] int NOT NULL CONSTRAINT [DF_Cmty_Administrators_COMMUNITY_SEQ] DEFAULT (0),
    [ID] varchar(10) NOT NULL CONSTRAINT [DF_Cmty_Administrators_ID] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Cmty_Discussion_Forums]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Cmty_Discussion_Forums] (
    [FORUM_SEQ] int NOT NULL CONSTRAINT [DF_Cmty_Discussion_Forums_FORUM_SEQ] DEFAULT (0),
    [FORUM_TITLE] varchar(80) NOT NULL CONSTRAINT [DF_Cmty_Discussion_Forums_FORUM_TITLE] DEFAULT (''),
    [FORUM_DESCRIPTION] varchar(255) NOT NULL CONSTRAINT [DF_Cmty_Discussion_Forums_FORUM_DESCRIPTION] DEFAULT (''),
    [COMMUNITY_SEQ] int NOT NULL CONSTRAINT [DF_Cmty_Discussion_Forums_COMMUNITY_SEQ] DEFAULT (0),
    [ID] varchar(10) NOT NULL CONSTRAINT [DF_Cmty_Discussion_Forums_ID] DEFAULT (''),
    [STATUS] varchar(5) NOT NULL CONSTRAINT [DF_Cmty_Discussion_Forums_STATUS] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Cmty_Discussion_Posts]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Cmty_Discussion_Posts] (
    [POST_SEQ] int NOT NULL CONSTRAINT [DF_Cmty_Discussion_Posts_POST_SEQ] DEFAULT (0),
    [TOPIC_SEQ] int NOT NULL CONSTRAINT [DF_Cmty_Discussion_Posts_TOPIC_SEQ] DEFAULT (0),
    [FORUM_SEQ] int NOT NULL CONSTRAINT [DF_Cmty_Discussion_Posts_FORUM_SEQ] DEFAULT (0),
    [COMMUNITY_SEQ] int NOT NULL CONSTRAINT [DF_Cmty_Discussion_Posts_COMMUNITY_SEQ] DEFAULT (0),
    [POST_TITLE] varchar(80) NOT NULL CONSTRAINT [DF_Cmty_Discussion_Posts_POST_TITLE] DEFAULT (''),
    [TREE_LOCATION] varchar(255) NULL,
    [ID] varchar(10) NOT NULL CONSTRAINT [DF_Cmty_Discussion_Posts_ID] DEFAULT (''),
    [ANONYMOUS_FLAG] bit NOT NULL CONSTRAINT [DF_Cmty_Discussion_Posts_ANONYMOUS_FLAG] DEFAULT (0),
    [DATE_STORED] datetime NULL,
    [STATUS] varchar(5) NOT NULL CONSTRAINT [DF_Cmty_Discussion_Posts_STATUS] DEFAULT (''),
    [DATE_LAST_POST] datetime NULL,
    [POST_COUNT] int NULL,
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Cmty_Email_Notification]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Cmty_Email_Notification] (
    [COMMUNITY_SEQ] int NOT NULL CONSTRAINT [DF_Cmty_Email_Notification_COMMUNITY_SEQ] DEFAULT (0),
    [ID] varchar(10) NOT NULL CONSTRAINT [DF_Cmty_Email_Notification_ID] DEFAULT (''),
    [NOTIFICATION_TYPE] varchar(5) NOT NULL CONSTRAINT [DF_Cmty_Email_Notification_NOTIFICATION_TYPE] DEFAULT (''),
    [NOTIFICATION_FREQ] varchar(5) NOT NULL CONSTRAINT [DF_Cmty_Email_Notification_NOTIFICATION_FREQ] DEFAULT (''),
    [STATUS] varchar(5) NOT NULL CONSTRAINT [DF_Cmty_Email_Notification_STATUS] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Cmty_Invitees]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Cmty_Invitees] (
    [COMMUNITY_SEQ] int NOT NULL CONSTRAINT [DF_Cmty_Invitees_COMMUNITY_SEQ] DEFAULT (0),
    [ID] varchar(10) NOT NULL CONSTRAINT [DF_Cmty_Invitees_ID] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Cmty_News]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Cmty_News] (
    [NEWS_SEQ] int NOT NULL CONSTRAINT [DF_Cmty_News_NEWS_SEQ] DEFAULT (0),
    [NEWS_TITLE] varchar(80) NOT NULL CONSTRAINT [DF_Cmty_News_NEWS_TITLE] DEFAULT (''),
    [COMMUNITY_SEQ] int NOT NULL CONSTRAINT [DF_Cmty_News_COMMUNITY_SEQ] DEFAULT (0),
    [ID] varchar(10) NOT NULL CONSTRAINT [DF_Cmty_News_ID] DEFAULT (''),
    [PRIORITY] varchar(5) NOT NULL CONSTRAINT [DF_Cmty_News_PRIORITY] DEFAULT (''),
    [STATUS] varchar(5) NOT NULL CONSTRAINT [DF_Cmty_News_STATUS] DEFAULT (''),
    [PRIORITY_DOWNGRADE_DATE] datetime NULL,
    [STATUS_DOWNGRADE_DATE] datetime NULL,
    [DATE_STORED] datetime NULL,
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Cmty_Read_Tracking]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Cmty_Read_Tracking] (
    [ID] varchar(10) NOT NULL CONSTRAINT [DF_Cmty_Read_Tracking_ID] DEFAULT (''),
    [COMMUNITY_SEQ] int NOT NULL CONSTRAINT [DF_Cmty_Read_Tracking_COMMUNITY_SEQ] DEFAULT (0),
    [FORUM_SEQ] int NOT NULL CONSTRAINT [DF_Cmty_Read_Tracking_FORUM_SEQ] DEFAULT (0),
    [ITEM_TYPE] varchar(5) NOT NULL CONSTRAINT [DF_Cmty_Read_Tracking_ITEM_TYPE] DEFAULT (''),
    [LAST_READ_DATE] datetime NULL,
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Cmty_Shared_Files]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Cmty_Shared_Files] (
    [FILE_SEQ] int NOT NULL CONSTRAINT [DF_Cmty_Shared_Files_FILE_SEQ] DEFAULT (0),
    [FOLDER_SEQ] int NOT NULL CONSTRAINT [DF_Cmty_Shared_Files_FOLDER_SEQ] DEFAULT (0),
    [COMMUNITY_SEQ] int NOT NULL CONSTRAINT [DF_Cmty_Shared_Files_COMMUNITY_SEQ] DEFAULT (0),
    [ID] varchar(10) NOT NULL CONSTRAINT [DF_Cmty_Shared_Files_ID] DEFAULT (''),
    [FILE_DESCRIPTION] varchar(255) NOT NULL CONSTRAINT [DF_Cmty_Shared_Files_FILE_DESCRIPTION] DEFAULT (''),
    [FILE_NAME] varchar(255) NOT NULL CONSTRAINT [DF_Cmty_Shared_Files_FILE_NAME] DEFAULT (''),
    [FILE_SIZE] varchar(50) NOT NULL CONSTRAINT [DF_Cmty_Shared_Files_FILE_SIZE] DEFAULT (''),
    [PRIORITY] varchar(5) NOT NULL CONSTRAINT [DF_Cmty_Shared_Files_PRIORITY] DEFAULT (''),
    [DATE_STORED] datetime NULL,
    [STATUS] varchar(5) NOT NULL CONSTRAINT [DF_Cmty_Shared_Files_STATUS] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Cmty_Shared_Folders]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Cmty_Shared_Folders] (
    [FOLDER_SEQ] int NOT NULL CONSTRAINT [DF_Cmty_Shared_Folders_FOLDER_SEQ] DEFAULT (0),
    [COMMUNITY_SEQ] int NOT NULL CONSTRAINT [DF_Cmty_Shared_Folders_COMMUNITY_SEQ] DEFAULT (0),
    [FOLDER_TITLE] varchar(80) NOT NULL CONSTRAINT [DF_Cmty_Shared_Folders_FOLDER_TITLE] DEFAULT (''),
    [FOLDER_DESCRIPTION] varchar(255) NOT NULL CONSTRAINT [DF_Cmty_Shared_Folders_FOLDER_DESCRIPTION] DEFAULT (''),
    [ID] varchar(10) NOT NULL CONSTRAINT [DF_Cmty_Shared_Folders_ID] DEFAULT (''),
    [STATUS] varchar(5) NOT NULL CONSTRAINT [DF_Cmty_Shared_Folders_STATUS] DEFAULT (''),
    [FOLDER_PARENT] int NOT NULL CONSTRAINT [DF_Cmty_Shared_Folders_FOLDER_PARENT] DEFAULT (0),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Cmty_Subscription]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Cmty_Subscription] (
    [COMMUNITY_SEQ] int NOT NULL CONSTRAINT [DF_Cmty_Subscription_COMMUNITY_SEQ] DEFAULT (0),
    [ID] varchar(10) NOT NULL CONSTRAINT [DF_Cmty_Subscription_ID] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Comment_Log]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Comment_Log] (
    [COMMENT_LOG_NUM] int NOT NULL CONSTRAINT [DF_Comment_Log_COMMENT_LOG_NUM] DEFAULT (0),
    [ID] varchar(10) NOT NULL CONSTRAINT [DF_Comment_Log_ID] DEFAULT (''),
    [FROM_EMAIL] varchar(100) NOT NULL CONSTRAINT [DF_Comment_Log_FROM_EMAIL] DEFAULT (''),
    [SUBJECT] varchar(100) NOT NULL CONSTRAINT [DF_Comment_Log_SUBJECT] DEFAULT (''),
    [COMMENT_TYPE] varchar(60) NOT NULL CONSTRAINT [DF_Comment_Log_COMMENT_TYPE] DEFAULT (''),
    [CREATE_DATE] datetime NULL,
    [PROCESSED] varchar(3) NOT NULL CONSTRAINT [DF_Comment_Log_PROCESSED] DEFAULT (''),
    [COMMENT_CONTENT] text NULL,
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Comment_Types]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Comment_Types] (
    [COMMENT_TYPE] varchar(60) NOT NULL CONSTRAINT [DF_Comment_Types_COMMENT_TYPE] DEFAULT (''),
    [COMMENT_DESCR] varchar(255) NOT NULL CONSTRAINT [DF_Comment_Types_COMMENT_DESCR] DEFAULT (''),
    [ID] varchar(10) NOT NULL CONSTRAINT [DF_Comment_Types_ID] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[CommissionRateTypeRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[CommissionRateTypeRef] (
    [CommissionRateTypeCode] nchar(3) NOT NULL,
    [CommissionRateTypeDesc] nvarchar(50) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Committee_Minutes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Committee_Minutes] (
    [PRODUCT_CODE] varchar(32) NOT NULL CONSTRAINT [DF_Committee_Minutes_PRODUCT_CODE] DEFAULT (''),
    [MEETING_DATE] datetime NOT NULL,
    [NOTE] text NULL,
    [OBJECT] image NULL,
    [UF_1] int NOT NULL CONSTRAINT [DF_Committee_Minutes_UF_1] DEFAULT (0),
    [UF_2] int NOT NULL CONSTRAINT [DF_Committee_Minutes_UF_2] DEFAULT (0),
    [UF_3] varchar(255) NOT NULL CONSTRAINT [DF_Committee_Minutes_UF_3] DEFAULT (''),
    [UF_4] varchar(255) NOT NULL CONSTRAINT [DF_Committee_Minutes_UF_4] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Committee_Position]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Committee_Position] (
    [POSITION_CODE] varchar(40) NOT NULL CONSTRAINT [DF_Committee_Position_POSITION_CODE] DEFAULT (''),
    [TITLE] varchar(80) NOT NULL CONSTRAINT [DF_Committee_Position_TITLE] DEFAULT (''),
    [RANK] int NOT NULL CONSTRAINT [DF_Committee_Position_RANK] DEFAULT (0),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[CommunicationReasonRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[CommunicationReasonRef] (
    [CommunicationReasonKey] uniqueidentifier NOT NULL,
    [CommunicationReasonDesc] nvarchar(100) NOT NULL,
    [Formula] nvarchar(500) NOT NULL,
    [IsDefaultType] bit NOT NULL,
    [DefaultOptOutFlag] bit NOT NULL,
    [CannotOptOutFlag] bit NOT NULL CONSTRAINT [DF_CommunicationReasonRef_CannotOptOutFlag] DEFAULT (0),
    [IsSolicitation] bit NOT NULL CONSTRAINT [DF_CommunicationReasonRef_IsSolicitation] DEFAULT (0)
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Community]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Community] (
    [COMMUNITY_SEQ] int NOT NULL CONSTRAINT [DF_Community_COMMUNITY_SEQ] DEFAULT (0),
    [COMMUNITY_TITLE] varchar(80) NOT NULL CONSTRAINT [DF_Community_COMMUNITY_TITLE] DEFAULT (''),
    [COMMUNITY_DESCRIPTION] varchar(255) NOT NULL CONSTRAINT [DF_Community_COMMUNITY_DESCRIPTION] DEFAULT (''),
    [COMMUNITY_TYPE] varchar(5) NOT NULL CONSTRAINT [DF_Community_COMMUNITY_TYPE] DEFAULT (''),
    [MO_RESTRICT_TYPE] varchar(5) NOT NULL CONSTRAINT [DF_Community_MO_RESTRICT_TYPE] DEFAULT (''),
    [MO_RESTRICT_GROUP] varchar(255) NULL,
    [MO_CRITERIA] text NULL,
    [MAX_DISCUSSION_AGE] int NOT NULL CONSTRAINT [DF_Community_MAX_DISCUSSION_AGE] DEFAULT (0),
    [STATUS] varchar(5) NOT NULL CONSTRAINT [DF_Community_STATUS] DEFAULT (''),
    [DATE_STORED] datetime NULL,
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[CompanyNaicsSic]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[CompanyNaicsSic] (
    [ContactKey] uniqueidentifier NOT NULL,
    [NaicsSicCode] int NOT NULL,
    [IsSic] bit NOT NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[ComparisonRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ComparisonRef] (
    [ComparisonCode] int NOT NULL,
    [ComparisonDesc] nvarchar(50) NOT NULL,
    [ComparisonName] nvarchar(20) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Component_Email]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Component_Email] (
    [ComponentCode] char(2) NOT NULL,
    [ComponentEmailCode] char(2) NOT NULL,
    [EnabledFlag] char(1) NULL,
    [CustomForClientFlag] char(1) NOT NULL,
    [ComponentEmailDesc] varchar(2000) NOT NULL,
    [EmailSubject] varchar(255) NULL,
    [FromEmailAddress] varchar(255) NULL,
    [CCEmailAddress] varchar(255) NULL,
    [BCCEmailAddress] varchar(255) NULL,
    [EmailText] text NULL,
    [DefaultEmailSubject] varchar(255) NULL,
    [DefaultEmailText] text NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Component_Email_Variable_Ref]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Component_Email_Variable_Ref] (
    [ComponentCode] char(2) NOT NULL,
    [ComponentEmailCode] char(2) NOT NULL,
    [ComponentEmailVariableCode] varchar(100) NOT NULL,
    [CustomForClientFlag] char(1) NOT NULL,
    [ComponentEmailVariableDesc] varchar(2000) NULL,
    [CodeVariableName] varchar(100) NULL,
    [CustomVariableForClientFlag] char(1) NULL,
    [DefaultValue] varchar(1000) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Component_Interest_Category]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Component_Interest_Category] (
    [ComponentCode] char(2) NOT NULL,
    [InterestCategoryID] numeric(18, 0) NOT NULL,
    [ComponentID] numeric(18, 0) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Component_Interest_Group]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Component_Interest_Group] (
    [ComponentCode] char(2) NOT NULL,
    [InterestCategoryID] numeric(18, 0) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Component_Ref]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Component_Ref] (
    [ComponentCode] char(2) NOT NULL,
    [ComponentDesc] varchar(30) NOT NULL,
    [ComponentTable] varchar(30) NULL,
    [ComponentColumn] varchar(30) NULL,
    [DisplayColumnName] varchar(30) NULL,
    [SearchURL] varchar(200) NULL,
    [EditURL] varchar(200) NULL,
    [IconFileName] varchar(50) NULL,
    [UseInSearchFlag] char(1) NULL,
    [DirectoryName] varchar(255) NULL,
    [ActiveFlag] char(1) NULL,
    [TaggableFlag] char(1) NOT NULL CONSTRAINT [DF_Component_Ref_TaggableFlag] DEFAULT ('N'),
    [IconDesc] varchar(30) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Component_Script_Ref]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Component_Script_Ref] (
    [ComponentCode] char(2) NOT NULL,
    [ComponentScriptCode] char(2) NOT NULL,
    [ComponentScriptDesc] varchar(100) NULL,
    [ParameterScript] varchar(255) NULL,
    [ParameterFormScript] varchar(255) NULL,
    [NewScript] varchar(255) NULL,
    [ShortListScript] varchar(255) NULL,
    [FullListScript] varchar(255) NULL,
    [PublishScript] varchar(255) NULL,
    [DisplayScript] varchar(255) NULL,
    [ShowInTemplateFlag] char(1) NULL,
    [SendSectionFlag] char(1) NULL,
    [AspNetFlag] char(1) NOT NULL CONSTRAINT [DF_Component_Script_Ref_AspNetFlag] DEFAULT ('N'),
    [SubComponentCode] char(2) NULL,
    [EditScript] varchar(255) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[ComponentCategoryRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ComponentCategoryRef] (
    [ComponentCategoryKey] uniqueidentifier NOT NULL CONSTRAINT [DF_ComponentCategoryRef_ComponentCategoryKey] DEFAULT (newid()),
    [ComponentCategoryName] nvarchar(30) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[ComponentRegistry]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ComponentRegistry] (
    [ComponentKey] uniqueidentifier NOT NULL CONSTRAINT [DF_ComponentRegistry_ComponentKey] DEFAULT (newid()),
    [Name] nvarchar(50) NOT NULL CONSTRAINT [DF_ComponentRegistry_Name] DEFAULT (''),
    [Description] nvarchar(250) NOT NULL CONSTRAINT [DF_ComponentRegistry_Description] DEFAULT (''),
    [InterfaceName] nvarchar(100) NOT NULL CONSTRAINT [DF_ComponentRegistry_InterfaceName] DEFAULT (''),
    [TypeName] nvarchar(200) NOT NULL CONSTRAINT [DF_ComponentRegistry_TypeName] DEFAULT (''),
    [AssemblyName] nvarchar(100) NOT NULL CONSTRAINT [DF_ComponentRegistry_AssemblyName] DEFAULT (''),
    [ConfigureWebUserControl] nvarchar(128) NULL CONSTRAINT [DF_ComponentRegistry_ConfigureWebUserControl] DEFAULT (''),
    [ConfigureWindowsControl] nvarchar(128) NULL CONSTRAINT [DF_ComponentRegistry_ConfigureWindowsControl] DEFAULT (''),
    [IsTyped] bit NOT NULL CONSTRAINT [DF_ComponentRegistry_IsTyped] DEFAULT (0),
    [IsBusinessItem] bit NOT NULL CONSTRAINT [DF_ComponentRegistry_IsBusinessItem] DEFAULT (0),
    [ComponentSummaryContentKey] uniqueidentifier NULL,
    [ComponentNewLink] nvarchar(768) NULL,
    [ComponentEditLink] nvarchar(768) NULL,
    [ComponentExecuteLink] nvarchar(768) NULL,
    [DeploymentPackageCode] nvarchar(50) NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[ComponentRegistryCategory]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ComponentRegistryCategory] (
    [ComponentKey] uniqueidentifier NOT NULL CONSTRAINT [DF_ComponentRegistryCategory_ComponentKey] DEFAULT (newid()),
    [ComponentCategoryKey] uniqueidentifier NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[ContactAddress]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ContactAddress] (
    [ContactAddressKey] uniqueidentifier NOT NULL,
    [AddressKey] uniqueidentifier NOT NULL,
    [ContactKey] uniqueidentifier NOT NULL,
    [AddressTypeKey] uniqueidentifier NOT NULL,
    [IsPreferredOverall] bit NOT NULL,
    [IsPreferredForCategory] bit NOT NULL,
    [IsOptOut] bit NOT NULL,
    [NoSolicitationFlag] bit NOT NULL,
    [AddressCategoryCode] int NOT NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[ContactBiography]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ContactBiography] (
    [ContactKey] uniqueidentifier NOT NULL,
    [Summary] nvarchar(255) NULL,
    [Text] ntext NULL,
    [IsPublic] bit NOT NULL CONSTRAINT [DF_ContactBiography_IsPublic] DEFAULT (0),
    [InBusinessSinceYear] decimal(4, 0) NULL,
    [Locations] nvarchar(255) NULL,
    [UpdatedOn] datetime NOT NULL CONSTRAINT [DF_ContactBiography_UpdatedOn] DEFAULT (getdate()),
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [BiographyReferences] nvarchar(255) NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[ContactCommunicationReasonPreferences]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ContactCommunicationReasonPreferences] (
    [ContactKey] uniqueidentifier NOT NULL,
    [CommunicationReasonKey] uniqueidentifier NOT NULL,
    [PreferredAddressCategoryCode] int NULL,
    [NoCommunicationByMailFlag] bit NOT NULL CONSTRAINT [DF_ContactCommunicationReasonPreferences_NoCommunicationByMailFlag] DEFAULT (0),
    [NoCommunicationByPhoneFlag] bit NOT NULL CONSTRAINT [DF_ContactCommunicationReasonPreferences_NoCommunicationByPhoneFlag] DEFAULT (0),
    [NoCommunicationByFaxFlag] bit NOT NULL CONSTRAINT [DF_ContactCommunicationReasonPreferences_NoCommunicationByFaxFlag] DEFAULT (0),
    [NoCommunicationByEmailFlag] bit NOT NULL CONSTRAINT [DF_ContactCommunicationReasonPreferences_NoCommunicationByEmailFlag] DEFAULT (0),
    [ContactCommunicationReasonPreferencesKey] uniqueidentifier NOT NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[ContactDuplicateCheckFormula]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ContactDuplicateCheckFormula] (
    [ContactDuplicateCheckFormulaKey] uniqueidentifier NOT NULL,
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedOn] datetime NOT NULL,
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [UpdatedOn] datetime NOT NULL,
    [SystemEntityKey] uniqueidentifier NOT NULL,
    [FormulaName] nvarchar(50) NOT NULL,
    [FormulaText] nvarchar(500) NOT NULL,
    [FormulaType] int NOT NULL,
    [MatchPercent] int NOT NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[ContactDuplicateCheckFormulaTypeRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ContactDuplicateCheckFormulaTypeRef] (
    [ContactDuplicateCheckFormulaTypeCode] int NOT NULL,
    [ContactDuplicateCheckFormulaTypeName] nvarchar(15) NOT NULL,
    [ContactDuplicateCheckFormulaTypeDesc] nvarchar(50) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[ContactEducation]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ContactEducation] (
    [ContactEducationKey] uniqueidentifier NOT NULL,
    [ContactKey] uniqueidentifier NOT NULL,
    [EducationLevelCode] nvarchar(10) NOT NULL,
    [StartYear] decimal(4, 0) NULL,
    [Specialty] nvarchar(50) NULL,
    [School] nvarchar(100) NULL,
    [UpdatedOn] datetime NOT NULL CONSTRAINT [DF_ContactEducation_UpdatedOn] DEFAULT (getdate()),
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [EndYear] decimal(4, 0) NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[ContactFundraising]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ContactFundraising] (
    [ContactKey] uniqueidentifier NOT NULL,
    [SoftCreditGroupKey] uniqueidentifier NULL,
    [SolicitorGroupKey] uniqueidentifier NULL,
    [ReceiptPreferenceCode] int NOT NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[ContactLog]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ContactLog] (
    [ContactLogKey] uniqueidentifier NOT NULL,
    [ContactKey] uniqueidentifier NOT NULL,
    [SourceCodeCode] nvarchar(40) NOT NULL,
    [Description] nvarchar(200) NOT NULL,
    [OutputOn] datetime NOT NULL,
    [CreatedOn] datetime NOT NULL,
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [OrganizationKey] uniqueidentifier NOT NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[ContactMain]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ContactMain] (
    [ContactKey] uniqueidentifier NOT NULL,
    [ContactStatusCode] nvarchar(2) NOT NULL,
    [FullName] nvarchar(110) NOT NULL,
    [SortName] nvarchar(110) NOT NULL,
    [IsInstitute] bit NOT NULL,
    [TaxIDNumber] nvarchar(12) NULL,
    [NoSolicitationFlag] bit NOT NULL,
    [SyncContactID] varchar(20) NULL,
    [UpdatedOn] datetime NOT NULL CONSTRAINT [DF_ContactMain_UpdatedOn] DEFAULT (getdate()),
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [IsIDEditable] bit NULL,
    [ID] nvarchar(12) NULL,
    [PreferredAddressCategoryCode] int NOT NULL,
    [IsSortNameOverridden] bit NOT NULL CONSTRAINT [DF_ContactMain_IsSortNameOverridden] DEFAULT (0),
    [PrimaryMembershipGroupKey] uniqueidentifier NULL,
    [MajorKey] nvarchar(30) NULL,
    [AccessKey] uniqueidentifier NOT NULL,
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedOn] datetime NOT NULL,
    [TextOnlyEmailFlag] bit NOT NULL CONSTRAINT [DF_ContactMain_TextOnlyEmailFlag] DEFAULT (0),
    [ContactTypeKey] uniqueidentifier NOT NULL,
    [OptOutFlag] bit NOT NULL CONSTRAINT [DF_ContactMain_OptOutFlag] DEFAULT (0),
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[ContactOffering]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ContactOffering] (
    [ContactKey] uniqueidentifier NOT NULL,
    [ContactOfferingKey] uniqueidentifier NOT NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[ContactOfferingRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ContactOfferingRef] (
    [ContactOfferingKey] uniqueidentifier NOT NULL,
    [ContactOfferingDesc] nvarchar(30) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[ContactPicture]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ContactPicture] (
    [ContactPictureKey] uniqueidentifier NOT NULL,
    [ContactKey] uniqueidentifier NOT NULL,
    [Picture] image NULL,
    [PicturePurposeKey] uniqueidentifier NOT NULL,
    [MimeType] nvarchar(100) NULL,
    [Description] nvarchar(255) NULL,
    [UpdatedOn] datetime NOT NULL CONSTRAINT [DF_ContactPicture_UpdatedOn] DEFAULT (getdate()),
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [IsPreferred] bit NULL CONSTRAINT [DF_ContactPicture_IsPreferred] DEFAULT (0),
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Contacts]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Contacts] (
    [NAME] varchar(75) NOT NULL CONSTRAINT [DF_Contacts_NAME] DEFAULT (''),
    [SERVICES] varchar(50) NOT NULL CONSTRAINT [DF_Contacts_SERVICES] DEFAULT (''),
    [COUNTY] varchar(20) NOT NULL CONSTRAINT [DF_Contacts_COUNTY] DEFAULT (''),
    [CITY] varchar(40) NOT NULL CONSTRAINT [DF_Contacts_CITY] DEFAULT (''),
    [STATE] varchar(15) NOT NULL CONSTRAINT [DF_Contacts_STATE] DEFAULT (''),
    [CODES] varchar(50) NOT NULL CONSTRAINT [DF_Contacts_CODES] DEFAULT (''),
    [CONTACT_ID] varchar(10) NOT NULL CONSTRAINT [DF_Contacts_CONTACT_ID] DEFAULT (''),
    [ADDRESS] varchar(50) NOT NULL CONSTRAINT [DF_Contacts_ADDRESS] DEFAULT (''),
    [COMPANY] varchar(80) NOT NULL CONSTRAINT [DF_Contacts_COMPANY] DEFAULT (''),
    [PHONE] varchar(25) NOT NULL CONSTRAINT [DF_Contacts_PHONE] DEFAULT (''),
    [FAX] varchar(25) NOT NULL CONSTRAINT [DF_Contacts_FAX] DEFAULT (''),
    [BRANCH] varchar(80) NOT NULL CONSTRAINT [DF_Contacts_BRANCH] DEFAULT (''),
    [EMAIL] varchar(100) NOT NULL CONSTRAINT [DF_Contacts_EMAIL] DEFAULT (''),
    [WEBSITE] varchar(255) NOT NULL CONSTRAINT [DF_Contacts_WEBSITE] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[ContactSalutation]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ContactSalutation] (
    [ContactKey] uniqueidentifier NOT NULL,
    [SalutationKey] uniqueidentifier NOT NULL,
    [SalutationText] nvarchar(500) NOT NULL,
    [IsOverridden] bit NOT NULL,
    [ContactSalutationKey] uniqueidentifier NOT NULL,
    [IsDeletable] bit NOT NULL CONSTRAINT [DF_ContactSalutation_IsDeletable] DEFAULT (1),
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[ContactSkill]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ContactSkill] (
    [ContactKey] uniqueidentifier NOT NULL,
    [ContactSkillKey] uniqueidentifier NOT NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[ContactSkillRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ContactSkillRef] (
    [ContactSkillKey] uniqueidentifier NOT NULL,
    [ContactSkillDesc] nvarchar(30) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[ContactSocialNetwork]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ContactSocialNetwork] (
    [ContactSocialNetworkKey] uniqueidentifier NOT NULL CONSTRAINT [DF_ContactSocialNetwork_ContactSocialNetworkKey] DEFAULT (newid()),
    [SocialNetworkKey] uniqueidentifier NOT NULL,
    [ContactKey] uniqueidentifier NOT NULL,
    [SocialNetworkUserName] nvarchar(255) NULL,
    [SocialNetworkUserId] nvarchar(255) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[ContactStatusRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ContactStatusRef] (
    [ContactStatusCode] nvarchar(2) NOT NULL,
    [ContactStatusDesc] nvarchar(50) NOT NULL,
    [IsSystem] bit NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[ContactTypeRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ContactTypeRef] (
    [ContactTypeKey] uniqueidentifier NOT NULL,
    [ContactTypeDesc] nvarchar(50) NOT NULL,
    [GroupTypeKey] uniqueidentifier NULL,
    [IsInstitute] bit NOT NULL CONSTRAINT [DF_ContactTypeRef_IsInstitute] DEFAULT (1)
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Content]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Content] (
    [Description] nvarchar(1000) NULL,
    [Keywords] nvarchar(255) NULL,
    [ShowInTemplateFlag] char(1) NULL,
    [PublishDateTime] datetime NULL,
    [PublishSetManuallyFlag] char(1) NULL,
    [PublishLocation] nvarchar(255) NULL,
    [ImportantUntilDate] datetime NULL,
    [ExpirationDate] datetime NULL,
    [ExpirationDays] int NULL,
    [ExpSetManuallyFlag] char(1) NULL,
    [ArchiveAtExpirationFlag] char(1) NULL,
    [ReminderSentDateTime] datetime NULL,
    [AutoCreatedFlag] char(1) NULL,
    [ListDefaultPublishLocation] nvarchar(255) NULL,
    [PublicationDate] datetime NULL,
    [SubscriptionDate] datetime NULL,
    [PublishFrequency] int NOT NULL CONSTRAINT [DF_Content_PublishFrequency] DEFAULT (0),
    [SuppressBannersFlag] char(1) NULL,
    [ContentID] numeric(18, 0) IDENTITY(2000,1) NOT NULL,
    [WorkflowStatusCode] char(1) NULL,
    [OriginalContentID] numeric(18, 0) NULL,
    [PreviousContentID] numeric(18, 0) NULL,
    [NavMenuID] numeric(18, 0) NULL,
    [Name] varchar(255) NULL,
    [URLSafeName] varchar(255) NULL,
    [OpenInNewWindowFlag] char(1) NULL,
    [FuseFlag] char(1) NULL,
    [SecureFlag] char(1) NULL,
    [OwnerContactID] numeric(18, 0) NULL,
    [ContactID] numeric(18, 0) NULL,
    [OwnerSetManuallyFlag] char(1) NULL,
    [SortOrder] numeric(18, 0) NULL,
    [MembersOnlyFlag] char(1) NULL,
    [UserDefinedDate1] datetime NULL,
    [UserDefinedDate2] datetime NULL,
    [UserDefinedString1] varchar(255) NULL,
    [UserDefinedString2] varchar(255) NULL,
    [UserDefinedNumeric1] numeric(18, 0) NULL,
    [UserDefinedNumeric2] numeric(18, 0) NULL,
    [ComponentCode] char(2) NULL CONSTRAINT [DF_Content_ComponentCode] DEFAULT ('CM'),
    [PreFuseURL] varchar(255) NULL,
    [PostFuseURL] varchar(255) NULL,
    [UserDefinedDate3] datetime NULL,
    [UserDefinedDate4] datetime NULL,
    [UserDefinedDate5] datetime NULL,
    [UserDefinedString3] varchar(255) NULL,
    [UserDefinedString4] varchar(255) NULL,
    [UserDefinedString5] varchar(255) NULL,
    [UserDefinedNumeric3] numeric(18, 0) NULL,
    [UserDefinedNumeric4] numeric(18, 0) NULL,
    [UserDefinedNumeric5] numeric(18, 0) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Content_Authority_Group]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Content_Authority_Group] (
    [ContentAuthorityGroupID] numeric(18, 0) IDENTITY(1,1) NOT NULL,
    [GroupName] varchar(100) NOT NULL,
    [SuperGroupFlag] char(1) NULL,
    [MicrositeFlag] char(1) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Content_Authority_Producer]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Content_Authority_Producer] (
    [ContentAuthorityGroupID] numeric(18, 0) NOT NULL,
    [ContactID] numeric(18, 0) NOT NULL,
    [ContentEditorFlag] char(1) NULL,
    [ContentApproverFlag] char(1) NULL,
    [NavCreatorFlag] char(1) NULL,
    [NavEditorFlag] char(1) NULL,
    [LayoutFlag] char(1) NULL,
    [EditorFlag] char(1) NULL,
    [CustomPageFlag] char(1) NULL,
    [ComponentScriptFlag] char(1) NULL,
    [UploadFlag] char(1) NULL,
    [DefaultOwnerFlag] char(1) NULL,
    [HighestToolbarLevelInd] char(1) NULL CONSTRAINT [DF_Content_Authority_Producer_HighestToolbarLevelInd] DEFAULT ('S')
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Content_Authority_Ref]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Content_Authority_Ref] (
    [ContentAuthorityID] numeric(18, 0) IDENTITY(1,1) NOT NULL,
    [ContentAuthorityCode] varchar(5) NOT NULL,
    [ContentAuthorityDesc] varchar(255) NULL,
    [ContentAuthorityShortDesc] varchar(50) NULL,
    [CategoryDepth] numeric(18, 0) NULL,
    [SortOrder] decimal(18, 0) NULL,
    [ParentContentAuthorityID] numeric(18, 0) NULL,
    [AncestoryContentAuthorityID] numeric(18, 0) NULL,
    [ActiveFlag] char(1) NULL,
    [ContentAuthorityLabel] varchar(50) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Content_Change_Request]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Content_Change_Request] (
    [ContentChangeRequestID] numeric(18, 0) IDENTITY(1,1) NOT NULL,
    [ContentID] numeric(18, 0) NOT NULL,
    [AssignedToContactID] numeric(18, 0) NOT NULL,
    [AssignedByContactID] numeric(18, 0) NOT NULL,
    [RequestStatusCode] char(1) NOT NULL,
    [RequestText] varchar(500) NULL,
    [ReassignedToContactID] numeric(18, 0) NULL,
    [RequestDateTime] datetime NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Content_File]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Content_File] (
    [ContentFileID] numeric(18, 0) IDENTITY(1,1) NOT NULL,
    [ContentID] numeric(18, 0) NOT NULL,
    [FileTypeCode] varchar(4) NOT NULL,
    [Description] varchar(255) NULL,
    [SourceLocation] varchar(255) NULL,
    [PublishLocation] varchar(255) NULL,
    [FileName] varchar(255) NULL,
    [SortOrder] numeric(18, 0) NULL,
    [OriginalContentFileID] numeric(18, 0) NULL,
    [PreviousContentFileID] numeric(18, 0) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Content_HTML]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Content_HTML] (
    [ContentID] numeric(18, 0) NOT NULL,
    [Title] varchar(255) NOT NULL,
    [Body] text NOT NULL,
    [PublishLocation] varchar(255) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Content_Link]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Content_Link] (
    [ContentLinkID] numeric(18, 0) IDENTITY(1,1) NOT NULL,
    [ContentID] numeric(18, 0) NULL,
    [TaggedPageLayoutID] numeric(18, 0) NULL,
    [LinkName] varchar(255) NULL,
    [LinkURL] varchar(255) NULL,
    [SortOrder] numeric(18, 0) NULL,
    [PreviousContentLinkID] numeric(18, 0) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Content_Pages]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Content_Pages] (
    [PAGE_NUM] int NOT NULL CONSTRAINT [DF_Content_Pages_PAGE_NUM] DEFAULT (0),
    [PAGE_TITLE] varchar(255) NOT NULL CONSTRAINT [DF_Content_Pages_PAGE_TITLE] DEFAULT (''),
    [PAGE_DESCR] text NULL,
    [CREATION_DATE] datetime NULL,
    [EXPIRATION_DATE] datetime NULL,
    [BUILD_DATE] datetime NULL,
    [PAGE_TYPE] varchar(30) NOT NULL CONSTRAINT [DF_Content_Pages_PAGE_TYPE] DEFAULT (''),
    [SECURITY_GROUP] varchar(30) NOT NULL CONSTRAINT [DF_Content_Pages_SECURITY_GROUP] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Content_Publish_Server]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Content_Publish_Server] (
    [ContentID] numeric(18, 0) NOT NULL,
    [PublishServerCode] char(1) NOT NULL,
    [DefaultServerFlag] char(1) NOT NULL CONSTRAINT [DF_Content_Publish_Server_DefaultServerFlag] DEFAULT ('N')
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Content_Security_Group]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Content_Security_Group] (
    [ContentID] numeric(18, 0) NOT NULL,
    [SecurityGroupCode] varchar(20) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Content_Workflow_Log]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Content_Workflow_Log] (
    [ContentID] numeric(18, 0) NOT NULL,
    [WorkflowStatusCode] char(1) NOT NULL,
    [ContactID] numeric(18, 0) NOT NULL,
    [ChangeDateTime] datetime NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[ContentChangeRequest]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ContentChangeRequest] (
    [ContentChangeRequestKey] uniqueidentifier NOT NULL,
    [ContentDocumentVersionKey] uniqueidentifier NOT NULL,
    [ContentRequestStatusCode] int NOT NULL,
    [AssignedByUserKey] uniqueidentifier NOT NULL,
    [AssignedToUserKey] uniqueidentifier NULL,
    [RequestText] nvarchar(2000) NOT NULL,
    [RequestDateTime] datetime NOT NULL,
    [ReassignedToUserKey] uniqueidentifier NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[ContentFilter]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ContentFilter] (
    [DocumentVersionKey] uniqueidentifier NOT NULL,
    [PropertyName] nvarchar(100) NOT NULL,
    [BooleanValue] bit NULL,
    [DateTimeValue] datetime NULL,
    [DecimalValue] decimal(18, 4) NULL,
    [StringValue] nvarchar(max) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[ContentManagerAuthorityGroup]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ContentManagerAuthorityGroup] (
    [GroupKey] uniqueidentifier NOT NULL,
    [IsMasterAdmin] bit NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[ContentUserDefinedFieldValue]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ContentUserDefinedFieldValue] (
    [ContentDocumentVersionKey] uniqueidentifier NOT NULL,
    [UserDefinedFieldKey] uniqueidentifier NOT NULL,
    [Value] nvarchar(2000) NULL,
    [ValueText] ntext NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[ContentWorkflowParameters]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ContentWorkflowParameters] (
    [DocumentVersionKey] uniqueidentifier NOT NULL,
    [PublishedVersion] bit NOT NULL,
    [ContentAuthorityGroupKey] uniqueidentifier NOT NULL,
    [OwnerGroupMemberKey] uniqueidentifier NULL,
    [NumberOfDaysBeforeExpiration] int NULL,
    [ExpirationDate] datetime NULL,
    [FirstWarningSentOn] datetime NULL,
    [SecondWarningSentOn] datetime NULL,
    [FirstNotificationSentOn] datetime NULL,
    [SecondNotificationSentOn] datetime NULL,
    [AdditionalNoticeSentOn] datetime NULL,
    [RecycleAtExpiration] bit NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[CostMethodRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[CostMethodRef] (
    [CostMethodCode] int NOT NULL,
    [CostMethodDesc] nvarchar(30) NOT NULL,
    [CostMethodName] nvarchar(10) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[CostTier]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[CostTier] (
    [CostTierKey] uniqueidentifier NOT NULL,
    [ProductKey] uniqueidentifier NOT NULL,
    [QuantityOnHand] decimal(18, 8) NOT NULL,
    [QuantityReceived] decimal(18, 8) NOT NULL,
    [UnitCost] decimal(18, 4) NOT NULL,
    [DateReceived] datetime NOT NULL,
    [WarehouseKey] uniqueidentifier NOT NULL,
    [TotalCost] decimal(18, 4) NOT NULL,
    [ProductInventoryKey] uniqueidentifier NULL,
    [UomKey] uniqueidentifier NOT NULL,
    [OriginalReceiptKey] uniqueidentifier NULL,
    [CostMethodCode] int NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Counter]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Counter] (
    [COUNTER_NAME] char(30) NOT NULL CONSTRAINT [DF_Counter_COUNTER_NAME] DEFAULT (''),
    [LAST_VALUE] int NOT NULL CONSTRAINT [DF_Counter_LAST_VALUE] DEFAULT (0),
    [LAST_UPDATED] datetime NULL,
    [UPDATED_BY] varchar(255) NOT NULL CONSTRAINT [DF_Counter_UPDATED_BY] DEFAULT (''),
    [PAGEPAD1] char(255) NOT NULL CONSTRAINT [DF_Counter_PAGEPAD1] DEFAULT (''),
    [PAGEPAD2] char(255) NOT NULL CONSTRAINT [DF_Counter_PAGEPAD2] DEFAULT (''),
    [PAGEPAD3] char(255) NOT NULL CONSTRAINT [DF_Counter_PAGEPAD3] DEFAULT (''),
    [PAGEPAD4] char(255) NOT NULL CONSTRAINT [DF_Counter_PAGEPAD4] DEFAULT (''),
    [HAS_CHECKSUM] bit NOT NULL CONSTRAINT [DF_Counter_HAS_CHECKSUM] DEFAULT (0),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Country_Addr_Layouts]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Country_Addr_Layouts] (
    [ADDRESS_FORMAT] tinyint NOT NULL CONSTRAINT [DF_Country_Addr_Layouts_ADDRESS_FORMAT] DEFAULT (0),
    [ADDRESS_LAYOUT] varchar(255) NOT NULL CONSTRAINT [DF_Country_Addr_Layouts_ADDRESS_LAYOUT] DEFAULT (''),
    [FORMULA] varchar(255) NOT NULL CONSTRAINT [DF_Country_Addr_Layouts_FORMULA] DEFAULT (''),
    [DESCRIPTION] varchar(255) NOT NULL CONSTRAINT [DF_Country_Addr_Layouts_DESCRIPTION] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Country_Names]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Country_Names] (
    [COUNTRY] varchar(25) NOT NULL CONSTRAINT [DF_Country_Names_COUNTRY] DEFAULT (''),
    [MAIL_GROUP] varchar(10) NOT NULL CONSTRAINT [DF_Country_Names_MAIL_GROUP] DEFAULT (''),
    [ADDRESS_FORMAT] tinyint NOT NULL CONSTRAINT [DF_Country_Names_ADDRESS_FORMAT] DEFAULT (0),
    [VAT_COUNTRY_CODE] varchar(2) NOT NULL CONSTRAINT [DF_Country_Names_VAT_COUNTRY_CODE] DEFAULT (''),
    [INTRASTAT_CODE] varchar(2) NOT NULL CONSTRAINT [DF_Country_Names_INTRASTAT_CODE] DEFAULT (''),
    [USE_CANADA_TAX] bit NOT NULL CONSTRAINT [DF_Country_Names_USE_CANADA_TAX] DEFAULT (0),
    [DEFAULT_SHIPPING_METHOD] varchar(20) NOT NULL CONSTRAINT [DF_Country_Names_DEFAULT_SHIPPING_METHOD] DEFAULT (''),
    [MIN_VAT_CODE_LEN] tinyint NOT NULL CONSTRAINT [DF_Country_Names_MIN_VAT_CODE_LEN] DEFAULT (0),
    [MAX_VAT_CODE_LEN] tinyint NOT NULL CONSTRAINT [DF_Country_Names_MAX_VAT_CODE_LEN] DEFAULT (0),
    [VAT_CODE_VALID_PROC] varchar(128) NOT NULL CONSTRAINT [DF_Country_Names_VAT_CODE_VALID_PROC] DEFAULT (''),
    [COUNTRY_CODE] varchar(2) NOT NULL CONSTRAINT [DF_Country_Names_COUNTRY_CODE] DEFAULT (''),
    [ISO_3DIGIT_CODE] varchar(3) NOT NULL CONSTRAINT [DF_Country_Names_ISO_3DIGIT_CODE] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[CountryRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[CountryRef] (
    [CountryCode] nchar(2) NOT NULL,
    [CountryName] nvarchar(50) NOT NULL,
    [AddressFormatKey] uniqueidentifier NOT NULL,
    [VATCountryCode] nvarchar(2) NULL,
    [IntraStateCode] nvarchar(2) NULL,
    [IsActive] bit NOT NULL,
    [IsHandModified] bit NOT NULL,
    [MailGroup] nvarchar(10) NULL,
    [DefaultShippingMethod] nvarchar(20) NULL,
    [SyncCountryName] nvarchar(50) NULL,
    [ChapterGroupKey] uniqueidentifier NULL,
    [ISO3DigitCode] nchar(3) NULL,
    [UpdatedOn] datetime NOT NULL,
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [CountryKey] uniqueidentifier NOT NULL CONSTRAINT [DF_CountryRef_CountryKey] DEFAULT (newid())
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[CreditTypeRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[CreditTypeRef] (
    [CreditTypeCode] nchar(2) NOT NULL,
    [CreditTypeDesc] nchar(20) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[CultureRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[CultureRef] (
    [CultureCode] nvarchar(10) NOT NULL,
    [CultureDesc] nvarchar(50) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[CustomerExperience]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[CustomerExperience] (
    [CustomerExperienceKey] uniqueidentifier NOT NULL,
    [CustomerExperienceNote] nvarchar(500) NULL,
    [CustomerExperienceStatusCode] char(2) NULL,
    [CreatedOn] datetime NOT NULL,
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [ContactKey] uniqueidentifier NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[CustomerExperienceStatusChange]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[CustomerExperienceStatusChange] (
    [CustomerExperienceStatusChangeKey] uniqueidentifier NOT NULL,
    [CustomerExperienceKey] uniqueidentifier NOT NULL,
    [CustomerExperienceStatusChangeNote] nvarchar(250) NULL,
    [StatusChangedOn] datetime NULL,
    [CustomerExperienceStatusCode] char(2) NOT NULL,
    [UpdatedOn] datetime NULL,
    [UpdatedByUserKey] uniqueidentifier NULL,
    [CreatedOn] datetime NULL,
    [CreatedByUserKey] uniqueidentifier NULL,
    [StatusChangedContactKey] uniqueidentifier NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[CustomerExperienceStatusRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[CustomerExperienceStatusRef] (
    [CustomerExperienceStatusCode] char(2) NOT NULL,
    [CustomerExperienceStatusName] nvarchar(50) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[CustomTabFields]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[CustomTabFields] (
    [SEQ] int NOT NULL CONSTRAINT [DF_CustomTabFields_SEQ] DEFAULT (0),
    [TABLE_NAME] varchar(30) NOT NULL CONSTRAINT [DF_CustomTabFields_TABLE_NAME] DEFAULT (''),
    [FIELD_NAME] varchar(30) NOT NULL CONSTRAINT [DF_CustomTabFields_FIELD_NAME] DEFAULT (''),
    [TABLE_FIELD_NAME] varchar(61) NOT NULL CONSTRAINT [DF_CustomTabFields_TABLE_FIELD_NAME] DEFAULT (''),
    [READ_ONLY] bit NOT NULL CONSTRAINT [DF_CustomTabFields_READ_ONLY] DEFAULT (0),
    [NEW_ROW] bit NOT NULL CONSTRAINT [DF_CustomTabFields_NEW_ROW] DEFAULT (0),
    [SQL_STRING] text NOT NULL CONSTRAINT [DF_CustomTabFields_SQL_STRING] DEFAULT (''),
    [PROMPT] varchar(30) NOT NULL CONSTRAINT [DF_CustomTabFields_PROMPT] DEFAULT (''),
    [VALIDATION_TABLE] varchar(30) NOT NULL CONSTRAINT [DF_CustomTabFields_VALIDATION_TABLE] DEFAULT (''),
    [FIELD_TYPE] varchar(30) NOT NULL CONSTRAINT [DF_CustomTabFields_FIELD_TYPE] DEFAULT (''),
    [FIELD_LENGTH] int NOT NULL CONSTRAINT [DF_CustomTabFields_FIELD_LENGTH] DEFAULT (0),
    [SQL_FIELD] bit NOT NULL CONSTRAINT [DF_CustomTabFields_SQL_FIELD] DEFAULT (0),
    [EDIT_TYPES] varchar(100) NOT NULL CONSTRAINT [DF_CustomTabFields_EDIT_TYPES] DEFAULT (''),
    [MULTI_SELECT] bit NOT NULL CONSTRAINT [DF_CustomTabFields_MULTI_SELECT] DEFAULT (0),
    [OBJ_HEIGHT] int NOT NULL CONSTRAINT [DF_CustomTabFields_OBJ_HEIGHT] DEFAULT (0),
    [DECIMAL_POSITIONS] tinyint NOT NULL CONSTRAINT [DF_CustomTabFields_DECIMAL_POSITIONS] DEFAULT (0),
    [AUTO_CONVERSION] tinyint NOT NULL CONSTRAINT [DF_CustomTabFields_AUTO_CONVERSION] DEFAULT (0),
    [DEFAULT_VALUE] varchar(255) NOT NULL CONSTRAINT [DF_CustomTabFields_DEFAULT_VALUE] DEFAULT (''),
    [TITLE] varchar(30) NOT NULL CONSTRAINT [DF_CustomTabFields_TITLE] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Data_Type_Ref]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Data_Type_Ref] (
    [DataTypeCode] char(2) NOT NULL,
    [DataTypeDesc] varchar(25) NOT NULL,
    [InputTypeCode] char(2) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[DataTypeRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[DataTypeRef] (
    [DataTypeCode] int NOT NULL,
    [DataTypeName] nvarchar(50) NOT NULL,
    [DataTypeDesc] nvarchar(50) NOT NULL,
    [DefaultHIControlTypeCode] int NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[DataVaultAttempt]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[DataVaultAttempt] (
    [DataVaultAttemptKey] uniqueidentifier NOT NULL,
    [Attempt] int NOT NULL,
    [DataVaultLogDetailKey] uniqueidentifier NOT NULL,
    [DataVaultLogKey] uniqueidentifier NULL,
    [FailedMessage] nvarchar(1000) NOT NULL CONSTRAINT [DF_DataVaultLogDetail_FailedMessage] DEFAULT (''),
    [Status] nvarchar(1) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[DataVaultAttemptStatusRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[DataVaultAttemptStatusRef] (
    [DataVaultAttemptStatusCode] nvarchar(1) NOT NULL,
    [DataVaultAttemptStatusDesc] nvarchar(50) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[DataVaultLog]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[DataVaultLog] (
    [DataVaultLogKey] uniqueidentifier NOT NULL,
    [BatchKey] uniqueidentifier NOT NULL,
    [BatchPart] int NOT NULL,
    [Status] nvarchar(1) NOT NULL,
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedOn] datetime NOT NULL CONSTRAINT [DF_DataVaultLog_CreatedOn] DEFAULT (getdate()),
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [UpdatedOn] datetime NOT NULL CONSTRAINT [DF_DataVaultLog_UpdatedOn] DEFAULT (getdate())
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[DataVaultLogDetail]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[DataVaultLogDetail] (
    [DataVaultLogDetailKey] uniqueidentifier NOT NULL,
    [InvoiceNumber] nvarchar(50) NOT NULL,
    [PaymentToken] nvarchar(255) NOT NULL,
    [Balance] decimal(18, 4) NOT NULL,
    [LastAttempt] int NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[DataVaultStatusRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[DataVaultStatusRef] (
    [DataVaultStatusCode] nvarchar(1) NOT NULL,
    [DataVaultStatusDesc] nvarchar(50) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Deferral_Matrix]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Deferral_Matrix] (
    [SEQN] int NOT NULL CONSTRAINT [DF_Deferral_Matrix_SEQN] DEFAULT (0),
    [DeferredAccount] varchar(50) NOT NULL CONSTRAINT [DF_Deferral_Matrix_DeferredAccount] DEFAULT (''),
    [BeginningPeriod] datetime NOT NULL,
    [Term] int NOT NULL CONSTRAINT [DF_Deferral_Matrix_Term] DEFAULT (0),
    [IncomeAccount] varchar(50) NOT NULL CONSTRAINT [DF_Deferral_Matrix_IncomeAccount] DEFAULT (''),
    [OriginalAmount] money NOT NULL CONSTRAINT [DF_Deferral_Matrix_OriginalAmount] DEFAULT (0),
    [AmountTransferred] money NOT NULL CONSTRAINT [DF_Deferral_Matrix_AmountTransferred] DEFAULT (0),
    [OrgCode] varchar(5) NOT NULL CONSTRAINT [DF_Deferral_Matrix_OrgCode] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[DeferredConversionWork]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[DeferredConversionWork] (
    [DeferredConversionWorkKey] uniqueidentifier NOT NULL CONSTRAINT [DF_DeferredConversionWork_DeferredConversionWorkKey] DEFAULT (newid()),
    [InvoiceKey] uniqueidentifier NULL,
    [InvoiceNumber] nvarchar(50) NULL,
    [FinancialEntityCode] nvarchar(50) NOT NULL,
    [TargetGLAccountCode] nvarchar(100) NOT NULL,
    [AmountConverted] decimal(18, 4) NOT NULL,
    [OrganizationKey] uniqueidentifier NULL,
    [InvoiceLineKey] uniqueidentifier NULL,
    [InvoiceLineNumber] int NULL,
    [DeferredGLAccountCode] nvarchar(100) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[DeferredIncomeWork]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[DeferredIncomeWork] (
    [DeferredIncomeWorkKey] uniqueidentifier NOT NULL CONSTRAINT [DF_DeferredIncomeWork_DeferredIncomeWorkKey] DEFAULT (newid()),
    [InvoiceKey] uniqueidentifier NULL,
    [InvoiceNumber] nvarchar(50) NULL,
    [EffectiveDate] datetime NULL,
    [FinancialEntityCode] nvarchar(50) NOT NULL,
    [DeferredIncomeGLAccountCode] nvarchar(100) NOT NULL,
    [TargetGLAccountCode] nvarchar(100) NOT NULL,
    [AmountDeferred] decimal(18, 4) NOT NULL,
    [DeferralTermsCode] nvarchar(50) NULL,
    [OrganizationKey] uniqueidentifier NULL,
    [GLTransactionLineKey] uniqueidentifier NULL,
    [TotalAmountToBeDeferred] decimal(18, 4) NOT NULL,
    [InvoiceLineKey] uniqueidentifier NULL,
    [InvoiceLineNumber] int NULL,
    [DeferralTermsKey] uniqueidentifier NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[DeploymentPackageRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[DeploymentPackageRef] (
    [DeploymentPackageCode] nvarchar(50) NOT NULL,
    [DeploymentPackageDesc] nvarchar(50) NOT NULL,
    [DocumentSystemPath] nvarchar(1000) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[DocumentMain]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[DocumentMain] (
    [DocumentKey] uniqueidentifier NOT NULL CONSTRAINT [DF_DocumentMain_DocumentKey] DEFAULT (newid()),
    [IsSystem] bit NOT NULL CONSTRAINT [DF_DocumentMain_IsSystem] DEFAULT (0),
    [Blob] image NULL,
    [DefaultChildAccessKey] uniqueidentifier NULL,
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [UpdatedOn] datetime NOT NULL CONSTRAINT [DF_DocumentMain_UpdatedOn] DEFAULT (getdate()),
    [LockedByUserKey] uniqueidentifier NULL,
    [LockedOn] datetime NULL,
    [AccessKey] uniqueidentifier NOT NULL,
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedOn] datetime NOT NULL,
    [ContainsChildrenFlag] bit NOT NULL,
    [DocumentVersionKey] uniqueidentifier NOT NULL,
    [DocumentTypeCode] nvarchar(6) NOT NULL,
    [DocumentStatusCode] int NOT NULL,
    [DocumentName] nvarchar(100) NOT NULL,
    [DocumentDescription] nvarchar(250) NULL,
    [AlternateName] nvarchar(100) NULL,
    [StatusUpdatedOn] datetime NOT NULL,
    [StatusUpdatedByUserKey] uniqueidentifier NOT NULL,
    [BranchedFromDocumentKey] uniqueidentifier NULL,
    [RelatedDocumentVersionKey] uniqueidentifier NULL,
    [VersionComment] nvarchar(500) NULL,
    [VersionLabel] nvarchar(50) NULL,
    [MarkedForDeleteOn] datetime NULL,
    [DocumentCode] nvarchar(100) NULL,
    [SystemKey] uniqueidentifier NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[DocumentStatusRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[DocumentStatusRef] (
    [DocumentStatusCode] int NOT NULL,
    [DocumentStatusName] nvarchar(30) NOT NULL,
    [DocumentStatusDesc] nvarchar(30) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[DocumentStorage]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[DocumentStorage] (
    [DocumentStorageKey] uniqueidentifier NOT NULL,
    [Name] nvarchar(50) NOT NULL,
    [Description] nvarchar(200) NULL,
    [FileTypeCode] nvarchar(4) NULL,
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedOn] datetime NOT NULL,
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [UpdatedOn] datetime NOT NULL,
    [UploadedByUserKey] uniqueidentifier NULL,
    [UploadedOn] uniqueidentifier NULL,
    [Blob] image NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[DocumentTypeRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[DocumentTypeRef] (
    [DocumentTypeCode] nvarchar(6) NOT NULL,
    [DocumentTypeDesc] nvarchar(100) NOT NULL,
    [DocumentIconURL] nvarchar(256) NULL,
    [DocumentTypeName] nvarchar(255) NULL,
    [DocumentNewLink] nvarchar(256) NULL,
    [DocumentEditLink] nvarchar(256) NULL,
    [DocumentExecuteLink] nvarchar(256) NULL,
    [TaskHelperAssemblyName] nvarchar(255) NULL,
    [TrackVersionsFlag] bit NOT NULL,
    [PublishWorkflowDocumentKey] uniqueidentifier NULL,
    [RecycleWorkflowDocumentKey] uniqueidentifier NULL,
    [FolderIconURL] nvarchar(256) NULL,
    [TaskHelperTypeName] nvarchar(255) NULL,
    [DocumentSummaryLink] nvarchar(256) NULL,
    [ShortcutIconURL] nvarchar(256) NULL,
    [DocumentTypeRefKey] uniqueidentifier NOT NULL CONSTRAINT [DF_DocumentTypeRef_DocumentTypeRefKey] DEFAULT (newid()),
    [IsExportable] bit NOT NULL CONSTRAINT [DF_DocumentTypeRef_IsExportable] DEFAULT (1),
    [DocumentDownloadLink] nvarchar(255) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Donation_Premium]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Donation_Premium] (
    [ORIG_TRANS_NUMBER] int NULL,
    [DONOR_ID] varchar(10) NULL,
    [PRODUCT_CODE] varchar(31) NULL,
    [QUANTITY] int NULL,
    [ORDER_NUMBER] float NULL,
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[DonationReport]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[DonationReport] (
    [ID] varchar(10) NOT NULL CONSTRAINT [DF_DonationReport_ID] DEFAULT (''),
    [OriginalTransaction] int NOT NULL CONSTRAINT [DF_DonationReport_OriginalTransaction] DEFAULT (0),
    [InvoiceRefNum] int NOT NULL CONSTRAINT [DF_DonationReport_InvoiceRefNum] DEFAULT (0),
    [SourceSystem] varchar(10) NOT NULL CONSTRAINT [DF_DonationReport_SourceSystem] DEFAULT (''),
    [TransactionDate] datetime NULL,
    [DateReceived] datetime NULL,
    [Amount] numeric(15, 2) NOT NULL CONSTRAINT [DF_DonationReport_Amount] DEFAULT (0),
    [SolicitorID] varchar(10) NOT NULL CONSTRAINT [DF_DonationReport_SolicitorID] DEFAULT (''),
    [CheckNumber] varchar(10) NOT NULL CONSTRAINT [DF_DonationReport_CheckNumber] DEFAULT (''),
    [PaymentType] varchar(11) NOT NULL CONSTRAINT [DF_DonationReport_PaymentType] DEFAULT (''),
    [FiscalMonth] int NOT NULL CONSTRAINT [DF_DonationReport_FiscalMonth] DEFAULT (0),
    [FiscalYear] int NOT NULL CONSTRAINT [DF_DonationReport_FiscalYear] DEFAULT (0),
    [GiftType] varchar(6) NOT NULL CONSTRAINT [DF_DonationReport_GiftType] DEFAULT (''),
    [MatchingTransaction] int NOT NULL CONSTRAINT [DF_DonationReport_MatchingTransaction] DEFAULT (0),
    [IsMatchingGift] tinyint NOT NULL CONSTRAINT [DF_DonationReport_IsMatchingGift] DEFAULT (0),
    [MemorialID] varchar(10) NOT NULL CONSTRAINT [DF_DonationReport_MemorialID] DEFAULT (''),
    [ListAs] varchar(255) NOT NULL CONSTRAINT [DF_DonationReport_ListAs] DEFAULT (''),
    [RequestNumber] numeric(15, 4) NOT NULL CONSTRAINT [DF_DonationReport_RequestNumber] DEFAULT (0),
    [MemorialNameText] varchar(100) NOT NULL CONSTRAINT [DF_DonationReport_MemorialNameText] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[DuesCycles]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[DuesCycles] (
    [CYCLE_NAME] varchar(30) NOT NULL CONSTRAINT [DF_DuesCycles_CYCLE_NAME] DEFAULT (''),
    [REPORT_FORM] varchar(75) NOT NULL CONSTRAINT [DF_DuesCycles_REPORT_FORM] DEFAULT (''),
    [MEM_TYPES] varchar(255) NOT NULL CONSTRAINT [DF_DuesCycles_MEM_TYPES] DEFAULT (''),
    [CATEGORIES] varchar(255) NOT NULL CONSTRAINT [DF_DuesCycles_CATEGORIES] DEFAULT (''),
    [PRODUCT_CODES] text NULL,
    [INCLUDE_INACTIVE_MEMBERS] bit NOT NULL CONSTRAINT [DF_DuesCycles_INCLUDE_INACTIVE_MEMBERS] DEFAULT (0),
    [INCLUDE_SUSPENDED_MEMBERS] bit NOT NULL CONSTRAINT [DF_DuesCycles_INCLUDE_SUSPENDED_MEMBERS] DEFAULT (0),
    [INCLUDE_INACTIVE_SECTIONS] bit NOT NULL CONSTRAINT [DF_DuesCycles_INCLUDE_INACTIVE_SECTIONS] DEFAULT (0),
    [INCLUDE_ZERO_BALANCE] bit NOT NULL CONSTRAINT [DF_DuesCycles_INCLUDE_ZERO_BALANCE] DEFAULT (0),
    [MAJOR_SORT] tinyint NOT NULL CONSTRAINT [DF_DuesCycles_MAJOR_SORT] DEFAULT (0),
    [MEMBER_SORT] bit NOT NULL CONSTRAINT [DF_DuesCycles_MEMBER_SORT] DEFAULT (0),
    [PRODUCT_SORT] bit NOT NULL CONSTRAINT [DF_DuesCycles_PRODUCT_SORT] DEFAULT (0),
    [INITIAL_BILL_TITLE] varchar(30) NOT NULL CONSTRAINT [DF_DuesCycles_INITIAL_BILL_TITLE] DEFAULT (''),
    [INITIAL_BILL_TEXT] text NULL,
    [INITIAL_BILL_ADDRESS] int NOT NULL CONSTRAINT [DF_DuesCycles_INITIAL_BILL_ADDRESS] DEFAULT (0),
    [INITIAL_BILL_END] int NOT NULL CONSTRAINT [DF_DuesCycles_INITIAL_BILL_END] DEFAULT (0),
    [FIRST_REMINDER_TITLE] varchar(30) NOT NULL CONSTRAINT [DF_DuesCycles_FIRST_REMINDER_TITLE] DEFAULT (''),
    [FIRST_REMINDER_TEXT] text NULL,
    [FIRST_REMINDER_ADDRESS] int NOT NULL CONSTRAINT [DF_DuesCycles_FIRST_REMINDER_ADDRESS] DEFAULT (0),
    [FIRST_REMINDER_START] int NOT NULL CONSTRAINT [DF_DuesCycles_FIRST_REMINDER_START] DEFAULT (0),
    [FIRST_REMINDER_END] int NOT NULL CONSTRAINT [DF_DuesCycles_FIRST_REMINDER_END] DEFAULT (0),
    [SECOND_REMINDER_TITLE] varchar(30) NOT NULL CONSTRAINT [DF_DuesCycles_SECOND_REMINDER_TITLE] DEFAULT (''),
    [SECOND_REMINDER_TEXT] text NULL,
    [SECOND_REMINDER_ADDRESS] int NOT NULL CONSTRAINT [DF_DuesCycles_SECOND_REMINDER_ADDRESS] DEFAULT (0),
    [SECOND_REMINDER_START] int NOT NULL CONSTRAINT [DF_DuesCycles_SECOND_REMINDER_START] DEFAULT (0),
    [SECOND_REMINDER_END] int NOT NULL CONSTRAINT [DF_DuesCycles_SECOND_REMINDER_END] DEFAULT (0),
    [INITIAL_BILL_START] int NOT NULL CONSTRAINT [DF_DuesCycles_INITIAL_BILL_START] DEFAULT (0),
    [FORCE_ADD_OTHER] bit NOT NULL CONSTRAINT [DF_DuesCycles_FORCE_ADD_OTHER] DEFAULT (0),
    [INCLUDE_ALL_SECTIONS] bit NOT NULL CONSTRAINT [DF_DuesCycles_INCLUDE_ALL_SECTIONS] DEFAULT (0),
    [INCLUDE_ALL_CHAPTERS] bit NOT NULL CONSTRAINT [DF_DuesCycles_INCLUDE_ALL_CHAPTERS] DEFAULT (0),
    [INCLUDE_ALL_MEM_ITEMS] bit NOT NULL CONSTRAINT [DF_DuesCycles_INCLUDE_ALL_MEM_ITEMS] DEFAULT (0),
    [BILL_CYCLE] varchar(1) NOT NULL CONSTRAINT [DF_DuesCycles_BILL_CYCLE] DEFAULT (''),
    [ACCOUNTING_METHOD] varchar(1) NOT NULL CONSTRAINT [DF_DuesCycles_ACCOUNTING_METHOD] DEFAULT (''),
    [MASS_BILL_ACCT_METH] varchar(1) NOT NULL CONSTRAINT [DF_DuesCycles_MASS_BILL_ACCT_METH] DEFAULT (''),
    [UPDATE_COMP_AT_PAY] bit NOT NULL CONSTRAINT [DF_DuesCycles_UPDATE_COMP_AT_PAY] DEFAULT (0),
    [IS_FOR_JOIN] bit NOT NULL CONSTRAINT [DF_DuesCycles_IS_FOR_JOIN] DEFAULT (0),
    [IS_FOR_RENEW] bit NOT NULL CONSTRAINT [DF_DuesCycles_IS_FOR_RENEW] DEFAULT (0),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[DueToDueFrom]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[DueToDueFrom] (
    [SourceOrg] varchar(5) NOT NULL CONSTRAINT [DF_DueToDueFrom_SourceOrg] DEFAULT (''),
    [DestinationOrg] varchar(5) NOT NULL CONSTRAINT [DF_DueToDueFrom_DestinationOrg] DEFAULT (''),
    [SourceDestKey] varchar(11) NOT NULL CONSTRAINT [DF_DueToDueFrom_SourceDestKey] DEFAULT (''),
    [DueFromAccount] varchar(50) NOT NULL CONSTRAINT [DF_DueToDueFrom_DueFromAccount] DEFAULT (''),
    [DueToAccount] varchar(50) NOT NULL CONSTRAINT [DF_DueToDueFrom_DueToAccount] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Duplicate]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Duplicate] (
    [SEQN] numeric(18, 0) NOT NULL,
    [ID] varchar(12) NULL,
    [FULL_NAME] varchar(60) NULL,
    [ADDR_1] int NULL,
    [ADDR_2] int NULL,
    [ADDR_3] int NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Duplicate_Group]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Duplicate_Group] (
    [SEQN] numeric(18, 0) IDENTITY(1,1) NOT NULL,
    [DUP_MATCH_KEY] varchar(255) NULL,
    [MERGE_NOTE] varchar(255) NULL,
    [PREF_MAIL] int NULL,
    [PREF_BILL] int NULL,
    [MERGE_IDS] varchar(255) NULL,
    [DELETE_IDS] varchar(255) NULL,
    [KEEP_IDS] varchar(255) NULL,
    [ADDR_1_NUM] int NULL,
    [ADDR_2_NUM] int NULL,
    [ADDR_3_NUM] int NULL,
    [RETAIN_ID] varchar(12) NULL,
    [PREF_SHIP] int NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[EducationLevelRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[EducationLevelRef] (
    [EducationLevelCode] nvarchar(10) NOT NULL,
    [EducationLevelDesc] nvarchar(50) NOT NULL,
    [IsHandModified] bit NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Email_Contact]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Email_Contact] (
    [EMailContactID] numeric(18, 0) IDENTITY(1,1) NOT NULL,
    [EmailAddress] varchar(100) NOT NULL,
    [FirstName] varchar(30) NULL,
    [LastName] varchar(30) NULL,
    [RecipientEmailAddress] varchar(100) NULL,
    [RecipientFirstName] varchar(30) NULL,
    [RecipientLastName] varchar(30) NULL,
    [DateSent] datetime NULL,
    [ContactTypeCode] char(2) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Error]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Error] (
    [ErrorID] int IDENTITY(1,1) NOT NULL,
    [StackTrace] varchar(2048) NULL,
    [FriendlyErrorMessage] varchar(1024) NULL,
    [ErrorType] varchar(1024) NULL,
    [ErrorDate] datetime NULL,
    [HttpRefer] varchar(256) NULL,
    [HttpPath] varchar(512) NULL,
    [HttpHost] varchar(128) NULL,
    [HttpAll] varchar(2048) NULL,
    [UserID] varchar(60) NOT NULL,
    [CookieData] varchar(2048) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[EventGuest]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[EventGuest] (
    [EventGuestID] int IDENTITY(1,1) NOT NULL,
    [RegistrantID] varchar(10) NOT NULL,
    [EventCode] varchar(15) NOT NULL,
    [CartEventFunctionID] int NULL,
    [GuestBadge] varchar(32) NOT NULL,
    [FirstName] varchar(20) NULL,
    [MiddleInitial] varchar(20) NULL,
    [LastName] varchar(30) NULL,
    [Address1] varchar(40) NULL,
    [Address2] varchar(40) NULL,
    [Address3] varchar(40) NULL,
    [City] varchar(40) NULL,
    [StateProvince] varchar(15) NULL,
    [PostalCode] varchar(10) NULL,
    [Country] varchar(25) NULL,
    [Prefix] varchar(25) NULL,
    [Suffix] varchar(10) NULL,
    [Nickname] varchar(20) NULL,
    [Designation] varchar(20) NULL,
    [Title] varchar(50) NULL,
    [Company] varchar(80) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[EventRegistrant]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[EventRegistrant] (
    [RegistrantID] varchar(10) NOT NULL,
    [EventCode] varchar(15) NOT NULL,
    [UserID] varchar(60) NOT NULL,
    [SessionStartDate] datetime NULL,
    [RegistrantClass] varchar(5) NULL,
    [FirstName] varchar(20) NULL,
    [MiddleInitial] varchar(20) NULL,
    [LastName] varchar(30) NULL,
    [Address1] varchar(40) NULL,
    [Address2] varchar(40) NULL,
    [Address3] varchar(40) NULL,
    [City] varchar(40) NULL,
    [StateProvince] varchar(15) NULL,
    [PostalCode] varchar(10) NULL,
    [ApplyPermanentChanges] bit NULL,
    [AddressPurpose] varchar(20) NULL,
    [Phone] varchar(25) NULL,
    [Email] varchar(100) NULL,
    [Country] varchar(25) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[EventRegistrationAnswer]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[EventRegistrationAnswer] (
    [RegistrantID] varchar(10) NOT NULL,
    [EventCode] varchar(15) NOT NULL,
    [QuestionID] int NOT NULL,
    [Answer] varchar(512) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[EventRelatedFunction]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[EventRelatedFunction] (
    [EventRelatedFunctionKey] uniqueidentifier NOT NULL CONSTRAINT [DF_EventRelatedFunction_EventRelatedFunctionKey] DEFAULT (newid()),
    [EventFunctionKey] varchar(31) NOT NULL,
    [EventRegistrationOptionKey] varchar(31) NOT NULL,
    [DisplayOption] int NOT NULL CONSTRAINT [DF_EventRelatedFunction_DisplayOption] DEFAULT (2),
    [IsAutoEnroll] bit NOT NULL CONSTRAINT [DF_EventRelatedFunction_IsAutoEnroll] DEFAULT (0)
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[EventSetupFunctionGroup]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[EventSetupFunctionGroup] (
    [EventCode] varchar(15) NOT NULL,
    [FunctionCode] varchar(15) NOT NULL,
    [GroupName] varchar(8) NOT NULL,
    [FunctionOrder] int NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[EventSetupGeneral]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[EventSetupGeneral] (
    [EventCode] varchar(15) NOT NULL,
    [OnlineCutOffDate] datetime NOT NULL,
    [OnlineCutOffMessage] varchar(256) NOT NULL,
    [RegistrantClassType] varchar(24) NOT NULL,
    [RegistrantClassStoredProcedure] varchar(64) NULL,
    [RegisterSomeoneElseOption] bit NOT NULL,
    [PermanentChange] bit NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[EventSetupGroup]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[EventSetupGroup] (
    [EventCode] varchar(15) NOT NULL,
    [GroupName] varchar(8) NOT NULL,
    [GroupLabel] varchar(64) NOT NULL,
    [GroupOrder] int NOT NULL,
    [GroupPageMessage] varchar(256) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[EventSetupGuest]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[EventSetupGuest] (
    [EventCode] varchar(15) NOT NULL,
    [GuestPageMessage] varchar(256) NULL,
    [FirstName] varchar(24) NOT NULL,
    [FirstNameEnabled] bit NOT NULL,
    [FirstNameRequired] bit NOT NULL,
    [MiddleInitial] varchar(24) NOT NULL,
    [MiddleInitialEnabled] bit NOT NULL,
    [MiddleInitialRequired] bit NOT NULL,
    [LastName] varchar(24) NOT NULL,
    [LastNameEnabled] bit NOT NULL,
    [LastNameRequired] bit NOT NULL,
    [Address] varchar(24) NOT NULL,
    [AddressEnabled] bit NOT NULL,
    [AddressRequired] bit NOT NULL,
    [City] varchar(24) NOT NULL,
    [CityEnabled] bit NOT NULL,
    [CityRequired] bit NOT NULL,
    [StateProvince] varchar(24) NOT NULL,
    [StateEnabled] bit NOT NULL,
    [StateRequired] bit NOT NULL,
    [PostalCode] varchar(24) NOT NULL,
    [PostalCodeEnabled] bit NOT NULL,
    [PostalCodeRequired] bit NOT NULL,
    [Country] varchar(25) NULL,
    [CountryEnabled] bit NULL,
    [CountryRequired] bit NULL,
    [Prefix] varchar(25) NULL,
    [PrefixEnabled] bit NULL,
    [PrefixRequired] bit NULL,
    [Suffix] varchar(25) NULL,
    [SuffixEnabled] bit NULL,
    [SuffixRequired] bit NULL,
    [Nickname] varchar(25) NULL,
    [NicknameEnabled] bit NULL,
    [NicknameRequired] bit NULL,
    [Designation] varchar(25) NULL,
    [DesignationEnabled] bit NULL,
    [DesignationRequired] bit NULL,
    [Title] varchar(25) NULL,
    [TitleEnabled] bit NULL,
    [TitleRequired] bit NULL,
    [Company] varchar(25) NULL,
    [CompanyEnabled] bit NULL,
    [CompanyRequired] bit NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[EventSetupLabel]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[EventSetupLabel] (
    [EventCode] varchar(15) NOT NULL,
    [StartRegistrationLabel] varchar(64) NOT NULL,
    [RegistrantLabel] varchar(64) NOT NULL,
    [FunctionsLabel] varchar(64) NOT NULL,
    [GuestLabel] varchar(64) NOT NULL,
    [QuestionLabel] varchar(64) NOT NULL,
    [SummaryLabel] varchar(64) NOT NULL,
    [QuestionPageMessage] varchar(256) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[EventSetupQuestion]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[EventSetupQuestion] (
    [EventSetupQuestionID] int IDENTITY(1,1) NOT NULL,
    [EventCode] varchar(15) NOT NULL,
    [FunctionCode] varchar(15) NOT NULL,
    [Question] varchar(256) NOT NULL,
    [QuestionType] varchar(32) NOT NULL,
    [Required] bit NOT NULL,
    [QuestionOrder] int NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[EventSetupQuestionChoice]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[EventSetupQuestionChoice] (
    [EventSetupQuestionChoiceID] varchar(8) NOT NULL,
    [EventSetupQuestionID] int NOT NULL,
    [Answer] varchar(64) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[EventSetupRegistrant]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[EventSetupRegistrant] (
    [EventCode] varchar(15) NOT NULL,
    [RegistrantPageMessage] varchar(256) NULL,
    [FirstName] varchar(24) NOT NULL,
    [FirstNameEnabled] bit NOT NULL,
    [FirstNameRequired] bit NOT NULL,
    [MiddleInitial] varchar(24) NOT NULL,
    [MiddleInitialEnabled] bit NOT NULL,
    [MiddleInitialRequired] bit NOT NULL,
    [LastName] varchar(24) NOT NULL,
    [LastNameEnabled] bit NOT NULL,
    [LastNameRequired] bit NOT NULL,
    [Address] varchar(24) NOT NULL,
    [AddressEnabled] bit NOT NULL,
    [AddressRequired] bit NOT NULL,
    [City] varchar(24) NOT NULL,
    [CityEnabled] bit NOT NULL,
    [CityRequired] bit NOT NULL,
    [StateProvince] varchar(24) NOT NULL,
    [StateEnabled] bit NOT NULL,
    [StateRequired] bit NOT NULL,
    [PostalCode] varchar(24) NOT NULL,
    [PostalCodeEnabled] bit NOT NULL,
    [PostalCodeRequired] bit NOT NULL,
    [Phone] varchar(24) NOT NULL,
    [PhoneEnabled] bit NOT NULL,
    [PhoneRequired] bit NOT NULL,
    [Email] varchar(24) NOT NULL,
    [EmailEnabled] bit NOT NULL,
    [EmailRequired] bit NOT NULL,
    [Country] varchar(25) NULL,
    [CountryEnabled] bit NULL,
    [CountryRequired] bit NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Exchange_Rate]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Exchange_Rate] (
    [CurrencyCode] varchar(3) NOT NULL CONSTRAINT [DF_Exchange_Rate_CurrencyCode] DEFAULT (''),
    [ExchangeRate] numeric(15, 5) NOT NULL CONSTRAINT [DF_Exchange_Rate_ExchangeRate] DEFAULT (0),
    [LastUpdateDate] datetime NULL,
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[ExchangeRateHistory]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ExchangeRateHistory] (
    [Ex_Hist_Id] varchar(10) NOT NULL CONSTRAINT [DF_ExchangeRateHistory_Ex_Hist_Id] DEFAULT (''),
    [CurrencyCode] varchar(3) NOT NULL CONSTRAINT [DF_ExchangeRateHistory_CurrencyCode] DEFAULT (''),
    [ExchangeRate] numeric(15, 5) NOT NULL CONSTRAINT [DF_ExchangeRateHistory_ExchangeRate] DEFAULT (0),
    [ValidFrom] datetime NULL,
    [ValidTo] datetime NULL,
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[ExecutionModeRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ExecutionModeRef] (
    [ExecutionModeCode] nvarchar(20) NOT NULL,
    [ExecutionModeDesc] nvarchar(500) NOT NULL,
    [ExecutionModeName] nvarchar(20) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Exhb_Booth]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Exhb_Booth] (
    [EXHB_ID] varchar(10) NOT NULL CONSTRAINT [DF_Exhb_Booth_EXHB_ID] DEFAULT (''),
    [MEET_ID] varchar(10) NOT NULL CONSTRAINT [DF_Exhb_Booth_MEET_ID] DEFAULT (''),
    [BOOTH_DIM1] int NOT NULL CONSTRAINT [DF_Exhb_Booth_BOOTH_DIM1] DEFAULT (0),
    [BOOTH_DIM2] int NOT NULL CONSTRAINT [DF_Exhb_Booth_BOOTH_DIM2] DEFAULT (0),
    [BOOTH_CORNERS] tinyint NOT NULL CONSTRAINT [DF_Exhb_Booth_BOOTH_CORNERS] DEFAULT (0),
    [MAIN_BOOTH] bit NOT NULL CONSTRAINT [DF_Exhb_Booth_MAIN_BOOTH] DEFAULT (0),
    [BOOTH_NUMBER] varchar(20) NULL,
    [BOOTH_UNITS] int NOT NULL CONSTRAINT [DF_Exhb_Booth_BOOTH_UNITS] DEFAULT (0),
    [PRODUCT_CODE] varchar(31) NULL,
    [EXHB_COMP_ID] varchar(10) NULL,
    [BOOTH_TYPE] varchar(40) NOT NULL CONSTRAINT [DF_Exhb_Booth_BOOTH_TYPE] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Exhb_Booth_Hist]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Exhb_Booth_Hist] (
    [EXHB_ID] varchar(10) NOT NULL CONSTRAINT [DF_Exhb_Booth_Hist_EXHB_ID] DEFAULT (''),
    [MEET_ID] varchar(10) NOT NULL CONSTRAINT [DF_Exhb_Booth_Hist_MEET_ID] DEFAULT (''),
    [EXHB_DATE] datetime NOT NULL,
    [OLD_DATA] varchar(30) NULL,
    [NEW_DATA] varchar(30) NULL,
    [ITEM] varchar(40) NULL,
    [BOOTH_NUMBER] varchar(20) NULL,
    [COMMENTS] text NULL,
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Exhb_Form]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Exhb_Form] (
    [EXHB_ID] varchar(10) NULL,
    [MEET_ID] varchar(10) NULL,
    [FORM_ID] varchar(10) NULL,
    [FORM_DATE_RECD] datetime NULL,
    [FORM_CONTACT] varchar(40) NULL,
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Exhb_Form_Master]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Exhb_Form_Master] (
    [FORM_ID] varchar(10) NOT NULL CONSTRAINT [DF_Exhb_Form_Master_FORM_ID] DEFAULT (''),
    [FORM_TITLE] varchar(30) NULL,
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Exhb_Meet]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Exhb_Meet] (
    [EXHB_ID] varchar(10) NOT NULL CONSTRAINT [DF_Exhb_Meet_EXHB_ID] DEFAULT (''),
    [MEET_ID] varchar(10) NOT NULL CONSTRAINT [DF_Exhb_Meet_MEET_ID] DEFAULT (''),
    [STATUS] varchar(2) NULL,
    [FREE_PASS_USED] int NOT NULL CONSTRAINT [DF_Exhb_Meet_FREE_PASS_USED] DEFAULT (0),
    [DATE_SPACE_RESERVED] datetime NULL,
    [DATE_CONTRACT_RET] datetime NULL,
    [COMMENTS] text NULL,
    [INTENT_TO_EDIT] datetime NULL,
    [EDITED_BY] varchar(10) NULL,
    [PRIORITY_POINTS] int NOT NULL CONSTRAINT [DF_Exhb_Meet_PRIORITY_POINTS] DEFAULT (0),
    [EXHB_COMP_ID] varchar(10) NULL,
    [EXHB_CAT] varchar(10) NULL,
    [SIGNAGE] text NULL,
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Exhb_Meet_Contact]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Exhb_Meet_Contact] (
    [EXHB_ID] varchar(10) NULL,
    [MEET_ID] varchar(10) NULL,
    [CONT_ID] varchar(10) NULL,
    [CONT_TITLE] varchar(30) NULL,
    [MAIN_CONT] bit NOT NULL CONSTRAINT [DF_Exhb_Meet_Contact_MAIN_CONT] DEFAULT (0),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Exhb_Meet_Form]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Exhb_Meet_Form] (
    [MEET_ID] varchar(10) NULL,
    [FORM_ID] varchar(10) NULL,
    [FORM_DATE_DUE] datetime NULL,
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Exhb_Order_Pymt]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Exhb_Order_Pymt] (
    [ORDER_NUMBER] numeric(15, 2) NOT NULL CONSTRAINT [DF_Exhb_Order_Pymt_ORDER_NUMBER] DEFAULT (0),
    [PYMT_NUMBER] int NOT NULL CONSTRAINT [DF_Exhb_Order_Pymt_PYMT_NUMBER] DEFAULT (0),
    [PYMT_AMOUNT] numeric(15, 2) NOT NULL CONSTRAINT [DF_Exhb_Order_Pymt_PYMT_AMOUNT] DEFAULT (0),
    [CONFIRM_DATE] datetime NULL,
    [PYMT_DATE] datetime NULL,
    [PCT_DOWN] bit NOT NULL CONSTRAINT [DF_Exhb_Order_Pymt_PCT_DOWN] DEFAULT (0),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Exhb_Prod]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Exhb_Prod] (
    [EXHB_ID] varchar(10) NOT NULL CONSTRAINT [DF_Exhb_Prod_EXHB_ID] DEFAULT (''),
    [MEET_ID] varchar(10) NOT NULL CONSTRAINT [DF_Exhb_Prod_MEET_ID] DEFAULT (''),
    [PRODUCT_ID] varchar(10) NOT NULL CONSTRAINT [DF_Exhb_Prod_PRODUCT_ID] DEFAULT (''),
    [EXHB_COMP_ID] varchar(10) NULL,
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Exhb_Prod_Con]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Exhb_Prod_Con] (
    [PRODUCT_ID] varchar(20) NULL,
    [CON_PROD_ID] varchar(20) NULL,
    [MEET_ID] varchar(20) NULL,
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Exhb_Prod_Mast]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Exhb_Prod_Mast] (
    [PRODUCT_ID] varchar(10) NOT NULL CONSTRAINT [DF_Exhb_Prod_Mast_PRODUCT_ID] DEFAULT (''),
    [PRODUCT_DESCRIPT] text NULL,
    [PRODUCT_TITLE] varchar(60) NOT NULL CONSTRAINT [DF_Exhb_Prod_Mast_PRODUCT_TITLE] DEFAULT (''),
    [PRODUCT_CAT] varchar(60) NULL,
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Exhb_Reg]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Exhb_Reg] (
    [EXHB_ID] varchar(10) NOT NULL CONSTRAINT [DF_Exhb_Reg_EXHB_ID] DEFAULT (''),
    [MEET_ID] varchar(10) NOT NULL CONSTRAINT [DF_Exhb_Reg_MEET_ID] DEFAULT (''),
    [REG_ID] varchar(10) NOT NULL CONSTRAINT [DF_Exhb_Reg_REG_ID] DEFAULT (''),
    [STATUS] varchar(2) NULL,
    [PAYTYPE] varchar(1) NULL,
    [FIRST_NAME] varchar(20) NULL,
    [LAST_NAME] varchar(30) NULL,
    [CITY] varchar(40) NULL,
    [STATE_PROVINCE] varchar(15) NULL,
    [COUNTRY] varchar(25) NULL,
    [BADGE_FIRST] varchar(30) NULL,
    [BADGE_SECOND] varchar(30) NULL,
    [BADGE_THIRD] varchar(30) NULL,
    [BADGE_FOURTH] varchar(30) NULL,
    [BADGE_FIFTH] varchar(30) NULL,
    [KEY_CONTACT] varchar(1) NULL,
    [COMMENTS] text NULL,
    [GST_PAYSTAT] varchar(1) NULL,
    [DATE_ENTERED] datetime NULL,
    [DATE_UPDATE] datetime NULL,
    [PRODUCT_CODE] varchar(31) NULL,
    [NAME_ID] varchar(10) NULL,
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Exhb_Script]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Exhb_Script] (
    [SECT_ID] varchar(30) NULL,
    [SCRIPT_ID] varchar(30) NULL,
    [MSTR_ID] varchar(30) NULL,
    [SCRIPT_TEXT] text NULL,
    [PROMPT1] text NULL,
    [PROMPT2] text NULL,
    [PROMPT3] text NULL,
    [PROMPT4] text NULL,
    [PROMPT5] text NULL,
    [PROMPT_ID1] varchar(30) NULL,
    [PROMPT_ID2] varchar(30) NULL,
    [PROMPT_ID3] varchar(30) NULL,
    [PROMPT_ID4] varchar(30) NULL,
    [PROMPT_ID5] varchar(30) NULL,
    [SHOW_LIST] bit NOT NULL CONSTRAINT [DF_Exhb_Script_SHOW_LIST] DEFAULT (0),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Exhb_Setup]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Exhb_Setup] (
    [MEET_ID] varchar(10) NULL,
    [BOOTH_SCALE] varchar(20) NULL,
    [BOOTH_LEN] int NOT NULL CONSTRAINT [DF_Exhb_Setup_BOOTH_LEN] DEFAULT (0),
    [BOOTH_WIDTH] int NOT NULL CONSTRAINT [DF_Exhb_Setup_BOOTH_WIDTH] DEFAULT (0),
    [REG_CITY_ST] bit NOT NULL CONSTRAINT [DF_Exhb_Setup_REG_CITY_ST] DEFAULT (0),
    [REG_BADGE] bit NOT NULL CONSTRAINT [DF_Exhb_Setup_REG_BADGE] DEFAULT (0),
    [REG_COUNTRY] bit NOT NULL CONSTRAINT [DF_Exhb_Setup_REG_COUNTRY] DEFAULT (0),
    [REG_FNAME] bit NOT NULL CONSTRAINT [DF_Exhb_Setup_REG_FNAME] DEFAULT (0),
    [REG_TRACK] bit NOT NULL CONSTRAINT [DF_Exhb_Setup_REG_TRACK] DEFAULT (0),
    [CONTACT_WIN] bit NOT NULL CONSTRAINT [DF_Exhb_Setup_CONTACT_WIN] DEFAULT (0),
    [HIST_CODE] varchar(10) NULL,
    [VALIDATE_PREF_BOOTHS] bit NOT NULL CONSTRAINT [DF_Exhb_Setup_VALIDATE_PREF_BOOTHS] DEFAULT (0),
    [HIST_NBR] bit NOT NULL CONSTRAINT [DF_Exhb_Setup_HIST_NBR] DEFAULT (0),
    [HIST_DIM] bit NOT NULL CONSTRAINT [DF_Exhb_Setup_HIST_DIM] DEFAULT (0),
    [HIST_UNIT] bit NOT NULL CONSTRAINT [DF_Exhb_Setup_HIST_UNIT] DEFAULT (0),
    [FREE_PASS] int NOT NULL CONSTRAINT [DF_Exhb_Setup_FREE_PASS] DEFAULT (0),
    [ABOVE_ALLOT] numeric(15, 4) NOT NULL CONSTRAINT [DF_Exhb_Setup_ABOVE_ALLOT] DEFAULT (0),
    [GST_AMT] numeric(15, 4) NOT NULL CONSTRAINT [DF_Exhb_Setup_GST_AMT] DEFAULT (0),
    [MEETING] varchar(10) NOT NULL CONSTRAINT [DF_Exhb_Setup_MEETING] DEFAULT (''),
    [PROSP_ADD] bit NOT NULL CONSTRAINT [DF_Exhb_Setup_PROSP_ADD] DEFAULT (0),
    [PROSP_SECURE] bit NOT NULL CONSTRAINT [DF_Exhb_Setup_PROSP_SECURE] DEFAULT (0),
    [DOWN_PCTG] numeric(15, 2) NOT NULL CONSTRAINT [DF_Exhb_Setup_DOWN_PCTG] DEFAULT (0),
    [NBR_PAYMENTS] int NOT NULL CONSTRAINT [DF_Exhb_Setup_NBR_PAYMENTS] DEFAULT (0),
    [PYMT1_DATE] datetime NULL,
    [PYMT2_DATE] datetime NULL,
    [PYMT3_DATE] datetime NULL,
    [PYMT4_DATE] datetime NULL,
    [PYMT5_DATE] datetime NULL,
    [PYMT6_DATE] datetime NULL,
    [PROD_CONFLICTS] bit NOT NULL CONSTRAINT [DF_Exhb_Setup_PROD_CONFLICTS] DEFAULT (0),
    [COMP_CONFLICTS] bit NOT NULL CONSTRAINT [DF_Exhb_Setup_COMP_CONFLICTS] DEFAULT (0),
    [MAX_FREE_PASSES] int NOT NULL CONSTRAINT [DF_Exhb_Setup_MAX_FREE_PASSES] DEFAULT (0),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Exhb_Srvc_Comp]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Exhb_Srvc_Comp] (
    [MEET_ID] varchar(10) NULL,
    [EXHB_ID] varchar(10) NULL,
    [CONT_ID] varchar(10) NULL,
    [INSUR_DATE] datetime NULL,
    [INSURANCE] bit NOT NULL CONSTRAINT [DF_Exhb_Srvc_Comp_INSURANCE] DEFAULT (0),
    [CONTACT_NAME] varchar(40) NULL,
    [CONTACT_PHONE] varchar(20) NULL,
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Exhb_Srvc_Contr]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Exhb_Srvc_Contr] (
    [MEET_ID] varchar(10) NOT NULL CONSTRAINT [DF_Exhb_Srvc_Contr_MEET_ID] DEFAULT (''),
    [NAME_ID] varchar(10) NOT NULL CONSTRAINT [DF_Exhb_Srvc_Contr_NAME_ID] DEFAULT (''),
    [SERVICE] varchar(30) NULL,
    [OFFICIAL_STATUS] bit NOT NULL CONSTRAINT [DF_Exhb_Srvc_Contr_OFFICIAL_STATUS] DEFAULT (0),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Exhb_Upsell]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Exhb_Upsell] (
    [MEET_ID] varchar(10) NULL,
    [PRODUCT_CODE] varchar(31) NULL,
    [UPSELL_PROD] varchar(31) NULL,
    [NOTES] text NULL,
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Exhb_Wait_List]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Exhb_Wait_List] (
    [MEET_ID] varchar(10) NULL,
    [EXHB_ID] varchar(10) NULL,
    [REQ_DATE_TIME] datetime NOT NULL,
    [NBR_UNITS] int NOT NULL CONSTRAINT [DF_Exhb_Wait_List_NBR_UNITS] DEFAULT (0),
    [NBR_CORNERS] int NOT NULL CONSTRAINT [DF_Exhb_Wait_List_NBR_CORNERS] DEFAULT (0),
    [REQ_LEN] int NOT NULL CONSTRAINT [DF_Exhb_Wait_List_REQ_LEN] DEFAULT (0),
    [REQ_WID] int NOT NULL CONSTRAINT [DF_Exhb_Wait_List_REQ_WID] DEFAULT (0),
    [COMMENTS] varchar(100) NOT NULL CONSTRAINT [DF_Exhb_Wait_List_COMMENTS] DEFAULT (''),
    [STATUS] tinyint NOT NULL CONSTRAINT [DF_Exhb_Wait_List_STATUS] DEFAULT (0),
    [PRODUCT_CODE] varchar(31) NULL,
    [BOOTH_NUMBER] varchar(10) NULL,
    [EXHB_COMP_ID] varchar(10) NULL,
    [PREF_RANK] tinyint NOT NULL CONSTRAINT [DF_Exhb_Wait_List_PREF_RANK] DEFAULT (0),
    [ORDER_NUMBER] numeric(15, 2) NOT NULL CONSTRAINT [DF_Exhb_Wait_List_ORDER_NUMBER] DEFAULT (0),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[ExpenseItem]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ExpenseItem] (
    [EXPENSE_SEQN] int NOT NULL CONSTRAINT [DF_ExpenseItem_EXPENSE_SEQN] DEFAULT (0),
    [EXPENSE_TYPE] varchar(10) NOT NULL CONSTRAINT [DF_ExpenseItem_EXPENSE_TYPE] DEFAULT (''),
    [FUND] varchar(5) NOT NULL CONSTRAINT [DF_ExpenseItem_FUND] DEFAULT (''),
    [CAMPAIGN_CODE] varchar(10) NOT NULL CONSTRAINT [DF_ExpenseItem_CAMPAIGN_CODE] DEFAULT (''),
    [APPEAL_CODE] varchar(40) NOT NULL CONSTRAINT [DF_ExpenseItem_APPEAL_CODE] DEFAULT (''),
    [MEETING] varchar(10) NOT NULL CONSTRAINT [DF_ExpenseItem_MEETING] DEFAULT (''),
    [PRODUCT_CODE] varchar(31) NOT NULL CONSTRAINT [DF_ExpenseItem_PRODUCT_CODE] DEFAULT (''),
    [DESCRIPTION] varchar(60) NOT NULL CONSTRAINT [DF_ExpenseItem_DESCRIPTION] DEFAULT (''),
    [EXPENSE_DATE] datetime NULL,
    [EXPENSE_AMOUNT] money NOT NULL CONSTRAINT [DF_ExpenseItem_EXPENSE_AMOUNT] DEFAULT (0),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[ExperienceDefinition]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ExperienceDefinition] (
    [ExperienceDefinitionKey] uniqueidentifier NOT NULL,
    [ProgramKey] uniqueidentifier NOT NULL,
    [ExperienceDefinitionName] nvarchar(50) NOT NULL,
    [ExperienceDefinitionCode] nvarchar(50) NOT NULL,
    [ExperienceDefinitionDesc] nvarchar(250) NULL,
    [NumberOfUnits] decimal(18, 8) NULL,
    [RequiresGradeFlag] bit NOT NULL,
    [RequiresApprovalFlag] bit NOT NULL,
    [ExperienceDefinitionLocation] nvarchar(50) NULL,
    [ExperienceDefinitionDate] datetime NULL,
    [ExperienceDefinitionStatusCode] nchar(2) NULL,
    [UpdatedOn] datetime NOT NULL,
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedOn] datetime NOT NULL,
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[ExperienceDefinitionStatusRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ExperienceDefinitionStatusRef] (
    [ExperienceDefinitionStatusCode] nchar(2) NOT NULL,
    [ExperienceDefinitionStatusName] nvarchar(50) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[ExperienceUnit]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ExperienceUnit] (
    [ExperienceUnitKey] uniqueidentifier NOT NULL,
    [ExperienceUnitName] nvarchar(50) NOT NULL,
    [ExperienceUnitDesc] nvarchar(250) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Expo_Reg_Class]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Expo_Reg_Class] (
    [REGISTRANT_CLASS] varchar(5) NOT NULL CONSTRAINT [DF_Expo_Reg_Class_REGISTRANT_CLASS] DEFAULT (''),
    [DESCRIPTION] varchar(20) NOT NULL CONSTRAINT [DF_Expo_Reg_Class_DESCRIPTION] DEFAULT (''),
    [LONG_DESCRIPTION] varchar(40) NOT NULL CONSTRAINT [DF_Expo_Reg_Class_LONG_DESCRIPTION] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[ExpoCad_Prod]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ExpoCad_Prod] (
    [Meet_ID] varchar(10) NOT NULL CONSTRAINT [DF_ExpoCad_Prod_Meet_ID] DEFAULT (''),
    [ExpoCad_Type] varchar(40) NOT NULL CONSTRAINT [DF_ExpoCad_Prod_ExpoCad_Type] DEFAULT (''),
    [Product_Code] varchar(31) NOT NULL CONSTRAINT [DF_ExpoCad_Prod_Product_Code] DEFAULT (''),
    [Premium_1] varchar(31) NOT NULL CONSTRAINT [DF_ExpoCad_Prod_Premium_1] DEFAULT (''),
    [Qty_1] int NOT NULL CONSTRAINT [DF_ExpoCad_Prod_Qty_1] DEFAULT (0),
    [Premium_2] varchar(31) NOT NULL CONSTRAINT [DF_ExpoCad_Prod_Premium_2] DEFAULT (''),
    [Qty_2] int NOT NULL CONSTRAINT [DF_ExpoCad_Prod_Qty_2] DEFAULT (0),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[ExportType]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ExportType] (
    [ExportTypeKey] uniqueidentifier NOT NULL,
    [ExportType] nvarchar(24) NOT NULL CONSTRAINT [DF_ExportType_ExportType] DEFAULT (''),
    [Name] nvarchar(24) NOT NULL CONSTRAINT [DF_ExportType_Name] DEFAULT (''),
    [NavMarker] nvarchar(100) NOT NULL CONSTRAINT [DF_ExportType_NavMarker] DEFAULT (N'PE.Runtime'),
    [ProcessEngineTypeKey] uniqueidentifier NULL,
    [IsQueryExport] bit NOT NULL CONSTRAINT [DF_ExportType_IsQueryExport] DEFAULT (0)
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[FieldDesign]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[FieldDesign] (
    [FieldDesignId] int IDENTITY(1,1) NOT NULL,
    [TableName] varchar(30) NOT NULL,
    [FieldName] varchar(30) NOT NULL,
    [FieldState] int NOT NULL,
    [RegularExpression] varchar(255) NULL,
    [RegularExpressionExample] varchar(255) NULL,
    [MemberTypes] varchar(255) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[FieldDesignSectionLookup]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[FieldDesignSectionLookup] (
    [FieldSectionId] int NOT NULL,
    [TableName] varchar(30) NOT NULL,
    [FieldName] varchar(30) NOT NULL,
    [SortOrder] int NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[FieldSection]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[FieldSection] (
    [FieldSectionId] int IDENTITY(1,1) NOT NULL,
    [SectionName] varchar(128) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[File_Type_Ref]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[File_Type_Ref] (
    [FileTypeCode] varchar(4) NOT NULL,
    [FileTypeDesc] varchar(50) NOT NULL,
    [MimeType] varchar(50) NULL,
    [IconFileName] varchar(255) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[FileTypeRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[FileTypeRef] (
    [FileTypeCode] nvarchar(4) NOT NULL,
    [FileTypeDesc] nvarchar(50) NOT NULL,
    [MimeType] nvarchar(255) NULL,
    [IconFileName] nvarchar(255) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[FinancialEntityDueTo]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[FinancialEntityDueTo] (
    [FinancialEntityDueToKey] uniqueidentifier NOT NULL,
    [FromFinancialEntityKey] uniqueidentifier NOT NULL,
    [ToFinancialEntityKey] uniqueidentifier NOT NULL,
    [FromFinEntityGLAccountKey] uniqueidentifier NOT NULL,
    [ToFinEntityGLAccountKey] uniqueidentifier NOT NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[FinancialEntityGLAccount]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[FinancialEntityGLAccount] (
    [FinancialEntityKey] uniqueidentifier NOT NULL,
    [GLAccountKey] uniqueidentifier NOT NULL,
    [GLAccountPurposeCode] nchar(3) NOT NULL,
    [FinancialEntityGLAccountKey] uniqueidentifier NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[FirstPaymentDateTypeRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[FirstPaymentDateTypeRef] (
    [FirstPaymentDateTypeCode] int NOT NULL,
    [FirstPaymentDateTypeDesc] nvarchar(50) NOT NULL,
    [FirstPaymentDateTypeName] nvarchar(20) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[FormDefinition]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[FormDefinition] (
    [FormDefinitionKey] uniqueidentifier NOT NULL CONSTRAINT [DF_FormDefinition_FormDefinitionKey] DEFAULT (newid()),
    [FormDefinitionName] nvarchar(50) NULL,
    [FormDefinitionDesc] nvarchar(400) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[FormDefinitionField]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[FormDefinitionField] (
    [FormDefinitionFieldKey] uniqueidentifier NOT NULL CONSTRAINT [DF_FormDefinitionField_FormDefinitionField] DEFAULT (newid()),
    [FormDefinitionSectionKey] uniqueidentifier NOT NULL,
    [FormDefinitionFieldSequence] int NOT NULL,
    [FormDefinitionFieldName] nvarchar(50) NOT NULL,
    [FormDefinitionFieldCaption] nvarchar(400) NULL,
    [FormDefinitionFieldDesc] nvarchar(400) NULL,
    [FormDefinitionFieldType] nvarchar(20) NULL,
    [SerializedPropertyDefinition] nvarchar(max) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[FormDefinitionSection]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[FormDefinitionSection] (
    [FormDefinitionSectionKey] uniqueidentifier NOT NULL CONSTRAINT [DF_FormDefinitionSection_FormDefinitionSectionKey] DEFAULT (newid()),
    [FormDefinitionKey] uniqueidentifier NOT NULL,
    [FormDefinitionSectionSequence] int NOT NULL,
    [FormDefinitionSectionName] nvarchar(50) NULL,
    [FormDefinitionSectionDesc] nvarchar(400) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[FormResponse]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[FormResponse] (
    [FormResponseKey] uniqueidentifier NOT NULL CONSTRAINT [DF_FormResponse_FormResponseKey] DEFAULT (newid()),
    [FormDefinitionKey] uniqueidentifier NOT NULL,
    [ID] varchar(10) NULL,
    [CreatedOn] datetime NULL,
    [CreatedByUserKey] uniqueidentifier NULL,
    [UpdatedOn] datetime NULL,
    [UpdatedByUserKey] uniqueidentifier NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[FormResponseField]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[FormResponseField] (
    [FormResponseFieldKey] uniqueidentifier NOT NULL CONSTRAINT [DF_FormResponse_FormResponseFieldKey] DEFAULT (newid()),
    [FormResponseKey] uniqueidentifier NOT NULL,
    [FormDefinitionFieldKey] uniqueidentifier NOT NULL,
    [FieldDecimalValue] decimal(38, 12) NULL,
    [FieldDateTimeValue] datetime NULL,
    [FieldStringValue] nvarchar(400) NULL,
    [FieldIntegerValue] int NULL,
    [FieldBooleanValue] bit NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Freight_Dollar]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Freight_Dollar] (
    [MIN_DOLLAR] numeric(15, 2) NOT NULL CONSTRAINT [DF_Freight_Dollar_MIN_DOLLAR] DEFAULT (0),
    [RATE] numeric(15, 2) NOT NULL CONSTRAINT [DF_Freight_Dollar_RATE] DEFAULT (0),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Freight_Qty]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Freight_Qty] (
    [MIN_QTY] numeric(15, 2) NOT NULL CONSTRAINT [DF_Freight_Qty_MIN_QTY] DEFAULT (0),
    [RATE] numeric(15, 2) NOT NULL CONSTRAINT [DF_Freight_Qty_RATE] DEFAULT (0),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Freight_Rate]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Freight_Rate] (
    [SHIP_METHOD] varchar(10) NOT NULL CONSTRAINT [DF_Freight_Rate_SHIP_METHOD] DEFAULT (''),
    [ZONE_TABLE_ID] varchar(10) NOT NULL CONSTRAINT [DF_Freight_Rate_ZONE_TABLE_ID] DEFAULT (''),
    [ZONE_ID] varchar(10) NOT NULL CONSTRAINT [DF_Freight_Rate_ZONE_ID] DEFAULT (''),
    [WEIGHT] numeric(15, 2) NOT NULL CONSTRAINT [DF_Freight_Rate_WEIGHT] DEFAULT (0),
    [RATE] numeric(15, 2) NOT NULL CONSTRAINT [DF_Freight_Rate_RATE] DEFAULT (0),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[FullAddress]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[FullAddress] (
    [FullAddressKey] uniqueidentifier NOT NULL,
    [ContactKey] uniqueidentifier NOT NULL,
    [SalutationKey] uniqueidentifier NULL,
    [PhysicalAddressKey] uniqueidentifier NULL,
    [DaytimePhoneAddressKey] uniqueidentifier NULL,
    [EveningPhoneAddressKey] uniqueidentifier NULL,
    [FaxAddressKey] uniqueidentifier NULL,
    [EmailAddressKey] uniqueidentifier NULL,
    [AdditionalLine1] nvarchar(50) NULL,
    [AdditionalLine2] nvarchar(50) NULL,
    [FullAddressDesc] nvarchar(20) NULL,
    [AddressPurposeKey] uniqueidentifier NULL,
    [AddresseeText] nvarchar(500) NULL,
    [IsAddresseeOverridden] bit NOT NULL CONSTRAINT [DF_FullAddress_IsAddresseeOverridden] DEFAULT (0),
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Fund]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Fund] (
    [FundKey] uniqueidentifier NOT NULL,
    [FundFamilyKey] uniqueidentifier NULL,
    [Name] nvarchar(50) NULL,
    [Description] nvarchar(200) NULL,
    [FinancialEntityKey] uniqueidentifier NOT NULL,
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [UpdatedOn] datetime NOT NULL,
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedOn] datetime NOT NULL,
    [AccessKey] uniqueidentifier NOT NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[FundFamilyRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[FundFamilyRef] (
    [FundFamilyKey] uniqueidentifier NOT NULL,
    [Code] nvarchar(50) NOT NULL,
    [Description] nvarchar(200) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[FundFundType]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[FundFundType] (
    [FundFundTypeKey] uniqueidentifier NOT NULL,
    [FundKey] uniqueidentifier NOT NULL,
    [FundTypeKey] uniqueidentifier NOT NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[FundraisingPreferenceRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[FundraisingPreferenceRef] (
    [FundraisingPreferenceCode] int NOT NULL,
    [FundraisingPreferenceName] nvarchar(20) NOT NULL,
    [FundraisingPreferenceDesc] nvarchar(50) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[FundTypeRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[FundTypeRef] (
    [FundTypeKey] uniqueidentifier NOT NULL,
    [Code] nvarchar(50) NOT NULL,
    [Description] nvarchar(200) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[GatewayResultRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[GatewayResultRef] (
    [GatewayResultCode] int NOT NULL,
    [GatewayResultDesc] nvarchar(30) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[GatewayTransaction]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[GatewayTransaction] (
    [GatewayTransactionKey] uniqueidentifier NOT NULL,
    [TransactionId] varchar(50) NULL,
    [TransactionGroupId] varchar(50) NULL,
    [TransactionAmount] decimal(18, 4) NULL,
    [AssociatedEntities] varchar(255) NULL,
    [ContactId] varchar(50) NULL,
    [PaymentType] varchar(30) NULL,
    [RequestString] varchar(max) NULL,
    [ResponseString] varchar(max) NULL,
    [TransactionDate] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[GatewayTransactionRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[GatewayTransactionRef] (
    [GatewayTransactionCode] int NOT NULL,
    [GatewayTransactionDesc] nvarchar(30) NOT NULL,
    [GatewayTransactionName] nvarchar(15) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[GatewayTypeRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[GatewayTypeRef] (
    [GatewayTypeCode] nchar(4) NOT NULL,
    [GatewayTypeDesc] nvarchar(50) NOT NULL,
    [GatewayComponentKey] uniqueidentifier NOT NULL,
    [BusinessObjectName] nvarchar(50) NOT NULL,
    [EditGuiContentCode] nvarchar(100) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Gen_Descriptions]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Gen_Descriptions] (
    [TABLE_NAME] varchar(30) NOT NULL CONSTRAINT [DF_Gen_Descriptions_TABLE_NAME] DEFAULT (''),
    [DESCRIPTION] varchar(255) NOT NULL CONSTRAINT [DF_Gen_Descriptions_DESCRIPTION] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Gen_Tables]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Gen_Tables] (
    [TABLE_NAME] varchar(30) NOT NULL CONSTRAINT [DF_Gen_Tables_TABLE_NAME] DEFAULT (''),
    [CODE] varchar(60) NOT NULL CONSTRAINT [DF_Gen_Tables_CODE] DEFAULT (''),
    [SUBSTITUTE] varchar(255) NOT NULL CONSTRAINT [DF_Gen_Tables_SUBSTITUTE] DEFAULT (''),
    [UPPER_CODE] varchar(60) NOT NULL CONSTRAINT [DF_Gen_Tables_UPPER_CODE] DEFAULT (''),
    [DESCRIPTION] varchar(255) NOT NULL CONSTRAINT [DF_Gen_Tables_DESCRIPTION] DEFAULT (''),
    [OBSOLETE_DESCRIPTION] varchar(255) NOT NULL CONSTRAINT [DF_Gen_Tables_OBSOLETE_DESCRIPTION] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Generic]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Generic] (
    [GenericKey] uniqueidentifier NOT NULL,
    [Description] nvarchar(50) NULL,
    [LongDescription] nvarchar(300) NULL,
    [NumLookup] int NULL,
    [IsEnabled] bit NULL,
    [ID] nvarchar(50) NULL,
    [CreatedOn] datetime NULL,
    [CreatedByUserKey] uniqueidentifier NULL,
    [UpdatedOn] datetime NULL,
    [UpdatedByUserKey] uniqueidentifier NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[GenericLink]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[GenericLink] (
    [GenericLinkKey] uniqueidentifier NOT NULL,
    [SourceKey] uniqueidentifier NOT NULL,
    [TargetKey] uniqueidentifier NOT NULL,
    [SourceComponentKey] uniqueidentifier NOT NULL,
    [TargetComponentKey] uniqueidentifier NOT NULL,
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedOn] datetime NOT NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[GiftAidClaimDetail]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[GiftAidClaimDetail] (
    [GiftAidClaimDetailKey] uniqueidentifier NOT NULL,
    [GiftAidClaimHeaderKey] uniqueidentifier NOT NULL,
    [ContactId] int NOT NULL CONSTRAINT [DF_GiftAidClaimDetail_ContactId] DEFAULT (0),
    [TransactionId] int NOT NULL CONSTRAINT [DF_GiftAidClaimDetail_TransactionId] DEFAULT (0),
    [TransactionPaidDate] datetime NULL,
    [GiftAidDeclarationKey] uniqueidentifier NULL,
    [TaxPayerTitle] nvarchar(50) NOT NULL CONSTRAINT [DF_GiftAidClaimDetail_TaxPayerTitle] DEFAULT (N''),
    [TaxPayerFirstName] nvarchar(50) NOT NULL CONSTRAINT [DF_GiftAidClaimDetail_TaxPayerFirstName] DEFAULT (N''),
    [TaxPayerLastName] nvarchar(50) NOT NULL CONSTRAINT [DF_GiftAidClaimDetail_TaxPayerLastName] DEFAULT (N''),
    [DonationAmount] money NOT NULL CONSTRAINT [DF_GiftAidClaimDetail_DonationAmount] DEFAULT (0),
    [TaxReclaimAmount] AS (CONVERT([decimal](18,2),([DonationAmount]*[GiftAidTaxRate])/((100)-[GiftAidTaxRate]),(0))),
    [GiftAidTaxRate] money NOT NULL CONSTRAINT [DF_GiftAidClaimDetail_GiftAidTaxRate] DEFAULT (0),
    [IsTaxReclaimAllocatedtoGeneralFund] bit NOT NULL CONSTRAINT [DF_GiftAidClaimDetail_IsTaxReclaimAllocatedtoGeneralFund] DEFAULT (0),
    [IsIncludedInClaim] bit NOT NULL CONSTRAINT [DF_GiftAidClaimDetail_IsIncludedInClaim] DEFAULT (0),
    [LabelName] AS (ltrim(rtrim((((isnull([TaxPayerTitle],'')+' ')+isnull([TaxPayerFirstName],N''))+N' ')+isnull([TaxPayerLastName],N'')))),
    [HmrcReference] nvarchar(50) NOT NULL CONSTRAINT [DF_GiftAidClaimDetail_HmrcReference] DEFAULT (N'')
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[GiftAidClaimHeader]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[GiftAidClaimHeader] (
    [GiftAidClaimHeaderKey] uniqueidentifier NOT NULL,
    [Reference] nvarchar(50) NOT NULL CONSTRAINT [DF_GiftAidClaimHeader_Reference] DEFAULT (N''),
    [ClaimFromDate] datetime NULL,
    [ClaimToDate] datetime NULL,
    [GiftAidTaxRate] decimal(18, 2) NOT NULL CONSTRAINT [DF_GiftAidClaimHeader_GiftAidTaxRate] DEFAULT (0.0),
    [GiftAidStatus] nvarchar(20) NOT NULL CONSTRAINT [DF_GiftAidClaimHeader_GiftAidStatus] DEFAULT (N''),
    [CreatedOn] datetime NULL,
    [UpdatedOn] datetime NULL,
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [UpdatedByUserKey] uniqueidentifier NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[GiftAidDeclaration]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[GiftAidDeclaration] (
    [ID] varchar(10) NOT NULL,
    [GiftAidDeclarationKey] uniqueidentifier NOT NULL,
    [DeclarationReceivedDate] datetime NULL,
    [DeclarationMethodKey] nvarchar(10) NOT NULL CONSTRAINT [DF_GiftAidDeclaration_DeclarationMethodKey] DEFAULT (''),
    [IsConfirmationRequired] bit NOT NULL CONSTRAINT [DF_GiftAidDeclaration_IsConfirmationRequired] DEFAULT (0),
    [IsUsing6YearRule] bit NOT NULL CONSTRAINT [DF_GiftAidDeclaration_IsUsing6YearRule] DEFAULT (0),
    [DeclarationStartDate] datetime NULL,
    [DeclarationEndDate] datetime NULL,
    [DeclarationNotes] nvarchar(4000) NULL,
    [TaxpayerFirstName] varchar(40) NOT NULL CONSTRAINT [DF_GiftAidDeclaration_TaxPayerFirstName] DEFAULT (''),
    [TaxpayerLastName] varchar(40) NOT NULL CONSTRAINT [DF_GiftAidDeclaration_TaxPayerLastName] DEFAULT (''),
    [TaxpayerPrefix] varchar(20) NOT NULL CONSTRAINT [DF_GiftAidDeclaration_TaxPayerPrefix] DEFAULT (''),
    [TaxpayerAddress1] nvarchar(40) NOT NULL CONSTRAINT [DF_GiftAidDeclaration_TaxPayerAddress1] DEFAULT (''),
    [TaxpayerAddress2] nvarchar(40) NOT NULL CONSTRAINT [DF_GiftAidDeclaration_TaxPayerAddress2] DEFAULT (''),
    [TaxpayerAddress3] nvarchar(40) NOT NULL CONSTRAINT [DF_GiftAidDeclaration_TaxPayerAddress3] DEFAULT (''),
    [TaxpayerCity] nvarchar(40) NOT NULL CONSTRAINT [DF_GiftAidDeclaration_TaxPayerCity] DEFAULT (''),
    [TaxpayerCounty] nvarchar(15) NOT NULL CONSTRAINT [DF_GiftAidDeclaration_TaxPayerCounty] DEFAULT (''),
    [TaxpayerPostcode] nvarchar(10) NOT NULL CONSTRAINT [DF_GiftAidDeclaration_TaxPayerPostCode] DEFAULT (''),
    [TaxpayerCountry] nvarchar(25) NOT NULL CONSTRAINT [DF_GiftAidDeclaration_TaxPayerCountry] DEFAULT (''),
    [IsHighRateTaxpayer] bit NOT NULL CONSTRAINT [DF_GiftAidDeclaration_IsHighRateTaxPayer] DEFAULT (0),
    [IsTaxRecoveredUnrestricted] bit NOT NULL CONSTRAINT [DF_GiftAidDeclaration_IsTaxRecoveredUnrestricted] DEFAULT (0),
    [Status] nvarchar(10) NOT NULL,
    [StatusUpdatedDate] datetime NULL,
    [AppealCode] varchar(40) NULL CONSTRAINT [DF_GiftAidDeclaration_AppealCode] DEFAULT (''),
    [ConfirmationSentDate] datetime NULL,
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedOn] datetime NOT NULL,
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [UpdatedOn] datetime NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[GiftAidStatusLog]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[GiftAidStatusLog] (
    [GiftAidStatusLogID] int IDENTITY(1,1) NOT NULL,
    [StatusCheckedOn] datetime NULL,
    [StatusTimeStamp] varchar(50) NULL,
    [CorrelationId] varchar(50) NULL,
    [Status] varchar(250) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[GiftAidSubmissionLog]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[GiftAidSubmissionLog] (
    [GALogID] int IDENTITY(1,1) NOT NULL,
    [SubmittedOn] datetime NULL,
    [ClaimRef] varchar(50) NULL,
    [CorrelationId] varchar(50) NULL,
    [Status] varchar(50) NULL,
    [StatusTimeStamp] varchar(50) NULL,
    [ClaimFile] varchar(250) NULL,
    [ResponseText] varchar(max) NULL,
    [ErrorText] varchar(max) NULL,
    [ResponseDetails] xml NULL,
    [FileDetails] xml NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[GiftHistorySummary]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[GiftHistorySummary] (
    [DonorId] varchar(10) NOT NULL,
    [FirstGiftDate] datetime NULL,
    [FirstGiftAmount] money NULL,
    [FirstGiftAppeal] varchar(40) NULL,
    [NextLastGiftDate] datetime NULL,
    [NextLastGiftAmount] money NULL,
    [NextLastGiftAppeal] varchar(40) NULL,
    [LastGiftDate] datetime NULL,
    [LastGiftAmount] money NULL,
    [LastGiftAppeal] varchar(40) NULL,
    [LowestGiftAmount] money NULL,
    [HighestGiftAmount] money NULL,
    [NumberOfGifts] int NULL,
    [LifetimeGiftValue] money NULL,
    [AverageGiftValue] money NULL,
    [ConsecutiveYearsGiving] int NULL,
    [HighestTransNumProcessed] int NOT NULL,
    [LastUpdatedOn] datetime NOT NULL CONSTRAINT [DF_GiftHistorySummary_LastUpdatedOn] DEFAULT (getdate())
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[GiftReport]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[GiftReport] (
    [ID] varchar(10) NOT NULL CONSTRAINT [DF_GiftReport_ID] DEFAULT (''),
    [OriginalTransaction] int NOT NULL CONSTRAINT [DF_GiftReport_OriginalTransaction] DEFAULT (0),
    [TransactionNumber] int NOT NULL CONSTRAINT [DF_GiftReport_TransactionNumber] DEFAULT (0),
    [SourceSystem] varchar(10) NOT NULL CONSTRAINT [DF_GiftReport_SourceSystem] DEFAULT (''),
    [TransactionDate] datetime NULL,
    [DateReceived] datetime NULL,
    [Amount] numeric(15, 2) NOT NULL CONSTRAINT [DF_GiftReport_Amount] DEFAULT (0),
    [Fund] varchar(10) NOT NULL CONSTRAINT [DF_GiftReport_Fund] DEFAULT (''),
    [AppealCode] varchar(40) NOT NULL CONSTRAINT [DF_GiftReport_AppealCode] DEFAULT (''),
    [SolicitorID] varchar(10) NOT NULL CONSTRAINT [DF_GiftReport_SolicitorID] DEFAULT (''),
    [CheckNumber] varchar(10) NOT NULL CONSTRAINT [DF_GiftReport_CheckNumber] DEFAULT (''),
    [PaymentType] varchar(11) NOT NULL CONSTRAINT [DF_GiftReport_PaymentType] DEFAULT (''),
    [CampaignCode] varchar(10) NOT NULL CONSTRAINT [DF_GiftReport_CampaignCode] DEFAULT (''),
    [FiscalYear] int NOT NULL CONSTRAINT [DF_GiftReport_FiscalYear] DEFAULT (0),
    [FiscalMonth] int NOT NULL CONSTRAINT [DF_GiftReport_FiscalMonth] DEFAULT (0),
    [GiftType] varchar(30) NOT NULL CONSTRAINT [DF_GiftReport_GiftType] DEFAULT (''),
    [InvoiceReferenceNumber] int NOT NULL CONSTRAINT [DF_GiftReport_InvoiceReferenceNumber] DEFAULT (0),
    [ReceiptID] int NOT NULL CONSTRAINT [DF_GiftReport_ReceiptID] DEFAULT (0),
    [MatchingTransaction] int NOT NULL CONSTRAINT [DF_GiftReport_MatchingTransaction] DEFAULT (0),
    [IsMatchingGift] tinyint NOT NULL CONSTRAINT [DF_GiftReport_IsMatchingGift] DEFAULT (0),
    [MemorialID] varchar(10) NOT NULL CONSTRAINT [DF_GiftReport_MemorialID] DEFAULT (''),
    [PledgeID] varchar(10) NOT NULL CONSTRAINT [DF_GiftReport_PledgeID] DEFAULT (''),
    [ListAs] varchar(255) NOT NULL CONSTRAINT [DF_GiftReport_ListAs] DEFAULT (''),
    [RequestNumber] numeric(15, 4) NOT NULL CONSTRAINT [DF_GiftReport_RequestNumber] DEFAULT (0),
    [InstallmentDate] datetime NULL,
    [MemorialNameText] varchar(100) NOT NULL CONSTRAINT [DF_GiftReport_MemorialNameText] DEFAULT (''),
    [TIME_STAMP] timestamp NULL,
    [FairMktValue] money NOT NULL CONSTRAINT [DF_GiftReport_FairMktValue] DEFAULT (0),
    [MemorialTributeType] varchar(10) NOT NULL CONSTRAINT [DF_GiftReport_MemorialTributeType] DEFAULT (''),
    [MemorialTributeMessage] text NOT NULL CONSTRAINT [DF_GiftReport_MemorialTributeMessage] DEFAULT (''),
    [TributeNotificationContactID] varchar(10) NOT NULL CONSTRAINT [DF_GiftReport_TributeNotificationContactID] DEFAULT ('')
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[GLEntryTypeRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[GLEntryTypeRef] (
    [GLEntryTypeCode] int NOT NULL,
    [GLEntryTypeDesc] nvarchar(50) NOT NULL,
    [GLEntryTypeName] nvarchar(30) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[GLExportSummaryLevelRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[GLExportSummaryLevelRef] (
    [GLExportSummaryLevelCode] int NOT NULL,
    [GLExportSummaryLevelDesc] nvarchar(50) NOT NULL,
    [GLExportSummaryLevelName] nvarchar(25) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[GLSourceItemTypeRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[GLSourceItemTypeRef] (
    [GLSourceItemTypeCode] nchar(4) NOT NULL,
    [GLSourceItemTypeDesc] nvarchar(50) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[GLTransactionMain]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[GLTransactionMain] (
    [GLTransactionKey] uniqueidentifier NOT NULL,
    [TransactionDate] datetime NOT NULL,
    [FiscalPeriod] int NULL,
    [FinancialEntityKey] uniqueidentifier NOT NULL,
    [JournalEntryTypeCode] int NOT NULL,
    [OriginatingBatchNumber] nvarchar(50) NULL,
    [FinalBatchNumber] nvarchar(50) NULL,
    [InvoiceKey] uniqueidentifier NULL,
    [PaymentKey] uniqueidentifier NULL,
    [ContactKey] uniqueidentifier NULL,
    [CreatedOn] datetime NOT NULL,
    [ExportedOn] datetime NULL,
    [Description] nvarchar(50) NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[GradeRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[GradeRef] (
    [GradeKey] uniqueidentifier NOT NULL,
    [GradeValue] nvarchar(50) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[GroupInstanceRole]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[GroupInstanceRole] (
    [GroupKey] uniqueidentifier NOT NULL,
    [GroupRoleKey] uniqueidentifier NOT NULL,
    [IsUnique] bit NOT NULL CONSTRAINT [DF_GroupInstanceRole_IsUnique] DEFAULT (0),
    [IsRequired] bit NOT NULL CONSTRAINT [DF_GroupInstanceRole_IsRequired] DEFAULT (0),
    [IsDefault] bit NOT NULL CONSTRAINT [DF_GroupInstanceRole_IsDefault] DEFAULT (0),
    [SortRank] int NULL,
    [DefaultMemberStatusCode] nvarchar(4) NOT NULL,
    [GroupInstanceRoleKey] uniqueidentifier NOT NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[GroupMain]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[GroupMain] (
    [GroupKey] uniqueidentifier NOT NULL CONSTRAINT [DF_GroupMain_GroupKey] DEFAULT (newid()),
    [Name] nvarchar(65) NOT NULL CONSTRAINT [DF_GroupMain_Name] DEFAULT (''),
    [Description] nvarchar(250) NULL CONSTRAINT [DF_GroupMain_Description] DEFAULT (''),
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [UpdatedOn] datetime NOT NULL CONSTRAINT [DF_GroupMain_UpdatedOn] DEFAULT (getdate()),
    [IsSystem] bit NOT NULL CONSTRAINT [DF_GroupMain_IsSystem] DEFAULT (0),
    [IsAutoGenerated] bit NOT NULL CONSTRAINT [DF_GroupMain_IsAutoGenerated] DEFAULT (0),
    [GroupTypeKey] uniqueidentifier NOT NULL,
    [Priority] int NULL,
    [OwnerAccessKey] uniqueidentifier NULL,
    [OverrideOwnerGroupKey] uniqueidentifier NULL,
    [AccessKey] uniqueidentifier NOT NULL,
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedOn] datetime NOT NULL,
    [SystemEntityKey] uniqueidentifier NULL,
    [IsInvitationOnly] bit NOT NULL,
    [GroupStatusCode] nvarchar(4) NOT NULL,
    [IsSimpleGroup] bit NOT NULL CONSTRAINT [DF_GroupMain_IsSimpleGroup] DEFAULT (0),
    [InheritRolesFlag] bit NOT NULL CONSTRAINT [DF_GroupMain_InheritRolesFlag] DEFAULT (0),
    [IsSingleRole] bit NOT NULL CONSTRAINT [DF_GroupMain_IsSingleRole] DEFAULT (0),
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[GroupMember]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[GroupMember] (
    [GroupMemberKey] uniqueidentifier NOT NULL CONSTRAINT [DF_GroupMember_GroupMemberKey] DEFAULT (newid()),
    [GroupKey] uniqueidentifier NOT NULL,
    [MemberContactKey] uniqueidentifier NOT NULL,
    [IsActive] bit NOT NULL CONSTRAINT [DF_GroupMember_IsActive] DEFAULT (1),
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedOn] datetime NOT NULL CONSTRAINT [DF_GroupMember_CreatedOn] DEFAULT (getdate()),
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [UpdatedOn] datetime NOT NULL CONSTRAINT [DF_GroupMember_UpdatedOn] DEFAULT (getdate()),
    [DropDate] datetime NULL,
    [JoinDate] datetime NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[GroupMemberDetail]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[GroupMemberDetail] (
    [GroupMemberKey] uniqueidentifier NOT NULL CONSTRAINT [DF_GroupMemberDetail_GroupMemberKey] DEFAULT (newid()),
    [GroupRoleKey] uniqueidentifier NOT NULL,
    [EffectiveDate] datetime NOT NULL,
    [ExpirationDate] datetime NULL,
    [TypeSpecificData] nvarchar(250) NULL,
    [TypeSpecificKey] uniqueidentifier NULL,
    [TypeSpecificFlag] bit NULL,
    [CreatedOn] datetime NOT NULL CONSTRAINT [DF_GroupMemberDetail_CreatedOn] DEFAULT (getdate()),
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [UpdatedOn] datetime NOT NULL CONSTRAINT [DF_GroupMemberDetail_UpdatedOn] DEFAULT (getdate()),
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [TypeSpecificInt] int NULL,
    [GroupMemberStatusCode] nvarchar(4) NOT NULL,
    [IsActive] bit NOT NULL CONSTRAINT [DF_GroupMemberDetail_IsActive] DEFAULT (1),
    [GroupMemberDetailKey] uniqueidentifier NOT NULL CONSTRAINT [DF_GroupMemberDetail_GroupMemberDetailKey] DEFAULT (newid()),
    [GroupKey] uniqueidentifier NOT NULL,
    [MarkedForDeleteOn] datetime NULL,
    [RecurringTransactionInstructionKey] uniqueidentifier NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[GroupMemberOptions]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[GroupMemberOptions] (
    [GroupMemberKey] uniqueidentifier NOT NULL,
    [OptOutFlag] bit NOT NULL,
    [GroupContactFullAddressKey] uniqueidentifier NULL,
    [GroupBillingFullAddressKey] uniqueidentifier NULL,
    [AlternativeBillToContactKey] uniqueidentifier NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[GroupMemberStatusRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[GroupMemberStatusRef] (
    [GroupMemberStatusCode] nvarchar(4) NOT NULL,
    [GroupMemberStatusDesc] nvarchar(30) NOT NULL,
    [IsActiveStatus] bit NOT NULL CONSTRAINT [DF_GroupMemberStatusRef_IsActiveStatus] DEFAULT (0)
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[GroupOpportunityType]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[GroupOpportunityType] (
    [GroupKey] uniqueidentifier NOT NULL,
    [OpportunityTypeKey] uniqueidentifier NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[GroupPerspective]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[GroupPerspective] (
    [GroupPerspectiveKey] uniqueidentifier NOT NULL,
    [GroupKey] uniqueidentifier NOT NULL,
    [PerspectiveKey] uniqueidentifier NOT NULL,
    [IsDefaultFlag] bit NOT NULL CONSTRAINT [DF_GroupPerspective_IsDefaultFlag] DEFAULT (0)
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[GroupRoleRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[GroupRoleRef] (
    [GroupRoleKey] uniqueidentifier NOT NULL,
    [GroupRoleDesc] nvarchar(65) NOT NULL,
    [IsActive] bit NOT NULL CONSTRAINT [DF_GroupRoleRef_IsActive] DEFAULT (1),
    [IsSystem] bit NOT NULL CONSTRAINT [DF_GroupRoleRef_IsSystem] DEFAULT (0),
    [GroupRoleName] nvarchar(65) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[GroupStatusRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[GroupStatusRef] (
    [GroupStatusCode] nvarchar(4) NOT NULL,
    [GroupStatusDesc] nvarchar(30) NOT NULL,
    [IsActiveStatus] bit NOT NULL CONSTRAINT [DF_GroupStatusRef_IsActiveStatus] DEFAULT (0),
    [IsDefault] bit NOT NULL CONSTRAINT [DF_GroupStatusRef_IsDefault] DEFAULT (0)
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[GroupTypeMemberStatus]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[GroupTypeMemberStatus] (
    [GroupTypeKey] uniqueidentifier NOT NULL,
    [GroupMemberStatusCode] nvarchar(4) NOT NULL,
    [IsActiveStatus] bit NOT NULL CONSTRAINT [DF_GroupTypeMemberStatus_IsActiveStatus] DEFAULT (0),
    [Priority] int NOT NULL CONSTRAINT [DF_GroupTypeMemberStatus_Priority] DEFAULT (0),
    [MarkedForDeleteOn] datetime NULL,
    [GroupTypeMemberStatusKey] uniqueidentifier NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[GroupTypeRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[GroupTypeRef] (
    [GroupTypeKey] uniqueidentifier NOT NULL,
    [GroupTypeName] nvarchar(65) NOT NULL,
    [IsSystem] bit NOT NULL CONSTRAINT [DF_GroupTypeRef_IsSystem] DEFAULT (0),
    [IsPaymentRequired] bit NOT NULL CONSTRAINT [DF_GroupTypeRef_IsPaymentRequired] DEFAULT (0),
    [IsDateLimited] bit NOT NULL CONSTRAINT [DF_GroupTypeRef_IsDateLimited] DEFAULT (0),
    [GroupMemberBranchName] nvarchar(100) NULL,
    [IsInvitationOnly] bit NOT NULL,
    [DefaultGroupStatusCode] nvarchar(4) NOT NULL,
    [IsSimpleGroup] bit NOT NULL CONSTRAINT [DF_GroupTypeRef_IsSimpleGroup] DEFAULT (0),
    [MemberQueryFolderKey] uniqueidentifier NULL,
    [InheritRolesFlag] bit NOT NULL CONSTRAINT [DF_GroupTypeRef_InheritRolesFlag] DEFAULT (0),
    [IsSingleRole] bit NOT NULL CONSTRAINT [DF_GroupTypeRef_IsSingleRole] DEFAULT (0),
    [GroupTypeDesc] nvarchar(250) NULL,
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedOn] datetime NOT NULL,
    [UpdatedOn] datetime NOT NULL,
    [LandingPageContentKey] uniqueidentifier NULL,
    [IsRelationshipGroup] bit NOT NULL CONSTRAINT [DF_GroupTypeRef_IsRelationshipGroup] DEFAULT (0)
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[GroupTypeRole]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[GroupTypeRole] (
    [GroupTypeKey] uniqueidentifier NOT NULL,
    [GroupRoleKey] uniqueidentifier NOT NULL,
    [IsRequired] bit NOT NULL CONSTRAINT [DF_GroupTypeRole_IsRequired] DEFAULT (0),
    [IsUnique] bit NOT NULL CONSTRAINT [DF_GroupTypeRole_IsUnique] DEFAULT (0),
    [SortRank] int NULL,
    [IsDefault] bit NOT NULL CONSTRAINT [DF_GroupTypeRole_IsDefault] DEFAULT (0),
    [DefaultMemberStatusCode] nvarchar(4) NOT NULL,
    [IsSystem] bit NOT NULL CONSTRAINT [DF_GroupTypeRole_IsSystem] DEFAULT (0),
    [GroupTypeRoleKey] uniqueidentifier NOT NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[HandlingPriceRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[HandlingPriceRef] (
    [HandlingPriceCode] int NOT NULL,
    [HandlingPriceDesc] nvarchar(50) NOT NULL,
    [DisplayPrompt] nvarchar(100) NOT NULL CONSTRAINT [DF_HandlingPriceRef_DisplayPrompt] DEFAULT ('')
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[HIControlTypeRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[HIControlTypeRef] (
    [HIControlTypeCode] int NOT NULL,
    [HIControlTypeName] nvarchar(30) NOT NULL,
    [HIControlTypeDesc] nvarchar(30) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Hierarchy]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Hierarchy] (
    [HierarchyKey] uniqueidentifier NOT NULL,
    [RootHierarchyKey] uniqueidentifier NULL,
    [ParentHierarchyKey] uniqueidentifier NULL,
    [SortOrder] int NOT NULL,
    [Depth] int NOT NULL,
    [UniformType] nvarchar(100) NULL,
    [UniformKey] uniqueidentifier NULL,
    [IsChildAMemberOfParent] bit NOT NULL CONSTRAINT [DF_Hierarchy_IsChildAMemberOfParent] DEFAULT (1),
    [HierarchyCode] nvarchar(100) NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[HierarchyRoot]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[HierarchyRoot] (
    [RootHierarchyKey] uniqueidentifier NOT NULL,
    [HierarchyRootName] nvarchar(100) NOT NULL,
    [HierarchyRootDescription] nvarchar(255) NOT NULL,
    [OrganizationKey] uniqueidentifier NOT NULL,
    [AccessKey] uniqueidentifier NOT NULL,
    [UniformType] nvarchar(100) NOT NULL,
    [CreatedOn] datetime NOT NULL CONSTRAINT [DF_HierarchyRoot_CreatedOn] DEFAULT (getdate()),
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [UpdatedOn] datetime NOT NULL CONSTRAINT [DF_HierarchyRoot_UpdatedOn] DEFAULT (getdate()),
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[History]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[History] (
    [HistoryID] int IDENTITY(1,1) NOT NULL,
    [EventDate] datetime NOT NULL,
    [IP] varchar(128) NULL,
    [Description] varchar(1024) NOT NULL,
    [EventType] varchar(256) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Hotel_Log]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Hotel_Log] (
    [HOTEL_LOG_NUMBER] int NOT NULL CONSTRAINT [DF_Hotel_Log_HOTEL_LOG_NUMBER] DEFAULT (0),
    [MEETING] varchar(10) NOT NULL CONSTRAINT [DF_Hotel_Log_MEETING] DEFAULT (''),
    [PRODUCT_CODE] varchar(31) NOT NULL CONSTRAINT [DF_Hotel_Log_PRODUCT_CODE] DEFAULT (''),
    [ORDER_NUMBER] numeric(15, 2) NOT NULL CONSTRAINT [DF_Hotel_Log_ORDER_NUMBER] DEFAULT (0),
    [CHANGE_TYPE] varchar(10) NOT NULL CONSTRAINT [DF_Hotel_Log_CHANGE_TYPE] DEFAULT (''),
    [TEXT] text NULL,
    [DATE_TIME] datetime NULL,
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[IMISTable]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[IMISTable] (
    [IMISTableName] nvarchar(128) NOT NULL,
    [IsIMIS10Table] bit NOT NULL CONSTRAINT [DF_IMISTable_IsIMIS10Table] DEFAULT (0),
    [IsIMIS15Table] bit NOT NULL CONSTRAINT [DF_IMISTable_IsMIS15Table] DEFAULT (0)
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[ImportFileTypeRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ImportFileTypeRef] (
    [ImportFileTypeCode] nvarchar(50) NOT NULL,
    [ImportFileTypeDesc] nvarchar(100) NULL,
    [IsSystem] bit NOT NULL CONSTRAINT [DF_ImportFileTypeRef_IsSystem] DEFAULT (0),
    [RequiresUserFileFlag] bit NOT NULL CONSTRAINT [DF_ImportFileTypeRef_RequiresUserFileFlag] DEFAULT (1),
    [DataEntity] nvarchar(50) NOT NULL,
    [Operation] nvarchar(50) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Individual]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Individual] (
    [ContactKey] uniqueidentifier NOT NULL,
    [PrefixCode] nvarchar(25) NULL,
    [FirstName] nvarchar(20) NOT NULL,
    [MiddleName] nvarchar(20) NULL,
    [LastName] nvarchar(30) NOT NULL,
    [SuffixCode] nvarchar(10) NULL,
    [Designation] nvarchar(20) NULL,
    [Informal] nvarchar(20) NULL,
    [Gender] nchar(1) NULL,
    [BirthDate] datetime NULL,
    [PrimaryInstituteContactKey] uniqueidentifier NULL,
    [PrimaryInstituteName] nvarchar(80) NULL,
    [PrimaryInstituteTitle] nvarchar(80) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Input_Type_Ref]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Input_Type_Ref] (
    [InputTypeCode] char(2) NOT NULL,
    [InputTypeDesc] varchar(25) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Institute]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Institute] (
    [ContactKey] uniqueidentifier NOT NULL,
    [InstituteName] nvarchar(80) NOT NULL,
    [PrimaryContactKey] uniqueidentifier NULL,
    [InstituteGroupKey] uniqueidentifier NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Int_Code]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Int_Code] (
    [CODE] varchar(10) NOT NULL CONSTRAINT [DF_Int_Code_CODE] DEFAULT (''),
    [DESCRIPTION] varchar(100) NOT NULL CONSTRAINT [DF_Int_Code_DESCRIPTION] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Interest_Category]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Interest_Category] (
    [InterestCategoryID] numeric(18, 0) IDENTITY(1,1) NOT NULL,
    [Name] varchar(255) NOT NULL,
    [Description] varchar(255) NULL,
    [IndustryFlag] char(1) NULL,
    [SICCode] varchar(4) NULL,
    [ParentCategoryID] numeric(18, 0) NULL,
    [AncestorCategoryID] numeric(18, 0) NULL,
    [CategoryDepth] numeric(18, 0) NULL,
    [AncestorOrder] numeric(28, 18) NULL,
    [SortOrder] numeric(28, 18) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[IntervalTypeRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[IntervalTypeRef] (
    [IntervalTypeCode] int NOT NULL,
    [IntervalTypeDesc] nvarchar(50) NOT NULL,
    [IntervalTypeName] nvarchar(20) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[InventoryTransactionLogCost]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[InventoryTransactionLogCost] (
    [InventoryTransactionLogCostKey] uniqueidentifier NOT NULL,
    [InventoryTransactionLogKey] uniqueidentifier NOT NULL,
    [ProductKey] uniqueidentifier NOT NULL,
    [Quantity] decimal(18, 8) NOT NULL,
    [TotalCost] decimal(18, 4) NOT NULL,
    [QuantityReturned] decimal(18, 8) NOT NULL,
    [SortOrder] int NOT NULL,
    [CostMethodCode] int NOT NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[InventoryTransactionLogLine]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[InventoryTransactionLogLine] (
    [InventoryTransactionLogKey] uniqueidentifier NOT NULL,
    [InventoryTransactionLogLineKey] uniqueidentifier NOT NULL,
    [TransactionTypeCode] int NOT NULL,
    [WarehouseKey] uniqueidentifier NOT NULL,
    [OrderLineKey] uniqueidentifier NULL,
    [ProductKey] uniqueidentifier NOT NULL,
    [UomKey] uniqueidentifier NOT NULL,
    [ProductDescription] nvarchar(100) NULL,
    [Quantity] decimal(18, 8) NOT NULL,
    [QuantityOrdered] decimal(18, 8) NULL,
    [ReasonCodeKey] uniqueidentifier NULL,
    [LotId] nvarchar(50) NULL,
    [PurchaseOrderNumber] nvarchar(50) NULL,
    [InventoryLocationKey] uniqueidentifier NULL,
    [LandedCost] decimal(18, 4) NULL,
    [OrderFulfillmentLineKey] uniqueidentifier NULL,
    [ProductInventoryKey] uniqueidentifier NULL,
    [TransactionMessage] nvarchar(200) NULL,
    [SortOrder] int NOT NULL,
    [RelatedInventoryTransactionLogLineKey] uniqueidentifier NULL,
    [TotalCost] decimal(18, 4) NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[InventoryTransactionLogMain]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[InventoryTransactionLogMain] (
    [InventoryTransactionLogKey] uniqueidentifier NOT NULL,
    [TransactionDate] datetime NOT NULL,
    [OrderKey] uniqueidentifier NULL,
    [OrderNumber] nvarchar(50) NULL,
    [Vendor] nvarchar(50) NULL,
    [ReceiptNumber] nvarchar(50) NULL,
    [ReturnAuthorization] nvarchar(50) NULL,
    [Notes] nvarchar(200) NULL,
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedOn] datetime NOT NULL,
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [UpdatedOn] datetime NOT NULL,
    [SystemEntityKey] uniqueidentifier NOT NULL,
    [OwnerGroupKey] uniqueidentifier NULL,
    [MarkedForDeleteOn] datetime NULL,
    [FinalBatchKey] uniqueidentifier NULL,
    [OriginatingBatchKey] uniqueidentifier NULL,
    [BatchLineStatusCode] int NULL,
    [BatchStatusMessage] nvarchar(200) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Invoice]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Invoice] (
    [BT_ID] varchar(10) NOT NULL CONSTRAINT [DF_Invoice_BT_ID] DEFAULT (''),
    [ST_ID] varchar(10) NOT NULL CONSTRAINT [DF_Invoice_ST_ID] DEFAULT (''),
    [REFERENCE_NUM] int NOT NULL CONSTRAINT [DF_Invoice_REFERENCE_NUM] DEFAULT (0),
    [INVOICE_NUM] int NOT NULL CONSTRAINT [DF_Invoice_INVOICE_NUM] DEFAULT (0),
    [INVOICE_DATE] datetime NULL,
    [CUSTOMER_NAME] varchar(60) NOT NULL CONSTRAINT [DF_Invoice_CUSTOMER_NAME] DEFAULT (''),
    [EFFECTIVE_DATE] datetime NULL,
    [ORG_CODE] varchar(5) NOT NULL CONSTRAINT [DF_Invoice_ORG_CODE] DEFAULT (''),
    [INVOICE_TYPE] varchar(5) NOT NULL CONSTRAINT [DF_Invoice_INVOICE_TYPE] DEFAULT (''),
    [SOURCE_SYSTEM] varchar(10) NOT NULL CONSTRAINT [DF_Invoice_SOURCE_SYSTEM] DEFAULT (''),
    [DESCRIPTION] varchar(255) NOT NULL CONSTRAINT [DF_Invoice_DESCRIPTION] DEFAULT (''),
    [CUSTOMER_REFERENCE] varchar(40) NOT NULL CONSTRAINT [DF_Invoice_CUSTOMER_REFERENCE] DEFAULT (''),
    [CHARGES] money NOT NULL CONSTRAINT [DF_Invoice_CHARGES] DEFAULT (0),
    [CREDITS] money NOT NULL CONSTRAINT [DF_Invoice_CREDITS] DEFAULT (0),
    [BALANCE] money NOT NULL CONSTRAINT [DF_Invoice_BALANCE] DEFAULT (0),
    [NUM_LINES] int NOT NULL CONSTRAINT [DF_Invoice_NUM_LINES] DEFAULT (0),
    [TERMS_CODE] varchar(5) NOT NULL CONSTRAINT [DF_Invoice_TERMS_CODE] DEFAULT (''),
    [DUE_DATE] datetime NULL,
    [DISCOUNT_DATE] datetime NULL,
    [AVAILABLE_DISC] money NOT NULL CONSTRAINT [DF_Invoice_AVAILABLE_DISC] DEFAULT (0),
    [CREDIT_STATUS] varchar(5) NOT NULL CONSTRAINT [DF_Invoice_CREDIT_STATUS] DEFAULT (''),
    [AR_ACCOUNT] varchar(50) NOT NULL CONSTRAINT [DF_Invoice_AR_ACCOUNT] DEFAULT (''),
    [NOTE] varchar(255) NOT NULL CONSTRAINT [DF_Invoice_NOTE] DEFAULT (''),
    [SOURCE_CODE] varchar(40) NOT NULL CONSTRAINT [DF_Invoice_SOURCE_CODE] DEFAULT (''),
    [BATCH_NUM] varchar(15) NOT NULL CONSTRAINT [DF_Invoice_BATCH_NUM] DEFAULT (''),
    [INSTALL_BILL_DATE] datetime NULL,
    [ORIGINATING_TRANS_NUM] int NOT NULL CONSTRAINT [DF_Invoice_ORIGINATING_TRANS_NUM] DEFAULT (0),
    [HAS_BEEN_BILLED] bit NOT NULL CONSTRAINT [DF_Invoice_HAS_BEEN_BILLED] DEFAULT (0),
    [BILL_TO_CC] bit NOT NULL CONSTRAINT [DF_Invoice_BILL_TO_CC] DEFAULT (0),
    [IS_MULTI_ORG] bit NOT NULL CONSTRAINT [DF_Invoice_IS_MULTI_ORG] DEFAULT (0),
    [ADJUSTMENTS] money NOT NULL CONSTRAINT [DF_Invoice_ADJUSTMENTS] DEFAULT (0),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Invoice_Lines]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Invoice_Lines] (
    [REFERENCE_NUM] int NOT NULL CONSTRAINT [DF_Invoice_Lines_REFERENCE_NUM] DEFAULT (0),
    [LINE_NUM] int NOT NULL CONSTRAINT [DF_Invoice_Lines_LINE_NUM] DEFAULT (0),
    [ST_ID] varchar(10) NOT NULL CONSTRAINT [DF_Invoice_Lines_ST_ID] DEFAULT (''),
    [PRODUCT_CODE] varchar(31) NOT NULL CONSTRAINT [DF_Invoice_Lines_PRODUCT_CODE] DEFAULT (''),
    [CHARGES] money NOT NULL CONSTRAINT [DF_Invoice_Lines_CHARGES] DEFAULT (0),
    [BILL_FROM] datetime NULL,
    [BILL_THRU] datetime NULL,
    [BILL_QTY] int NOT NULL CONSTRAINT [DF_Invoice_Lines_BILL_QTY] DEFAULT (0),
    [CREDITS] money NOT NULL CONSTRAINT [DF_Invoice_Lines_CREDITS] DEFAULT (0),
    [PAID_FROM] datetime NULL,
    [PAID_THRU] datetime NULL,
    [PAID_QTY] numeric(15, 2) NOT NULL CONSTRAINT [DF_Invoice_Lines_PAID_QTY] DEFAULT (0),
    [BALANCE] money NOT NULL CONSTRAINT [DF_Invoice_Lines_BALANCE] DEFAULT (0),
    [ORG_CODE] varchar(5) NOT NULL CONSTRAINT [DF_Invoice_Lines_ORG_CODE] DEFAULT (''),
    [AR_ACCOUNT] varchar(50) NOT NULL CONSTRAINT [DF_Invoice_Lines_AR_ACCOUNT] DEFAULT (''),
    [ADJUSTMENTS] money NOT NULL CONSTRAINT [DF_Invoice_Lines_ADJUSTMENTS] DEFAULT (0),
    [IS_FR_ITEM] bit NOT NULL CONSTRAINT [DF_Invoice_Lines_IS_FR_ITEM] DEFAULT (0),
    [CAMPAIGN_CODE] varchar(10) NOT NULL CONSTRAINT [DF_Invoice_Lines_CAMPAIGN_CODE] DEFAULT (''),
    [APPEAL_CODE] varchar(40) NOT NULL CONSTRAINT [DF_Invoice_Lines_APPEAL_CODE] DEFAULT (''),
    [FAIR_MARKET_VALUE] numeric(15, 2) NOT NULL CONSTRAINT [DF_Invoice_Lines_FAIR_MARKET_VALUE] DEFAULT (0),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[InvoiceTypeRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[InvoiceTypeRef] (
    [InvoiceTypeCode] nchar(1) NOT NULL,
    [InvoiceTypeDesc] nvarchar(20) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[IQA_Query_Cache]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[IQA_Query_Cache] (
    [UserId] varchar(60) NOT NULL,
    [QueryId] varchar(50) NOT NULL,
    [Value] varchar(50) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Iso_Currency_Codes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Iso_Currency_Codes] (
    [CurrencyCode] varchar(3) NOT NULL CONSTRAINT [DF_Iso_Currency_Codes_CurrencyCode] DEFAULT (''),
    [CurrencyName] varchar(255) NOT NULL CONSTRAINT [DF_Iso_Currency_Codes_CurrencyName] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Job_Record]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Job_Record] (
    [JobId] int NOT NULL CONSTRAINT [DF_Job_Record_JobId] DEFAULT (0),
    [Title] varchar(64) NOT NULL CONSTRAINT [DF_Job_Record_Title] DEFAULT (''),
    [RunDate] datetime NULL,
    [ExpirationDate] datetime NULL,
    [UserId] varchar(60) NOT NULL CONSTRAINT [DF_Job_Record_UserId] DEFAULT (''),
    [ImisSystem] varchar(10) NOT NULL CONSTRAINT [DF_Job_Record_ImisSystem] DEFAULT (''),
    [Category] varchar(20) NOT NULL CONSTRAINT [DF_Job_Record_Category] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[JournalEntryTypeRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[JournalEntryTypeRef] (
    [JournalEntryTypeCode] int NOT NULL,
    [JournalEntryTypeDesc] nvarchar(50) NOT NULL,
    [JournalEntryTypeName] nvarchar(25) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[LegacySecurityLevelRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[LegacySecurityLevelRef] (
    [LevelCode] tinyint NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Legis_Bills]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Legis_Bills] (
    [BILL_ID] varchar(10) NOT NULL CONSTRAINT [DF_Legis_Bills_BILL_ID] DEFAULT (''),
    [BILL_TYPE] varchar(5) NOT NULL CONSTRAINT [DF_Legis_Bills_BILL_TYPE] DEFAULT (''),
    [COMPANION] varchar(10) NOT NULL CONSTRAINT [DF_Legis_Bills_COMPANION] DEFAULT (''),
    [AUTHOR_CODE] varchar(10) NOT NULL CONSTRAINT [DF_Legis_Bills_AUTHOR_CODE] DEFAULT (''),
    [AUTHOR_NAME] varchar(60) NOT NULL CONSTRAINT [DF_Legis_Bills_AUTHOR_NAME] DEFAULT (''),
    [COAUTHOR_CODE] varchar(10) NOT NULL CONSTRAINT [DF_Legis_Bills_COAUTHOR_CODE] DEFAULT (''),
    [COAUTHOR_NAME] varchar(60) NOT NULL CONSTRAINT [DF_Legis_Bills_COAUTHOR_NAME] DEFAULT (''),
    [SPONSOR_CODE] varchar(10) NOT NULL CONSTRAINT [DF_Legis_Bills_SPONSOR_CODE] DEFAULT (''),
    [SPONSOR_NAME] varchar(60) NOT NULL CONSTRAINT [DF_Legis_Bills_SPONSOR_NAME] DEFAULT (''),
    [TITLE] varchar(255) NOT NULL CONSTRAINT [DF_Legis_Bills_TITLE] DEFAULT (''),
    [STATUS] varchar(5) NOT NULL CONSTRAINT [DF_Legis_Bills_STATUS] DEFAULT (''),
    [LAST_ACTION] varchar(80) NOT NULL CONSTRAINT [DF_Legis_Bills_LAST_ACTION] DEFAULT (''),
    [LAST_ACTION_DATE] datetime NULL,
    [SUBJECT_CODE] varchar(255) NOT NULL CONSTRAINT [DF_Legis_Bills_SUBJECT_CODE] DEFAULT (''),
    [CATEGORY] varchar(40) NOT NULL CONSTRAINT [DF_Legis_Bills_CATEGORY] DEFAULT (''),
    [SUBJECT] varchar(80) NOT NULL CONSTRAINT [DF_Legis_Bills_SUBJECT] DEFAULT (''),
    [SYNOPSIS] text NULL,
    [ANALYSIS] text NULL,
    [DATE_ADDED] datetime NULL,
    [LAST_UPDATED] datetime NULL,
    [UPDATED_BY] varchar(60) NOT NULL CONSTRAINT [DF_Legis_Bills_UPDATED_BY] DEFAULT (''),
    [BRIEFED] bit NOT NULL CONSTRAINT [DF_Legis_Bills_BRIEFED] DEFAULT (0),
    [NOTES] text NULL,
    [ACTION_HISTORY] text NULL,
    [UF1] varchar(100) NOT NULL CONSTRAINT [DF_Legis_Bills_UF1] DEFAULT (''),
    [UF2] varchar(100) NOT NULL CONSTRAINT [DF_Legis_Bills_UF2] DEFAULT (''),
    [UF3] varchar(100) NOT NULL CONSTRAINT [DF_Legis_Bills_UF3] DEFAULT (''),
    [UF4] varchar(100) NOT NULL CONSTRAINT [DF_Legis_Bills_UF4] DEFAULT (''),
    [UF5] varchar(100) NOT NULL CONSTRAINT [DF_Legis_Bills_UF5] DEFAULT (''),
    [UF6] datetime NULL,
    [UF7] datetime NULL,
    [UF8] datetime NULL,
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[License]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[License] (
    [LicenseKey] uniqueidentifier NOT NULL,
    [LicenseName] nvarchar(50) NOT NULL,
    [LicenseDesc] nvarchar(100) NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[LicenseLegacyList]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[LicenseLegacyList] (
    [LicenseLegacyKey] uniqueidentifier NOT NULL,
    [LegacyLicenseCode] nvarchar(100) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[LicenseLegacyMap]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[LicenseLegacyMap] (
    [LicenseKey] uniqueidentifier NOT NULL,
    [LegacyLicenseCode] nvarchar(50) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[LicenseMain]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[LicenseMain] (
    [LicenseMasterKey] uniqueidentifier NOT NULL,
    [LicenseKey] uniqueidentifier NOT NULL,
    [OrganizationKey] uniqueidentifier NOT NULL,
    [NamedLicenseCount] int NOT NULL CONSTRAINT [DF_LicenseMain_NamedLicenseCount] DEFAULT (0),
    [UnnamedLicenseCount] int NOT NULL CONSTRAINT [DF_LicenseMain_UnnamedLicenseCount] DEFAULT (0),
    [EffectiveDate] datetime NOT NULL,
    [ExpirationDate] datetime NULL,
    [Checksum] nvarchar(250) NOT NULL CONSTRAINT [DF_LicenseMain_Checksum] DEFAULT (0),
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[LicenseMap]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[LicenseMap] (
    [LicenseKey] uniqueidentifier NOT NULL,
    [LicenseType] nvarchar(100) NOT NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[LicenseMapMaster]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[LicenseMapMaster] (
    [LicenseKey] uniqueidentifier NOT NULL,
    [LicenseType] nvarchar(100) NOT NULL,
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedOn] datetime NOT NULL,
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [UpdatedOn] datetime NOT NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[LicenseMaster]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[LicenseMaster] (
    [LicenseMasterKey] uniqueidentifier NOT NULL,
    [LicenseKey] uniqueidentifier NOT NULL,
    [LicenseOrganizationKey] uniqueidentifier NOT NULL,
    [NamedLicenseCount] int NOT NULL CONSTRAINT [DF_LicenseMaster_NamedLicenseCount] DEFAULT (0),
    [UnnamedLicenseCount] int NOT NULL CONSTRAINT [DF_LicenseMaster_UnnamedLicenseCount] DEFAULT (0),
    [Checksum] nvarchar(250) NOT NULL CONSTRAINT [DF_LicenseMaster_Checksum] DEFAULT (0),
    [EffectiveDate] datetime NOT NULL,
    [ExpirationDate] datetime NULL,
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedOn] datetime NOT NULL,
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [UpdatedOn] datetime NOT NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[LicenseOrganization]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[LicenseOrganization] (
    [LicenseOrganizationKey] uniqueidentifier NOT NULL,
    [Name] nvarchar(50) NOT NULL,
    [ContactKey] uniqueidentifier NULL,
    [Description] nvarchar(250) NOT NULL CONSTRAINT [DF_LicenseOrganization_Description] DEFAULT (''),
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedOn] datetime NOT NULL,
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [UpdatedOn] datetime NOT NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[LicenseTypeRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[LicenseTypeRef] (
    [LicenseType] nvarchar(100) NOT NULL,
    [Description] nvarchar(100) NULL,
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedOn] datetime NOT NULL,
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [UpdatedOn] datetime NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[LicenseUser]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[LicenseUser] (
    [LicenseKey] uniqueidentifier NOT NULL,
    [UserKey] uniqueidentifier NOT NULL,
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedOn] datetime NOT NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[LinePricingRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[LinePricingRef] (
    [LinePricingCode] int NOT NULL,
    [LinePricingDesc] nvarchar(30) NOT NULL,
    [LinePricingName] nvarchar(20) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[ListItem]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ListItem] (
    [ListItemKey] uniqueidentifier NOT NULL CONSTRAINT [DF_ListItem_ListItemKey] DEFAULT (newid()),
    [ListKey] uniqueidentifier NOT NULL,
    [ObjectKey] uniqueidentifier NOT NULL,
    [IsDisabled] bit NOT NULL CONSTRAINT [DF_ListItem_IsDisabled] DEFAULT (0),
    [LinkedObjectKey] uniqueidentifier NULL,
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedOn] datetime NOT NULL CONSTRAINT [DF_ListItem_CreatedOn] DEFAULT (getdate()),
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[ListMain]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ListMain] (
    [ListKey] uniqueidentifier NOT NULL CONSTRAINT [DF_ListMain_ListKey] DEFAULT (newid()),
    [MemberObjectType] nvarchar(100) NOT NULL CONSTRAINT [DF_ListMain_MemberObjectType] DEFAULT (''),
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[LocaleRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[LocaleRef] (
    [LocaleKey] uniqueidentifier NOT NULL,
    [LocaleCode] nvarchar(50) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[LocalizationApplication]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[LocalizationApplication] (
    [LocalizationApplicationId] int NOT NULL,
    [LocalizationApplicationName] nvarchar(50) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[LocalizationControlProperty]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[LocalizationControlProperty] (
    [LocalizationControlPropertyId] uniqueidentifier NOT NULL CONSTRAINT [DF_ControlProperty_ControlPropertyId] DEFAULT (newid()),
    [LocalizationControlTypeId] uniqueidentifier NOT NULL,
    [LocalizationControlPropertyName] nvarchar(220) NOT NULL,
    [TypeName] nvarchar(220) NULL,
    [IsPhrase] bit NULL,
    [HasWhiteSpace] bit NULL,
    [IsCollection] bit NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[LocalizationControlType]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[LocalizationControlType] (
    [LocalizationControlTypeId] uniqueidentifier NOT NULL CONSTRAINT [DF_ControlType_ControlTypeId] DEFAULT (newid()),
    [LocalizationControlTypeName] nvarchar(220) NOT NULL,
    [AssemblyName] nvarchar(220) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[LocalizationCulture]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[LocalizationCulture] (
    [LocalizationCultureId] nvarchar(50) NOT NULL,
    [LocalizationCultureName] nvarchar(50) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[LocalizationLookup]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[LocalizationLookup] (
    [LocalizationLookup] nvarchar(50) NOT NULL,
    [LocalizationCode] nvarchar(50) NOT NULL,
    [LocalizationDesc] nvarchar(400) NOT NULL,
    [IsActive] bit NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[LocalizationPhrase]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[LocalizationPhrase] (
    [LocalizationPhraseId] uniqueidentifier NOT NULL CONSTRAINT [DF_Phrase_SourcePhraseId] DEFAULT (newid()),
    [LocalizationApplicationId] int NOT NULL,
    [Phrase] nvarchar(400) NOT NULL,
    [Hash] varbinary(8000) NULL,
    [DoNotLocalize] bit NOT NULL CONSTRAINT [DF_LocalizationPhrase_DoNotLocalize] DEFAULT (0),
    [ControlType] nvarchar(300) NOT NULL CONSTRAINT [DF_LocalizationPhrase_ControlType] DEFAULT ('')
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[LocalizationPhraseTranslated]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[LocalizationPhraseTranslated] (
    [LocalizationPhraseTranslatedId] uniqueidentifier NOT NULL CONSTRAINT [DF_TranslatedPhrase_TranslatedPhraseId] DEFAULT (newid()),
    [LocalizationPhraseId] uniqueidentifier NOT NULL,
    [LocalizationCultureId] nvarchar(50) NOT NULL,
    [TranslatedPhrase] nvarchar(4000) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[LocalizationStatus]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[LocalizationStatus] (
    [StatusID] nvarchar(10) NOT NULL,
    [LocalizationStatusName] nvarchar(50) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[LocalizationVersion]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[LocalizationVersion] (
    [LocalizationVersionId] uniqueidentifier NOT NULL,
    [LocalizationVersionName] nvarchar(250) NOT NULL,
    [LocalizationVersionDesc] nvarchar(400) NOT NULL,
    [Note] nvarchar(400) NOT NULL,
    [DateCreated] datetime NOT NULL,
    [CreatedBy] nvarchar(250) NOT NULL,
    [DateUpdated] datetime NOT NULL,
    [UpdatedBy] nvarchar(250) NOT NULL,
    [CultureId] nvarchar(50) NOT NULL,
    [ActiveVersion] bit NOT NULL CONSTRAINT [DF_LocalizationVersion_ActiveVersion] DEFAULT (0),
    [ActiveVersionLoaded] datetime NULL,
    [TranslatedBy] nvarchar(250) NOT NULL CONSTRAINT [DF_LocalizationVersion_TranslatedBy] DEFAULT (''),
    [SystemTranslation] bit NOT NULL CONSTRAINT [DF_LocalizationVersion_SystemTranslation] DEFAULT (0),
    [Status] nvarchar(5) NULL CONSTRAINT [DF_LocalizationVersion_Status] DEFAULT (N'A'),
    [StatusDate] datetime NOT NULL CONSTRAINT [DF_LocalizationVersion_StatusDate] DEFAULT (getdate()),
    [StatusID] nvarchar(50) NOT NULL CONSTRAINT [DF_LocalizationVersion_StatusID] DEFAULT (N'A')
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[LocalizationVersionPhrase]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[LocalizationVersionPhrase] (
    [LocalizationVersionPhraseId] uniqueidentifier NOT NULL,
    [LocalizationVersionId] uniqueidentifier NOT NULL,
    [LocalizationPhraseTranslatedId] uniqueidentifier NULL,
    [Phrase] nvarchar(400) NOT NULL,
    [TranslatedPhrase] nvarchar(4000) NOT NULL,
    [DateCreated] datetime NOT NULL,
    [CreatedBy] nvarchar(250) NOT NULL,
    [DateUpdated] datetime NOT NULL,
    [UpdatedBy] nvarchar(250) NOT NULL,
    [Description] nvarchar(400) NULL,
    [TranslatedBy] nvarchar(250) NOT NULL CONSTRAINT [DF_LocalizationVersionPhrase_TranslatedBy] DEFAULT (''),
    [SystemTranslation] bit NOT NULL CONSTRAINT [DF_LocalizationVersionPhrase_SystemTranslation] DEFAULT (0),
    [Status] nvarchar(5) NULL,
    [StatusDate] datetime NOT NULL CONSTRAINT [DF_LocalizationVersionPhrase_StatusDate] DEFAULT (getdate()),
    [LocalizationPhraseId] uniqueidentifier NOT NULL,
    [DoNotLocalize] bit NOT NULL CONSTRAINT [DF_LocalizationVersionPhrase_DoNotLocalize] DEFAULT (0),
    [ControlType] nvarchar(300) NOT NULL CONSTRAINT [DF_LocalizationVersionPhrase_ControlType] DEFAULT ('')
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[LocalizationVersionPhraseTransfer]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[LocalizationVersionPhraseTransfer] (
    [LocalizationVersionPhraseId] uniqueidentifier NOT NULL,
    [Phrase] nvarchar(400) NOT NULL,
    [TranslatedPhrase] nvarchar(4000) NOT NULL,
    [Result] int NOT NULL CONSTRAINT [DF__Localizat__Resul__1F968286] DEFAULT (0),
    [DoNotLocalize] bit NOT NULL CONSTRAINT [DF_LocalizationVersionPhraseTransfer_DoNotLocalize] DEFAULT (0),
    [VersionPhraseTransferDesc] nvarchar(300) NOT NULL CONSTRAINT [DF_LocalizationVersionPhraseTransfer_VersionPhraseTransferDesc] DEFAULT ('')
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Location]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Location] (
    [LocationKey] uniqueidentifier NOT NULL,
    [ContactKey] uniqueidentifier NOT NULL,
    [LocationName] nvarchar(50) NOT NULL,
    [LocationDescription] nvarchar(200) NULL,
    [LocationStatusCode] nchar(2) NOT NULL,
    [MarkedForDeleteOn] datetime NULL,
    [UpdatedOn] datetime NULL,
    [UpdatedByUserKey] uniqueidentifier NULL,
    [CreatedOn] datetime NOT NULL,
    [CreatedByUserKey] uniqueidentifier NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[LocationStatusRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[LocationStatusRef] (
    [LocationStatusCode] nchar(2) NOT NULL,
    [LocationStatusName] nvarchar(50) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Log_Field]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Log_Field] (
    [LOG_SEQN] int NOT NULL,
    [FIELD_NAME] varchar(30) NOT NULL,
    [NEW_VALUE] varchar(255) NOT NULL,
    [OLD_VALUE] varchar(255) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Log_Main]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Log_Main] (
    [LOG_SEQN] int NOT NULL,
    [TIME_STAMP] datetime NULL,
    [UPDATED_BY] varchar(60) NOT NULL,
    [ACTION_TYPE] smallint NOT NULL,
    [TABLE_NAME] varchar(30) NOT NULL,
    [KEY_CLUSTER] varchar(80) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[LoginToken]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[LoginToken] (
    [Token] nvarchar(50) NOT NULL,
    [UserName] nvarchar(256) NOT NULL,
    [CreatedOn] datetime NOT NULL,
    [Expired] bit NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Mail_Lists]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Mail_Lists] (
    [MAIL_LIST] varchar(100) NOT NULL CONSTRAINT [DF_Mail_Lists_MAIL_LIST] DEFAULT (''),
    [MAIL_LIST_DESCR] varchar(255) NULL,
    [CREATION_DATE] datetime NOT NULL,
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Mail_Subscribers]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Mail_Subscribers] (
    [MAIL_LIST] varchar(100) NOT NULL CONSTRAINT [DF_Mail_Subscribers_MAIL_LIST] DEFAULT (''),
    [ID] varchar(10) NOT NULL CONSTRAINT [DF_Mail_Subscribers_ID] DEFAULT (''),
    [CREATION_DATE] datetime NOT NULL,
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[MailCodeRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[MailCodeRef] (
    [MailCode] nvarchar(5) NOT NULL,
    [MailCodeDesc] nvarchar(50) NOT NULL,
    [UpdatedOn] datetime NOT NULL,
    [UpdatedByUserKey] uniqueidentifier NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Match_Interest]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Match_Interest] (
    [MATCH_SEQN] int NOT NULL CONSTRAINT [DF_Match_Interest_MATCH_SEQN] DEFAULT (0),
    [INTEREST_CODE] varchar(10) NOT NULL CONSTRAINT [DF_Match_Interest_INTEREST_CODE] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[MatchingGift]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[MatchingGift] (
    [MatchingGiftKey] uniqueidentifier NOT NULL,
    [OriginalOrderLineKey] uniqueidentifier NOT NULL,
    [MatchingOrderLineKey] uniqueidentifier NOT NULL,
    [MatchingGiftPlanKey] uniqueidentifier NULL,
    [MatchingGiftRelationshipKey] uniqueidentifier NULL,
    [MatchingContactKey] uniqueidentifier NULL,
    [MatchingGiftInfo] nvarchar(200) NULL,
    [MatchedAmount] decimal(18, 4) NOT NULL CONSTRAINT [DF_MatchingGift_MatchedAmount] DEFAULT (0),
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[MatchingGiftPlan]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[MatchingGiftPlan] (
    [MatchingGiftPlanKey] uniqueidentifier NOT NULL,
    [Name] nvarchar(50) NOT NULL,
    [PlanProcedure] nvarchar(200) NULL,
    [RulesDescription] nvarchar(200) NULL,
    [OwnerContactKey] uniqueidentifier NOT NULL,
    [MatchingRatio] decimal(12, 4) NOT NULL CONSTRAINT [DF_MatchingGiftPlan_MatchingRatio] DEFAULT (1),
    [EffectiveDate] datetime NULL,
    [TerminationDate] datetime NULL,
    [MatchingGiftPlanTypeKey] uniqueidentifier NOT NULL,
    [IsPledgeQualified] bit NOT NULL CONSTRAINT [DF_MatchingGiftPlan_IsPledgeQualified] DEFAULT (1),
    [IsGiftQualified] bit NOT NULL CONSTRAINT [DF_MatchingGiftPlan_IsGiftQualified] DEFAULT (1),
    [MatchingGiftContactKey] uniqueidentifier NULL,
    [CorporateGiftContactKey] uniqueidentifier NULL,
    [IsAutomatch] bit NOT NULL CONSTRAINT [DF_MatchingGiftPlan_IsAutomatch] DEFAULT (1),
    [MatchingMode] int NOT NULL CONSTRAINT [DF_MatchingGiftPlan_MatchingMode] DEFAULT (0),
    [PreferredMatchingProductKey] uniqueidentifier NULL,
    [MaximumMatchAmount] decimal(18, 4) NULL,
    [MaximumMatchPeriod] int NULL,
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [UpdatedOn] datetime NOT NULL,
    [AccessKey] uniqueidentifier NOT NULL,
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedOn] datetime NOT NULL,
    [SystemEntityKey] uniqueidentifier NOT NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[MatchingGiftPlanFundType]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[MatchingGiftPlanFundType] (
    [MatchingGiftPlanFundTypeKey] uniqueidentifier NOT NULL,
    [MatchingGiftPlanKey] uniqueidentifier NOT NULL,
    [FundTypeKey] uniqueidentifier NOT NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[MatchingGiftPlanRelationship]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[MatchingGiftPlanRelationship] (
    [MatchingGiftPlanRelationshipKey] uniqueidentifier NOT NULL,
    [MatchingGiftPlanKey] uniqueidentifier NOT NULL,
    [RelationshipTypeKey] uniqueidentifier NOT NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[MatchingGiftPlanRule]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[MatchingGiftPlanRule] (
    [MatchingGiftPlanRuleKey] uniqueidentifier NOT NULL,
    [MatchingGiftPlanKey] uniqueidentifier NOT NULL,
    [RuleKey] uniqueidentifier NOT NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[MatchingGiftPlanTypeRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[MatchingGiftPlanTypeRef] (
    [MatchingGiftPlanTypeKey] uniqueidentifier NOT NULL,
    [IsActive] bit NOT NULL CONSTRAINT [DF_MatchingGiftPlanTypeRef_IsActive] DEFAULT (1),
    [MatchingGiftPlanDesc] nvarchar(50) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[MatchingModeRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[MatchingModeRef] (
    [MatchingModeCode] int NOT NULL,
    [MatchingModeDesc] nvarchar(300) NOT NULL,
    [MatchingModeName] nvarchar(20) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[MatchingPeriodRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[MatchingPeriodRef] (
    [MatchingPeriodCode] int NOT NULL,
    [MatchingPeriodDesc] nvarchar(300) NOT NULL,
    [MatchingPeriodName] nvarchar(20) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Meet_Hotel]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Meet_Hotel] (
    [MEETING] varchar(10) NOT NULL CONSTRAINT [DF_Meet_Hotel_MEETING] DEFAULT (''),
    [HOTEL_CODE] varchar(15) NOT NULL CONSTRAINT [DF_Meet_Hotel_HOTEL_CODE] DEFAULT (''),
    [ID] varchar(10) NOT NULL CONSTRAINT [DF_Meet_Hotel_ID] DEFAULT (''),
    [COMPANY] varchar(80) NOT NULL CONSTRAINT [DF_Meet_Hotel_COMPANY] DEFAULT (''),
    [ADDRESS_1] varchar(40) NOT NULL CONSTRAINT [DF_Meet_Hotel_ADDRESS_1] DEFAULT (''),
    [ADDRESS_2] varchar(40) NOT NULL CONSTRAINT [DF_Meet_Hotel_ADDRESS_2] DEFAULT (''),
    [CITY] varchar(40) NOT NULL CONSTRAINT [DF_Meet_Hotel_CITY] DEFAULT (''),
    [STATE_PROVINCE] varchar(15) NOT NULL CONSTRAINT [DF_Meet_Hotel_STATE_PROVINCE] DEFAULT (''),
    [ZIP] varchar(10) NOT NULL CONSTRAINT [DF_Meet_Hotel_ZIP] DEFAULT (''),
    [COUNTRY] varchar(25) NOT NULL CONSTRAINT [DF_Meet_Hotel_COUNTRY] DEFAULT (''),
    [PRIMARY_CONTACT] varchar(40) NOT NULL CONSTRAINT [DF_Meet_Hotel_PRIMARY_CONTACT] DEFAULT (''),
    [TITLE] varchar(40) NOT NULL CONSTRAINT [DF_Meet_Hotel_TITLE] DEFAULT (''),
    [PHONE] varchar(20) NOT NULL CONSTRAINT [DF_Meet_Hotel_PHONE] DEFAULT (''),
    [FAX] varchar(20) NOT NULL CONSTRAINT [DF_Meet_Hotel_FAX] DEFAULT (''),
    [TOLL_FREE] varchar(20) NOT NULL CONSTRAINT [DF_Meet_Hotel_TOLL_FREE] DEFAULT (''),
    [COMPANY_SORT] varchar(30) NOT NULL CONSTRAINT [DF_Meet_Hotel_COMPANY_SORT] DEFAULT (''),
    [HOTEL_CLASS] varchar(10) NOT NULL CONSTRAINT [DF_Meet_Hotel_HOTEL_CLASS] DEFAULT (''),
    [NOTES] varchar(255) NOT NULL CONSTRAINT [DF_Meet_Hotel_NOTES] DEFAULT (''),
    [ADDRESS_3] varchar(40) NOT NULL CONSTRAINT [DF_Meet_Hotel_ADDRESS_3] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Meet_Master]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Meet_Master] (
    [MEETING] varchar(10) NOT NULL CONSTRAINT [DF_Meet_Master_MEETING] DEFAULT (''),
    [TITLE] varchar(60) NOT NULL CONSTRAINT [DF_Meet_Master_TITLE] DEFAULT (''),
    [MEETING_TYPE] varchar(5) NOT NULL CONSTRAINT [DF_Meet_Master_MEETING_TYPE] DEFAULT (''),
    [DESCRIPTION] text NULL,
    [BEGIN_DATE] datetime NULL,
    [END_DATE] datetime NULL,
    [STATUS] varchar(1) NOT NULL CONSTRAINT [DF_Meet_Master_STATUS] DEFAULT (''),
    [ADDRESS_1] varchar(50) NOT NULL CONSTRAINT [DF_Meet_Master_ADDRESS_1] DEFAULT (''),
    [ADDRESS_2] varchar(50) NOT NULL CONSTRAINT [DF_Meet_Master_ADDRESS_2] DEFAULT (''),
    [ADDRESS_3] varchar(50) NOT NULL CONSTRAINT [DF_Meet_Master_ADDRESS_3] DEFAULT (''),
    [CITY] varchar(40) NOT NULL CONSTRAINT [DF_Meet_Master_CITY] DEFAULT (''),
    [STATE_PROVINCE] varchar(15) NOT NULL CONSTRAINT [DF_Meet_Master_STATE_PROVINCE] DEFAULT (''),
    [ZIP] varchar(10) NOT NULL CONSTRAINT [DF_Meet_Master_ZIP] DEFAULT (''),
    [COUNTRY] varchar(25) NOT NULL CONSTRAINT [DF_Meet_Master_COUNTRY] DEFAULT (''),
    [DIRECTIONS] text NULL,
    [COORDINATORS] varchar(200) NOT NULL CONSTRAINT [DF_Meet_Master_COORDINATORS] DEFAULT (''),
    [NOTES] text NULL,
    [ALLOW_REG_STRING] text NULL,
    [EARLY_CUTOFF] datetime NULL,
    [REG_CUTOFF] datetime NULL,
    [LATE_CUTOFF] datetime NULL,
    [ORG_CODE] varchar(5) NOT NULL CONSTRAINT [DF_Meet_Master_ORG_CODE] DEFAULT (''),
    [LOGO] image NULL,
    [MAX_REGISTRANTS] int NOT NULL CONSTRAINT [DF_Meet_Master_MAX_REGISTRANTS] DEFAULT (0),
    [TOTAL_REGISTRANTS] int NOT NULL CONSTRAINT [DF_Meet_Master_TOTAL_REGISTRANTS] DEFAULT (0),
    [TOTAL_CANCELATIONS] int NOT NULL CONSTRAINT [DF_Meet_Master_TOTAL_CANCELATIONS] DEFAULT (0),
    [TOTAL_REVENUE] numeric(15, 2) NOT NULL CONSTRAINT [DF_Meet_Master_TOTAL_REVENUE] DEFAULT (0),
    [HEAD_COUNT] int NOT NULL CONSTRAINT [DF_Meet_Master_HEAD_COUNT] DEFAULT (0),
    [TAX_AUTHORITY_1] varchar(20) NOT NULL CONSTRAINT [DF_Meet_Master_TAX_AUTHORITY_1] DEFAULT (''),
    [SUPPRESS_COOR] bit NOT NULL CONSTRAINT [DF_Meet_Master_SUPPRESS_COOR] DEFAULT (0),
    [SUPPRESS_DIR] bit NOT NULL CONSTRAINT [DF_Meet_Master_SUPPRESS_DIR] DEFAULT (0),
    [SUPPRESS_NOTES] bit NOT NULL CONSTRAINT [DF_Meet_Master_SUPPRESS_NOTES] DEFAULT (0),
    [MUF_1] varchar(100) NOT NULL CONSTRAINT [DF_Meet_Master_MUF_1] DEFAULT (''),
    [MUF_2] varchar(100) NOT NULL CONSTRAINT [DF_Meet_Master_MUF_2] DEFAULT (''),
    [MUF_3] varchar(100) NOT NULL CONSTRAINT [DF_Meet_Master_MUF_3] DEFAULT (''),
    [MUF_4] varchar(100) NOT NULL CONSTRAINT [DF_Meet_Master_MUF_4] DEFAULT (''),
    [MUF_5] varchar(100) NOT NULL CONSTRAINT [DF_Meet_Master_MUF_5] DEFAULT (''),
    [MUF_6] varchar(100) NOT NULL CONSTRAINT [DF_Meet_Master_MUF_6] DEFAULT (''),
    [MUF_7] varchar(100) NOT NULL CONSTRAINT [DF_Meet_Master_MUF_7] DEFAULT (''),
    [MUF_8] varchar(100) NOT NULL CONSTRAINT [DF_Meet_Master_MUF_8] DEFAULT (''),
    [MUF_9] varchar(100) NOT NULL CONSTRAINT [DF_Meet_Master_MUF_9] DEFAULT (''),
    [MUF_10] varchar(100) NOT NULL CONSTRAINT [DF_Meet_Master_MUF_10] DEFAULT (''),
    [INTENT_TO_EDIT] varchar(80) NOT NULL CONSTRAINT [DF_Meet_Master_INTENT_TO_EDIT] DEFAULT (''),
    [SUPPRESS_CONFIRM] bit NOT NULL CONSTRAINT [DF_Meet_Master_SUPPRESS_CONFIRM] DEFAULT (0),
    [WEB_VIEW_ONLY] bit NOT NULL CONSTRAINT [DF_Meet_Master_WEB_VIEW_ONLY] DEFAULT (0),
    [WEB_ENABLED] bit NOT NULL CONSTRAINT [DF_Meet_Master_WEB_ENABLED] DEFAULT (0),
    [POST_REGISTRATION] bit NOT NULL CONSTRAINT [DF_Meet_Master_POST_REGISTRATION] DEFAULT (0),
    [EMAIL_REGISTRATION] bit NOT NULL CONSTRAINT [DF_Meet_Master_EMAIL_REGISTRATION] DEFAULT (0),
    [MEETING_URL] varchar(255) NOT NULL CONSTRAINT [DF_Meet_Master_MEETING_URL] DEFAULT (''),
    [MEETING_IMAGE_NAME] varchar(255) NOT NULL CONSTRAINT [DF_Meet_Master_MEETING_IMAGE_NAME] DEFAULT (''),
    [CONTACT_ID] varchar(10) NOT NULL CONSTRAINT [DF_Meet_Master_CONTACT_ID] DEFAULT (''),
    [IS_FR_MEET] tinyint NOT NULL CONSTRAINT [DF_Meet_Master_IS_FR_MEET] DEFAULT (0),
    [MEET_APPEAL] varchar(40) NOT NULL CONSTRAINT [DF_Meet_Master_MEET_APPEAL] DEFAULT (''),
    [MEET_CAMPAIGN] varchar(10) NOT NULL CONSTRAINT [DF_Meet_Master_MEET_CAMPAIGN] DEFAULT (''),
    [MEET_CATEGORY] tinyint NOT NULL CONSTRAINT [DF_Meet_Master_MEET_CATEGORY] DEFAULT (0),
    [COMP_REG_REG_CLASS] varchar(100) NULL,
    [COMP_REG_CALCULATION] text NULL,
    [SQUARE_FOOT_RULES] text NULL,
    [TAX_BY_ADDRESS] bit NOT NULL CONSTRAINT [DF_Meet_Master_TAX_BY_ADDRESS] DEFAULT (0),
    [VAT_RULESET] varchar(10) NOT NULL CONSTRAINT [DF_Meet_Master_VAT_RULESET] DEFAULT (''),
    [REG_CLASS_STORED_PROC] varchar(100) NOT NULL CONSTRAINT [DF_Meet_Master_REG_CLASS_STORED_PROC] DEFAULT (''),
    [WEB_REG_CLASS_METHOD] int NOT NULL CONSTRAINT [DF_Meet_Master_WEB_REG_CLASS_METHOD] DEFAULT (0),
    [REG_OTHERS] bit NOT NULL CONSTRAINT [DF_Meet_Master_REG_OTHERS] DEFAULT (0),
    [ADD_GUESTS] bit NOT NULL CONSTRAINT [DF_Meet_Master_ADD_GUESTS] DEFAULT (0),
    [WEB_DESC] text NULL,
    [ALLOW_REG_EDIT] bit NOT NULL CONSTRAINT [False] DEFAULT (0),
    [REG_EDIT_CUTOFF] datetime NULL,
    [FORM_DEFINITION_ID] varchar(36) NOT NULL CONSTRAINT [DF_Meet_Master_Form_Definition_ID] DEFAULT (''),
    [FORM_DEFINITION_SECTION_ID] varchar(36) NOT NULL CONSTRAINT [DF_Meet_Master_Form_Definition_Section_ID] DEFAULT (''),
    [PUBLISH_START_DATE] datetime NULL,
    [PUBLISH_END_DATE] datetime NULL,
    [REGISTRATION_START_DATE] datetime NULL,
    [REGISTRATION_END_DATE] datetime NULL,
    [REGISTRATION_CLOSED_MESSAGE] varchar(400) NULL,
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Meet_Reg_Class]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Meet_Reg_Class] (
    [REGISTRANT_CLASS] varchar(5) NOT NULL CONSTRAINT [DF_Meet_Reg_Class_REGISTRANT_CLASS] DEFAULT (''),
    [DESCRIPTION] varchar(20) NOT NULL CONSTRAINT [DF_Meet_Reg_Class_DESCRIPTION] DEFAULT (''),
    [LONG_DESCRIPTION] varchar(40) NOT NULL CONSTRAINT [DF_Meet_Reg_Class_LONG_DESCRIPTION] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Meet_Resources]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Meet_Resources] (
    [PRODUCT_CODE] varchar(31) NOT NULL CONSTRAINT [DF_Meet_Resources_PRODUCT_CODE] DEFAULT (''),
    [RESOURCE_TYPE] varchar(10) NOT NULL CONSTRAINT [DF_Meet_Resources_RESOURCE_TYPE] DEFAULT (''),
    [RES_GROUP] varchar(10) NOT NULL CONSTRAINT [DF_Meet_Resources_RES_GROUP] DEFAULT (''),
    [CODE] varchar(10) NOT NULL CONSTRAINT [DF_Meet_Resources_CODE] DEFAULT (''),
    [LINE_NO] int NOT NULL CONSTRAINT [DF_Meet_Resources_LINE_NO] DEFAULT (0),
    [FLD1_QTY] numeric(15, 4) NOT NULL CONSTRAINT [DF_Meet_Resources_FLD1_QTY] DEFAULT (0),
    [FLD1_TIME] datetime NULL,
    [FLD1_CHECK] bit NOT NULL CONSTRAINT [DF_Meet_Resources_FLD1_CHECK] DEFAULT (0),
    [FLD1_ID] varchar(10) NOT NULL CONSTRAINT [DF_Meet_Resources_FLD1_ID] DEFAULT (''),
    [NOTE] text NULL,
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Meet_Std_Resrc]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Meet_Std_Resrc] (
    [RESOURCE_TYPE] varchar(10) NOT NULL CONSTRAINT [DF_Meet_Std_Resrc_RESOURCE_TYPE] DEFAULT (''),
    [RES_GROUP] varchar(10) NOT NULL CONSTRAINT [DF_Meet_Std_Resrc_RES_GROUP] DEFAULT (''),
    [CODE] varchar(10) NOT NULL CONSTRAINT [DF_Meet_Std_Resrc_CODE] DEFAULT (''),
    [TITLE] varchar(40) NOT NULL CONSTRAINT [DF_Meet_Std_Resrc_TITLE] DEFAULT (''),
    [FIELD1_TYPE] tinyint NOT NULL CONSTRAINT [DF_Meet_Std_Resrc_FIELD1_TYPE] DEFAULT (0),
    [FIELD2_TYPE] tinyint NOT NULL CONSTRAINT [DF_Meet_Std_Resrc_FIELD2_TYPE] DEFAULT (0),
    [GROUP_SORT] tinyint NOT NULL CONSTRAINT [DF_Meet_Std_Resrc_GROUP_SORT] DEFAULT (0),
    [ITEM_SORT] int NOT NULL CONSTRAINT [DF_Meet_Std_Resrc_ITEM_SORT] DEFAULT (0),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Mem_Trib_Code]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Mem_Trib_Code] (
    [CODE] varchar(10) NOT NULL CONSTRAINT [DF_Mem_Trib_Code_CODE] DEFAULT (''),
    [DESCRIPTION] varchar(100) NOT NULL CONSTRAINT [DF_Mem_Trib_Code_DESCRIPTION] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Member_Types]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Member_Types] (
    [MEMBER_TYPE] varchar(5) NOT NULL CONSTRAINT [DF_Member_Types_MEMBER_TYPE] DEFAULT (''),
    [DESCRIPTION] varchar(20) NOT NULL CONSTRAINT [DF_Member_Types_DESCRIPTION] DEFAULT (''),
    [MEMBER_RECORD] bit NOT NULL CONSTRAINT [DF_Member_Types_MEMBER_RECORD] DEFAULT (0),
    [COMPANY_RECORD] bit NOT NULL CONSTRAINT [DF_Member_Types_COMPANY_RECORD] DEFAULT (0),
    [DUES_CODE_1] varchar(31) NOT NULL CONSTRAINT [DF_Member_Types_DUES_CODE_1] DEFAULT (''),
    [DUES_CODE_2] varchar(31) NOT NULL CONSTRAINT [DF_Member_Types_DUES_CODE_2] DEFAULT (''),
    [DUES_CODE_3] varchar(31) NOT NULL CONSTRAINT [DF_Member_Types_DUES_CODE_3] DEFAULT (''),
    [DUES_CODE_4] varchar(31) NOT NULL CONSTRAINT [DF_Member_Types_DUES_CODE_4] DEFAULT (''),
    [DUES_CODE_5] varchar(31) NOT NULL CONSTRAINT [DF_Member_Types_DUES_CODE_5] DEFAULT (''),
    [DUES_CODE_6] varchar(31) NOT NULL CONSTRAINT [DF_Member_Types_DUES_CODE_6] DEFAULT (''),
    [DUES_CODE_7] varchar(31) NOT NULL CONSTRAINT [DF_Member_Types_DUES_CODE_7] DEFAULT (''),
    [DUES_CODE_8] varchar(31) NOT NULL CONSTRAINT [DF_Member_Types_DUES_CODE_8] DEFAULT (''),
    [DUES_CODE_9] varchar(31) NOT NULL CONSTRAINT [DF_Member_Types_DUES_CODE_9] DEFAULT (''),
    [DUES_CODE_10] varchar(31) NOT NULL CONSTRAINT [DF_Member_Types_DUES_CODE_10] DEFAULT (''),
    [RATE_1] numeric(15, 2) NOT NULL CONSTRAINT [DF_Member_Types_RATE_1] DEFAULT (0),
    [RATE_2] numeric(15, 2) NOT NULL CONSTRAINT [DF_Member_Types_RATE_2] DEFAULT (0),
    [RATE_3] numeric(15, 2) NOT NULL CONSTRAINT [DF_Member_Types_RATE_3] DEFAULT (0),
    [RATE_4] numeric(15, 2) NOT NULL CONSTRAINT [DF_Member_Types_RATE_4] DEFAULT (0),
    [RATE_5] numeric(15, 2) NOT NULL CONSTRAINT [DF_Member_Types_RATE_5] DEFAULT (0),
    [RATE_6] numeric(15, 2) NOT NULL CONSTRAINT [DF_Member_Types_RATE_6] DEFAULT (0),
    [RATE_7] numeric(15, 2) NOT NULL CONSTRAINT [DF_Member_Types_RATE_7] DEFAULT (0),
    [RATE_8] numeric(15, 2) NOT NULL CONSTRAINT [DF_Member_Types_RATE_8] DEFAULT (0),
    [RATE_9] numeric(15, 2) NOT NULL CONSTRAINT [DF_Member_Types_RATE_9] DEFAULT (0),
    [RATE_10] numeric(15, 2) NOT NULL CONSTRAINT [DF_Member_Types_RATE_10] DEFAULT (0),
    [BILL_COMPANY] bit NOT NULL CONSTRAINT [DF_Member_Types_BILL_COMPANY] DEFAULT (0),
    [SPECIAL_FORM] varchar(43) NOT NULL CONSTRAINT [DF_Member_Types_SPECIAL_FORM] DEFAULT (''),
    [COMP_1] bit NOT NULL CONSTRAINT [DF_Member_Types_COMP_1] DEFAULT (0),
    [COMP_2] bit NOT NULL CONSTRAINT [DF_Member_Types_COMP_2] DEFAULT (0),
    [COMP_3] bit NOT NULL CONSTRAINT [DF_Member_Types_COMP_3] DEFAULT (0),
    [COMP_4] bit NOT NULL CONSTRAINT [DF_Member_Types_COMP_4] DEFAULT (0),
    [COMP_5] bit NOT NULL CONSTRAINT [DF_Member_Types_COMP_5] DEFAULT (0),
    [COMP_6] bit NOT NULL CONSTRAINT [DF_Member_Types_COMP_6] DEFAULT (0),
    [COMP_7] bit NOT NULL CONSTRAINT [DF_Member_Types_COMP_7] DEFAULT (0),
    [COMP_8] bit NOT NULL CONSTRAINT [DF_Member_Types_COMP_8] DEFAULT (0),
    [COMP_9] bit NOT NULL CONSTRAINT [DF_Member_Types_COMP_9] DEFAULT (0),
    [COMP_10] bit NOT NULL CONSTRAINT [DF_Member_Types_COMP_10] DEFAULT (0),
    [DEFAULT_SECURITY_GROUP] varchar(30) NULL,
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[MemorialTribute]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[MemorialTribute] (
    [MemorialTributeKey] uniqueidentifier NOT NULL,
    [FRProductKey] uniqueidentifier NULL,
    [NotificationGroupKey] uniqueidentifier NULL,
    [MemorialTributeCodeKey] uniqueidentifier NOT NULL,
    [Description] nvarchar(200) NULL,
    [UseDefaultDescriptionFlag] bit NOT NULL CONSTRAINT [DF_MemorialTribute_UseDefaultDescriptionFlag] DEFAULT (0),
    [HonoreeContactKey] uniqueidentifier NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[MemorialTributeCodeRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[MemorialTributeCodeRef] (
    [MemorialTributeCodeKey] uniqueidentifier NOT NULL,
    [Code] nvarchar(50) NOT NULL,
    [Description] nvarchar(200) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[MemorialTributeNotificationMember]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[MemorialTributeNotificationMember] (
    [GroupMemberKey] uniqueidentifier NOT NULL,
    [RelationshipKey] uniqueidentifier NULL,
    [MemorialTributeNotificationPreferenceCode] int NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[MethodSetTypeRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[MethodSetTypeRef] (
    [MethodSetTypeCode] smallint NOT NULL,
    [MethodSetTypeDesc] nvarchar(50) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Microsite]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Microsite] (
    [MicrositeID] numeric(18, 0) NULL,
    [HomeNavMenuID] numeric(18, 0) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Name]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Name] (
    [ID] varchar(10) NOT NULL CONSTRAINT [DF_Name_ID] DEFAULT (''),
    [ORG_CODE] varchar(5) NOT NULL CONSTRAINT [DF_Name_ORG_CODE] DEFAULT (''),
    [MEMBER_TYPE] varchar(5) NOT NULL CONSTRAINT [DF_Name_MEMBER_TYPE] DEFAULT (''),
    [CATEGORY] varchar(5) NOT NULL CONSTRAINT [DF_Name_CATEGORY] DEFAULT (''),
    [STATUS] varchar(5) NOT NULL CONSTRAINT [DF_Name_STATUS] DEFAULT (''),
    [MAJOR_KEY] varchar(15) NOT NULL CONSTRAINT [DF_Name_MAJOR_KEY] DEFAULT (''),
    [CO_ID] varchar(10) NOT NULL CONSTRAINT [DF_Name_CO_ID] DEFAULT (''),
    [LAST_FIRST] varchar(70) NOT NULL CONSTRAINT [DF_Name_LAST_FIRST] DEFAULT (''),
    [COMPANY_SORT] varchar(30) NOT NULL CONSTRAINT [DF_Name_COMPANY_SORT] DEFAULT (''),
    [BT_ID] varchar(10) NOT NULL CONSTRAINT [DF_Name_BT_ID] DEFAULT (''),
    [DUP_MATCH_KEY] varchar(20) NOT NULL CONSTRAINT [DF_Name_DUP_MATCH_KEY] DEFAULT (''),
    [FULL_NAME] varchar(70) NOT NULL CONSTRAINT [DF_Name_FULL_NAME] DEFAULT (''),
    [TITLE] varchar(80) NOT NULL CONSTRAINT [DF_Name_TITLE] DEFAULT (''),
    [COMPANY] varchar(80) NOT NULL CONSTRAINT [DF_Name_COMPANY] DEFAULT (''),
    [FULL_ADDRESS] varchar(255) NOT NULL CONSTRAINT [DF_Name_FULL_ADDRESS] DEFAULT (''),
    [PREFIX] varchar(25) NOT NULL CONSTRAINT [DF_Name_PREFIX] DEFAULT (''),
    [FIRST_NAME] varchar(20) NOT NULL CONSTRAINT [DF_Name_FIRST_NAME] DEFAULT (''),
    [MIDDLE_NAME] varchar(20) NOT NULL CONSTRAINT [DF_Name_MIDDLE_NAME] DEFAULT (''),
    [LAST_NAME] varchar(30) NOT NULL CONSTRAINT [DF_Name_LAST_NAME] DEFAULT (''),
    [SUFFIX] varchar(10) NOT NULL CONSTRAINT [DF_Name_SUFFIX] DEFAULT (''),
    [DESIGNATION] varchar(20) NOT NULL CONSTRAINT [DF_Name_DESIGNATION] DEFAULT (''),
    [INFORMAL] varchar(20) NOT NULL CONSTRAINT [DF_Name_INFORMAL] DEFAULT (''),
    [WORK_PHONE] varchar(25) NOT NULL CONSTRAINT [DF_Name_WORK_PHONE] DEFAULT (''),
    [HOME_PHONE] varchar(25) NOT NULL CONSTRAINT [DF_Name_HOME_PHONE] DEFAULT (''),
    [FAX] varchar(25) NOT NULL CONSTRAINT [DF_Name_FAX] DEFAULT (''),
    [TOLL_FREE] varchar(25) NOT NULL CONSTRAINT [DF_Name_TOLL_FREE] DEFAULT (''),
    [CITY] varchar(40) NOT NULL CONSTRAINT [DF_Name_CITY] DEFAULT (''),
    [STATE_PROVINCE] varchar(15) NOT NULL CONSTRAINT [DF_Name_STATE_PROVINCE] DEFAULT (''),
    [ZIP] varchar(10) NOT NULL CONSTRAINT [DF_Name_ZIP] DEFAULT (''),
    [COUNTRY] varchar(25) NOT NULL CONSTRAINT [DF_Name_COUNTRY] DEFAULT (''),
    [MAIL_CODE] varchar(5) NOT NULL CONSTRAINT [DF_Name_MAIL_CODE] DEFAULT (''),
    [CRRT] varchar(40) NOT NULL CONSTRAINT [DF_Name_CRRT] DEFAULT (''),
    [BAR_CODE] varchar(14) NOT NULL CONSTRAINT [DF_Name_BAR_CODE] DEFAULT (''),
    [COUNTY] varchar(30) NOT NULL CONSTRAINT [DF_Name_COUNTY] DEFAULT (''),
    [MAIL_ADDRESS_NUM] int NOT NULL CONSTRAINT [DF_Name_MAIL_ADDRESS_NUM] DEFAULT (0),
    [BILL_ADDRESS_NUM] int NOT NULL CONSTRAINT [DF_Name_BILL_ADDRESS_NUM] DEFAULT (0),
    [GENDER] varchar(1) NOT NULL CONSTRAINT [DF_Name_GENDER] DEFAULT (''),
    [BIRTH_DATE] datetime NULL,
    [US_CONGRESS] varchar(20) NOT NULL CONSTRAINT [DF_Name_US_CONGRESS] DEFAULT (''),
    [STATE_SENATE] varchar(20) NOT NULL CONSTRAINT [DF_Name_STATE_SENATE] DEFAULT (''),
    [STATE_HOUSE] varchar(20) NOT NULL CONSTRAINT [DF_Name_STATE_HOUSE] DEFAULT (''),
    [SIC_CODE] varchar(10) NOT NULL CONSTRAINT [DF_Name_SIC_CODE] DEFAULT (''),
    [CHAPTER] varchar(15) NOT NULL CONSTRAINT [DF_Name_CHAPTER] DEFAULT (''),
    [FUNCTIONAL_TITLE] varchar(50) NOT NULL CONSTRAINT [DF_Name_FUNCTIONAL_TITLE] DEFAULT (''),
    [CONTACT_RANK] int NOT NULL CONSTRAINT [DF_Name_CONTACT_RANK] DEFAULT (0),
    [MEMBER_RECORD] bit NOT NULL CONSTRAINT [DF_Name_MEMBER_RECORD] DEFAULT (0),
    [COMPANY_RECORD] bit NOT NULL CONSTRAINT [DF_Name_COMPANY_RECORD] DEFAULT (0),
    [JOIN_DATE] datetime NULL,
    [SOURCE_CODE] varchar(40) NOT NULL CONSTRAINT [DF_Name_SOURCE_CODE] DEFAULT (''),
    [PAID_THRU] datetime NULL,
    [MEMBER_STATUS] varchar(5) NOT NULL CONSTRAINT [DF_Name_MEMBER_STATUS] DEFAULT (''),
    [MEMBER_STATUS_DATE] datetime NULL,
    [PREVIOUS_MT] varchar(5) NOT NULL CONSTRAINT [DF_Name_PREVIOUS_MT] DEFAULT (''),
    [MT_CHANGE_DATE] datetime NULL,
    [CO_MEMBER_TYPE] varchar(5) NOT NULL CONSTRAINT [DF_Name_CO_MEMBER_TYPE] DEFAULT (''),
    [EXCLUDE_MAIL] bit NOT NULL CONSTRAINT [DF_Name_EXCLUDE_MAIL] DEFAULT (0),
    [EXCLUDE_DIRECTORY] bit NOT NULL CONSTRAINT [DF_Name_EXCLUDE_DIRECTORY] DEFAULT (0),
    [DATE_ADDED] datetime NULL,
    [LAST_UPDATED] datetime NULL,
    [UPDATED_BY] varchar(60) NOT NULL CONSTRAINT [DF_Name_UPDATED_BY] DEFAULT (''),
    [INTENT_TO_EDIT] varchar(80) NOT NULL CONSTRAINT [DF_Name_INTENT_TO_EDIT] DEFAULT (''),
    [ADDRESS_NUM_1] int NOT NULL CONSTRAINT [DF_Name_ADDRESS_NUM_1] DEFAULT (0),
    [ADDRESS_NUM_2] int NOT NULL CONSTRAINT [DF_Name_ADDRESS_NUM_2] DEFAULT (0),
    [ADDRESS_NUM_3] int NOT NULL CONSTRAINT [DF_Name_ADDRESS_NUM_3] DEFAULT (0),
    [EMAIL] varchar(100) NOT NULL CONSTRAINT [DF_Name_EMAIL] DEFAULT (''),
    [WEBSITE] varchar(255) NOT NULL CONSTRAINT [DF_Name_WEBSITE] DEFAULT (''),
    [SHIP_ADDRESS_NUM] int NOT NULL CONSTRAINT [DF_Name_SHIP_ADDRESS_NUM] DEFAULT (0),
    [DISPLAY_CURRENCY] varchar(3) NOT NULL CONSTRAINT [DF_Name_DISPLAY_CURRENCY] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Name_Address]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Name_Address] (
    [ID] varchar(10) NOT NULL CONSTRAINT [DF_Name_Address_ID] DEFAULT (''),
    [ADDRESS_NUM] int NOT NULL CONSTRAINT [DF_Name_Address_ADDRESS_NUM] DEFAULT (0),
    [PURPOSE] varchar(20) NOT NULL CONSTRAINT [DF_Name_Address_PURPOSE] DEFAULT (''),
    [COMPANY] varchar(80) NOT NULL CONSTRAINT [DF_Name_Address_COMPANY] DEFAULT (''),
    [ADDRESS_1] varchar(40) NOT NULL CONSTRAINT [DF_Name_Address_ADDRESS_1] DEFAULT (''),
    [ADDRESS_2] varchar(40) NOT NULL CONSTRAINT [DF_Name_Address_ADDRESS_2] DEFAULT (''),
    [CITY] varchar(40) NOT NULL CONSTRAINT [DF_Name_Address_CITY] DEFAULT (''),
    [STATE_PROVINCE] varchar(15) NOT NULL CONSTRAINT [DF_Name_Address_STATE_PROVINCE] DEFAULT (''),
    [ZIP] varchar(10) NOT NULL CONSTRAINT [DF_Name_Address_ZIP] DEFAULT (''),
    [COUNTRY] varchar(25) NOT NULL CONSTRAINT [DF_Name_Address_COUNTRY] DEFAULT (''),
    [CRRT] varchar(40) NOT NULL CONSTRAINT [DF_Name_Address_CRRT] DEFAULT (''),
    [DPB] varchar(8) NOT NULL CONSTRAINT [DF_Name_Address_DPB] DEFAULT (''),
    [BAR_CODE] varchar(14) NOT NULL CONSTRAINT [DF_Name_Address_BAR_CODE] DEFAULT (''),
    [COUNTRY_CODE] varchar(10) NOT NULL CONSTRAINT [DF_Name_Address_COUNTRY_CODE] DEFAULT (''),
    [ADDRESS_FORMAT] tinyint NOT NULL CONSTRAINT [DF_Name_Address_ADDRESS_FORMAT] DEFAULT (0),
    [FULL_ADDRESS] varchar(255) NOT NULL CONSTRAINT [DF_Name_Address_FULL_ADDRESS] DEFAULT (''),
    [COUNTY] varchar(30) NOT NULL CONSTRAINT [DF_Name_Address_COUNTY] DEFAULT (''),
    [US_CONGRESS] varchar(5) NOT NULL CONSTRAINT [DF_Name_Address_US_CONGRESS] DEFAULT (''),
    [STATE_SENATE] varchar(5) NOT NULL CONSTRAINT [DF_Name_Address_STATE_SENATE] DEFAULT (''),
    [STATE_HOUSE] varchar(5) NOT NULL CONSTRAINT [DF_Name_Address_STATE_HOUSE] DEFAULT (''),
    [MAIL_CODE] varchar(5) NOT NULL CONSTRAINT [DF_Name_Address_MAIL_CODE] DEFAULT (''),
    [PHONE] varchar(25) NOT NULL CONSTRAINT [DF_Name_Address_PHONE] DEFAULT (''),
    [FAX] varchar(25) NOT NULL CONSTRAINT [DF_Name_Address_FAX] DEFAULT (''),
    [TOLL_FREE] varchar(25) NOT NULL CONSTRAINT [DF_Name_Address_TOLL_FREE] DEFAULT (''),
    [COMPANY_SORT] varchar(30) NOT NULL CONSTRAINT [DF_Name_Address_COMPANY_SORT] DEFAULT (''),
    [NOTE] text NULL,
    [STATUS] varchar(5) NOT NULL CONSTRAINT [DF_Name_Address_STATUS] DEFAULT (''),
    [LAST_UPDATED] datetime NULL,
    [LIST_STRING] varchar(255) NOT NULL CONSTRAINT [DF_Name_Address_LIST_STRING] DEFAULT (''),
    [PREFERRED_MAIL] bit NOT NULL CONSTRAINT [DF_Name_Address_PREFERRED_MAIL] DEFAULT (0),
    [PREFERRED_BILL] bit NOT NULL CONSTRAINT [DF_Name_Address_PREFERRED_BILL] DEFAULT (0),
    [LAST_VERIFIED] datetime NULL,
    [EMAIL] varchar(100) NOT NULL CONSTRAINT [DF_Name_Address_EMAIL] DEFAULT (''),
    [BAD_ADDRESS] varchar(10) NOT NULL CONSTRAINT [DF_Name_Address_BAD_ADDRESS] DEFAULT (''),
    [NO_AUTOVERIFY] bit NOT NULL CONSTRAINT [DF_Name_Address_NO_AUTOVERIFY] DEFAULT (0),
    [LAST_QAS_BATCH] datetime NULL,
    [ADDRESS_3] varchar(40) NOT NULL CONSTRAINT [DF_Name_Address_ADDRESS_3] DEFAULT (''),
    [PREFERRED_SHIP] bit NOT NULL CONSTRAINT [DF_Name_Address_PREFERRED_SHIP] DEFAULT (0),
    [INFORMAL] varchar(20) NOT NULL CONSTRAINT [DF_Name_Address_INFORMAL] DEFAULT (''),
    [TITLE] varchar(80) NOT NULL CONSTRAINT [DF_Name_Address_TITLE] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Name_AlternateId]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Name_AlternateId] (
    [ID] varchar(10) NOT NULL,
    [SEQN] int NOT NULL,
    [IdType] varchar(20) NOT NULL,
    [AlternateId] varchar(50) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Name_Annuity]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Name_Annuity] (
    [ID] varchar(10) NOT NULL CONSTRAINT [DF_Name_Annuity_ID] DEFAULT (''),
    [SEQN] int NOT NULL CONSTRAINT [DF_Name_Annuity_SEQN] DEFAULT (0),
    [ANNUITY] varchar(30) NOT NULL CONSTRAINT [DF_Name_Annuity_ANNUITY] DEFAULT (''),
    [ANNUITY_DATE] datetime NULL,
    [CHARITABLE_GIFT_VALUE] float NOT NULL CONSTRAINT [DF_Name_Annuity_CHARITABLE_GIFT_VALUE] DEFAULT (0),
    [SOURCE] varchar(10) NOT NULL CONSTRAINT [DF_Name_Annuity_SOURCE] DEFAULT (''),
    [FUNDED_FLAG] varchar(10) NOT NULL CONSTRAINT [DF_Name_Annuity_FUNDED_FLAG] DEFAULT (''),
    [TYPE_OF_FUNDING] varchar(10) NOT NULL CONSTRAINT [DF_Name_Annuity_TYPE_OF_FUNDING] DEFAULT (''),
    [NUMBER_OF_SHARES] float NOT NULL CONSTRAINT [DF_Name_Annuity_NUMBER_OF_SHARES] DEFAULT (0),
    [STOCK_SYMBOL] varchar(10) NOT NULL CONSTRAINT [DF_Name_Annuity_STOCK_SYMBOL] DEFAULT (''),
    [VALUE_PER_SHARE] varchar(10) NOT NULL CONSTRAINT [DF_Name_Annuity_VALUE_PER_SHARE] DEFAULT (''),
    [COST_BASIS_PER_SHARE] varchar(10) NOT NULL CONSTRAINT [DF_Name_Annuity_COST_BASIS_PER_SHARE] DEFAULT (''),
    [ANNUITY_LIFE] varchar(10) NOT NULL CONSTRAINT [DF_Name_Annuity_ANNUITY_LIFE] DEFAULT (''),
    [GIFT_ANNUITY_RATE] float NOT NULL CONSTRAINT [DF_Name_Annuity_GIFT_ANNUITY_RATE] DEFAULT (0),
    [PAYMENT_FREQUENCY] varchar(10) NOT NULL CONSTRAINT [DF_Name_Annuity_PAYMENT_FREQUENCY] DEFAULT (''),
    [PAYMENT_AMOUNT] varchar(10) NOT NULL CONSTRAINT [DF_Name_Annuity_PAYMENT_AMOUNT] DEFAULT (''),
    [FIRST_PAYMENT_DATE] datetime NULL,
    [PAYMENT_SCHEDULE] varchar(30) NOT NULL CONSTRAINT [DF_Name_Annuity_PAYMENT_SCHEDULE] DEFAULT (''),
    [TAX_TIER] varchar(30) NOT NULL CONSTRAINT [DF_Name_Annuity_TAX_TIER] DEFAULT (''),
    [EXTENDED_NOTES] text NULL,
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Name_Estates]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Name_Estates] (
    [ID] varchar(10) NOT NULL CONSTRAINT [DF_Name_Estates_ID] DEFAULT (''),
    [SEQN] int NOT NULL CONSTRAINT [DF_Name_Estates_SEQN] DEFAULT (0),
    [ESTATE_TYPE] varchar(30) NOT NULL CONSTRAINT [DF_Name_Estates_ESTATE_TYPE] DEFAULT (''),
    [DATE_OF_DEATH] datetime NULL,
    [TOTAL_AMT_EXPECTED] float NOT NULL CONSTRAINT [DF_Name_Estates_TOTAL_AMT_EXPECTED] DEFAULT (0),
    [TOTAL_ESTATE_VALUE] float NOT NULL CONSTRAINT [DF_Name_Estates_TOTAL_ESTATE_VALUE] DEFAULT (0),
    [FORECAST_DATE] datetime NULL,
    [FORECAST_DUE_AMT] float NOT NULL CONSTRAINT [DF_Name_Estates_FORECAST_DUE_AMT] DEFAULT (0),
    [RECEIPT_DATE] datetime NULL,
    [RECEIPT_AMT] float NOT NULL CONSTRAINT [DF_Name_Estates_RECEIPT_AMT] DEFAULT (0),
    [OUTSTANDING_AMT] float NOT NULL CONSTRAINT [DF_Name_Estates_OUTSTANDING_AMT] DEFAULT (0),
    [PROBATE] bit NOT NULL CONSTRAINT [DF_Name_Estates_PROBATE] DEFAULT (0),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Name_Fin]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Name_Fin] (
    [ID] varchar(10) NOT NULL CONSTRAINT [DF_Name_Fin_ID] DEFAULT (''),
    [TAX_EXEMPT] varchar(15) NOT NULL CONSTRAINT [DF_Name_Fin_TAX_EXEMPT] DEFAULT (''),
    [CREDIT_LIMIT] money NOT NULL CONSTRAINT [DF_Name_Fin_CREDIT_LIMIT] DEFAULT (0),
    [NO_STATEMENTS] bit NOT NULL CONSTRAINT [DF_Name_Fin_NO_STATEMENTS] DEFAULT (0),
    [TERMS_CODE] varchar(5) NOT NULL CONSTRAINT [DF_Name_Fin_TERMS_CODE] DEFAULT (''),
    [BACKORDERS] tinyint NOT NULL CONSTRAINT [DF_Name_Fin_BACKORDERS] DEFAULT (0),
    [RENEW_MONTHS] numeric(15, 4) NOT NULL CONSTRAINT [DF_Name_Fin_RENEW_MONTHS] DEFAULT (0),
    [RENEWED_THRU] datetime NULL,
    [BT_ID] varchar(10) NOT NULL CONSTRAINT [DF_Name_Fin_BT_ID] DEFAULT (''),
    [TAX_AUTHOR_DEFAULT] varchar(31) NOT NULL CONSTRAINT [DF_Name_Fin_TAX_AUTHOR_DEFAULT] DEFAULT (''),
    [USE_VAT_TAXATION] bit NOT NULL CONSTRAINT [DF_Name_Fin_USE_VAT_TAXATION] DEFAULT (0),
    [VAT_REG_NUMBER] varchar(20) NOT NULL CONSTRAINT [DF_Name_Fin_VAT_REG_NUMBER] DEFAULT (''),
    [VAT_COUNTRY] varchar(25) NOT NULL CONSTRAINT [DF_Name_Fin_VAT_COUNTRY] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Name_FR]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Name_FR] (
    [ID] varchar(10) NOT NULL CONSTRAINT [DF_Name_FR_ID] DEFAULT (''),
    [SOLICITOR_ID] varchar(10) NOT NULL CONSTRAINT [DF_Name_FR_SOLICITOR_ID] DEFAULT (''),
    [DO_NOT_PHONE] bit NOT NULL CONSTRAINT [DF_Name_FR_DO_NOT_PHONE] DEFAULT (0),
    [DO_NOT_EMAIL] bit NOT NULL CONSTRAINT [DF_Name_FR_DO_NOT_EMAIL] DEFAULT (0),
    [LIST_AS] varchar(255) NOT NULL CONSTRAINT [DF_Name_FR_LIST_AS] DEFAULT (''),
    [MATCH_DESCRIP] varchar(255) NOT NULL CONSTRAINT [DF_Name_FR_MATCH_DESCRIP] DEFAULT (''),
    [MATCH_PCT] tinyint NOT NULL CONSTRAINT [DF_Name_FR_MATCH_PCT] DEFAULT (0),
    [MIN_EMPL_CONTRIB] money NOT NULL CONSTRAINT [DF_Name_FR_MIN_EMPL_CONTRIB] DEFAULT (0),
    [MAX_EMPL_CONTRIB] numeric(15, 2) NOT NULL CONSTRAINT [DF_Name_FR_MAX_EMPL_CONTRIB] DEFAULT (0),
    [VALID_FROM] datetime NULL,
    [VALID_THRU] datetime NULL,
    [PREFERRED_DIST_CODE] varchar(15) NOT NULL CONSTRAINT [DF_Name_FR_PREFERRED_DIST_CODE] DEFAULT (''),
    [Receipt_Interval] tinyint NOT NULL CONSTRAINT [DF_Name_FR_Receipt_Interval] DEFAULT (0),
    [Last_Receipt_Printed_Date] datetime NULL,
    [DO_NOT_SELL] bit NOT NULL CONSTRAINT [DF_Name_FR_DO_NOT_SELL] DEFAULT (0),
    [DO_NOT_SOLICIT] bit NOT NULL CONSTRAINT [DF_Name_FR_DO_NOT_SOLICIT] DEFAULT (0),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Name_FRAdditionalInfo]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Name_FRAdditionalInfo] (
    [ID] varchar(10) NOT NULL,
    [HomeMailOptOut] bit NOT NULL,
    [HomeEMailOptOut] bit NOT NULL,
    [WorkMailOptOut] bit NOT NULL,
    [WorkEMailOptOut] bit NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Name_FREventInformation]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Name_FREventInformation] (
    [ID] varchar(10) NOT NULL,
    [SEQN] int NOT NULL,
    [MEETING] varchar(10) NOT NULL,
    [LocationID] varchar(100) NOT NULL,
    [RegistrationType] varchar(25) NOT NULL,
    [ParticipantGoalOnline] money NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Name_FRSurveyQuestion]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Name_FRSurveyQuestion] (
    [ID] varchar(10) NOT NULL,
    [SEQN] int NOT NULL,
    [MEETING] varchar(10) NOT NULL,
    [QuestionID] varchar(1000) NOT NULL,
    [AnswerID] varchar(1000) NOT NULL,
    [AnswerValue] varchar(6000) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Name_FRTeamInformation]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Name_FRTeamInformation] (
    [ID] varchar(10) NOT NULL,
    [SEQN] int NOT NULL,
    [MEETING] varchar(10) NOT NULL,
    [TeamID] varchar(10) NOT NULL,
    [TeamName] varchar(100) NOT NULL,
    [TeamType] varchar(20) NOT NULL,
    [TeamGoal] money NOT NULL,
    [TeamCaptainAlternateId] varchar(50) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Name_FRTransactionLog]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Name_FRTransactionLog] (
    [ID] varchar(10) NOT NULL,
    [SEQN] int NOT NULL,
    [TransactionID] varchar(25) NOT NULL,
    [TransactionType] varchar(25) NOT NULL,
    [EventID] varchar(100) NOT NULL,
    [ConstituentID] varchar(25) NOT NULL,
    [DateImported] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Name_Indexes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Name_Indexes] (
    [ID] varchar(10) NOT NULL CONSTRAINT [DF_Name_Indexes_ID] DEFAULT (''),
    [INDEX_NAME] varchar(31) NOT NULL CONSTRAINT [DF_Name_Indexes_INDEX_NAME] DEFAULT (''),
    [INDEX_VALUE] varchar(30) NOT NULL CONSTRAINT [DF_Name_Indexes_INDEX_VALUE] DEFAULT (''),
    [QUANTITY] int NOT NULL CONSTRAINT [DF_Name_Indexes_QUANTITY] DEFAULT (0),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Name_Log]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Name_Log] (
    [DATE_TIME] datetime NOT NULL,
    [LOG_TYPE] varchar(10) NOT NULL CONSTRAINT [DF_Name_Log_LOG_TYPE] DEFAULT (''),
    [SUB_TYPE] varchar(10) NOT NULL CONSTRAINT [DF_Name_Log_SUB_TYPE] DEFAULT (''),
    [USER_ID] varchar(60) NOT NULL CONSTRAINT [DF_Name_Log_USER_ID] DEFAULT (''),
    [ID] varchar(10) NOT NULL CONSTRAINT [DF_Name_Log_ID] DEFAULT (''),
    [LOG_TEXT] varchar(8000) NOT NULL CONSTRAINT [DF_Name_Log_LOG_TEXT] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Name_MatchPlan]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Name_MatchPlan] (
    [SEQN] int NOT NULL CONSTRAINT [DF_Name_MatchPlan_SEQN] DEFAULT (0),
    [ID] varchar(10) NOT NULL CONSTRAINT [DF_Name_MatchPlan_ID] DEFAULT (''),
    [FROM_AMOUNT] numeric(15, 2) NOT NULL CONSTRAINT [DF_Name_MatchPlan_FROM_AMOUNT] DEFAULT (0),
    [TO_AMOUNT] numeric(15, 2) NOT NULL CONSTRAINT [DF_Name_MatchPlan_TO_AMOUNT] DEFAULT (0),
    [FROM_DATE] datetime NULL,
    [TO_DATE] datetime NULL,
    [PERCENTAGE] numeric(15, 2) NOT NULL CONSTRAINT [DF_Name_MatchPlan_PERCENTAGE] DEFAULT (0),
    [FORM_NUMBER] varchar(40) NOT NULL CONSTRAINT [DF_Name_MatchPlan_FORM_NUMBER] DEFAULT (''),
    [NOTES] varchar(255) NOT NULL CONSTRAINT [DF_Name_MatchPlan_NOTES] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Name_Note]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Name_Note] (
    [ID] varchar(10) NOT NULL CONSTRAINT [DF_Name_Note_ID] DEFAULT (''),
    [NOTE_NUM] int NOT NULL CONSTRAINT [DF_Name_Note_NOTE_NUM] DEFAULT (0),
    [PURPOSE] varchar(20) NULL,
    [NOTE] text NULL,
    [DATE_ADDED] datetime NULL,
    [LAST_UPDATED] datetime NULL,
    [UPDATED_BY] varchar(60) NULL,
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Name_Notify]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Name_Notify] (
    [ID] varchar(10) NOT NULL CONSTRAINT [DF_Name_Notify_ID] DEFAULT (''),
    [NOTIFY_ID] varchar(10) NOT NULL CONSTRAINT [DF_Name_Notify_NOTIFY_ID] DEFAULT (''),
    [MEM_TRIBUTE_CODE] varchar(10) NOT NULL CONSTRAINT [DF_Name_Notify_MEM_TRIBUTE_CODE] DEFAULT (''),
    [RELATIONSHIP] varchar(10) NOT NULL CONSTRAINT [DF_Name_Notify_RELATIONSHIP] DEFAULT (''),
    [MERGE_CODE] varchar(40) NOT NULL CONSTRAINT [DF_Name_Notify_MERGE_CODE] DEFAULT (''),
    [SALUTATION_CODE] varchar(40) NOT NULL CONSTRAINT [DF_Name_Notify_SALUTATION_CODE] DEFAULT (''),
    [SENDER_CODE] varchar(40) NOT NULL CONSTRAINT [DF_Name_Notify_SENDER_CODE] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Name_Picture]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Name_Picture] (
    [ID] varchar(10) NOT NULL CONSTRAINT [DF_Name_Picture_ID] DEFAULT (''),
    [PICTURE_NUM] int NOT NULL CONSTRAINT [DF_Name_Picture_PICTURE_NUM] DEFAULT (0),
    [PURPOSE] varchar(20) NULL,
    [PICTURE_LOGO] image NULL,
    [DESCRIPTION] varchar(255) NULL,
    [DATE_ADDED] datetime NULL,
    [LAST_UPDATED] datetime NULL,
    [UPDATED_BY] varchar(60) NULL,
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Name_PL_Pref]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Name_PL_Pref] (
    [NAME_ID] varchar(10) NOT NULL CONSTRAINT [DF_Name_PL_Pref_NAME_ID] DEFAULT (''),
    [PLP_CODE] varchar(6) NOT NULL CONSTRAINT [DF_Name_PL_Pref_PLP_CODE] DEFAULT (''),
    [ADDR_PREF_IND] tinyint NOT NULL CONSTRAINT [DF_Name_PL_Pref_ADDR_PREF_IND] DEFAULT (0),
    [NA_ADDRESS_NUM] int NOT NULL CONSTRAINT [DF_Name_PL_Pref_NA_ADDRESS_NUM] DEFAULT (0),
    [SUPPRESS_NAME] bit NOT NULL CONSTRAINT [DF_Name_PL_Pref_SUPPRESS_NAME] DEFAULT (0),
    [SUPPRESS_LABEL] bit NOT NULL CONSTRAINT [DF_Name_PL_Pref_SUPPRESS_LABEL] DEFAULT (0),
    [SALUTATION_CODE] varchar(40) NOT NULL CONSTRAINT [DF_Name_PL_Pref_SALUTATION_CODE] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Name_PlannedGiving]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Name_PlannedGiving] (
    [ID] varchar(10) NOT NULL CONSTRAINT [DF_Name_PlannedGiving_ID] DEFAULT (''),
    [SEQN] int NOT NULL CONSTRAINT [DF_Name_PlannedGiving_SEQN] DEFAULT (0),
    [PG_Date_Notified] datetime NULL,
    [PG_Status] varchar(20) NOT NULL CONSTRAINT [DF_Name_PlannedGiving_PG_Status] DEFAULT (''),
    [PG_Gift_Vehicle] varchar(50) NOT NULL CONSTRAINT [DF_Name_PlannedGiving_PG_Gift_Vehicle] DEFAULT (''),
    [PG_Outright] varchar(50) NOT NULL CONSTRAINT [DF_Name_PlannedGiving_PG_Outright] DEFAULT (''),
    [PG_Future_Value] money NOT NULL CONSTRAINT [DF_Name_PlannedGiving_PG_Future_Value] DEFAULT (0),
    [PG_Source_Code] varchar(50) NOT NULL CONSTRAINT [DF_Name_PlannedGiving_PG_Source_Code] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Name_Research]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Name_Research] (
    [ID] varchar(10) NOT NULL CONSTRAINT [DF_Name_Research_ID] DEFAULT (''),
    [ETHNICITY] varchar(10) NOT NULL CONSTRAINT [DF_Name_Research_ETHNICITY] DEFAULT (''),
    [EDUC_LEVEL] varchar(10) NOT NULL CONSTRAINT [DF_Name_Research_EDUC_LEVEL] DEFAULT (''),
    [MARITAL_STATUS] varchar(10) NOT NULL CONSTRAINT [DF_Name_Research_MARITAL_STATUS] DEFAULT (''),
    [PRIMARY_DOCTOR] varchar(10) NOT NULL CONSTRAINT [DF_Name_Research_PRIMARY_DOCTOR] DEFAULT (''),
    [PRIMARY_INCOME] varchar(10) NOT NULL CONSTRAINT [DF_Name_Research_PRIMARY_INCOME] DEFAULT (''),
    [NUM_SUPPORTED] varchar(10) NOT NULL CONSTRAINT [DF_Name_Research_NUM_SUPPORTED] DEFAULT (''),
    [HEALTH_BENEFIT] varchar(10) NOT NULL CONSTRAINT [DF_Name_Research_HEALTH_BENEFIT] DEFAULT (''),
    [LOST_BENEFIT] varchar(10) NOT NULL CONSTRAINT [DF_Name_Research_LOST_BENEFIT] DEFAULT (''),
    [REFERRED_VOCREHAB] bit NOT NULL CONSTRAINT [DF_Name_Research_REFERRED_VOCREHAB] DEFAULT (0),
    [LIVING_SITUATION] varchar(100) NOT NULL CONSTRAINT [DF_Name_Research_LIVING_SITUATION] DEFAULT (''),
    [PRIMARY_LANGUAGE] varchar(10) NOT NULL CONSTRAINT [DF_Name_Research_PRIMARY_LANGUAGE] DEFAULT (''),
    [TOTAL_INCOME] varchar(10) NOT NULL CONSTRAINT [DF_Name_Research_TOTAL_INCOME] DEFAULT (''),
    [FIRST_CONTACT] datetime NULL,
    [DIAGNOSIS_DATE] datetime NULL,
    [SYMPTOM_ONSET] datetime NULL,
    [FAMILY_HISTORY] bit NOT NULL CONSTRAINT [DF_Name_Research_FAMILY_HISTORY] DEFAULT (0),
    [DIAGNOSIS_MADE_BY] varchar(25) NOT NULL CONSTRAINT [DF_Name_Research_DIAGNOSIS_MADE_BY] DEFAULT (''),
    [SECONDARY_MEDICAL] varchar(255) NOT NULL CONSTRAINT [DF_Name_Research_SECONDARY_MEDICAL] DEFAULT (''),
    [NUMBER_EMPLOYEES] int NOT NULL CONSTRAINT [DF_Name_Research_NUMBER_EMPLOYEES] DEFAULT (0),
    [EARNED_ASSETS] money NOT NULL CONSTRAINT [DF_Name_Research_EARNED_ASSETS] DEFAULT (0),
    [RESEARCH_NOTES] text NULL,
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Name_Salutation]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Name_Salutation] (
    [ID] varchar(10) NOT NULL CONSTRAINT [DF_Name_Salutation_ID] DEFAULT (''),
    [SALUTATION_TYPE] varchar(60) NOT NULL CONSTRAINT [DF_Name_Salutation_SALUTATION_TYPE] DEFAULT (''),
    [SALUTATION_TEXT] varchar(255) NOT NULL CONSTRAINT [DF_Name_Salutation_SALUTATION_TEXT] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Name_Security]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Name_Security] (
    [ID] varchar(10) NOT NULL CONSTRAINT [DF_Name_Security_ID] DEFAULT (''),
    [LOGIN_DISABLED] bit NOT NULL CONSTRAINT [DF_Name_Security_LOGIN_DISABLED] DEFAULT (0),
    [WEB_LOGIN] varchar(60) NOT NULL CONSTRAINT [DF_Name_Security_WEB_LOGIN] DEFAULT (''),
    [PASSWORD] varchar(100) NOT NULL CONSTRAINT [DF_Name_Security_PASSWORD] DEFAULT (''),
    [EXPIRATION_DATE] datetime NULL,
    [LAST_LOGIN] datetime NULL,
    [PREVIOUS_LOGIN] datetime NULL,
    [ContactID] int IDENTITY(1,1) NOT NULL,
    [UPDATED_BY] varchar(60) NOT NULL CONSTRAINT [DF_Name_Security_UPDATED_BY] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Name_Security_Groups]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Name_Security_Groups] (
    [ID] varchar(10) NOT NULL CONSTRAINT [DF_Name_Security_Groups_ID] DEFAULT (''),
    [SECURITY_GROUP] varchar(30) NOT NULL CONSTRAINT [DF_Name_Security_Groups_SECURITY_GROUP] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Name_Staff]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Name_Staff] (
    [ID] varchar(10) NOT NULL CONSTRAINT [DF_Name_Staff_ID] DEFAULT (''),
    [IS_VOLUNTEER] bit NOT NULL CONSTRAINT [DF_Name_Staff_IS_VOLUNTEER] DEFAULT (0),
    [IS_SALESMAN] bit NOT NULL CONSTRAINT [DF_Name_Staff_IS_SALESMAN] DEFAULT (0),
    [HOURS_PER_WEEK] numeric(15, 1) NOT NULL CONSTRAINT [DF_Name_Staff_HOURS_PER_WEEK] DEFAULT (0),
    [DESCRIPTION] varchar(255) NOT NULL CONSTRAINT [DF_Name_Staff_DESCRIPTION] DEFAULT (''),
    [TITLE] varchar(60) NULL,
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Nav_Menu]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Nav_Menu] (
    [NavMenuID] numeric(18, 0) IDENTITY(1,1) NOT NULL,
    [WorkflowStatusCode] char(1) NULL,
    [PublishedDateTime] datetime NULL,
    [HideFlag] char(1) NULL,
    [NavContentGroupInd] char(1) NULL,
    [Name] varchar(255) NOT NULL,
    [ReminderSentDateTime] datetime NULL,
    [Title] varchar(255) NULL,
    [ParentNavMenuID] numeric(18, 0) NULL,
    [AncestorNavMenuID] numeric(18, 0) NULL,
    [CategoryDepth] numeric(18, 0) NULL,
    [SortOrder] numeric(28, 18) NOT NULL,
    [SecureFlag] char(1) NULL,
    [TemplatePath] varchar(255) NULL,
    [ContentAuthorityGroupID] numeric(18, 0) NULL,
    [AuthoritySetManuallyFlag] char(1) NULL,
    [ContentID] numeric(18, 0) NULL,
    [DirectListComboInd] char(1) NULL,
    [ComponentCode] char(2) NULL,
    [ComponentScriptCode] char(2) NULL,
    [ComponentParameters] varchar(100) NULL,
    [ComponentParameterList] varchar(500) NULL,
    [OwnerContactID] numeric(18, 0) NULL,
    [OwnerSetManuallyFlag] char(1) NULL,
    [ExpirationDays] numeric(18, 0) NULL,
    [ExpirationDate] datetime NULL,
    [ExpSetManuallyFlag] char(1) NULL,
    [LastUpdatedByContactID] numeric(18, 0) NULL,
    [MembersOnlyFlag] char(1) NULL,
    [ShowInTopFlag] char(1) NULL,
    [ShowInSideFlag] char(1) NULL,
    [PublishedFlag] char(1) NULL,
    [MicrositeFlag] char(1) NULL,
    [DirectoryName] varchar(255) NULL,
    [WebsiteKey] uniqueidentifier NULL,
    [PreFuseURL] varchar(255) NULL,
    [PostFuseURL] varchar(255) NULL,
    [PublishedDirectory] varchar(255) NULL,
    [PublishedDefaultFileName] varchar(255) NULL,
    [FilePath] varchar(255) NULL,
    [AncestoryList] varchar(255) NULL,
    [DescendantCount] int NOT NULL CONSTRAINT [DF_Nav_Menu_DescendantCount] DEFAULT (0),
    [PreviousWebsiteKey] uniqueidentifier NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Nav_Menu_Feature]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Nav_Menu_Feature] (
    [NavMenuID] numeric(18, 0) NOT NULL,
    [ImageInitial] varchar(255) NULL,
    [ImageOther] varchar(255) NULL,
    [ImageRollover] varchar(255) NULL,
    [BreadCrumb] varchar(30) NULL,
    [ImageWidth] numeric(18, 0) NULL,
    [ImageHeight] numeric(18, 0) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Nav_Menu_Security_Group]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Nav_Menu_Security_Group] (
    [NavMenuID] numeric(18, 0) NOT NULL,
    [SecurityGroupCode] varchar(20) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Nav_Menu_Setup_Log]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Nav_Menu_Setup_Log] (
    [AncestorNavMenuID] numeric(18, 0) NOT NULL,
    [NavMenuID] numeric(18, 0) NOT NULL,
    [Name] varchar(255) NULL,
    [Title] varchar(255) NULL,
    [ParentNavMenuID] numeric(18, 0) NULL,
    [CategoryDepth] numeric(18, 0) NULL,
    [MembersOnlyFlag] char(1) NULL,
    [PostFuseURL] varchar(255) NULL,
    [FilePath] varchar(255) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Nav_Menu_Website]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Nav_Menu_Website] (
    [NavMenuID] numeric(18, 0) NOT NULL,
    [WebsiteKey] uniqueidentifier NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Nav_Menu_Workflow_Log]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Nav_Menu_Workflow_Log] (
    [NavMenuID] numeric(18, 0) NOT NULL,
    [WorkflowStatusCode] char(1) NOT NULL,
    [ContactID] numeric(18, 0) NOT NULL,
    [ChangeDateTime] datetime NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[NavigationExport]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[NavigationExport] (
    [NavigationKey] uniqueidentifier NOT NULL,
    [NavigationStatusCode] nvarchar(2) NOT NULL,
    [NavigationTitle] nvarchar(200) NOT NULL,
    [NavigationName] nvarchar(100) NOT NULL,
    [NavigationDescription] nvarchar(300) NULL,
    [NavigationAttributes] text NULL,
    [BreadCrumbName] nvarchar(100) NULL,
    [OverrideContentTitle] nvarchar(255) NULL,
    [NavigationPane] int NOT NULL,
    [OpenInNewWindowFlag] bit NOT NULL CONSTRAINT [DF_NavigationExport_OpenInNewWindowFlag] DEFAULT (0),
    [WorkflowDocumentKey] uniqueidentifier NULL,
    [IsHidden] bit NOT NULL CONSTRAINT [DF_NavigationExport_IsHidden] DEFAULT (0),
    [PublishedDateTime] datetime NULL,
    [PrePublishURL] nvarchar(1024) NULL,
    [PostPublishURL] nvarchar(1024) NULL,
    [PublishedDirectory] nvarchar(255) NULL,
    [ParameterList] nvarchar(500) NULL,
    [NavigationCode] nvarchar(100) NULL,
    [ContentKey] uniqueidentifier NULL,
    [IsActive] bit NOT NULL CONSTRAINT [DF_NavigationExport_IsActive] DEFAULT (1),
    [IsHTTPS] bit NOT NULL CONSTRAINT [DF_NavigationExport_IsHTTPS] DEFAULT (0),
    [AddKeyToURLFlag] bit NOT NULL CONSTRAINT [DF_NavigationExport_AddKeyToURLFlag] DEFAULT (1),
    [IsExpandedByDefault] bit NOT NULL,
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedOn] datetime NOT NULL,
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [UpdatedOn] datetime NOT NULL CONSTRAINT [DF_NavigationExport_UpdatedOn] DEFAULT (getdate())
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[NavigationLegacySecurityRolesExport]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[NavigationLegacySecurityRolesExport] (
    [NavigationKey] uniqueidentifier NOT NULL,
    [RoleName] nvarchar(50) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[NavigationMain]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[NavigationMain] (
    [NavigationKey] uniqueidentifier NOT NULL,
    [OrganizationKey] uniqueidentifier NOT NULL,
    [Marker] nvarchar(100) NOT NULL CONSTRAINT [DF_NavigationMain_Marker] DEFAULT (''),
    [PageSet] nvarchar(50) NOT NULL CONSTRAINT [DF_NavigationMain_PageSet] DEFAULT (''),
    [URL] nvarchar(500) NOT NULL CONSTRAINT [DF_NavigationMain_URL] DEFAULT (''),
    [AccessAreaKey] uniqueidentifier NOT NULL,
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedOn] datetime NOT NULL CONSTRAINT [DF_NavigationMain_CreatedOn] DEFAULT (getdate()),
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [UpdatedOn] datetime NOT NULL CONSTRAINT [DF_NavigationMain_UpdatedOn] DEFAULT (getdate())
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[NavigationPaneRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[NavigationPaneRef] (
    [NavigationPaneCode] int NOT NULL,
    [NavigationPaneName] nvarchar(100) NOT NULL,
    [StaticDisplayLevels] int NOT NULL,
    [DynamicDisplayLevels] int NOT NULL,
    [StartingLevel] int NOT NULL,
    [HighlightTopAncestorFlag] bit NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[NavigationSecurityGroupsExport]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[NavigationSecurityGroupsExport] (
    [NavigationKey] uniqueidentifier NOT NULL,
    [GroupKey] uniqueidentifier NOT NULL,
    [GroupName] nvarchar(65) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[NavigationSecurityRolesExport]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[NavigationSecurityRolesExport] (
    [NavigationKey] uniqueidentifier NOT NULL,
    [RoleKey] uniqueidentifier NOT NULL,
    [RoleName] nvarchar(50) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[NavigationWorkflowParameters]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[NavigationWorkflowParameters] (
    [DocumentVersionKey] uniqueidentifier NOT NULL,
    [RemoveAfterDays] int NOT NULL,
    [NotifyContactKey] uniqueidentifier NOT NULL,
    [FirstWarningSentOn] datetime NULL,
    [SecondWarningSentOn] datetime NULL,
    [FirstNotificationSentOn] datetime NULL,
    [SecondNotificationSentOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Note]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Note] (
    [NoteKey] uniqueidentifier NOT NULL,
    [NoteText] ntext NOT NULL,
    [NotePurposeKey] uniqueidentifier NOT NULL,
    [CreatedOn] datetime NOT NULL CONSTRAINT [DF_Note_CreatedOn] DEFAULT (getdate()),
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [UpdatedOn] datetime NOT NULL CONSTRAINT [DF_Note_UpdatedOn] DEFAULT (getdate()),
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [NoteForUniformKey] uniqueidentifier NOT NULL,
    [AccessKey] uniqueidentifier NOT NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[NotePurposeRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[NotePurposeRef] (
    [NotePurposeKey] uniqueidentifier NOT NULL,
    [NotePurposeDesc] nvarchar(30) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[ObjectMetaData]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ObjectMetaData] (
    [ObjectName] nvarchar(128) NOT NULL,
    [RelatedToEntity] nvarchar(128) NOT NULL,
    [IsUserDefined] bit NOT NULL,
    [IsMultiInstance] bit NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[OfferedCustomerExperience]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[OfferedCustomerExperience] (
    [OfferedCustomerExperienceKey] uniqueidentifier NOT NULL,
    [OfferingKey] uniqueidentifier NOT NULL,
    [OfferedCustomerExperienceGrade] nvarchar(50) NULL,
    [OfferedCustomerExperienceGradeKey] uniqueidentifier NULL,
    [OfferedCustomerExperienceDate] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Offering]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Offering] (
    [OfferingKey] uniqueidentifier NOT NULL,
    [ExperienceDefinitionKey] uniqueidentifier NOT NULL,
    [OfferingName] nvarchar(50) NOT NULL,
    [OfferingCode] nvarchar(50) NOT NULL,
    [OfferingDesc] nvarchar(250) NULL,
    [ContactKey] uniqueidentifier NULL,
    [LocationKey] uniqueidentifier NULL,
    [OfferingDate] datetime NULL,
    [UpdatedOn] datetime NOT NULL,
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedOn] datetime NOT NULL,
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [MarkedForDeleteOn] datetime NULL,
    [OfferingStatusCode] nchar(2) NULL,
    [AllowChangesFlag] bit NOT NULL CONSTRAINT [DF_Offering_AllowChangesFlag] DEFAULT ('0'),
    [LinkedProgramKey] uniqueidentifier NULL,
    [LinkedItemCode] varchar(50) NULL,
    [OfferingType] tinyint NOT NULL CONSTRAINT [DF_Offering_OfferingType] DEFAULT (0),
    [PurchaseMarksCompletionFlag] bit NOT NULL CONSTRAINT [DF_Offering_PurchaseMarksCompletionFlag] DEFAULT ('0')
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[OfferingStatusRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[OfferingStatusRef] (
    [OfferingStatusCode] nchar(2) NOT NULL,
    [OfferingStatusName] nvarchar(100) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[OpportunityClassRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[OpportunityClassRef] (
    [OpportunityClassCode] nvarchar(20) NOT NULL,
    [OpportunityClassDesc] nvarchar(50) NOT NULL,
    [OpportunityClassName] nvarchar(20) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[OpportunityCompetitor]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[OpportunityCompetitor] (
    [OpportunityCompetitorKey] uniqueidentifier NOT NULL CONSTRAINT [DF_OpportunityCompetitor_OpportunityCompetitorKey] DEFAULT (newid()),
    [OpportunityKey] uniqueidentifier NOT NULL,
    [CompetitorContactKey] uniqueidentifier NULL,
    [DemoGivenFlag] bit NOT NULL CONSTRAINT [DF_OpportunityCompetitor_DemoGivenFlag] DEFAULT (0),
    [CompetitorWonOpportunityFlag] bit NOT NULL CONSTRAINT [DF_OpportunityCompetitor_CompetitorWonOpportunityFlag] DEFAULT (0),
    [Notes] ntext NULL,
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedOn] datetime NOT NULL,
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [UpdatedOn] datetime NOT NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[OpportunityDefaultStatusRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[OpportunityDefaultStatusRef] (
    [OpportunityDefaultStatusCode] nvarchar(20) NOT NULL,
    [OpportunityDefaultStatusDesc] nvarchar(50) NOT NULL,
    [OpportunityDefaultStatusName] nvarchar(20) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[OpportunityHistory]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[OpportunityHistory] (
    [OpportunityHistoryKey] uniqueidentifier NOT NULL CONSTRAINT [DF_OpportunityHistory_OpportunityHistoryKey] DEFAULT (newid()),
    [OpportunityKey] uniqueidentifier NOT NULL,
    [PropertyName] nvarchar(50) NOT NULL,
    [OriginalValue] nvarchar(250) NULL,
    [CurrentValue] nvarchar(250) NULL,
    [Notes] nvarchar(250) NULL,
    [UpdatedOn] datetime NOT NULL,
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedOn] datetime NOT NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[OpportunityMain]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[OpportunityMain] (
    [OpportunityKey] uniqueidentifier NOT NULL CONSTRAINT [DF_OpportunityMain_OpportunityKey] DEFAULT (newid()),
    [OpportunityTypeKey] uniqueidentifier NOT NULL,
    [Id] int NOT NULL CONSTRAINT [DF_OpportunityMain_Id] DEFAULT (1),
    [Description] nvarchar(200) NOT NULL,
    [OpportunityOwnerGroupKey] uniqueidentifier NOT NULL,
    [OpportunityContactGroupKey] uniqueidentifier NOT NULL,
    [ProspectKey] uniqueidentifier NOT NULL,
    [CurrentActionPlanStageName] nvarchar(200) NULL CONSTRAINT [DF_OpportunityMain_CurrentActionPlanStageName] DEFAULT (''),
    [WinProbability] decimal(12, 2) NOT NULL CONSTRAINT [DF_OpportunityMain_WinProbability] DEFAULT (0),
    [ActionManifest] ntext NULL,
    [OpportunityStatusCode] int NOT NULL,
    [SourceCodeKey] uniqueidentifier NULL,
    [ExpirationDate] datetime NULL,
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [UpdatedOn] datetime NOT NULL,
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedOn] datetime NOT NULL,
    [SystemEntityKey] uniqueidentifier NOT NULL,
    [AccessKey] uniqueidentifier NOT NULL,
    [MarkedForDeleteOn] datetime NULL,
    [ProductKey] uniqueidentifier NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[OpportunityMainDonor]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[OpportunityMainDonor] (
    [OpportunityKey] uniqueidentifier NOT NULL,
    [Distribution] nvarchar(50) NOT NULL,
    [DecisionDate] datetime NULL,
    [TimingProbability] decimal(12, 4) NOT NULL CONSTRAINT [DF_OpportunityMainDonor_TimingProbability] DEFAULT (0),
    [Potential] decimal(18, 4) NOT NULL,
    [Actual] decimal(18, 4) NOT NULL,
    [Quality] nvarchar(50) NOT NULL,
    [ResponseMedia] nvarchar(50) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[OpportunityMainMember]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[OpportunityMainMember] (
    [OpportunityKey] uniqueidentifier NOT NULL,
    [Subscription] nvarchar(50) NOT NULL,
    [DecisionDate] datetime NULL,
    [TimingProbability] decimal(12, 4) NOT NULL CONSTRAINT [DF_OpportunityMainMember_TimingProbability] DEFAULT (0),
    [Units] int NOT NULL,
    [Potential] decimal(18, 4) NOT NULL,
    [Actual] decimal(18, 4) NOT NULL,
    [Quality] nvarchar(50) NOT NULL,
    [ResponseMedia] nvarchar(50) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[OpportunityMainSales]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[OpportunityMainSales] (
    [OpportunityKey] uniqueidentifier NOT NULL,
    [Product] nvarchar(50) NOT NULL,
    [DecisionDate] datetime NULL,
    [TimingProbability] decimal(12, 4) NOT NULL CONSTRAINT [DF_OpportunityMainSales_TimingProbability] DEFAULT (0),
    [Units] int NOT NULL,
    [PotentialSales] decimal(18, 4) NOT NULL,
    [ActualSales] decimal(18, 4) NOT NULL,
    [Quality] nvarchar(50) NOT NULL,
    [ResponseMedia] nvarchar(50) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[OpportunityStatusRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[OpportunityStatusRef] (
    [OpportunityStatusCode] int NOT NULL,
    [OpportunityStatusDesc] nvarchar(50) NOT NULL,
    [OpportunityStatusName] nvarchar(20) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[OpportunityType]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[OpportunityType] (
    [OpportunityTypeKey] uniqueidentifier NOT NULL CONSTRAINT [DF_OpportunityType_OpportunityTypeKey] DEFAULT (newid()),
    [OpportunityClass] nvarchar(50) NOT NULL,
    [Name] nvarchar(50) NOT NULL,
    [Description] nvarchar(200) NULL,
    [DefaultActionPlanKey] uniqueidentifier NULL,
    [DefaultOwnerKey] uniqueidentifier NULL,
    [DefaultStatus] nvarchar(20) NULL,
    [AllowCompetitorsFlag] bit NOT NULL CONSTRAINT [DF_OpportunityType_AllowCompetitorsFlag] DEFAULT (0),
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [UpdatedOn] datetime NOT NULL,
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedOn] datetime NOT NULL,
    [SystemEntityKey] uniqueidentifier NOT NULL,
    [AccessKey] uniqueidentifier NOT NULL,
    [MarkedForDeleteOn] datetime NULL,
    [OwnerGroupTypeKey] uniqueidentifier NOT NULL,
    [ContactGroupTypeKey] uniqueidentifier NOT NULL,
    [OpportunityCreationGroupKey] uniqueidentifier NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Order_Badge]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Order_Badge] (
    [ORDER_NUMBER] numeric(15, 2) NOT NULL CONSTRAINT [DF_Order_Badge_ORDER_NUMBER] DEFAULT (0),
    [BADGE_NUMBER] int NOT NULL CONSTRAINT [DF_Order_Badge_BADGE_NUMBER] DEFAULT (0),
    [BADGE_TYPE] varchar(10) NOT NULL CONSTRAINT [DF_Order_Badge_BADGE_TYPE] DEFAULT (''),
    [FULL_NAME] varchar(70) NOT NULL CONSTRAINT [DF_Order_Badge_FULL_NAME] DEFAULT (''),
    [TITLE] varchar(80) NOT NULL CONSTRAINT [DF_Order_Badge_TITLE] DEFAULT (''),
    [COMPANY] varchar(80) NOT NULL CONSTRAINT [DF_Order_Badge_COMPANY] DEFAULT (''),
    [FULL_ADDRESS] varchar(255) NOT NULL CONSTRAINT [DF_Order_Badge_FULL_ADDRESS] DEFAULT (''),
    [PREFIX] varchar(25) NOT NULL CONSTRAINT [DF_Order_Badge_PREFIX] DEFAULT (''),
    [FIRST_NAME] varchar(20) NOT NULL CONSTRAINT [DF_Order_Badge_FIRST_NAME] DEFAULT (''),
    [MIDDLE_NAME] varchar(20) NOT NULL CONSTRAINT [DF_Order_Badge_MIDDLE_NAME] DEFAULT (''),
    [LAST_NAME] varchar(30) NOT NULL CONSTRAINT [DF_Order_Badge_LAST_NAME] DEFAULT (''),
    [SUFFIX] varchar(10) NOT NULL CONSTRAINT [DF_Order_Badge_SUFFIX] DEFAULT (''),
    [DESIGNATION] varchar(20) NOT NULL CONSTRAINT [DF_Order_Badge_DESIGNATION] DEFAULT (''),
    [INFORMAL] varchar(20) NOT NULL CONSTRAINT [DF_Order_Badge_INFORMAL] DEFAULT (''),
    [ADDRESS_1] varchar(40) NOT NULL CONSTRAINT [DF_Order_Badge_ADDRESS_1] DEFAULT (''),
    [ADDRESS_2] varchar(40) NOT NULL CONSTRAINT [DF_Order_Badge_ADDRESS_2] DEFAULT (''),
    [CITY] varchar(40) NOT NULL CONSTRAINT [DF_Order_Badge_CITY] DEFAULT (''),
    [STATE_PROVINCE] varchar(15) NOT NULL CONSTRAINT [DF_Order_Badge_STATE_PROVINCE] DEFAULT (''),
    [ZIP] varchar(10) NOT NULL CONSTRAINT [DF_Order_Badge_ZIP] DEFAULT (''),
    [COUNTRY] varchar(25) NOT NULL CONSTRAINT [DF_Order_Badge_COUNTRY] DEFAULT (''),
    [BAR_CODE] varchar(14) NOT NULL CONSTRAINT [DF_Order_Badge_BAR_CODE] DEFAULT (''),
    [DELEGATE] varchar(10) NULL,
    [ST_PRINT_COMPANY] bit NOT NULL CONSTRAINT [DF_Order_Badge_ST_PRINT_COMPANY] DEFAULT (0),
    [ST_PRINT_TITLE] bit NOT NULL CONSTRAINT [DF_Order_Badge_ST_PRINT_TITLE] DEFAULT (0),
    [ADDRESS_3] varchar(40) NOT NULL CONSTRAINT [DF_Order_Badge_ADDRESS_3] DEFAULT (''),
    [ADDRESS_NUM] int NOT NULL CONSTRAINT [DF_Order_Badge_ADDRESS_NUM] DEFAULT (0),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Order_Lines]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Order_Lines] (
    [ORDER_NUMBER] numeric(15, 2) NOT NULL CONSTRAINT [DF_Order_Lines_ORDER_NUMBER] DEFAULT (0),
    [LINE_NUMBER] numeric(15, 2) NOT NULL CONSTRAINT [DF_Order_Lines_LINE_NUMBER] DEFAULT (0),
    [PRODUCT_CODE] varchar(31) NOT NULL CONSTRAINT [DF_Order_Lines_PRODUCT_CODE] DEFAULT (''),
    [LOCATION] varchar(10) NOT NULL CONSTRAINT [DF_Order_Lines_LOCATION] DEFAULT (''),
    [LOT_SERIAL] varchar(20) NOT NULL CONSTRAINT [DF_Order_Lines_LOT_SERIAL] DEFAULT (''),
    [DESCRIPTION] varchar(255) NOT NULL CONSTRAINT [DF_Order_Lines_DESCRIPTION] DEFAULT (''),
    [QUANTITY_ORDERED] numeric(15, 6) NOT NULL CONSTRAINT [DF_Order_Lines_QUANTITY_ORDERED] DEFAULT (0),
    [QUANTITY_SHIPPED] numeric(15, 6) NOT NULL CONSTRAINT [DF_Order_Lines_QUANTITY_SHIPPED] DEFAULT (0),
    [QUANTITY_BACKORDERED] numeric(15, 6) NOT NULL CONSTRAINT [DF_Order_Lines_QUANTITY_BACKORDERED] DEFAULT (0),
    [QUANTITY_RESERVED] numeric(15, 6) NOT NULL CONSTRAINT [DF_Order_Lines_QUANTITY_RESERVED] DEFAULT (0),
    [QUANTITY_COMMITTED] numeric(15, 6) NOT NULL CONSTRAINT [DF_Order_Lines_QUANTITY_COMMITTED] DEFAULT (0),
    [NUMBER_DAYS] int NOT NULL CONSTRAINT [DF_Order_Lines_NUMBER_DAYS] DEFAULT (0),
    [TAXABLE] bit NOT NULL CONSTRAINT [DF_Order_Lines_TAXABLE] DEFAULT (0),
    [TAXABLE_2] bit NOT NULL CONSTRAINT [DF_Order_Lines_TAXABLE_2] DEFAULT (0),
    [UNIT_PRICE] money NOT NULL CONSTRAINT [DF_Order_Lines_UNIT_PRICE] DEFAULT (0),
    [UNIT_COST] money NOT NULL CONSTRAINT [DF_Order_Lines_UNIT_COST] DEFAULT (0),
    [UNDISCOUNTED_PRICE] money NOT NULL CONSTRAINT [DF_Order_Lines_UNDISCOUNTED_PRICE] DEFAULT (0),
    [EXTENDED_AMOUNT] money NOT NULL CONSTRAINT [DF_Order_Lines_EXTENDED_AMOUNT] DEFAULT (0),
    [EXTENDED_COST] money NOT NULL CONSTRAINT [DF_Order_Lines_EXTENDED_COST] DEFAULT (0),
    [UNDISCOUNTED_EXTENDED_AMOUNT] money NOT NULL CONSTRAINT [DF_Order_Lines_UNDISCOUNTED_EXTENDED_AMOUNT] DEFAULT (0),
    [CANCEL_CODE] varchar(10) NOT NULL CONSTRAINT [DF_Order_Lines_CANCEL_CODE] DEFAULT (''),
    [CANCEL_QUANTITY] numeric(15, 6) NOT NULL CONSTRAINT [DF_Order_Lines_CANCEL_QUANTITY] DEFAULT (0),
    [COMMISSION_RATE] numeric(15, 4) NOT NULL CONSTRAINT [DF_Order_Lines_COMMISSION_RATE] DEFAULT (0),
    [COMMISSION_AMOUNT] money NOT NULL CONSTRAINT [DF_Order_Lines_COMMISSION_AMOUNT] DEFAULT (0),
    [CEU_TYPE] varchar(15) NOT NULL CONSTRAINT [DF_Order_Lines_CEU_TYPE] DEFAULT (''),
    [CEU_AWARDED] numeric(15, 2) NOT NULL CONSTRAINT [DF_Order_Lines_CEU_AWARDED] DEFAULT (0),
    [PASS_FAIL] varchar(5) NOT NULL CONSTRAINT [DF_Order_Lines_PASS_FAIL] DEFAULT (''),
    [DATE_CONFIRMED] datetime NULL,
    [TICKETS_PRINTED] int NOT NULL CONSTRAINT [DF_Order_Lines_TICKETS_PRINTED] DEFAULT (0),
    [BOOTH_NUMBERS] varchar(255) NOT NULL CONSTRAINT [DF_Order_Lines_BOOTH_NUMBERS] DEFAULT (''),
    [NOTE] varchar(255) NULL,
    [INCOME_ACCOUNT] varchar(50) NOT NULL CONSTRAINT [DF_Order_Lines_INCOME_ACCOUNT] DEFAULT (''),
    [UNIT_WEIGHT] numeric(15, 2) NOT NULL CONSTRAINT [DF_Order_Lines_UNIT_WEIGHT] DEFAULT (0),
    [EXTENDED_WEIGHT] numeric(15, 2) NOT NULL CONSTRAINT [DF_Order_Lines_EXTENDED_WEIGHT] DEFAULT (0),
    [PST_TAXABLE] bit NOT NULL CONSTRAINT [DF_Order_Lines_PST_TAXABLE] DEFAULT (0),
    [IS_GST_TAXABLE] bit NOT NULL CONSTRAINT [DF_Order_Lines_IS_GST_TAXABLE] DEFAULT (0),
    [ADDED_TO_WAIT_LIST] datetime NULL,
    [BIN] varchar(10) NOT NULL CONSTRAINT [DF_Order_Lines_BIN] DEFAULT (''),
    [TAX_AUTHORITY] varchar(15) NOT NULL CONSTRAINT [DF_Order_Lines_TAX_AUTHORITY] DEFAULT (''),
    [TAX_RATE] numeric(15, 4) NOT NULL CONSTRAINT [DF_Order_Lines_TAX_RATE] DEFAULT (0),
    [TAX_1] numeric(15, 4) NOT NULL CONSTRAINT [DF_Order_Lines_TAX_1] DEFAULT (0),
    [KIT_ITEM_TYPE] tinyint NOT NULL CONSTRAINT [DF_Order_Lines_KIT_ITEM_TYPE] DEFAULT (0),
    [DISCOUNT] numeric(15, 2) NOT NULL CONSTRAINT [DF_Order_Lines_DISCOUNT] DEFAULT (0),
    [UF_1] varchar(30) NOT NULL CONSTRAINT [DF_Order_Lines_UF_1] DEFAULT (''),
    [UF_2] varchar(30) NOT NULL CONSTRAINT [DF_Order_Lines_UF_2] DEFAULT (''),
    [UF_3] varchar(30) NOT NULL CONSTRAINT [DF_Order_Lines_UF_3] DEFAULT (''),
    [UF_4] varchar(30) NOT NULL CONSTRAINT [DF_Order_Lines_UF_4] DEFAULT (''),
    [EXTENDED_SQUARE_FEET] numeric(15, 2) NOT NULL CONSTRAINT [DF_Order_Lines_EXTENDED_SQUARE_FEET] DEFAULT (0),
    [SQUARE_FEET] numeric(15, 2) NOT NULL CONSTRAINT [DF_Order_Lines_SQUARE_FEET] DEFAULT (0),
    [MEET_APPEAL] varchar(40) NOT NULL CONSTRAINT [DF_Order_Lines_MEET_APPEAL] DEFAULT (''),
    [MEET_CAMPAIGN] varchar(10) NOT NULL CONSTRAINT [DF_Order_Lines_MEET_CAMPAIGN] DEFAULT (''),
    [FAIR_MARKET_VALUE] numeric(15, 2) NOT NULL CONSTRAINT [DF_Order_Lines_FAIR_MARKET_VALUE] DEFAULT (0),
    [ORG_CODE] varchar(5) NOT NULL CONSTRAINT [DF_Order_Lines_ORG_CODE] DEFAULT (''),
    [IS_FR_ITEM] bit NOT NULL CONSTRAINT [DF_Order_Lines_IS_FR_ITEM] DEFAULT (0),
    [MANUAL_PRICE] numeric(15, 2) NOT NULL CONSTRAINT [DF_Order_Lines_MANUAL_PRICE] DEFAULT (0),
    [IS_MANUAL_PRICE] bit NOT NULL CONSTRAINT [DF_Order_Lines_IS_MANUAL_PRICE] DEFAULT (0),
    [UNIT_TAX_AMOUNT] numeric(15, 4) NOT NULL CONSTRAINT [DF_Order_Lines_UNIT_TAX_AMOUNT] DEFAULT (0),
    [PRICE_FROM_COMPONENTS] bit NOT NULL CONSTRAINT [DF_Order_Lines_PRICE_FROM_COMPONENTS] DEFAULT (0),
    [QUANTITY_PER_KIT] numeric(15, 6) NOT NULL CONSTRAINT [DF_Order_Lines_QUANTITY_PER_KIT] DEFAULT (0),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Order_Meet]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Order_Meet] (
    [ORDER_NUMBER] numeric(15, 2) NOT NULL CONSTRAINT [DF_Order_Meet_ORDER_NUMBER] DEFAULT (0),
    [MEETING] varchar(10) NOT NULL CONSTRAINT [DF_Order_Meet_MEETING] DEFAULT (''),
    [REGISTRANT_CLASS] varchar(5) NOT NULL CONSTRAINT [DF_Order_Meet_REGISTRANT_CLASS] DEFAULT (''),
    [ARRIVAL] datetime NULL,
    [DEPARTURE] datetime NULL,
    [HOTEL] varchar(40) NOT NULL CONSTRAINT [DF_Order_Meet_HOTEL] DEFAULT (''),
    [LODGING_INSTRUCTIONS] varchar(255) NOT NULL CONSTRAINT [DF_Order_Meet_LODGING_INSTRUCTIONS] DEFAULT (''),
    [BOOTH] varchar(255) NOT NULL CONSTRAINT [DF_Order_Meet_BOOTH] DEFAULT (''),
    [GUEST_FIRST] varchar(20) NOT NULL CONSTRAINT [DF_Order_Meet_GUEST_FIRST] DEFAULT (''),
    [GUEST_MIDDLE] varchar(20) NOT NULL CONSTRAINT [DF_Order_Meet_GUEST_MIDDLE] DEFAULT (''),
    [GUEST_LAST] varchar(30) NOT NULL CONSTRAINT [DF_Order_Meet_GUEST_LAST] DEFAULT (''),
    [GUEST_IS_SPOUSE] bit NOT NULL CONSTRAINT [DF_Order_Meet_GUEST_IS_SPOUSE] DEFAULT (0),
    [ADDITIONAL_BADGES] text NULL,
    [DELEGATE] varchar(10) NOT NULL CONSTRAINT [DF_Order_Meet_DELEGATE] DEFAULT (''),
    [UF_1] bit NOT NULL CONSTRAINT [DF_Order_Meet_UF_1] DEFAULT (0),
    [UF_2] bit NOT NULL CONSTRAINT [DF_Order_Meet_UF_2] DEFAULT (0),
    [UF_3] bit NOT NULL CONSTRAINT [DF_Order_Meet_UF_3] DEFAULT (0),
    [UF_4] bit NOT NULL CONSTRAINT [DF_Order_Meet_UF_4] DEFAULT (0),
    [UF_5] bit NOT NULL CONSTRAINT [DF_Order_Meet_UF_5] DEFAULT (0),
    [UF_6] varchar(100) NOT NULL CONSTRAINT [DF_Order_Meet_UF_6] DEFAULT (''),
    [UF_7] varchar(100) NOT NULL CONSTRAINT [DF_Order_Meet_UF_7] DEFAULT (''),
    [UF_8] varchar(100) NOT NULL CONSTRAINT [DF_Order_Meet_UF_8] DEFAULT (''),
    [SHARE_STATUS] int NOT NULL CONSTRAINT [DF_Order_Meet_SHARE_STATUS] DEFAULT (0),
    [SHARE_ORDER_NUMBER] numeric(15, 2) NOT NULL CONSTRAINT [DF_Order_Meet_SHARE_ORDER_NUMBER] DEFAULT (0),
    [ROOM_TYPE] varchar(8) NOT NULL CONSTRAINT [DF_Order_Meet_ROOM_TYPE] DEFAULT (''),
    [ROOM_QUANTITY] int NOT NULL CONSTRAINT [DF_Order_Meet_ROOM_QUANTITY] DEFAULT (0),
    [ROOM_CONFIRM] bit NOT NULL CONSTRAINT [DF_Order_Meet_ROOM_CONFIRM] DEFAULT (0),
    [UF_9] text NULL,
    [UF_10] text NULL,
    [ARRIVAL_TIME] datetime NULL,
    [DEPARTURE_TIME] datetime NULL,
    [COMP_REGISTRATIONS] int NOT NULL CONSTRAINT [DF_Order_Meet_COMP_REGISTRATIONS] DEFAULT (0),
    [COMP_REG_SOURCE] decimal(15, 6) NULL,
    [TOTAL_SQUARE_FEET] numeric(15, 2) NOT NULL CONSTRAINT [DF_Order_Meet_TOTAL_SQUARE_FEET] DEFAULT (0),
    [COMP_REGISTRATIONS_USED] int NOT NULL CONSTRAINT [DF_Order_Meet_COMP_REGISTRATIONS_USED] DEFAULT (0),
    [PARENT_ORDER_NUMBER] numeric(15, 2) NULL,
    [REGISTERED_BY_ID] varchar(10) NULL,
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Order_Payments]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Order_Payments] (
    [ORDER_NUMBER] numeric(15, 2) NOT NULL CONSTRAINT [DF_Order_Payments_ORDER_NUMBER] DEFAULT (0),
    [PAYMENT_NUMBER] numeric(15, 2) NOT NULL CONSTRAINT [DF_Order_Payments_PAYMENT_NUMBER] DEFAULT (0),
    [ENCRYPT_PAY_NUMBER] varchar(100) NOT NULL CONSTRAINT [DF_Order_Payments_ENCRYPT_PAY_NUMBER] DEFAULT (''),
    [PAY_TYPE] varchar(10) NOT NULL CONSTRAINT [DF_Order_Payments_PAY_TYPE] DEFAULT (''),
    [PAY_NUMBER] varchar(25) NOT NULL CONSTRAINT [DF_Order_Payments_PAY_NUMBER] DEFAULT (''),
    [CREDIT_CARD_EXPIRES] varchar(10) NOT NULL CONSTRAINT [DF_Order_Payments_CREDIT_CARD_EXPIRES] DEFAULT (''),
    [AUTHORIZE] varchar(10) NOT NULL CONSTRAINT [DF_Order_Payments_AUTHORIZE] DEFAULT (''),
    [CREDIT_CARD_NAME] varchar(30) NOT NULL CONSTRAINT [DF_Order_Payments_CREDIT_CARD_NAME] DEFAULT (''),
    [PAY_AMOUNT] numeric(15, 2) NOT NULL CONSTRAINT [DF_Order_Payments_PAY_AMOUNT] DEFAULT (0),
    [CASH_GL_ACCT] varchar(30) NOT NULL CONSTRAINT [DF_Order_Payments_CASH_GL_ACCT] DEFAULT (''),
    [ENCRYPT_CREDIT_CARD_EXPIRES] varchar(100) NOT NULL CONSTRAINT [DF_Order_Payments_ENCRYPT_CREDIT_CARD_EXPIRES] DEFAULT (''),
    [ENCRYPT_CSC] varchar(100) NOT NULL CONSTRAINT [DF_Order_Payments_ENCRYPT_CSC] DEFAULT (''),
    [ISSUE_DATE] varchar(10) NOT NULL CONSTRAINT [DF_Order_Payments_ISSUE_DATE] DEFAULT (''),
    [ISSUE_NUMBER] varchar(2) NOT NULL CONSTRAINT [DF_Order_Payments_ISSUE_NUMBER] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Order_Type]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Order_Type] (
    [CODE] varchar(10) NOT NULL CONSTRAINT [DF_Order_Type_CODE] DEFAULT (''),
    [DESCRIPTION] varchar(20) NOT NULL CONSTRAINT [DF_Order_Type_DESCRIPTION] DEFAULT (''),
    [INVOICE_DESCRIPTION] varchar(20) NOT NULL CONSTRAINT [DF_Order_Type_INVOICE_DESCRIPTION] DEFAULT (''),
    [TYPE_OF_ORDER] tinyint NOT NULL CONSTRAINT [DF_Order_Type_TYPE_OF_ORDER] DEFAULT (0),
    [AFFECT_INVENTORY] bit NOT NULL CONSTRAINT [DF_Order_Type_AFFECT_INVENTORY] DEFAULT (0),
    [SHIPPING_PAPER_ACTION] tinyint NOT NULL CONSTRAINT [DF_Order_Type_SHIPPING_PAPER_ACTION] DEFAULT (0),
    [INVOICE_ACTION] bit NOT NULL CONSTRAINT [DF_Order_Type_INVOICE_ACTION] DEFAULT (0),
    [CONVERSION_CODE] varchar(10) NOT NULL CONSTRAINT [DF_Order_Type_CONVERSION_CODE] DEFAULT (''),
    [PRINTQUOTE_STAGE] bit NOT NULL CONSTRAINT [DF_Order_Type_PRINTQUOTE_STAGE] DEFAULT (0),
    [PICKLIST_STAGE] bit NOT NULL CONSTRAINT [DF_Order_Type_PICKLIST_STAGE] DEFAULT (0),
    [SHIPPAPER_STAGE] bit NOT NULL CONSTRAINT [DF_Order_Type_SHIPPAPER_STAGE] DEFAULT (0),
    [INVOICE_STAGE] bit NOT NULL CONSTRAINT [DF_Order_Type_INVOICE_STAGE] DEFAULT (0),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[OrderAnswer]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[OrderAnswer] (
    [OrderNumber] float NOT NULL,
    [QuestionID] int NOT NULL,
    [Answer] varchar(512) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[OrderCategory]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[OrderCategory] (
    [OrderCategoryID] int IDENTITY(1,1) NOT NULL,
    [Title] varchar(64) NOT NULL,
    [Description] varchar(1024) NULL,
    [Active] bit NOT NULL,
    [Header] varchar(512) NULL,
    [Footer] varchar(512) NULL,
    [Image] varchar(1024) NULL,
    [SecurityKey] varchar(64) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[OrderCategoryParentLookup]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[OrderCategoryParentLookup] (
    [OrderCategoryID] int NOT NULL,
    [OrderCategoryParentID] int NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[OrderCheckout]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[OrderCheckout] (
    [OrderCheckoutID] int IDENTITY(1,1) NOT NULL,
    [UserID] varchar(64) NOT NULL,
    [Name] varchar(70) NULL,
    [AddressPurpose] varchar(20) NULL,
    [Address1] varchar(40) NULL,
    [Address2] varchar(40) NULL,
    [Address3] varchar(40) NULL,
    [City] varchar(40) NULL,
    [StateProvince] varchar(15) NULL,
    [PostalCode] varchar(10) NULL,
    [Country] varchar(25) NULL,
    [CreditCardType] varchar(10) NULL,
    [CreditCardNumber] varchar(100) NULL,
    [CreditCardExpiration] varchar(24) NULL,
    [CreditCardAuthCode] varchar(24) NULL,
    [CreditCardName] varchar(40) NULL,
    [CreditCardAddress] varchar(40) NULL,
    [CreditCardAddress2] varchar(40) NULL,
    [CreditCardAddress3] varchar(40) NULL,
    [CreditCardCity] varchar(40) NULL,
    [CreditCardState] varchar(15) NULL,
    [CreditCardPostalCode] varchar(10) NULL,
    [CreditCardCountry] varchar(25) NULL,
    [ISSUE_DATE] varchar(10) NULL,
    [ISSUE_NUMBER] varchar(2) NULL,
    [ReadyForCheckout] bit NULL,
    [ShipMethod] varchar(10) NULL,
    [PurchaseOrder] varchar(128) NULL,
    [Email] varchar(100) NULL,
    [MemberType] varchar(5) NULL,
    [BillingCategory] varchar(60) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[OrderFulfillmentStatusRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[OrderFulfillmentStatusRef] (
    [OrderFulfillmentStatusCode] int NOT NULL,
    [OrderFulfillmentStatusDesc] nvarchar(50) NOT NULL,
    [OrderFulfillmentStatusName] nvarchar(20) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[OrderPickLine]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[OrderPickLine] (
    [OrderPickLineKey] uniqueidentifier NOT NULL,
    [OrderFulfillmentLineKey] uniqueidentifier NOT NULL,
    [ProductInventoryKey] uniqueidentifier NOT NULL,
    [QuantityPicked] numeric(18, 8) NOT NULL CONSTRAINT [DF_OrderPickLine_QuantityPicked] DEFAULT (0)
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[OrderProduct]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[OrderProduct] (
    [OrderProductID] int IDENTITY(1,1) NOT NULL,
    [Title] varchar(60) NULL,
    [Description] varchar(1024) NULL,
    [IsSuperProduct] bit NOT NULL,
    [ProductCode] varchar(31) NULL,
    [SellOnWeb] int NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[OrderProductCategoryLookup]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[OrderProductCategoryLookup] (
    [OrderProductID] int NOT NULL,
    [OrderCategoryID] int NOT NULL,
    [IsFeatured] bit NOT NULL,
    [SortOrder] int NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[OrderProductCrossSellLookup]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[OrderProductCrossSellLookup] (
    [OrderProductID] int NOT NULL,
    [CrossSellOrderProductID] int NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[OrderPromotion]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[OrderPromotion] (
    [OrderPromotionKey] uniqueidentifier NOT NULL,
    [OrderPromotionCode] nvarchar(50) NOT NULL,
    [OrderPromotionName] nvarchar(50) NOT NULL,
    [OrderPromotionDesc] nvarchar(200) NULL,
    [BeginDate] datetime NULL,
    [EndDate] datetime NULL,
    [RuleType] nvarchar(50) NOT NULL,
    [Adjustment] decimal(18, 4) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[OrderPromotionDiscount]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[OrderPromotionDiscount] (
    [OrderPromotionDiscountKey] uniqueidentifier NOT NULL,
    [OrderPromotionKey] uniqueidentifier NOT NULL,
    [Code] varchar(31) NOT NULL,
    [IsPercent] bit NOT NULL,
    [AdjustmentAmount] decimal(18, 4) NOT NULL,
    [ItemType] varchar(1) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Orders]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Orders] (
    [ORDER_NUMBER] numeric(15, 2) NOT NULL CONSTRAINT [DF_Orders_ORDER_NUMBER] DEFAULT (0),
    [ORG_CODE] varchar(5) NOT NULL CONSTRAINT [DF_Orders_ORG_CODE] DEFAULT (''),
    [ORDER_TYPE_CODE] varchar(10) NOT NULL CONSTRAINT [DF_Orders_ORDER_TYPE_CODE] DEFAULT (''),
    [STAGE] varchar(10) NOT NULL CONSTRAINT [DF_Orders_STAGE] DEFAULT (''),
    [SOURCE_SYSTEM] varchar(10) NOT NULL CONSTRAINT [DF_Orders_SOURCE_SYSTEM] DEFAULT (''),
    [BATCH_NUM] varchar(15) NOT NULL CONSTRAINT [DF_Orders_BATCH_NUM] DEFAULT (''),
    [STATUS] varchar(10) NOT NULL CONSTRAINT [DF_Orders_STATUS] DEFAULT (''),
    [HOLD_CODE] varchar(10) NOT NULL CONSTRAINT [DF_Orders_HOLD_CODE] DEFAULT (''),
    [ORDER_DATE] datetime NULL,
    [BT_ID] varchar(10) NOT NULL CONSTRAINT [DF_Orders_BT_ID] DEFAULT (''),
    [ST_ID] varchar(10) NOT NULL CONSTRAINT [DF_Orders_ST_ID] DEFAULT (''),
    [ST_ADDRESS_NUM] int NOT NULL CONSTRAINT [DF_Orders_ST_ADDRESS_NUM] DEFAULT (0),
    [ENTERED_DATE_TIME] datetime NULL,
    [ENTERED_BY] varchar(60) NOT NULL CONSTRAINT [DF_Orders_ENTERED_BY] DEFAULT (''),
    [UPDATED_DATE_TIME] datetime NULL,
    [UPDATED_BY] varchar(60) NOT NULL CONSTRAINT [DF_Orders_UPDATED_BY] DEFAULT (''),
    [INVOICE_REFERENCE_NUM] int NOT NULL CONSTRAINT [DF_Orders_INVOICE_REFERENCE_NUM] DEFAULT (0),
    [INVOICE_NUMBER] int NOT NULL CONSTRAINT [DF_Orders_INVOICE_NUMBER] DEFAULT (0),
    [INVOICE_DATE] datetime NULL,
    [NUMBER_LINES] int NOT NULL CONSTRAINT [DF_Orders_NUMBER_LINES] DEFAULT (0),
    [FULL_NAME] varchar(70) NOT NULL CONSTRAINT [DF_Orders_FULL_NAME] DEFAULT (''),
    [TITLE] varchar(80) NOT NULL CONSTRAINT [DF_Orders_TITLE] DEFAULT (''),
    [COMPANY] varchar(80) NOT NULL CONSTRAINT [DF_Orders_COMPANY] DEFAULT (''),
    [FULL_ADDRESS] varchar(255) NOT NULL CONSTRAINT [DF_Orders_FULL_ADDRESS] DEFAULT (''),
    [PREFIX] varchar(25) NOT NULL CONSTRAINT [DF_Orders_PREFIX] DEFAULT (''),
    [FIRST_NAME] varchar(20) NOT NULL CONSTRAINT [DF_Orders_FIRST_NAME] DEFAULT (''),
    [MIDDLE_NAME] varchar(20) NOT NULL CONSTRAINT [DF_Orders_MIDDLE_NAME] DEFAULT (''),
    [LAST_NAME] varchar(30) NOT NULL CONSTRAINT [DF_Orders_LAST_NAME] DEFAULT (''),
    [SUFFIX] varchar(10) NOT NULL CONSTRAINT [DF_Orders_SUFFIX] DEFAULT (''),
    [DESIGNATION] varchar(30) NOT NULL CONSTRAINT [DF_Orders_DESIGNATION] DEFAULT (''),
    [INFORMAL] varchar(20) NOT NULL CONSTRAINT [DF_Orders_INFORMAL] DEFAULT (''),
    [LAST_FIRST] varchar(30) NOT NULL CONSTRAINT [DF_Orders_LAST_FIRST] DEFAULT (''),
    [COMPANY_SORT] varchar(30) NOT NULL CONSTRAINT [DF_Orders_COMPANY_SORT] DEFAULT (''),
    [ADDRESS_1] varchar(40) NOT NULL CONSTRAINT [DF_Orders_ADDRESS_1] DEFAULT (''),
    [ADDRESS_2] varchar(40) NOT NULL CONSTRAINT [DF_Orders_ADDRESS_2] DEFAULT (''),
    [CITY] varchar(40) NOT NULL CONSTRAINT [DF_Orders_CITY] DEFAULT (''),
    [STATE_PROVINCE] varchar(15) NOT NULL CONSTRAINT [DF_Orders_STATE_PROVINCE] DEFAULT (''),
    [ZIP] varchar(10) NOT NULL CONSTRAINT [DF_Orders_ZIP] DEFAULT (''),
    [COUNTRY] varchar(25) NOT NULL CONSTRAINT [DF_Orders_COUNTRY] DEFAULT (''),
    [DPB] varchar(8) NOT NULL CONSTRAINT [DF_Orders_DPB] DEFAULT (''),
    [BAR_CODE] varchar(14) NOT NULL CONSTRAINT [DF_Orders_BAR_CODE] DEFAULT (''),
    [ADDRESS_FORMAT] tinyint NOT NULL CONSTRAINT [DF_Orders_ADDRESS_FORMAT] DEFAULT (0),
    [PHONE] varchar(25) NOT NULL CONSTRAINT [DF_Orders_PHONE] DEFAULT (''),
    [FAX] varchar(25) NOT NULL CONSTRAINT [DF_Orders_FAX] DEFAULT (''),
    [NOTES] text NULL,
    [TOTAL_CHARGES] money NOT NULL CONSTRAINT [DF_Orders_TOTAL_CHARGES] DEFAULT (0),
    [TOTAL_PAYMENTS] money NOT NULL CONSTRAINT [DF_Orders_TOTAL_PAYMENTS] DEFAULT (0),
    [BALANCE] money NOT NULL CONSTRAINT [DF_Orders_BALANCE] DEFAULT (0),
    [LINE_TOTAL] money NOT NULL CONSTRAINT [DF_Orders_LINE_TOTAL] DEFAULT (0),
    [LINE_TAXABLE] money NOT NULL CONSTRAINT [DF_Orders_LINE_TAXABLE] DEFAULT (0),
    [FREIGHT_1] money NOT NULL CONSTRAINT [DF_Orders_FREIGHT_1] DEFAULT (0),
    [FREIGHT_2] money NOT NULL CONSTRAINT [DF_Orders_FREIGHT_2] DEFAULT (0),
    [HANDLING_1] money NOT NULL CONSTRAINT [DF_Orders_HANDLING_1] DEFAULT (0),
    [HANDLING_2] money NOT NULL CONSTRAINT [DF_Orders_HANDLING_2] DEFAULT (0),
    [CANCELLATION_FEE] money NOT NULL CONSTRAINT [DF_Orders_CANCELLATION_FEE] DEFAULT (0),
    [TAX_1] money NOT NULL CONSTRAINT [DF_Orders_TAX_1] DEFAULT (0),
    [TAX_2] money NOT NULL CONSTRAINT [DF_Orders_TAX_2] DEFAULT (0),
    [TAX_3] money NOT NULL CONSTRAINT [DF_Orders_TAX_3] DEFAULT (0),
    [LINE_PAY] money NOT NULL CONSTRAINT [DF_Orders_LINE_PAY] DEFAULT (0),
    [OTHER_PAY] money NOT NULL CONSTRAINT [DF_Orders_OTHER_PAY] DEFAULT (0),
    [AR_PAY] money NOT NULL CONSTRAINT [DF_Orders_AR_PAY] DEFAULT (0),
    [TAX_AUTHOR_1] varchar(15) NOT NULL CONSTRAINT [DF_Orders_TAX_AUTHOR_1] DEFAULT (''),
    [TAX_AUTHOR_2] varchar(15) NOT NULL CONSTRAINT [DF_Orders_TAX_AUTHOR_2] DEFAULT (''),
    [TAX_AUTHOR_3] varchar(15) NOT NULL CONSTRAINT [DF_Orders_TAX_AUTHOR_3] DEFAULT (''),
    [TAX_RATE_1] numeric(15, 4) NOT NULL CONSTRAINT [DF_Orders_TAX_RATE_1] DEFAULT (0),
    [TAX_RATE_2] numeric(15, 4) NOT NULL CONSTRAINT [DF_Orders_TAX_RATE_2] DEFAULT (0),
    [TAX_RATE_3] numeric(15, 4) NOT NULL CONSTRAINT [DF_Orders_TAX_RATE_3] DEFAULT (0),
    [TAX_EXEMPT] varchar(15) NOT NULL CONSTRAINT [DF_Orders_TAX_EXEMPT] DEFAULT (''),
    [TERMS_CODE] varchar(5) NOT NULL CONSTRAINT [DF_Orders_TERMS_CODE] DEFAULT (''),
    [SCHEDULED_DATE] datetime NULL,
    [CONFIRMATION_DATE_TIME] datetime NULL,
    [SHIP_PAPERS_DATE_TIME] datetime NULL,
    [SHIPPED_DATE_TIME] datetime NULL,
    [BO_RELEASED_DATE_TIME] datetime NULL,
    [SOURCE_CODE] varchar(40) NOT NULL CONSTRAINT [DF_Orders_SOURCE_CODE] DEFAULT (''),
    [SALESMAN] varchar(15) NOT NULL CONSTRAINT [DF_Orders_SALESMAN] DEFAULT (''),
    [COMMISSION_RATE] numeric(15, 2) NOT NULL CONSTRAINT [DF_Orders_COMMISSION_RATE] DEFAULT (0),
    [DISCOUNT_RATE] numeric(15, 2) NOT NULL CONSTRAINT [DF_Orders_DISCOUNT_RATE] DEFAULT (0),
    [PRIORITY] int NOT NULL CONSTRAINT [DF_Orders_PRIORITY] DEFAULT (0),
    [HOLD_COMMENT] varchar(255) NOT NULL CONSTRAINT [DF_Orders_HOLD_COMMENT] DEFAULT (''),
    [AFFECT_INVENTORY] bit NOT NULL CONSTRAINT [DF_Orders_AFFECT_INVENTORY] DEFAULT (0),
    [HOLD_FLAG] bit NOT NULL CONSTRAINT [DF_Orders_HOLD_FLAG] DEFAULT (0),
    [CUSTOMER_REFERENCE] varchar(40) NOT NULL CONSTRAINT [DF_Orders_CUSTOMER_REFERENCE] DEFAULT (''),
    [VALUATION_BASIS] tinyint NOT NULL CONSTRAINT [DF_Orders_VALUATION_BASIS] DEFAULT (0),
    [UNDISCOUNTED_TOTAL] money NOT NULL CONSTRAINT [DF_Orders_UNDISCOUNTED_TOTAL] DEFAULT (0),
    [AUTO_CALC_HANDLING] bit NOT NULL CONSTRAINT [DF_Orders_AUTO_CALC_HANDLING] DEFAULT (0),
    [AUTO_CALC_RESTOCKING] bit NOT NULL CONSTRAINT [DF_Orders_AUTO_CALC_RESTOCKING] DEFAULT (0),
    [BACKORDERS] tinyint NOT NULL CONSTRAINT [DF_Orders_BACKORDERS] DEFAULT (0),
    [MEMBER_TYPE] varchar(5) NOT NULL CONSTRAINT [DF_Orders_MEMBER_TYPE] DEFAULT (''),
    [PAY_TYPE] varchar(10) NOT NULL CONSTRAINT [DF_Orders_PAY_TYPE] DEFAULT (''),
    [PAY_NUMBER] varchar(25) NOT NULL CONSTRAINT [DF_Orders_PAY_NUMBER] DEFAULT (''),
    [CREDIT_CARD_EXPIRES] varchar(10) NOT NULL CONSTRAINT [DF_Orders_CREDIT_CARD_EXPIRES] DEFAULT (''),
    [AUTHORIZE] varchar(10) NOT NULL CONSTRAINT [DF_Orders_AUTHORIZE] DEFAULT (''),
    [CREDIT_CARD_NAME] varchar(30) NOT NULL CONSTRAINT [DF_Orders_CREDIT_CARD_NAME] DEFAULT (''),
    [BO_STATUS] tinyint NOT NULL CONSTRAINT [DF_Orders_BO_STATUS] DEFAULT (0),
    [BO_RELEASE_DATE] datetime NULL,
    [TOTAL_QUANTITY_ORDERED] numeric(15, 4) NOT NULL CONSTRAINT [DF_Orders_TOTAL_QUANTITY_ORDERED] DEFAULT (0),
    [TOTAL_QUANTITY_BACKORDERED] numeric(15, 4) NOT NULL CONSTRAINT [DF_Orders_TOTAL_QUANTITY_BACKORDERED] DEFAULT (0),
    [SHIP_METHOD] varchar(10) NOT NULL CONSTRAINT [DF_Orders_SHIP_METHOD] DEFAULT (''),
    [TOTAL_WEIGHT] numeric(15, 2) NOT NULL CONSTRAINT [DF_Orders_TOTAL_WEIGHT] DEFAULT (0),
    [CASH_GL_ACCT] varchar(30) NOT NULL CONSTRAINT [DF_Orders_CASH_GL_ACCT] DEFAULT (''),
    [LINE_PST_TAXABLE] money NOT NULL CONSTRAINT [DF_Orders_LINE_PST_TAXABLE] DEFAULT (0),
    [INTENT_TO_EDIT] varchar(80) NOT NULL CONSTRAINT [DF_Orders_INTENT_TO_EDIT] DEFAULT (''),
    [PREPAID_INVOICE_REFERENCE_NUM] int NOT NULL CONSTRAINT [DF_Orders_PREPAID_INVOICE_REFERENCE_NUM] DEFAULT (0),
    [AUTO_CALC_FREIGHT] bit NOT NULL CONSTRAINT [DF_Orders_AUTO_CALC_FREIGHT] DEFAULT (0),
    [CO_ID] varchar(10) NOT NULL CONSTRAINT [DF_Orders_CO_ID] DEFAULT (''),
    [CO_MEMBER_TYPE] varchar(5) NOT NULL CONSTRAINT [DF_Orders_CO_MEMBER_TYPE] DEFAULT (''),
    [EMAIL] varchar(100) NOT NULL CONSTRAINT [DF_Orders_EMAIL] DEFAULT (''),
    [CRRT] varchar(40) NOT NULL CONSTRAINT [DF_Orders_CRRT] DEFAULT (''),
    [ADDRESS_STATUS] varchar(5) NOT NULL CONSTRAINT [DF_Orders_ADDRESS_STATUS] DEFAULT (''),
    [RECOGNIZED_CASH_AMOUNT] money NOT NULL CONSTRAINT [DF_Orders_RECOGNIZED_CASH_AMOUNT] DEFAULT (0),
    [IS_FR_ORDER] tinyint NOT NULL CONSTRAINT [DF_Orders_IS_FR_ORDER] DEFAULT (0),
    [VAT_TAX_CODE_FH] varchar(31) NULL,
    [ENCRYPT_PAY_NUMBER] varchar(100) NOT NULL CONSTRAINT [DF_Orders_ENCRYPT_PAY_NUMBER] DEFAULT (''),
    [ENCRYPT_CREDIT_CARD_EXPIRES] varchar(100) NOT NULL CONSTRAINT [DF_Orders_ENCRYPT_CREDIT_CARD_EXPIRES] DEFAULT (''),
    [AUTO_FREIGHT_TYPE] tinyint NOT NULL CONSTRAINT [DF_Orders_AUTO_FREIGHT_TYPE] DEFAULT (0),
    [USE_MEMBER_PRICE] bit NOT NULL CONSTRAINT [DF_Orders_USE_MEMBER_PRICE] DEFAULT (0),
    [ST_PRINT_COMPANY] bit NOT NULL CONSTRAINT [DF_Orders_ST_PRINT_COMPANY] DEFAULT (0),
    [ST_PRINT_TITLE] bit NOT NULL CONSTRAINT [DF_Orders_ST_PRINT_TITLE] DEFAULT (0),
    [TOLL_FREE] varchar(25) NOT NULL CONSTRAINT [DF_Orders_TOLL_FREE] DEFAULT (''),
    [MAIL_CODE] varchar(5) NOT NULL CONSTRAINT [DF_Orders_MAIL_CODE] DEFAULT (''),
    [ADDRESS_3] varchar(40) NOT NULL CONSTRAINT [DF_Orders_ADDRESS_3] DEFAULT (''),
    [ENCRYPT_CSC] varchar(100) NOT NULL CONSTRAINT [DF_Orders_ENCRYPT_CSC] DEFAULT (''),
    [ISSUE_DATE] varchar(10) NOT NULL CONSTRAINT [DF_Orders_ISSUE_DATE] DEFAULT (''),
    [ISSUE_NUMBER] varchar(2) NOT NULL CONSTRAINT [DF_Orders_ISSUE_NUMBER] DEFAULT (''),
    [MORE_PAYMENTS] numeric(15, 2) NOT NULL CONSTRAINT [DF_Orders_MORE_PAYMENTS] DEFAULT (0),
    [GATEWAY_REF] varchar(100) NOT NULL CONSTRAINT [DF_Orders_GATEWAY_REF] DEFAULT (''),
    [ORIGINATING_TRANS_NUM] int NOT NULL CONSTRAINT [DF_Orders_ORIGINATING_TRANS_NUM] DEFAULT (0),
    [FREIGHT_TAX] money NOT NULL CONSTRAINT [DF_Orders_FREIGHT_TAX] DEFAULT (0),
    [HANDLING_TAX] money NOT NULL CONSTRAINT [DF_Orders_HANDLING_TAX] DEFAULT (0),
    [TAX_RATE_FH] numeric(15, 4) NOT NULL CONSTRAINT [DF_Orders_TAX_RATE_FH] DEFAULT (0),
    [DISCOUNT_CODE] varchar(50) NOT NULL CONSTRAINT [DF_Orders_DISCOUNT_CODE] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Orders_VAT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Orders_VAT] (
    [ORDER_NUMBER] numeric(15, 2) NOT NULL CONSTRAINT [DF_Orders_VAT_ORDER_NUMBER] DEFAULT (0),
    [OVATRegNumber] varchar(20) NOT NULL CONSTRAINT [DF_Orders_VAT_OVATRegNumber] DEFAULT (''),
    [OVATCountry] varchar(2) NOT NULL CONSTRAINT [DF_Orders_VAT_OVATCountry] DEFAULT (''),
    [OVATBranchID] varchar(3) NOT NULL CONSTRAINT [DF_Orders_VAT_OVATBranchID] DEFAULT (''),
    [OUseVATTaxation] varchar(20) NOT NULL CONSTRAINT [DF_Orders_VAT_OUseVATTaxation] DEFAULT (''),
    [NTAX_AUTHOR_DEFAULT] varchar(31) NOT NULL CONSTRAINT [DF_Orders_VAT_NTAX_AUTHOR_DEFAULT] DEFAULT (''),
    [NVAT_REG_NUMBER] varchar(20) NOT NULL CONSTRAINT [DF_Orders_VAT_NVAT_REG_NUMBER] DEFAULT (''),
    [NVAT_COUNTRY] varchar(25) NOT NULL CONSTRAINT [DF_Orders_VAT_NVAT_COUNTRY] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[OrderStateRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[OrderStateRef] (
    [OrderStateCode] int NOT NULL,
    [OrderStateDesc] nvarchar(30) NOT NULL,
    [OrderStateName] nvarchar(10) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[OrderSuperProductAttribute]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[OrderSuperProductAttribute] (
    [OrderSuperProductAttributeID] int IDENTITY(1,1) NOT NULL,
    [Code] varchar(128) NOT NULL,
    [Title] varchar(128) NOT NULL,
    [Description] varchar(1024) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[OrderSuperProductAttributeLookup]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[OrderSuperProductAttributeLookup] (
    [OrderProductID] int NOT NULL,
    [OrderSuperProductAttributeID] int NOT NULL,
    [SortOrder] int NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[OrderSuperProductAttributeValue]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[OrderSuperProductAttributeValue] (
    [OrderSuperProductAttributeValueID] int IDENTITY(1,1) NOT NULL,
    [OrderSuperProductAttributeID] int NOT NULL,
    [Title] varchar(128) NOT NULL,
    [SortOrder] int NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[OrderSuperProductChildProduct]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[OrderSuperProductChildProduct] (
    [OrderSuperProductChildProductID] int IDENTITY(1,1) NOT NULL,
    [OrderProductID] int NOT NULL,
    [ProductCode] varchar(31) NOT NULL,
    [DefaultForPrice] bit NOT NULL,
    [Title] varchar(60) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[OrderSuperProductChildProductAttribute]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[OrderSuperProductChildProductAttribute] (
    [OrderSuperProductChildProductID] int NOT NULL,
    [OrderSuperProductAttributeValueID] int NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Org_Control]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Org_Control] (
    [OrgCode] varchar(5) NOT NULL CONSTRAINT [DF_Org_Control_OrgCode] DEFAULT (''),
    [OrgName] varchar(60) NOT NULL CONSTRAINT [DF_Org_Control_OrgName] DEFAULT (''),
    [Logo] image NULL,
    [InvoiceAddress] varchar(255) NOT NULL CONSTRAINT [DF_Org_Control_InvoiceAddress] DEFAULT (''),
    [LetterheadAddress] varchar(255) NOT NULL CONSTRAINT [DF_Org_Control_LetterheadAddress] DEFAULT (''),
    [DefaultFlag] tinyint NOT NULL CONSTRAINT [DF_Org_Control_DefaultFlag] DEFAULT (0),
    [IsFund] tinyint NOT NULL CONSTRAINT [DF_Org_Control_IsFund] DEFAULT (0),
    [DefaultCashAccount] varchar(50) NOT NULL CONSTRAINT [DF_Org_Control_DefaultCashAccount] DEFAULT (''),
    [DefaultArAccount] varchar(50) NOT NULL CONSTRAINT [DF_Org_Control_DefaultArAccount] DEFAULT (''),
    [FinanceAccount] varchar(50) NOT NULL CONSTRAINT [DF_Org_Control_FinanceAccount] DEFAULT (''),
    [DiscountAccount] varchar(50) NOT NULL CONSTRAINT [DF_Org_Control_DiscountAccount] DEFAULT (''),
    [DefaultTaxAccount] varchar(50) NOT NULL CONSTRAINT [DF_Org_Control_DefaultTaxAccount] DEFAULT (''),
    [DefaultIncomeAccount] varchar(50) NOT NULL CONSTRAINT [DF_Org_Control_DefaultIncomeAccount] DEFAULT (''),
    [RefundClearingAccount] varchar(50) NOT NULL CONSTRAINT [DF_Org_Control_RefundClearingAccount] DEFAULT (''),
    [DefaultFreightAccount] varchar(50) NOT NULL CONSTRAINT [DF_Org_Control_DefaultFreightAccount] DEFAULT (''),
    [DefaultHandlingAccount] varchar(50) NOT NULL CONSTRAINT [DF_Org_Control_DefaultHandlingAccount] DEFAULT (''),
    [DefaultCancellationAccount] varchar(50) NOT NULL CONSTRAINT [DF_Org_Control_DefaultCancellationAccount] DEFAULT (''),
    [RefundApAccount] varchar(50) NOT NULL CONSTRAINT [DF_Org_Control_RefundApAccount] DEFAULT (''),
    [TaxAuthority] varchar(20) NOT NULL CONSTRAINT [DF_Org_Control_TaxAuthority] DEFAULT (''),
    [GSTRemitNumber] varchar(15) NOT NULL CONSTRAINT [DF_Org_Control_GSTRemitNumber] DEFAULT (''),
    [DefaultPrepaidOrderAccount] varchar(50) NOT NULL CONSTRAINT [DF_Org_Control_DefaultPrepaidOrderAccount] DEFAULT (''),
    [DefaultTransferClearingAccount] varchar(50) NOT NULL CONSTRAINT [DF_Org_Control_DefaultTransferClearingAccount] DEFAULT (''),
    [DefaultWriteOffOffsetAccount] varchar(50) NOT NULL CONSTRAINT [DF_Org_Control_DefaultWriteOffOffsetAccount] DEFAULT (''),
    [VATRegNumber] varchar(20) NOT NULL CONSTRAINT [DF_Org_Control_VATRegNumber] DEFAULT (''),
    [VATCountry] varchar(2) NOT NULL CONSTRAINT [DF_Org_Control_VATCountry] DEFAULT (''),
    [VATBranchID] varchar(3) NOT NULL CONSTRAINT [DF_Org_Control_VATBranchID] DEFAULT (''),
    [CoVATRegNumber] varchar(20) NOT NULL CONSTRAINT [DF_Org_Control_CoVATRegNumber] DEFAULT (''),
    [UseVATTaxation] bit NOT NULL CONSTRAINT [DF_Org_Control_UseVATTaxation] DEFAULT (0),
    [UseCanadianTaxation] bit NOT NULL CONSTRAINT [DF_Org_Control_UseCanadianTaxation] DEFAULT (0),
    [Registration_Num] varchar(25) NOT NULL CONSTRAINT [DF_Org_Control_Registration_Num] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Org_Interest]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Org_Interest] (
    [ORG_CODE] varchar(5) NOT NULL CONSTRAINT [DF_Org_Interest_ORG_CODE] DEFAULT (''),
    [INTEREST_CODE] varchar(10) NOT NULL CONSTRAINT [DF_Org_Interest_INTEREST_CODE] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[OrganizationMain]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[OrganizationMain] (
    [OrganizationKey] uniqueidentifier NOT NULL CONSTRAINT [DF_OrganizationMain_OrganizationKey] DEFAULT (newid()),
    [Name] nvarchar(50) NOT NULL CONSTRAINT [DF_OrganizationMain_Name] DEFAULT (''),
    [Description] nvarchar(250) NOT NULL CONSTRAINT [DF_OrganizationMain_Description] DEFAULT (''),
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedOn] datetime NOT NULL CONSTRAINT [DF_OrganizationMain_CreatedOn] DEFAULT (getdate()),
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [UpdatedOn] datetime NOT NULL CONSTRAINT [DF_OrganizationMain_UpdatedOn] DEFAULT (getdate()),
    [MarkedForDeleteOn] datetime NULL,
    [DefaultDepartmentGroupKey] uniqueidentifier NOT NULL,
    [IsDefault] bit NOT NULL CONSTRAINT [DF_OrganizationMain_IsDefault] DEFAULT (0)
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[OutboundCommunicationStatusRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[OutboundCommunicationStatusRef] (
    [OutboundCommunicationStatusCode] int NOT NULL,
    [OutboundCommunicationStatusName] nvarchar(20) NOT NULL,
    [OutboundCommunicationStatusDesc] nvarchar(50) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[PackageItem]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[PackageItem] (
    [PackageKey] uniqueidentifier NOT NULL,
    [PackageItemKey] uniqueidentifier NOT NULL,
    [SupplementKey] uniqueidentifier NOT NULL,
    [UpdatedOn] datetime NOT NULL,
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedOn] datetime NOT NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[PackageLogStatusRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[PackageLogStatusRef] (
    [PackageLogStatusCode] int NOT NULL,
    [PackageLogStatusName] nvarchar(20) NOT NULL,
    [PackageLogStatusDesc] nvarchar(50) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[PackageLogSupplement]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[PackageLogSupplement] (
    [PackageLogKey] uniqueidentifier NOT NULL,
    [SupplementKey] uniqueidentifier NOT NULL,
    [IsEnclosure] bit NOT NULL,
    [IsEmailAttachment] bit NOT NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[PackageMain]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[PackageMain] (
    [PackageKey] uniqueidentifier NOT NULL,
    [Name] nvarchar(50) NOT NULL,
    [Description] nvarchar(200) NULL,
    [ExpirationDate] datetime NULL,
    [PackageMessageKey] uniqueidentifier NULL,
    [OutputMethodKey] uniqueidentifier NULL,
    [Cost] decimal(18, 4) NOT NULL CONSTRAINT [DF_PackageMain_Cost] DEFAULT (0),
    [PackageStatusCode] int NOT NULL CONSTRAINT [DF_PackageMain_PackageStatusCode] DEFAULT (0),
    [UpdatedOn] datetime NOT NULL CONSTRAINT [DF_PackageMain_UpdatedOn] DEFAULT (getdate()),
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedOn] datetime NOT NULL,
    [SystemEntityKey] uniqueidentifier NOT NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[PackageQueue]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[PackageQueue] (
    [PackageQueueKey] uniqueidentifier NOT NULL,
    [Name] nvarchar(100) NOT NULL,
    [PackageQueueReleaseTypeCode] int NOT NULL,
    [PackageCount] int NULL,
    [ScheduledTaskKey] uniqueidentifier NULL,
    [QueueReleaseWorkflowKey] uniqueidentifier NOT NULL,
    [NotificationGroupKey] uniqueidentifier NOT NULL,
    [AccessKey] uniqueidentifier NOT NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[PackageQueueReleaseTypeRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[PackageQueueReleaseTypeRef] (
    [PackageQueueReleaseTypeCode] int NOT NULL,
    [PackageQueueReleaseTypeName] nvarchar(20) NOT NULL,
    [PackageQueueReleaseTypeDesc] nvarchar(50) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[PackageStatusRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[PackageStatusRef] (
    [PackageStatusCode] int NOT NULL,
    [PackageStatusDesc] nvarchar(50) NOT NULL,
    [PackageStatusName] nvarchar(20) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[PanelDefinition]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[PanelDefinition] (
    [PanelDefinitionId] uniqueidentifier NOT NULL CONSTRAINT [DF_PanelDefinition_PanelDefinitionId] DEFAULT (newid()),
    [Name] nvarchar(50) NOT NULL,
    [Description] nvarchar(500) NULL,
    [RelatedEntityName] nvarchar(50) NULL,
    [SerializedPanelDefinition] nvarchar(max) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[PaperSizeRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[PaperSizeRef] (
    [PaperSizeKey] uniqueidentifier NOT NULL,
    [PaperSizeDesc] nvarchar(50) NOT NULL,
    [PageHeight] decimal(12, 4) NOT NULL,
    [PageWidth] decimal(12, 4) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[PaymentApplicationRestrictionRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[PaymentApplicationRestrictionRef] (
    [PaymentApplicationRestrictionCode] int NOT NULL,
    [PaymentApplicationRestrictionDesc] nvarchar(50) NOT NULL,
    [PaymentApplicationRestrictionName] nvarchar(20) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[PaymentDetailStatusRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[PaymentDetailStatusRef] (
    [PaymentDetailStatusCode] int NOT NULL,
    [PaymentDetailStatusDesc] nvarchar(50) NOT NULL,
    [PaymentDetailStatusName] nvarchar(20) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[PaymentMain]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[PaymentMain] (
    [PaymentKey] uniqueidentifier NOT NULL,
    [Amount] decimal(18, 4) NOT NULL CONSTRAINT [DF_PaymentMain_Amount] DEFAULT (0),
    [PaymentApplicationRestrictionCode] int NULL,
    [FinancialEntityKey] uniqueidentifier NOT NULL,
    [PaymentDate] datetime NOT NULL,
    [AmountHome] decimal(18, 4) NULL,
    [CurrencyCode] nchar(3) NULL,
    [OriginalPaymentKey] uniqueidentifier NULL,
    [PayorContactKey] uniqueidentifier NOT NULL,
    [SummaryDisplay] nvarchar(50) NULL,
    [AccessKey] uniqueidentifier NOT NULL,
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedOn] datetime NOT NULL,
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [UpdatedOn] datetime NOT NULL,
    [SystemEntityKey] uniqueidentifier NOT NULL,
    [OwnerGroupKey] uniqueidentifier NULL,
    [PaymentMethodKey] uniqueidentifier NULL,
    [PaymentReferenceData] nvarchar(50) NULL,
    [PaymentDetailKey] uniqueidentifier NULL,
    [MarkedForDeleteOn] datetime NULL,
    [FinalBatchKey] uniqueidentifier NULL,
    [OriginatingBatchKey] uniqueidentifier NULL,
    [BatchLineStatusCode] int NULL,
    [BatchStatusMessage] nvarchar(200) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[PaymentMethodSet]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[PaymentMethodSet] (
    [PaymentMethodSetId] uniqueidentifier NOT NULL,
    [PaymentMethodSetName] varchar(40) NOT NULL,
    [PaymentMethodSetDesc] varchar(200) NOT NULL,
    [ContextId] uniqueidentifier NOT NULL,
    [IsDefault] bit NOT NULL CONSTRAINT [DF_PaymentMethodSet_IsDefault] DEFAULT (0),
    [IsSystem] bit NOT NULL CONSTRAINT [DF_PaymentMethodSet_IsSystem] DEFAULT (0)
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[PaymentMethodSetDetail]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[PaymentMethodSetDetail] (
    [PaymentMethodSetId] uniqueidentifier NOT NULL,
    [PaymentMethodId] varchar(10) NOT NULL,
    [DisplayName] varchar(40) NOT NULL,
    [IsDefault] bit NOT NULL CONSTRAINT [DF_PaymentMethodSetDetail_IsDefault] DEFAULT (0),
    [SortOrder] int NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[PaymentTermsCustomLine]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[PaymentTermsCustomLine] (
    [PaymentTermsCustomLineKey] uniqueidentifier NOT NULL,
    [PaymentTermsKey] uniqueidentifier NOT NULL,
    [DaysFromEffectiveDate] int NOT NULL,
    [IsPercent] bit NOT NULL CONSTRAINT [DF_PaymentTermsCustomLine_IsPercent] DEFAULT (0),
    [Amount] decimal(18, 4) NOT NULL,
    [Sequence] int NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[PciAuditLog]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[PciAuditLog] (
    [PciAuditLogId] int IDENTITY(1,1) NOT NULL,
    [SqlLogin] varchar(80) NOT NULL CONSTRAINT [DF_PciAuditLog_SqlLogin] DEFAULT (suser_sname()),
    [UserId] varchar(60) NULL,
    [UserKey] uniqueidentifier NULL,
    [EventType] varchar(50) NULL,
    [EventTimestamp] datetime NOT NULL CONSTRAINT [DF_PciAuditLog_EventTimestamp] DEFAULT (getdate()),
    [Result] bit NULL,
    [OriginationCode] int NULL,
    [CC_LAST4] char(4) NULL,
    [ENCRYPT_CC_NUMBER] varchar(100) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Perspective]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Perspective] (
    [PerspectiveKey] uniqueidentifier NOT NULL,
    [PerspectiveName] nvarchar(100) NOT NULL,
    [WebsiteKey] uniqueidentifier NOT NULL,
    [RootHierarchyKey] uniqueidentifier NOT NULL,
    [MarkedForDeleteOn] datetime NULL,
    [HomePageHierarchyKey] uniqueidentifier NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[PhysicalAddress]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[PhysicalAddress] (
    [AddressKey] uniqueidentifier NOT NULL,
    [Address1] nvarchar(50) NOT NULL,
    [Address2] nvarchar(50) NULL,
    [Address3] nvarchar(50) NULL,
    [City] nvarchar(50) NOT NULL,
    [StateProvinceCode] nvarchar(5) NULL,
    [Region] nvarchar(50) NULL,
    [PostalCode] nvarchar(20) NULL,
    [CountryCode] nchar(2) NULL,
    [County] nvarchar(50) NULL,
    [MailCode] nvarchar(5) NULL,
    [TimeZoneKey] uniqueidentifier NULL,
    [CarrierRoute] nvarchar(10) NULL,
    [DeliveryPointBarCode] numeric(12, 0) NULL,
    [LineOfTravel] nvarchar(5) NULL,
    [BarCode] nvarchar(14) NULL,
    [USCongress] nvarchar(5) NULL,
    [StateSenate] nvarchar(5) NULL,
    [StateHouse] nvarchar(5) NULL,
    [Latitude] decimal(8, 2) NULL,
    [Longitude] decimal(8, 2) NULL,
    [TaxScheduleKey] uniqueidentifier NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Picture]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Picture] (
    [ImageKey] uniqueidentifier NOT NULL,
    [MimeType] nvarchar(100) NULL,
    [Alt] nvarchar(254) NULL,
    [ImageUrl] nvarchar(254) NULL,
    [Data] image NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[PicturePurposeRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[PicturePurposeRef] (
    [PicturePurposeKey] uniqueidentifier NOT NULL,
    [PicturePurposeDesc] nvarchar(30) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Pipeline]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Pipeline] (
    [PipelineKey] uniqueidentifier NOT NULL,
    [Name] nvarchar(50) NOT NULL,
    [OrderTypeKey] uniqueidentifier NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[PipelineStage]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[PipelineStage] (
    [PipelineStageKey] uniqueidentifier NOT NULL,
    [Name] nvarchar(50) NOT NULL,
    [PipelineKey] uniqueidentifier NOT NULL,
    [ComponentKey] uniqueidentifier NOT NULL,
    [Sequence] int NOT NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[PledgeReport]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[PledgeReport] (
    [ID] varchar(10) NOT NULL CONSTRAINT [DF_PledgeReport_ID] DEFAULT (''),
    [TransactionType] varchar(23) NOT NULL CONSTRAINT [DF_PledgeReport_TransactionType] DEFAULT (''),
    [TransactionNumber] int NOT NULL CONSTRAINT [DF_PledgeReport_TransactionNumber] DEFAULT (0),
    [InvoiceReferenceNumber] int NOT NULL CONSTRAINT [DF_PledgeReport_InvoiceReferenceNumber] DEFAULT (0),
    [TransactionDate] datetime NULL,
    [DateReceived] datetime NULL,
    [FiscalYear] int NOT NULL CONSTRAINT [DF_PledgeReport_FiscalYear] DEFAULT (0),
    [FiscalMonth] int NOT NULL CONSTRAINT [DF_PledgeReport_FiscalMonth] DEFAULT (0),
    [AppealCode] varchar(40) NOT NULL CONSTRAINT [DF_PledgeReport_AppealCode] DEFAULT (''),
    [CampaignCode] varchar(10) NOT NULL CONSTRAINT [DF_PledgeReport_CampaignCode] DEFAULT (''),
    [Fund] varchar(10) NOT NULL CONSTRAINT [DF_PledgeReport_Fund] DEFAULT (''),
    [SolicitorID] varchar(10) NOT NULL CONSTRAINT [DF_PledgeReport_SolicitorID] DEFAULT (''),
    [SourceSystem] varchar(10) NOT NULL CONSTRAINT [DF_PledgeReport_SourceSystem] DEFAULT (''),
    [MatchingTransaction] int NOT NULL CONSTRAINT [DF_PledgeReport_MatchingTransaction] DEFAULT (0),
    [IsMatchingGift] tinyint NOT NULL CONSTRAINT [DF_PledgeReport_IsMatchingGift] DEFAULT (0),
    [MemorialID] varchar(10) NOT NULL CONSTRAINT [DF_PledgeReport_MemorialID] DEFAULT (''),
    [ListAs] varchar(255) NOT NULL CONSTRAINT [DF_PledgeReport_ListAs] DEFAULT (''),
    [RequestNumber] numeric(15, 4) NOT NULL CONSTRAINT [DF_PledgeReport_RequestNumber] DEFAULT (0),
    [InstallmentDate] datetime NULL,
    [LastPaymentDate] datetime NULL,
    [PledgeAmount] numeric(15, 2) NOT NULL CONSTRAINT [DF_PledgeReport_PledgeAmount] DEFAULT (0),
    [AdjustmentsAmount] numeric(15, 2) NOT NULL CONSTRAINT [DF_PledgeReport_AdjustmentsAmount] DEFAULT (0),
    [PaymentsAmount] numeric(15, 2) NOT NULL CONSTRAINT [DF_PledgeReport_PaymentsAmount] DEFAULT (0),
    [PledgeFairMarketValue] numeric(15, 2) NOT NULL CONSTRAINT [DF_PledgeReport_PledgeFairMarketValue] DEFAULT (0),
    [MemorialNameText] varchar(100) NOT NULL CONSTRAINT [DF_PledgeReport_MemorialNameText] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[PostalCodeRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[PostalCodeRef] (
    [PostalCode] nvarchar(20) NOT NULL,
    [CountryCode] nchar(2) NOT NULL,
    [City] nvarchar(50) NULL,
    [StateProvinceCode] nvarchar(5) NULL,
    [Region] nvarchar(50) NULL,
    [County] nvarchar(50) NULL,
    [CountyFIPS] nvarchar(5) NULL,
    [IsHandModified] bit NOT NULL,
    [IsHandEntered] bit NOT NULL,
    [ChapterGroupKey] uniqueidentifier NULL,
    [UpdatedOn] datetime NOT NULL,
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [IsActive] bit NOT NULL,
    [PostalCodeKey] uniqueidentifier NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[PotentialMatchingGift]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[PotentialMatchingGift] (
    [PotentialMatchingGiftKey] uniqueidentifier NOT NULL,
    [OrderLineKey] uniqueidentifier NOT NULL,
    [MatchingGiftPlanKey] uniqueidentifier NULL,
    [MatchingGiftRelationshipKey] uniqueidentifier NULL,
    [MatchingGiftInformation] nvarchar(200) NULL,
    [DateCreated] datetime NOT NULL,
    [DateMatchingGiftFormReceived] datetime NULL,
    [DateMatchingFormSubmitted] datetime NULL,
    [Amount] decimal(18, 4) NOT NULL CONSTRAINT [DF_PotentialMatchingGift_Amount] DEFAULT (0),
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [UpdatedOn] datetime NOT NULL,
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedOn] datetime NOT NULL,
    [SystemEntityKey] uniqueidentifier NOT NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[PrefixRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[PrefixRef] (
    [PrefixCode] nvarchar(25) NOT NULL CONSTRAINT [DF_PrefixRef_PrefixCode] DEFAULT (''),
    [PrefixDesc] nvarchar(30) NOT NULL CONSTRAINT [DF_PrefixRef_PrefixDesc] DEFAULT (''),
    [SyncPrefixCode] nvarchar(25) NULL CONSTRAINT [DF_PrefixRef_SyncPrefixCode] DEFAULT (''),
    [Gender] nchar(1) NULL,
    [PrefixKey] uniqueidentifier NOT NULL CONSTRAINT [DF_PrefixRef_PrefixKey] DEFAULT (newid())
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[PriceBasisRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[PriceBasisRef] (
    [PriceBasisCode] int NOT NULL,
    [PriceBasisDesc] nvarchar(50) NOT NULL,
    [PriceBasisName] nvarchar(20) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[PricingTypeRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[PricingTypeRef] (
    [PricingTypeCode] int NOT NULL,
    [PricingTypeDesc] nvarchar(50) NOT NULL,
    [PricingTypeName] nvarchar(20) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[ProcessEngineType]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ProcessEngineType] (
    [ProcessEngineTypeKey] uniqueidentifier NOT NULL CONSTRAINT [DF_ProcessEngineType_ProcessEngineTypeKey] DEFAULT (newid()),
    [Name] nvarchar(32) NOT NULL CONSTRAINT [DF_ProcessEngineType_Name] DEFAULT (''),
    [Assembly] nvarchar(64) NOT NULL CONSTRAINT [DF_ProcessEngineType_Assembly] DEFAULT (''),
    [QualifiedName] nvarchar(256) NOT NULL CONSTRAINT [DF_ProcessEngineType_QualifiedName] DEFAULT (''),
    [HasTemplate] bit NOT NULL,
    [HasDesigner] bit NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Prod_Label_Pref]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Prod_Label_Pref] (
    [CODE] varchar(6) NOT NULL CONSTRAINT [DF_Prod_Label_Pref_CODE] DEFAULT (''),
    [DESCRIPTION] varchar(100) NOT NULL CONSTRAINT [DF_Prod_Label_Pref_DESCRIPTION] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Producer]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Producer] (
    [ContactID] numeric(18, 0) NOT NULL,
    [SimpleIntermediateAdvancedInd] char(1) NOT NULL CONSTRAINT [DF_Producer_SimpleIntermediateAdvancedInd] DEFAULT ('S'),
    [AlwaysModifyFlag] char(1) NOT NULL CONSTRAINT [DF_Producer_AlwaysModifyFlag] DEFAULT ('Y'),
    [DefaultOwnerMeGroupSpecificInd] char(1) NOT NULL CONSTRAINT [DF_Producer_DefaultOwnerMeGroupSpecificInd] DEFAULT ('M'),
    [DefaultOwnerContactID] numeric(18, 0) NULL,
    [WYSIWYGTextboxInd] char(1) NOT NULL CONSTRAINT [DF_Producer_WYSIWYGTextboxInd] DEFAULT ('W'),
    [DefaultReminderDays] int NULL,
    [NavEditEditorPropertiesInd] char(1) NOT NULL CONSTRAINT [DF_Producer_NavEditEditorPropertiesInd] DEFAULT ('P'),
    [NavNewEditorPropertiesInd] char(1) NOT NULL CONSTRAINT [DF_Producer_NavNewEditorPropertiesInd] DEFAULT ('P'),
    [ContentEditEditorPropertiesInd] char(1) NOT NULL CONSTRAINT [DF_Producer_ContentEditEditorPropertiesInd] DEFAULT ('P'),
    [ContentNewEditorPropertiesInd] char(1) NOT NULL CONSTRAINT [DF_Producer_ContentNewEditorPropertiesInd] DEFAULT ('P'),
    [WarnMissingTagFlag] char(1) NOT NULL CONSTRAINT [DF_Producer_WarnMissingTagFlag] DEFAULT ('Y'),
    [ShowPublishOptionWindowFlag] char(1) NOT NULL CONSTRAINT [DF_Producer_ShowPublishOptionWindowFlag] DEFAULT ('N'),
    [PublishDescendantsFlag] char(1) NOT NULL CONSTRAINT [DF_Producer_PublishDescendantsFlag] DEFAULT ('Y'),
    [DefaultWebsiteKey] uniqueidentifier NULL,
    [ShowProgressWindowFlag] char(1) NOT NULL CONSTRAINT [DF_Producer_ShowProgressWindowFlag] DEFAULT ('Y')
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Product]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Product] (
    [PRODUCT_CODE] varchar(31) NOT NULL CONSTRAINT [DF_Product_PRODUCT_CODE] DEFAULT (''),
    [PRODUCT_MAJOR] varchar(15) NOT NULL CONSTRAINT [DF_Product_PRODUCT_MAJOR] DEFAULT (''),
    [PRODUCT_MINOR] varchar(15) NOT NULL CONSTRAINT [DF_Product_PRODUCT_MINOR] DEFAULT (''),
    [PROD_TYPE] varchar(10) NOT NULL CONSTRAINT [DF_Product_PROD_TYPE] DEFAULT (''),
    [CATEGORY] varchar(10) NOT NULL CONSTRAINT [DF_Product_CATEGORY] DEFAULT (''),
    [TITLE_KEY] varchar(60) NOT NULL CONSTRAINT [DF_Product_TITLE_KEY] DEFAULT (''),
    [TITLE] varchar(60) NOT NULL CONSTRAINT [DF_Product_TITLE] DEFAULT (''),
    [DESCRIPTION] text NOT NULL CONSTRAINT [DF_Product_DESCRIPTION] DEFAULT (''),
    [STATUS] varchar(1) NOT NULL CONSTRAINT [DF_Product_STATUS] DEFAULT (''),
    [NOTE] text NULL,
    [GROUP_1] varchar(31) NOT NULL CONSTRAINT [DF_Product_GROUP_1] DEFAULT (''),
    [GROUP_2] varchar(31) NOT NULL CONSTRAINT [DF_Product_GROUP_2] DEFAULT (''),
    [GROUP_3] varchar(31) NOT NULL CONSTRAINT [DF_Product_GROUP_3] DEFAULT (''),
    [PRICE_RULES_EXIST] bit NOT NULL CONSTRAINT [DF_Product_PRICE_RULES_EXIST] DEFAULT (0),
    [LOT_SERIAL_EXIST] bit NOT NULL CONSTRAINT [DF_Product_LOT_SERIAL_EXIST] DEFAULT (0),
    [PAYMENT_PRIORITY] int NOT NULL CONSTRAINT [DF_Product_PAYMENT_PRIORITY] DEFAULT (0),
    [RENEW_MONTHS] int NOT NULL CONSTRAINT [DF_Product_RENEW_MONTHS] DEFAULT (0),
    [PRORATE] varchar(50) NOT NULL CONSTRAINT [DF_Product_PRORATE] DEFAULT (''),
    [STOCK_ITEM] bit NOT NULL CONSTRAINT [DF_Product_STOCK_ITEM] DEFAULT (0),
    [UNIT_OF_MEASURE] varchar(10) NOT NULL CONSTRAINT [DF_Product_UNIT_OF_MEASURE] DEFAULT (''),
    [WEIGHT] numeric(15, 2) NOT NULL CONSTRAINT [DF_Product_WEIGHT] DEFAULT (0),
    [TAXABLE] bit NOT NULL CONSTRAINT [DF_Product_TAXABLE] DEFAULT (0),
    [COMMISIONABLE] bit NOT NULL CONSTRAINT [DF_Product_COMMISIONABLE] DEFAULT (0),
    [COMMISION_PERCENT] numeric(15, 2) NOT NULL CONSTRAINT [DF_Product_COMMISION_PERCENT] DEFAULT (0),
    [DECIMAL_POINTS] int NOT NULL CONSTRAINT [DF_Product_DECIMAL_POINTS] DEFAULT (0),
    [INCOME_ACCOUNT] varchar(50) NOT NULL CONSTRAINT [DF_Product_INCOME_ACCOUNT] DEFAULT (''),
    [DEFERRED_INCOME_ACCOUNT] varchar(50) NOT NULL CONSTRAINT [DF_Product_DEFERRED_INCOME_ACCOUNT] DEFAULT (''),
    [INVENTORY_ACCOUNT] varchar(50) NOT NULL CONSTRAINT [DF_Product_INVENTORY_ACCOUNT] DEFAULT (''),
    [ADJUSTMENT_ACCOUNT] varchar(50) NOT NULL CONSTRAINT [DF_Product_ADJUSTMENT_ACCOUNT] DEFAULT (''),
    [COG_ACCOUNT] varchar(50) NOT NULL CONSTRAINT [DF_Product_COG_ACCOUNT] DEFAULT (''),
    [INTENT_TO_EDIT] varchar(80) NOT NULL CONSTRAINT [DF_Product_INTENT_TO_EDIT] DEFAULT (''),
    [PRICE_1] money NOT NULL CONSTRAINT [DF_Product_PRICE_1] DEFAULT (0),
    [PRICE_2] money NOT NULL CONSTRAINT [DF_Product_PRICE_2] DEFAULT (0),
    [PRICE_3] money NOT NULL CONSTRAINT [DF_Product_PRICE_3] DEFAULT (0),
    [COMPLIMENTARY] bit NOT NULL CONSTRAINT [DF_Product_COMPLIMENTARY] DEFAULT (0),
    [ATTRIBUTES] varchar(255) NOT NULL CONSTRAINT [DF_Product_ATTRIBUTES] DEFAULT (''),
    [PST_TAXABLE] bit NOT NULL CONSTRAINT [DF_Product_PST_TAXABLE] DEFAULT (0),
    [TAXABLE_VALUE] money NOT NULL CONSTRAINT [DF_Product_TAXABLE_VALUE] DEFAULT (0),
    [ORG_CODE] varchar(5) NOT NULL CONSTRAINT [DF_Product_ORG_CODE] DEFAULT (''),
    [TAX_AUTHORITY] varchar(15) NOT NULL CONSTRAINT [DF_Product_TAX_AUTHORITY] DEFAULT (''),
    [WEB_OPTION] tinyint NOT NULL CONSTRAINT [DF_Product_WEB_OPTION] DEFAULT (0),
    [IMAGE_URL] varchar(100) NOT NULL CONSTRAINT [DF_Product_IMAGE_URL] DEFAULT (''),
    [APPLY_IMAGE] bit NOT NULL CONSTRAINT [DF_Product_APPLY_IMAGE] DEFAULT (0),
    [IS_KIT] bit NOT NULL CONSTRAINT [DF_Product_IS_KIT] DEFAULT (0),
    [INFO_URL] varchar(100) NOT NULL CONSTRAINT [DF_Product_INFO_URL] DEFAULT (''),
    [APPLY_INFO] bit NOT NULL CONSTRAINT [DF_Product_APPLY_INFO] DEFAULT (0),
    [PLP_CODE] varchar(6) NOT NULL CONSTRAINT [DF_Product_PLP_CODE] DEFAULT (''),
    [PROMOTE] bit NOT NULL CONSTRAINT [DF_Product_PROMOTE] DEFAULT (0),
    [THUMBNAIL_URL] varchar(100) NOT NULL CONSTRAINT [DF_Product_THUMBNAIL_URL] DEFAULT (''),
    [APPLY_THUMBNAIL] bit NOT NULL CONSTRAINT [DF_Product_APPLY_THUMBNAIL] DEFAULT (0),
    [CATALOG_DESC] text NULL,
    [WEB_DESC] text NULL,
    [OTHER_DESC] text NULL,
    [LOCATION] varchar(10) NOT NULL CONSTRAINT [DF_Product_LOCATION] DEFAULT (''),
    [PREMIUM] bit NOT NULL CONSTRAINT [DF_Product_PREMIUM] DEFAULT (0),
    [FAIR_MARKET_VALUE] numeric(15, 2) NOT NULL CONSTRAINT [DF_Product_FAIR_MARKET_VALUE] DEFAULT (0),
    [IS_FR_ITEM] bit NOT NULL CONSTRAINT [DF_Product_IS_FR_ITEM] DEFAULT (0),
    [APPEAL_CODE] varchar(40) NOT NULL CONSTRAINT [DF_Product_APPEAL_CODE] DEFAULT (''),
    [CAMPAIGN_CODE] varchar(10) NOT NULL CONSTRAINT [DF_Product_CAMPAIGN_CODE] DEFAULT (''),
    [PRICE_FROM_COMPONENTS] bit NOT NULL CONSTRAINT [DF_Product_PRICE_FROM_COMPONENTS] DEFAULT (0),
    [PUBLISH_START_DATE] datetime NULL,
    [PUBLISH_END_DATE] datetime NULL,
    [TIME_STAMP] timestamp NULL,
    [ProductKey] uniqueidentifier NOT NULL CONSTRAINT [DF_Product_ProductKey] DEFAULT (newid())
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Product_Cat]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Product_Cat] (
    [PRODUCT_CATEGORY] varchar(10) NOT NULL CONSTRAINT [DF_Product_Cat_PRODUCT_CATEGORY] DEFAULT (''),
    [DESCRIPTION] varchar(255) NOT NULL CONSTRAINT [DF_Product_Cat_DESCRIPTION] DEFAULT (''),
    [TAXABLE] bit NOT NULL CONSTRAINT [DF_Product_Cat_TAXABLE] DEFAULT (0),
    [STOCK_ITEM] bit NOT NULL CONSTRAINT [DF_Product_Cat_STOCK_ITEM] DEFAULT (0),
    [COMMISSIONABLE] bit NOT NULL CONSTRAINT [DF_Product_Cat_COMMISSIONABLE] DEFAULT (0),
    [COMMISSION_PERCENT] numeric(15, 2) NOT NULL CONSTRAINT [DF_Product_Cat_COMMISSION_PERCENT] DEFAULT (0),
    [INCOME_ACCOUNT] varchar(50) NOT NULL CONSTRAINT [DF_Product_Cat_INCOME_ACCOUNT] DEFAULT (''),
    [INVENTORY_ACCOUNT] varchar(50) NOT NULL CONSTRAINT [DF_Product_Cat_INVENTORY_ACCOUNT] DEFAULT (''),
    [COG_ACCOUNT] varchar(50) NOT NULL CONSTRAINT [DF_Product_Cat_COG_ACCOUNT] DEFAULT (''),
    [ADJUSTMENTS_ACCOUNT] varchar(50) NOT NULL CONSTRAINT [DF_Product_Cat_ADJUSTMENTS_ACCOUNT] DEFAULT (''),
    [PST_TAXABLE] bit NOT NULL CONSTRAINT [DF_Product_Cat_PST_TAXABLE] DEFAULT (0),
    [TAX_AUTHORITY] varchar(15) NOT NULL CONSTRAINT [DF_Product_Cat_TAX_AUTHORITY] DEFAULT (''),
    [WEB_OPTION] tinyint NOT NULL CONSTRAINT [DF_Product_Cat_WEB_OPTION] DEFAULT (0),
    [IMAGE_URL] varchar(100) NOT NULL CONSTRAINT [DF_Product_Cat_IMAGE_URL] DEFAULT (''),
    [APPLY_IMAGE] bit NOT NULL CONSTRAINT [DF_Product_Cat_APPLY_IMAGE] DEFAULT (0),
    [IS_KIT] bit NOT NULL CONSTRAINT [DF_Product_Cat_IS_KIT] DEFAULT (0),
    [INFO_URL] varchar(100) NOT NULL CONSTRAINT [DF_Product_Cat_INFO_URL] DEFAULT (''),
    [APPLY_INFO] bit NOT NULL CONSTRAINT [DF_Product_Cat_APPLY_INFO] DEFAULT (0),
    [IS_PUBLICATION] bit NOT NULL CONSTRAINT [DF_Product_Cat_IS_PUBLICATION] DEFAULT (0),
    [UF_1] varchar(30) NOT NULL CONSTRAINT [DF_Product_Cat_UF_1] DEFAULT (''),
    [UF_2] varchar(30) NOT NULL CONSTRAINT [DF_Product_Cat_UF_2] DEFAULT (''),
    [UF_3] varchar(30) NOT NULL CONSTRAINT [DF_Product_Cat_UF_3] DEFAULT (''),
    [UF_4] varchar(30) NOT NULL CONSTRAINT [DF_Product_Cat_UF_4] DEFAULT (''),
    [PREMIUM] bit NOT NULL CONSTRAINT [DF_Product_Cat_PREMIUM] DEFAULT (0),
    [CONTACT_ID] varchar(10) NOT NULL CONSTRAINT [DF_Product_Cat_CONTACT_ID] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Product_Cert]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Product_Cert] (
    [PRODUCT_CODE] varchar(31) NOT NULL CONSTRAINT [DF_Product_Cert_PRODUCT_CODE] DEFAULT (''),
    [PARENT] bit NOT NULL CONSTRAINT [DF_Product_Cert_PARENT] DEFAULT (0),
    [UNITS_REQUIRED_FOR_CREDIT] numeric(15, 2) NOT NULL CONSTRAINT [DF_Product_Cert_UNITS_REQUIRED_FOR_CREDIT] DEFAULT (0),
    [DEPENDENT_FUNCTIONS] int NOT NULL CONSTRAINT [DF_Product_Cert_DEPENDENT_FUNCTIONS] DEFAULT (0),
    [TIE_TO_PROGRAM] bit NOT NULL CONSTRAINT [DF_Product_Cert_TIE_TO_PROGRAM] DEFAULT (0),
    [SKIP_ENROLLMENT] bit NOT NULL CONSTRAINT [DF_Product_Cert_SKIP_ENROLLMENT] DEFAULT (0),
    [ADDRESS_1] varchar(50) NOT NULL CONSTRAINT [DF_Product_Cert_ADDRESS_1] DEFAULT (''),
    [ADDRESS_2] varchar(50) NOT NULL CONSTRAINT [DF_Product_Cert_ADDRESS_2] DEFAULT (''),
    [ADDRESS_3] varchar(50) NOT NULL CONSTRAINT [DF_Product_Cert_ADDRESS_3] DEFAULT (''),
    [CITY] varchar(40) NOT NULL CONSTRAINT [DF_Product_Cert_CITY] DEFAULT (''),
    [STATE_PROVINCE] varchar(15) NOT NULL CONSTRAINT [DF_Product_Cert_STATE_PROVINCE] DEFAULT (''),
    [ZIP] varchar(10) NOT NULL CONSTRAINT [DF_Product_Cert_ZIP] DEFAULT (''),
    [COUNTRY] varchar(25) NOT NULL CONSTRAINT [DF_Product_Cert_COUNTRY] DEFAULT (''),
    [INSTRUCTORS] text NULL,
    [PREREQUISITES] text NULL,
    [CURRENTLY_ENROLLED] int NOT NULL CONSTRAINT [DF_Product_Cert_CURRENTLY_ENROLLED] DEFAULT (0),
    [TOTAL_PASSED] int NOT NULL CONSTRAINT [DF_Product_Cert_TOTAL_PASSED] DEFAULT (0),
    [TOTAL_FAILED] int NOT NULL CONSTRAINT [DF_Product_Cert_TOTAL_FAILED] DEFAULT (0),
    [BEGIN_DATE] datetime NULL,
    [END_DATE] datetime NULL,
    [SUBCOMPONENT] bit NOT NULL CONSTRAINT [DF_Product_Cert_SUBCOMPONENT] DEFAULT (0),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Product_FR]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Product_FR] (
    [PRODUCT_CODE] varchar(31) NOT NULL CONSTRAINT [DF_Product_FR_PRODUCT_CODE] DEFAULT (''),
    [AMOUNT_TO_QUALIFY] numeric(15, 2) NOT NULL CONSTRAINT [DF_Product_FR_AMOUNT_TO_QUALIFY] DEFAULT (0),
    [DATE_RANGE_CRITERION] tinyint NOT NULL CONSTRAINT [DF_Product_FR_DATE_RANGE_CRITERION] DEFAULT (0),
    [NUMBER_OF_DAYS] int NOT NULL CONSTRAINT [DF_Product_FR_NUMBER_OF_DAYS] DEFAULT (0),
    [ONLY_FOR_FUND] varchar(5) NOT NULL CONSTRAINT [DF_Product_FR_ONLY_FOR_FUND] DEFAULT (''),
    [ONLY_FOR_CAMPAIGN] varchar(10) NOT NULL CONSTRAINT [DF_Product_FR_ONLY_FOR_CAMPAIGN] DEFAULT (''),
    [ONLY_FOR_APPEAL] varchar(40) NOT NULL CONSTRAINT [DF_Product_FR_ONLY_FOR_APPEAL] DEFAULT (''),
    [LETTER_TITLE] varchar(45) NULL,
    [IS_CASH_ONLY] tinyint NOT NULL CONSTRAINT [DF_Product_FR_IS_CASH_ONLY] DEFAULT (0),
    [FR_TYPE] varchar(20) NOT NULL CONSTRAINT [DF_Product_FR_FR_TYPE] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Product_Function]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Product_Function] (
    [PRODUCT_CODE] varchar(31) NOT NULL CONSTRAINT [DF_Product_Function_PRODUCT_CODE] DEFAULT (''),
    [FUNCTION_TYPE] varchar(5) NOT NULL CONSTRAINT [DF_Product_Function_FUNCTION_TYPE] DEFAULT (''),
    [BEGIN_DATE_TIME] datetime NULL,
    [END_DATE_TIME] datetime NULL,
    [SEQ] int NOT NULL CONSTRAINT [DF_Product_Function_SEQ] DEFAULT (0),
    [MINIMUM_ATTENDANCE] int NOT NULL CONSTRAINT [DF_Product_Function_MINIMUM_ATTENDANCE] DEFAULT (0),
    [EXPECTED_ATTENDANCE] int NOT NULL CONSTRAINT [DF_Product_Function_EXPECTED_ATTENDANCE] DEFAULT (0),
    [GUARANTEED_ATTENDANCE] int NOT NULL CONSTRAINT [DF_Product_Function_GUARANTEED_ATTENDANCE] DEFAULT (0),
    [ACTUAL_ATTENDANCE] int NOT NULL CONSTRAINT [DF_Product_Function_ACTUAL_ATTENDANCE] DEFAULT (0),
    [SETTINGS] int NOT NULL CONSTRAINT [DF_Product_Function_SETTINGS] DEFAULT (0),
    [SETUP_DATE_TIME] datetime NULL,
    [POST_DATE_TIME] datetime NULL,
    [AUTO_ENROLL] bit NOT NULL CONSTRAINT [DF_Product_Function_AUTO_ENROLL] DEFAULT (0),
    [PRINT_TICKET] bit NOT NULL CONSTRAINT [DF_Product_Function_PRINT_TICKET] DEFAULT (0),
    [LAST_TICKET] int NOT NULL CONSTRAINT [DF_Product_Function_LAST_TICKET] DEFAULT (0),
    [CEU_TYPE] varchar(15) NOT NULL CONSTRAINT [DF_Product_Function_CEU_TYPE] DEFAULT (''),
    [CEU_AMOUNT] numeric(15, 2) NOT NULL CONSTRAINT [DF_Product_Function_CEU_AMOUNT] DEFAULT (0),
    [COURSE_CODE] varchar(15) NOT NULL CONSTRAINT [DF_Product_Function_COURSE_CODE] DEFAULT (''),
    [OTHER_TICKETS] varchar(255) NOT NULL CONSTRAINT [DF_Product_Function_OTHER_TICKETS] DEFAULT (''),
    [CEU_ENTERED] bit NOT NULL CONSTRAINT [DF_Product_Function_CEU_ENTERED] DEFAULT (0),
    [MAXIMUM_ATTENDANCE] int NOT NULL CONSTRAINT [DF_Product_Function_MAXIMUM_ATTENDANCE] DEFAULT (0),
    [PARENT] bit NOT NULL CONSTRAINT [DF_Product_Function_PARENT] DEFAULT (0),
    [CONFLICT_CODE] varchar(10) NOT NULL CONSTRAINT [DF_Product_Function_CONFLICT_CODE] DEFAULT (''),
    [WEB_ENABLED] bit NOT NULL CONSTRAINT [DF_Product_Function_WEB_ENABLED] DEFAULT (0),
    [WEB_MULTI_REG] tinyint NOT NULL CONSTRAINT [DF_Product_Function_WEB_MULTI_REG] DEFAULT (0),
    [SQUARE_FEET] numeric(15, 2) NULL,
    [IS_FR_ITEM] bit NOT NULL CONSTRAINT [DF_Product_Function_IS_FR_ITEM] DEFAULT (0),
    [IS_GUEST_FUNCTION] bit NOT NULL CONSTRAINT [DF_Product_Function_IS_GUEST_FUNCTION] DEFAULT (0),
    [CREATE_DETAIL_ACTIVITY] bit NOT NULL CONSTRAINT [DF_Product_Function_CREATE_DETAIL_ACTIVITY] DEFAULT (0),
    [EVENT_TRACK] varchar(255) NOT NULL CONSTRAINT [DF_Product_Function_EVENT_TRACK] DEFAULT (''),
    [EVENT_CATEGORY] varchar(255) NOT NULL CONSTRAINT [DF_Product_Function_EVENT_CATEGORY] DEFAULT (''),
    [IS_EVENT_REGISTRATION_OPTION] bit NOT NULL CONSTRAINT [DF_Product_Function_IS_EVENT_REGISTRATION_OPTION] DEFAULT (0),
    [FORM_DEFINITION_SECTION_ID] varchar(36) NOT NULL CONSTRAINT [DF_Product_Function_Form_Definition_Section_ID] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Product_Instance]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Product_Instance] (
    [PRODUCT_CODE] varchar(31) NOT NULL CONSTRAINT [DF_Product_Instance_PRODUCT_CODE] DEFAULT (''),
    [INSTANCE_NAME] varchar(31) NOT NULL CONSTRAINT [DF_Product_Instance_INSTANCE_NAME] DEFAULT (''),
    [BEGIN_DATE_TIME] datetime NULL,
    [END_DATE_TIME] datetime NULL,
    [COMPANY] varchar(80) NOT NULL CONSTRAINT [DF_Product_Instance_COMPANY] DEFAULT (''),
    [ADDRESS_1] varchar(50) NOT NULL CONSTRAINT [DF_Product_Instance_ADDRESS_1] DEFAULT (''),
    [ADDRESS_2] varchar(50) NOT NULL CONSTRAINT [DF_Product_Instance_ADDRESS_2] DEFAULT (''),
    [CITY] varchar(40) NOT NULL CONSTRAINT [DF_Product_Instance_CITY] DEFAULT (''),
    [STATE_PROVINCE] varchar(15) NOT NULL CONSTRAINT [DF_Product_Instance_STATE_PROVINCE] DEFAULT (''),
    [ZIP] varchar(10) NOT NULL CONSTRAINT [DF_Product_Instance_ZIP] DEFAULT (''),
    [COUNTRY] varchar(25) NOT NULL CONSTRAINT [DF_Product_Instance_COUNTRY] DEFAULT (''),
    [NOTES] varchar(255) NOT NULL CONSTRAINT [DF_Product_Instance_NOTES] DEFAULT (''),
    [PROVIDER] varchar(10) NOT NULL CONSTRAINT [DF_Product_Instance_PROVIDER] DEFAULT (''),
    [INSTRUCTOR] varchar(10) NOT NULL CONSTRAINT [DF_Product_Instance_INSTRUCTOR] DEFAULT (''),
    [PRIMARY_CONTACT] varchar(40) NOT NULL CONSTRAINT [DF_Product_Instance_PRIMARY_CONTACT] DEFAULT (''),
    [PHONE] varchar(20) NOT NULL CONSTRAINT [DF_Product_Instance_PHONE] DEFAULT (''),
    [FAX] varchar(20) NOT NULL CONSTRAINT [DF_Product_Instance_FAX] DEFAULT (''),
    [TOLL_FREE] varchar(20) NOT NULL CONSTRAINT [DF_Product_Instance_TOLL_FREE] DEFAULT (''),
    [ADDRESS_3] varchar(50) NOT NULL CONSTRAINT [DF_Product_Instance_ADDRESS_3] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Product_Inventory]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Product_Inventory] (
    [PRODUCT_CODE] varchar(31) NOT NULL CONSTRAINT [DF_Product_Inventory_PRODUCT_CODE] DEFAULT (''),
    [QUANTITY_ON_HAND] numeric(15, 4) NOT NULL CONSTRAINT [DF_Product_Inventory_QUANTITY_ON_HAND] DEFAULT (0),
    [QUANTITY_RESERVED] numeric(15, 4) NOT NULL CONSTRAINT [DF_Product_Inventory_QUANTITY_RESERVED] DEFAULT (0),
    [QUANTITY_COMMITTED] numeric(15, 4) NOT NULL CONSTRAINT [DF_Product_Inventory_QUANTITY_COMMITTED] DEFAULT (0),
    [QUANTITY_AVAILABLE] numeric(15, 4) NOT NULL CONSTRAINT [DF_Product_Inventory_QUANTITY_AVAILABLE] DEFAULT (0),
    [QUANTITY_BACKORDERED] numeric(15, 4) NOT NULL CONSTRAINT [DF_Product_Inventory_QUANTITY_BACKORDERED] DEFAULT (0),
    [QUANTITY_ON_ORDER] numeric(15, 4) NOT NULL CONSTRAINT [DF_Product_Inventory_QUANTITY_ON_ORDER] DEFAULT (0),
    [EXPECTED_ARRIVAL_DATE] datetime NULL,
    [LTD_ORDERS] int NOT NULL CONSTRAINT [DF_Product_Inventory_LTD_ORDERS] DEFAULT (0),
    [LTD_QUANTITY] numeric(15, 4) NOT NULL CONSTRAINT [DF_Product_Inventory_LTD_QUANTITY] DEFAULT (0),
    [LTD_CANCELED_QUANTITY] numeric(15, 4) NOT NULL CONSTRAINT [DF_Product_Inventory_LTD_CANCELED_QUANTITY] DEFAULT (0),
    [LTD_INCOME] numeric(15, 2) NOT NULL CONSTRAINT [DF_Product_Inventory_LTD_INCOME] DEFAULT (0),
    [LTD_COST] numeric(15, 2) NOT NULL CONSTRAINT [DF_Product_Inventory_LTD_COST] DEFAULT (0),
    [STANDARD_COST] numeric(15, 2) NOT NULL CONSTRAINT [DF_Product_Inventory_STANDARD_COST] DEFAULT (0),
    [LATEST_COST] numeric(15, 2) NOT NULL CONSTRAINT [DF_Product_Inventory_LATEST_COST] DEFAULT (0),
    [AVERAGE_COST] numeric(15, 2) NOT NULL CONSTRAINT [DF_Product_Inventory_AVERAGE_COST] DEFAULT (0),
    [TOTAL_COST] numeric(15, 2) NOT NULL CONSTRAINT [DF_Product_Inventory_TOTAL_COST] DEFAULT (0),
    [LAST_ORDER_DATE] datetime NULL,
    [FIRST_ORDER_DATE] datetime NULL,
    [LAST_RECEIVED_DATE] datetime NULL,
    [MINIMUM_ORDER_POINT] int NOT NULL CONSTRAINT [DF_Product_Inventory_MINIMUM_ORDER_POINT] DEFAULT (0),
    [MINIMUM_ORDER_QUANTITY] int NOT NULL CONSTRAINT [DF_Product_Inventory_MINIMUM_ORDER_QUANTITY] DEFAULT (0),
    [LOCATION] varchar(10) NOT NULL CONSTRAINT [DF_Product_Inventory_LOCATION] DEFAULT (''),
    [BIN] varchar(10) NOT NULL CONSTRAINT [DF_Product_Inventory_BIN] DEFAULT (''),
    [INCOME_ACCOUNT] varchar(50) NOT NULL CONSTRAINT [DF_Product_Inventory_INCOME_ACCOUNT] DEFAULT (''),
    [INVENTORY_ACCOUNT] varchar(50) NOT NULL CONSTRAINT [DF_Product_Inventory_INVENTORY_ACCOUNT] DEFAULT (''),
    [COG_ACCOUNT] varchar(50) NOT NULL CONSTRAINT [DF_Product_Inventory_COG_ACCOUNT] DEFAULT (''),
    [ADJUSTMENT_ACCOUNT] varchar(50) NOT NULL CONSTRAINT [DF_Product_Inventory_ADJUSTMENT_ACCOUNT] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Product_Kit]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Product_Kit] (
    [SEQN] int NOT NULL CONSTRAINT [DF_Product_Kit_SEQN] DEFAULT (0),
    [PRODUCT_CODE] varchar(31) NOT NULL CONSTRAINT [DF_Product_Kit_PRODUCT_CODE] DEFAULT (''),
    [ITEM_PRODUCT_CODE] varchar(31) NOT NULL CONSTRAINT [DF_Product_Kit_ITEM_PRODUCT_CODE] DEFAULT (''),
    [ITEM_QUANTITY] decimal(18, 8) NOT NULL CONSTRAINT [DF_Product_Kit_ITEM_QUANTITY] DEFAULT (0),
    [DESCRIPTION] varchar(255) NOT NULL CONSTRAINT [DF_Product_Kit_DESCRIPTION] DEFAULT (''),
    [PRICE_1] money NOT NULL CONSTRAINT [DF_Product_Kit_PRICE_1] DEFAULT (0),
    [PRICE_2] money NOT NULL CONSTRAINT [DF_Product_Kit_PRICE_2] DEFAULT (0),
    [TAX_AUTHORITY] varchar(15) NOT NULL CONSTRAINT [DF_Product_Kit_TAX_AUTHORITY] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Product_Location]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Product_Location] (
    [LOCATION_CODE] varchar(10) NOT NULL CONSTRAINT [DF_Product_Location_LOCATION_CODE] DEFAULT (''),
    [DESCRIPTION] varchar(255) NOT NULL CONSTRAINT [DF_Product_Location_DESCRIPTION] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Product_Lot]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Product_Lot] (
    [PRODUCT_CODE] varchar(31) NOT NULL CONSTRAINT [DF_Product_Lot_PRODUCT_CODE] DEFAULT (''),
    [LOCATION] varchar(30) NOT NULL CONSTRAINT [DF_Product_Lot_LOCATION] DEFAULT (''),
    [LOT_SERIAL] varchar(20) NOT NULL CONSTRAINT [DF_Product_Lot_LOT_SERIAL] DEFAULT (''),
    [TITLE] varchar(60) NOT NULL CONSTRAINT [DF_Product_Lot_TITLE] DEFAULT (''),
    [BIN] varchar(20) NOT NULL CONSTRAINT [DF_Product_Lot_BIN] DEFAULT (''),
    [ON_HAND] numeric(15, 4) NOT NULL CONSTRAINT [DF_Product_Lot_ON_HAND] DEFAULT (0),
    [RESERVED] numeric(15, 4) NOT NULL CONSTRAINT [DF_Product_Lot_RESERVED] DEFAULT (0),
    [COMMITTED_QTY] numeric(15, 4) NOT NULL CONSTRAINT [DF_Product_Lot_COMMITTED_QTY] DEFAULT (0),
    [AVAILABLE] numeric(15, 4) NOT NULL CONSTRAINT [DF_Product_Lot_AVAILABLE] DEFAULT (0),
    [AVAILABLE_KEY] varchar(31) NOT NULL CONSTRAINT [DF_Product_Lot_AVAILABLE_KEY] DEFAULT (''),
    [LOT_DATE] datetime NULL,
    [BACKORDERED] numeric(15, 4) NOT NULL CONSTRAINT [DF_Product_Lot_BACKORDERED] DEFAULT (0),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Product_Price]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Product_Price] (
    [RULE_TYPE] varchar(2) NOT NULL CONSTRAINT [DF_Product_Price_RULE_TYPE] DEFAULT (''),
    [PROD_TYPE] varchar(5) NOT NULL CONSTRAINT [DF_Product_Price_PROD_TYPE] DEFAULT (''),
    [PRODUCT_CODE] varchar(31) NOT NULL CONSTRAINT [DF_Product_Price_PRODUCT_CODE] DEFAULT (''),
    [CUSTOMER_TYPE] varchar(11) NOT NULL CONSTRAINT [DF_Product_Price_CUSTOMER_TYPE] DEFAULT (''),
    [CUSTOMER_ID] varchar(10) NOT NULL CONSTRAINT [DF_Product_Price_CUSTOMER_ID] DEFAULT (''),
    [BEGIN_DATE] datetime NULL,
    [END_DATE] datetime NULL,
    [RULE_KEY] varchar(50) NOT NULL CONSTRAINT [DF_Product_Price_RULE_KEY] DEFAULT (''),
    [RATE_1] money NOT NULL CONSTRAINT [DF_Product_Price_RATE_1] DEFAULT (0),
    [RATE_2] money NOT NULL CONSTRAINT [DF_Product_Price_RATE_2] DEFAULT (0),
    [RATE_3] money NOT NULL CONSTRAINT [DF_Product_Price_RATE_3] DEFAULT (0),
    [RATE_4] money NOT NULL CONSTRAINT [DF_Product_Price_RATE_4] DEFAULT (0),
    [RATE_5] money NOT NULL CONSTRAINT [DF_Product_Price_RATE_5] DEFAULT (0),
    [RATE_6] money NOT NULL CONSTRAINT [DF_Product_Price_RATE_6] DEFAULT (0),
    [RATE_7] money NOT NULL CONSTRAINT [DF_Product_Price_RATE_7] DEFAULT (0),
    [RATE_8] money NOT NULL CONSTRAINT [DF_Product_Price_RATE_8] DEFAULT (0),
    [RATE_9] money NOT NULL CONSTRAINT [DF_Product_Price_RATE_9] DEFAULT (0),
    [RATE_10] money NOT NULL CONSTRAINT [DF_Product_Price_RATE_10] DEFAULT (0),
    [RATE_11] money NOT NULL CONSTRAINT [DF_Product_Price_RATE_11] DEFAULT (0),
    [RATE_12] money NOT NULL CONSTRAINT [DF_Product_Price_RATE_12] DEFAULT (0),
    [RATE_13] money NOT NULL CONSTRAINT [DF_Product_Price_RATE_13] DEFAULT (0),
    [RATE_14] money NOT NULL CONSTRAINT [DF_Product_Price_RATE_14] DEFAULT (0),
    [RATE_15] money NOT NULL CONSTRAINT [DF_Product_Price_RATE_15] DEFAULT (0),
    [RATE_16] money NOT NULL CONSTRAINT [DF_Product_Price_RATE_16] DEFAULT (0),
    [RATE_17] money NOT NULL CONSTRAINT [DF_Product_Price_RATE_17] DEFAULT (0),
    [RATE_18] money NOT NULL CONSTRAINT [DF_Product_Price_RATE_18] DEFAULT (0),
    [RATE_19] money NOT NULL CONSTRAINT [DF_Product_Price_RATE_19] DEFAULT (0),
    [RATE_20] money NOT NULL CONSTRAINT [DF_Product_Price_RATE_20] DEFAULT (0),
    [STEP_1] varchar(15) NOT NULL CONSTRAINT [DF_Product_Price_STEP_1] DEFAULT (''),
    [STEP_2] varchar(15) NOT NULL CONSTRAINT [DF_Product_Price_STEP_2] DEFAULT (''),
    [STEP_3] varchar(15) NOT NULL CONSTRAINT [DF_Product_Price_STEP_3] DEFAULT (''),
    [STEP_4] varchar(15) NOT NULL CONSTRAINT [DF_Product_Price_STEP_4] DEFAULT (''),
    [STEP_5] varchar(15) NOT NULL CONSTRAINT [DF_Product_Price_STEP_5] DEFAULT (''),
    [STEP_6] varchar(15) NOT NULL CONSTRAINT [DF_Product_Price_STEP_6] DEFAULT (''),
    [STEP_7] varchar(15) NOT NULL CONSTRAINT [DF_Product_Price_STEP_7] DEFAULT (''),
    [STEP_8] varchar(15) NOT NULL CONSTRAINT [DF_Product_Price_STEP_8] DEFAULT (''),
    [STEP_9] varchar(15) NOT NULL CONSTRAINT [DF_Product_Price_STEP_9] DEFAULT (''),
    [STEP_10] varchar(15) NOT NULL CONSTRAINT [DF_Product_Price_STEP_10] DEFAULT (''),
    [STEP_11] varchar(15) NOT NULL CONSTRAINT [DF_Product_Price_STEP_11] DEFAULT (''),
    [STEP_12] varchar(15) NOT NULL CONSTRAINT [DF_Product_Price_STEP_12] DEFAULT (''),
    [STEP_13] varchar(15) NOT NULL CONSTRAINT [DF_Product_Price_STEP_13] DEFAULT (''),
    [STEP_14] varchar(15) NOT NULL CONSTRAINT [DF_Product_Price_STEP_14] DEFAULT (''),
    [STEP_15] varchar(15) NOT NULL CONSTRAINT [DF_Product_Price_STEP_15] DEFAULT (''),
    [STEP_16] varchar(15) NOT NULL CONSTRAINT [DF_Product_Price_STEP_16] DEFAULT (''),
    [STEP_17] varchar(15) NOT NULL CONSTRAINT [DF_Product_Price_STEP_17] DEFAULT (''),
    [STEP_18] varchar(15) NOT NULL CONSTRAINT [DF_Product_Price_STEP_18] DEFAULT (''),
    [STEP_19] varchar(15) NOT NULL CONSTRAINT [DF_Product_Price_STEP_19] DEFAULT (''),
    [STEP_20] varchar(15) NOT NULL CONSTRAINT [DF_Product_Price_STEP_20] DEFAULT (''),
    [BASE_1] varchar(255) NOT NULL CONSTRAINT [DF_Product_Price_BASE_1] DEFAULT (''),
    [BASE_2] varchar(255) NOT NULL CONSTRAINT [DF_Product_Price_BASE_2] DEFAULT (''),
    [BASE_3] varchar(255) NOT NULL CONSTRAINT [DF_Product_Price_BASE_3] DEFAULT (''),
    [BASE_4] varchar(255) NOT NULL CONSTRAINT [DF_Product_Price_BASE_4] DEFAULT (''),
    [BASE_5] varchar(255) NOT NULL CONSTRAINT [DF_Product_Price_BASE_5] DEFAULT (''),
    [BASE_6] varchar(255) NOT NULL CONSTRAINT [DF_Product_Price_BASE_6] DEFAULT (''),
    [BASE_7] varchar(255) NOT NULL CONSTRAINT [DF_Product_Price_BASE_7] DEFAULT (''),
    [BASE_8] varchar(255) NOT NULL CONSTRAINT [DF_Product_Price_BASE_8] DEFAULT (''),
    [BASE_9] varchar(255) NOT NULL CONSTRAINT [DF_Product_Price_BASE_9] DEFAULT (''),
    [BASE_10] varchar(255) NOT NULL CONSTRAINT [DF_Product_Price_BASE_10] DEFAULT (''),
    [BASE_11] varchar(255) NOT NULL CONSTRAINT [DF_Product_Price_BASE_11] DEFAULT (''),
    [BASE_12] varchar(255) NOT NULL CONSTRAINT [DF_Product_Price_BASE_12] DEFAULT (''),
    [BASE_13] varchar(255) NOT NULL CONSTRAINT [DF_Product_Price_BASE_13] DEFAULT (''),
    [BASE_14] varchar(255) NOT NULL CONSTRAINT [DF_Product_Price_BASE_14] DEFAULT (''),
    [BASE_15] varchar(255) NOT NULL CONSTRAINT [DF_Product_Price_BASE_15] DEFAULT (''),
    [BASE_16] varchar(255) NOT NULL CONSTRAINT [DF_Product_Price_BASE_16] DEFAULT (''),
    [BASE_17] varchar(255) NOT NULL CONSTRAINT [DF_Product_Price_BASE_17] DEFAULT (''),
    [BASE_18] varchar(255) NOT NULL CONSTRAINT [DF_Product_Price_BASE_18] DEFAULT (''),
    [BASE_19] varchar(255) NOT NULL CONSTRAINT [DF_Product_Price_BASE_19] DEFAULT (''),
    [BASE_20] varchar(255) NOT NULL CONSTRAINT [DF_Product_Price_BASE_20] DEFAULT (''),
    [COMPLIMENTARY] bit NOT NULL CONSTRAINT [DF_Product_Price_COMPLIMENTARY] DEFAULT (0),
    [INCOME_ACCOUNT] varchar(50) NOT NULL CONSTRAINT [DF_Product_Price_INCOME_ACCOUNT] DEFAULT (''),
    [FIELD_TYPE] tinyint NOT NULL CONSTRAINT [DF_Product_Price_FIELD_TYPE] DEFAULT (0),
    [SOURCE_FIELD] text NULL,
    [STEPS_IN_USE] tinyint NOT NULL CONSTRAINT [DF_Product_Price_STEPS_IN_USE] DEFAULT (0),
    [DESCRIPTION] varchar(40) NOT NULL CONSTRAINT [DF_Product_Price_DESCRIPTION] DEFAULT (''),
    [DEFERRED_INCOME_ACCOUNT] varchar(50) NOT NULL CONSTRAINT [DF_Product_Price_DEFERRED_INCOME_ACCOUNT] DEFAULT (''),
    [BASE_TYPE] tinyint NOT NULL CONSTRAINT [DF_Product_Price_BASE_TYPE] DEFAULT (0),
    [PRCNT_1] numeric(15, 5) NOT NULL CONSTRAINT [DF_Product_Price_PRCNT_1] DEFAULT (0),
    [PRCNT_2] numeric(15, 5) NOT NULL CONSTRAINT [DF_Product_Price_PRCNT_2] DEFAULT (0),
    [PRCNT_3] numeric(15, 5) NOT NULL CONSTRAINT [DF_Product_Price_PRCNT_3] DEFAULT (0),
    [PRCNT_4] numeric(15, 5) NOT NULL CONSTRAINT [DF_Product_Price_PRCNT_4] DEFAULT (0),
    [PRCNT_5] numeric(15, 5) NOT NULL CONSTRAINT [DF_Product_Price_PRCNT_5] DEFAULT (0),
    [PRCNT_6] numeric(15, 5) NOT NULL CONSTRAINT [DF_Product_Price_PRCNT_6] DEFAULT (0),
    [PRCNT_7] numeric(15, 5) NOT NULL CONSTRAINT [DF_Product_Price_PRCNT_7] DEFAULT (0),
    [PRCNT_8] numeric(15, 5) NOT NULL CONSTRAINT [DF_Product_Price_PRCNT_8] DEFAULT (0),
    [PRCNT_9] numeric(15, 5) NOT NULL CONSTRAINT [DF_Product_Price_PRCNT_9] DEFAULT (0),
    [PRCNT_10] numeric(15, 5) NOT NULL CONSTRAINT [DF_Product_Price_PRCNT_10] DEFAULT (0),
    [PRCNT_11] numeric(15, 5) NOT NULL CONSTRAINT [DF_Product_Price_PRCNT_11] DEFAULT (0),
    [PRCNT_12] numeric(15, 5) NOT NULL CONSTRAINT [DF_Product_Price_PRCNT_12] DEFAULT (0),
    [PRCNT_13] numeric(15, 5) NOT NULL CONSTRAINT [DF_Product_Price_PRCNT_13] DEFAULT (0),
    [PRCNT_14] numeric(15, 5) NOT NULL CONSTRAINT [DF_Product_Price_PRCNT_14] DEFAULT (0),
    [PRCNT_15] numeric(15, 5) NOT NULL CONSTRAINT [DF_Product_Price_PRCNT_15] DEFAULT (0),
    [PRCNT_16] numeric(15, 5) NOT NULL CONSTRAINT [DF_Product_Price_PRCNT_16] DEFAULT (0),
    [PRCNT_17] numeric(15, 5) NOT NULL CONSTRAINT [DF_Product_Price_PRCNT_17] DEFAULT (0),
    [PRCNT_18] numeric(15, 5) NOT NULL CONSTRAINT [DF_Product_Price_PRCNT_18] DEFAULT (0),
    [PRCNT_19] numeric(15, 5) NOT NULL CONSTRAINT [DF_Product_Price_PRCNT_19] DEFAULT (0),
    [PRCNT_20] numeric(15, 5) NOT NULL CONSTRAINT [DF_Product_Price_PRCNT_20] DEFAULT (0),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Product_Pub]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Product_Pub] (
    [PRODUCT_CODE] varchar(31) NOT NULL CONSTRAINT [DF_Product_Pub_PRODUCT_CODE] DEFAULT (''),
    [PUB_AUTHOR] varchar(100) NOT NULL CONSTRAINT [DF_Product_Pub_PUB_AUTHOR] DEFAULT (''),
    [PUBLISHER] varchar(100) NOT NULL CONSTRAINT [DF_Product_Pub_PUBLISHER] DEFAULT (''),
    [PUB_ISBN] varchar(100) NOT NULL CONSTRAINT [DF_Product_Pub_PUB_ISBN] DEFAULT (''),
    [PUB_FORMAT] varchar(100) NOT NULL CONSTRAINT [DF_Product_Pub_PUB_FORMAT] DEFAULT (''),
    [PUB_EDITION] varchar(100) NOT NULL CONSTRAINT [DF_Product_Pub_PUB_EDITION] DEFAULT (''),
    [PUB_PAGES] varchar(100) NOT NULL CONSTRAINT [DF_Product_Pub_PUB_PAGES] DEFAULT (''),
    [PUB_DATE] datetime NULL,
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Product_Sub]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Product_Sub] (
    [PRODUCT_CODE] varchar(31) NOT NULL CONSTRAINT [DF_Product_Sub_PRODUCT_CODE] DEFAULT (''),
    [LINE_NUMBER] int NOT NULL CONSTRAINT [DF_Product_Sub_LINE_NUMBER] DEFAULT (0),
    [CHILD_PRODUCT_CODE] varchar(31) NOT NULL CONSTRAINT [DF_Product_Sub_CHILD_PRODUCT_CODE] DEFAULT (''),
    [REQUIRED] bit NOT NULL CONSTRAINT [DF_Product_Sub_REQUIRED] DEFAULT (0),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Product_Substitute]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Product_Substitute] (
    [PRODUCT_CODE] varchar(15) NOT NULL CONSTRAINT [DF_Product_Substitute_PRODUCT_CODE] DEFAULT (''),
    [SUB_PRODUCT_CODE] varchar(15) NOT NULL CONSTRAINT [DF_Product_Substitute_SUB_PRODUCT_CODE] DEFAULT (''),
    [SUBSTITUTE_TYPE] varchar(1) NOT NULL CONSTRAINT [DF_Product_Substitute_SUBSTITUTE_TYPE] DEFAULT (''),
    [SEQN] int NOT NULL CONSTRAINT [DF_Product_Substitute_SEQN] DEFAULT (0),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Product_Tax]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Product_Tax] (
    [PRODUCT_CODE] varchar(31) NOT NULL CONSTRAINT [DF_Product_Tax_PRODUCT_CODE] DEFAULT (''),
    [TAX_RATE] numeric(15, 4) NOT NULL CONSTRAINT [DF_Product_Tax_TAX_RATE] DEFAULT (0),
    [OTHER_AUTHORITY_1] varchar(15) NOT NULL CONSTRAINT [DF_Product_Tax_OTHER_AUTHORITY_1] DEFAULT (''),
    [OTHER_AUTHORITY_2] varchar(15) NOT NULL CONSTRAINT [DF_Product_Tax_OTHER_AUTHORITY_2] DEFAULT (''),
    [TAX_AUTHORITY_1] bit NOT NULL CONSTRAINT [DF_Product_Tax_TAX_AUTHORITY_1] DEFAULT (0),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Product_Trans]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Product_Trans] (
    [PTRANS_NUMBER] int NOT NULL CONSTRAINT [DF_Product_Trans_PTRANS_NUMBER] DEFAULT (0),
    [TRANSACTION_TYPE] varchar(10) NOT NULL CONSTRAINT [DF_Product_Trans_TRANSACTION_TYPE] DEFAULT (''),
    [ENTERED_DATE] datetime NULL,
    [ENTERED_BY] varchar(60) NOT NULL CONSTRAINT [DF_Product_Trans_ENTERED_BY] DEFAULT (''),
    [DESCRIPTION] varchar(100) NOT NULL CONSTRAINT [DF_Product_Trans_DESCRIPTION] DEFAULT (''),
    [PRODUCT_CODE] varchar(31) NOT NULL CONSTRAINT [DF_Product_Trans_PRODUCT_CODE] DEFAULT (''),
    [QUANTITY] float NOT NULL CONSTRAINT [DF_Product_Trans_QUANTITY] DEFAULT (0),
    [UNIT_COST] numeric(15, 2) NOT NULL CONSTRAINT [DF_Product_Trans_UNIT_COST] DEFAULT (0),
    [MODIFIED_DATE] datetime NULL,
    [MODIFIED_BY] varchar(60) NOT NULL CONSTRAINT [DF_Product_Trans_MODIFIED_BY] DEFAULT (''),
    [TOTAL_AMOUNT] numeric(15, 2) NOT NULL CONSTRAINT [DF_Product_Trans_TOTAL_AMOUNT] DEFAULT (0),
    [PO_REFERENCE_NUMBER] varchar(15) NOT NULL CONSTRAINT [DF_Product_Trans_PO_REFERENCE_NUMBER] DEFAULT (''),
    [TRANSACTION_DATE] datetime NULL,
    [TRANS_GROUP_NUMBER] int NOT NULL CONSTRAINT [DF_Product_Trans_TRANS_GROUP_NUMBER] DEFAULT (0),
    [POSTED] bit NOT NULL CONSTRAINT [DF_Product_Trans_POSTED] DEFAULT (0),
    [FROM_LOCATION] varchar(10) NOT NULL CONSTRAINT [DF_Product_Trans_FROM_LOCATION] DEFAULT (''),
    [FROM_BIN] varchar(10) NOT NULL CONSTRAINT [DF_Product_Trans_FROM_BIN] DEFAULT (''),
    [TO_LOCATION] varchar(10) NOT NULL CONSTRAINT [DF_Product_Trans_TO_LOCATION] DEFAULT (''),
    [TO_BIN] varchar(10) NOT NULL CONSTRAINT [DF_Product_Trans_TO_BIN] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Product_Type]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Product_Type] (
    [PROD_TYPE] varchar(10) NOT NULL CONSTRAINT [DF_Product_Type_PROD_TYPE] DEFAULT (''),
    [DESCRIPTION] varchar(40) NOT NULL CONSTRAINT [DF_Product_Type_DESCRIPTION] DEFAULT (''),
    [SALES_ITEM] bit NOT NULL CONSTRAINT [DF_Product_Type_SALES_ITEM] DEFAULT (0),
    [DUES_SUB_ITEM] bit NOT NULL CONSTRAINT [DF_Product_Type_DUES_SUB_ITEM] DEFAULT (0),
    [PROFILE_SORT] int NOT NULL CONSTRAINT [DF_Product_Type_PROFILE_SORT] DEFAULT (0),
    [SUBTYPE_PROMPT] varchar(15) NOT NULL CONSTRAINT [DF_Product_Type_SUBTYPE_PROMPT] DEFAULT (''),
    [DESCRIPTION_PROMPT] varchar(15) NOT NULL CONSTRAINT [DF_Product_Type_DESCRIPTION_PROMPT] DEFAULT (''),
    [EFF_DATE_PROMPT] varchar(15) NOT NULL CONSTRAINT [DF_Product_Type_EFF_DATE_PROMPT] DEFAULT (''),
    [THRU_DATE_PROMPT] varchar(15) NOT NULL CONSTRAINT [DF_Product_Type_THRU_DATE_PROMPT] DEFAULT (''),
    [SOURCE_PROMPT] varchar(15) NOT NULL CONSTRAINT [DF_Product_Type_SOURCE_PROMPT] DEFAULT (''),
    [AMOUNT_PROMPT] varchar(15) NOT NULL CONSTRAINT [DF_Product_Type_AMOUNT_PROMPT] DEFAULT (''),
    [TICKLER_PROMPT] varchar(15) NOT NULL CONSTRAINT [DF_Product_Type_TICKLER_PROMPT] DEFAULT (''),
    [ACTION_PROMPT] varchar(15) NOT NULL CONSTRAINT [DF_Product_Type_ACTION_PROMPT] DEFAULT (''),
    [CEU_TYPE_PROMPT] varchar(15) NOT NULL CONSTRAINT [DF_Product_Type_CEU_TYPE_PROMPT] DEFAULT (''),
    [UNITS_PROMPT] varchar(15) NOT NULL CONSTRAINT [DF_Product_Type_UNITS_PROMPT] DEFAULT (''),
    [USER_EDIT] bit NOT NULL CONSTRAINT [DF_Product_Type_USER_EDIT] DEFAULT (0),
    [RETAIN_MONTHS] int NOT NULL CONSTRAINT [DF_Product_Type_RETAIN_MONTHS] DEFAULT (0),
    [FOLLOW_UP_PROMPT] varchar(15) NOT NULL CONSTRAINT [DF_Product_Type_FOLLOW_UP_PROMPT] DEFAULT (''),
    [NOTE_PROMPT] varchar(15) NOT NULL CONSTRAINT [DF_Product_Type_NOTE_PROMPT] DEFAULT (''),
    [EXTENDED_DEMO] bit NOT NULL CONSTRAINT [DF_Product_Type_EXTENDED_DEMO] DEFAULT (0),
    [UF_1_PROMPT] varchar(15) NOT NULL CONSTRAINT [DF_Product_Type_UF_1_PROMPT] DEFAULT (''),
    [UF_2_PROMPT] varchar(15) NOT NULL CONSTRAINT [DF_Product_Type_UF_2_PROMPT] DEFAULT (''),
    [UF_3_PROMPT] varchar(15) NOT NULL CONSTRAINT [DF_Product_Type_UF_3_PROMPT] DEFAULT (''),
    [UF_4_PROMPT] varchar(15) NOT NULL CONSTRAINT [DF_Product_Type_UF_4_PROMPT] DEFAULT (''),
    [UF_5_PROMPT] varchar(15) NOT NULL CONSTRAINT [DF_Product_Type_UF_5_PROMPT] DEFAULT (''),
    [UF_6_PROMPT] varchar(15) NOT NULL CONSTRAINT [DF_Product_Type_UF_6_PROMPT] DEFAULT (''),
    [UF_7_PROMPT] varchar(15) NOT NULL CONSTRAINT [DF_Product_Type_UF_7_PROMPT] DEFAULT (''),
    [CO_ID_PROMPT] varchar(15) NOT NULL CONSTRAINT [DF_Product_Type_CO_ID_PROMPT] DEFAULT (''),
    [OTHER_CODE_PROMPT] varchar(15) NOT NULL CONSTRAINT [DF_Product_Type_OTHER_CODE_PROMPT] DEFAULT (''),
    [ACCESS_KEYWORDS] varchar(255) NOT NULL CONSTRAINT [DF_Product_Type_ACCESS_KEYWORDS] DEFAULT (''),
    [CREATE_HISTORY_TAB] bit NOT NULL CONSTRAINT [DF_Product_Type_CREATE_HISTORY_TAB] DEFAULT (0),
    [HISTORY_TAB_TITLE] varchar(30) NOT NULL CONSTRAINT [DF_Product_Type_HISTORY_TAB_TITLE] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[ProductStatusRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ProductStatusRef] (
    [ProductStatusCode] int NOT NULL,
    [ProductStatusDesc] nvarchar(50) NOT NULL,
    [ProductStatusName] nvarchar(20) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Program]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Program] (
    [ProgramKey] uniqueidentifier NOT NULL,
    [ProgramName] nvarchar(50) NOT NULL,
    [UserDefinedExperiencesFlag] bit NOT NULL,
    [ExperienceUnitKey] uniqueidentifier NULL,
    [MinimumValue] decimal(18, 0) NULL,
    [MaximumValue] decimal(18, 0) NULL,
    [ProgramDescr] nvarchar(250) NULL,
    [ProgramStatusCode] nchar(2) NULL,
    [CreatedOn] datetime NOT NULL,
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [UpdatedOn] datetime NOT NULL,
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [RequiresApprovalFlag] bit NOT NULL CONSTRAINT [DF_Program_RequiresApprovalFlag] DEFAULT ('0'),
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[ProgramGroup]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ProgramGroup] (
    [ProgramGroupKey] uniqueidentifier NOT NULL,
    [ProgramGroupName] nchar(255) NOT NULL,
    [ProgramGroupDescription] nchar(1023) NULL,
    [ProgramGroupStatusCode] nchar(2) NOT NULL,
    [CreatedOn] datetime NOT NULL,
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [UpdatedOn] datetime NOT NULL,
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[ProgramGroupStatusRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ProgramGroupStatusRef] (
    [ProgramGroupStatusCode] nchar(2) NOT NULL,
    [ProgramGroupStatusName] nvarchar(50) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[ProgramStatusRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ProgramStatusRef] (
    [ProgramStatusCode] nchar(2) NOT NULL,
    [ProgramStatusName] nvarchar(50) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[PromotionRuleRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[PromotionRuleRef] (
    [PromotionRuleCode] int NOT NULL,
    [PromotionRuleDesc] nvarchar(50) NOT NULL,
    [PromotionRuleName] nvarchar(15) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[PropertyDefinition]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[PropertyDefinition] (
    [PropertyDefinitionKey] uniqueidentifier NOT NULL,
    [Label] nvarchar(255) NOT NULL,
    [DataTypeCode] int NOT NULL,
    [MaxLength] int NULL,
    [Scale] int NULL,
    [HIControlTypeCode] int NOT NULL,
    [HIControlHeight] int NULL,
    [HIControlWidth] int NULL,
    [DisplayMask] nvarchar(100) NULL,
    [ValueList] ntext NULL,
    [ValueListQueryDocumentVersionKey] uniqueidentifier NULL,
    [ValueListQueryFolder] nvarchar(2048) NULL,
    [ValueListQueryDisplayColumn] nvarchar(128) NULL,
    [ValueListQueryPersistColumn] nvarchar(128) NULL,
    [HIControlRepeatColumns] int NULL,
    [HIControlRepeatDirection] int NULL,
    [AllowMultiSelectFlag] bit NULL,
    [IsRequired] bit NULL,
    [ForeignObjectDocumentVersionKey] uniqueidentifier NULL,
    [DefaultValue] nvarchar(100) NULL,
    [UseFinder] bit NOT NULL CONSTRAINT [DF_PropertyDefinition_UseFinder] DEFAULT (0)
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Prospect]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Prospect] (
    [ProspectKey] uniqueidentifier NOT NULL CONSTRAINT [DF_Prospect_ProspectKey] DEFAULT (newid()),
    [Prefix] nvarchar(25) NULL CONSTRAINT [DF_Prospect_Prefix] DEFAULT (''),
    [FirstName] nvarchar(20) NOT NULL CONSTRAINT [DF_Prospect_FirstName] DEFAULT (''),
    [MiddleName] nvarchar(20) NOT NULL CONSTRAINT [DF_Prospect_MiddleName] DEFAULT (''),
    [LastName] nvarchar(30) NOT NULL CONSTRAINT [DF_Prospect_LastName] DEFAULT (''),
    [Suffix] nvarchar(10) NOT NULL CONSTRAINT [DF_Prospect_Suffix] DEFAULT (''),
    [FullName] nvarchar(80) NOT NULL CONSTRAINT [DF_Prospect_FullName] DEFAULT (''),
    [Title] nvarchar(80) NOT NULL CONSTRAINT [DF_Prospect_Title] DEFAULT (''),
    [Organization] nvarchar(80) NOT NULL CONSTRAINT [DF_Prospect_Organization] DEFAULT (''),
    [Address1] nvarchar(40) NOT NULL CONSTRAINT [DF_Prospect_Address1] DEFAULT (''),
    [Address2] nvarchar(40) NOT NULL CONSTRAINT [DF_Prospect_Address2] DEFAULT (''),
    [Address3] nvarchar(40) NOT NULL CONSTRAINT [DF_Prospect_Address3] DEFAULT (''),
    [City] nvarchar(40) NOT NULL CONSTRAINT [DF_Prospect_City] DEFAULT (''),
    [StateProvince] nvarchar(15) NOT NULL CONSTRAINT [DF_Prospect_StateProvince] DEFAULT (''),
    [PostalCode] nvarchar(10) NOT NULL CONSTRAINT [DF_Prospect_PostalCode] DEFAULT (''),
    [Country] nvarchar(25) NOT NULL CONSTRAINT [DF_Prospect_Country] DEFAULT (''),
    [HomePhone] nvarchar(25) NOT NULL CONSTRAINT [DF_Prospect_HomePhone] DEFAULT (''),
    [WorkPhone] nvarchar(25) NOT NULL CONSTRAINT [DF_Prospect_WorkPhone] DEFAULT (''),
    [Fax] nvarchar(25) NOT NULL CONSTRAINT [DF_Prospect_Fax] DEFAULT (''),
    [Email] nvarchar(100) NOT NULL CONSTRAINT [DF_Prospect_Email] DEFAULT (''),
    [ImisID] nvarchar(10) NOT NULL CONSTRAINT [DF_Prospect_ImisID] DEFAULT (''),
    [ProspectID] nvarchar(15) NOT NULL CONSTRAINT [DF_Prospect_ProspectID] DEFAULT (''),
    [ListCode] nvarchar(20) NOT NULL CONSTRAINT [DF_Prospect_ListCode] DEFAULT (''),
    [ImportDate] datetime NULL,
    [LastFirst] nvarchar(30) NOT NULL CONSTRAINT [DF_Prospect_LastFirst] DEFAULT (''),
    [CompanySort] nvarchar(30) NOT NULL CONSTRAINT [DF_Prospect_CompanySort] DEFAULT (''),
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Publish_Message_Log]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Publish_Message_Log] (
    [PublishMessageLogID] numeric(18, 0) IDENTITY(1,1) NOT NULL,
    [PublishRequestID] int NOT NULL CONSTRAINT [DF_Publish_Message_Log_PublishRequestID] DEFAULT (0),
    [PublishRequestDetailID] int NULL,
    [MessageNumber] int NULL,
    [MessageText] varchar(2000) NOT NULL,
    [MessageDateTime] datetime NOT NULL,
    [Location] varchar(100) NOT NULL,
    [PublishServerCode] char(1) NULL,
    [DisplayFlag] char(1) NOT NULL CONSTRAINT [DF_Publish_Message_Log_DisplayFlag] DEFAULT ('Y')
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Publish_Priority_Ref]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Publish_Priority_Ref] (
    [PublishPriorityCode] smallint NOT NULL,
    [PublishPriorityDesc] varchar(10) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Publish_Request]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Publish_Request] (
    [PublishRequestID] int IDENTITY(1,1) NOT NULL,
    [ContactID] numeric(18, 0) NOT NULL,
    [NavMenuID] numeric(18, 0) NULL,
    [RequestDateTime] datetime NOT NULL,
    [PublishedDateTime] datetime NULL,
    [PublishPriorityCode] smallint NOT NULL CONSTRAINT [DF_Publish_Request_PublishPriorityCode] DEFAULT (5)
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Publish_Request_Detail]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Publish_Request_Detail] (
    [PublishRequestDetailID] int IDENTITY(1,1) NOT NULL,
    [PublishRequestID] int NOT NULL,
    [ContentID] numeric(18, 0) NOT NULL,
    [PublishRegenerateInd] char(1) NOT NULL CONSTRAINT [DF_Publish_Request_Detail_PublishRegenerateInd] DEFAULT ('P'),
    [PublishServerCode] char(1) NOT NULL,
    [Frequency] int NOT NULL,
    [PublishedDateTime] datetime NULL,
    [WebsiteKey] uniqueidentifier NULL,
    [DeleteFlag] char(1) NULL CONSTRAINT [DF_Publish_Request_Detail_DeleteFlag] DEFAULT ('N'),
    [PublishRequestStatusCode] char(1) NOT NULL CONSTRAINT [DF_Publish_Request_Detail_PublishRequestStatusCode] DEFAULT ('N'),
    [NumOfAttempts] int NOT NULL CONSTRAINT [DF_Publish_Request_Detail_NumOfAttempts] DEFAULT (0)
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Publish_Request_Status_Ref]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Publish_Request_Status_Ref] (
    [PublishRequestStatusCode] char(1) NOT NULL,
    [PublishRequestStatusDesc] varchar(10) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Publish_Server_Ref]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Publish_Server_Ref] (
    [PublishServerCode] char(1) NOT NULL,
    [PublishServerDesc] varchar(50) NOT NULL,
    [SourceRootLocation] varchar(255) NOT NULL,
    [Frequency] int NOT NULL,
    [PublishingSpeed] int NOT NULL,
    [ServerIPAddress] varchar(15) NOT NULL,
    [PollRequestInd] char(1) NOT NULL,
    [IISSecurityUserName] varchar(30) NULL,
    [IISSecurityPassword] varchar(30) NULL,
    [IISSecurityDomain] varchar(30) NULL,
    [DefaultFlag] char(1) NOT NULL CONSTRAINT [DF_Publish_Server_Ref_DefaultFlag] DEFAULT ('N')
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[PublishMessageLog]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[PublishMessageLog] (
    [PublishMessageLogKey] uniqueidentifier NOT NULL,
    [PublishRequestKey] uniqueidentifier NOT NULL,
    [PublishRequestDetailKey] uniqueidentifier NULL,
    [PublishServerCode] nchar(1) NULL,
    [MessageNumber] int NULL,
    [MessageText] nvarchar(2000) NOT NULL,
    [MessageDateTime] datetime NOT NULL,
    [Location] nvarchar(100) NOT NULL,
    [DisplayFlag] bit NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[PublishPriorityRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[PublishPriorityRef] (
    [PublishPriorityCode] int NOT NULL,
    [PublishPriorityDesc] nvarchar(50) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[PublishQueue]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[PublishQueue] (
    [Id] bigint IDENTITY(1,1) NOT NULL,
    [PublishedOn] datetime NOT NULL,
    [PublishedByUserKey] uniqueidentifier NULL,
    [Status] int NOT NULL,
    [Type] int NOT NULL,
    [ProcessedOn] datetime NULL,
    [MinDate] datetime NULL,
    [MaxDate] datetime NULL,
    [ItemCode] varchar(32) NULL,
    [ItemAction] int NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[PublishRequest]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[PublishRequest] (
    [PublishRequestKey] uniqueidentifier NOT NULL,
    [PublishPriorityCode] int NOT NULL,
    [DocumentKey] uniqueidentifier NULL,
    [RequestDateTime] datetime NOT NULL,
    [UserKey] uniqueidentifier NOT NULL,
    [PublishedDateTime] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[PublishRequestDetail]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[PublishRequestDetail] (
    [PublishRequestDetailKey] uniqueidentifier NOT NULL,
    [PublishRequestKey] uniqueidentifier NOT NULL,
    [PublishRequestStatusCode] int NOT NULL,
    [PublishServerCode] nchar(1) NOT NULL,
    [Frequency] int NOT NULL,
    [IsRegenerate] bit NOT NULL,
    [IsDelete] bit NOT NULL,
    [NumOfAttempts] int NOT NULL,
    [PublishedDateTime] datetime NULL,
    [ContentDocumentKey] uniqueidentifier NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[PublishRequestStatusRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[PublishRequestStatusRef] (
    [PublishRequestStatusCode] int NOT NULL,
    [PublishRequestStatusName] nvarchar(30) NOT NULL,
    [PublishRequestStatusDesc] nvarchar(30) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[PublishServerRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[PublishServerRef] (
    [PublishServerCode] nchar(1) NOT NULL,
    [PublishServerDesc] nvarchar(50) NOT NULL,
    [Frequency] int NOT NULL,
    [PublishingSpeed] int NOT NULL,
    [ServerIPAddress] nvarchar(15) NULL,
    [AlternateServerIPAddress] nvarchar(15) NULL,
    [UseServiceRequest] bit NOT NULL,
    [IISSecurityDomain] nvarchar(30) NULL,
    [IISSecurityUserName] nvarchar(30) NULL,
    [IISSecurityPassword] nvarchar(30) NULL,
    [IsDefault] bit NOT NULL,
    [LocalPublishPath] nvarchar(512) NOT NULL,
    [LocalProtectedPath] nvarchar(512) NOT NULL,
    [CreatedOn] datetime NOT NULL,
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [UpdatedOn] datetime NOT NULL,
    [UpdatedByUserKey] uniqueidentifier NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Purge_Ctrl_ie]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Purge_Ctrl_ie] (
    [ID] varchar(10) NOT NULL CONSTRAINT [DF_Purge_Ctrl_ie_ID] DEFAULT (''),
    [STATUS] varchar(5) NOT NULL CONSTRAINT [DF_Purge_Ctrl_ie_STATUS] DEFAULT (''),
    [CERT_REGISTER_BTID] bit NOT NULL CONSTRAINT [DF_Purge_Ctrl_ie_CERT_REGISTER_BTID] DEFAULT (0),
    [INVOICE_BALANCE] bit NOT NULL CONSTRAINT [DF_Purge_Ctrl_ie_INVOICE_BALANCE] DEFAULT (0),
    [NAME_BT_COID] bit NOT NULL CONSTRAINT [DF_Purge_Ctrl_ie_NAME_BT_COID] DEFAULT (0),
    [NAME_FIN_BTID] bit NOT NULL CONSTRAINT [DF_Purge_Ctrl_ie_NAME_FIN_BTID] DEFAULT (0),
    [OPEN_ORDERS] bit NOT NULL CONSTRAINT [DF_Purge_Ctrl_ie_OPEN_ORDERS] DEFAULT (0),
    [REFERRAL_ORPHAN] bit NOT NULL CONSTRAINT [DF_Purge_Ctrl_ie_REFERRAL_ORPHAN] DEFAULT (0),
    [SUBSCRIPTION] bit NOT NULL CONSTRAINT [DF_Purge_Ctrl_ie_SUBSCRIPTION] DEFAULT (0),
    [OPP_PROSPECT] bit NOT NULL CONSTRAINT [DF_Purge_Ctrl_ie_OPP_PROSPECT] DEFAULT (0)
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[QualityRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[QualityRef] (
    [QualityCode] nvarchar(20) NOT NULL,
    [QualityDesc] nvarchar(50) NOT NULL,
    [QualityName] nvarchar(20) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[QueryResultItem]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[QueryResultItem] (
    [QueryResultKey] uniqueidentifier NOT NULL,
    [AnyKey] nvarchar(50) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[QueryResultMain]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[QueryResultMain] (
    [QueryResultKey] uniqueidentifier NOT NULL CONSTRAINT [DF_QueryResultMain_QueryResultKey] DEFAULT (newid()),
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedOn] datetime NOT NULL CONSTRAINT [DF_QueryResultMain_CreatedOn] DEFAULT (getdate())
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Receipt]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Receipt] (
    [ID] int NOT NULL CONSTRAINT [DF_Receipt_ID] DEFAULT (0),
    [Auto_Receipt_Num] int NOT NULL CONSTRAINT [DF_Receipt_Auto_Receipt_Num] DEFAULT (0),
    [Name_ID] varchar(10) NOT NULL CONSTRAINT [DF_Receipt_Name_ID] DEFAULT (''),
    [Batch_Num] varchar(15) NOT NULL CONSTRAINT [DF_Receipt_Batch_Num] DEFAULT (''),
    [Canceled_Receipt_ID] int NOT NULL CONSTRAINT [DF_Receipt_Canceled_Receipt_ID] DEFAULT (0),
    [Canceled] tinyint NOT NULL CONSTRAINT [DF_Receipt_Canceled] DEFAULT (0),
    [Date_Issued] datetime NULL,
    [Note] varchar(30) NOT NULL CONSTRAINT [DF_Receipt_Note] DEFAULT (''),
    [Manual_Receipt_Num] varchar(10) NOT NULL CONSTRAINT [DF_Receipt_Manual_Receipt_Num] DEFAULT (''),
    [Aggregate_Indicator] tinyint NOT NULL CONSTRAINT [DF_Receipt_Aggregate_Indicator] DEFAULT (0),
    [Amount] numeric(15, 2) NOT NULL CONSTRAINT [DF_Receipt_Amount] DEFAULT (0),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[ReceiptLine]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ReceiptLine] (
    [ReceiptLineKey] uniqueidentifier NOT NULL,
    [ReceiptKey] uniqueidentifier NOT NULL,
    [ReceiptedAmount] decimal(18, 4) NOT NULL,
    [PaymentKey] uniqueidentifier NOT NULL,
    [LineNumber] int NOT NULL,
    [LineDescription] nvarchar(200) NULL,
    [ProductKey] uniqueidentifier NOT NULL,
    [SourceReceiptLineKey] uniqueidentifier NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[ReceiptMain]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ReceiptMain] (
    [ReceiptKey] uniqueidentifier NOT NULL,
    [ReceiptTypeKey] uniqueidentifier NOT NULL,
    [IsNumberAutoGenerated] bit NOT NULL,
    [ReceiptNumber] nvarchar(50) NOT NULL,
    [IssuedOn] datetime NULL,
    [Notes] nvarchar(200) NULL,
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [UpdatedOn] datetime NOT NULL,
    [AccessKey] uniqueidentifier NOT NULL,
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedOn] datetime NOT NULL,
    [SystemEntityKey] uniqueidentifier NOT NULL,
    [IssuedToContactKey] uniqueidentifier NOT NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[ReceiptTypeRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ReceiptTypeRef] (
    [ReceiptTypeKey] uniqueidentifier NOT NULL,
    [ReceiptTypeDesc] nvarchar(200) NOT NULL,
    [ReceiptTitle] nvarchar(200) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[RecurringDonationCommitment]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[RecurringDonationCommitment] (
    [RecurringDonationCommitmentKey] uniqueidentifier NOT NULL,
    [ContactKey] uniqueidentifier NOT NULL,
    [DonationAmount] decimal(18, 4) NOT NULL CONSTRAINT [DF_RecurringDonationCommitment_DonationAmount] DEFAULT (0),
    [RecurringDonationFrequencyCode] int NOT NULL,
    [PaymentMethod] varchar(10) NOT NULL,
    [Distribution] varchar(31) NOT NULL CONSTRAINT [DF_RecurringDonationCommitment_Distribution] DEFAULT (''),
    [Appeal] varchar(40) NOT NULL CONSTRAINT [DF_RecurringDonationCommitment_Appeal] DEFAULT (''),
    [Campaign] varchar(10) NOT NULL CONSTRAINT [DF_RecurringDonationCommitment_Campaign] DEFAULT (''),
    [Fund] varchar(10) NOT NULL CONSTRAINT [DF_RecurringDonationCommitment_Fund] DEFAULT (''),
    [StartDate] datetime NULL,
    [EndDate] datetime NULL,
    [CommitmentStatusInd] nvarchar(1) NOT NULL CONSTRAINT [DF_RecurringDonationCommitment_CommitmentStatusInd] DEFAULT ('A'),
    [CommitmentNotes] nvarchar(4000) NOT NULL CONSTRAINT [DF_RecurringDonationCommitment_CommitmentNotes] DEFAULT (''),
    [MatchReference] nvarchar(18) NOT NULL CONSTRAINT [DF_RecurringDonationCommitment_MatchReference] DEFAULT (''),
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedOn] datetime NOT NULL CONSTRAINT [DF_RecurringDonationCommitment_CreatedOn] DEFAULT (getdate()),
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [UpdatedOn] datetime NOT NULL CONSTRAINT [DF_RecurringDonationCommitment_UpdatedOn] DEFAULT (getdate()),
    [BranchSortCode] nvarchar(6) NOT NULL CONSTRAINT [DF_RecurringDonationCommitment_BranchSortCode] DEFAULT (''),
    [BankAccountNumber] nvarchar(8) NOT NULL CONSTRAINT [DF_RecurringDonationCommitment_BankAccountNumber] DEFAULT (''),
    [BankAccountName] nvarchar(18) NOT NULL CONSTRAINT [DF_RecurringDonationCommitment_BankAccountName] DEFAULT ('')
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[RecurringDonationExpectedPayment]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[RecurringDonationExpectedPayment] (
    [RecurringDonationExpectedPaymentKey] uniqueidentifier NOT NULL,
    [RecurringDonationExpectedPaymentSetKey] uniqueidentifier NOT NULL,
    [RecurringDonationCommitmentKey] uniqueidentifier NOT NULL,
    [OpportunityKey] uniqueidentifier NULL,
    [DonationAmount] decimal(18, 4) NOT NULL,
    [PaymentMethod] varchar(10) NOT NULL,
    [Distribution] varchar(31) NOT NULL,
    [Appeal] varchar(40) NOT NULL,
    [Campaign] varchar(10) NOT NULL,
    [Fund] varchar(10) NOT NULL,
    [Narrative] nvarchar(200) NULL CONSTRAINT [DF_RecurringDonationExpectedPayment_Narrative] DEFAULT (''),
    [MatchReference] nvarchar(18) NOT NULL,
    [BranchSortCode] nvarchar(6) NOT NULL,
    [BankAccountNumber] nvarchar(8) NOT NULL,
    [BankAccountName] nvarchar(18) NOT NULL,
    [ResultingTransNum] int NOT NULL CONSTRAINT [DF_RecurringDonationExpectedPayment_ResultingTransNum] DEFAULT (0),
    [ResultingTransLineNum] int NOT NULL CONSTRAINT [DF_RecurringDonationExpectedPayment_ResultingTransLineNum] DEFAULT (0),
    [RecurringDonationExpectedPaymentStatusCode] smallint NOT NULL,
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedOn] datetime NOT NULL CONSTRAINT [DF_RecurringDonationExpectedPayment_CreatedOn] DEFAULT (getdate()),
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [UpdatedOn] datetime NOT NULL CONSTRAINT [DF_RecurringDonationExpectedPayment_UpdatedOn] DEFAULT (getdate())
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[RecurringDonationExpectedPaymentSet]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[RecurringDonationExpectedPaymentSet] (
    [RecurringDonationExpectedPaymentSetKey] uniqueidentifier NOT NULL,
    [ExpectedPaymentDate] datetime NULL,
    [RecurringDonationExpectedPaymentSetStatusCode] smallint NOT NULL,
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedOn] datetime NOT NULL CONSTRAINT [DF_RecurringDonationExpectedPaymentSet_CreatedOn] DEFAULT (getdate()),
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [UpdatedOn] datetime NOT NULL CONSTRAINT [DF_RecurringDonationExpectedPaymentSet_UpdatedOn] DEFAULT (getdate())
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[RecurringDonationExpectedPaymentSetStatusRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[RecurringDonationExpectedPaymentSetStatusRef] (
    [RecurringDonationExpectedPaymentSetStatusCode] smallint NOT NULL,
    [RecurringDonationExpectedPaymentSetStatusName] nvarchar(40) NOT NULL,
    [RecurringDonationExpectedPaymentSetStatusDesc] nvarchar(50) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[RecurringDonationExpectedPaymentStatusRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[RecurringDonationExpectedPaymentStatusRef] (
    [RecurringDonationExpectedPaymentStatusCode] smallint NOT NULL,
    [RecurringDonationExpectedPaymentStatusName] nvarchar(40) NOT NULL,
    [RecurringDonationExpectedPaymentStatusDesc] nvarchar(50) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[RecurringDonationFrequencyRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[RecurringDonationFrequencyRef] (
    [RecurringDonationFrequencyCode] int NOT NULL,
    [Description] nvarchar(50) NOT NULL,
    [RecurringDonationFrequencyName] nvarchar(20) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[RecurringDonationMatchStatusRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[RecurringDonationMatchStatusRef] (
    [RecurringDonationMatchStatusCode] smallint NOT NULL,
    [RecurringDonationMatchStatusName] nvarchar(40) NOT NULL,
    [RecurringDonationMatchStatusDesc] nvarchar(50) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Ref_Client]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Ref_Client] (
    [CLIENT_ID] varchar(10) NOT NULL CONSTRAINT [DF_Ref_Client_CLIENT_ID] DEFAULT (''),
    [FIRST_NAME] varchar(20) NOT NULL CONSTRAINT [DF_Ref_Client_FIRST_NAME] DEFAULT (''),
    [MIDDLE_NAME] varchar(20) NOT NULL CONSTRAINT [DF_Ref_Client_MIDDLE_NAME] DEFAULT (''),
    [LAST_NAME] varchar(30) NOT NULL CONSTRAINT [DF_Ref_Client_LAST_NAME] DEFAULT (''),
    [LAST_FIRST] varchar(30) NOT NULL CONSTRAINT [DF_Ref_Client_LAST_FIRST] DEFAULT (''),
    [COMPANY] varchar(40) NOT NULL CONSTRAINT [DF_Ref_Client_COMPANY] DEFAULT (''),
    [ADDRESS_1] varchar(40) NOT NULL CONSTRAINT [DF_Ref_Client_ADDRESS_1] DEFAULT (''),
    [ADDRESS_2] varchar(40) NOT NULL CONSTRAINT [DF_Ref_Client_ADDRESS_2] DEFAULT (''),
    [CITY] varchar(40) NOT NULL CONSTRAINT [DF_Ref_Client_CITY] DEFAULT (''),
    [STATE] varchar(15) NOT NULL CONSTRAINT [DF_Ref_Client_STATE] DEFAULT (''),
    [ZIP] varchar(10) NOT NULL CONSTRAINT [DF_Ref_Client_ZIP] DEFAULT (''),
    [COUNTY] varchar(30) NOT NULL CONSTRAINT [DF_Ref_Client_COUNTY] DEFAULT (''),
    [COUNTRY] varchar(25) NOT NULL CONSTRAINT [DF_Ref_Client_COUNTRY] DEFAULT (''),
    [PHONE] varchar(25) NOT NULL CONSTRAINT [DF_Ref_Client_PHONE] DEFAULT (''),
    [FAX] varchar(25) NOT NULL CONSTRAINT [DF_Ref_Client_FAX] DEFAULT (''),
    [DATE_CREATED] datetime NULL,
    [DATE_UPDATED] datetime NULL,
    [NOTE] varchar(255) NOT NULL CONSTRAINT [DF_Ref_Client_NOTE] DEFAULT (''),
    [CLIENT_TYPE] varchar(30) NOT NULL CONSTRAINT [DF_Ref_Client_CLIENT_TYPE] DEFAULT (''),
    [EMAIL] varchar(100) NOT NULL CONSTRAINT [DF_Ref_Client_EMAIL] DEFAULT (''),
    [ADDRESS_3] varchar(40) NOT NULL CONSTRAINT [DF_Ref_Client_ADDRESS_3] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Ref_Provider]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Ref_Provider] (
    [PROVIDER_ID] varchar(10) NOT NULL CONSTRAINT [DF_Ref_Provider_PROVIDER_ID] DEFAULT (''),
    [LAST_FIRST] varchar(30) NOT NULL CONSTRAINT [DF_Ref_Provider_LAST_FIRST] DEFAULT (''),
    [COMPANY] varchar(80) NOT NULL CONSTRAINT [DF_Ref_Provider_COMPANY] DEFAULT (''),
    [ZIP] varchar(10) NOT NULL CONSTRAINT [DF_Ref_Provider_ZIP] DEFAULT (''),
    [INDEX_1] varchar(255) NOT NULL CONSTRAINT [DF_Ref_Provider_INDEX_1] DEFAULT (''),
    [INDEX_2] varchar(255) NOT NULL CONSTRAINT [DF_Ref_Provider_INDEX_2] DEFAULT (''),
    [INDEX_3] varchar(255) NOT NULL CONSTRAINT [DF_Ref_Provider_INDEX_3] DEFAULT (''),
    [INDEX_4] varchar(255) NOT NULL CONSTRAINT [DF_Ref_Provider_INDEX_4] DEFAULT (''),
    [INDEX_5] varchar(255) NOT NULL CONSTRAINT [DF_Ref_Provider_INDEX_5] DEFAULT (''),
    [INDEX_6] varchar(255) NOT NULL CONSTRAINT [DF_Ref_Provider_INDEX_6] DEFAULT (''),
    [LAST_REFERRED] datetime NULL,
    [REFERRAL_COUNT] int NOT NULL CONSTRAINT [DF_Ref_Provider_REFERRAL_COUNT] DEFAULT (0),
    [STATUS] varchar(5) NOT NULL CONSTRAINT [DF_Ref_Provider_STATUS] DEFAULT (''),
    [PHONE] varchar(25) NOT NULL CONSTRAINT [DF_Ref_Provider_PHONE] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Ref_Table_Ref]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Ref_Table_Ref] (
    [RefTableName] varchar(30) NOT NULL,
    [ComponentCode] char(2) NOT NULL,
    [EditFilePath] varchar(255) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Referral]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Referral] (
    [REFERRAL_ID] varchar(10) NOT NULL CONSTRAINT [DF_Referral_REFERRAL_ID] DEFAULT (''),
    [CLIENT_ID] varchar(10) NOT NULL CONSTRAINT [DF_Referral_CLIENT_ID] DEFAULT (''),
    [PROVIDER_ID] varchar(10) NOT NULL CONSTRAINT [DF_Referral_PROVIDER_ID] DEFAULT (''),
    [IS_REFERRAL] bit NOT NULL CONSTRAINT [DF_Referral_IS_REFERRAL] DEFAULT (0),
    [NO_SHOW] bit NOT NULL CONSTRAINT [DF_Referral_NO_SHOW] DEFAULT (0),
    [REFERRAL_FEE] numeric(15, 2) NOT NULL CONSTRAINT [DF_Referral_REFERRAL_FEE] DEFAULT (0),
    [ORDER_NUMBER] numeric(15, 2) NOT NULL CONSTRAINT [DF_Referral_ORDER_NUMBER] DEFAULT (0),
    [READY_TO_INVOICE] bit NOT NULL CONSTRAINT [DF_Referral_READY_TO_INVOICE] DEFAULT (0),
    [ZIP] varchar(10) NOT NULL CONSTRAINT [DF_Referral_ZIP] DEFAULT (''),
    [SEARCH_1] varchar(100) NOT NULL CONSTRAINT [DF_Referral_SEARCH_1] DEFAULT (''),
    [SEARCH_2] varchar(100) NOT NULL CONSTRAINT [DF_Referral_SEARCH_2] DEFAULT (''),
    [SEARCH_3] varchar(100) NOT NULL CONSTRAINT [DF_Referral_SEARCH_3] DEFAULT (''),
    [SEARCH_4] varchar(100) NOT NULL CONSTRAINT [DF_Referral_SEARCH_4] DEFAULT (''),
    [SEARCH_5] varchar(100) NOT NULL CONSTRAINT [DF_Referral_SEARCH_5] DEFAULT (''),
    [SEARCH_6] varchar(100) NOT NULL CONSTRAINT [DF_Referral_SEARCH_6] DEFAULT (''),
    [GEN_TABLE_1_CHOICE] varchar(60) NOT NULL CONSTRAINT [DF_Referral_GEN_TABLE_1_CHOICE] DEFAULT (''),
    [GEN_TABLE_2_CHOICE] varchar(60) NOT NULL CONSTRAINT [DF_Referral_GEN_TABLE_2_CHOICE] DEFAULT (''),
    [GEN_TABLE_3_CHOICE] varchar(60) NOT NULL CONSTRAINT [DF_Referral_GEN_TABLE_3_CHOICE] DEFAULT (''),
    [GEN_TABLE_4_CHOICE] varchar(60) NOT NULL CONSTRAINT [DF_Referral_GEN_TABLE_4_CHOICE] DEFAULT (''),
    [UPDATED_BY] varchar(60) NOT NULL CONSTRAINT [DF_Referral_UPDATED_BY] DEFAULT (''),
    [DATE_CREATED] datetime NULL,
    [DATE_UPDATED] datetime NULL,
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[RegistrationStatusChange]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[RegistrationStatusChange] (
    [RegistrationStatusChangeKey] uniqueidentifier NOT NULL,
    [CertificationProgramRegistrationKey] uniqueidentifier NOT NULL,
    [RegistrationStatusCode] char(2) NOT NULL,
    [RegistrationStatusChangeNote] nvarchar(250) NULL,
    [StatusChangedOn] datetime NOT NULL,
    [UpdatedOn] datetime NOT NULL,
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedOn] datetime NOT NULL,
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [StatusChangedContactKey] uniqueidentifier NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[RegistrationStatusRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[RegistrationStatusRef] (
    [RegistrationStatusCode] char(2) NOT NULL,
    [RegistrationStatusName] nvarchar(50) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Relationship]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Relationship] (
    [ID] varchar(10) NOT NULL CONSTRAINT [DF_Relationship_ID] DEFAULT (''),
    [RELATION_TYPE] varchar(10) NOT NULL CONSTRAINT [DF_Relationship_RELATION_TYPE] DEFAULT (''),
    [TARGET_ID] varchar(10) NOT NULL CONSTRAINT [DF_Relationship_TARGET_ID] DEFAULT (''),
    [TARGET_NAME] varchar(60) NOT NULL CONSTRAINT [DF_Relationship_TARGET_NAME] DEFAULT (''),
    [TARGET_RELATION_TYPE] varchar(10) NOT NULL CONSTRAINT [DF_Relationship_TARGET_RELATION_TYPE] DEFAULT (''),
    [TITLE] varchar(80) NOT NULL CONSTRAINT [DF_Relationship_TITLE] DEFAULT (''),
    [FUNCTIONAL_TITLE] varchar(50) NOT NULL CONSTRAINT [DF_Relationship_FUNCTIONAL_TITLE] DEFAULT (''),
    [STATUS] varchar(5) NOT NULL CONSTRAINT [DF_Relationship_STATUS] DEFAULT (''),
    [EFFECTIVE_DATE] datetime NULL,
    [THRU_DATE] datetime NULL,
    [NOTE] text NULL,
    [LAST_STRING] varchar(255) NOT NULL CONSTRAINT [DF_Relationship_LAST_STRING] DEFAULT (''),
    [DATE_ADDED] datetime NULL,
    [LAST_UPDATED] datetime NULL,
    [UPDATED_BY] varchar(60) NOT NULL CONSTRAINT [DF_Relationship_UPDATED_BY] DEFAULT (''),
    [SEQN] int NOT NULL CONSTRAINT [DF_Relationship_SEQN] DEFAULT (0),
    [GROUP_CODE] varchar(30) NOT NULL CONSTRAINT [DF_Relationship_GROUP_CODE] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Relationship_Types]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Relationship_Types] (
    [RELATION_TYPE] varchar(10) NOT NULL CONSTRAINT [DF_Relationship_Types_RELATION_TYPE] DEFAULT (''),
    [DESCRIPTION] varchar(60) NOT NULL CONSTRAINT [DF_Relationship_Types_DESCRIPTION] DEFAULT (''),
    [RECIPROCAL_TYPE] varchar(10) NOT NULL CONSTRAINT [DF_Relationship_Types_RECIPROCAL_TYPE] DEFAULT (''),
    [USE_TITLE] bit NOT NULL CONSTRAINT [DF_Relationship_Types_USE_TITLE] DEFAULT (0),
    [USE_DATES] bit NOT NULL CONSTRAINT [DF_Relationship_Types_USE_DATES] DEFAULT (0),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[RelationshipCategoryRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[RelationshipCategoryRef] (
    [RelationshipCategoryKey] uniqueidentifier NOT NULL,
    [RelationshipCategoryName] nvarchar(30) NOT NULL,
    [RelationshipCategoryDescription] nvarchar(200) NULL,
    [IsSystem] bit NOT NULL CONSTRAINT [DF_RelationshipCategoryRef_IsSystem] DEFAULT (0),
    [IsActive] bit NOT NULL CONSTRAINT [DF_RelationshipCategoryRef_IsActive] DEFAULT (1)
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[RelationshipMain]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[RelationshipMain] (
    [RelationshipKey] uniqueidentifier NOT NULL,
    [RelationshipTypeKey] uniqueidentifier NOT NULL,
    [SubjectUniformKey] uniqueidentifier NOT NULL,
    [TargetUniformKey] uniqueidentifier NOT NULL,
    [EffectiveDate] datetime NULL,
    [EndDate] datetime NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[RelationshipTypeCategory]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[RelationshipTypeCategory] (
    [RelationshipTypeCategoryKey] uniqueidentifier NOT NULL,
    [RelationshipTypeKey] uniqueidentifier NOT NULL,
    [RelationshipCategoryKey] uniqueidentifier NOT NULL,
    [IsSystem] bit NOT NULL,
    [IsActive] bit NOT NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[RelationshipTypeRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[RelationshipTypeRef] (
    [RelationshipTypeKey] uniqueidentifier NOT NULL,
    [RelationshipTypeDesc] nvarchar(30) NOT NULL,
    [ReciprocalRelationshipTypeKey] uniqueidentifier NULL,
    [IsSystem] bit NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Report_Desc]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Report_Desc] (
    [ImisSystem] varchar(10) NOT NULL CONSTRAINT [DF_Report_Desc_ImisSystem] DEFAULT (''),
    [Category] varchar(20) NOT NULL CONSTRAINT [DF_Report_Desc_Category] DEFAULT (''),
    [Title] varchar(64) NOT NULL CONSTRAINT [DF_Report_Desc_Title] DEFAULT (''),
    [Description] text NULL,
    [Hide] bit NOT NULL CONSTRAINT [DF_Report_Desc_Hide] DEFAULT (0),
    [RequiredLicense] varchar(60) NOT NULL CONSTRAINT [DF_Report_Desc_RequiredLicense] DEFAULT (''),
    [Format] varchar(100) NOT NULL CONSTRAINT [DF_Report_Desc_Format] DEFAULT (''),
    [DialogWindow] varchar(30) NOT NULL CONSTRAINT [DF_Report_Desc_DialogWindow] DEFAULT (''),
    [RunProcedure] varchar(60) NOT NULL CONSTRAINT [DF_Report_Desc_RunProcedure] DEFAULT (''),
    [ProportionalSpaced] bit NOT NULL CONSTRAINT [DF_Report_Desc_ProportionalSpaced] DEFAULT (0),
    [Landscape] bit NOT NULL CONSTRAINT [DF_Report_Desc_Landscape] DEFAULT (0),
    [PrintSetup] bit NOT NULL CONSTRAINT [DF_Report_Desc_PrintSetup] DEFAULT (0),
    [LinesPerPage] numeric(15, 2) NOT NULL CONSTRAINT [DF_Report_Desc_LinesPerPage] DEFAULT (0),
    [CharactersPerLine] numeric(15, 2) NOT NULL CONSTRAINT [DF_Report_Desc_CharactersPerLine] DEFAULT (0),
    [TopMargin] numeric(15, 2) NOT NULL CONSTRAINT [DF_Report_Desc_TopMargin] DEFAULT (0),
    [BottomMargin] numeric(15, 2) NOT NULL CONSTRAINT [DF_Report_Desc_BottomMargin] DEFAULT (0),
    [LeftMargin] numeric(15, 2) NOT NULL CONSTRAINT [DF_Report_Desc_LeftMargin] DEFAULT (0),
    [LabelWidth] numeric(15, 2) NOT NULL CONSTRAINT [DF_Report_Desc_LabelWidth] DEFAULT (0),
    [LabelsAcross] int NOT NULL CONSTRAINT [DF_Report_Desc_LabelsAcross] DEFAULT (0),
    [RecordSpace] numeric(15, 2) NOT NULL CONSTRAINT [DF_Report_Desc_RecordSpace] DEFAULT (0),
    [RepeatFactor] int NOT NULL CONSTRAINT [DF_Report_Desc_RepeatFactor] DEFAULT (0),
    [ExportType] tinyint NOT NULL CONSTRAINT [DF_Report_Desc_ExportType] DEFAULT (0),
    [OutputFile] varchar(255) NOT NULL CONSTRAINT [DF_Report_Desc_OutputFile] DEFAULT (''),
    [ReportOptions] text NULL,
    [Parameters] text NULL,
    [TableNames] varchar(255) NOT NULL CONSTRAINT [DF_Report_Desc_TableNames] DEFAULT (''),
    [SearchTables] text NOT NULL CONSTRAINT [DF_Report_Desc_SearchTables] DEFAULT (''),
    [SelectNames] text NULL,
    [SearchExpression] text NULL,
    [ColumnHeadings] varchar(255) NOT NULL CONSTRAINT [DF_Report_Desc_ColumnHeadings] DEFAULT (''),
    [LetterText] text NULL,
    [LetterType] varchar(30) NOT NULL CONSTRAINT [DF_Report_Desc_LetterType] DEFAULT (''),
    [MenuFields] varchar(255) NOT NULL CONSTRAINT [DF_Report_Desc_MenuFields] DEFAULT (''),
    [Sort1] varchar(255) NOT NULL CONSTRAINT [DF_Report_Desc_Sort1] DEFAULT (''),
    [Sort2] varchar(255) NOT NULL CONSTRAINT [DF_Report_Desc_Sort2] DEFAULT (''),
    [Sort3] varchar(255) NOT NULL CONSTRAINT [DF_Report_Desc_Sort3] DEFAULT (''),
    [Sort4] varchar(255) NOT NULL CONSTRAINT [DF_Report_Desc_Sort4] DEFAULT (''),
    [AllowParameterEdit] bit NOT NULL CONSTRAINT [DF_Report_Desc_AllowParameterEdit] DEFAULT (0),
    [AllowMarginEdit] bit NOT NULL CONSTRAINT [DF_Report_Desc_AllowMarginEdit] DEFAULT (0),
    [AllowSearchEdit] bit NOT NULL CONSTRAINT [DF_Report_Desc_AllowSearchEdit] DEFAULT (0),
    [AllowSortEdit] bit NOT NULL CONSTRAINT [DF_Report_Desc_AllowSortEdit] DEFAULT (0),
    [AllowExportEdit] bit NOT NULL CONSTRAINT [DF_Report_Desc_AllowExportEdit] DEFAULT (0),
    [StandardReport] bit NOT NULL CONSTRAINT [DF_Report_Desc_StandardReport] DEFAULT (0),
    [AllowUserFieldEdit] bit NOT NULL CONSTRAINT [DF_Report_Desc_AllowUserFieldEdit] DEFAULT (0),
    [UF1] varchar(200) NOT NULL CONSTRAINT [DF_Report_Desc_UF1] DEFAULT (''),
    [UF2] varchar(200) NOT NULL CONSTRAINT [DF_Report_Desc_UF2] DEFAULT (''),
    [UF3] varchar(200) NOT NULL CONSTRAINT [DF_Report_Desc_UF3] DEFAULT (''),
    [UF4] varchar(200) NOT NULL CONSTRAINT [DF_Report_Desc_UF4] DEFAULT (''),
    [UF5] varchar(80) NOT NULL CONSTRAINT [DF_Report_Desc_UF5] DEFAULT (''),
    [UF6] varchar(80) NOT NULL CONSTRAINT [DF_Report_Desc_UF6] DEFAULT (''),
    [UF7] varchar(80) NOT NULL CONSTRAINT [DF_Report_Desc_UF7] DEFAULT (''),
    [UF8] varchar(80) NOT NULL CONSTRAINT [DF_Report_Desc_UF8] DEFAULT (''),
    [UF9] varchar(80) NOT NULL CONSTRAINT [DF_Report_Desc_UF9] DEFAULT (''),
    [UF10] varchar(80) NOT NULL CONSTRAINT [DF_Report_Desc_UF10] DEFAULT (''),
    [UFHeading1] varchar(15) NOT NULL CONSTRAINT [DF_Report_Desc_UFHeading1] DEFAULT (''),
    [UFHeading2] varchar(15) NOT NULL CONSTRAINT [DF_Report_Desc_UFHeading2] DEFAULT (''),
    [UFHeading3] varchar(15) NOT NULL CONSTRAINT [DF_Report_Desc_UFHeading3] DEFAULT (''),
    [UFHeading4] varchar(15) NOT NULL CONSTRAINT [DF_Report_Desc_UFHeading4] DEFAULT (''),
    [UFHeading5] varchar(15) NOT NULL CONSTRAINT [DF_Report_Desc_UFHeading5] DEFAULT (''),
    [UFHeading6] varchar(15) NOT NULL CONSTRAINT [DF_Report_Desc_UFHeading6] DEFAULT (''),
    [UFHeading7] varchar(15) NOT NULL CONSTRAINT [DF_Report_Desc_UFHeading7] DEFAULT (''),
    [UFHeading8] varchar(15) NOT NULL CONSTRAINT [DF_Report_Desc_UFHeading8] DEFAULT (''),
    [UFHeading9] varchar(15) NOT NULL CONSTRAINT [DF_Report_Desc_UFHeading9] DEFAULT (''),
    [UFHeading10] varchar(15) NOT NULL CONSTRAINT [DF_Report_Desc_UFHeading10] DEFAULT (''),
    [DateAdded] datetime NULL,
    [ReportType] varchar(12) NOT NULL CONSTRAINT [DF_Report_Desc_ReportType] DEFAULT (''),
    [CrystalParams] text NULL,
    [StoreReportYN] bit NOT NULL CONSTRAINT [DF_Report_Desc_StoreReportYN] DEFAULT (0),
    [StoreInterval] int NOT NULL CONSTRAINT [DF_Report_Desc_StoreInterval] DEFAULT (0),
    [AccessKeywords] varchar(255) NOT NULL CONSTRAINT [DF_Report_Desc_AccessKeywords] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Request_Status_Ref]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Request_Status_Ref] (
    [RequestStatusCode] char(1) NOT NULL,
    [RequestStatusDesc] varchar(20) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[ResponseMediaRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ResponseMediaRef] (
    [ResponseMediaCode] nvarchar(20) NOT NULL,
    [ResponseMediaDesc] nvarchar(50) NOT NULL CONSTRAINT [DF_ResponseMediaRef_ResponseMediaDesc] DEFAULT ('')
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[ResponseTypeRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ResponseTypeRef] (
    [ResponseTypeCode] int NOT NULL,
    [ResponseTypeName] nvarchar(20) NOT NULL,
    [ResponseTypeDesc] nvarchar(50) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[RestockPriceRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[RestockPriceRef] (
    [RestockPriceCode] int NOT NULL,
    [RestockPriceDesc] nvarchar(50) NOT NULL,
    [DisplayPrompt] nvarchar(100) NOT NULL CONSTRAINT [DF_RestockPriceRef_DisplayPrompt] DEFAULT ('')
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[RFMDefinition]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[RFMDefinition] (
    [RFMKey] uniqueidentifier NOT NULL,
    [Name] nvarchar(50) NOT NULL,
    [Description] nvarchar(500) NULL,
    [UserDocumentKey] uniqueidentifier NULL,
    [TransactionDocumentKey] uniqueidentifier NULL,
    [IsAutoMode] bit NOT NULL,
    [NumRecency] int NULL,
    [NumFrequency] int NULL,
    [NumMonetary] int NULL,
    [DateExecuted] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[RFMDefinition_Detail]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[RFMDefinition_Detail] (
    [RFMKey] uniqueidentifier NOT NULL,
    [Type] char(10) NOT NULL,
    [Ranking] char(10) NULL,
    [Value] char(20) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[RFMMain]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[RFMMain] (
    [RFMKey] uniqueidentifier NOT NULL,
    [ContactKey] uniqueidentifier NOT NULL,
    [Recency] int NULL CONSTRAINT [DF_RFMMain_Recency] DEFAULT (0),
    [Frequency] int NULL CONSTRAINT [DF_RFMMain_Frequency] DEFAULT (0),
    [Monetary] int NULL CONSTRAINT [DF_RFMMain_Monetary] DEFAULT (0),
    [Combined] int NULL CONSTRAINT [DF_RFMMain_Combined] DEFAULT (0),
    [Total] int NULL CONSTRAINT [DF_RFMMain_Total] DEFAULT (0),
    [LowAmount] decimal(18, 4) NULL CONSTRAINT [DF_RFMMain_LowAmount] DEFAULT (0),
    [HighAmount] decimal(18, 4) NULL CONSTRAINT [DF_RFMMain_HighAmount] DEFAULT (0),
    [TotalAmount] decimal(18, 4) NULL CONSTRAINT [DF_RFMMain_TotalAmount] DEFAULT (0),
    [NumDays] int NULL,
    [NumContacts] int NULL CONSTRAINT [DF_RFMMain_NumContacts] DEFAULT (0),
    [FirstContact] datetime NULL,
    [LastContact] datetime NULL,
    [HighContact] datetime NULL,
    [FirstContactAmount] decimal(18, 0) NULL,
    [LastContactAmount] decimal(18, 0) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[RoleMain]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[RoleMain] (
    [RoleKey] uniqueidentifier NOT NULL CONSTRAINT [DF_RoleMain_RoleKey] DEFAULT (newid()),
    [Name] nvarchar(50) NOT NULL CONSTRAINT [DF_RoleMain_Name] DEFAULT (''),
    [Description] nvarchar(250) NOT NULL CONSTRAINT [DF_RoleMain_Description] DEFAULT (''),
    [IsSystem] bit NOT NULL CONSTRAINT [DF_RoleMain_IsSystem] DEFAULT (0),
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [UpdatedOn] datetime NOT NULL CONSTRAINT [DF_RoleMain_UpdatedOn] DEFAULT (getdate()),
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[RoundingMultipleRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[RoundingMultipleRef] (
    [RoundingMultipleKey] uniqueidentifier NOT NULL,
    [RoundingMultipleCode] decimal(18, 4) NOT NULL,
    [RoundingMultipleDesc] nvarchar(50) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Rpt_3rdPartyPayerInfo]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Rpt_3rdPartyPayerInfo] (
    [BT_ID] varchar(10) NOT NULL CONSTRAINT [DF_Rpt_3rdPartyPayerInfo_BT_ID] DEFAULT (''),
    [PAYER_NAME] varchar(60) NOT NULL CONSTRAINT [DF_Rpt_3rdPartyPayerInfo_PAYER_NAME] DEFAULT (''),
    [TRANS_NUMBER] int NOT NULL CONSTRAINT [DF_Rpt_3rdPartyPayerInfo_TRANS_NUMBER] DEFAULT (0),
    [APPEAL_CODE] varchar(40) NOT NULL CONSTRAINT [DF_Rpt_3rdPartyPayerInfo_APPEAL_CODE] DEFAULT (''),
    [CAMPAIGN_CODE] varchar(10) NOT NULL CONSTRAINT [DF_Rpt_3rdPartyPayerInfo_CAMPAIGN_CODE] DEFAULT (''),
    [PLEDGE_DATE] datetime NULL,
    [PAYMENT_DATE] datetime NULL,
    [PAYMENT_AMOUNT] numeric(15, 2) NOT NULL CONSTRAINT [DF_Rpt_3rdPartyPayerInfo_PAYMENT_AMOUNT] DEFAULT (0),
    [REMAINING_BALANCE] numeric(15, 2) NOT NULL CONSTRAINT [DF_Rpt_3rdPartyPayerInfo_REMAINING_BALANCE] DEFAULT (0),
    [UserID_Date] varchar(50) NOT NULL CONSTRAINT [DF_Rpt_3rdPartyPayerInfo_UserID_Date] DEFAULT (''),
    [ORG_CODE] varchar(10) NOT NULL CONSTRAINT [DF_Rpt_3rdPartyPayerInfo_ORG_CODE] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Rpt_BadgeTbl]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Rpt_BadgeTbl] (
    [ORDER_NUMBER] float NOT NULL CONSTRAINT [DF_Rpt_BadgeTbl_ORDER_NUMBER] DEFAULT (0),
    [BADGE_TYPE] varchar(10) NOT NULL CONSTRAINT [DF_Rpt_BadgeTbl_BADGE_TYPE] DEFAULT (''),
    [FULL_NAME] varchar(70) NOT NULL CONSTRAINT [DF_Rpt_BadgeTbl_FULL_NAME] DEFAULT (''),
    [FIRST_NAME] varchar(20) NULL,
    [MIDDLE_NAME] varchar(20) NOT NULL CONSTRAINT [DF_Rpt_BadgeTbl_MIDDLE_NAME] DEFAULT (''),
    [LAST_NAME] varchar(30) NOT NULL CONSTRAINT [DF_Rpt_BadgeTbl_LAST_NAME] DEFAULT (''),
    [PREFIX] varchar(25) NULL CONSTRAINT [DF_Rpt_BadgeTbl_PREFIX] DEFAULT (''),
    [SUFFIX] varchar(10) NOT NULL CONSTRAINT [DF_Rpt_BadgeTbl_SUFFIX] DEFAULT (''),
    [DESIGNATION] varchar(20) NOT NULL CONSTRAINT [DF_Rpt_BadgeTbl_DESIGNATION] DEFAULT (''),
    [INFORMAL] varchar(20) NULL,
    [TITLE] varchar(80) NOT NULL CONSTRAINT [DF_Rpt_BadgeTbl_TITLE] DEFAULT (''),
    [COMPANY] varchar(80) NOT NULL CONSTRAINT [DF_Rpt_BadgeTbl_COMPANY] DEFAULT (''),
    [CITY] varchar(40) NOT NULL CONSTRAINT [DF_Rpt_BadgeTbl_CITY] DEFAULT (''),
    [STATE_PROVINCE] varchar(15) NOT NULL CONSTRAINT [DF_Rpt_BadgeTbl_STATE_PROVINCE] DEFAULT (''),
    [ZIP] varchar(10) NOT NULL CONSTRAINT [DF_Rpt_BadgeTbl_ZIP] DEFAULT (''),
    [DELEGATE] varchar(10) NOT NULL CONSTRAINT [DF_Rpt_BadgeTbl_DELEGATE] DEFAULT (''),
    [REGISTRANT_CLASS] varchar(40) NOT NULL CONSTRAINT [DF_Rpt_BadgeTbl_REGISTRANT_CLASS] DEFAULT (''),
    [REG_TYPE] varchar(40) NULL CONSTRAINT [DF_Rpt_BadgeTbl_REG_TYPE] DEFAULT (''),
    [BADGE_NUMBER] int NOT NULL CONSTRAINT [DF_Rpt_BadgeTbl_BADGE_NUMBER] DEFAULT (0),
    [COUNTRY] varchar(25) NULL,
    [UserID_Date] varchar(50) NOT NULL CONSTRAINT [DF_Rpt_BadgeTbl_UserID_Date] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Rpt_InvoiceTbl]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Rpt_InvoiceTbl] (
    [UserID_Date] varchar(50) NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_UserID_Date] DEFAULT (''),
    [BEGIN_DATE] datetime NULL,
    [END_DATE] datetime NULL,
    [CITY] varchar(40) NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_CITY] DEFAULT (''),
    [STATE_PROVINCE] varchar(15) NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_STATE_PROVINCE] DEFAULT (''),
    [COUNTRY] varchar(25) NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_COUNTRY] DEFAULT (''),
    [MEETING] varchar(10) NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_MEETING] DEFAULT (''),
    [TITLE] varchar(255) NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_TITLE] DEFAULT (''),
    [ORDERS_FULL_NAME] varchar(60) NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_ORDERS_FULL_NAME] DEFAULT (''),
    [ORDERS_FULL_ADDRESS] varchar(255) NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_ORDERS_FULL_ADDRESS] DEFAULT (''),
    [TAX_1] numeric(15, 2) NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_TAX_1] DEFAULT (0),
    [TAX_2] numeric(15, 2) NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_TAX_2] DEFAULT (0),
    [TAX_3] numeric(15, 2) NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_TAX_3] DEFAULT (0),
    [ORDER_NUMBER] float NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_ORDER_NUMBER] DEFAULT (0),
    [INVOICE_NUMBER] int NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_INVOICE_NUMBER] DEFAULT (0),
    [CUSTOMER_REFERENCE] varchar(40) NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_CUSTOMER_REFERENCE] DEFAULT (''),
    [BT_ID] varchar(10) NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_BT_ID] DEFAULT (''),
    [INVOICE_DATE] datetime NULL,
    [ORDER_DATE] datetime NULL,
    [LINE_TOTAL] money NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_LINE_TOTAL] DEFAULT (0),
    [CANCELLATION_FEE] money NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_CANCELLATION_FEE] DEFAULT (0),
    [TOTAL_CHARGES] money NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_TOTAL_CHARGES] DEFAULT (0),
    [TOTAL_PAYMENTS] money NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_TOTAL_PAYMENTS] DEFAULT (0),
    [BALANCE] money NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_BALANCE] DEFAULT (0),
    [BAR_CODE] varchar(14) NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_BAR_CODE] DEFAULT (''),
    [FREIGHT_1] money NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_FREIGHT_1] DEFAULT (0),
    [FREIGHT_2] money NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_FREIGHT_2] DEFAULT (0),
    [HANDLING_1] money NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_HANDLING_1] DEFAULT (0),
    [HANDLING_2] money NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_HANDLING_2] DEFAULT (0),
    [GT_DESCRIPTION] varchar(255) NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_GT_DESCRIPTION] DEFAULT (''),
    [OM_MEETING] varchar(10) NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_OM_MEETING] DEFAULT (''),
    [QUANTITY_BACKORDERED] float NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_QUANTITY_BACKORDERED] DEFAULT (0),
    [OL_DESCRIPTION] varchar(255) NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_OL_DESCRIPTION] DEFAULT (''),
    [BOOTH_NUMBERS] varchar(255) NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_BOOTH_NUMBERS] DEFAULT (''),
    [QUANTITY_SHIPPED] float NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_QUANTITY_SHIPPED] DEFAULT (0),
    [UNIT_PRICE] money NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_UNIT_PRICE] DEFAULT (0),
    [EXTENDED_AMOUNT] money NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_EXTENDED_AMOUNT] DEFAULT (0),
    [PRODUCT_CODE] varchar(31) NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_PRODUCT_CODE] DEFAULT (''),
    [KIT_ITEM_TYPE] tinyint NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_KIT_ITEM_TYPE] DEFAULT (0),
    [QUANTITY_ORDERED] float NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_QUANTITY_ORDERED] DEFAULT (0),
    [ORG_NAME] varchar(60) NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_ORG_NAME] DEFAULT (''),
    [INVOICE_ADDRESS] varchar(255) NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_INVOICE_ADDRESS] DEFAULT (''),
    [NAME_FULL_NAME] varchar(60) NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_NAME_FULL_NAME] DEFAULT (''),
    [NAME_ADDR_FULL_ADDRESS] varchar(255) NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_NAME_ADDR_FULL_ADDRESS] DEFAULT (''),
    [T_DESCRIPTION] varchar(255) NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_T_DESCRIPTION] DEFAULT (''),
    [VAT_CODE1] varchar(100) NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_VAT_CODE1] DEFAULT (''),
    [VAT_CODE2] varchar(100) NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_VAT_CODE2] DEFAULT (''),
    [VAT_CODE3] varchar(100) NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_VAT_CODE3] DEFAULT (''),
    [VAT_DESC1] varchar(100) NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_VAT_DESC1] DEFAULT (''),
    [VAT_DESC2] varchar(100) NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_VAT_DESC2] DEFAULT (''),
    [VAT_DESC3] varchar(100) NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_VAT_DESC3] DEFAULT (''),
    [VAT_RATE1] numeric(15, 4) NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_VAT_RATE1] DEFAULT (0),
    [VAT_RATE2] numeric(15, 4) NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_VAT_RATE2] DEFAULT (0),
    [VAT_RATE3] numeric(15, 4) NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_VAT_RATE3] DEFAULT (0),
    [VAT_NET1] money NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_VAT_NET1] DEFAULT (0),
    [VAT_NET2] money NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_VAT_NET2] DEFAULT (0),
    [VAT_NET3] money NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_VAT_NET3] DEFAULT (0),
    [VAT_VAT1] numeric(15, 4) NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_VAT_VAT1] DEFAULT (0),
    [VAT_VAT2] numeric(15, 4) NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_VAT_VAT2] DEFAULT (0),
    [VAT_VAT3] numeric(15, 4) NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_VAT_VAT3] DEFAULT (0),
    [VAT_TOT1] money NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_VAT_TOT1] DEFAULT (0),
    [VAT_TOT2] money NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_VAT_TOT2] DEFAULT (0),
    [VAT_TOT3] money NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_VAT_TOT3] DEFAULT (0),
    [COMPANY] varchar(80) NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_COMPANY] DEFAULT (''),
    [LAST_FIRST] varchar(30) NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_LAST_FIRST] DEFAULT (''),
    [ORDERS_TITLE] varchar(80) NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_ORDERS_TITLE] DEFAULT (''),
    [OT_INVOICE_DESCRIPTION] varchar(255) NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_OT_INVOICE_DESCRIPTION] DEFAULT (''),
    [BIN] varchar(10) NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_BIN] DEFAULT (''),
    [LOCATION] varchar(10) NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_LOCATION] DEFAULT (''),
    [PHONE] varchar(25) NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_PHONE] DEFAULT (''),
    [UF_1] varchar(30) NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_UF_1] DEFAULT (''),
    [UF_2] varchar(30) NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_UF_2] DEFAULT (''),
    [UF_3] varchar(30) NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_UF_3] DEFAULT (''),
    [UF_4] varchar(30) NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_UF_4] DEFAULT (''),
    [LINE_NUMBER] float NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_LINE_NUMBER] DEFAULT (0),
    [LOCATION_DESCRIPTION] varchar(255) NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_LOCATION_DESCRIPTION] DEFAULT (''),
    [KIT_DESCRIPTION] varchar(255) NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_KIT_DESCRIPTION] DEFAULT (''),
    [KIT_NAME] varchar(31) NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_KIT_NAME] DEFAULT (''),
    [PRODUCT_CATEGORY] varchar(10) NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_PRODUCT_CATEGORY] DEFAULT (''),
    [OL_TAX1] numeric(15, 4) NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_OL_TAX1] DEFAULT (0),
    [BT_PRINT_COMPANY] bit NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_BT_PRINT_COMPANY] DEFAULT (0),
    [BT_PRINT_TITLE] bit NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_BT_PRINT_TITLE] DEFAULT (0),
    [IS_FR_ITEM] bit NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_IS_FR_ITEM] DEFAULT (0),
    [REFERENCE_NUM] int NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_REFERENCE_NUM] DEFAULT (0),
    [INVOICE_DESC] varchar(255) NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_INVOICE_DESC] DEFAULT (''),
    [ORIGINAL_INVOICE] int NOT NULL CONSTRAINT [DF_Rpt_InvoiceTbl_ORIGINAL_INVOICE] DEFAULT (0),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Rpt_KitTbl]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Rpt_KitTbl] (
    [LINE_NUMBER] float NOT NULL CONSTRAINT [DF_Rpt_KitTbl_LINE_NUMBER] DEFAULT (0),
    [DESCRIPTION] varchar(255) NOT NULL CONSTRAINT [DF_Rpt_KitTbl_DESCRIPTION] DEFAULT (''),
    [UserID_Date] varchar(50) NOT NULL CONSTRAINT [DF_Rpt_KitTbl_UserID_Date] DEFAULT (''),
    [ORDER_NUMBER] float NOT NULL CONSTRAINT [DF_Rpt_KitTbl_ORDER_NUMBER] DEFAULT (0),
    [KIT_NAME] varchar(31) NOT NULL CONSTRAINT [DF_Rpt_KitTbl_KIT_NAME] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Rpt_ProductInventory]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Rpt_ProductInventory] (
    [PTRANS_NUMBER] int NULL,
    [PRODUCT_CODE] varchar(31) NOT NULL CONSTRAINT [DF_Rpt_ProductInventory_PRODUCT_CODE] DEFAULT (''),
    [DESCRIPTION] varchar(100) NULL,
    [TRANS_GROUP_NUMBER] int NULL,
    [PO_REFERENCE_NUMBER] varchar(15) NULL,
    [TRANSACTION_DATE] datetime NULL,
    [QUANTITY] float NULL,
    [UNIT_COST] numeric(15, 2) NULL,
    [TOTAL_AMOUNT] numeric(15, 2) NULL,
    [FROM_LOCATION] varchar(10) NULL,
    [FROM_BIN] varchar(10) NULL,
    [TO_LOCATION] varchar(10) NULL,
    [TO_BIN] varchar(10) NULL,
    [TRANSACTION_TYPE] varchar(10) NULL,
    [TITLE] varchar(60) NULL,
    [ORDER_NUMBER] float NULL,
    [BT_ID] varchar(10) NULL,
    [FULL_NAME] varchar(70) NULL,
    [ORDER_DATE] datetime NULL,
    [ORDER_TYPE_CODE] varchar(10) NULL,
    [FLAG] tinyint NULL,
    [UserId_Date] varchar(50) NULL,
    [BACKORDERED] float NULL,
    [STAGE] varchar(10) NULL,
    [PRODUCT_STATUS] varchar(1) NULL,
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Rpt_TicketTbl]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Rpt_TicketTbl] (
    [MEET_MASTER_TITLE] varchar(60) NOT NULL CONSTRAINT [DF_Rpt_TicketTbl_MEET_MASTER_TITLE] DEFAULT (''),
    [PRODUCT_TITLE] varchar(60) NOT NULL CONSTRAINT [DF_Rpt_TicketTbl_PRODUCT_TITLE] DEFAULT (''),
    [BEGIN_DATE_TIME] datetime NULL,
    [END_DATE_TIME] datetime NULL,
    [FULL_NAME] varchar(70) NOT NULL CONSTRAINT [DF_Rpt_TicketTbl_FULL_NAME] DEFAULT (''),
    [TICKET_NUMBER] varchar(20) NOT NULL CONSTRAINT [DF_Rpt_TicketTbl_TICKET_NUMBER] DEFAULT (''),
    [ORDER_NUMBER] float NOT NULL CONSTRAINT [DF_Rpt_TicketTbl_ORDER_NUMBER] DEFAULT (0),
    [UserID_Date] varchar(50) NOT NULL CONSTRAINT [DF_Rpt_TicketTbl_UserID_Date] DEFAULT (''),
    [BADGE_TYPE] varchar(10) NOT NULL CONSTRAINT [DF_Rpt_TicketTbl_BADGE_TYPE] DEFAULT (''),
    [LAST_FIRST] varchar(100) NOT NULL CONSTRAINT [DF_Rpt_TicketTbl_LAST_FIRST] DEFAULT (''),
    [DESIGNATION] varchar(20) NOT NULL CONSTRAINT [DF_Rpt_TicketTbl_DESIGNATION] DEFAULT (''),
    [PRODUCT_CODE] varchar(31) NOT NULL CONSTRAINT [DF_Rpt_TicketTbl_PRODUCT_CODE] DEFAULT (''),
    [COMPANY] varchar(80) NOT NULL CONSTRAINT [DF_Rpt_TicketTbl_COMPANY] DEFAULT (''),
    [IS_FR_ITEM] bit NOT NULL CONSTRAINT [DF_Rpt_TicketTbl_IS_FR_ITEM] DEFAULT (0),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Rpt_WorkingTbl]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Rpt_WorkingTbl] (
    [UserID_Date] varchar(50) NOT NULL CONSTRAINT [DF_Rpt_WorkingTbl_UserID_Date] DEFAULT (''),
    [ReceiptID] int NOT NULL CONSTRAINT [DF_Rpt_WorkingTbl_ReceiptID] DEFAULT (0),
    [Org_Code] varchar(5) NOT NULL CONSTRAINT [DF_Rpt_WorkingTbl_Org_Code] DEFAULT (''),
    [Transaction_Date] datetime NULL,
    [BT_NAME] varchar(60) NOT NULL CONSTRAINT [DF_Rpt_WorkingTbl_BT_NAME] DEFAULT (''),
    [BT_TITLE] varchar(80) NOT NULL CONSTRAINT [DF_Rpt_WorkingTbl_BT_TITLE] DEFAULT (''),
    [BT_COMPANY] varchar(80) NOT NULL CONSTRAINT [DF_Rpt_WorkingTbl_BT_COMPANY] DEFAULT (''),
    [BILL_TO] varchar(10) NOT NULL CONSTRAINT [DF_Rpt_WorkingTbl_BILL_TO] DEFAULT (''),
    [BT_ID_NAME] varchar(10) NOT NULL CONSTRAINT [DF_Rpt_WorkingTbl_BT_ID_NAME] DEFAULT (''),
    [ID] varchar(10) NOT NULL CONSTRAINT [DF_Rpt_WorkingTbl_ID] DEFAULT (''),
    [MEMBER_TYPE] varchar(5) NOT NULL CONSTRAINT [DF_Rpt_WorkingTbl_MEMBER_TYPE] DEFAULT (''),
    [LAST_FIRST] varchar(70) NOT NULL CONSTRAINT [DF_Rpt_WorkingTbl_LAST_FIRST] DEFAULT (''),
    [TITLE] varchar(80) NOT NULL CONSTRAINT [DF_Rpt_WorkingTbl_TITLE] DEFAULT (''),
    [COMPANY] varchar(80) NOT NULL CONSTRAINT [DF_Rpt_WorkingTbl_COMPANY] DEFAULT (''),
    [WORK_PHONE] varchar(25) NOT NULL CONSTRAINT [DF_Rpt_WorkingTbl_WORK_PHONE] DEFAULT (''),
    [HOME_PHONE] varchar(25) NOT NULL CONSTRAINT [DF_Rpt_WorkingTbl_HOME_PHONE] DEFAULT (''),
    [CONTACT_RANK] int NOT NULL CONSTRAINT [DF_Rpt_WorkingTbl_CONTACT_RANK] DEFAULT (0),
    [CHAPTER] varchar(15) NOT NULL CONSTRAINT [DF_Rpt_WorkingTbl_CHAPTER] DEFAULT (''),
    [CO_ID] varchar(10) NOT NULL CONSTRAINT [DF_Rpt_WorkingTbl_CO_ID] DEFAULT (''),
    [FULL_NAME] varchar(70) NOT NULL CONSTRAINT [DF_Rpt_WorkingTbl_FULL_NAME] DEFAULT (''),
    [JOIN_DATE] datetime NULL,
    [COMPANY_RECORD] tinyint NOT NULL CONSTRAINT [DF_Rpt_WorkingTbl_COMPANY_RECORD] DEFAULT (0),
    [DESCRIPTION] varchar(20) NOT NULL CONSTRAINT [DF_Rpt_WorkingTbl_DESCRIPTION] DEFAULT (''),
    [Temp_Item1] varchar(255) NULL,
    [Temp_Item2] varchar(255) NULL,
    [Temp_Item3] varchar(255) NULL,
    [Temp_Item4] varchar(255) NULL,
    [Temp_Item5] varchar(255) NULL,
    [Temp_Item6] varchar(255) NULL,
    [Temp_Item7] varchar(255) NULL,
    [Temp_Item8] varchar(255) NULL,
    [Temp_Item9] varchar(255) NULL,
    [Temp_Item10] varchar(255) NULL,
    [PRODUCT_CODE] varchar(31) NOT NULL CONSTRAINT [DF_Rpt_WorkingTbl_PRODUCT_CODE] DEFAULT (''),
    [STATUS] varchar(5) NOT NULL CONSTRAINT [DF_Rpt_WorkingTbl_STATUS] DEFAULT (''),
    [BEGIN_DATE] datetime NULL,
    [PREF_MAIL] tinyint NOT NULL CONSTRAINT [DF_Rpt_WorkingTbl_PREF_MAIL] DEFAULT (0),
    [PREF_BILL] tinyint NOT NULL CONSTRAINT [DF_Rpt_WorkingTbl_PREF_BILL] DEFAULT (0),
    [RENEW_MONTHS] tinyint NOT NULL CONSTRAINT [DF_Rpt_WorkingTbl_RENEW_MONTHS] DEFAULT (0),
    [SOURCE_CODE] varchar(40) NOT NULL CONSTRAINT [DF_Rpt_WorkingTbl_SOURCE_CODE] DEFAULT (''),
    [MAIL_CODE] varchar(5) NOT NULL CONSTRAINT [DF_Rpt_WorkingTbl_MAIL_CODE] DEFAULT (''),
    [PREVIOUS_BALANCE] numeric(15, 2) NOT NULL CONSTRAINT [DF_Rpt_WorkingTbl_PREVIOUS_BALANCE] DEFAULT (0),
    [BILL_DATE] datetime NULL,
    [REMINDER_DATE] datetime NULL,
    [REMINDER_COUNT] tinyint NOT NULL CONSTRAINT [DF_Rpt_WorkingTbl_REMINDER_COUNT] DEFAULT (0),
    [BILL_BEGIN] datetime NULL,
    [BILL_THRU] datetime NULL,
    [BILL_AMOUNT] numeric(15, 2) NOT NULL CONSTRAINT [DF_Rpt_WorkingTbl_BILL_AMOUNT] DEFAULT (0),
    [PAYMENT_AMOUNT] numeric(15, 2) NOT NULL CONSTRAINT [DF_Rpt_WorkingTbl_PAYMENT_AMOUNT] DEFAULT (0),
    [PAYMENT_DATE] datetime NULL,
    [BALANCE] numeric(15, 2) NOT NULL CONSTRAINT [DF_Rpt_WorkingTbl_BALANCE] DEFAULT (0),
    [INVOICE_REFERENCE_NUM] int NOT NULL CONSTRAINT [DF_Rpt_WorkingTbl_INVOICE_REFERENCE_NUM] DEFAULT (0),
    [PTITLE] varchar(60) NOT NULL CONSTRAINT [DF_Rpt_WorkingTbl_PTITLE] DEFAULT (''),
    [PROD_TYPE] varchar(10) NOT NULL CONSTRAINT [DF_Rpt_WorkingTbl_PROD_TYPE] DEFAULT (''),
    [PAYMENT_PRIORITY] tinyint NOT NULL CONSTRAINT [DF_Rpt_WorkingTbl_PAYMENT_PRIORITY] DEFAULT (0),
    [CHAPT_ADDRESS] text NULL,
    [NOTE] text NULL,
    [FULL_ADDRESS] varchar(255) NOT NULL CONSTRAINT [DF_Rpt_WorkingTbl_FULL_ADDRESS] DEFAULT (''),
    [ADDRESS_1] varchar(40) NOT NULL CONSTRAINT [DF_Rpt_WorkingTbl_ADDRESS_1] DEFAULT (''),
    [ADDRESS_2] varchar(40) NOT NULL CONSTRAINT [DF_Rpt_WorkingTbl_ADDRESS_2] DEFAULT (''),
    [COMPANY_SORT] varchar(30) NOT NULL CONSTRAINT [DF_Rpt_WorkingTbl_COMPANY_SORT] DEFAULT (''),
    [CITY] varchar(40) NOT NULL CONSTRAINT [DF_Rpt_WorkingTbl_CITY] DEFAULT (''),
    [STATE_PROVINCE] varchar(15) NOT NULL CONSTRAINT [DF_Rpt_WorkingTbl_STATE_PROVINCE] DEFAULT (''),
    [ZIP] varchar(10) NOT NULL CONSTRAINT [DF_Rpt_WorkingTbl_ZIP] DEFAULT (''),
    [COUNTRY_CODE] varchar(10) NOT NULL CONSTRAINT [DF_Rpt_WorkingTbl_COUNTRY_CODE] DEFAULT (''),
    [BAR_CODE] varchar(14) NOT NULL CONSTRAINT [DF_Rpt_WorkingTbl_BAR_CODE] DEFAULT (''),
    [COUNTRY] varchar(25) NOT NULL CONSTRAINT [DF_Rpt_WorkingTbl_COUNTRY] DEFAULT (''),
    [PURPOSE] varchar(20) NOT NULL CONSTRAINT [DF_Rpt_WorkingTbl_PURPOSE] DEFAULT (''),
    [Temp_Int1] int NOT NULL CONSTRAINT [DF_Rpt_WorkingTbl_Temp_Int1] DEFAULT (0),
    [Temp_Int2] int NOT NULL CONSTRAINT [DF_Rpt_WorkingTbl_Temp_Int2] DEFAULT (0),
    [Temp_Int3] int NOT NULL CONSTRAINT [DF_Rpt_WorkingTbl_Temp_Int3] DEFAULT (0),
    [IS_FR_ITEM] bit NOT NULL CONSTRAINT [DF_Rpt_WorkingTbl_IS_FR_ITEM] DEFAULT (0),
    [ADDRESS_3] varchar(40) NOT NULL CONSTRAINT [DF_Rpt_WorkingTbl_ADDRESS_3] DEFAULT (''),
    [FAIR_MARKET_VALUE] numeric(15, 2) NOT NULL CONSTRAINT [DF_Rpt_WorkingTbl_FAIR_MARKET_VALUE] DEFAULT (0),
    [CRRT] varchar(40) NOT NULL CONSTRAINT [DF_Rpt_WorkingTbl_CRRT] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[RuleCriterion]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[RuleCriterion] (
    [RuleCriterionKey] uniqueidentifier NOT NULL,
    [RuleKey] uniqueidentifier NOT NULL,
    [ObjectName] nvarchar(200) NOT NULL,
    [Name] nvarchar(100) NOT NULL CONSTRAINT [DF_RuleCriterion_Name] DEFAULT (''),
    [UpdatedOn] datetime NOT NULL,
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[RuleFilter]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[RuleFilter] (
    [RuleFilterKey] uniqueidentifier NOT NULL,
    [RuleCriterionKey] uniqueidentifier NULL,
    [PropertyName] nvarchar(100) NULL,
    [ComparisonCode] int NULL,
    [ValueOne] nvarchar(200) NULL,
    [ValueOneTypeName] nvarchar(100) NULL,
    [ValueTwo] nvarchar(200) NULL,
    [ValueTwoTypeName] nvarchar(100) NULL,
    [UpdatedOn] datetime NOT NULL,
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[RuleMain]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[RuleMain] (
    [RuleKey] uniqueidentifier NOT NULL,
    [Name] nvarchar(50) NOT NULL,
    [Description] nvarchar(200) NULL CONSTRAINT [DF_RuleMain_Description] DEFAULT (''),
    [IsActive] bit NOT NULL,
    [Priority] int NOT NULL CONSTRAINT [DF_RuleMain_Priority] DEFAULT (999999),
    [BeginDate] datetime NULL,
    [EndDate] datetime NULL,
    [RuleEvaluatorComponentKey] uniqueidentifier NULL,
    [ObjectMapperComponentKey] uniqueidentifier NULL,
    [UpdatedOn] datetime NOT NULL CONSTRAINT [DF_RuleMain_UpdatedOn] DEFAULT (getdate()),
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedOn] datetime NOT NULL,
    [SystemEntityKey] uniqueidentifier NOT NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[SalesHistory]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[SalesHistory] (
    [SalesHistoryKey] uniqueidentifier NOT NULL,
    [TransactionDate] datetime NOT NULL,
    [OrderNumber] nvarchar(50) NULL,
    [OrderTypeKey] uniqueidentifier NULL,
    [OrderDate] datetime NULL,
    [InvoiceTypeCode] nchar(1) NOT NULL,
    [BillToContactKey] uniqueidentifier NOT NULL,
    [ShipToContactKey] uniqueidentifier NOT NULL,
    [SoldToContactKey] uniqueidentifier NOT NULL,
    [ProductKey] uniqueidentifier NOT NULL,
    [WarehouseKey] uniqueidentifier NULL,
    [QuantitySold] decimal(18, 8) NOT NULL,
    [ExtendedPrice] decimal(18, 4) NOT NULL,
    [UndiscountedExtendedPrice] decimal(18, 4) NOT NULL,
    [ExtendedCost] decimal(18, 4) NOT NULL,
    [UomKey] uniqueidentifier NULL,
    [SourceCodeKey] uniqueidentifier NULL,
    [ResponseMediaCode] nvarchar(20) NULL,
    [PriceSheetKey] uniqueidentifier NULL,
    [CommissionPlanKey] uniqueidentifier NULL,
    [SalesTeamGroupKey] uniqueidentifier NULL,
    [SalesLocationKey] uniqueidentifier NULL,
    [IsPledge] bit NULL,
    [ListAs] nvarchar(100) NULL,
    [Description] nvarchar(200) NULL,
    [InvoiceNumber] nvarchar(50) NULL,
    [InvoiceLineNumber] int NULL,
    [SourceSalesHistoryKey] uniqueidentifier NULL,
    [PromotionDiscountKey] uniqueidentifier NULL,
    [AccessKey] uniqueidentifier NOT NULL,
    [CreatedOn] datetime NOT NULL,
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [SystemEntityKey] uniqueidentifier NOT NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[SalesHistoryMemorialTribute]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[SalesHistoryMemorialTribute] (
    [SalesHistoryMemorialTributeKey] uniqueidentifier NOT NULL,
    [SalesHistoryKey] uniqueidentifier NOT NULL,
    [ContactKey] uniqueidentifier NULL,
    [Description] nvarchar(200) NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[SalesHistoryRelationshipTypeRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[SalesHistoryRelationshipTypeRef] (
    [SalesHistoryRelationshipTypeCode] int NOT NULL,
    [SalesHistoryRelationshipTypeName] nvarchar(20) NOT NULL,
    [SalesHistoryRelationshipTypeDesc] nvarchar(50) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[SalesHistorySoftCredit]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[SalesHistorySoftCredit] (
    [SalesHistorySoftCreditKey] uniqueidentifier NOT NULL,
    [SalesHistoryKey] uniqueidentifier NOT NULL,
    [ContactKey] uniqueidentifier NOT NULL,
    [PercentCredit] decimal(12, 4) NOT NULL,
    [Amount] decimal(18, 4) NOT NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[SalesLocationStatusRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[SalesLocationStatusRef] (
    [SalesLocationStatusCode] int NOT NULL,
    [SalesLocationStatusName] nvarchar(20) NOT NULL,
    [SalesLocationStatusDesc] nvarchar(50) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[SalutationRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[SalutationRef] (
    [SalutationKey] uniqueidentifier NOT NULL,
    [SalutationDesc] nvarchar(30) NOT NULL,
    [IndividualFormula] nvarchar(500) NULL,
    [IsDefault] bit NOT NULL CONSTRAINT [DF_SalutationRef_IsDefault] DEFAULT (0),
    [IsOverrideable] bit NOT NULL CONSTRAINT [DF_SalutationRef_IsOverrideable] DEFAULT (0),
    [IsActive] bit NOT NULL CONSTRAINT [DF_SalutationRef_IsActive] DEFAULT (0),
    [AutoCreateFlag] bit NOT NULL CONSTRAINT [DF_SalutationRef_AutoCreateFlag] DEFAULT (0),
    [InstituteFormula] nvarchar(500) NULL,
    [NeedsGenerationFlag] bit NOT NULL CONSTRAINT [DF_SalutationRef_NeedsGenerationFlag] DEFAULT (0),
    [NeedsUpdateFlag] bit NOT NULL CONSTRAINT [DF_SalutationRef_NeedsUpdateFlag] DEFAULT (0)
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[ScheduledTask]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ScheduledTask] (
    [ScheduledTaskKey] uniqueidentifier NOT NULL,
    [Description] nvarchar(200) NULL,
    [RunAsUserKey] uniqueidentifier NULL,
    [SingleInstanceConcurrency] bit NOT NULL CONSTRAINT [DF_ScheduledTask_SingleInstanceConcurrency] DEFAULT (0),
    [Schedule] ntext NULL,
    [IsDisabled] bit NOT NULL CONSTRAINT [DF_ScheduledTask_IsDisabled] DEFAULT (0),
    [Category] nvarchar(50) NULL,
    [SelectionLock] uniqueidentifier NULL,
    [KeepAlive] datetime NULL,
    [MostRecentRun] datetime NULL,
    [MostRecentWorkflowInstanceKey] uniqueidentifier NULL,
    [AtomKey] uniqueidentifier NULL,
    [AtomGraph] image NULL,
    [CreatedByUserKey] uniqueidentifier NULL,
    [CreatedOn] datetime NULL,
    [UpdatedByUserKey] uniqueidentifier NULL,
    [UpdatedOn] datetime NULL,
    [WorkflowInputParameters] image NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[ScheduledTaskHistory]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ScheduledTaskHistory] (
    [ScheduledTaskHistoryKey] uniqueidentifier NOT NULL,
    [ScheduledTaskKey] uniqueidentifier NOT NULL,
    [StartedOn] datetime NOT NULL,
    [FinishedOn] datetime NULL,
    [CompletionStatus] nvarchar(20) NULL,
    [WorkflowInstanceKey] uniqueidentifier NULL,
    [LogText] ntext NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[ScheduledTaskService]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ScheduledTaskService] (
    [ScheduledTaskServiceKey] uniqueidentifier NOT NULL CONSTRAINT [DF_ScheduledTaskService_ScheduledTaskServiceKey] DEFAULT (newid()),
    [MachineName] nvarchar(100) NULL,
    [ServiceName] nvarchar(100) NULL,
    [ServiceStatus] nvarchar(25) NULL,
    [BaseDirectory] nvarchar(500) NULL,
    [MaxWorkerCount] int NULL,
    [CategoryFilter] nvarchar(50) NULL,
    [UpdatedOn] datetime NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[ScreenResolutionRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ScreenResolutionRef] (
    [ScreenResolutionCode] nchar(1) NOT NULL,
    [ScreenResolutionDesc] nvarchar(30) NOT NULL,
    [Width] int NULL,
    [Height] int NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Search_Collection]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Search_Collection] (
    [ID] numeric(18, 0) IDENTITY(1,1) NOT NULL,
    [ActiveCollection] char(1) NOT NULL,
    [LastUpdateDateTime] datetime NOT NULL CONSTRAINT [DF_Search_Collection_LastUpdateDateTime] DEFAULT (getdate())
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Search_Requests]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Search_Requests] (
    [ImisSystem] varchar(10) NOT NULL CONSTRAINT [DF_Search_Requests_ImisSystem] DEFAULT (''),
    [Title] varchar(40) NOT NULL CONSTRAINT [DF_Search_Requests_Title] DEFAULT (''),
    [SearchText] text NOT NULL CONSTRAINT [DF_Search_Requests_SearchText] DEFAULT (''),
    [SearchList] image NULL,
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[SeasonalFullAddress]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[SeasonalFullAddress] (
    [SeasonalFullAddressKey] uniqueidentifier NOT NULL,
    [FullAddressKey] uniqueidentifier NOT NULL,
    [ReplacesFullAddressKey] uniqueidentifier NOT NULL,
    [BeginDate] datetime NOT NULL,
    [EndDate] datetime NULL,
    [IsSeasonalAnnually] bit NOT NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Security_Filters]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Security_Filters] (
    [SECURITY_GROUP] varchar(30) NOT NULL CONSTRAINT [DF_Security_Filters_SECURITY_GROUP] DEFAULT (''),
    [SECURITY_MODE] varchar(30) NOT NULL CONSTRAINT [DF_Security_Filters_SECURITY_MODE] DEFAULT (''),
    [TABLE_NAME] varchar(255) NOT NULL CONSTRAINT [DF_Security_Filters_TABLE_NAME] DEFAULT (''),
    [TABLE_ACCESSIBLE] bit NOT NULL CONSTRAINT [DF_Security_Filters_TABLE_ACCESSIBLE] DEFAULT (0),
    [TABLE_FILTER] varchar(254) NULL,
    [DESCRIPTION] varchar(255) NOT NULL CONSTRAINT [DF_Security_Filters_DESCRIPTION] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Security_Group_Rule]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Security_Group_Rule] (
    [SecurityGroupRuleID] numeric(18, 0) IDENTITY(1,1) NOT NULL,
    [RuleName] varchar(30) NOT NULL,
    [ValidationScript] varchar(255) NULL,
    [ValidationSQL] text NULL,
    [ValidationDSN] varchar(50) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Security_Group_Sync]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Security_Group_Sync] (
    [SecurityGroupCode] varchar(20) NOT NULL,
    [BackendSyncInd] char(1) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Security_Groups]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Security_Groups] (
    [SECURITY_GROUP] varchar(30) NOT NULL CONSTRAINT [DF_Security_Groups_SECURITY_GROUP] DEFAULT (''),
    [SECURITY_GROUP_DESCR] varchar(255) NOT NULL CONSTRAINT [DF_Security_Groups_SECURITY_GROUP_DESCR] DEFAULT (''),
    [WEBKITENABLED] bit NOT NULL CONSTRAINT [DF_Security_Groups_WEBKITENABLED] DEFAULT (0),
    [ADHOCENABLED] bit NOT NULL CONSTRAINT [DF_Security_Groups_ADHOCENABLED] DEFAULT (0),
    [MEMBERSHIPLEVEL] bit NOT NULL CONSTRAINT [DF_Security_Groups_MEMBERSHIPLEVEL] DEFAULT (0),
    [MEETINGSLEVEL] bit NOT NULL CONSTRAINT [DF_Security_Groups_MEETINGSLEVEL] DEFAULT (0),
    [SYSTEMLEVEL] bit NOT NULL CONSTRAINT [DF_Security_Groups_SYSTEMLEVEL] DEFAULT (0),
    [DUESLEVEL] bit NOT NULL CONSTRAINT [DF_Security_Groups_DUESLEVEL] DEFAULT (0),
    [CASHARLEVEL] bit NOT NULL CONSTRAINT [DF_Security_Groups_CASHARLEVEL] DEFAULT (0),
    [ORDERENTRYLEVEL] bit NOT NULL CONSTRAINT [DF_Security_Groups_ORDERENTRYLEVEL] DEFAULT (0),
    [REFERRALLEVEL] bit NOT NULL CONSTRAINT [DF_Security_Groups_REFERRALLEVEL] DEFAULT (0),
    [CERTLEVEL] bit NOT NULL CONSTRAINT [DF_Security_Groups_CERTLEVEL] DEFAULT (0),
    [FRLEVEL] bit NOT NULL CONSTRAINT [DF_Security_Groups_FRLEVEL] DEFAULT (0),
    [SECURITY_SEQ] tinyint NOT NULL CONSTRAINT [DF_Security_Groups_SECURITY_SEQ] DEFAULT (0),
    [COMMUNITIESLEVEL] bit NOT NULL CONSTRAINT [DF_Security_Groups_COMMUNITIESLEVEL] DEFAULT (0),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Security_Modes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Security_Modes] (
    [SECURITY_MODE] varchar(30) NOT NULL CONSTRAINT [DF_Security_Modes_SECURITY_MODE] DEFAULT (''),
    [DESCRIPTION] varchar(255) NOT NULL CONSTRAINT [DF_Security_Modes_DESCRIPTION] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Security_Tables]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Security_Tables] (
    [TABLE_NAME] varchar(255) NOT NULL CONSTRAINT [DF_Security_Tables_TABLE_NAME] DEFAULT (''),
    [MENU_NAME] varchar(255) NOT NULL CONSTRAINT [DF_Security_Tables_MENU_NAME] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[SegmentationJob]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[SegmentationJob] (
    [SegmentationJobKey] uniqueidentifier NOT NULL,
    [MemberObjectType] nvarchar(100) NOT NULL CONSTRAINT [DF_SegmentationJob_MemberObjectType] DEFAULT (''),
    [SegmentationJobStatusCode] int NOT NULL CONSTRAINT [DF_SegmentationJob_SegmentationJobStatusCode] DEFAULT (0),
    [Name] nvarchar(50) NOT NULL CONSTRAINT [DF_SegmentationJob_Name] DEFAULT (''),
    [Description] nvarchar(500) NOT NULL CONSTRAINT [DF_SegmentationJob_Description] DEFAULT (''),
    [InactiveDate] datetime NULL,
    [SupersetQueryDocumentKey] uniqueidentifier NULL,
    [UseNSelectFlag] bit NOT NULL CONSTRAINT [DF_SegmentationJob_UseNSelectFlag] DEFAULT (0),
    [NSelectSegments] int NOT NULL CONSTRAINT [DF_SegmentationJob_NSelectSegments] DEFAULT (0),
    [NSelectSegmentElements] int NOT NULL CONSTRAINT [DF_SegmentationJob_NSelectSegmentElements] DEFAULT (0),
    [LastListCreatedByUserKey] uniqueidentifier NULL,
    [LastListCreatedOn] datetime NULL,
    [IsExecutionEnabled] bit NOT NULL CONSTRAINT [DF_SegmentationJob_IsExecutionEnabled] DEFAULT (1),
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [UpdatedOn] datetime NOT NULL,
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedOn] datetime NOT NULL,
    [MarkedForDeleteOn] datetime NULL,
    [AccessKey] uniqueidentifier NOT NULL,
    [SystemEntityKey] uniqueidentifier NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[SegmentationJobStatusRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[SegmentationJobStatusRef] (
    [SegmentationJobStatusCode] int NOT NULL,
    [SegmentationJobStatusDesc] nvarchar(50) NOT NULL,
    [SegmentationJobStatusName] nvarchar(20) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[SegmentDefinition]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[SegmentDefinition] (
    [SegmentDefinitionKey] uniqueidentifier NOT NULL,
    [Name] nvarchar(50) NOT NULL CONSTRAINT [DF_SegmentDefinition_Name] DEFAULT (''),
    [Description] nvarchar(500) NOT NULL CONSTRAINT [DF_SegmentDefinition_Description] DEFAULT (''),
    [QueryDocumentKey] uniqueidentifier NULL,
    [ExecutionOrder] int NOT NULL CONSTRAINT [DF_SegmentDefinition_ExecutionOrder] DEFAULT (0),
    [IsJobNSelect] bit NOT NULL CONSTRAINT [DF_SegmentDefinition_IsJobNSelect] DEFAULT (0),
    [NSelectElements] int NOT NULL CONSTRAINT [DF_SegmentDefinition_NSelectElements] DEFAULT (0),
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [UpdatedOn] datetime NOT NULL,
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedOn] datetime NOT NULL,
    [SegmentationJobKey] uniqueidentifier NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Sender_Codes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Sender_Codes] (
    [SENDER_CODE] varchar(40) NOT NULL CONSTRAINT [DF_Sender_Codes_SENDER_CODE] DEFAULT (''),
    [SENDER_DESCRIPTION] varchar(100) NOT NULL CONSTRAINT [DF_Sender_Codes_SENDER_DESCRIPTION] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[SequenceCounter]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[SequenceCounter] (
    [OrganizationKey] uniqueidentifier NOT NULL CONSTRAINT [DF_SequenceCounter_OrganizationKey] DEFAULT ('00000000-0000-0000-0000-000000000000'),
    [SystemEntityKey] uniqueidentifier NOT NULL CONSTRAINT [DF_SequenceCounter_SystemEntityKey] DEFAULT ('00000000-0000-0000-0000-000000000000'),
    [CounterName] nvarchar(30) NOT NULL,
    [CurrentValue] int NOT NULL CONSTRAINT [DF_SequenceCounter_CurrentValue] DEFAULT (0),
    [UpdatedOn] datetime NOT NULL,
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedOn] datetime NOT NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Service_Request]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Service_Request] (
    [ServiceReference] varchar(10) NOT NULL CONSTRAINT [DF_Service_Request_ServiceReference] DEFAULT (''),
    [DateTimeSubmitted] datetime NULL,
    [SubmitterId] varchar(10) NOT NULL CONSTRAINT [DF_Service_Request_SubmitterId] DEFAULT (''),
    [SubmitterName] varchar(40) NOT NULL CONSTRAINT [DF_Service_Request_SubmitterName] DEFAULT (''),
    [SubmitterCompany] varchar(60) NOT NULL CONSTRAINT [DF_Service_Request_SubmitterCompany] DEFAULT (''),
    [RecordedBy] varchar(15) NOT NULL CONSTRAINT [DF_Service_Request_RecordedBy] DEFAULT (''),
    [LatestResponse] text NULL,
    [Title] varchar(60) NOT NULL CONSTRAINT [DF_Service_Request_Title] DEFAULT (''),
    [ServiceType] varchar(10) NOT NULL CONSTRAINT [DF_Service_Request_ServiceType] DEFAULT (''),
    [Area] varchar(10) NOT NULL CONSTRAINT [DF_Service_Request_Area] DEFAULT (''),
    [ImisSystem] varchar(25) NOT NULL CONSTRAINT [DF_Service_Request_ImisSystem] DEFAULT (''),
    [ReleaseNotes] text NULL,
    [ProgramModule] varchar(40) NOT NULL CONSTRAINT [DF_Service_Request_ProgramModule] DEFAULT (''),
    [Description] text NULL,
    [SubmitterPriority] tinyint NOT NULL CONSTRAINT [DF_Service_Request_SubmitterPriority] DEFAULT (0),
    [Category] varchar(10) NOT NULL CONSTRAINT [DF_Service_Request_Category] DEFAULT (''),
    [ProductVersion] varchar(20) NOT NULL CONSTRAINT [DF_Service_Request_ProductVersion] DEFAULT (''),
    [Environment] varchar(20) NOT NULL CONSTRAINT [DF_Service_Request_Environment] DEFAULT (''),
    [Client] varchar(10) NOT NULL CONSTRAINT [DF_Service_Request_Client] DEFAULT (''),
    [Status] varchar(10) NOT NULL CONSTRAINT [DF_Service_Request_Status] DEFAULT (''),
    [Priority] tinyint NOT NULL CONSTRAINT [DF_Service_Request_Priority] DEFAULT (0),
    [IsPublic] bit NOT NULL CONSTRAINT [DF_Service_Request_IsPublic] DEFAULT (0),
    [AssignedTo] varchar(15) NOT NULL CONSTRAINT [DF_Service_Request_AssignedTo] DEFAULT (''),
    [DateTimeAssigned] datetime NULL,
    [HistoryLog] text NULL,
    [ProgrammerNotes] text NULL,
    [DateTimeResolved] datetime NULL,
    [ResolutionCode] varchar(20) NOT NULL CONSTRAINT [DF_Service_Request_ResolutionCode] DEFAULT (''),
    [ResolvedBy] varchar(15) NOT NULL CONSTRAINT [DF_Service_Request_ResolvedBy] DEFAULT (''),
    [VersionResolvedIn] varchar(20) NOT NULL CONSTRAINT [DF_Service_Request_VersionResolvedIn] DEFAULT (''),
    [TestedBy] varchar(15) NOT NULL CONSTRAINT [DF_Service_Request_TestedBy] DEFAULT (''),
    [DateTimeTested] datetime NULL,
    [TestComments] text NULL,
    [ChangeHistory] text NULL,
    [ActionRequest] varchar(10) NOT NULL CONSTRAINT [DF_Service_Request_ActionRequest] DEFAULT (''),
    [INTENT_TO_EDIT] varchar(80) NOT NULL CONSTRAINT [DF_Service_Request_INTENT_TO_EDIT] DEFAULT (''),
    [IssueReference] varchar(10) NOT NULL CONSTRAINT [DF_Service_Request_IssueReference] DEFAULT (''),
    [Dev_Status] varchar(10) NOT NULL CONSTRAINT [DF_Service_Request_Dev_Status] DEFAULT (''),
    [CategoryLevel] varchar(255) NOT NULL CONSTRAINT [DF_Service_Request_CategoryLevel] DEFAULT (''),
    [ContactType] varchar(8) NOT NULL CONSTRAINT [DF_Service_Request_ContactType] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[ServiceStatusRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ServiceStatusRef] (
    [ServiceStatusCode] nvarchar(25) NOT NULL,
    [ServiceStatusDesc] nvarchar(100) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[ShipPriceRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ShipPriceRef] (
    [ShipPriceCode] int NOT NULL,
    [ShipPriceDesc] char(30) NOT NULL,
    [DisplayPrompt] nvarchar(100) NOT NULL CONSTRAINT [DF_ShipPriceRef_DisplayPrompt] DEFAULT ('')
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[SocialNetworkRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[SocialNetworkRef] (
    [SocialNetworkKey] uniqueidentifier NOT NULL CONSTRAINT [DF_SocialNetworkRef_SocialNetworkKey] DEFAULT (newid()),
    [SocialNetworkName] nvarchar(50) NOT NULL,
    [BaseURL] varchar(100) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[SoftCreditRelationshipType]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[SoftCreditRelationshipType] (
    [SoftCreditRelationshipKey] uniqueidentifier NOT NULL,
    [RelationshipTypeKey] uniqueidentifier NOT NULL,
    [Percentage] decimal(12, 4) NOT NULL CONSTRAINT [DF_SoftCreditRelationshipType_Percentage] DEFAULT (0),
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [UpdatedOn] datetime NOT NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[SolicitationMain]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[SolicitationMain] (
    [SolicitationKey] uniqueidentifier NOT NULL,
    [Name] nvarchar(50) NOT NULL,
    [Description] nvarchar(200) NULL,
    [SolicitationStatusCode] int NOT NULL CONSTRAINT [DF_SolicitationMain_SolicitationStatusCode] DEFAULT (0),
    [CostCollection] ntext NULL,
    [TargetRevenue] decimal(18, 4) NOT NULL CONSTRAINT [DF_SolicitationMain_TargetRevenue] DEFAULT (0),
    [TotalRevenue] decimal(18, 4) NOT NULL CONSTRAINT [DF_SolicitationMain_TotalRevenue] DEFAULT (0),
    [PredictedResponseRate] decimal(5, 4) NOT NULL CONSTRAINT [DF_SolicitationMain_PredictedResponseRate] DEFAULT (0),
    [StartDate] datetime NULL,
    [EndDate] datetime NULL,
    [ReminderDate] datetime NULL,
    [UpdatedOn] datetime NOT NULL,
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [LowResponseAmount] decimal(18, 4) NOT NULL CONSTRAINT [DF_SolicitationMain_LowResponseAmount] DEFAULT (0),
    [HighResponseAmount] decimal(18, 4) NOT NULL CONSTRAINT [DF_SolicitationMain_HighResponseAmount] DEFAULT (0),
    [ActualCost] decimal(18, 4) NOT NULL CONSTRAINT [DF_SolicitationMain_ActualCost] DEFAULT (0),
    [EstimatedCost] decimal(18, 4) NOT NULL CONSTRAINT [DF_SolicitationMain_EstimatedCost] DEFAULT (0),
    [ExtendedCost] decimal(18, 4) NOT NULL CONSTRAINT [DF_SolicitationMain_ExtendedCost] DEFAULT (0),
    [OverheadCost] decimal(18, 4) NOT NULL CONSTRAINT [DF_SolicitationMain_OverheadCost] DEFAULT (0),
    [FirstResponseDate] datetime NULL,
    [LastResponseDate] datetime NULL,
    [TotalPositiveResponse] int NOT NULL CONSTRAINT [DF_SolicitationMain_TotalPositiveResponse] DEFAULT (0),
    [TotalNegativeResponse] int NOT NULL CONSTRAINT [DF_SolicitationMain_TotalNegativeResponse] DEFAULT (0),
    [TotalSolicited] int NOT NULL CONSTRAINT [DF_SolicitationMain_TotalSolicited] DEFAULT (0),
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedOn] datetime NOT NULL,
    [AppealKey] uniqueidentifier NULL,
    [AccessKey] uniqueidentifier NOT NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[SolicitationSource]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[SolicitationSource] (
    [SourceCodeKey] uniqueidentifier NOT NULL,
    [SolicitationSourceKey] uniqueidentifier NOT NULL,
    [SelectorComponentKey] uniqueidentifier NULL,
    [OriginListKeys] nvarchar(3400) NOT NULL CONSTRAINT [DF_SolicitationSource_OriginListKeys] DEFAULT (''),
    [OriginListType] nvarchar(50) NOT NULL CONSTRAINT [DF_SolicitationSource_OriginListType] DEFAULT (''),
    [NavigationHint] ntext NULL,
    [DisplayText] nvarchar(200) NULL,
    [UpdatedOn] datetime NOT NULL,
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedOn] datetime NOT NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[SolicitationStatusRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[SolicitationStatusRef] (
    [SolicitationStatusCode] int NOT NULL,
    [SolicitationStatusDesc] nvarchar(50) NOT NULL,
    [SolicitationStatusName] nvarchar(20) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[SortNameAdjustment]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[SortNameAdjustment] (
    [SortNameTargetWord] varchar(20) NOT NULL,
    [SortNameAdjustmentActionCode] nchar(1) NOT NULL,
    [SortNameSubstituteWord] varchar(20) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[SortNameAdjustmentActionRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[SortNameAdjustmentActionRef] (
    [SortNameAdjustmentActionCode] nchar(1) NOT NULL,
    [SortNameAdjustmentActionName] nvarchar(20) NOT NULL,
    [SortNameAdjustmentActionDesc] nvarchar(50) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Source_Codes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Source_Codes] (
    [SOURCE_CODE] varchar(40) NOT NULL CONSTRAINT [DF_Source_Codes_SOURCE_CODE] DEFAULT (''),
    [CAMPAIGN_CODE] varchar(10) NOT NULL CONSTRAINT [DF_Source_Codes_CAMPAIGN_CODE] DEFAULT (''),
    [TITLE] varchar(60) NOT NULL CONSTRAINT [DF_Source_Codes_TITLE] DEFAULT (''),
    [DESCRIPTION] text NULL,
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[SourceCode]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[SourceCode] (
    [SourceCodeKey] uniqueidentifier NOT NULL,
    [Name] nvarchar(50) NOT NULL,
    [Description] nvarchar(200) NULL,
    [Code] nvarchar(40) NOT NULL,
    [SourceCodeTypeCode] int NOT NULL CONSTRAINT [DF_SourceCode_SourceCodeTypeCode] DEFAULT (0),
    [CostCollection] ntext NULL,
    [OverheadCost] decimal(18, 4) NOT NULL CONSTRAINT [DF_SourceCode_OverheadCost] DEFAULT (0),
    [EstimatedCost] decimal(18, 4) NOT NULL CONSTRAINT [DF_SourceCode_EstimatedCost] DEFAULT (0),
    [TargetRevenue] decimal(18, 4) NOT NULL CONSTRAINT [DF_SourceCode_TargetRevenue] DEFAULT (0),
    [TotalRevenue] decimal(18, 4) NOT NULL CONSTRAINT [DF_SourceCode_TotalRevenue] DEFAULT (0),
    [TotalSolicited] int NOT NULL CONSTRAINT [DF_SourceCode_TotalSolicited] DEFAULT (0),
    [PredictedResponseRate] decimal(5, 4) NOT NULL CONSTRAINT [DF_SourceCode_PredictedResponseRate] DEFAULT (0),
    [PackageKey] uniqueidentifier NULL,
    [ExternalListCount] int NOT NULL CONSTRAINT [DF_SourceCode_ExternalListCount] DEFAULT (0),
    [ExternalFileName] nvarchar(128) NOT NULL CONSTRAINT [DF_SourceCode_ExternalFileName] DEFAULT (''),
    [SourceCodeStatusCode] int NOT NULL CONSTRAINT [DF_SourceCode_SourceCodeStatusCode] DEFAULT (0),
    [ResponsesTotalledOn] datetime NULL,
    [LastDropDate] datetime NULL,
    [FirstResponseDate] datetime NULL,
    [LastResponseDate] datetime NULL,
    [LowResponseAmount] decimal(18, 4) NOT NULL CONSTRAINT [DF_SourceCode_LowResponseAmount] DEFAULT (0),
    [HighResponseAmount] decimal(18, 4) NOT NULL CONSTRAINT [DF_SourceCode_HighResponseAmount] DEFAULT (0),
    [TotalPositiveResponse] int NOT NULL CONSTRAINT [DF_SourceCode_TotalPositiveResponse] DEFAULT (0),
    [TotalNegativeResponse] int NOT NULL CONSTRAINT [DF_SourceCode_TotalNegativeResponse] DEFAULT (0),
    [UpdatedOn] datetime NOT NULL,
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedOn] datetime NOT NULL,
    [SolicitationKey] uniqueidentifier NULL,
    [MarkedForDeleteOn] datetime NULL,
    [AccessKey] uniqueidentifier NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[SourceCodeStatusRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[SourceCodeStatusRef] (
    [SourceCodeStatusCode] int NOT NULL,
    [SourceCodeStatusDesc] nvarchar(50) NOT NULL,
    [SourceCodeStatusName] nvarchar(20) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[SourceCodeTypeRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[SourceCodeTypeRef] (
    [SourceCodeTypeCode] int NOT NULL,
    [SourceCodeTypeDesc] nvarchar(50) NOT NULL,
    [SourceCodeTypeName] nvarchar(20) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[StandardPageRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[StandardPageRef] (
    [StandardPageCode] nvarchar(4) NOT NULL,
    [StandardPageDesc] nvarchar(100) NOT NULL,
    [StandardPageUrl] nvarchar(256) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[State_Codes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[State_Codes] (
    [STATE_PROVINCE] varchar(15) NOT NULL CONSTRAINT [DF_State_Codes_STATE_PROVINCE] DEFAULT (''),
    [TITLE] varchar(30) NOT NULL CONSTRAINT [DF_State_Codes_TITLE] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[StateProvinceRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[StateProvinceRef] (
    [StateProvinceCode] nvarchar(5) NOT NULL,
    [CountryCode] nchar(2) NOT NULL CONSTRAINT [DF_StateProvinceRef_CountryCode] DEFAULT (''),
    [StateProvinceDesc] nvarchar(50) NULL CONSTRAINT [DF_StateProvinceRef_StateProvinceDesc] DEFAULT (''),
    [ChapterGroupKey] uniqueidentifier NULL,
    [IsActive] bit NOT NULL,
    [IsHandModified] bit NOT NULL,
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [UpdatedOn] datetime NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Stored_List]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Stored_List] (
    [ListName] varchar(60) NOT NULL CONSTRAINT [DF_Stored_List_ListName] DEFAULT (''),
    [NumberSequence] numeric(15, 2) NOT NULL CONSTRAINT [DF_Stored_List_NumberSequence] DEFAULT (0),
    [DateCreated] datetime NULL,
    [CreatedBy] varchar(15) NOT NULL CONSTRAINT [DF_Stored_List_CreatedBy] DEFAULT (''),
    [Expires] datetime NULL,
    [PrintProcedure] varchar(30) NOT NULL CONSTRAINT [DF_Stored_List_PrintProcedure] DEFAULT (''),
    [ReportOptions] text NOT NULL CONSTRAINT [DF_Stored_List_ReportOptions] DEFAULT (''),
    [ListType] varchar(10) NOT NULL CONSTRAINT [DF_Stored_List_ListType] DEFAULT (''),
    [Heading] text NOT NULL CONSTRAINT [DF_Stored_List_Heading] DEFAULT (''),
    [ObsoleteMenuKey] varchar(75) NOT NULL CONSTRAINT [DF_Stored_List_ObsoleteMenuKey] DEFAULT (''),
    [ListObject] image NULL,
    [ShowPrint] bit NOT NULL CONSTRAINT [DF_Stored_List_ShowPrint] DEFAULT (0),
    [ShowSpread] bit NOT NULL CONSTRAINT [DF_Stored_List_ShowSpread] DEFAULT (0),
    [ShowGraph] bit NOT NULL CONSTRAINT [DF_Stored_List_ShowGraph] DEFAULT (0),
    [Bool4] bit NOT NULL CONSTRAINT [DF_Stored_List_Bool4] DEFAULT (0),
    [Bool5] bit NOT NULL CONSTRAINT [DF_Stored_List_Bool5] DEFAULT (0),
    [Bool6] bit NOT NULL CONSTRAINT [DF_Stored_List_Bool6] DEFAULT (0),
    [ImisSystem] varchar(10) NOT NULL CONSTRAINT [DF_Stored_List_ImisSystem] DEFAULT (''),
    [Category] varchar(20) NOT NULL CONSTRAINT [DF_Stored_List_Category] DEFAULT (''),
    [Title] varchar(45) NOT NULL CONSTRAINT [DF_Stored_List_Title] DEFAULT (''),
    [Field1] varchar(100) NOT NULL CONSTRAINT [DF_Stored_List_Field1] DEFAULT (''),
    [Field2] varchar(100) NOT NULL CONSTRAINT [DF_Stored_List_Field2] DEFAULT (''),
    [Field3] varchar(100) NOT NULL CONSTRAINT [DF_Stored_List_Field3] DEFAULT (''),
    [Field4] varchar(100) NOT NULL CONSTRAINT [DF_Stored_List_Field4] DEFAULT (''),
    [Field5] varchar(100) NOT NULL CONSTRAINT [DF_Stored_List_Field5] DEFAULT (''),
    [Field6] varchar(100) NOT NULL CONSTRAINT [DF_Stored_List_Field6] DEFAULT (''),
    [field7] varchar(100) NOT NULL CONSTRAINT [DF_Stored_List_field7] DEFAULT (''),
    [Field8] varchar(100) NOT NULL CONSTRAINT [DF_Stored_List_Field8] DEFAULT (''),
    [DateLastRun] datetime NULL,
    [BatchNumber] int NOT NULL CONSTRAINT [DF_Stored_List_BatchNumber] DEFAULT (0),
    [NRDS_Indicator] bit NOT NULL CONSTRAINT [DF_Stored_List_NRDS_Indicator] DEFAULT (0),
    [Office_Validation] bit NOT NULL CONSTRAINT [DF_Stored_List_Office_Validation] DEFAULT (0),
    [Member_Validation] bit NOT NULL CONSTRAINT [DF_Stored_List_Member_Validation] DEFAULT (0),
    [Alternate_Check] varchar(100) NOT NULL CONSTRAINT [DF_Stored_List_Alternate_Check] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Style_Options]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Style_Options] (
    [STYLE_TYPE] varchar(10) NOT NULL CONSTRAINT [DF_Style_Options_STYLE_TYPE] DEFAULT (''),
    [H1_COLOR] varchar(20) NOT NULL CONSTRAINT [DF_Style_Options_H1_COLOR] DEFAULT (''),
    [H1_FACE] varchar(20) NOT NULL CONSTRAINT [DF_Style_Options_H1_FACE] DEFAULT (''),
    [H1_SIZE] varchar(20) NOT NULL CONSTRAINT [DF_Style_Options_H1_SIZE] DEFAULT (''),
    [H2_COLOR] varchar(20) NOT NULL CONSTRAINT [DF_Style_Options_H2_COLOR] DEFAULT (''),
    [H2_FACE] varchar(20) NOT NULL CONSTRAINT [DF_Style_Options_H2_FACE] DEFAULT (''),
    [H2_SIZE] varchar(20) NOT NULL CONSTRAINT [DF_Style_Options_H2_SIZE] DEFAULT (''),
    [H3_COLOR] varchar(20) NOT NULL CONSTRAINT [DF_Style_Options_H3_COLOR] DEFAULT (''),
    [H3_FACE] varchar(20) NOT NULL CONSTRAINT [DF_Style_Options_H3_FACE] DEFAULT (''),
    [H3_SIZE] varchar(20) NOT NULL CONSTRAINT [DF_Style_Options_H3_SIZE] DEFAULT (''),
    [H4_COLOR] varchar(20) NOT NULL CONSTRAINT [DF_Style_Options_H4_COLOR] DEFAULT (''),
    [H4_FACE] varchar(20) NOT NULL CONSTRAINT [DF_Style_Options_H4_FACE] DEFAULT (''),
    [H4_SIZE] varchar(20) NOT NULL CONSTRAINT [DF_Style_Options_H4_SIZE] DEFAULT (''),
    [H5_COLOR] varchar(20) NOT NULL CONSTRAINT [DF_Style_Options_H5_COLOR] DEFAULT (''),
    [H5_FACE] varchar(20) NOT NULL CONSTRAINT [DF_Style_Options_H5_FACE] DEFAULT (''),
    [H5_SIZE] varchar(20) NOT NULL CONSTRAINT [DF_Style_Options_H5_SIZE] DEFAULT (''),
    [BODY_BGCOLOR] varchar(20) NOT NULL CONSTRAINT [DF_Style_Options_BODY_BGCOLOR] DEFAULT (''),
    [BODY_BGIMAGE] varchar(20) NOT NULL CONSTRAINT [DF_Style_Options_BODY_BGIMAGE] DEFAULT (''),
    [P_COLOR] varchar(20) NOT NULL CONSTRAINT [DF_Style_Options_P_COLOR] DEFAULT (''),
    [P_FACE] varchar(20) NOT NULL CONSTRAINT [DF_Style_Options_P_FACE] DEFAULT (''),
    [P_SIZE] varchar(20) NOT NULL CONSTRAINT [DF_Style_Options_P_SIZE] DEFAULT (''),
    [B_COLOR] varchar(20) NOT NULL CONSTRAINT [DF_Style_Options_B_COLOR] DEFAULT (''),
    [B_FACE] varchar(20) NOT NULL CONSTRAINT [DF_Style_Options_B_FACE] DEFAULT (''),
    [B_SIZE] varchar(20) NOT NULL CONSTRAINT [DF_Style_Options_B_SIZE] DEFAULT (''),
    [STRONG_COLOR] varchar(20) NOT NULL CONSTRAINT [DF_Style_Options_STRONG_COLOR] DEFAULT (''),
    [STRONG_FACE] varchar(20) NOT NULL CONSTRAINT [DF_Style_Options_STRONG_FACE] DEFAULT (''),
    [STRONG_SIZE] varchar(20) NOT NULL CONSTRAINT [DF_Style_Options_STRONG_SIZE] DEFAULT (''),
    [TEXT_COLOR] varchar(20) NOT NULL CONSTRAINT [DF_Style_Options_TEXT_COLOR] DEFAULT (''),
    [TEXT_FACE] varchar(20) NOT NULL CONSTRAINT [DF_Style_Options_TEXT_FACE] DEFAULT (''),
    [TEXT_SIZE] varchar(20) NOT NULL CONSTRAINT [DF_Style_Options_TEXT_SIZE] DEFAULT (''),
    [AACTIVE_COLOR] varchar(20) NOT NULL CONSTRAINT [DF_Style_Options_AACTIVE_COLOR] DEFAULT (''),
    [AACTIVE_FACE] varchar(20) NOT NULL CONSTRAINT [DF_Style_Options_AACTIVE_FACE] DEFAULT (''),
    [AACTIVE_SIZE] varchar(20) NOT NULL CONSTRAINT [DF_Style_Options_AACTIVE_SIZE] DEFAULT (''),
    [AVISITED_COLOR] varchar(20) NOT NULL CONSTRAINT [DF_Style_Options_AVISITED_COLOR] DEFAULT (''),
    [AVISITED_FACE] varchar(20) NOT NULL CONSTRAINT [DF_Style_Options_AVISITED_FACE] DEFAULT (''),
    [AVISITED_SIZE] varchar(20) NOT NULL CONSTRAINT [DF_Style_Options_AVISITED_SIZE] DEFAULT (''),
    [ALINK_COLOR] varchar(20) NOT NULL CONSTRAINT [DF_Style_Options_ALINK_COLOR] DEFAULT (''),
    [ALINK_FACE] varchar(20) NOT NULL CONSTRAINT [DF_Style_Options_ALINK_FACE] DEFAULT (''),
    [ALINK_SIZE] varchar(20) NOT NULL CONSTRAINT [DF_Style_Options_ALINK_SIZE] DEFAULT (''),
    [TH_BGCOLOR] varchar(20) NOT NULL CONSTRAINT [DF_Style_Options_TH_BGCOLOR] DEFAULT (''),
    [TH_COLOR] varchar(20) NOT NULL CONSTRAINT [DF_Style_Options_TH_COLOR] DEFAULT (''),
    [TH_FACE] varchar(20) NOT NULL CONSTRAINT [DF_Style_Options_TH_FACE] DEFAULT (''),
    [TH_SIZE] varchar(20) NOT NULL CONSTRAINT [DF_Style_Options_TH_SIZE] DEFAULT (''),
    [TD_BGCOLOR] varchar(20) NOT NULL CONSTRAINT [DF_Style_Options_TD_BGCOLOR] DEFAULT (''),
    [TD_COLOR] varchar(20) NOT NULL CONSTRAINT [DF_Style_Options_TD_COLOR] DEFAULT (''),
    [TD_FACE] varchar(20) NOT NULL CONSTRAINT [DF_Style_Options_TD_FACE] DEFAULT (''),
    [TD_SIZE] varchar(20) NOT NULL CONSTRAINT [DF_Style_Options_TD_SIZE] DEFAULT (''),
    [TOP_BGCOLOR] varchar(20) NOT NULL CONSTRAINT [DF_Style_Options_TOP_BGCOLOR] DEFAULT (''),
    [TOP_BGIMAGE] varchar(20) NOT NULL CONSTRAINT [DF_Style_Options_TOP_BGIMAGE] DEFAULT (''),
    [INDEX_TOPIMAGE] varchar(20) NOT NULL CONSTRAINT [DF_Style_Options_INDEX_TOPIMAGE] DEFAULT (''),
    [HEADER_IMAGE] varchar(20) NOT NULL CONSTRAINT [DF_Style_Options_HEADER_IMAGE] DEFAULT (''),
    [TOP_BANNERIMAGE] varchar(20) NOT NULL CONSTRAINT [DF_Style_Options_TOP_BANNERIMAGE] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Sub_Component_Ref]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Sub_Component_Ref] (
    [ComponentCode] char(2) NOT NULL,
    [SubComponentCode] char(2) NOT NULL,
    [SubComponentDesc] varchar(30) NOT NULL,
    [TableName] varchar(128) NULL,
    [KeyColumnName] varchar(128) NULL,
    [ActiveFlag] char(1) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Subscriptions]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Subscriptions] (
    [ID] varchar(10) NOT NULL CONSTRAINT [DF_Subscriptions_ID] DEFAULT (''),
    [PRODUCT_CODE] varchar(31) NOT NULL CONSTRAINT [DF_Subscriptions_PRODUCT_CODE] DEFAULT (''),
    [BT_ID] varchar(10) NOT NULL CONSTRAINT [DF_Subscriptions_BT_ID] DEFAULT (''),
    [PROD_TYPE] varchar(10) NOT NULL CONSTRAINT [DF_Subscriptions_PROD_TYPE] DEFAULT (''),
    [STATUS] varchar(5) NOT NULL CONSTRAINT [DF_Subscriptions_STATUS] DEFAULT (''),
    [BEGIN_DATE] datetime NULL,
    [PAID_THRU] datetime NULL,
    [COPIES] int NOT NULL CONSTRAINT [DF_Subscriptions_COPIES] DEFAULT (0),
    [SOURCE_CODE] varchar(40) NOT NULL CONSTRAINT [DF_Subscriptions_SOURCE_CODE] DEFAULT (''),
    [FIRST_SUBSCRIBED] datetime NULL,
    [CONTINUOUS_SINCE] datetime NULL,
    [PRIOR_YEARS] int NOT NULL CONSTRAINT [DF_Subscriptions_PRIOR_YEARS] DEFAULT (0),
    [FUTURE_COPIES] int NOT NULL CONSTRAINT [DF_Subscriptions_FUTURE_COPIES] DEFAULT (0),
    [FUTURE_COPIES_DATE] datetime NULL,
    [PREF_MAIL] int NOT NULL CONSTRAINT [DF_Subscriptions_PREF_MAIL] DEFAULT (0),
    [PREF_BILL] int NOT NULL CONSTRAINT [DF_Subscriptions_PREF_BILL] DEFAULT (0),
    [RENEW_MONTHS] tinyint NOT NULL CONSTRAINT [DF_Subscriptions_RENEW_MONTHS] DEFAULT (0),
    [MAIL_CODE] varchar(5) NOT NULL CONSTRAINT [DF_Subscriptions_MAIL_CODE] DEFAULT (''),
    [PREVIOUS_BALANCE] money NOT NULL CONSTRAINT [DF_Subscriptions_PREVIOUS_BALANCE] DEFAULT (0),
    [BILL_DATE] datetime NULL,
    [REMINDER_DATE] datetime NULL,
    [REMINDER_COUNT] tinyint NOT NULL CONSTRAINT [DF_Subscriptions_REMINDER_COUNT] DEFAULT (0),
    [BILL_BEGIN] datetime NULL,
    [BILL_THRU] datetime NULL,
    [BILL_AMOUNT] money NOT NULL CONSTRAINT [DF_Subscriptions_BILL_AMOUNT] DEFAULT (0),
    [BILL_COPIES] int NOT NULL CONSTRAINT [DF_Subscriptions_BILL_COPIES] DEFAULT (0),
    [PAYMENT_AMOUNT] money NOT NULL CONSTRAINT [DF_Subscriptions_PAYMENT_AMOUNT] DEFAULT (0),
    [PAYMENT_DATE] datetime NULL,
    [PAID_BEGIN] datetime NULL,
    [LAST_PAID_THRU] datetime NULL,
    [COPIES_PAID] int NOT NULL CONSTRAINT [DF_Subscriptions_COPIES_PAID] DEFAULT (0),
    [ADJUSTMENT_AMOUNT] money NOT NULL CONSTRAINT [DF_Subscriptions_ADJUSTMENT_AMOUNT] DEFAULT (0),
    [LTD_PAYMENTS] money NOT NULL CONSTRAINT [DF_Subscriptions_LTD_PAYMENTS] DEFAULT (0),
    [ISSUES_PRINTED] varchar(255) NOT NULL CONSTRAINT [DF_Subscriptions_ISSUES_PRINTED] DEFAULT (''),
    [BALANCE] money NOT NULL CONSTRAINT [DF_Subscriptions_BALANCE] DEFAULT (0),
    [CANCEL_REASON] varchar(10) NOT NULL CONSTRAINT [DF_Subscriptions_CANCEL_REASON] DEFAULT (''),
    [YEARS_ACTIVE_STRING] varchar(100) NOT NULL CONSTRAINT [DF_Subscriptions_YEARS_ACTIVE_STRING] DEFAULT (''),
    [LAST_ISSUE] varchar(15) NOT NULL CONSTRAINT [DF_Subscriptions_LAST_ISSUE] DEFAULT (''),
    [LAST_ISSUE_DATE] datetime NULL,
    [DATE_ADDED] datetime NULL,
    [LAST_UPDATED] datetime NULL,
    [UPDATED_BY] varchar(60) NOT NULL CONSTRAINT [DF_Subscriptions_UPDATED_BY] DEFAULT (''),
    [INTENT_TO_EDIT] varchar(80) NOT NULL CONSTRAINT [DF_Subscriptions_INTENT_TO_EDIT] DEFAULT (''),
    [FLAG] varchar(5) NOT NULL CONSTRAINT [DF_Subscriptions_FLAG] DEFAULT (''),
    [BILL_TYPE] varchar(1) NOT NULL CONSTRAINT [DF_Subscriptions_BILL_TYPE] DEFAULT (''),
    [COMPLIMENTARY] bit NOT NULL CONSTRAINT [DF_Subscriptions_COMPLIMENTARY] DEFAULT (0),
    [FUTURE_CREDITS] money NOT NULL CONSTRAINT [DF_Subscriptions_FUTURE_CREDITS] DEFAULT (0),
    [INVOICE_REFERENCE_NUM] int NOT NULL CONSTRAINT [DF_Subscriptions_INVOICE_REFERENCE_NUM] DEFAULT (0),
    [INVOICE_LINE_NUM] int NOT NULL CONSTRAINT [DF_Subscriptions_INVOICE_LINE_NUM] DEFAULT (0),
    [CAMPAIGN_CODE] varchar(10) NOT NULL CONSTRAINT [DF_Subscriptions_CAMPAIGN_CODE] DEFAULT (''),
    [APPEAL_CODE] varchar(40) NOT NULL CONSTRAINT [DF_Subscriptions_APPEAL_CODE] DEFAULT (''),
    [ORG_CODE] varchar(5) NOT NULL CONSTRAINT [DF_Subscriptions_ORG_CODE] DEFAULT (''),
    [IS_FR_ITEM] bit NOT NULL CONSTRAINT [DF_Subscriptions_IS_FR_ITEM] DEFAULT (0),
    [FAIR_MARKET_VALUE] numeric(15, 2) NOT NULL CONSTRAINT [DF_Subscriptions_FAIR_MARKET_VALUE] DEFAULT (0),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[SuffixRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[SuffixRef] (
    [SuffixCode] nvarchar(10) NOT NULL CONSTRAINT [DF_SuffixRef_SuffixCode] DEFAULT (''),
    [SuffixDesc] nvarchar(30) NOT NULL CONSTRAINT [DF_SuffixRef_SuffixDesc] DEFAULT (''),
    [SyncSuffixCode] nvarchar(10) NULL CONSTRAINT [DF_SuffixRef_SyncSuffixCode] DEFAULT (''),
    [SuffixKey] uniqueidentifier NOT NULL CONSTRAINT [DF_SuffixRef_SuffixKey] DEFAULT (newid())
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[SupplementMain]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[SupplementMain] (
    [SupplementKey] uniqueidentifier NOT NULL,
    [Name] nvarchar(100) NOT NULL CONSTRAINT [DF_SupplementMain_Name] DEFAULT (''),
    [Description] nvarchar(255) NULL CONSTRAINT [DF_SupplementMain_Description] DEFAULT (''),
    [DocumentVersionKey] uniqueidentifier NULL,
    [SupplementStatusCode] int NOT NULL CONSTRAINT [DF_SupplementMain_SupplementStatusCode] DEFAULT (0),
    [Cost] decimal(18, 4) NULL CONSTRAINT [DF_SupplementMain_Cost] DEFAULT (0),
    [CostCollection] ntext NULL,
    [UpdatedOn] datetime NOT NULL CONSTRAINT [DF_SupplementMain_UpdatedOn] DEFAULT (getdate()),
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedOn] datetime NOT NULL,
    [AccessKey] uniqueidentifier NOT NULL,
    [SupplementTypeKey] uniqueidentifier NOT NULL,
    [SystemEntityKey] uniqueidentifier NOT NULL,
    [NotificationGroupKey] uniqueidentifier NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[SupplementStatusRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[SupplementStatusRef] (
    [SupplementStatusCode] int NOT NULL,
    [SupplementStatusDesc] nvarchar(50) NOT NULL,
    [SupplementStatusName] nvarchar(20) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[SupplementTypeRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[SupplementTypeRef] (
    [SupplementTypeKey] uniqueidentifier NOT NULL,
    [SupplementTypeDesc] nvarchar(50) NOT NULL,
    [IsEnclosure] bit NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[System_Params]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[System_Params] (
    [ParameterName] varchar(50) NOT NULL CONSTRAINT [DF_System_Params_ParameterName] DEFAULT (''),
    [ShortValue] varchar(255) NOT NULL CONSTRAINT [DF_System_Params_ShortValue] DEFAULT (''),
    [LongValue] text NULL,
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[System_Variable]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[System_Variable] (
    [ComponentCode] char(2) NOT NULL,
    [VariableTypeCode] char(1) NOT NULL,
    [Name] varchar(40) NOT NULL,
    [DataTypeCode] char(2) NOT NULL,
    [Value] varchar(750) NULL,
    [DefaultValue] varchar(750) NULL,
    [ChangeOnDeployFlag] char(1) NULL,
    [RelativeToFileWebCodeInd] char(1) NULL,
    [Description] varchar(2000) NULL,
    [AllowedValues] varchar(1000) NULL,
    [IsAQueryFlag] char(1) NULL,
    [ResetInLoginFlag] char(1) NULL,
    [CustomForClientFlag] char(1) NULL,
    [ActiveForClientFlag] char(1) NULL,
    [InternalNote] varchar(2000) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[SystemConfig]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[SystemConfig] (
    [SystemConfigKey] uniqueidentifier NOT NULL CONSTRAINT [DF_SystemConfig_SystemConfigKey] DEFAULT (newid()),
    [ParameterName] nvarchar(255) NOT NULL,
    [ParameterValue] nvarchar(2500) NULL,
    [Description] nvarchar(500) NULL,
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedOn] datetime NOT NULL,
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [UpdatedOn] datetime NOT NULL,
    [OrganizationKey] uniqueidentifier NOT NULL,
    [SystemEntityKey] uniqueidentifier NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[SystemConfigPageParameterRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[SystemConfigPageParameterRef] (
    [SystemConfigPageKey] uniqueidentifier NOT NULL,
    [ParameterName] nvarchar(255) NOT NULL,
    [SortOrder] int NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[SystemConfigPageRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[SystemConfigPageRef] (
    [SystemConfigPageKey] uniqueidentifier NOT NULL,
    [SystemConfigPageName] nvarchar(30) NOT NULL,
    [SystemConfigPageDesc] nvarchar(200) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[SystemConfigParameterRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[SystemConfigParameterRef] (
    [ParameterName] nvarchar(255) NOT NULL,
    [SystemKeyword] nvarchar(25) NOT NULL,
    [PropertyDefinitionKey] uniqueidentifier NULL,
    [Description] nvarchar(500) NULL,
    [DefaultParameterValue] nvarchar(2500) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[SystemConfigXml]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[SystemConfigXml] (
    [SystemConfigXmlCode] nvarchar(30) NOT NULL,
    [ConfigValue] nvarchar(max) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[SystemEntity]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[SystemEntity] (
    [SystemEntityKey] uniqueidentifier NOT NULL CONSTRAINT [DF_SystemEntity_SystemEntityKey] DEFAULT (newid()),
    [SystemKeyword] nvarchar(25) NOT NULL CONSTRAINT [DF_SystemEntity_SystemKeyword] DEFAULT (''),
    [IsActive] bit NOT NULL CONSTRAINT [DF_SystemEntity_IsActive] DEFAULT (0),
    [IsDefault] bit NOT NULL CONSTRAINT [DF_SystemEntity_IsDefault] DEFAULT (0),
    [Name] nvarchar(50) NOT NULL CONSTRAINT [DF_SystemEntity_Name] DEFAULT (''),
    [Description] nvarchar(250) NOT NULL CONSTRAINT [DF_SystemEntity_Description] DEFAULT (''),
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [UpdatedOn] datetime NULL,
    [ApplicationAccessKey] uniqueidentifier NULL,
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedOn] datetime NOT NULL,
    [AccessKey] uniqueidentifier NOT NULL,
    [OrganizationKey] uniqueidentifier NOT NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[SystemRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[SystemRef] (
    [SystemKeyword] nvarchar(25) NOT NULL,
    [SystemName] nvarchar(50) NOT NULL,
    [SystemDescription] nvarchar(250) NOT NULL,
    [SystemKey] uniqueidentifier NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Tag]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Tag] (
    [TagKey] uniqueidentifier NOT NULL,
    [TagName] nvarchar(100) NOT NULL,
    [TagDescription] nvarchar(200) NULL,
    [AccessKey] uniqueidentifier NOT NULL,
    [AssignAccessKey] uniqueidentifier NULL,
    [CreatedOn] datetime NOT NULL,
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [UpdatedOn] datetime NOT NULL CONSTRAINT [DF_Tag_UpdatedOn] DEFAULT (getdate()),
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [MarkedForDeleteOn] datetime NULL,
    [TagAliasList] nvarchar(2000) NULL,
    [IsCategory] bit NOT NULL CONSTRAINT [DF_Tag_IsCategory] DEFAULT (0)
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Tagged_Page_Color_Ref]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Tagged_Page_Color_Ref] (
    [TaggedPageColor] varchar(20) NOT NULL,
    [TaggedPageColorDesc] varchar(20) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Tagged_Page_Component_Column]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Tagged_Page_Component_Column] (
    [ComponentCode] char(2) NOT NULL,
    [ColumnName] varchar(50) NOT NULL,
    [ColumnDisplayName] varchar(255) NOT NULL,
    [RangeFlag] char(1) NOT NULL,
    [ActiveFlag] char(1) NOT NULL,
    [ColumnType] varchar(10) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Tagged_Page_Format_Ref]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Tagged_Page_Format_Ref] (
    [TaggedPageFormatID] numeric(18, 0) NOT NULL,
    [TaggedPageFormatFileName] varchar(50) NOT NULL,
    [TaggedPageFormatDisplayName] varchar(50) NOT NULL,
    [TaggedPageFormatSmallImage] varchar(50) NULL,
    [TaggedPageFormatLargeImage] varchar(50) NULL,
    [TaggedPageFormatTypeCode] char(1) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Tagged_Page_Format_Type_Ref]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Tagged_Page_Format_Type_Ref] (
    [TaggedPageFormatTypeCode] char(1) NOT NULL,
    [TaggedPageFormatTypeDesc] varchar(50) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Tagged_Page_Interest_Category]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Tagged_Page_Interest_Category] (
    [ContentID] numeric(18, 0) NOT NULL,
    [InterestCategoryID] numeric(18, 0) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Tagged_Page_Layout]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Tagged_Page_Layout] (
    [TaggedPageLayoutID] numeric(18, 0) IDENTITY(1,1) NOT NULL,
    [TaggedPageLayoutName] varchar(50) NOT NULL,
    [TaggedPageFormatID] numeric(18, 0) NOT NULL,
    [TaggedPageTitleCode] char(1) NOT NULL,
    [TaggedPageSource] char(1) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Tagged_Page_Portlet]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Tagged_Page_Portlet] (
    [TaggedPagePortletID] numeric(18, 0) IDENTITY(1,1) NOT NULL,
    [TaggedPageSectionID] numeric(18, 0) NOT NULL,
    [TaggedPortletID] numeric(18, 0) NOT NULL,
    [Title] varchar(50) NULL,
    [TitleImage] varchar(50) NULL,
    [MaxRows] numeric(18, 0) NULL,
    [PrimarySort] varchar(50) NULL,
    [PrimarySortAscDescInd] char(1) NULL,
    [SecondarySort] varchar(50) NULL,
    [SecondarySortAscDescInd] char(1) NULL,
    [ViewAllMessage] varchar(50) NULL,
    [OrderNum] numeric(18, 0) NOT NULL,
    [RequiredFlag] char(1) NULL,
    [UseOR] char(1) NOT NULL,
    [ViewAllImage] varchar(50) NULL,
    [Border] numeric(18, 0) NULL,
    [BorderColor] varchar(20) NULL,
    [BackgroundColor] varchar(20) NULL,
    [RangeFrom] varchar(25) NULL,
    [RangeTo] varchar(25) NULL,
    [RangeColumn] varchar(50) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Tagged_Page_PortletIC]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Tagged_Page_PortletIC] (
    [TaggedPagePortletID] numeric(18, 0) NOT NULL,
    [InterestCategoryID] numeric(18, 0) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Tagged_Page_Section]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Tagged_Page_Section] (
    [TaggedPageSectionID] numeric(18, 0) IDENTITY(1,1) NOT NULL,
    [TaggedPageLayoutID] numeric(18, 0) NOT NULL,
    [TaggedSectionID] numeric(18, 0) NOT NULL,
    [SectionWidth] numeric(18, 0) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Tagged_Page_Title_Ref]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Tagged_Page_Title_Ref] (
    [TaggedPageTitleCode] char(1) NOT NULL,
    [TaggedPageTitleDesc] varchar(50) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Tagged_Portlet]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Tagged_Portlet] (
    [TaggedPortletID] numeric(18, 0) IDENTITY(1,1) NOT NULL,
    [TaggedTemplateID] numeric(18, 0) NOT NULL,
    [TaggedPortletDisplayName] varchar(25) NOT NULL,
    [UserDefinedFlag] char(1) NOT NULL,
    [UserDefinedContent] varchar(4000) NULL,
    [BulletImage] varchar(50) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Tagged_Section]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Tagged_Section] (
    [TaggedSectionID] numeric(18, 0) NOT NULL,
    [TaggedPageFormatID] numeric(18, 0) NOT NULL,
    [TaggedSectionCode] char(2) NOT NULL,
    [TaggedSectionName] varchar(50) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Tagged_Section_Template]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Tagged_Section_Template] (
    [TaggedSectionID] numeric(18, 0) NOT NULL,
    [TaggedTemplateID] numeric(18, 0) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Tagged_Template]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Tagged_Template] (
    [TaggedTemplateID] numeric(18, 0) NOT NULL,
    [TaggedTemplateFileName] varchar(50) NOT NULL,
    [TaggedTemplateDisplayName] varchar(25) NOT NULL,
    [ComponentCode] char(2) NOT NULL,
    [PreventCacheFlag] char(1) NOT NULL,
    [SQLNumber] numeric(18, 0) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Tagged_Template_Field]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Tagged_Template_Field] (
    [TaggedTemplateID] numeric(18, 0) NOT NULL,
    [FieldName] varchar(50) NOT NULL,
    [FieldDisplayName] varchar(25) NOT NULL,
    [ActiveFlag] char(1) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[TagRelatedName]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[TagRelatedName] (
    [TagKey] uniqueidentifier NOT NULL,
    [RelatedName] nvarchar(100) NOT NULL,
    [TagRelationshipTypeCode] int NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[TagRelationship]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[TagRelationship] (
    [TagRelationshipKey] uniqueidentifier NOT NULL,
    [SubjectTagKey] uniqueidentifier NOT NULL,
    [TargetTagKey] uniqueidentifier NOT NULL,
    [TagRelationshipTypeCode] int NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[TagRelationshipTypeRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[TagRelationshipTypeRef] (
    [TagRelationshipTypeCode] int NOT NULL,
    [TagRelationshipTypeName] nvarchar(30) NOT NULL,
    [TagRelationshipTypeDesc] nvarchar(30) NOT NULL,
    [ReciprocalTagRelationshipTypeCode] int NOT NULL CONSTRAINT [DF_TagRelationshipTypeRef_ReciprocalTagRelationshipTypeCode] DEFAULT (0)
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[TaskItem]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[TaskItem] (
    [TaskItemKey] uniqueidentifier NOT NULL,
    [Category] nvarchar(50) NULL,
    [Subject] nvarchar(100) NULL,
    [AssignedToKey] uniqueidentifier NOT NULL,
    [IsGroupTask] bit NOT NULL CONSTRAINT [DF_TaskItem_IsGroupTask] DEFAULT (0),
    [DueDate] datetime NULL,
    [StartDate] datetime NULL,
    [TaskItemStatusCode] int NOT NULL CONSTRAINT [DF_TaskItem_TaskItemStatusCode] DEFAULT (0),
    [StatusDate] datetime NULL CONSTRAINT [DF_TaskItem_StatusDate] DEFAULT (getdate()),
    [Priority] int NOT NULL CONSTRAINT [DF_TaskItem_Priority] DEFAULT (1),
    [CompletedOn] datetime NULL,
    [CompletedByUserKey] uniqueidentifier NULL,
    [NotifyCreatorCode] int NOT NULL CONSTRAINT [DF_TaskItem_NotifyCreatorCode] DEFAULT (0),
    [UpdatedOn] datetime NOT NULL,
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedOn] datetime NOT NULL,
    [AccessKey] uniqueidentifier NOT NULL,
    [OpportunityKey] uniqueidentifier NULL,
    [Comment] ntext NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[TaskItemStatusRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[TaskItemStatusRef] (
    [TaskItemStatusCode] int NOT NULL,
    [TaskItemStatusDesc] nvarchar(50) NOT NULL,
    [TaskItemStatusName] nvarchar(20) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[TaskMain]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[TaskMain] (
    [TaskKey] uniqueidentifier NOT NULL,
    [TaskTypeCode] nvarchar(20) NOT NULL,
    [TaskStatusCode] nvarchar(20) NOT NULL,
    [TaskStatusDate] datetime NULL,
    [Subject] nvarchar(100) NULL,
    [Comments] ntext NULL,
    [AssigneeKey] uniqueidentifier NULL,
    [AssigneeGroupKey] uniqueidentifier NULL,
    [AssigneeUserKey] uniqueidentifier NULL,
    [WorkflowInstanceKey] uniqueidentifier NULL,
    [AccessKey] uniqueidentifier NOT NULL,
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedOn] datetime NOT NULL,
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [UpdatedOn] datetime NOT NULL,
    [StartDate] datetime NULL,
    [DueDate] datetime NULL,
    [CompletedByUserKey] uniqueidentifier NULL,
    [CompletedOn] datetime NULL,
    [MarkedForDeleteOn] datetime NULL,
    [TaskPriorityCode] int NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[TaskNotifyCreatorRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[TaskNotifyCreatorRef] (
    [TaskNotifyCreatorCode] int NOT NULL,
    [TaskNotifyCreatorDesc] nvarchar(50) NOT NULL,
    [TaskNotifyCreatorName] nvarchar(20) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[TaskPriorityRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[TaskPriorityRef] (
    [TaskPriorityCode] int NOT NULL,
    [TaskPriorityName] nvarchar(20) NOT NULL,
    [TaskPriorityDesc] nvarchar(50) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[TaskStatusRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[TaskStatusRef] (
    [TaskStatusCode] nvarchar(20) NOT NULL,
    [TaskStatusDesc] nvarchar(50) NOT NULL,
    [TaskStatusName] nvarchar(20) NOT NULL,
    [IsComplete] bit NOT NULL CONSTRAINT [DF_TaskStatusRef_IsComplete] DEFAULT (0)
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[TaskTypeRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[TaskTypeRef] (
    [TaskTypeCode] nvarchar(20) NOT NULL,
    [TaskTypeDesc] nvarchar(50) NOT NULL,
    [TaskTypeName] nvarchar(20) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[TaxAuthorityCategory]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[TaxAuthorityCategory] (
    [TaxAuthorityCategoryKey] uniqueidentifier NOT NULL CONSTRAINT [DF_TaxAuthorityCategory_TaxAuthorityCategoryKey] DEFAULT (newid()),
    [TaxAuthorityKey] uniqueidentifier NOT NULL,
    [TaxCategoryKey] uniqueidentifier NOT NULL,
    [TaxRate] decimal(12, 4) NOT NULL,
    [TaxRate2] decimal(12, 4) NOT NULL CONSTRAINT [DF_TaxAuthorityCategory_TaxRate2] DEFAULT (0),
    [MaxAmount] decimal(18, 4) NOT NULL CONSTRAINT [DF_TaxAuthorityCategory_MaxAmount] DEFAULT (0),
    [CombineRatesFlag] bit NOT NULL CONSTRAINT [DF_TaxAuthorityCategory_CombineRatesFlag] DEFAULT (0),
    [IsPerItem] bit NOT NULL CONSTRAINT [DF_TaxAuthorityCategory_IsPerItem] DEFAULT (0),
    [IsTaxInclusive] bit NOT NULL CONSTRAINT [DF_TaxAuthorityCategory_IsTaxInclusive] DEFAULT (0),
    [IsExemptFromIncludedTax] bit NOT NULL CONSTRAINT [DF_TaxAuthorityCategory_IsExemptFromIncludedTax] DEFAULT (0),
    [QualifiesForExemptionFlag] bit NOT NULL CONSTRAINT [DF_TaxAuthorityCategory_QualifiesForExemptionFlag] DEFAULT (1),
    [StartDate] datetime NULL,
    [EndDate] datetime NULL,
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [UpdatedOn] datetime NOT NULL,
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedOn] datetime NOT NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[TaxAuthorityFinancialEntity]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[TaxAuthorityFinancialEntity] (
    [TaxAuthorityFinancialEntityKey] uniqueidentifier NOT NULL CONSTRAINT [DF_TaxAuthorityFinancialEntity_TaxAuthorityFinancialEntityKey] DEFAULT (newid()),
    [TaxAuthorityKey] uniqueidentifier NOT NULL,
    [FinancialEntityKey] uniqueidentifier NOT NULL,
    [TaxRegistrationID] nvarchar(50) NULL,
    [TaxLiabilityGLAccountKey] uniqueidentifier NULL,
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [UpdatedOn] datetime NOT NULL,
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedOn] datetime NOT NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[TaxAuthorityLevelRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[TaxAuthorityLevelRef] (
    [TaxAuthorityLevelDesc] nvarchar(50) NOT NULL,
    [TaxAuthorityLevelCode] int NOT NULL,
    [TaxAuthorityLevelKey] uniqueidentifier NOT NULL CONSTRAINT [DF_TaxAuthorityLevelRef_TaxAuthorityLevelKey] DEFAULT (newid())
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[TaxScheduleAuthority]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[TaxScheduleAuthority] (
    [TaxScheduleAuthorityKey] uniqueidentifier NOT NULL CONSTRAINT [DF_TaxScheduleAuthority_TaxScheduleAuthorityKey] DEFAULT (newid()),
    [TaxScheduleKey] uniqueidentifier NOT NULL,
    [TaxAuthorityKey] uniqueidentifier NOT NULL,
    [IsTaxable] bit NOT NULL CONSTRAINT [DF_TaxScheduleAuthority_IsTaxable] DEFAULT (0),
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [UpdatedOn] datetime NOT NULL,
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedOn] datetime NOT NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[tempFormula]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[tempFormula] (
    [tempKey] uniqueidentifier NULL,
    [tempValue] nvarchar(1000) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Terms]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Terms] (
    [TERMS_CODE] varchar(5) NOT NULL CONSTRAINT [DF_Terms_TERMS_CODE] DEFAULT (''),
    [DESCRIPTION] varchar(30) NOT NULL CONSTRAINT [DF_Terms_DESCRIPTION] DEFAULT (''),
    [DISC_DAYS] int NOT NULL CONSTRAINT [DF_Terms_DISC_DAYS] DEFAULT (0),
    [DISC_PERCENT] numeric(15, 2) NOT NULL CONSTRAINT [DF_Terms_DISC_PERCENT] DEFAULT (0),
    [DUE_DAYS] int NOT NULL CONSTRAINT [DF_Terms_DUE_DAYS] DEFAULT (0),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[TimeZoneRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[TimeZoneRef] (
    [TimeZoneKey] uniqueidentifier NOT NULL,
    [TimeZoneDesc] nvarchar(60) NOT NULL,
    [GMTOffsetMinutes] int NOT NULL,
    [IsDaylightSaving] bit NOT NULL,
    [IsHandModified] bit NOT NULL CONSTRAINT [DF_TimeZoneRef_IsHandModified] DEFAULT (0),
    [IsActive] bit NOT NULL CONSTRAINT [DF_TimeZoneRef_IsActive] DEFAULT (1),
    [UpdatedOn] datetime NOT NULL CONSTRAINT [DF_TimeZoneRef_UpdatedOn] DEFAULT (getdate()),
    [UpdatedByUserKey] uniqueidentifier NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Trans]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Trans] (
    [TRANS_NUMBER] int NOT NULL CONSTRAINT [DF_Trans_TRANS_NUMBER] DEFAULT (0),
    [LINE_NUMBER] int NOT NULL CONSTRAINT [DF_Trans_LINE_NUMBER] DEFAULT (0),
    [BATCH_NUM] varchar(15) NOT NULL CONSTRAINT [DF_Trans_BATCH_NUM] DEFAULT (''),
    [OWNER_ORG_CODE] varchar(10) NOT NULL CONSTRAINT [DF_Trans_OWNER_ORG_CODE] DEFAULT (''),
    [SOURCE_SYSTEM] varchar(10) NOT NULL CONSTRAINT [DF_Trans_SOURCE_SYSTEM] DEFAULT (''),
    [JOURNAL_TYPE] varchar(5) NOT NULL CONSTRAINT [DF_Trans_JOURNAL_TYPE] DEFAULT (''),
    [TRANSACTION_TYPE] varchar(5) NOT NULL CONSTRAINT [DF_Trans_TRANSACTION_TYPE] DEFAULT (''),
    [TRANSACTION_DATE] datetime NOT NULL,
    [BT_ID] varchar(10) NOT NULL CONSTRAINT [DF_Trans_BT_ID] DEFAULT (''),
    [ST_ID] varchar(10) NOT NULL CONSTRAINT [DF_Trans_ST_ID] DEFAULT (''),
    [INVOICE_REFERENCE_NUM] int NOT NULL CONSTRAINT [DF_Trans_INVOICE_REFERENCE_NUM] DEFAULT (0),
    [DESCRIPTION] varchar(255) NOT NULL CONSTRAINT [DF_Trans_DESCRIPTION] DEFAULT (''),
    [CUSTOMER_NAME] varchar(60) NOT NULL CONSTRAINT [DF_Trans_CUSTOMER_NAME] DEFAULT (''),
    [CUSTOMER_REFERENCE] varchar(40) NOT NULL CONSTRAINT [DF_Trans_CUSTOMER_REFERENCE] DEFAULT (''),
    [REFERENCE_1] varchar(50) NOT NULL CONSTRAINT [DF_Trans_REFERENCE_1] DEFAULT (''),
    [SOURCE_CODE] varchar(40) NOT NULL CONSTRAINT [DF_Trans_SOURCE_CODE] DEFAULT (''),
    [PRODUCT_CODE] varchar(31) NOT NULL CONSTRAINT [DF_Trans_PRODUCT_CODE] DEFAULT (''),
    [EFFECTIVE_DATE] datetime NULL,
    [PAID_THRU] datetime NULL,
    [MONTHS_PAID] int NOT NULL CONSTRAINT [DF_Trans_MONTHS_PAID] DEFAULT (0),
    [FISCAL_PERIOD] int NOT NULL CONSTRAINT [DF_Trans_FISCAL_PERIOD] DEFAULT (0),
    [DEFERRAL_MONTHS] int NOT NULL CONSTRAINT [DF_Trans_DEFERRAL_MONTHS] DEFAULT (0),
    [AMOUNT] money NOT NULL CONSTRAINT [DF_Trans_AMOUNT] DEFAULT (0),
    [ADJUSTMENT_AMOUNT] money NOT NULL CONSTRAINT [DF_Trans_ADJUSTMENT_AMOUNT] DEFAULT (0),
    [PSEUDO_ACCOUNT] varchar(50) NOT NULL CONSTRAINT [DF_Trans_PSEUDO_ACCOUNT] DEFAULT (''),
    [GL_ACCT_ORG_CODE] varchar(5) NOT NULL CONSTRAINT [DF_Trans_GL_ACCT_ORG_CODE] DEFAULT (''),
    [GL_ACCOUNT] varchar(50) NOT NULL CONSTRAINT [DF_Trans_GL_ACCOUNT] DEFAULT (''),
    [DEFERRED_GL_ACCOUNT] varchar(50) NOT NULL CONSTRAINT [DF_Trans_DEFERRED_GL_ACCOUNT] DEFAULT (''),
    [INVOICE_CHARGES] money NOT NULL CONSTRAINT [DF_Trans_INVOICE_CHARGES] DEFAULT (0),
    [INVOICE_CREDITS] money NOT NULL CONSTRAINT [DF_Trans_INVOICE_CREDITS] DEFAULT (0),
    [QUANTITY] numeric(15, 4) NOT NULL CONSTRAINT [DF_Trans_QUANTITY] DEFAULT (0),
    [UNIT_PRICE] money NOT NULL CONSTRAINT [DF_Trans_UNIT_PRICE] DEFAULT (0),
    [PAYMENT_TYPE] varchar(10) NOT NULL CONSTRAINT [DF_Trans_PAYMENT_TYPE] DEFAULT (''),
    [CHECK_NUMBER] varchar(10) NOT NULL CONSTRAINT [DF_Trans_CHECK_NUMBER] DEFAULT (''),
    [CC_NUMBER] varchar(25) NOT NULL CONSTRAINT [DF_Trans_CC_NUMBER] DEFAULT (''),
    [CC_EXPIRE] varchar(10) NOT NULL CONSTRAINT [DF_Trans_CC_EXPIRE] DEFAULT (''),
    [CC_AUTHORIZE] varchar(10) NOT NULL CONSTRAINT [DF_Trans_CC_AUTHORIZE] DEFAULT (''),
    [CC_NAME] varchar(40) NOT NULL CONSTRAINT [DF_Trans_CC_NAME] DEFAULT (''),
    [TERMS_CODE] varchar(5) NOT NULL CONSTRAINT [DF_Trans_TERMS_CODE] DEFAULT (''),
    [ACTIVITY_SEQN] int NOT NULL CONSTRAINT [DF_Trans_ACTIVITY_SEQN] DEFAULT (0),
    [POSTED] tinyint NOT NULL CONSTRAINT [DF_Trans_POSTED] DEFAULT (0),
    [PROD_TYPE] varchar(5) NOT NULL CONSTRAINT [DF_Trans_PROD_TYPE] DEFAULT (''),
    [ACTIVITY_TYPE] varchar(10) NOT NULL CONSTRAINT [DF_Trans_ACTIVITY_TYPE] DEFAULT (''),
    [ACTION_CODES] varchar(255) NOT NULL CONSTRAINT [DF_Trans_ACTION_CODES] DEFAULT (''),
    [TICKLER_DATE] datetime NULL,
    [DATE_ENTERED] datetime NULL,
    [ENTERED_BY] varchar(60) NOT NULL CONSTRAINT [DF_Trans_ENTERED_BY] DEFAULT (''),
    [SUB_LINE_NUMBER] int NOT NULL CONSTRAINT [DF_Trans_SUB_LINE_NUMBER] DEFAULT (0),
    [INSTALL_BILL_DATE] datetime NULL,
    [TAXABLE_VALUE] money NOT NULL CONSTRAINT [DF_Trans_TAXABLE_VALUE] DEFAULT (0),
    [SOLICITOR_ID] varchar(10) NOT NULL CONSTRAINT [DF_Trans_SOLICITOR_ID] DEFAULT (''),
    [INVOICE_ADJUSTMENTS] money NOT NULL CONSTRAINT [DF_Trans_INVOICE_ADJUSTMENTS] DEFAULT (0),
    [INVOICE_LINE_NUM] int NOT NULL CONSTRAINT [DF_Trans_INVOICE_LINE_NUM] DEFAULT (0),
    [MERGE_CODE] varchar(40) NOT NULL CONSTRAINT [DF_Trans_MERGE_CODE] DEFAULT (''),
    [SALUTATION_CODE] varchar(40) NOT NULL CONSTRAINT [DF_Trans_SALUTATION_CODE] DEFAULT (''),
    [SENDER_CODE] varchar(40) NOT NULL CONSTRAINT [DF_Trans_SENDER_CODE] DEFAULT (''),
    [IS_MATCH_GIFT] tinyint NOT NULL CONSTRAINT [DF_Trans_IS_MATCH_GIFT] DEFAULT (0),
    [MATCH_GIFT_TRANS_NUM] int NOT NULL CONSTRAINT [DF_Trans_MATCH_GIFT_TRANS_NUM] DEFAULT (0),
    [MATCH_ACTIVITY_SEQN] int NOT NULL CONSTRAINT [DF_Trans_MATCH_ACTIVITY_SEQN] DEFAULT (0),
    [MEM_TRIB_ID] varchar(10) NOT NULL CONSTRAINT [DF_Trans_MEM_TRIB_ID] DEFAULT (''),
    [RECEIPT_ID] int NOT NULL CONSTRAINT [DF_Trans_RECEIPT_ID] DEFAULT (0),
    [DO_NOT_RECEIPT] tinyint NOT NULL CONSTRAINT [DF_Trans_DO_NOT_RECEIPT] DEFAULT (0),
    [CC_STATUS] varchar(1) NOT NULL CONSTRAINT [DF_Trans_CC_STATUS] DEFAULT (''),
    [ENCRYPT_CC_NUMBER] varchar(100) NOT NULL CONSTRAINT [DF_Trans_ENCRYPT_CC_NUMBER] DEFAULT (''),
    [ENCRYPT_CC_EXPIRE] varchar(100) NOT NULL CONSTRAINT [DF_Trans_ENCRYPT_CC_EXPIRE] DEFAULT (''),
    [FR_ACTIVITY] varchar(1) NOT NULL CONSTRAINT [DF_Trans_FR_ACTIVITY] DEFAULT (''),
    [FR_ACTIVITY_SEQN] int NOT NULL CONSTRAINT [DF_Trans_FR_ACTIVITY_SEQN] DEFAULT (0),
    [MEM_TRIB_NAME_TEXT] varchar(100) NOT NULL CONSTRAINT [DF_Trans_MEM_TRIB_NAME_TEXT] DEFAULT (''),
    [CAMPAIGN_CODE] varchar(10) NOT NULL CONSTRAINT [DF_Trans_CAMPAIGN_CODE] DEFAULT (''),
    [IS_FR_ITEM] bit NOT NULL CONSTRAINT [DF_Trans_IS_FR_ITEM] DEFAULT (0),
    [ENCRYPT_CSC] varchar(100) NOT NULL CONSTRAINT [DF_Trans_ENCRYPT_CSC] DEFAULT (''),
    [ISSUE_DATE] varchar(10) NOT NULL CONSTRAINT [DF_Trans_ISSUE_DATE] DEFAULT (''),
    [ISSUE_NUMBER] varchar(2) NOT NULL CONSTRAINT [DF_Trans_ISSUE_NUMBER] DEFAULT (''),
    [GL_EXPORT_DATE] datetime NULL,
    [FR_CHECKBOX] bit NOT NULL CONSTRAINT [DF_Trans_FR_CHECKBOX] DEFAULT (0),
    [GATEWAY_REF] varchar(100) NOT NULL CONSTRAINT [DF_Trans_GATEWAY_REF] DEFAULT (''),
    [TAX_AUTHORITY] varchar(15) NOT NULL CONSTRAINT [DF_Trans_TAX_AUTHORITY] DEFAULT (''),
    [TAX_RATE] numeric(15, 4) NOT NULL CONSTRAINT [DF_Trans_TAX_RATE] DEFAULT (0),
    [TAX_1] numeric(15, 4) NOT NULL CONSTRAINT [DF_Trans_TAX_1] DEFAULT (0),
    [PRICE_ADJ] bit NOT NULL CONSTRAINT [DF_Trans_PRICE_ADJ] DEFAULT (0),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Trans_Notify]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Trans_Notify] (
    [TRANS_NUMBER] int NOT NULL CONSTRAINT [DF_Trans_Notify_TRANS_NUMBER] DEFAULT (0),
    [NOTIFY_ID] varchar(10) NOT NULL CONSTRAINT [DF_Trans_Notify_NOTIFY_ID] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Trans_SoftCredit]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Trans_SoftCredit] (
    [TRANS_NUMBER] int NOT NULL CONSTRAINT [DF_Trans_SoftCredit_TRANS_NUMBER] DEFAULT (0),
    [SOFT_CREDIT_ID] varchar(10) NOT NULL CONSTRAINT [DF_Trans_SoftCredit_SOFT_CREDIT_ID] DEFAULT (''),
    [PERCENTAGE] numeric(15, 2) NOT NULL CONSTRAINT [DF_Trans_SoftCredit_PERCENTAGE] DEFAULT (0),
    [AMOUNT] money NOT NULL CONSTRAINT [DF_Trans_SoftCredit_AMOUNT] DEFAULT (0),
    [ORIGINATING_ACTIVITY_SEQN] int NOT NULL CONSTRAINT [DF_Trans_SoftCredit_ORIGINATING_ACTIVITY_SEQN] DEFAULT (0),
    [FUNDRAISER_TYPE] varchar(20) NOT NULL CONSTRAINT [DF_Trans_SoftCredit_FUNDRAISER_TYPE] DEFAULT (''),
    [PRODUCT_CODE] varchar(31) NOT NULL CONSTRAINT [DF_Trans_SoftCredit_PRODUCT_CODE] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[TransactionTypeRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[TransactionTypeRef] (
    [TransactionTypeCode] int NOT NULL,
    [TransactionTypeDesc] nvarchar(50) NOT NULL,
    [TransactionTypeName] nvarchar(20) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[UD_Field]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[UD_Field] (
    [TABLE_NAME] varchar(30) NOT NULL CONSTRAINT [DF_UD_Field_TABLE_NAME] DEFAULT (''),
    [FIELD_NAME] varchar(30) NOT NULL CONSTRAINT [DF_UD_Field_FIELD_NAME] DEFAULT (''),
    [FIELD_TYPE] varchar(10) NOT NULL CONSTRAINT [DF_UD_Field_FIELD_TYPE] DEFAULT (''),
    [FIELD_LENGTH] int NOT NULL CONSTRAINT [DF_UD_Field_FIELD_LENGTH] DEFAULT (0),
    [DECIMAL_POSITIONS] tinyint NOT NULL CONSTRAINT [DF_UD_Field_DECIMAL_POSITIONS] DEFAULT (0),
    [PROMPT] varchar(30) NOT NULL CONSTRAINT [DF_UD_Field_PROMPT] DEFAULT (''),
    [VALIDATION_TABLE] varchar(30) NOT NULL CONSTRAINT [DF_UD_Field_VALIDATION_TABLE] DEFAULT (''),
    [MULTI_SELECT] bit NOT NULL CONSTRAINT [DF_UD_Field_MULTI_SELECT] DEFAULT (0),
    [MICRO_HELP] varchar(255) NOT NULL CONSTRAINT [DF_UD_Field_MICRO_HELP] DEFAULT (''),
    [SEQ] int NOT NULL CONSTRAINT [DF_UD_Field_SEQ] DEFAULT (0),
    [OLD_FIELD_NAME] varchar(30) NOT NULL CONSTRAINT [DF_UD_Field_OLD_FIELD_NAME] DEFAULT (''),
    [FORMAT_MASK] varchar(60) NOT NULL CONSTRAINT [DF_UD_Field_FORMAT_MASK] DEFAULT (''),
    [OBJ_HEIGHT] int NOT NULL CONSTRAINT [DF_UD_Field_OBJ_HEIGHT] DEFAULT (0),
    [OBJ_WIDTH] int NOT NULL CONSTRAINT [DF_UD_Field_OBJ_WIDTH] DEFAULT (0),
    [PROMPT_WIDTH] int NOT NULL CONSTRAINT [DF_UD_Field_PROMPT_WIDTH] DEFAULT (0),
    [AUTO_CONVERSION] tinyint NOT NULL CONSTRAINT [DF_UD_Field_AUTO_CONVERSION] DEFAULT (0),
    [DEFAULT_VALUE] varchar(255) NOT NULL CONSTRAINT [DF_UD_Field_DEFAULT_VALUE] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[UD_Table]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[UD_Table] (
    [TABLE_NAME] varchar(30) NOT NULL CONSTRAINT [DF_UD_Table_TABLE_NAME] DEFAULT (''),
    [DESCRIPTION] varchar(60) NOT NULL CONSTRAINT [DF_UD_Table_DESCRIPTION] DEFAULT (''),
    [APPLICATION] varchar(15) NOT NULL CONSTRAINT [DF_UD_Table_APPLICATION] DEFAULT (''),
    [EXTERNAL_FLAG] bit NOT NULL CONSTRAINT [DF_UD_Table_EXTERNAL_FLAG] DEFAULT (0),
    [LINK_VIA] varchar(30) NOT NULL CONSTRAINT [DF_UD_Table_LINK_VIA] DEFAULT (''),
    [ALLOW_MULTIPLE_INSTANCES] bit NOT NULL CONSTRAINT [DF_UD_Table_ALLOW_MULTIPLE_INSTANCES] DEFAULT (0),
    [REQUIRED] bit NOT NULL CONSTRAINT [DF_UD_Table_REQUIRED] DEFAULT (0),
    [EDIT_TYPES] varchar(100) NOT NULL CONSTRAINT [DF_UD_Table_EDIT_TYPES] DEFAULT (''),
    [NAME_ALL_TABLE] bit NOT NULL CONSTRAINT [DF_UD_Table_NAME_ALL_TABLE] DEFAULT (0),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[UD_WindowFields]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[UD_WindowFields] (
    [WINDOW_NAME] varchar(30) NOT NULL CONSTRAINT [DF_UD_WindowFields_WINDOW_NAME] DEFAULT (''),
    [SEQ] int NOT NULL CONSTRAINT [DF_UD_WindowFields_SEQ] DEFAULT (0),
    [TABLE_NAME] varchar(30) NOT NULL CONSTRAINT [DF_UD_WindowFields_TABLE_NAME] DEFAULT (''),
    [FIELD_NAME] varchar(30) NOT NULL CONSTRAINT [DF_UD_WindowFields_FIELD_NAME] DEFAULT (''),
    [TABLE_FIELD_NAME] varchar(61) NOT NULL CONSTRAINT [DF_UD_WindowFields_TABLE_FIELD_NAME] DEFAULT (''),
    [VERTICAL_POSITION] int NOT NULL CONSTRAINT [DF_UD_WindowFields_VERTICAL_POSITION] DEFAULT (0),
    [HORIZONTAL_POSITION] int NOT NULL CONSTRAINT [DF_UD_WindowFields_HORIZONTAL_POSITION] DEFAULT (0),
    [PROMPT] varchar(30) NOT NULL CONSTRAINT [DF_UD_WindowFields_PROMPT] DEFAULT (''),
    [PROMPT_WIDTH] int NOT NULL CONSTRAINT [DF_UD_WindowFields_PROMPT_WIDTH] DEFAULT (0),
    [READ_ONLY] bit NOT NULL CONSTRAINT [DF_UD_WindowFields_READ_ONLY] DEFAULT (0),
    [NEW_ROW] bit NOT NULL CONSTRAINT [DF_UD_WindowFields_NEW_ROW] DEFAULT (0),
    [SHOW_ON_PROFILE] bit NOT NULL CONSTRAINT [DF_UD_WindowFields_SHOW_ON_PROFILE] DEFAULT (0),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[UD_WindowHeader]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[UD_WindowHeader] (
    [APPLICATION] varchar(15) NOT NULL CONSTRAINT [DF_UD_WindowHeader_APPLICATION] DEFAULT (''),
    [WINDOW_NAME] varchar(30) NOT NULL CONSTRAINT [DF_UD_WindowHeader_WINDOW_NAME] DEFAULT (''),
    [ACCESS_KEYWORDS] varchar(255) NOT NULL CONSTRAINT [DF_UD_WindowHeader_ACCESS_KEYWORDS] DEFAULT (''),
    [SEQ] tinyint NOT NULL CONSTRAINT [DF_UD_WindowHeader_SEQ] DEFAULT (0),
    [TITLE] varchar(30) NOT NULL CONSTRAINT [DF_UD_WindowHeader_TITLE] DEFAULT (''),
    [TABLE_NAME] varchar(30) NOT NULL CONSTRAINT [DF_UD_WindowHeader_TABLE_NAME] DEFAULT (''),
    [AUTO_CREATE] bit NOT NULL CONSTRAINT [DF_UD_WindowHeader_AUTO_CREATE] DEFAULT (0),
    [WINDOW_HEIGHT] int NOT NULL CONSTRAINT [DF_UD_WindowHeader_WINDOW_HEIGHT] DEFAULT (0),
    [WINDOW_WIDTH] int NOT NULL CONSTRAINT [DF_UD_WindowHeader_WINDOW_WIDTH] DEFAULT (0),
    [USE_VERTICAL_SCROLL] bit NOT NULL CONSTRAINT [DF_UD_WindowHeader_USE_VERTICAL_SCROLL] DEFAULT (0),
    [NUM_OF_COLUMNS] int NOT NULL CONSTRAINT [DF_UD_WindowHeader_NUM_OF_COLUMNS] DEFAULT (0),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[UniformDistribution]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[UniformDistribution] (
    [UniformKey] uniqueidentifier NOT NULL,
    [UserKey] uniqueidentifier NOT NULL,
    [EffectiveDate] datetime NULL,
    [ExpirationDate] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[UniformLicense]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[UniformLicense] (
    [LicenseKey] uniqueidentifier NOT NULL,
    [UniformKey] uniqueidentifier NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[UniformLink]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[UniformLink] (
    [UniformLinkKey] uniqueidentifier NOT NULL,
    [SystemEntityKey] uniqueidentifier NOT NULL,
    [SubjectUniformKey] uniqueidentifier NOT NULL,
    [TargetUniformKey] uniqueidentifier NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[UniformRegistry]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[UniformRegistry] (
    [UniformKey] uniqueidentifier NOT NULL,
    [ComponentKey] uniqueidentifier NOT NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[UniformTag]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[UniformTag] (
    [UniformKey] uniqueidentifier NOT NULL,
    [TagKey] uniqueidentifier NOT NULL,
    [CreatedOn] datetime NOT NULL,
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [IsPrimary] bit NOT NULL CONSTRAINT [DF_UniformTag_IsPrimary] DEFAULT (0)
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[UniformTypeRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[UniformTypeRef] (
    [UniformType] nvarchar(100) NOT NULL,
    [UniformTypeDesc] nvarchar(100) NOT NULL,
    [SubjectNameField] nvarchar(50) NULL,
    [SubjectIconPath] nvarchar(255) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[UnofferedCustomerExperience]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[UnofferedCustomerExperience] (
    [UnofferedCustomerExperienceKey] uniqueidentifier NOT NULL,
    [ExperienceDefinitionKey] uniqueidentifier NOT NULL,
    [UnofferedCustomerExperienceGrade] nvarchar(50) NULL,
    [CompletionDate] datetime NOT NULL,
    [UnOfferedCustomerExperienceGradeKey] uniqueidentifier NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[URL_Mapping]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[URL_Mapping] (
    [URLMappingID] numeric(18, 0) IDENTITY(1,1) NOT NULL,
    [DirectoryName] varchar(100) NOT NULL,
    [URL] varchar(255) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[URLMapping]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[URLMapping] (
    [URLMappingKey] uniqueidentifier NOT NULL,
    [DirectoryName] nvarchar(100) NOT NULL,
    [URL] nvarchar(255) NOT NULL,
    [WebsiteDocumentVersionKey] uniqueidentifier NULL,
    [TargetDocumentVersionKey] uniqueidentifier NULL,
    [URLMappingDesc] nvarchar(250) NULL,
    [URLParameters] nvarchar(250) NULL,
    [URLMappingTypeCode] int NOT NULL CONSTRAINT [DF_URLMapping_URLMappingTypeCode] DEFAULT (10)
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[URLMappingTypeRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[URLMappingTypeRef] (
    [URLMappingTypeCode] int NOT NULL,
    [URLMappingTypeName] nvarchar(30) NOT NULL,
    [URLMappingTypeRefDesc] nvarchar(256) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[URLs]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[URLs] (
    [URL] varchar(255) NOT NULL CONSTRAINT [DF_URLs_URL] DEFAULT (''),
    [URL_TITLE] varchar(255) NOT NULL CONSTRAINT [DF_URLs_URL_TITLE] DEFAULT (''),
    [URL_IMAGE] image NULL,
    [URL_TYPE] varchar(60) NOT NULL CONSTRAINT [DF_URLs_URL_TYPE] DEFAULT (''),
    [URL_TEXT] text NULL,
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[UsedSourceCode]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[UsedSourceCode] (
    [SourceCodeKey] uniqueidentifier NOT NULL,
    [SourceCode] nvarchar(50) NOT NULL CONSTRAINT [DF_UsedSourceCode_SourceCode] DEFAULT (''),
    [ParentUniformKey] uniqueidentifier NULL,
    [CreateDate] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[User_Defined_Content_Labels]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[User_Defined_Content_Labels] (
    [UserDefinedStringLabel1] varchar(255) NULL,
    [UserDefinedStringLabel2] varchar(255) NULL,
    [UserDefinedDateLabel1] varchar(255) NULL,
    [UserDefinedDateLabel2] varchar(255) NULL,
    [UserDefinedNumeric1] varchar(255) NULL,
    [UserDefinedNumeric2] varchar(255) NULL,
    [UserDefinedStringLabel3] varchar(255) NULL,
    [UserDefinedStringLabel4] varchar(255) NULL,
    [UserDefinedStringLabel5] varchar(255) NULL,
    [UserDefinedDateLabel3] varchar(255) NULL,
    [UserDefinedDateLabel4] varchar(255) NULL,
    [UserDefinedDateLabel5] varchar(255) NULL,
    [UserDefinedNumeric3] varchar(255) NULL,
    [UserDefinedNumeric4] varchar(255) NULL,
    [UserDefinedNumeric5] varchar(255) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[User_Defined_Field]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[User_Defined_Field] (
    [ColumnName] varchar(50) NOT NULL,
    [Label] varchar(255) NOT NULL,
    [RequiredFlag] char(1) NULL,
    [SortOrder] numeric(18, 0) NULL,
    [UseInSearchFlag] char(1) NULL,
    [SimpleAdvancedFlag] char(1) NOT NULL,
    [TextBoxHeight] numeric(18, 0) NULL,
    [TextBoxWidth] numeric(18, 0) NULL,
    [CheckBox] char(1) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[User_Tab_Pref]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[User_Tab_Pref] (
    [PREF_ID] int NOT NULL CONSTRAINT [DF_User_Tab_Pref_PREF_ID] DEFAULT (0),
    [PREF_NAME] varchar(32) NOT NULL CONSTRAINT [DF_User_Tab_Pref_PREF_NAME] DEFAULT (''),
    [PREF_DESC] varchar(64) NOT NULL CONSTRAINT [DF_User_Tab_Pref_PREF_DESC] DEFAULT (''),
    [PROFILE_VERSION] varchar(16) NOT NULL CONSTRAINT [DF_User_Tab_Pref_PROFILE_VERSION] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[User_Tab_Pref_Detail]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[User_Tab_Pref_Detail] (
    [PREF_ID] int NOT NULL CONSTRAINT [DF_User_Tab_Pref_Detail_PREF_ID] DEFAULT (0),
    [TAB_NAME] varchar(40) NOT NULL CONSTRAINT [DF_User_Tab_Pref_Detail_TAB_NAME] DEFAULT (''),
    [SECTION_ID] tinyint NOT NULL CONSTRAINT [DF_User_Tab_Pref_Detail_SECTION_ID] DEFAULT (0),
    [TAB_ORDER] tinyint NOT NULL CONSTRAINT [DF_User_Tab_Pref_Detail_TAB_ORDER] DEFAULT (0),
    [VISIBLE] bit NOT NULL CONSTRAINT [DF_User_Tab_Pref_Detail_VISIBLE] DEFAULT (0),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[UserDefinedCustomerExperience]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[UserDefinedCustomerExperience] (
    [UserDefinedCustomerExperienceKey] uniqueidentifier NOT NULL,
    [ProgramKey] uniqueidentifier NOT NULL,
    [UserDefinedCustomerExperienceName] nvarchar(50) NOT NULL,
    [UserDefinedCustomerExperienceDesc] nvarchar(250) NULL,
    [CompletionDate] datetime NOT NULL,
    [UserDefinedCustomerExperienceUnits] decimal(18, 8) NULL,
    [UserDefinedCustomerExperienceLocation] nvarchar(250) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[UserDefinedFieldRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[UserDefinedFieldRef] (
    [UserDefinedFieldKey] uniqueidentifier NOT NULL,
    [UserDefinedFieldName] nvarchar(100) NOT NULL,
    [SystemEntityKey] uniqueidentifier NOT NULL,
    [PropertyDefinitionKey] uniqueidentifier NOT NULL,
    [UseInSearchFlag] bit NOT NULL,
    [SortOrder] int NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[UserDefinedMultiInstanceProperty]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[UserDefinedMultiInstanceProperty] (
    [TableName] nvarchar(128) NOT NULL,
    [PropertyName] nvarchar(128) NOT NULL,
    [RowID] nvarchar(16) NOT NULL,
    [RowKey] uniqueidentifier NOT NULL,
    [RowSequence] int NOT NULL,
    [PropertyIntValue] int NULL,
    [PropertyDateTimeValue] datetime NULL,
    [PropertyGuidValue] uniqueidentifier NULL,
    [PropertyDecimalValue] decimal(38, 12) NULL,
    [PropertyBooleanValue] bit NULL,
    [PropertyStringValue] nvarchar(400) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[UserDefinedSingleInstanceProperty]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[UserDefinedSingleInstanceProperty] (
    [TableName] nvarchar(128) NOT NULL,
    [PropertyName] nvarchar(128) NOT NULL,
    [RowID] nvarchar(16) NOT NULL,
    [RowKey] uniqueidentifier NOT NULL,
    [PropertyIntValue] int NULL,
    [PropertyDateTimeValue] datetime NULL,
    [PropertyGuidValue] uniqueidentifier NULL,
    [PropertyDecimalValue] decimal(38, 12) NULL,
    [PropertyBooleanValue] bit NULL,
    [PropertyStringValue] nvarchar(400) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[UserLegacyInfo]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[UserLegacyInfo] (
    [UserId] nvarchar(60) NOT NULL,
    [Password] nvarchar(100) NOT NULL,
    [UPPERUserId] AS (upper([UserId]))
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[UserMain]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[UserMain] (
    [UserKey] uniqueidentifier NOT NULL CONSTRAINT [DF_UserMain_UserKey] DEFAULT (newid()),
    [ContactMaster] varchar(50) NULL CONSTRAINT [DF_UserMain_ContactMaster] DEFAULT (''),
    [UserId] varchar(60) NOT NULL CONSTRAINT [DF_UserMain_UserId] DEFAULT (''),
    [IsDisabled] bit NOT NULL CONSTRAINT [DF_UserMain_IsDisabled] DEFAULT (1),
    [EffectiveDate] datetime NOT NULL,
    [ExpirationDate] datetime NULL,
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [UpdatedOn] datetime NOT NULL CONSTRAINT [DF_UserMain_UpdatedOn] DEFAULT (getdate()),
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedOn] datetime NOT NULL,
    [MarkedForDeleteOn] datetime NULL,
    [DefaultDepartmentGroupKey] uniqueidentifier NOT NULL,
    [DefaultPerspectiveKey] uniqueidentifier NOT NULL,
    [ProviderKey] nvarchar(100) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[UserProcess]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[UserProcess] (
    [HOST_PROCESS] varchar(20) NOT NULL CONSTRAINT [DF_UserProcess_HOST_PROCESS] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[UserRole]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[UserRole] (
    [UserKey] uniqueidentifier NOT NULL,
    [RoleKey] uniqueidentifier NOT NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Users]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Users] (
    [UserId] varchar(60) NOT NULL CONSTRAINT [DF_Users_UserId] DEFAULT (''),
    [UserName] varchar(30) NOT NULL CONSTRAINT [DF_Users_UserName] DEFAULT (''),
    [Password] varchar(100) NOT NULL CONSTRAINT [DF_Users_Password] DEFAULT (''),
    [Disabled] bit NOT NULL CONSTRAINT [DF_Users_Disabled] DEFAULT (0),
    [LastLogin] datetime NULL,
    [PreviousLogin] datetime NULL,
    [ExpirationDate] datetime NULL,
    [Department] varchar(20) NOT NULL CONSTRAINT [DF_Users_Department] DEFAULT (''),
    [AccessKeywords] varchar(255) NOT NULL CONSTRAINT [DF_Users_AccessKeywords] DEFAULT (''),
    [AdHocAllowed] bit NOT NULL CONSTRAINT [DF_Users_AdHocAllowed] DEFAULT (0),
    [LevelSystem] tinyint NOT NULL CONSTRAINT [DF_Users_LevelSystem] DEFAULT (0),
    [LevelMembership] tinyint NOT NULL CONSTRAINT [DF_Users_LevelMembership] DEFAULT (0),
    [LevelDues] tinyint NOT NULL CONSTRAINT [DF_Users_LevelDues] DEFAULT (0),
    [LevelMeeting] tinyint NOT NULL CONSTRAINT [DF_Users_LevelMeeting] DEFAULT (0),
    [LevelCashAR] tinyint NOT NULL CONSTRAINT [DF_Users_LevelCashAR] DEFAULT (0),
    [LevelOrderEntry] tinyint NOT NULL CONSTRAINT [DF_Users_LevelOrderEntry] DEFAULT (0),
    [LevelReferral] tinyint NOT NULL CONSTRAINT [DF_Users_LevelReferral] DEFAULT (0),
    [LevelCert] tinyint NOT NULL CONSTRAINT [DF_Users_LevelCert] DEFAULT (0),
    [LevelFundRaising] tinyint NOT NULL CONSTRAINT [DF_Users_LevelFundRaising] DEFAULT (0),
    [LevelExpo] tinyint NOT NULL CONSTRAINT [DF_Users_LevelExpo] DEFAULT (0),
    [LevelSC] tinyint NOT NULL CONSTRAINT [DF_Users_LevelSC] DEFAULT (0),
    [DisableInitialScreen] bit NOT NULL CONSTRAINT [DF_Users_DisableInitialScreen] DEFAULT (0),
    [RestrictInternetAccess] bit NOT NULL CONSTRAINT [DF_Users_RestrictInternetAccess] DEFAULT (0),
    [ButtonBarDesign] bit NOT NULL CONSTRAINT [DF_Users_ButtonBarDesign] DEFAULT (0),
    [UseEPWoriMIS] bit NOT NULL CONSTRAINT [DF_Users_UseEPWoriMIS] DEFAULT (0),
    [Signature] image NULL,
    [StandardClosing1] varchar(255) NOT NULL CONSTRAINT [DF_Users_StandardClosing1] DEFAULT (''),
    [StandardClosing2] varchar(255) NOT NULL CONSTRAINT [DF_Users_StandardClosing2] DEFAULT (''),
    [CheckTickler] bit NOT NULL CONSTRAINT [DF_Users_CheckTickler] DEFAULT (0),
    [EditTypes] varchar(255) NOT NULL CONSTRAINT [DF_Users_EditTypes] DEFAULT (''),
    [MenuItems] varchar(255) NOT NULL CONSTRAINT [DF_Users_MenuItems] DEFAULT (''),
    [PREF_ID] int NOT NULL CONSTRAINT [DF_Users_PREF_ID] DEFAULT (0),
    [ReportDest] varchar(12) NOT NULL CONSTRAINT [DF_Users_ReportDest] DEFAULT (''),
    [PrinterDest] varchar(255) NOT NULL CONSTRAINT [DF_Users_PrinterDest] DEFAULT (''),
    [FileDest] varchar(255) NOT NULL CONSTRAINT [DF_Users_FileDest] DEFAULT (''),
    [PortDest] varchar(6) NOT NULL CONSTRAINT [DF_Users_PortDest] DEFAULT (''),
    [LinesPerPage] int NOT NULL CONSTRAINT [DF_Users_LinesPerPage] DEFAULT (0),
    [CharactersPerLine] int NOT NULL CONSTRAINT [DF_Users_CharactersPerLine] DEFAULT (0),
    [SendFormfeed] bit NOT NULL CONSTRAINT [DF_Users_SendFormfeed] DEFAULT (0),
    [IncludeProspects] bit NOT NULL CONSTRAINT [DF_Users_IncludeProspects] DEFAULT (0),
    [UPDATED_BY] varchar(60) NOT NULL CONSTRAINT [DF_Users_UPDATED_BY] DEFAULT (''),
    [PrinterDestLabels] varchar(255) NOT NULL CONSTRAINT [DF_Users_PrinterDestLabels] DEFAULT (''),
    [IsCasualUser] bit NOT NULL CONSTRAINT [DF_Users_IsCasualUser] DEFAULT (0),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[UserToken]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[UserToken] (
    [UserKey] uniqueidentifier NOT NULL,
    [Grantee] uniqueidentifier NOT NULL,
    [MarkedForDeleteOn] datetime NULL,
    [RoleName] nvarchar(65) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Variable_Type_Ref]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Variable_Type_Ref] (
    [VariableTypeCode] char(1) NOT NULL,
    [VariableTypeDesc] varchar(20) NOT NULL,
    [VariableTypeHelpText] varchar(255) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Vat_Rule]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Vat_Rule] (
    [VAT_RULESET] varchar(10) NOT NULL CONSTRAINT [DF_Vat_Rule_VAT_RULESET] DEFAULT (''),
    [RULE_ORDER] tinyint NOT NULL CONSTRAINT [DF_Vat_Rule_RULE_ORDER] DEFAULT (0),
    [VAT_REGISTERED] varchar(1) NOT NULL CONSTRAINT [DF_Vat_Rule_VAT_REGISTERED] DEFAULT (''),
    [COMPANY_CONTACT] varchar(1) NOT NULL CONSTRAINT [DF_Vat_Rule_COMPANY_CONTACT] DEFAULT (''),
    [LOCATION] varchar(10) NOT NULL CONSTRAINT [DF_Vat_Rule_LOCATION] DEFAULT (''),
    [VAT_APPLIES] bit NOT NULL CONSTRAINT [DF_Vat_Rule_VAT_APPLIES] DEFAULT (0),
    [TAX_CODE_SUB] varchar(15) NOT NULL CONSTRAINT [DF_Vat_Rule_TAX_CODE_SUB] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Vat_Rule_Set]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Vat_Rule_Set] (
    [VAT_RULESET] varchar(10) NOT NULL CONSTRAINT [DF_Vat_Rule_Set_VAT_RULESET] DEFAULT (''),
    [DESCRIPTION] varchar(50) NOT NULL CONSTRAINT [DF_Vat_Rule_Set_DESCRIPTION] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[VAT_Trans]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[VAT_Trans] (
    [REFERENCE_NUMBER] numeric(15, 2) NOT NULL CONSTRAINT [DF_VAT_Trans_REFERENCE_NUMBER] DEFAULT (''),
    [OVATRegNumber] varchar(20) NOT NULL CONSTRAINT [DF_VAT_Trans_OVATRegNumber] DEFAULT (''),
    [OVATCountry] varchar(2) NOT NULL CONSTRAINT [DF_VAT_Trans_OVATCountry] DEFAULT (''),
    [OVATBranchID] varchar(3) NOT NULL CONSTRAINT [DF_VAT_Trans_OVATBranchID] DEFAULT (''),
    [OUseVATTaxation] varchar(20) NOT NULL CONSTRAINT [DF_VAT_Trans_OUseVATTaxation] DEFAULT (''),
    [NTAX_AUTHOR_DEFAULT] varchar(31) NOT NULL CONSTRAINT [DF_VAT_Trans_NTAX_AUTHOR_DEFAULT] DEFAULT (''),
    [NVAT_REG_NUMBER] varchar(20) NOT NULL CONSTRAINT [DF_VAT_Trans_NVAT_REG_NUMBER] DEFAULT (''),
    [NVAT_COUNTRY] varchar(25) NOT NULL CONSTRAINT [DF_VAT_Trans_NVAT_COUNTRY] DEFAULT (''),
    [TYPE] varchar(5) NOT NULL CONSTRAINT [DF_VAT_Trans_TYPE] DEFAULT (''),
    [CREDIT_SUFFIX] tinyint NOT NULL CONSTRAINT [DF_VAT_Trans_CREDIT_SUFFIX] DEFAULT (0),
    [TaxOnShipTo] bit NOT NULL CONSTRAINT [DF_VAT_Trans_TaxOnShipTo] DEFAULT (0),
    [IsVatTaxableOrder] bit NULL,
    [ZeroRatedAuthority] varchar(15) NOT NULL CONSTRAINT [DF_VAT_Trans_ZeroRatedAuthority] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[VerticalAlignmentRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[VerticalAlignmentRef] (
    [VerticalAlignmentDesc] nvarchar(50) NOT NULL,
    [VerticalAlignmentCode] int NOT NULL,
    [VerticalAlignmentName] nvarchar(20) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[W_Reports]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[W_Reports] (
    [REPORT_NUM] int NOT NULL CONSTRAINT [DF_W_Reports_REPORT_NUM] DEFAULT (0),
    [REPORT_TITLE] varchar(255) NOT NULL CONSTRAINT [DF_W_Reports_REPORT_TITLE] DEFAULT (''),
    [REPORT_DESCR] text NULL,
    [CREATION_DATE] datetime NULL,
    [EXPIRATION_DATE] datetime NULL,
    [BUILD_DATE] datetime NULL,
    [REPORT_TYPE] varchar(30) NOT NULL CONSTRAINT [DF_W_Reports_REPORT_TYPE] DEFAULT (''),
    [SECURITY_GROUP] varchar(30) NOT NULL CONSTRAINT [DF_W_Reports_SECURITY_GROUP] DEFAULT (''),
    [REPORT_PATH] varchar(255) NOT NULL CONSTRAINT [DF_W_Reports_REPORT_PATH] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[WarehouseCarrier]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[WarehouseCarrier] (
    [WarehouseKey] uniqueidentifier NOT NULL,
    [ShipCarrierKey] uniqueidentifier NOT NULL,
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedOn] datetime NOT NULL CONSTRAINT [DF_WarehouseCarrier_CreatedOn] DEFAULT (getdate())
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[WarehouseStatusRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[WarehouseStatusRef] (
    [WarehouseStatusCode] nchar(1) NOT NULL,
    [WarehouseStatusDesc] nvarchar(20) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[WarehouseTypeRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[WarehouseTypeRef] (
    [WarehouseTypeCode] int NOT NULL,
    [WarehouseTypeDesc] nvarchar(30) NOT NULL,
    [WarehouseTypeName] nvarchar(10) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Web_Counter]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Web_Counter] (
    [PAGE] varchar(255) NOT NULL CONSTRAINT [DF_Web_Counter_PAGE] DEFAULT (''),
    [HITS] varchar(255) NULL,
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Website]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Website] (
    [WebsiteKey] uniqueidentifier NOT NULL,
    [SiteName] nvarchar(100) NOT NULL,
    [WebsiteRootURL] nvarchar(100) NOT NULL,
    [SecureWebsiteRootURL] nvarchar(100) NOT NULL,
    [PublishServerCode] char(1) NOT NULL,
    [PublishRootPath] nvarchar(255) NULL,
    [ProtectedRootPath] nvarchar(255) NULL,
    [AutomaticBatchPublishingFlag] char(1) NOT NULL CONSTRAINT [DF_Website_AutomaticBatchPublishingFlag] DEFAULT ('N'),
    [RelatedContentTitle] nvarchar(100) NULL,
    [ShowSummaryOnComboFlag] char(1) NOT NULL CONSTRAINT [DF_Website_ShowSummaryOnComboFlag] DEFAULT ('N'),
    [ShowSummaryOnListFlag] char(1) NOT NULL CONSTRAINT [DF_Website_ShowSummaryOnListFlag] DEFAULT ('N'),
    [ShowBreadCrumbFlag] char(1) NOT NULL CONSTRAINT [DF_Website_ShowBreadCrumbFlag] DEFAULT ('N'),
    [SiteStyleSheet] nvarchar(255) NULL,
    [UseTaggingFlag] char(1) NOT NULL,
    [ListSortColumn] nvarchar(30) NULL,
    [TemplateHeaderFileName] nvarchar(255) NULL,
    [TemplateFooterFileName] nvarchar(255) NULL,
    [NavPublishDirectory] nvarchar(255) NULL,
    [ContentFolderPublishDirectory] nvarchar(255) NULL,
    [DefaultFileName] nvarchar(255) NULL,
    [RelatedFilesTitle] nvarchar(100) NULL,
    [RelatedLinksTitle] nvarchar(100) NULL,
    [UsePopupMenuFlag] bit NOT NULL CONSTRAINT [DF_Website_UsePopupMenuFlag] DEFAULT (0),
    [HierMenuTopStartPosition] int NULL,
    [HierMenuLeftStartPosition] int NULL,
    [HighestToolbarLevelInd] nchar(1) NULL,
    [ScreenResolutionCode] nchar(1) NULL,
    [SimpleAdvancedInd] nchar(1) NOT NULL CONSTRAINT [DF_Website_SimpleAdvancedInd] DEFAULT ('S'),
    [GraphicsDirectory] nvarchar(255) NULL,
    [DefaultSectionName] nvarchar(255) NULL,
    [DefaultSectionURL] nvarchar(255) NULL,
    [PrinterTemplateHeader] nvarchar(255) NULL,
    [PrinterTemplateFooter] nvarchar(255) NULL,
    [TextTemplateHeader] nvarchar(255) NULL,
    [TextTemplateFooter] nvarchar(255) NULL,
    [ActiveFlag] char(1) NOT NULL CONSTRAINT [DF_Website_ActiveFlag] DEFAULT ('Y'),
    [CreateDateTime] datetime NOT NULL CONSTRAINT [DF_Website_CreateDateTime] DEFAULT (getdate()),
    [IncludeInCrossSiteSearchFlag] char(1) NOT NULL CONSTRAINT [DF_Website_IncludeInCrossSiteSearchFlag] DEFAULT ('N'),
    [UseCrossSiteSearchFlag] char(1) NOT NULL CONSTRAINT [DF_Website_UseCrossSiteSearchFlag] DEFAULT ('N'),
    [SearchResultAddlWeight] smallint NULL,
    [DialogTemplateHeader] nvarchar(255) NULL,
    [DialogTemplateFooter] nvarchar(255) NULL,
    [MarkedForDeleteOn] datetime NULL,
    [NavContentDisplayPath] varchar(255) NULL,
    [FolderContentDisplayPath] varchar(255) NULL,
    [UseHierMenuFlag] char(1) NOT NULL CONSTRAINT [DF_Website_UseHierMenuFlag] DEFAULT ('N'),
    [UseAspNetTemplateFlag] char(1) NOT NULL CONSTRAINT [DF_Website_UseAspNetTemplateFlag] DEFAULT ('N'),
    [MasterPageFileName] varchar(255) NULL,
    [TextMasterPageFileName] varchar(255) NULL,
    [PrinterMasterPageFileName] varchar(255) NULL,
    [DialogMasterPageFileName] varchar(255) NULL,
    [IsiMISWebsite] bit NOT NULL CONSTRAINT [DF_Website_IsiMISWebsite] DEFAULT (0),
    [DefaultWebsiteFlag] char(1) NOT NULL CONSTRAINT [DF_Website_DefaultWebsiteFlag] DEFAULT ('N')
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Website_Content_Authority]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Website_Content_Authority] (
    [WebsiteKey] uniqueidentifier NOT NULL,
    [ContentAuthorityGroupID] numeric(18, 0) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Website_Security_Group]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Website_Security_Group] (
    [WebsiteKey] uniqueidentifier NOT NULL,
    [SecurityGroupCode] varchar(30) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[WebUserControlRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[WebUserControlRef] (
    [WebUserControlName] nvarchar(100) NOT NULL,
    [WebUserControlPath] nvarchar(255) NOT NULL,
    [ParameterControlPath] nvarchar(255) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Workflow_Status_Ref]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Workflow_Status_Ref] (
    [WorkflowStatusCode] char(1) NOT NULL,
    [WorkflowStatusDesc] varchar(16) NULL,
    [SortOrder] numeric(18, 0) NULL,
    [EditorApproverInd] char(1) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[WorkflowDemo]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[WorkflowDemo] (
    [WorkflowDemoKey] uniqueidentifier NOT NULL,
    [DemoAction] nvarchar(10) NOT NULL,
    [DemoStatus] nvarchar(10) NOT NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[WorkflowDemoLog]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[WorkflowDemoLog] (
    [LoginUser] nvarchar(50) NOT NULL,
    [LogTimeStamp] datetime NOT NULL CONSTRAINT [DF_WorkflowDemoLog_LogTimeStamp] DEFAULT (getdate()),
    [Message] nvarchar(100) NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[WorkflowInstance]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[WorkflowInstance] (
    [WorkflowInstanceKey] uniqueidentifier NOT NULL,
    [ProcessId] uniqueidentifier NULL,
    [InstanceGraph] image NULL,
    [LockedByUserKey] uniqueidentifier NULL,
    [LockedOn] datetime NULL,
    [KeepAlive] datetime NULL,
    [LogText] ntext NULL,
    [WorkflowStatus] nvarchar(20) NULL,
    [InitiatedByUserKey] uniqueidentifier NULL,
    [InitiatedOn] datetime NULL,
    [ProcessName] nvarchar(50) NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[WorkflowQueue]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[WorkflowQueue] (
    [WorkFlowQueueKey] uniqueidentifier NOT NULL CONSTRAINT [DF_WorkflowQueue_WorkFlowQueueKey] DEFAULT (newid()),
    [WorkItems] image NULL,
    [Description] nvarchar(200) NOT NULL CONSTRAINT [DF_WorkflowQueue_Description] DEFAULT (''),
    [TaskItemKey] uniqueidentifier NULL,
    [SelectionKey] uniqueidentifier NULL,
    [WorkFlowQueueItemStatusCode] int NOT NULL CONSTRAINT [DF_WorkflowQueue_WorkFlowQueueItemStatusCode] DEFAULT (0),
    [Stage] int NULL CONSTRAINT [DF_WorkflowQueue_Stage] DEFAULT (0),
    [DateExecuted] datetime NULL,
    [CreatedOn] datetime NOT NULL,
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [UpdatedOn] datetime NOT NULL,
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [MarkedForDeleteOn] datetime NULL,
    [TaskItemAccessKey] uniqueidentifier NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[WorkflowQueueStatusRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[WorkflowQueueStatusRef] (
    [WorkflowQueueStatusCode] int NOT NULL,
    [WorkflowQueueStatusDesc] nvarchar(50) NOT NULL,
    [WorkflowQueueStatusName] nvarchar(20) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[WorkflowService]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[WorkflowService] (
    [WorkflowServiceKey] uniqueidentifier NOT NULL CONSTRAINT [DF_WorkflowService_WorkflowServiceKey] DEFAULT (newid()),
    [MachineName] nvarchar(100) NULL,
    [ServiceName] nvarchar(100) NULL,
    [WorkFlowServiceStatusCode] nvarchar(25) NULL,
    [BaseDirectory] nvarchar(500) NULL,
    [MaxWorkerCount] int NULL,
    [CategoryFilter] nvarchar(50) NULL,
    [UpdatedOn] datetime NOT NULL,
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[WorkflowServiceWorker]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[WorkflowServiceWorker] (
    [WorkflowServiceKey] uniqueidentifier NOT NULL,
    [WorkItemQueueKey] uniqueidentifier NOT NULL,
    [WorkflowInstanceKey] uniqueidentifier NOT NULL,
    [CreatedOn] datetime NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[WorkflowStatusRef]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[WorkflowStatusRef] (
    [WorkflowStatusCode] int NOT NULL,
    [WorkflowStatusDesc] nvarchar(50) NOT NULL,
    [WorkflowStatusName] nvarchar(20) NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[WorkInvoiceMain]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[WorkInvoiceMain] (
    [WorkInvoiceKey] uniqueidentifier NOT NULL,
    [InvoiceNumber] nvarchar(50) NULL,
    [SoldToContactKey] uniqueidentifier NOT NULL,
    [BillToContactKey] uniqueidentifier NOT NULL,
    [FinancialEntityKey] uniqueidentifier NOT NULL,
    [Notes] nvarchar(500) NULL,
    [PaymentTermsKey] uniqueidentifier NULL,
    [InvoiceDate] datetime NULL,
    [InvoiceTypeCode] nvarchar(50) NULL,
    [AccountingMethodCode] nchar(1) NOT NULL,
    [SourceCodeKey] uniqueidentifier NULL,
    [CurrencyCode] nchar(3) NULL,
    [CurrencyConversionRate] decimal(12, 4) NULL,
    [PurchaseOrderNumber] nvarchar(50) NULL,
    [CommissionPlanKey] uniqueidentifier NULL,
    [SalesTeamGroupKey] uniqueidentifier NULL,
    [OrderNumber] nvarchar(50) NULL,
    [SystemEntityKey] uniqueidentifier NULL,
    [AccessKey] uniqueidentifier NOT NULL,
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedOn] datetime NOT NULL,
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [UpdatedOn] datetime NOT NULL,
    [OwnerGroupKey] uniqueidentifier NULL,
    [FirstPaymentDueDate] datetime NULL,
    [Description] nvarchar(50) NULL,
    [PromoCode] nvarchar(50) NULL,
    [PriceSheetKey] uniqueidentifier NULL,
    [MarkedForDeleteOn] datetime NULL,
    [BatchKey] uniqueidentifier NULL,
    [OriginatingBatchKey] uniqueidentifier NULL,
    [BatchLineStatusCode] int NULL,
    [BatchStatusMessage] nvarchar(200) NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[WorkItem]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[WorkItem] (
    [WorkItemKey] uniqueidentifier NOT NULL,
    [WorkflowDefinitionKey] uniqueidentifier NOT NULL,
    [ProcessEngineKey] uniqueidentifier NOT NULL,
    [Sequence] int NOT NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[WorkItemQueue]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[WorkItemQueue] (
    [WorkItemQueueKey] uniqueidentifier NOT NULL,
    [WorkflowInstanceKey] uniqueidentifier NOT NULL,
    [PackageId] uniqueidentifier NULL,
    [ProcessId] uniqueidentifier NULL,
    [ActivityId] uniqueidentifier NULL,
    [PerformerKey] uniqueidentifier NULL,
    [Description] nvarchar(200) NULL,
    [ExecutionMode] int NULL,
    [IsInteractive] bit NOT NULL CONSTRAINT [DF_WorkItemQueue_IsInteractive] DEFAULT (0),
    [Category] nvarchar(50) NULL,
    [Priority] int NULL,
    [BeginOn] datetime NULL,
    [EnqueuedOn] datetime NULL CONSTRAINT [DF_WorkItemQueue_EnqueuedOn] DEFAULT (getdate()),
    [SelectionLock] uniqueidentifier NULL,
    [SelectedOn] datetime NULL,
    [KeepAlive] datetime NULL,
    [WorkItemGraph] image NULL,
    [RecoveryPoint] bit NOT NULL CONSTRAINT [DF_WorkItemQueue_RecoveryPoint] DEFAULT (0),
    [MarkedForDeleteOn] datetime NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[WorkOrderMain]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[WorkOrderMain] (
    [WorkOrderKey] uniqueidentifier NOT NULL,
    [OrderKey] uniqueidentifier NOT NULL,
    [OrderNumber] nvarchar(50) NULL,
    [OrderTypeKey] uniqueidentifier NOT NULL,
    [OrderDate] datetime NOT NULL,
    [OrderStateCode] int NOT NULL CONSTRAINT [DF_WorkOrderMain_OrderStateCode] DEFAULT (0),
    [CultureCode] nvarchar(10) NOT NULL,
    [DiscountCode] nvarchar(10) NULL,
    [LineTotal] decimal(18, 4) NOT NULL CONSTRAINT [DF_WorkOrderMain_LineTotal] DEFAULT (0),
    [LineTotalHome] decimal(18, 4) NOT NULL CONSTRAINT [DF_WorkOrderMain_LineTotalHome] DEFAULT (0),
    [Discount] decimal(18, 4) NOT NULL CONSTRAINT [DF_WorkOrderMain_Discount] DEFAULT (0),
    [MiscChargeTotal] decimal(18, 4) NOT NULL CONSTRAINT [DF_WorkOrderMain_MiscChargeTotal] DEFAULT (0),
    [MiscChargeTotalHome] decimal(18, 4) NOT NULL CONSTRAINT [DF_WorkOrderMain_MiscChargeTotalHome] DEFAULT (0),
    [ShippingTotal] decimal(18, 4) NOT NULL CONSTRAINT [DF_WorkOrderMain_ShippingTotal] DEFAULT (0),
    [ShippingTotalHome] decimal(18, 4) NOT NULL CONSTRAINT [DF_WorkOrderMain_ShippingTotalHome] DEFAULT (0),
    [IsShippingFixed] bit NULL,
    [TaxTotal] decimal(18, 4) NOT NULL CONSTRAINT [DF_WorkOrderMain_TaxTotal] DEFAULT (0),
    [TaxTotalHome] decimal(18, 4) NOT NULL CONSTRAINT [DF_WorkOrderMain_TaxTotalHome] DEFAULT (0),
    [OrderTotal] decimal(18, 4) NOT NULL CONSTRAINT [DF_WorkOrderMain_OrderTotal] DEFAULT (0),
    [OrderTotalHome] decimal(18, 4) NOT NULL CONSTRAINT [DF_WorkOrderMain_OrderTotalHome] DEFAULT (0),
    [DefaultWarehouseKey] uniqueidentifier NULL,
    [SoldToContactKey] uniqueidentifier NOT NULL,
    [SoldToFullAddressKey] uniqueidentifier NULL,
    [BillToContactKey] uniqueidentifier NOT NULL,
    [BillToFullAddressKey] uniqueidentifier NULL,
    [CurrencyCode] nchar(3) NULL,
    [ConversionRate] decimal(12, 4) NULL,
    [ReqShipDate] datetime NULL,
    [SourceCodeKey] uniqueidentifier NULL,
    [Description] nvarchar(100) NULL,
    [Instructions] nvarchar(100) NULL,
    [OrigOrderNumber] nvarchar(50) NULL,
    [RetAuthNumber] nvarchar(50) NULL,
    [SalesLocationKey] uniqueidentifier NULL,
    [IsReturn] bit NOT NULL CONSTRAINT [DF_WorkOrderMain_IsReturn] DEFAULT (0),
    [ReasonCodeKey] uniqueidentifier NULL,
    [UpdatedOn] datetime NOT NULL,
    [UpdatedByUserKey] uniqueidentifier NOT NULL,
    [PurchaseOrderNumber] nvarchar(50) NULL,
    [IsReturnFullOrder] bit NOT NULL CONSTRAINT [DF_WorkOrderMain_IsReturnFullOrder] DEFAULT (0),
    [FinancialEntityKey] uniqueidentifier NULL,
    [PriceSheetKey] uniqueidentifier NULL,
    [OrigInvoiceNumber] nvarchar(50) NULL,
    [HoldCodeKey] uniqueidentifier NULL,
    [HoldNote] nvarchar(100) NULL,
    [PaymentTermsKey] uniqueidentifier NULL,
    [BackorderReleasePriority] int NOT NULL CONSTRAINT [DF_WorkOrderMain_BackorderReleasePriority] DEFAULT (0),
    [ResponseMediaCode] nvarchar(20) NULL,
    [CommissionPlanKey] uniqueidentifier NULL,
    [SalesTeamGroupKey] uniqueidentifier NULL,
    [SystemEntityKey] uniqueidentifier NOT NULL,
    [AccessKey] uniqueidentifier NOT NULL,
    [CreatedByUserKey] uniqueidentifier NOT NULL,
    [CreatedOn] datetime NOT NULL,
    [OwnerGroupKey] uniqueidentifier NULL,
    [FirstPaymentDueDate] datetime NULL,
    [MarkedForDeleteOn] datetime NULL,
    [BatchKey] uniqueidentifier NULL,
    [OriginatingBatchKey] uniqueidentifier NULL,
    [BatchLineStatusCode] int NULL,
    [BatchStatusMessage] nvarchar(200) NULL,
    [Blob] image NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Zip_Code]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Zip_Code] (
    [ZIP] varchar(5) NOT NULL CONSTRAINT [DF_Zip_Code_ZIP] DEFAULT (''),
    [CITY] varchar(40) NOT NULL CONSTRAINT [DF_Zip_Code_CITY] DEFAULT (''),
    [STATE] varchar(2) NOT NULL CONSTRAINT [DF_Zip_Code_STATE] DEFAULT (''),
    [ZIP_TYPE] varchar(1) NOT NULL CONSTRAINT [DF_Zip_Code_ZIP_TYPE] DEFAULT (''),
    [COUNTY_FIPS] varchar(5) NOT NULL CONSTRAINT [DF_Zip_Code_COUNTY_FIPS] DEFAULT (''),
    [COUNTY] varchar(30) NOT NULL CONSTRAINT [DF_Zip_Code_COUNTY] DEFAULT (''),
    [AREA_CODE] varchar(3) NOT NULL CONSTRAINT [DF_Zip_Code_AREA_CODE] DEFAULT (''),
    [CHAPTER] varchar(15) NOT NULL CONSTRAINT [DF_Zip_Code_CHAPTER] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Zip3]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Zip3] (
    [ZIP_3] varchar(3) NOT NULL CONSTRAINT [DF_Zip3_ZIP_3] DEFAULT (''),
    [CITY] varchar(40) NOT NULL CONSTRAINT [DF_Zip3_CITY] DEFAULT (''),
    [STATE] varchar(2) NOT NULL CONSTRAINT [DF_Zip3_STATE] DEFAULT (''),
    [ZIP_TYPE] varchar(1) NOT NULL CONSTRAINT [DF_Zip3_ZIP_TYPE] DEFAULT (''),
    [ZONE_1] varchar(1) NOT NULL CONSTRAINT [DF_Zip3_ZONE_1] DEFAULT (''),
    [ZONE_2] varchar(1) NOT NULL CONSTRAINT [DF_Zip3_ZONE_2] DEFAULT (''),
    [ZONE_3] varchar(1) NOT NULL CONSTRAINT [DF_Zip3_ZONE_3] DEFAULT (''),
    [ZONE_4] varchar(1) NOT NULL CONSTRAINT [DF_Zip3_ZONE_4] DEFAULT (''),
    [ZONE_5] varchar(1) NOT NULL CONSTRAINT [DF_Zip3_ZONE_5] DEFAULT (''),
    [CHAPTER] varchar(15) NOT NULL CONSTRAINT [DF_Zip3_CHAPTER] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO


SET ANSI_DEFAULTS ON
SET IMPLICIT_TRANSACTIONS OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
GO

IF NOT EXISTS (SELECT * FROM [dbo].[sysobjects] WHERE [id] = OBJECT_ID(N'[dbo].[Zone_Code]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Zone_Code] (
    [ZONE_TABLE_ID] varchar(40) NOT NULL CONSTRAINT [DF_Zone_Code_ZONE_TABLE_ID] DEFAULT (''),
    [DESCRIPTION] varchar(255) NOT NULL CONSTRAINT [DF_Zone_Code_DESCRIPTION] DEFAULT (''),
    [ZONE_TABLE] text NULL,
    [UPDATED_DATE_TIME] datetime NULL,
    [SHIP_METHOD] varchar(10) NOT NULL CONSTRAINT [DF_Zone_Code_SHIP_METHOD] DEFAULT (''),
    [COUNTRY] varchar(25) NOT NULL CONSTRAINT [DF_Zone_Code_COUNTRY] DEFAULT (''),
    [DEFAULT_ZONE] varchar(10) NOT NULL CONSTRAINT [DF_Zone_Code_DEFAULT_ZONE] DEFAULT (''),
    [TIME_STAMP] timestamp NULL
)

END
GO

