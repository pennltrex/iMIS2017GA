SET NOCOUNT ON
SET TEXTSIZE 1073741824

IF EXISTS (SELECT 1 FROM Theme WHERE ThemeKey = 'c9bdec6e-7f0e-4404-b3bc-08ea5dc9af08')
BEGIN
    UPDATE Theme SET ThemeName = 'Everest', ThemeDesc = 'Everest', ThemePreviewImage = NULL, MasterPageFileName = 'Mountains.master', MasterPage = NULL, IsResponsive = 0, IsUltrawaveBased = 1, ScheduledRemovalDate = '20171001 00:00:00'
    WHERE ThemeKey = 'c9bdec6e-7f0e-4404-b3bc-08ea5dc9af08'
END
ELSE
BEGIN
    INSERT INTO Theme (ThemeKey, ThemeName, ThemeDesc, ThemePreviewImage, MasterPageFileName, MasterPage, IsResponsive, IsUltrawaveBased, ScheduledRemovalDate)
    VALUES ('c9bdec6e-7f0e-4404-b3bc-08ea5dc9af08', 'Everest', 'Everest', NULL, 'Mountains.master', NULL, 0, 1, '20171001 00:00:00')
END
GO

IF EXISTS (SELECT 1 FROM Theme WHERE ThemeKey = 'c3db2ddd-6827-4b1a-bc54-0ee398063eee')
BEGIN
    UPDATE Theme SET ThemeName = 'Aspen_Mobile', ThemeDesc = 'Aspen Mobile', ThemePreviewImage = NULL, MasterPageFileName = 'Sapling.master', MasterPage = NULL, IsResponsive = 0, IsUltrawaveBased = 1, ScheduledRemovalDate = '20171001 00:00:00'
    WHERE ThemeKey = 'c3db2ddd-6827-4b1a-bc54-0ee398063eee'
END
ELSE
BEGIN
    INSERT INTO Theme (ThemeKey, ThemeName, ThemeDesc, ThemePreviewImage, MasterPageFileName, MasterPage, IsResponsive, IsUltrawaveBased, ScheduledRemovalDate)
    VALUES ('c3db2ddd-6827-4b1a-bc54-0ee398063eee', 'Aspen_Mobile', 'Aspen Mobile', NULL, 'Sapling.master', NULL, 0, 1, '20171001 00:00:00')
END
GO

IF EXISTS (SELECT 1 FROM Theme WHERE ThemeKey = 'fe9bccc8-7b3d-463d-96da-219b5ce722ea')
BEGIN
    UPDATE Theme SET ThemeName = 'Austin_Mobile', ThemeDesc = 'Austin Mobile', ThemePreviewImage = NULL, MasterPageFileName = 'Sapling.master', MasterPage = NULL, IsResponsive = 0, IsUltrawaveBased = 1, ScheduledRemovalDate = NULL
    WHERE ThemeKey = 'fe9bccc8-7b3d-463d-96da-219b5ce722ea'
END
ELSE
BEGIN
    INSERT INTO Theme (ThemeKey, ThemeName, ThemeDesc, ThemePreviewImage, MasterPageFileName, MasterPage, IsResponsive, IsUltrawaveBased, ScheduledRemovalDate)
    VALUES ('fe9bccc8-7b3d-463d-96da-219b5ce722ea', 'Austin_Mobile', 'Austin Mobile', NULL, 'Sapling.master', NULL, 0, 1, NULL)
END
GO

IF EXISTS (SELECT 1 FROM Theme WHERE ThemeKey = 'ffa9875d-5687-45b2-b401-34a448ba7596')
BEGIN
    UPDATE Theme SET ThemeName = 'GreatBarrierReef_Responsive', ThemeDesc = 'GreatBarrierReef Responsive', ThemePreviewImage = NULL, MasterPageFileName = 'WST-NaturalHeritageSitesResponsive.master', MasterPage = NULL, IsResponsive = 1, IsUltrawaveBased = 1, ScheduledRemovalDate = NULL
    WHERE ThemeKey = 'ffa9875d-5687-45b2-b401-34a448ba7596'
