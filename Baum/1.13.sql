-- ----------------------------------------------------
-- 	MC-Entertainment                               --
--	Databasefix by Baum UPDATE 1.13 [14.05.2010]   --
--	for mc-wow [Lennix]                            --
-- ----------------------------------------------------

-- ---------------------------------------------------
-- Pats laufen nun normal schnell                  --
-- kann auch auf andere npcflag's angewand werden! --
-- ---------------------------------------------------
UPDATE `creature_template` SET `speed_walk` = '1',
`speed_run` = '1.2' WHERE npcflag = 0;
UPDATE `creature_template` SET `speed_walk` = '1',
`speed_run` = '1.2' WHERE npcflag = 1;
UPDATE `creature_template` SET `speed_walk` = '1',
`speed_run` = '1.2' WHERE npcflag = 2;
UPDATE `creature_template` SET `speed_walk` = '1',
`speed_run` = '1.2' WHERE npcflag = 3;
UPDATE `creature_template` SET `speed_walk` = '1',
`speed_run` = '1.2' WHERE npcflag = 4;

-- ------------------------------------
-- chest of the seven nun verfügbar --
-- ------------------------------------
delete from gameobject where guid = 307907;
delete from gameobject_scripts where datalong = 307907;
INSERT INTO `gameobject` VALUES
(307907, 169243, 230, 1266.78, -287.389, -78.2193, 5.45031, 0, 0, 0.404506, -0.914535, -25, 0, 1);
INSERT INTO `gameobject_scripts` VALUES 
('232226', '0', '9', '307907', '1000', '0', '0', '0', '0', '0');

-- -------------------------------------------------------
-- Quest - Eine Plage komme über euch[5904] nun lösbar --
-- -------------------------------------------------------
delete from gameobject where guid = 308205;
INSERT INTO `gameobject` VALUES
(308205, 177491, 0, 2449.36, -1662.23, 104.37, 4.97478, 0, 0, 0.608526, -0.793534, 25, 0, 1);

-- ---------------------------
-- Repbot funktioniert nun --
-- ---------------------------
UPDATE `creature_template` SET `npcflag` = '16388' WHERE `creature_template`.`entry` =14337 LIMIT 1 ;

-- -------------------------------
-- Quest - Erlösung nun lösbar --
-- -------------------------------
UPDATE `quest_template` SET 
`ReqCreatureOrGOId1` = '0',
`ReqCreatureOrGOCount1` = '0',
`QuestFlags` =  '8',
`SpecialFlags` = '0'
 WHERE `quest_template`.`entry` =5742 LIMIT 1 ;

-- -----------------------------------------------------
-- Quest - Digging Through The Ooze funktioniert nun --
-- -----------------------------------------------------
delete from creature_loot_template where entry = 1032;
INSERT INTO `creature_loot_template` VALUES 
('1032', '3349', '-10', '0', '1', '1', '0', '0', '0');

-- ---------------------------------------------------------
-- Die Questreihen Kampfausrüstung der Argentumdämmerung -- 
-- sind nun wiederholbar.                                --          
-- ---------------------------------------------------------
UPDATE `quest_template` SET `SpecialFlags` = '1' WHERE `quest_template`.`entry` =9221 LIMIT 1 ;
UPDATE `quest_template` SET `SpecialFlags` = '1' WHERE `quest_template`.`entry` =9222 LIMIT 1 ;
UPDATE `quest_template` SET `SpecialFlags` = '1' WHERE `quest_template`.`entry` =9223 LIMIT 1 ;
UPDATE `quest_template` SET `SpecialFlags` = '1' WHERE `quest_template`.`entry` =9224 LIMIT 1 ;
UPDATE `quest_template` SET `SpecialFlags` = '1' WHERE `quest_template`.`entry` =9225 LIMIT 1 ;
UPDATE `quest_template` SET `SpecialFlags` = '1' WHERE `quest_template`.`entry` =9226 LIMIT 1 ;
UPDATE `quest_template` SET `SpecialFlags` = '1' WHERE `quest_template`.`entry` =9227 LIMIT 1 ;
UPDATE `quest_template` SET `SpecialFlags` = '1' WHERE `quest_template`.`entry` =9228 LIMIT 1 ;

-- -------------------------------------------
-- The Unforgiven spawns now in Stratholme --
-- -------------------------------------------
delete from creature where guid = 383806;
INSERT INTO `creature` VALUES
(383806, 10516, 329, 0, 0, 3717.92, -3426.67, 131.724, 3.47972, 25, 5, 0, 11274, 8019, 0, 1);

