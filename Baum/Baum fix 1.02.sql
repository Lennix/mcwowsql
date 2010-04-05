-------------------------------------------------------
-- 	MC-Entertainment                               --
--	Databasefix by Baum UPDATE 1.02 [01.04.2010]   --
--	for mc-wow [Lennix]                            --
-------------------------------------------------------


--
-- T0,5-Questreihe
--

-- Stratholme Timeevent[45min.] muss funktionieren!
-- Quest[8945] kann nun bei "Ysida Harmon" abgegben werden!
UPDATE `quest_template` SET `SpecialFlags` = '0' WHERE `quest_template`.`entry` =8945 LIMIT 1 ;

-- "Anthion Harmon" ist jetzt für alle Spieler sichtbar!
UPDATE `creature_template_addon` SET `auras` = '0' WHERE `creature_template_addon`.`entry` =16016 LIMIT 1 ;

-- Doppelt gespawnten Bodley löschen!
DELETE FROM creature WHERE guid = 298638;

-- Bodley ist jetzt für alle Spieler sichtbar!
UPDATE `creature_template_addon` SET `auras` = '0' WHERE `creature_template_addon`.`entry` =16033 LIMIT 1 ;
UPDATE `creature` SET `position_x` =  '-7542.91',
`position_y` = '-1217.6',
`position_z` = '286.777',
`orientation` = '0.425224' WHERE `creature`.`guid` =94490 LIMIT 1 ;
UPDATE `creature_template` SET `npcflag` = '3' WHERE `creature_template`.`entry` =16033 LIMIT 1 ;

-- Klare Queststruktur herstellen![Teil1]
UPDATE `creature_questrelation` SET `id` = '0' WHERE `creature_questrelation`.`id` =16033 AND `creature_questrelation`.`quest` =8962 LIMIT 1 ;
UPDATE `creature_questrelation` SET `id` = '0' WHERE `creature_questrelation`.`id` =16033 AND `creature_questrelation`.`quest` =8963 LIMIT 1 ;
UPDATE `creature_questrelation` SET `id` = '0' WHERE `creature_questrelation`.`id` =16033 AND `creature_questrelation`.`quest` =8965 LIMIT 1 ;

-- Klare Queststruktur herstellen![Teil2]
UPDATE `creature_questrelation` SET `id` = '0' WHERE `creature_questrelation`.`id` =16033 AND `creature_questrelation`.`quest` =8985 LIMIT 1 ;
UPDATE `creature_questrelation` SET `id` = '0' WHERE `creature_questrelation`.`id` =16033 AND `creature_questrelation`.`quest` =8987 LIMIT 1 ;
UPDATE `creature_questrelation` SET `id` = '0' WHERE `creature_questrelation`.`id` =16033 AND `creature_questrelation`.`quest` =8988 LIMIT 1 ;

-- Fürst der Asche spawmen
INSERT INTO `creature` VALUES(352941, 15206, 1, 0, 0, -6992.23, 1179.82, 9.80489, 3.0293, 900, 5, 0, 52000, 12840, 0, 0);
UPDATE `creature_template` SET `scale` = '3' WHERE `creature_template`.`entry` =15206 LIMIT 1 ;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = '0' WHERE `creature_loot_template`.`entry` =15206 AND `creature_loot_template`.`item` =20514 LIMIT 1 ;



