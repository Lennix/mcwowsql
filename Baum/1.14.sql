-- ----------------------------------------------------
-- 	MC-Entertainment                               --
--	Databasefix by Baum UPDATE 1.14 [14.05.2010]   --
--	for mc-wow [Lennix]                            --
-- ----------------------------------------------------

-- ------------------------------------------
-- Mob - "Faulender Wurm" wurde angepasst --
-- ------------------------------------------
UPDATE `creature_template` SET `minhealth` = '100',
`maxhealth` = '100',
`mindmg` = '35',
`maxdmg` = '50' WHERE `creature_template`.`entry` =10925 LIMIT 1 ;

-- ----------------------------------------------------
-- Die Mobs auf den Feldern der WP wurden angepasst --
-- ----------------------------------------------------
UPDATE `creature_template` SET 
`rank` = '0',
`mindmg`  = '37',
`maxdmg` = '69' 
 WHERE `creature_template`.`entry` =4475 LIMIT 1;
UPDATE `creature_template` SET 
`rank` = '0', 
`mindmg`  = '38',
`maxdmg` = '70' 
WHERE `creature_template`.`entry` =1802 LIMIT 1;
UPDATE `creature_template` SET
`rank` = '0',
`mindmg`  = '40',
`maxdmg` = '75'  
WHERE `creature_template`.`entry` =1804 LIMIT 1;

-- -------------------------
-- Fischloot Optimierung --
-- -------------------------
UPDATE `fishing_loot_template` SET `ChanceOrQuestChance` = '0,5' WHERE `fishing_loot_template`.`entry` =162 AND `fishing_loot_template`.`item` =6191 LIMIT 1 ;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance` = '5' WHERE `gameobject_loot_template`.`entry` =17498 AND `gameobject_loot_template`.`item` =21114 LIMIT 1 ;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance` = '5' WHERE `gameobject_loot_template`.`entry` =17498 AND `gameobject_loot_template`.`item` =3820 LIMIT 1 ;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance` = '5' WHERE `gameobject_loot_template`.`entry` =17518 AND `gameobject_loot_template`.`item` =3820 LIMIT 1 ;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance` = '5' WHERE `gameobject_loot_template`.`entry` =17518 AND `gameobject_loot_template`.`item` =21151 LIMIT 1 ;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance` = '5' WHERE `gameobject_loot_template`.`entry` =17534 AND `gameobject_loot_template`.`item` =3820 LIMIT 1 ;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance` = '5' WHERE `gameobject_loot_template`.`entry` =17534 AND `gameobject_loot_template`.`item` =21151 LIMIT 1 ;

-- ---------------------------------------------
-- Quest - The Curse of the Tides nun lösbar --
-- ---------------------------------------------
delete from `creature` where guid = 384200;
INSERT INTO `creature` VALUES
(384200, 2624, 0, 0, 0, -12171.9, 628.287, -60.957, 2.49872, 25, 5, 0, 3036, 3191, 0, 0);

-- ----------------------------------------
-- Quest - Glyphenjagd funktioniert nun -- 
-- ----------------------------------------
delete from `gameobject_loot_template` where entry = 20454;
delete from `gameobject_loot_template` where entry = 20455;
delete from `gameobject_loot_template` where entry = 20456;
UPDATE `gameobject_template` SET 
`type` = '3',
`data0` = '57',
`data1` = '20456',
`data3` = '0',
`data5` = '0' 
WHERE `gameobject_template`.`entry` =180453 LIMIT 1;
INSERT INTO `gameobject_loot_template` VALUES 
('20456', '20456', '-100', '0', '1', '1', '0', '0', '0');
UPDATE `gameobject_template` SET 
`type` = '3',
`data0` = '57',
`data1` = '20455',
`data3` = '0',
`data5` = '0' 
WHERE `gameobject_template`.`entry` =180454 LIMIT 1;
INSERT INTO `gameobject_loot_template` VALUES 
('20455', '20455', '-100', '0', '1', '1', '0', '0', '0');
UPDATE `gameobject_template` SET 
`type` = '3',
`data0` = '57',
`data1` = '20454',
`data3` = '0',
`data5` = '0' 
WHERE `gameobject_template`.`entry` =180455 LIMIT 1;
INSERT INTO `gameobject_loot_template` VALUES 
('20454', '20454', '-100', '0', '1', '1', '0', '0', '0');

