-- -----------------------------------------------------
-- MC-Entertainment --
-- Databasefix by Baum UPDATE 1.10 [02.05.2010] --
-- for mc-wow [Lennix] --
-- -----------------------------------------------------

-- Sollte nun endlich  glich sein!

-- -------------
-- JINDO FIX --
-- -------------

-- Totem der Gehirnw sche
UPDATE `creature_template` SET `faction_A` = '37',
`faction_H` = '37' WHERE `creature_template`.`entry` =15112 LIMIT 1 ;

-- M chtiger Heiligzauberschutz
UPDATE `creature_template` SET `faction_A` = '37',
`faction_H` = '37' WHERE `creature_template`.`entry` =14987 LIMIT 1 ;

-- Shade of Jin'do
UPDATE `creature_template` SET `faction_A` = '37',
`faction_H` = '37' WHERE `creature_template`.`entry` =14986 LIMIT 1 ;







