-------------------------------------------------------
-- 	MC-Entertainment                               --
--	Databasefix by Baum UPDATE 1.07 [26.04.2010]   --
--	for mc-wow [Lennix]                            --
-------------------------------------------------------


--
-- Quest-Legenden Erwachen funktioniert nun!
--
UPDATE `quest_template` SET `SpecialFlags` = '0' WHERE `quest_template`.`entry` =8447 LIMIT 1 ;


--
-- Quest-Undercover funktioniert nun!
--
UPDATE `creature_template` SET `faction_A` = '7',
`faction_H` = '7' WHERE `creature_template`.`entry` =7233 LIMIT 1 ;


--
-- Quest-Der große Fras Siabi funktioniert nun!
--
DELETE FROM gameobject_loot_template WHERE entry = 434343;
INSERT INTO `gameobject_loot_template` VALUES 
('434343', '13172', '-100', '0', '1', '1', '0', '0', '0');
UPDATE `gameobject_template` SET `data1` = '434343' WHERE `gameobject_template`.`entry` =176248 LIMIT 1 ;


--
-- Quest-Andenken des Todes funktioniert nun!
--
UPDATE `quest_template` SET `RequiredRaces` = '690' WHERE `quest_template`.`entry` =546 LIMIT 1 ;


--
-- Quest-Gegenangriff ist nun lösbar(nicht blizzlike)!
--
DELETE FROM gameobject WHERE guid = 306335;
INSERT INTO `gameobject` VALUES
(306335, 164690, 1, -248.881, -1883.06, 93.3788, 3.9403, 0, 0, 0.921312, -0.388824, 25, 0, 1);


--
-- Quest-Ein Treffen mit dem Meister [Federn droppen nun]!
--
DELETE FROM creature_loot_template WHERE item = 10450;
INSERT INTO `creature_loot_template` VALUES 
('6377', '10450', '-46,9', '0', '1', '1', '0', '0', '0'),
('6375', '10450', '-42,3', '0', '1', '1', '0', '0', '0'),
('6379', '10450', '-41,1', '0', '1', '1', '0', '0', '0'),
('6380', '10450', '-40,9', '0', '1', '1', '0', '0', '0'),
('6378', '10450', '-40,2', '0', '1', '1', '0', '0', '0'),
('6648', '10450', '-35,1', '0', '1', '1', '0', '0', '0');