END
ELSE
BEGIN
    INSERT INTO Theme (ThemeKey, ThemeName, ThemeDesc, ThemePreviewImage, MasterPageFileName, MasterPage, IsResponsive, IsUltrawaveBased, ScheduledRemovalDate)
    VALUES ('ffa9875d-5687-45b2-b401-34a448ba7596', 'GreatBarrierReef_Responsive', 'GreatBarrierReef Responsive', NULL, 'WST-NaturalHeritageSitesResponsive.master', NULL, 1, 1, NULL)
END
GO

IF EXISTS (SELECT 1 FROM Theme WHERE ThemeKey = '24f4944a-0ad6-4c55-bb3a-3f434e032509')
BEGIN
    UPDATE Theme SET ThemeName = 'Aspen', ThemeDesc = 'Aspen', ThemePreviewImage = NULL, MasterPageFileName = 'Forest.master', MasterPage = NULL, IsResponsive = 0, IsUltrawaveBased = 1, ScheduledRemovalDate = '20171001 00:00:00'
    WHERE ThemeKey = '24f4944a-0ad6-4c55-bb3a-3f434e032509'
END
ELSE
BEGIN
    INSERT INTO Theme (ThemeKey, ThemeName, ThemeDesc, ThemePreviewImage, MasterPageFileName, MasterPage, IsResponsive, IsUltrawaveBased, ScheduledRemovalDate)
    VALUES ('24f4944a-0ad6-4c55-bb3a-3f434e032509', 'Aspen', 'Aspen', NULL, 'Forest.master', NULL, 0, 1, '20171001 00:00:00')
END
GO

IF EXISTS (SELECT 1 FROM Theme WHERE ThemeKey = '4dc33159-fc52-407a-a137-4e5ca87e324f')
BEGIN
    UPDATE Theme SET ThemeName = 'Austin_Responsive', ThemeDesc = 'Austin Responsive', ThemePreviewImage = NULL, MasterPageFileName = 'Cities_Responsive.master', MasterPage = NULL, IsResponsive = 1, IsUltrawaveBased = 1, ScheduledRemovalDate = NULL
    WHERE ThemeKey = '4dc33159-fc52-407a-a137-4e5ca87e324f'
END
ELSE
BEGIN
    INSERT INTO Theme (ThemeKey, ThemeName, ThemeDesc, ThemePreviewImage, MasterPageFileName, MasterPage, IsResponsive, IsUltrawaveBased, ScheduledRemovalDate)
    VALUES ('4dc33159-fc52-407a-a137-4e5ca87e324f', 'Austin_Responsive', 'Austin Responsive', NULL, 'Cities_Responsive.master', NULL, 1, 1, NULL)
END
GO

IF EXISTS (SELECT 1 FROM Theme WHERE ThemeKey = '637eb6d5-ee1f-4237-ae07-5294b85484c2')
BEGIN
    UPDATE Theme SET ThemeName = 'Aspen2', ThemeDesc = 'Aspen2', ThemePreviewImage = NULL, MasterPageFileName = 'Forest.master', MasterPage = NULL, IsResponsive = 0, IsUltrawaveBased = 1, ScheduledRemovalDate = '20171001 00:00:00'
    WHERE ThemeKey = '637eb6d5-ee1f-4237-ae07-5294b85484c2'
END
ELSE
BEGIN
    INSERT INTO Theme (ThemeKey, ThemeName, ThemeDesc, ThemePreviewImage, MasterPageFileName, MasterPage, IsResponsive, IsUltrawaveBased, ScheduledRemovalDate)
    VALUES ('637eb6d5-ee1f-4237-ae07-5294b85484c2', 'Aspen2', 'Aspen2', NULL, 'Forest.master', NULL, 0, 1, '20171001 00:00:00')
END
GO

IF EXISTS (SELECT 1 FROM Theme WHERE ThemeKey = 'db60daf7-1866-46b4-89bb-823579ce78d4')
BEGIN
    UPDATE Theme SET ThemeName = 'Mars', ThemeDesc = 'Mars', ThemePreviewImage = NULL, MasterPageFileName = 'Planets.master', MasterPage = NULL, IsResponsive = 0, IsUltrawaveBased = 1, ScheduledRemovalDate = '20171001 00:00:00'
    WHERE ThemeKey = 'db60daf7-1866-46b4-89bb-823579ce78d4'
