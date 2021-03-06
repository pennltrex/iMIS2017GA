SET NOCOUNT ON
SET TEXTSIZE 1073741824

IF EXISTS (SELECT 1 FROM LocalizationCulture WHERE LocalizationCultureId = 'de')
BEGIN
    UPDATE LocalizationCulture SET LocalizationCultureName = 'German', LocalizationCultureDisplayName = 'Deutsch'
    WHERE LocalizationCultureId = 'de'
END
ELSE
BEGIN
    INSERT INTO LocalizationCulture (LocalizationCultureId, LocalizationCultureName, LocalizationCultureDisplayName)
    VALUES ('de', 'German', 'Deutsch')
END
GO

IF EXISTS (SELECT 1 FROM LocalizationCulture WHERE LocalizationCultureId = 'es')
BEGIN
    UPDATE LocalizationCulture SET LocalizationCultureName = 'Spanish', LocalizationCultureDisplayName = 'Español'
    WHERE LocalizationCultureId = 'es'
END
ELSE
BEGIN
    INSERT INTO LocalizationCulture (LocalizationCultureId, LocalizationCultureName, LocalizationCultureDisplayName)
    VALUES ('es', 'Spanish', 'Español')
END
GO

IF EXISTS (SELECT 1 FROM LocalizationCulture WHERE LocalizationCultureId = 'fr')
BEGIN
    UPDATE LocalizationCulture SET LocalizationCultureName = 'French', LocalizationCultureDisplayName = 'Français'
    WHERE LocalizationCultureId = 'fr'
END
ELSE
BEGIN
    INSERT INTO LocalizationCulture (LocalizationCultureId, LocalizationCultureName, LocalizationCultureDisplayName)
    VALUES ('fr', 'French', 'Français')
END
GO

IF EXISTS (SELECT 1 FROM LocalizationCulture WHERE LocalizationCultureId = 'nl')
BEGIN
    UPDATE LocalizationCulture SET LocalizationCultureName = 'Dutch', LocalizationCultureDisplayName = 'Nederlands'
    WHERE LocalizationCultureId = 'nl'
END
ELSE
BEGIN
    INSERT INTO LocalizationCulture (LocalizationCultureId, LocalizationCultureName, LocalizationCultureDisplayName)
    VALUES ('nl', 'Dutch', 'Nederlands')
END
GO

SET NOCOUNT OFF

