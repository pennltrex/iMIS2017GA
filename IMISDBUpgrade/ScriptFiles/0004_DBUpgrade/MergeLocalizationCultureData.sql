SET NOCOUNT ON
SET TEXTSIZE 1073741824

IF EXISTS (SELECT 1 FROM LocalizationCulture WHERE LocalizationCultureId = 'es')
BEGIN
    UPDATE LocalizationCulture SET LocalizationCultureName = 'Spanish'
    WHERE LocalizationCultureId = 'es'
END
ELSE
BEGIN
    INSERT INTO LocalizationCulture (LocalizationCultureId, LocalizationCultureName)
    VALUES ('es', 'Spanish')
END
GO

IF EXISTS (SELECT 1 FROM LocalizationCulture WHERE LocalizationCultureId = 'fr')
BEGIN
    UPDATE LocalizationCulture SET LocalizationCultureName = 'French'
    WHERE LocalizationCultureId = 'fr'
END
ELSE
BEGIN
    INSERT INTO LocalizationCulture (LocalizationCultureId, LocalizationCultureName)
    VALUES ('fr', 'French')
END
GO

IF EXISTS (SELECT 1 FROM LocalizationCulture WHERE LocalizationCultureId = 'nl')
BEGIN
    UPDATE LocalizationCulture SET LocalizationCultureName = 'Dutch'
    WHERE LocalizationCultureId = 'nl'
END
ELSE
BEGIN
    INSERT INTO LocalizationCulture (LocalizationCultureId, LocalizationCultureName)
    VALUES ('nl', 'Dutch')
END
GO

SET NOCOUNT OFF

