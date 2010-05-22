-- ----------------------------------------------------
-- 	MC-Entertainment                               --
--	Databasefix by Baum UPDATE 1.15 [22.05.2010]   --
--	for mc-wow [Lennix]                            --
-- ----------------------------------------------------

delete from creature where guid = 352941;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = '100' WHERE `creature_loot_template`.`entry` =15206 AND `creature_loot_template`.`item` =20514 LIMIT 1 ;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = '32,5' WHERE `creature_loot_template`.`entry` =15206 AND `creature_loot_template`.`item` =20665 LIMIT 1 ;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = '26,7' WHERE `creature_loot_template`.`entry` =15206 AND `creature_loot_template`.`item` =20666 LIMIT 1 ;

-- -------------------
-- Windsteine Mobs --
-- -------------------

-- geringe Windsteine [5 Spieler] --

-- Feuer
UPDATE `creature_template` SET 
`minhealth` = '30245',
`maxhealth` = '30245',
`scale` = '1.5',
`mindmg` = '800',
`maxdmg` = '1200',
`mechanic_immune_mask` = '1073725439',
`attackpower` = '3000',
`resistance1`  = '1000',
`AIName` = 'EventAI'
WHERE `creature_template`.`entry` =15209 LIMIT 1 ;
delete from `creature_ai_scripts` where creature_id = 15209;
INSERT INTO `creature_ai_scripts` VALUES
(152091, 15209, 0, 0, 5, 1, 0, 0, 0, 0, 11, 11989, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(152092, 15209, 0, 0, 5, 1, 0, 0, 0, 0, 11, 16536, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');

-- Wasser
UPDATE `creature_template` SET
`minhealth` = '30245',
`maxhealth` = '30245',
`scale` = '1.5',
`mindmg` = '800',
`maxdmg` = '1200',
`mechanic_immune_mask` = '1073725439',
`attackpower` = '3000',
`resistance4`  = '1000',
`AIName` = 'EventAI'
WHERE `creature_template`.`entry` =15211 LIMIT 1 ;
delete from `creature_ai_scripts` where creature_id = 15211;
INSERT INTO `creature_ai_scripts` VALUES
(152111, 15211, 0, 0, 10, 1, 0, 0, 0, 0, 11, 14907, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(152112, 15211, 0, 0, 10, 1, 0, 0, 0, 0, 11, 12548, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');

-- Luft
UPDATE `creature_template` SET 
`minhealth` = '30245',
`maxhealth` = '30245',
`scale` = '1.7',
`mindmg` = '800',
`maxdmg` = '1200',
`mechanic_immune_mask` = '1073725439',
`attackpower` = '3000',
`resistance6`  = '1000',
`AIName` = 'EventAI' 
WHERE `creature_template`.`entry` =15212 LIMIT 1 ;
delete from `creature_ai_scripts` where creature_id = 15212;
INSERT INTO `creature_ai_scripts` VALUES
(152121, 15212, 0, 0, 10, 1, 0, 0, 0, 0, 11, 19514, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(152122, 15212, 0, 0, 5, 1, 0, 0, 0, 0, 11, 15535, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');

-- Erd
UPDATE `creature_template` SET 
`minhealth` = '30245',
`maxhealth` = '30245',
`scale` = '1.2',
`mindmg` = '800',
`maxdmg` = '1200',
`resistance3`  = '1000',
`AIName` = 'EventAI',
`mechanic_immune_mask` = '1073725439',
`attackpower` = '3000' 
WHERE `creature_template`.`entry` =15307 LIMIT 1 ;
delete from `creature_ai_scripts` where creature_id = 15307;
INSERT INTO `creature_ai_scripts` VALUES
(153071, 15307, 0, 0, 5, 1, 0, 0, 0, 0, 11, 18813, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(153072, 15307, 0, 0, 10, 1, 0, 0, 0, 0, 11, 22127, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');

-- Windsteine [5 - 10 Spieler] --

-- Feuer
UPDATE `creature_template` SET 
`minhealth` = '81545',
`maxhealth` = '81545',
`scale` = '2.5',
`mindmg` = '1000',
`maxdmg` = '1500',
`mechanic_immune_mask` = '1073725439',
`attackpower` = '5000',
`resistance1`  = '1000',
`AIName` = 'EventAI'
WHERE `creature_template`.`entry` =15206 LIMIT 1 ;
delete from `creature_ai_scripts` where creature_id = 15206;
INSERT INTO `creature_ai_scripts` VALUES
(152061, 15206, 0, 0, 5, 1, 0, 0, 0, 0, 11, 22424, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(152062, 15206, 0, 0, 5, 1, 0, 0, 0, 0, 11, 25028, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(152063, 15206, 0, 0, 5, 1, 0, 0, 0, 0, 11, 18399, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');

-- Wasser
UPDATE `creature_template` SET
`minhealth` = '81545',
`maxhealth` = '81545',
`scale` = '1.5',
`mindmg` = '1000',
`maxdmg` = '1500',
`mechanic_immune_mask` = '1073725439',
`attackpower` = '5000',
`resistance4`  = '1000',
`AIName` = 'EventAI'
WHERE `creature_template`.`entry` =15207 LIMIT 1 ;
delete from `creature_ai_scripts` where creature_id = 15207;
INSERT INTO `creature_ai_scripts` VALUES
(152071, 15207, 0, 0, 5, 1, 0, 0, 0, 0, 11, 3391, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(152072, 15207, 0, 0, 5, 1, 0, 0, 0, 0, 11, 16790, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(152073, 15207, 0, 0, 5, 1, 0, 0, 0, 0, 11, 18670, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');

-- Luft
UPDATE `creature_template` SET 
`minhealth` = '81545',
`maxhealth` = '81545',
`scale` = '1.5',
`mindmg` = '1000',
`maxdmg` = '1500',
`mechanic_immune_mask` = '1073725439',
`attackpower` = '5000',
`resistance6`  = '1000',
`AIName` = 'EventAI' 
WHERE `creature_template`.`entry` =15220 LIMIT 1 ;
delete from `creature_ai_scripts` where creature_id = 15220;
INSERT INTO `creature_ai_scripts` VALUES
(152201, 15220, 0, 0, 5, 1, 0, 0, 0, 0, 11, 44417, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(152202, 15220, 0, 0, 5, 1, 0, 0, 0, 0, 11, 15535, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(152203, 15220, 0, 0, 5, 1, 0, 0, 0, 0, 11, 12882, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(152204, 15220, 0, 0, 5, 1, 0, 0, 0, 0, 11, 25034, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');

-- Erd
UPDATE `creature_template` SET 
`minhealth` = '81545',
`maxhealth` = '81545',
`scale` = '1',
`mindmg` = '1000',
`maxdmg` = '1500',
`resistance3`  = '1000',
`AIName` = 'EventAI',
`mechanic_immune_mask` = '1073725439',
`attackpower` = '5000' 
WHERE `creature_template`.`entry` =15208 LIMIT 1 ;
delete from `creature_ai_scripts` where creature_id = 15208;
INSERT INTO `creature_ai_scripts` VALUES
(152081, 15208, 0, 0, 5, 1, 0, 0, 0, 0, 11, 6524, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(152082, 15208, 0, 0, 5, 1, 0, 0, 0, 0, 11, 8078, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(152083, 15208, 0, 0, 5, 1, 0, 0, 0, 0, 11, 13446, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');

-- große Windsteine [20 - 40 Spieler] --

-- Feuer
UPDATE `creature_template` SET 
`minhealth` = '256000',
`maxhealth` = '256000',
`scale` = '4',
`mindmg` = '1500',
`maxdmg` = '2000',
`mechanic_immune_mask` = '1073725439',
`attackpower` = '8000',
`resistance1`  = '1000',
`AIName` = 'EventAI'
WHERE `creature_template`.`entry` =15203 LIMIT 1 ;
delete from `creature_ai_scripts` where creature_id = 15203;
INSERT INTO `creature_ai_scripts` VALUES
(152031, 15203, 0, 0, 5, 1, 0, 0, 0, 0, 11, 25049, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(152032, 15203, 0, 0, 10, 1, 0, 0, 0, 0, 11, 25050, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(152033, 15203, 0, 0, 5, 1, 0, 0, 0, 0, 11, 15284, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');

-- Wasser
UPDATE `creature_template` SET
`minhealth` = '256000',
`maxhealth` = '256000',
`scale` = '2',
`mindmg` = '1500',
`maxdmg` = '2000',
`mechanic_immune_mask` = '1073725439',
`attackpower` = '8000',
`resistance4`  = '1000',
`AIName` = 'EventAI'
WHERE `creature_template`.`entry` =15305 LIMIT 1 ;
delete from `creature_ai_scripts` where creature_id = 15305;
INSERT INTO `creature_ai_scripts` VALUES
(153051, 15305, 0, 0, 10, 1, 0, 0, 0, 0, 11, 25053, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(153052, 15305, 0, 0, 5, 1, 0, 0, 0, 0, 11, 3391, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');


-- Luft
UPDATE `creature_template` SET 
`minhealth` = '256000',
`maxhealth` = '256000',
`scale` = '2',
`mindmg` = '1500',
`maxdmg` = '2000',
`mechanic_immune_mask` = '1073725439',
`attackpower` = '8000',
`resistance6`  = '1000',
`AIName` = 'EventAI' 
WHERE `creature_template`.`entry` =15204 LIMIT 1 ;
delete from `creature_ai_scripts` where creature_id = 15204;
INSERT INTO `creature_ai_scripts` VALUES
(152041, 15204, 0, 0, 5, 1, 0, 0, 0, 0, 11, 25060, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(152042, 15204, 0, 0, 10, 1, 0, 0, 0, 0, 11, 20627, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(152043, 15204, 0, 0, 10, 1, 0, 0, 0, 0, 11, 25020, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');


-- Erd
UPDATE `creature_template` SET 
`minhealth` = '256000',
`maxhealth` = '256000',
`scale` = '2',
`mindmg` = '1500',
`maxdmg` = '2000',
`resistance3`  = '1000',
`AIName` = 'EventAI',
`mechanic_immune_mask` = '1073725439',
`attackpower` = '8000' 
WHERE `creature_template`.`entry` =15205 LIMIT 1 ;
delete from `creature_ai_scripts` where creature_id = 15205;
INSERT INTO `creature_ai_scripts` VALUES
(152051, 15205, 0, 0, 5, 1, 0, 0, 0, 0, 11, 19129, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(152052, 15205, 0, 0, 5, 1, 0, 0, 0, 0, 11, 25056, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(152053, 15205, 0, 0, 2, 1, 0, 0, 0, 0, 11, 17547, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');

delete from gameobject where guid = 49304;
delete from gameobject where guid = 49301;
-- ---------------------
-- Windstein[180461] --
-- ---------------------

-- Gegenstände
delete from `item_template` where entry = 11181330;
delete from `item_template` where entry = 11181331;
delete from `item_template` where entry = 11181332;
delete from `item_template` where entry = 11181333;
delete from `item_template` where entry = 11181334;
delete from `item_loot_template` where entry = 11181330;
INSERT INTO `item_template` VALUES
(11181330, 15, 0, "Elementarkasten", 20913, 2, 4, 1, 50, 12, 0, 32767, 255, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, '', 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 'internalitemhandler', 0, 0, 0, 0, 0, 0);
INSERT INTO `item_template` VALUES
(11181331, 12, 0, "Feuerelement", 20874, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, '', 0, 0, 0, 11181336, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 'internalitemhandler', 0, 0, 0, 0, 0, 0);
INSERT INTO `item_template` VALUES
(11181332, 12, 0, "Wasserelement", 4136, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, '', 0, 0, 0, 11181117, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 'internalitemhandler', 0, 0, 0, 0, 0, 0);
INSERT INTO `item_template` VALUES
(11181333, 12, 0, "Luftelement", 23755, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, '', 0, 0, 0, 11181338, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 'internalitemhandler', 0, 0, 0, 0, 0, 0);
INSERT INTO `item_template` VALUES
(11181334, 12, 0, "Erdelement", 13686, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, '', 0, 0, 0, 11181339, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 'internalitemhandler', 0, 0, 0, 0, 0, 0);
INSERT INTO `item_loot_template` VALUES
(11181330, 11181331, 0, 1, 1, 1, 0, 0, 0),
(11181330, 11181332, 0, 1, 1, 1, 0, 0, 0),
(11181330, 11181333, 0, 1, 1, 1, 0, 0, 0),
(11181330, 11181334, 0, 1, 1, 1, 0, 0, 0);


-- Hauptquest
delete from quest_template where entry = 11181335;
delete from gameobject_involvedrelation where quest = 11181335;
delete from gameobject_questrelation where quest = 11181335;
INSERT INTO `quest_template` VALUES
(11181335, 0, 1377, 0, 60, 0, 81, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Windstein', NULL, NULL, NULL, '-', NULL, NULL, NULL, NULL, NULL, 20408, 20406, 20407, 20422, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11181330, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `gameobject_involvedrelation` VALUES 
('180461', '11181335');
INSERT INTO `gameobject_questrelation` VALUES 
('180461', '11181335');

-- Feuerbeschwörung [Windstein (180461-11181336)]
delete from quest_template where entry = 11181336;
delete from gameobject_involvedrelation where quest = 11181336;
delete from `quest_end_scripts` where id = 11181336;
INSERT INTO `quest_template` VALUES
(11181336, 2, 1377, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Windstein', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11181336);
INSERT INTO `gameobject_involvedrelation` VALUES 
('180461', '11181336');
INSERT INTO `quest_end_scripts` VALUES 
('11181336', '0', '10', '15206', '300000', '0', '0', '0', '0', '-7930', '1944', '7', '5');

-- Wasserbeschwörung [Windstein (180461-11181117)]
delete from quest_template where entry = 11181117;
delete from gameobject_involvedrelation where quest = 11181117;
delete from `quest_end_scripts` where id = 11181117;
INSERT INTO `quest_template` VALUES
(11181117, 2, 1377, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Windstein', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11181117);
INSERT INTO `gameobject_involvedrelation` VALUES 
('180461', '11181117');
INSERT INTO `quest_end_scripts` VALUES 
('11181117', '0', '10', '15207', '300000', '0', '0', '0', '0', '-7930', '1944', '7', '5');

-- Luftbeschwörung [Windstein (180461-11181338)]
delete from quest_template where entry = 11181338;
delete from gameobject_involvedrelation where quest = 11181338;
delete from `quest_end_scripts` where id = 11181338;
INSERT INTO `quest_template` VALUES
(11181338, 2, 1377, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Windstein', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11181338);
INSERT INTO `gameobject_involvedrelation` VALUES 
('180461', '11181338');
INSERT INTO `quest_end_scripts` VALUES 
('11181338', '0', '10', '15220', '300000', '0', '0', '0', '0', '-7930', '1944', '7', '5');

-- Erdbeschwörung [Windstein (180461-11181339)]
delete from quest_template where entry = 11181339;
delete from gameobject_involvedrelation where quest = 11181339;
delete from `quest_end_scripts` where id = 11181339;
INSERT INTO `quest_template` VALUES
(11181339, 2, 1377, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Windstein', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11181339);
INSERT INTO `gameobject_involvedrelation` VALUES 
('180461', '11181339');
INSERT INTO `quest_end_scripts` VALUES 
('11181339', '0', '10', '15208', '300000', '0', '0', '0', '0', '-7930', '1944', '7', '5');

delete from gameobject where guid = 49304;
delete from gameobject where guid = 49301;
-- ---------------------
-- Windstein[180534] --
-- ---------------------

-- Gegenstände
delete from `item_template` where entry = 12281330;
delete from `item_template` where entry = 12281331;
delete from `item_template` where entry = 12281332;
delete from `item_template` where entry = 12281333;
delete from `item_template` where entry = 12281334;
delete from `item_loot_template` where entry = 12281330;
INSERT INTO `item_template` VALUES
(12281330, 15, 0, "Elementarkasten", 20913, 2, 4, 1, 50, 12, 0, 32767, 255, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, '', 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 'internalitemhandler', 0, 0, 0, 0, 0, 0);
INSERT INTO `item_template` VALUES
(12281331, 12, 0, "Feuerelement", 20874, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, '', 0, 0, 0, 12281336, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 'internalitemhandler', 0, 0, 0, 0, 0, 0);
INSERT INTO `item_template` VALUES
(12281332, 12, 0, "Wasserelement", 4136, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, '', 0, 0, 0, 12281227, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 'internalitemhandler', 0, 0, 0, 0, 0, 0);
INSERT INTO `item_template` VALUES
(12281333, 12, 0, "Luftelement", 23755, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, '', 0, 0, 0, 12281338, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 'internalitemhandler', 0, 0, 0, 0, 0, 0);
INSERT INTO `item_template` VALUES
(12281334, 12, 0, "Erdelement", 13686, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, '', 0, 0, 0, 12281339, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 'internalitemhandler', 0, 0, 0, 0, 0, 0);
INSERT INTO `item_loot_template` VALUES
(12281330, 12281331, 0, 1, 1, 1, 0, 0, 0),
(12281330, 12281332, 0, 1, 1, 1, 0, 0, 0),
(12281330, 12281333, 0, 1, 1, 1, 0, 0, 0),
(12281330, 12281334, 0, 1, 1, 1, 0, 0, 0);


-- Hauptquest
delete from quest_template where entry = 12281335;
delete from gameobject_involvedrelation where quest = 12281335;
delete from gameobject_questrelation where quest = 12281335;
INSERT INTO `quest_template` VALUES
(12281335, 0, 1377, 0, 60, 0, 81, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Windstein', NULL, NULL, NULL, '-', NULL, NULL, NULL, NULL, NULL, 20408, 20406, 20407, 20422, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12281330, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `gameobject_involvedrelation` VALUES 
('180534', '12281335');
INSERT INTO `gameobject_questrelation` VALUES 
('180534', '12281335');

-- Feuerbeschwörung [Windstein (180534-12281336)]
delete from quest_template where entry = 12281336;
delete from gameobject_involvedrelation where quest = 12281336;
delete from `quest_end_scripts` where id = 12281336;
INSERT INTO `quest_template` VALUES
(12281336, 2, 1377, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Windstein', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12281336);
INSERT INTO `gameobject_involvedrelation` VALUES 
('180534', '12281336');
INSERT INTO `quest_end_scripts` VALUES 
('12281336', '0', '10', '15206', '300000', '0', '0', '0', '0', '-6998', '1219', '9', '2');

-- Wasserbeschwörung [Windstein (180534-12281227)]
delete from quest_template where entry = 12281227;
delete from gameobject_involvedrelation where quest = 12281227;
delete from `quest_end_scripts` where id = 12281227;
INSERT INTO `quest_template` VALUES
(12281227, 2, 1377, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Windstein', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12281227);
INSERT INTO `gameobject_involvedrelation` VALUES 
('180534', '12281227');
INSERT INTO `quest_end_scripts` VALUES 
('12281227', '0', '10', '15207', '300000', '0', '0', '0', '0', '-6998', '1219', '9', '2');

-- Luftbeschwörung [Windstein (180534-12281338)]
delete from quest_template where entry = 12281338;
delete from gameobject_involvedrelation where quest = 12281338;
delete from `quest_end_scripts` where id = 12281338;
INSERT INTO `quest_template` VALUES
(12281338, 2, 1377, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Windstein', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12281338);
INSERT INTO `gameobject_involvedrelation` VALUES 
('180534', '12281338');
INSERT INTO `quest_end_scripts` VALUES 
('12281338', '0', '10', '15220', '300000', '0', '0', '0', '0', '-6998', '1219', '9', '2');

-- Erdbeschwörung [Windstein (180534-12281339)]
delete from quest_template where entry = 12281339;
delete from gameobject_involvedrelation where quest = 12281339;
delete from `quest_end_scripts` where id = 12281339;
INSERT INTO `quest_template` VALUES
(12281339, 2, 1377, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Windstein', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12281339);
INSERT INTO `gameobject_involvedrelation` VALUES 
('180534', '12281339');
INSERT INTO `quest_end_scripts` VALUES 
('12281339', '0', '10', '15208', '300000', '0', '0', '0', '0', '-6998', '1219', '9', '2');


delete from gameobject where guid = 49304;
delete from gameobject where guid = 49301;
-- ---------------------
-- Windstein[180554] --
-- ---------------------

-- Gegenstände
delete from `item_template` where entry = 13381330;
delete from `item_template` where entry = 13381331;
delete from `item_template` where entry = 13381332;
delete from `item_template` where entry = 13381333;
delete from `item_template` where entry = 13381334;
delete from `item_loot_template` where entry = 13381330;
INSERT INTO `item_template` VALUES
(13381330, 15, 0, "Elementarkasten", 20913, 2, 4, 1, 50, 12, 0, 32767, 255, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, '', 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 'internalitemhandler', 0, 0, 0, 0, 0, 0);
INSERT INTO `item_template` VALUES
(13381331, 12, 0, "Feuerelement", 20874, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, '', 0, 0, 0, 13381336, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 'internalitemhandler', 0, 0, 0, 0, 0, 0);
INSERT INTO `item_template` VALUES
(13381332, 12, 0, "Wasserelement", 4136, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, '', 0, 0, 0, 13381337, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 'internalitemhandler', 0, 0, 0, 0, 0, 0);
INSERT INTO `item_template` VALUES
(13381333, 12, 0, "Luftelement", 23755, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, '', 0, 0, 0, 13381338, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 'internalitemhandler', 0, 0, 0, 0, 0, 0);
INSERT INTO `item_template` VALUES
(13381334, 12, 0, "Erdelement", 13686, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, '', 0, 0, 0, 13381339, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 'internalitemhandler', 0, 0, 0, 0, 0, 0);
INSERT INTO `item_loot_template` VALUES
(13381330, 13381331, 0, 1, 1, 1, 0, 0, 0),
(13381330, 13381332, 0, 1, 1, 1, 0, 0, 0),
(13381330, 13381333, 0, 1, 1, 1, 0, 0, 0),
(13381330, 13381334, 0, 1, 1, 1, 0, 0, 0);


-- Hauptquest
delete from quest_template where entry = 13381335;
delete from gameobject_involvedrelation where quest = 13381335;
delete from gameobject_questrelation where quest = 13381335;
INSERT INTO `quest_template` VALUES
(13381335, 0, 1377, 0, 60, 0, 81, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Windstein', NULL, NULL, NULL, '-', NULL, NULL, NULL, NULL, NULL, 20408, 20406, 20407, 20422, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13381330, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `gameobject_involvedrelation` VALUES 
('180554', '13381335');
INSERT INTO `gameobject_questrelation` VALUES 
('180554', '13381335');

-- Feuerbeschwörung [Windstein (180554-13381336)]
delete from quest_template where entry = 13381336;
delete from gameobject_involvedrelation where quest = 13381336;
delete from `quest_end_scripts` where id = 13381336;
INSERT INTO `quest_template` VALUES
(13381336, 2, 1377, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Windstein', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13381336);
INSERT INTO `gameobject_involvedrelation` VALUES 
('180554', '13381336');
INSERT INTO `quest_end_scripts` VALUES 
('13381336', '0', '10', '15206', '300000', '0', '0', '0', '0', '-6716', '1668', '8', '2');

-- Wasserbeschwörung [Windstein (180554-13381337)]
delete from quest_template where entry = 13381337;
delete from gameobject_involvedrelation where quest = 13381337;
delete from `quest_end_scripts` where id = 13381337;
INSERT INTO `quest_template` VALUES
(13381337, 2, 1377, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Windstein', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13381337);
INSERT INTO `gameobject_involvedrelation` VALUES 
('180554', '13381337');
INSERT INTO `quest_end_scripts` VALUES 
('13381337', '0', '10', '15207', '300000', '0', '0', '0', '0', '-6716', '1668', '8', '2');

-- Luftbeschwörung [Windstein (180554-13381338)]
delete from quest_template where entry = 13381338;
delete from gameobject_involvedrelation where quest = 13381338;
delete from `quest_end_scripts` where id = 13381338;
INSERT INTO `quest_template` VALUES
(13381338, 2, 1377, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Windstein', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13381338);
INSERT INTO `gameobject_involvedrelation` VALUES 
('180554', '13381338');
INSERT INTO `quest_end_scripts` VALUES 
('13381338', '0', '10', '15220', '300000', '0', '0', '0', '0', '-6716', '1668', '8', '2');

-- Erdbeschwörung [Windstein (180554-13381339)]
delete from quest_template where entry = 13381339;
delete from gameobject_involvedrelation where quest = 13381339;
delete from `quest_end_scripts` where id = 13381339;
INSERT INTO `quest_template` VALUES
(13381339, 2, 1377, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Windstein', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13381339);
INSERT INTO `gameobject_involvedrelation` VALUES 
('180554', '13381339');
INSERT INTO `quest_end_scripts` VALUES 
('13381339', '0', '10', '15208', '300000', '0', '0', '0', '0', '-6716', '1668', '8', '2');

-- ----------------------------
-- Großer Windstein[180466] --
-- ----------------------------

-- Gegenstände
delete from `item_template` where entry = 12291330;
delete from `item_template` where entry = 12291331;
delete from `item_template` where entry = 12291332;
delete from `item_template` where entry = 12291333;
delete from `item_template` where entry = 12291334;
delete from `item_loot_template` where entry = 12291330;
INSERT INTO `item_template` VALUES
(12291330, 15, 0, "Großer Elementarkasten", 20913, 3, 4, 1, 50, 12, 0, 32767, 255, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, '', 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 'internalitemhandler', 0, 0, 0, 0, 0, 0);
INSERT INTO `item_template` VALUES
(12291331, 12, 0, "Großes Feuerelement", 20874, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, '', 0, 0, 0, 12291336, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 'internalitemhandler', 0, 0, 0, 0, 0, 0);
INSERT INTO `item_template` VALUES
(12291332, 12, 0, "Großes Wasserelement", 4136, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, '', 0, 0, 0, 12291227, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 'internalitemhandler', 0, 0, 0, 0, 0, 0);
INSERT INTO `item_template` VALUES
(12291333, 12, 0, "Großes Luftelement", 23755, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, '', 0, 0, 0, 12291228, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 'internalitemhandler', 0, 0, 0, 0, 0, 0);
INSERT INTO `item_template` VALUES
(12291334, 12, 0, "Großes Erdelement", 13686, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, '', 0, 0, 0, 12291339, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 'internalitemhandler', 0, 0, 0, 0, 0, 0);
INSERT INTO `item_loot_template` VALUES
(12291330, 12291331, 0, 1, 1, 1, 0, 0, 0),
(12291330, 12291332, 0, 1, 1, 1, 0, 0, 0),
(12291330, 12291333, 0, 1, 1, 1, 0, 0, 0),
(12291330, 12291334, 0, 1, 1, 1, 0, 0, 0);


-- Hauptquest
delete from quest_template where entry = 12291335;
delete from gameobject_involvedrelation where quest = 12291335;
delete from gameobject_questrelation where quest = 12291335;
INSERT INTO `quest_template` VALUES
(12291335, 0, 1377, 0, 60, 0, 81, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Großer Windstein', NULL, NULL, NULL, '-', NULL, NULL, NULL, NULL, NULL, 20422, 20451, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12291330, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `gameobject_involvedrelation` VALUES 
('180466', '12291335');
INSERT INTO `gameobject_questrelation` VALUES 
('180466', '12291335');

-- Feuerbeschwörung [Großer Windstein (180466-12291336)]
delete from quest_template where entry = 12291336;
delete from gameobject_involvedrelation where quest = 12291336;
delete from `quest_end_scripts` where id = 12291336;
INSERT INTO `quest_template` VALUES
(12291336, 2, 1377, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Großer Windstein', NULL, NULL, NULL, '-', NULL, NULL, NULL, NULL, NULL, 20408, 20406, 20407, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12291336);
INSERT INTO `gameobject_involvedrelation` VALUES 
('180466', '12291336');
INSERT INTO `quest_end_scripts` VALUES 
('12291336', '0', '10', '15203', '300000', '0', '0', '0', '0', '-7887', '1892', '7', '3');

-- Wasserbeschwörung [Großer Windstein (180466-12291227)]
delete from quest_template where entry = 12291227;
delete from gameobject_involvedrelation where quest = 12291227;
delete from `quest_end_scripts` where id = 12291227;
INSERT INTO `quest_template` VALUES
(12291227, 2, 1377, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Großer Windstein', NULL, NULL, NULL, '-', NULL, NULL, NULL, NULL, NULL, 20408, 20406, 20407, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12291227);
INSERT INTO `gameobject_involvedrelation` VALUES 
('180466', '12291227');
INSERT INTO `quest_end_scripts` VALUES 
('12291227', '0', '10', '15305', '300000', '0', '0', '0', '0', '-7887', '1892', '7', '3');

-- Luftbeschwörung [Großer Windstein (180466-12291228)]
delete from quest_template where entry = 12291228;
delete from gameobject_involvedrelation where quest = 12291228;
delete from `quest_end_scripts` where id = 12291228;
INSERT INTO `quest_template` VALUES
(12291228, 2, 1377, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Großer Windstein', NULL, NULL, NULL, '-', NULL, NULL, NULL, NULL, NULL, 20408, 20406, 20407, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12291228);
INSERT INTO `gameobject_involvedrelation` VALUES 
('180466', '12291228');
INSERT INTO `quest_end_scripts` VALUES 
('12291228', '0', '10', '15204', '300000', '0', '0', '0', '0', '-7887', '1892', '7', '3');

-- Erdbeschwörung [Großer Windstein (180466-12291339)]
delete from quest_template where entry = 12291339;
delete from gameobject_involvedrelation where quest = 12291339;
delete from `quest_end_scripts` where id = 12291339;
INSERT INTO `quest_template` VALUES
(12291339, 2, 1377, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Großer Windstein', NULL, NULL, NULL, '-', NULL, NULL, NULL, NULL, NULL, 20408, 20406, 20407, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12291339);
INSERT INTO `gameobject_involvedrelation` VALUES 
('180466', '12291339');
INSERT INTO `quest_end_scripts` VALUES 
('12291339', '0', '10', '15205', '300000', '0', '0', '0', '0', '-7887', '1892', '7', '3');

-- ----------------------------
-- Großer Windstein[180539] --
-- ----------------------------

-- Gegenstände
delete from `item_template` where entry = 13391330;
delete from `item_template` where entry = 13391331;
delete from `item_template` where entry = 13391332;
delete from `item_template` where entry = 13391333;
delete from `item_template` where entry = 13391334;
delete from `item_loot_template` where entry = 13391330;
INSERT INTO `item_template` VALUES
(13391330, 15, 0, "Großer Elementarkasten", 20913, 3, 4, 1, 50, 12, 0, 32767, 255, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, '', 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 'internalitemhandler', 0, 0, 0, 0, 0, 0);
INSERT INTO `item_template` VALUES
(13391331, 12, 0, "Großes Feuerelement", 20874, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, '', 0, 0, 0, 13391336, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 'internalitemhandler', 0, 0, 0, 0, 0, 0);
INSERT INTO `item_template` VALUES
(13391332, 12, 0, "Großes Wasserelement", 4136, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, '', 0, 0, 0, 13391337, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 'internalitemhandler', 0, 0, 0, 0, 0, 0);
INSERT INTO `item_template` VALUES
(13391333, 12, 0, "Großes Luftelement", 23755, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, '', 0, 0, 0, 13391338, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 'internalitemhandler', 0, 0, 0, 0, 0, 0);
INSERT INTO `item_template` VALUES
(13391334, 12, 0, "Großes Erdelement", 13686, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, '', 0, 0, 0, 13391339, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 'internalitemhandler', 0, 0, 0, 0, 0, 0);
INSERT INTO `item_loot_template` VALUES
(13391330, 13391331, 0, 1, 1, 1, 0, 0, 0),
(13391330, 13391332, 0, 1, 1, 1, 0, 0, 0),
(13391330, 13391333, 0, 1, 1, 1, 0, 0, 0),
(13391330, 13391334, 0, 1, 1, 1, 0, 0, 0);


-- Hauptquest
delete from quest_template where entry = 13391335;
delete from gameobject_involvedrelation where quest = 13391335;
delete from gameobject_questrelation where quest = 13391335;
INSERT INTO `quest_template` VALUES
(13391335, 0, 1377, 0, 60, 0, 81, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Großer Windstein', NULL, NULL, NULL, '-', NULL, NULL, NULL, NULL, NULL, 20422, 20451, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13391330, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `gameobject_involvedrelation` VALUES 
('180539', '13391335');
INSERT INTO `gameobject_questrelation` VALUES 
('180539', '13391335');

-- Feuerbeschwörung [Großer Windstein (180539-13391336)]
delete from quest_template where entry = 13391336;
delete from gameobject_involvedrelation where quest = 13391336;
delete from `quest_end_scripts` where id = 13391336;
INSERT INTO `quest_template` VALUES
(13391336, 2, 1377, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Großer Windstein', NULL, NULL, NULL, '-', NULL, NULL, NULL, NULL, NULL, 20408, 20406, 20407, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13391336);
INSERT INTO `gameobject_involvedrelation` VALUES 
('180539', '13391336');
INSERT INTO `quest_end_scripts` VALUES 
('13391336', '0', '10', '15203', '300000', '0', '0', '0', '0', '-7014', '1144', '7', '1');

-- Wasserbeschwörung [Großer Windstein (180539-13391337)]
delete from quest_template where entry = 13391337;
delete from gameobject_involvedrelation where quest = 13391337;
delete from `quest_end_scripts` where id = 13391337;
INSERT INTO `quest_template` VALUES
(13391337, 2, 1377, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Großer Windstein', NULL, NULL, NULL, '-', NULL, NULL, NULL, NULL, NULL, 20408, 20406, 20407, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13391337);
INSERT INTO `gameobject_involvedrelation` VALUES 
('180539', '13391337');
INSERT INTO `quest_end_scripts` VALUES 
('13391337', '0', '10', '15305', '300000', '0', '0', '0', '0', '-7014', '1144', '7', '1');

-- Luftbeschwörung [Großer Windstein (180539-13391338)]
delete from quest_template where entry = 13391338;
delete from gameobject_involvedrelation where quest = 13391338;
delete from `quest_end_scripts` where id = 13391338;
INSERT INTO `quest_template` VALUES
(13391338, 2, 1377, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Großer Windstein', NULL, NULL, NULL, '-', NULL, NULL, NULL, NULL, NULL, 20408, 20406, 20407, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13391338);
INSERT INTO `gameobject_involvedrelation` VALUES 
('180539', '13391338');
INSERT INTO `quest_end_scripts` VALUES 
('13391338', '0', '10', '15204', '300000', '0', '0', '0', '0', '-7014', '1144', '7', '1');

-- Erdbeschwörung [Großer Windstein (180539-13391339)]
delete from quest_template where entry = 13391339;
delete from gameobject_involvedrelation where quest = 13391339;
delete from `quest_end_scripts` where id = 13391339;
INSERT INTO `quest_template` VALUES
(13391339, 2, 1377, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Großer Windstein', NULL, NULL, NULL, '-', NULL, NULL, NULL, NULL, NULL, 20408, 20406, 20407, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13391339);
INSERT INTO `gameobject_involvedrelation` VALUES 
('180539', '13391339');
INSERT INTO `quest_end_scripts` VALUES 
('13391339', '0', '10', '15205', '300000', '0', '0', '0', '0', '-7014', '1144', '7', '1');


-- ----------------------------
-- Großer Windstein[180559] --
-- ----------------------------

-- Gegenstände
delete from `item_template` where entry = 11191330;
delete from `item_template` where entry = 11191331;
delete from `item_template` where entry = 11191332;
delete from `item_template` where entry = 11191333;
delete from `item_template` where entry = 11191334;
delete from `item_loot_template` where entry = 11191330;
INSERT INTO `item_template` VALUES
(11191330, 15, 0, "Großer Elementarkasten", 20913, 3, 4, 1, 50, 12, 0, 32767, 255, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, '', 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 'internalitemhandler', 0, 0, 0, 0, 0, 0);
INSERT INTO `item_template` VALUES
(11191331, 12, 0, "Großes Feuerelement", 20874, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, '', 0, 0, 0, 11191336, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 'internalitemhandler', 0, 0, 0, 0, 0, 0);
INSERT INTO `item_template` VALUES
(11191332, 12, 0, "Großes Wasserelement", 4136, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, '', 0, 0, 0, 11191117, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 'internalitemhandler', 0, 0, 0, 0, 0, 0);
INSERT INTO `item_template` VALUES
(11191333, 12, 0, "Großes Luftelement", 23755, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, '', 0, 0, 0, 11191118, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 'internalitemhandler', 0, 0, 0, 0, 0, 0);
INSERT INTO `item_template` VALUES
(11191334, 12, 0, "Großes Erdelement", 13686, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, '', 0, 0, 0, 11191339, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 'internalitemhandler', 0, 0, 0, 0, 0, 0);
INSERT INTO `item_loot_template` VALUES
(11191330, 11191331, 0, 1, 1, 1, 0, 0, 0),
(11191330, 11191332, 0, 1, 1, 1, 0, 0, 0),
(11191330, 11191333, 0, 1, 1, 1, 0, 0, 0),
(11191330, 11191334, 0, 1, 1, 1, 0, 0, 0);


-- Hauptquest
delete from quest_template where entry = 11191335;
delete from gameobject_involvedrelation where quest = 11191335;
delete from gameobject_questrelation where quest = 11191335;
INSERT INTO `quest_template` VALUES
(11191335, 0, 1377, 0, 60, 0, 81, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Großer Windstein', NULL, NULL, '-', NULL, NULL, NULL, NULL, NULL, NULL, 20422, 20451, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11191330, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `gameobject_involvedrelation` VALUES 
('180559', '11191335');
INSERT INTO `gameobject_questrelation` VALUES 
('180559', '11191335');

-- Feuerbeschwörung [Großer Windstein (180559-11191336)]
delete from quest_template where entry = 11191336;
delete from gameobject_involvedrelation where quest = 11191336;
delete from `quest_end_scripts` where id = 11191336;
INSERT INTO `quest_template` VALUES
(11191336, 2, 1377, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Großer Windstein', NULL, NULL, NULL, '-', NULL, NULL, NULL, NULL, NULL, 20408, 20406, 20407, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11191336);
INSERT INTO `gameobject_involvedrelation` VALUES 
('180559', '11191336');
INSERT INTO `quest_end_scripts` VALUES 
('11191336', '0', '10', '15203', '300000', '0', '0', '0', '0', '-6757', '1654', '6', '6');

-- Wasserbeschwörung [Großer Windstein (180559-11191117)]
delete from quest_template where entry = 11191117;
delete from gameobject_involvedrelation where quest = 11191117;
delete from `quest_end_scripts` where id = 11191117;
INSERT INTO `quest_template` VALUES
(11191117, 2, 1377, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Großer Windstein', NULL, NULL, NULL, '-', NULL, NULL, NULL, NULL, NULL, 20408, 20406, 20407, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11191117);
INSERT INTO `gameobject_involvedrelation` VALUES 
('180559', '11191117');
INSERT INTO `quest_end_scripts` VALUES 
('11191117', '0', '10', '15305', '300000', '0', '0', '0', '0', '-6757', '1654', '6', '6');

-- Luftbeschwörung [Großer Windstein (180559-11191118)]
delete from quest_template where entry = 11191118;
delete from gameobject_involvedrelation where quest = 11191118;
delete from `quest_end_scripts` where id = 11191118;
INSERT INTO `quest_template` VALUES
(11191118, 2, 1377, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Großer Windstein', NULL, NULL, NULL, '-', NULL, NULL, NULL, NULL, NULL, 20408, 20406, 20407, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11191118);
INSERT INTO `gameobject_involvedrelation` VALUES 
('180559', '11191118');
INSERT INTO `quest_end_scripts` VALUES 
('11191118', '0', '10', '15204', '300000', '0', '0', '0', '0', '-6757', '1654', '6', '6');

-- Erdbeschwörung [Großer Windstein (180559-11191339)]
delete from quest_template where entry = 11191339;
delete from gameobject_involvedrelation where quest = 11191339;
delete from `quest_end_scripts` where id = 11191339;
INSERT INTO `quest_template` VALUES
(11191339, 2, 1377, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Großer Windstein', NULL, NULL, NULL, '-', NULL, NULL, NULL, NULL, NULL, 20408, 20406, 20407, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11191339);
INSERT INTO `gameobject_involvedrelation` VALUES 
('180559', '11191339');
INSERT INTO `quest_end_scripts` VALUES 
('11191339', '0', '10', '15205', '300000', '0', '0', '0', '0', '-6757', '1654', '6', '6');

-- -----------------------------
-- Kleiner Windstein[180456] --
-- -----------------------------

-- Gegenstände
delete from `item_template` where entry = 12271330;
delete from `item_template` where entry = 12271331;
delete from `item_template` where entry = 12271332;
delete from `item_template` where entry = 12271333;
delete from `item_template` where entry = 12271334;
delete from `item_loot_template` where entry = 12271330;
INSERT INTO `item_template` VALUES
(12271330, 15, 0, 'Kleiner Elementarkasten', 20913, 1, 4, 1, 50, 12, 0, 32767, 255, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, '', 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 'internalitemhandler', 0, 0, 0, 0, 0, 0);
INSERT INTO `item_template` VALUES
(12271331, 12, 0, "Kleines Feuerelement", 20874, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, '', 0, 0, 0, 12271336, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 'internalitemhandler', 0, 0, 0, 0, 0, 0);
INSERT INTO `item_template` VALUES
(12271332, 12, 0, "Kleines Wasserelement", 4136, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, '', 0, 0, 0, 12271227, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 'internalitemhandler', 0, 0, 0, 0, 0, 0);
INSERT INTO `item_template` VALUES
(12271333, 12, 0, "Kleines Luftelement", 23755, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, '', 0, 0, 0, 12271338, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 'internalitemhandler', 0, 0, 0, 0, 0, 0);
INSERT INTO `item_template` VALUES
(12271334, 12, 0, "Kleines Erdelement", 13686, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, '', 0, 0, 0, 12271339, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 'internalitemhandler', 0, 0, 0, 0, 0, 0);
INSERT INTO `item_loot_template` VALUES
(12271330, 12271331, 0, 1, 1, 1, 0, 0, 0),
(12271330, 12271332, 0, 1, 1, 1, 0, 0, 0),
(12271330, 12271333, 0, 1, 1, 1, 0, 0, 0),
(12271330, 12271334, 0, 1, 1, 1, 0, 0, 0);


-- Hauptquest
delete from quest_template where entry = 12271335;
delete from gameobject_involvedrelation where quest = 12271335;
delete from gameobject_questrelation where quest = 12271335;
INSERT INTO `quest_template` VALUES
(12271335, 0, 1377, 0, 60, 0, 81, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Geringer Windstein', NULL, NULL, NULL, '-', NULL, NULL, NULL, NULL, NULL, 20408, 20406, 20407, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12271330, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `gameobject_involvedrelation` VALUES 
('180456', '12271335');
INSERT INTO `gameobject_questrelation` VALUES 
('180456', '12271335');

-- Feuerbeschwörung [Geringer Windstein (180456-12271336)]
delete from quest_template where entry = 12271336;
delete from gameobject_involvedrelation where quest = 12271336;
delete from `quest_end_scripts` where id = 12271336;
INSERT INTO `quest_template` VALUES
(12271336, 2, 1377, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Geringer Windstein', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12271336);
INSERT INTO `gameobject_involvedrelation` VALUES 
('180456', '12271336');
INSERT INTO `quest_end_scripts` VALUES 
('12271336', '0', '10', '15209', '300000', '0', '0', '0', '0', '-7950', '1829', '4', '4');

-- Wasserbeschwörung [Geringer Windstein (180456-12271227)]
delete from quest_template where entry = 12271227;
delete from gameobject_involvedrelation where quest = 12271227;
delete from `quest_end_scripts` where id = 12271227;
INSERT INTO `quest_template` VALUES
(12271227, 2, 1377, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Geringer Windstein', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12271227);
INSERT INTO `gameobject_involvedrelation` VALUES 
('180456', '12271227');
INSERT INTO `quest_end_scripts` VALUES 
('12271227', '0', '10', '15211', '300000', '0', '0', '0', '0', '-7950', '1829', '4', '4');

-- Luftbeschwörung [Geringer Windstein (180456-12271338)]
delete from quest_template where entry = 12271338;
delete from gameobject_involvedrelation where quest = 12271338;
delete from `quest_end_scripts` where id = 12271338;
INSERT INTO `quest_template` VALUES
(12271338, 2, 1377, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Geringer Windstein', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12271338);
INSERT INTO `gameobject_involvedrelation` VALUES 
('180456', '12271338');
INSERT INTO `quest_end_scripts` VALUES 
('12271338', '0', '10', '15212', '300000', '0', '0', '0', '0', '-7950', '1829', '4', '4');

-- Erdbeschwörung [Geringer Windstein (180456-12271339)]
delete from quest_template where entry = 12271339;
delete from gameobject_involvedrelation where quest = 12271339;
delete from `quest_end_scripts` where id = 12271339;
INSERT INTO `quest_template` VALUES
(12271339, 2, 1377, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Geringer Windstein', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12271339);
INSERT INTO `gameobject_involvedrelation` VALUES 
('180456', '12271339');
INSERT INTO `quest_end_scripts` VALUES 
('12271339', '0', '10', '15307', '300000', '0', '0', '0', '0', '-7950', '1829', '4', '4');

-- -----------------------------
-- Kleiner Windstein[180518] --
-- -----------------------------

-- Gegenstände
delete from `item_template` where entry = 16671330;
delete from `item_template` where entry = 16671331;
delete from `item_template` where entry = 16671332;
delete from `item_template` where entry = 16671333;
delete from `item_template` where entry = 16671334;
delete from `item_loot_template` where entry = 16671330;
INSERT INTO `item_template` VALUES
(16671330, 15, 0, 'Kleiner Elementarkasten', 20913, 1, 4, 1, 50, 12, 0, 32767, 255, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, '', 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 'internalitemhandler', 0, 0, 0, 0, 0, 0);
INSERT INTO `item_template` VALUES
(16671331, 12, 0, "Kleines Feuerelement", 20874, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, '', 0, 0, 0, 16671336, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 'internalitemhandler', 0, 0, 0, 0, 0, 0);
INSERT INTO `item_template` VALUES
(16671332, 12, 0, "Kleines Wasserelement", 4136, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, '', 0, 0, 0, 16671667, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 'internalitemhandler', 0, 0, 0, 0, 0, 0);
INSERT INTO `item_template` VALUES
(16671333, 12, 0, "Kleines Luftelement", 23755, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, '', 0, 0, 0, 16671338, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 'internalitemhandler', 0, 0, 0, 0, 0, 0);
INSERT INTO `item_template` VALUES
(16671334, 12, 0, "Kleines Erdelement", 13686, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, '', 0, 0, 0, 16671339, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 'internalitemhandler', 0, 0, 0, 0, 0, 0);
INSERT INTO `item_loot_template` VALUES
(16671330, 16671331, 0, 1, 1, 1, 0, 0, 0),
(16671330, 16671332, 0, 1, 1, 1, 0, 0, 0),
(16671330, 16671333, 0, 1, 1, 1, 0, 0, 0),
(16671330, 16671334, 0, 1, 1, 1, 0, 0, 0);


-- Hauptquest
delete from quest_template where entry = 16671335;
delete from gameobject_involvedrelation where quest = 16671335;
delete from gameobject_questrelation where quest = 16671335;
INSERT INTO `quest_template` VALUES
(16671335, 0, 1377, 0, 60, 0, 81, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Geringer Windstein', NULL, NULL, NULL, '-', NULL, NULL, NULL, NULL, NULL, 20408, 20406, 20407, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16671330, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `gameobject_involvedrelation` VALUES 
('180518', '16671335');
INSERT INTO `gameobject_questrelation` VALUES 
('180518', '16671335');

-- Feuerbeschwörung [Geringer Windstein (180518-16671336)]
delete from quest_template where entry = 16671336;
delete from gameobject_involvedrelation where quest = 16671336;
delete from `quest_end_scripts` where id = 16671336;
INSERT INTO `quest_template` VALUES
(16671336, 2, 1377, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Geringer Windstein', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16671336);
INSERT INTO `gameobject_involvedrelation` VALUES 
('180518', '16671336');
INSERT INTO `quest_end_scripts` VALUES 
('16671336', '0', '10', '15209', '300000', '0', '0', '0', '0', '-7835', '1906', '5', '3,5');

-- Wasserbeschwörung [Geringer Windstein (180518-16671667)]
delete from quest_template where entry = 16671667;
delete from gameobject_involvedrelation where quest = 16671667;
delete from `quest_end_scripts` where id = 16671667;
INSERT INTO `quest_template` VALUES
(16671667, 2, 1377, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Geringer Windstein', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16671667);
INSERT INTO `gameobject_involvedrelation` VALUES 
('180518', '16671667');
INSERT INTO `quest_end_scripts` VALUES 
('16671667', '0', '10', '15211', '300000', '0', '0', '0', '0', '-7835', '1906', '5', '3,5');

-- Luftbeschwörung [Geringer Windstein (180518-16671338)]
delete from quest_template where entry = 16671338;
delete from gameobject_involvedrelation where quest = 16671338;
delete from `quest_end_scripts` where id = 16671338;
INSERT INTO `quest_template` VALUES
(16671338, 2, 1377, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Geringer Windstein', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16671338);
INSERT INTO `gameobject_involvedrelation` VALUES 
('180518', '16671338');
INSERT INTO `quest_end_scripts` VALUES 
('16671338', '0', '10', '15212', '300000', '0', '0', '0', '0', '-7835', '1906', '5', '3,5');

-- Erdbeschwörung [Geringer Windstein (180518-16671339)]
delete from quest_template where entry = 16671339;
delete from gameobject_involvedrelation where quest = 16671339;
delete from `quest_end_scripts` where id = 16671339;
INSERT INTO `quest_template` VALUES
(16671339, 2, 1377, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Geringer Windstein', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16671339);
INSERT INTO `gameobject_involvedrelation` VALUES 
('180518', '16671339');
INSERT INTO `quest_end_scripts` VALUES 
('16671339', '0', '10', '15307', '300000', '0', '0', '0', '0', '-7835', '1906', '5', '3,5'); 

-- -----------------------------
-- Kleiner Windstein[180529] --
-- -----------------------------

-- Gegenstände
delete from `item_template` where entry = 11171330;
delete from `item_template` where entry = 11171331;
delete from `item_template` where entry = 11171332;
delete from `item_template` where entry = 11171333;
delete from `item_template` where entry = 11171334;
delete from `item_loot_template` where entry = 11171330;
INSERT INTO `item_template` VALUES
(11171330, 15, 0, 'Kleiner Elementarkasten', 20913, 1, 4, 1, 50, 12, 0, 32767, 255, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, '', 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 'internalitemhandler', 0, 0, 0, 0, 0, 0);
INSERT INTO `item_template` VALUES
(11171331, 12, 0, "Kleines Feuerelement", 20874, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, '', 0, 0, 0, 11171336, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 'internalitemhandler', 0, 0, 0, 0, 0, 0);
INSERT INTO `item_template` VALUES
(11171332, 12, 0, "Kleines Wasserelement", 4136, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, '', 0, 0, 0, 11171117, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 'internalitemhandler', 0, 0, 0, 0, 0, 0);
INSERT INTO `item_template` VALUES
(11171333, 12, 0, "Kleines Luftelement", 23755, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, '', 0, 0, 0, 11171338, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 'internalitemhandler', 0, 0, 0, 0, 0, 0);
INSERT INTO `item_template` VALUES
(11171334, 12, 0, "Kleines Erdelement", 13686, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, '', 0, 0, 0, 11171339, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 'internalitemhandler', 0, 0, 0, 0, 0, 0);
INSERT INTO `item_loot_template` VALUES
(11171330, 11171331, 0, 1, 1, 1, 0, 0, 0),
(11171330, 11171332, 0, 1, 1, 1, 0, 0, 0),
(11171330, 11171333, 0, 1, 1, 1, 0, 0, 0),
(11171330, 11171334, 0, 1, 1, 1, 0, 0, 0);


-- Hauptquest
delete from quest_template where entry = 11171335;
delete from gameobject_involvedrelation where quest = 11171335;
delete from gameobject_questrelation where quest = 11171335;
INSERT INTO `quest_template` VALUES
(11171335, 0, 1377, 0, 60, 0, 81, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Geringer Windstein', NULL, NULL, NULL, '-', NULL, NULL, NULL, NULL, NULL, 20408, 20406, 20407, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11171330, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `gameobject_involvedrelation` VALUES 
('180529', '11171335');
INSERT INTO `gameobject_questrelation` VALUES 
('180529', '11171335');

-- Feuerbeschwörung [Geringer Windstein (180529-11171336)]
delete from quest_template where entry = 11171336;
delete from gameobject_involvedrelation where quest = 11171336;
delete from `quest_end_scripts` where id = 11171336;
INSERT INTO `quest_template` VALUES
(11171336, 2, 1377, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Geringer Windstein', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11171336);
INSERT INTO `gameobject_involvedrelation` VALUES 
('180529', '11171336');
INSERT INTO `quest_end_scripts` VALUES 
('11171336', '0', '10', '15209', '300000', '0', '0', '0', '0', '-6955', '1181', '11', '6,3');

-- Wasserbeschwörung [Geringer Windstein (180529-11171117)]
delete from quest_template where entry = 11171117;
delete from gameobject_involvedrelation where quest = 11171117;
delete from `quest_end_scripts` where id = 11171117;
INSERT INTO `quest_template` VALUES
(11171117, 2, 1377, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Geringer Windstein', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11171117);
INSERT INTO `gameobject_involvedrelation` VALUES 
('180529', '11171117');
INSERT INTO `quest_end_scripts` VALUES 
('11171117', '0', '10', '15211', '300000', '0', '0', '0', '0', '-6955', '1181', '11', '6,3');

-- Luftbeschwörung [Geringer Windstein (180529-11171338)]
delete from quest_template where entry = 11171338;
delete from gameobject_involvedrelation where quest = 11171338;
delete from `quest_end_scripts` where id = 11171338;
INSERT INTO `quest_template` VALUES
(11171338, 2, 1377, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Geringer Windstein', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11171338);
INSERT INTO `gameobject_involvedrelation` VALUES 
('180529', '11171338');
INSERT INTO `quest_end_scripts` VALUES 
('11171338', '0', '10', '15212', '300000', '0', '0', '0', '0', '-6955', '1181', '11', '6,3');

-- Erdbeschwörung [Geringer Windstein (180529-11171339)]
delete from quest_template where entry = 11171339;
delete from gameobject_involvedrelation where quest = 11171339;
delete from `quest_end_scripts` where id = 11171339;
INSERT INTO `quest_template` VALUES
(11171339, 2, 1377, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Geringer Windstein', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11171339);
INSERT INTO `gameobject_involvedrelation` VALUES 
('180529', '11171339');
INSERT INTO `quest_end_scripts` VALUES 
('11171339', '0', '10', '15307', '300000', '0', '0', '0', '0', '-6955', '1181', '11', '6,3');

-- -----------------------------
-- Kleiner Windstein[180544] --
-- -----------------------------

-- Gegenstände
delete from `item_template` where entry = 13371330;
delete from `item_template` where entry = 13371331;
delete from `item_template` where entry = 13371332;
delete from `item_template` where entry = 13371333;
delete from `item_template` where entry = 13371334;
delete from `item_loot_template` where entry = 13371330;
INSERT INTO `item_template` VALUES
(13371330, 15, 0, 'Kleiner Elementarkasten', 20913, 1, 4, 1, 50, 12, 0, 32767, 255, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, '', 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 'internalitemhandler', 0, 0, 0, 0, 0, 0);
INSERT INTO `item_template` VALUES
(13371331, 12, 0, "Kleines Feuerelement", 20874, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, '', 0, 0, 0, 13371336, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 'internalitemhandler', 0, 0, 0, 0, 0, 0);
INSERT INTO `item_template` VALUES
(13371332, 12, 0, "Kleines Wasserelement", 4136, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, '', 0, 0, 0, 13371337, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 'internalitemhandler', 0, 0, 0, 0, 0, 0);
INSERT INTO `item_template` VALUES
(13371333, 12, 0, "Kleines Luftelement", 23755, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, '', 0, 0, 0, 13371338, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 'internalitemhandler', 0, 0, 0, 0, 0, 0);
INSERT INTO `item_template` VALUES
(13371334, 12, 0, "Kleines Erdelement", 13686, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, '', 0, 0, 0, 13371339, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 'internalitemhandler', 0, 0, 0, 0, 0, 0);
INSERT INTO `item_loot_template` VALUES
(13371330, 13371331, 0, 1, 1, 1, 0, 0, 0),
(13371330, 13371332, 0, 1, 1, 1, 0, 0, 0),
(13371330, 13371333, 0, 1, 1, 1, 0, 0, 0),
(13371330, 13371334, 0, 1, 1, 1, 0, 0, 0);


-- Hauptquest
delete from quest_template where entry = 13371335;
delete from gameobject_involvedrelation where quest = 13371335;
delete from gameobject_questrelation where quest = 13371335;
INSERT INTO `quest_template` VALUES
(13371335, 0, 1377, 0, 60, 0, 81, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Geringer Windstein', NULL, NULL, NULL, '-', NULL, NULL, NULL, NULL, NULL, 20408, 20406, 20407, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13371330, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `gameobject_involvedrelation` VALUES 
('180544', '13371335');
INSERT INTO `gameobject_questrelation` VALUES 
('180544', '13371335');

-- Feuerbeschwörung [Geringer Windstein (180544-13371336)]
delete from quest_template where entry = 13371336;
delete from gameobject_involvedrelation where quest = 13371336;
delete from `quest_end_scripts` where id = 13371336;
INSERT INTO `quest_template` VALUES
(13371336, 2, 1377, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Geringer Windstein', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13371336);
INSERT INTO `gameobject_involvedrelation` VALUES 
('180544', '13371336');
INSERT INTO `quest_end_scripts` VALUES 
('13371336', '0', '10', '15209', '300000', '0', '0', '0', '0', '-7023', '1194', '7', '2,55');

-- Wasserbeschwörung [Geringer Windstein (180544-13371337)]
delete from quest_template where entry = 13371337;
delete from gameobject_involvedrelation where quest = 13371337;
delete from `quest_end_scripts` where id = 13371337;
INSERT INTO `quest_template` VALUES
(13371337, 2, 1377, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Geringer Windstein', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13371337);
INSERT INTO `gameobject_involvedrelation` VALUES 
('180544', '13371337');
INSERT INTO `quest_end_scripts` VALUES 
('13371337', '0', '10', '15211', '300000', '0', '0', '0', '0', '-7023', '1194', '7', '2,55');

-- Luftbeschwörung [Geringer Windstein (180544-13371338)]
delete from quest_template where entry = 13371338;
delete from gameobject_involvedrelation where quest = 13371338;
delete from `quest_end_scripts` where id = 13371338;
INSERT INTO `quest_template` VALUES
(13371338, 2, 1377, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Geringer Windstein', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13371338);
INSERT INTO `gameobject_involvedrelation` VALUES 
('180544', '13371338');
INSERT INTO `quest_end_scripts` VALUES 
('13371338', '0', '10', '15212', '300000', '0', '0', '0', '0', '-7023', '1194', '7', '2,55');

-- Erdbeschwörung [Geringer Windstein (180544-13371339)]
delete from quest_template where entry = 13371339;
delete from gameobject_involvedrelation where quest = 13371339;
delete from `quest_end_scripts` where id = 13371339;
INSERT INTO `quest_template` VALUES
(13371339, 2, 1377, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Geringer Windstein', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13371339);
INSERT INTO `gameobject_involvedrelation` VALUES 
('180544', '13371339');
INSERT INTO `quest_end_scripts` VALUES 
('13371339', '0', '10', '15307', '300000', '0', '0', '0', '0', '-7023', '1194', '7', '2,55');

-- -----------------------------
-- Kleiner Windstein[180549] --
-- -----------------------------

-- Gegenstände
delete from `item_template` where entry = 15571330;
delete from `item_template` where entry = 15571331;
delete from `item_template` where entry = 15571332;
delete from `item_template` where entry = 15571333;
delete from `item_template` where entry = 15571334;
delete from `item_loot_template` where entry = 15571330;
INSERT INTO `item_template` VALUES
(15571330, 15, 0, 'Kleiner Elementarkasten', 20913, 1, 4, 1, 50, 12, 0, 32767, 255, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, '', 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 'internalitemhandler', 0, 0, 0, 0, 0, 0);
INSERT INTO `item_template` VALUES
(15571331, 12, 0, "Kleines Feuerelement", 20874, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, '', 0, 0, 0, 15571336, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 'internalitemhandler', 0, 0, 0, 0, 0, 0);
INSERT INTO `item_template` VALUES
(15571332, 12, 0, "Kleines Wasserelement", 4136, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, '', 0, 0, 0, 15571557, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 'internalitemhandler', 0, 0, 0, 0, 0, 0);
INSERT INTO `item_template` VALUES
(15571333, 12, 0, "Kleines Luftelement", 23755, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, '', 0, 0, 0, 15571338, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 'internalitemhandler', 0, 0, 0, 0, 0, 0);
INSERT INTO `item_template` VALUES
(15571334, 12, 0, "Kleines Erdelement", 13686, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, '', 0, 0, 0, 15571339, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 'internalitemhandler', 0, 0, 0, 0, 0, 0);
INSERT INTO `item_loot_template` VALUES
(15571330, 15571331, 0, 1, 1, 1, 0, 0, 0),
(15571330, 15571332, 0, 1, 1, 1, 0, 0, 0),
(15571330, 15571333, 0, 1, 1, 1, 0, 0, 0),
(15571330, 15571334, 0, 1, 1, 1, 0, 0, 0);


-- Hauptquest
delete from quest_template where entry = 15571335;
delete from gameobject_involvedrelation where quest = 15571335;
delete from gameobject_questrelation where quest = 15571335;
INSERT INTO `quest_template` VALUES
(15571335, 0, 1377, 0, 60, 0, 81, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Geringer Windstein', NULL, NULL, NULL, '-', NULL, NULL, NULL, NULL, NULL, 20408, 20406, 20407, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15571330, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `gameobject_involvedrelation` VALUES 
('180549', '15571335');
INSERT INTO `gameobject_questrelation` VALUES 
('180549', '15571335');

-- Feuerbeschwörung [Geringer Windstein (180549-15571336)]
delete from quest_template where entry = 15571336;
delete from gameobject_involvedrelation where quest = 15571336;
delete from `quest_end_scripts` where id = 15571336;
INSERT INTO `quest_template` VALUES
(15571336, 2, 1377, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Geringer Windstein', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15571336);
INSERT INTO `gameobject_involvedrelation` VALUES 
('180549', '15571336');
INSERT INTO `quest_end_scripts` VALUES 
('15571336', '0', '10', '15209', '300000', '0', '0', '0', '0', '-6679', '1556', '9', '0,6');

-- Wasserbeschwörung [Geringer Windstein (180549-15571557)]
delete from quest_template where entry = 15571557;
delete from gameobject_involvedrelation where quest = 15571557;
delete from `quest_end_scripts` where id = 15571557;
INSERT INTO `quest_template` VALUES
(15571557, 2, 1377, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Geringer Windstein', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15571557);
INSERT INTO `gameobject_involvedrelation` VALUES 
('180549', '15571557');
INSERT INTO `quest_end_scripts` VALUES 
('15571557', '0', '10', '15211', '300000', '0', '0', '0', '0', '-6679', '1556', '9', '0,6');

-- Luftbeschwörung [Geringer Windstein (180549-15571338)]
delete from quest_template where entry = 15571338;
delete from gameobject_involvedrelation where quest = 15571338;
delete from `quest_end_scripts` where id = 15571338;
INSERT INTO `quest_template` VALUES
(15571338, 2, 1377, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Geringer Windstein', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15571338);
INSERT INTO `gameobject_involvedrelation` VALUES 
('180549', '15571338');
INSERT INTO `quest_end_scripts` VALUES 
('15571338', '0', '10', '15212', '300000', '0', '0', '0', '0', '-6679', '1556', '9', '0,6');

-- Erdbeschwörung [Geringer Windstein (180549-15571339)]
delete from quest_template where entry = 15571339;
delete from gameobject_involvedrelation where quest = 15571339;
delete from `quest_end_scripts` where id = 15571339;
INSERT INTO `quest_template` VALUES
(15571339, 2, 1377, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Geringer Windstein', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15571339);
INSERT INTO `gameobject_involvedrelation` VALUES 
('180549', '15571339');
INSERT INTO `quest_end_scripts` VALUES 
('15571339', '0', '10', '15307', '300000', '0', '0', '0', '0', '-6679', '1556', '9', '0,6'); 

-- -----------------------------
-- Kleiner Windstein[180564] --
-- -----------------------------

-- Gegenstände
delete from `item_template` where entry = 14471330;
delete from `item_template` where entry = 14471331;
delete from `item_template` where entry = 14471332;
delete from `item_template` where entry = 14471333;
delete from `item_template` where entry = 14471334;
delete from `item_loot_template` where entry = 14471330;
INSERT INTO `item_template` VALUES
(14471330, 15, 0, 'Kleiner Elementarkasten', 20913, 1, 4, 1, 50, 12, 0, 32767, 255, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, '', 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 'internalitemhandler', 0, 0, 0, 0, 0, 0);
INSERT INTO `item_template` VALUES
(14471331, 12, 0, "Kleines Feuerelement", 20874, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, '', 0, 0, 0, 14471336, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 'internalitemhandler', 0, 0, 0, 0, 0, 0);
INSERT INTO `item_template` VALUES
(14471332, 12, 0, "Kleines Wasserelement", 4136, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, '', 0, 0, 0, 14471447, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 'internalitemhandler', 0, 0, 0, 0, 0, 0);
INSERT INTO `item_template` VALUES
(14471333, 12, 0, "Kleines Luftelement", 23755, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, '', 0, 0, 0, 14471338, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 'internalitemhandler', 0, 0, 0, 0, 0, 0);
INSERT INTO `item_template` VALUES
(14471334, 12, 0, "Kleines Erdelement", 13686, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, '', 0, 0, 0, 14471339, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 'internalitemhandler', 0, 0, 0, 0, 0, 0);
INSERT INTO `item_loot_template` VALUES
(14471330, 14471331, 0, 1, 1, 1, 0, 0, 0),
(14471330, 14471332, 0, 1, 1, 1, 0, 0, 0),
(14471330, 14471333, 0, 1, 1, 1, 0, 0, 0),
(14471330, 14471334, 0, 1, 1, 1, 0, 0, 0);


-- Hauptquest
delete from quest_template where entry = 14471335;
delete from gameobject_involvedrelation where quest = 14471335;
delete from gameobject_questrelation where quest = 14471335;
INSERT INTO `quest_template` VALUES
(14471335, 0, 1377, 0, 60, 0, 81, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Geringer Windstein', NULL, NULL, '-', NULL, NULL, NULL, NULL, NULL, NULL, 20408, 20406, 20407, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 14471330, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `gameobject_involvedrelation` VALUES 
('180564', '14471335');
INSERT INTO `gameobject_questrelation` VALUES 
('180564', '14471335');

-- Feuerbeschwörung [Geringer Windstein (180564-14471336)]
delete from quest_template where entry = 14471336;
delete from gameobject_involvedrelation where quest = 14471336;
delete from `quest_end_scripts` where id = 14471336;
INSERT INTO `quest_template` VALUES
(14471336, 2, 1377, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Geringer Windstein', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 14471336);
INSERT INTO `gameobject_involvedrelation` VALUES 
('180564', '14471336');
INSERT INTO `quest_end_scripts` VALUES 
('14471336', '0', '10', '15209', '300000', '0', '0', '0', '0', '-6790', '1673', '6', '2');

-- Wasserbeschwörung [Geringer Windstein (180564-14471447)]
delete from quest_template where entry = 14471447;
delete from gameobject_involvedrelation where quest = 14471447;
delete from `quest_end_scripts` where id = 14471447;
INSERT INTO `quest_template` VALUES
(14471447, 2, 1377, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Geringer Windstein', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 14471447);
INSERT INTO `gameobject_involvedrelation` VALUES 
('180564', '14471447');
INSERT INTO `quest_end_scripts` VALUES 
('14471447', '0', '10', '15211', '300000', '0', '0', '0', '0', '-6790', '1673', '6', '2');

-- Luftbeschwörung [Geringer Windstein (180564-14471338)]
delete from quest_template where entry = 14471338;
delete from gameobject_involvedrelation where quest = 14471338;
delete from `quest_end_scripts` where id = 14471338;
INSERT INTO `quest_template` VALUES
(14471338, 2, 1377, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Geringer Windstein', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 14471338);
INSERT INTO `gameobject_involvedrelation` VALUES 
('180564', '14471338');
INSERT INTO `quest_end_scripts` VALUES 
('14471338', '0', '10', '15212', '300000', '0', '0', '0', '0', '-6790', '1673', '6', '2');

-- Erdbeschwörung [Geringer Windstein (180564-14471339)]
delete from quest_template where entry = 14471339;
delete from gameobject_involvedrelation where quest = 14471339;
delete from `quest_end_scripts` where id = 14471339;
INSERT INTO `quest_template` VALUES
(14471339, 2, 1377, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Geringer Windstein', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 14471339);
INSERT INTO `gameobject_involvedrelation` VALUES 
('180564', '14471339');
INSERT INTO `quest_end_scripts` VALUES 
('14471339', '0', '10', '15307', '300000', '0', '0', '0', '0', '-6790', '1673', '6', '2'); 















