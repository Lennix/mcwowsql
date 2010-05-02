-- -----------------------------------------------------
-- 	MC-Entertainment                               --
--	Databasefix by Baum UPDATE 1.10 [02.05.2010]   --
--	for mc-wow [Lennix]                            --
-- -----------------------------------------------------

-- Sollte nun endlich möglich sein!

-- -------------
-- JINDO FIX --
-- -------------

-- Totem der Gehirnwäsche
UPDATE `creature_template` SET `minhealth` = '800',
`maxhealth` = '800',
`faction_A` = '37',
`faction_H` = '37',
`speed_walk` = '1',
`speed_run` = '1',
`unit_flags` = '4',
`InhabitType` = '1' WHERE `creature_template`.`entry` =15112 LIMIT 1 ;

-- Mächtiger Heiligzauberschutz
UPDATE `creature_template` SET `minhealth` = '800',
`maxhealth` = '800',
`faction_A` = '37',
`faction_H` = '37',
`speed_walk` = '1',
`speed_run` = '1',
`unit_flags` = '4',
`InhabitType` = '1' WHERE `creature_template`.`entry` =14987
LIMIT 1 ;

-- Shade of Jin'do
UPDATE `creature_template` SET `minlevel` = '60',
`maxlevel` = '60',
`minhealth` = '1000',
`maxhealth` = '1000',
`minmana` = '500',
`maxmana` = '500',
`faction_A` = '37',
`faction_H` = '37',
`mindmg` = '0',
`maxdmg` = '0',
 `rank`  = '1',
`mechanic_immune_mask` = '0' WHERE `creature_template`.`entry` =14986 LIMIT 1 ;







