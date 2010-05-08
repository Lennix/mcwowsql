-- -----------------------------------------------------
-- 	MC-Entertainment                               --
--	Databasefix by Baum UPDATE 1.12 [08.05.2010]   --
--	for mc-wow [Lennix]                            --
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Axt- Hammer- Schwertschmiedemeister nun erlernbar --
-- -----------------------------------------------------
-- Für vollständige Funktionalität wird das Gossip    --
-- Script für die Mobs [11193],[11192] und [11191] von-- 
-- STANI benötigt !!!                                 --
-- -----------------------------------------------------
delete from `creature` where guid = 381341;
delete from `creature` where guid = 381438;
INSERT INTO `creature` VALUES
(381341, 11121, 329, 0, 0, 3817.54, -3694.85, 143.989, 0.63022, 2500, 5, 0, 9722, 0, 0, 1),
(381438, 11120, 329, 0, 0, 3586.39, -3001.31, 125, 2.18075, 2500, 5, 0, 15344, 0, 0, 1);
UPDATE `creature` SET `MovementType` =  '0' WHERE `creature`.`guid` =381341 LIMIT 1 ;
UPDATE `creature` SET `MovementType` =  '0' WHERE `creature`.`guid` =381438 LIMIT 1 ;

-- ---------------------------------------
-- Quest - "Cuergo's Gold" nun lösbar! --
-- ---------------------------------------
delete from `creature` where guid = 382413;
delete from `creature` where guid = 382414;
delete from `creature` where guid = 382415;
INSERT INTO `creature` VALUES
(382413, 7899, 1, 0, 0, -10122.9, -4044.43, 4.61466, 4.30867, 250, 5, 0, 2113, 0, 0, 0),
(382414, 7902, 1, 0, 0, -10124.7, -4044.07, 4.42284, 5.34797, 250, 5, 0, 2256, 0, 0, 0),
(382415, 7901, 1, 0, 0, -10121.7, -4045.51, 4.81376, 3.40018, 250, 5, 0, 2135, 0, 0, 0);

-- -----------------------------------------------------
-- Quest - Defenders of Darrowshire funktioniert nun --
-- -----------------------------------------------------
UPDATE `creature_template` SET `npcflag` = '3' WHERE `creature_template`.`entry` =11064 LIMIT 1 ;

-- ---------------------------------------------
-- Quest - Gegenständer der Macht nun lösbar --
-- ---------------------------------------------
delete from `gameobject_loot_template` where item = 7272;
INSERT INTO `gameobject_loot_template` VALUES 
('2138', '7272', '-100', '0', '1', '1', '0', '0', '0');

-- -------------------------------------------------------
-- You are now able to loot                             --
--                         "Winterfall Spirit Beads"    --
--                         "Deadwood Headdress Feather" --
-- -------------------------------------------------------
UPDATE `creature_loot_template` SET 
`lootcondition` = '0',
`condition_value1` = '0' 
WHERE item = 21377;
UPDATE `creature_loot_template` SET 
`lootcondition` = '0',
`condition_value1` = '0' 
WHERE item = 21383;

-- ---------------------------------------------------------
-- Optimierung des "Boss-Immun-Script by Lennix"          --
-- Bosse sind verwundbar gegen Blutungseffekte[Blizzlike] --
-- !!! mechanic_immun_masc : 1073725439 !!!               --
-- ---------------------------------------------------------
-- 1073741823[immun all] - 16384[Bleed] = 1073725439      --
-- ---------------------------------------------------------



