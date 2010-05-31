-- ----------------------------------------------------
-- 	MC-Entertainment                               --
--	Databasefix by Baum UPDATE 1.16 [31.05.2010]   --
--	for mc-wow [Lennix]                            --
-- ----------------------------------------------------

-- -------------------------------------
-- Quest - Tactical Task Briefing VI --
-- ------------------------------------- 
UPDATE `creature_template` SET `npcflag` = '16391' WHERE `creature_template`.`entry` =15610 LIMIT 1 ;
delete from `npc_vendor` where entry = 15610;
INSERT INTO `npc_vendor` VALUES 
('15610', '21158', '0', '0');

-- --------------------------------------
-- Quest - Tactical Task Briefing VII --
-- --------------------------------------
UPDATE `creature_template` SET `npcflag` = '16391' WHERE `creature_template`.`entry` =15611 LIMIT 1 ;
delete from `npc_vendor` where entry = 15611;
INSERT INTO `npc_vendor` VALUES 
('15611', '21161', '0', '0');

-- ---------------------------------------
-- Quest - Tactical Task Briefing VIII --
-- ---------------------------------------
UPDATE `creature_template` SET `npcflag` = '16391' WHERE `creature_template`.`entry` =15609 LIMIT 1 ;
delete from `npc_vendor` where entry = 15609;
INSERT INTO `npc_vendor` VALUES 
('15609', '21160', '0', '0');

-- --------------------------------------------------------
-- It is no longer possible to fear Darkmaster Gandling --
-- --------------------------------------------------------
UPDATE `creature_template` SET `mechanic_immune_mask`  = '1073725439' WHERE `creature_template`.`entry` =1853 LIMIT 1 ;

-- ---------------------------------
-- Quest - Field Duty nun lösbar --
-- ---------------------------------
delete from `gameobject_template` where entry = 1337666;
delete from `gameobject` where guid = 13372009;
delete from `gameobject_scripts` where id = 13372009;
INSERT INTO `gameobject_template` VALUES
(1337666, 1, 5651, 'start-event', 0, 0, 0.4, 0, 0, 196608, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
INSERT INTO `gameobject` VALUES
(13372009, 1337666, 1, -7180.14, 1391.07, 2, 1.91866, 0, 0, 0.818806, 0.57407, 25, 0, 1);
INSERT INTO `gameobject_scripts` VALUES 
('13372009', '0', '10', '15440', '180000', '0', '0', '0', '0', '-7176', '1391', '3', '3'),
('13372009', '0', '10', '15449', '180000', '0', '0', '0', '0', '-7180', '1402', '3', '6');
UPDATE `creature_template` SET `faction_A` = '85',
`faction_H` = '85' WHERE `creature_template`.`entry` =15449 LIMIT 1 ;

-- ------------------------------
-- Quest - Hive in the Tower --
-- ------------------------------
UPDATE `quest_template` SET `RequiredRaces` = '0' WHERE `quest_template`.`entry` =1126 LIMIT 1 ;
delete from `gameobject_loot_template` where item = 17346;
INSERT INTO `gameobject_loot_template` VALUES 
('15521', '17346', '-100', '0', '1', '1', '0', '0', '0');
