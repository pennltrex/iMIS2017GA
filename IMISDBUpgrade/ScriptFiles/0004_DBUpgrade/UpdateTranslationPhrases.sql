-- Update Translation Phrase table
;WITH NewPhrases AS (
  SELECT l.[LocalizationPhraseId], 0 AS [LocalizationApplicationId], l.[Phrase], NULL AS [Hash], l.DoNotLocalize, N'' AS [ControlType]
    FROM [dbo].[LocalizationVersionPhrase] l
         LEFT OUTER JOIN [dbo].[LocalizationPhrase] p ON p.LocalizationPhraseId = l.LocalizationPhraseId
   WHERE p.LocalizationPhraseId IS NULL
)
INSERT INTO [dbo].[LocalizationPhrase]
  SELECT DISTINCT [LocalizationPhraseId], [LocalizationApplicationId], [Phrase],[Hash], [DoNotLocalize], [ControlType]
    FROM NewPhrases
GO
