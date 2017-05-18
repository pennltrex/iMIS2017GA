
TRUNCATE TABLE [dbo].[LocalizationPhraseTranslated];
UPDATE [dbo].[LocalizationVersion]
   SET [ActiveVersion] = 0,
       [ActiveVersionLoaded] = NULL;
DELETE FROM [dbo].[LocalizationVersionPhrase] 
 WHERE [LocalizationVersionId] IN (
    SELECT [LocalizationVersionId] FROM [dbo].[LocalizationVersion] WHERE [LocalizationVersionName] LIKE 'ASI$_%' ESCAPE '$'
);
DELETE FROM [dbo].[LocalizationVersion]
 WHERE [LocalizationVersionName] LIKE 'ASI$_%' ESCAPE '$';