END
ELSE
BEGIN
    INSERT INTO Theme (ThemeKey, ThemeName, ThemeDesc, ThemePreviewImage, MasterPageFileName, MasterPage, IsResponsive, IsUltrawaveBased, ScheduledRemovalDate)
    VALUES ('db60daf7-1866-46b4-89bb-823579ce78d4', 'Mars', 'Mars', NULL, 'Planets.master', NULL, 0, 1, '20171001 00:00:00')
END
GO

IF EXISTS (SELECT 1 FROM Theme WHERE ThemeKey = 'e760d266-2272-4201-959f-8e7c5ada3d6b')
BEGIN
    UPDATE Theme SET ThemeName = 'Birch', ThemeDesc = 'Birch', ThemePreviewImage = NULL, MasterPageFileName = 'Forest.master', MasterPage = NULL, IsResponsive = 0, IsUltrawaveBased = 1, ScheduledRemovalDate = '20171001 00:00:00'
    WHERE ThemeKey = 'e760d266-2272-4201-959f-8e7c5ada3d6b'
END
ELSE
BEGIN
    INSERT INTO Theme (ThemeKey, ThemeName, ThemeDesc, ThemePreviewImage, MasterPageFileName, MasterPage, IsResponsive, IsUltrawaveBased, ScheduledRemovalDate)
    VALUES ('e760d266-2272-4201-959f-8e7c5ada3d6b', 'Birch', 'Birch', NULL, 'Forest.master', NULL, 0, 1, '20171001 00:00:00')
END
GO

IF EXISTS (SELECT 1 FROM Theme WHERE ThemeKey = '419f914d-b04c-43be-88b8-a1cdcb18bc2d')
BEGIN
    UPDATE Theme SET ThemeName = 'Venus', ThemeDesc = 'Venus', ThemePreviewImage = NULL, MasterPageFileName = 'Planets.master', MasterPage = NULL, IsResponsive = 0, IsUltrawaveBased = 1, ScheduledRemovalDate = '20171001 00:00:00'
    WHERE ThemeKey = '419f914d-b04c-43be-88b8-a1cdcb18bc2d'
END
ELSE
BEGIN
    INSERT INTO Theme (ThemeKey, ThemeName, ThemeDesc, ThemePreviewImage, MasterPageFileName, MasterPage, IsResponsive, IsUltrawaveBased, ScheduledRemovalDate)
    VALUES ('419f914d-b04c-43be-88b8-a1cdcb18bc2d', 'Venus', 'Venus', NULL, 'Planets.master', NULL, 0, 1, '20171001 00:00:00')
END
GO

IF EXISTS (SELECT 1 FROM Theme WHERE ThemeKey = '6a1369b5-bf03-48ba-bbbd-a733952b441e')
BEGIN
    UPDATE Theme SET ThemeName = 'Toronto_Responsive', ThemeDesc = 'Toronto Responsive', ThemePreviewImage = NULL, MasterPageFileName = 'Cities_Responsive.master', MasterPage = NULL, IsResponsive = 1, IsUltrawaveBased = 1, ScheduledRemovalDate = NULL
    WHERE ThemeKey = '6a1369b5-bf03-48ba-bbbd-a733952b441e'
END
ELSE
BEGIN
    INSERT INTO Theme (ThemeKey, ThemeName, ThemeDesc, ThemePreviewImage, MasterPageFileName, MasterPage, IsResponsive, IsUltrawaveBased, ScheduledRemovalDate)
    VALUES ('6a1369b5-bf03-48ba-bbbd-a733952b441e', 'Toronto_Responsive', 'Toronto Responsive', NULL, 'Cities_Responsive.master', NULL, 1, 1, NULL)
END
GO

