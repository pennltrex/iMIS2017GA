
DELETE FROM [dbo].[LocalizationVersionPhrase] WHERE [LocalizationVersionId] IN (
    SELECT [LocalizationVersionId] FROM [dbo].[LocalizationVersion] WHERE [LocalizationVersionName] LIKE 'ASI$_%' ESCAPE '$'
)