IF EXISTS (SELECT 1 FROM Theme WHERE ThemeKey = 'b8069912-d7c6-49ce-b444-cbc75d90d42a')
BEGIN
    UPDATE Theme SET ThemeName = 'London_Responsive', ThemeDesc = 'London Responsive', ThemePreviewImage = NULL, MasterPageFileName = 'Cities_Responsive.master', MasterPage = NULL, IsResponsive = 1, IsUltrawaveBased = 1, ScheduledRemovalDate = NULL
    WHERE ThemeKey = 'b8069912-d7c6-49ce-b444-cbc75d90d42a'
END
ELSE
BEGIN
    INSERT INTO Theme (ThemeKey, ThemeName, ThemeDesc, ThemePreviewImage, MasterPageFileName, MasterPage, IsResponsive, IsUltrawaveBased, ScheduledRemovalDate)
    VALUES ('b8069912-d7c6-49ce-b444-cbc75d90d42a', 'London_Responsive', 'London Responsive', NULL, 'Cities_Responsive.master', NULL, 1, 1, NULL)
END
GO

IF EXISTS (SELECT 1 FROM Theme WHERE ThemeKey = 'efa4e1bf-7bc4-4b5c-ac00-d71f579a4739')
BEGIN
    UPDATE Theme SET ThemeName = 'Orion', ThemeDesc = 'Orion', ThemePreviewImage = NULL, MasterPageFileName = 'Constellations.master', MasterPage = NULL, IsResponsive = 1, IsUltrawaveBased = 1, ScheduledRemovalDate = NULL
    WHERE ThemeKey = 'efa4e1bf-7bc4-4b5c-ac00-d71f579a4739'
END
ELSE
BEGIN
    INSERT INTO Theme (ThemeKey, ThemeName, ThemeDesc, ThemePreviewImage, MasterPageFileName, MasterPage, IsResponsive, IsUltrawaveBased, ScheduledRemovalDate)
    VALUES ('efa4e1bf-7bc4-4b5c-ac00-d71f579a4739', 'Orion', 'Orion', NULL, 'Constellations.master', NULL, 1, 1, NULL)
END
GO

IF EXISTS (SELECT 1 FROM Theme WHERE ThemeKey = 'f39f43eb-a466-4891-88c9-e372de75a10b')
BEGIN
    UPDATE Theme SET ThemeName = 'Mercury', ThemeDesc = 'Mercury', ThemePreviewImage = NULL, MasterPageFileName = 'Planets.master', MasterPage = NULL, IsResponsive = 0, IsUltrawaveBased = 1, ScheduledRemovalDate = '20171001 00:00:00'
    WHERE ThemeKey = 'f39f43eb-a466-4891-88c9-e372de75a10b'
END
ELSE
BEGIN
    INSERT INTO Theme (ThemeKey, ThemeName, ThemeDesc, ThemePreviewImage, MasterPageFileName, MasterPage, IsResponsive, IsUltrawaveBased, ScheduledRemovalDate)
    VALUES ('f39f43eb-a466-4891-88c9-e372de75a10b', 'Mercury', 'Mercury', NULL, 'Planets.master', NULL, 0, 1, '20171001 00:00:00')
END
GO

IF EXISTS (SELECT 1 FROM Theme WHERE ThemeKey = 'b23533a7-fa7c-42b2-95a1-e5d589ef0558')
BEGIN
    UPDATE Theme SET ThemeName = 'Austin', ThemeDesc = 'Austin', ThemePreviewImage = NULL, MasterPageFileName = 'Cities.master', MasterPage = NULL, IsResponsive = 0, IsUltrawaveBased = 1, ScheduledRemovalDate = NULL
    WHERE ThemeKey = 'b23533a7-fa7c-42b2-95a1-e5d589ef0558'
END
ELSE
BEGIN
    INSERT INTO Theme (ThemeKey, ThemeName, ThemeDesc, ThemePreviewImage, MasterPageFileName, MasterPage, IsResponsive, IsUltrawaveBased, ScheduledRemovalDate)
    VALUES ('b23533a7-fa7c-42b2-95a1-e5d589ef0558', 'Austin', 'Austin', NULL, 'Cities.master', NULL, 0, 1, NULL)
END
GO

SET NOCOUNT OFF

