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
DELETE FROM quest_template WHERE entry = 8945;
INSERT INTO `quest_template` VALUES
(8945, 2, 2017, 0, 58, 60, 81, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 8946, 0, 0, 0, 'Dead Man''s Plea', 'I''ll provide you the information you ask for, $N.  But more pressing matters are at hand.$B$BMy beloved wife has been taken prisoner by Rivendare''s undead scum.$B$BI strongly objected to her joining the Argent Dawn''s foolish crusade, yet that''s not of importance anymore.  You must finish what I attempted to do, you must rescue Ysida from the clutches of the Baron!', 'Go into Stratholme and rescue Ysida Harmon from Baron Rivendare.', 'Thank you for rescuing me... I feared for my life. Please accept this as a small token of my gratitude.$B$BAnthion is... no... he can''t be...', 'Tell me, is Ysida alive?', '', 'Ysida Freed', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16031, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 22137, 0, 0, 0, 1, 0, 0, 0, 529, 0, 0, 0, 0, 500, 0, 0, 0, 0, 0, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `test_world`.`creature_template` SET `npcflag` = '3' WHERE `creature_template`.`entry` =16031 LIMIT 1 ;
 

-- "Anthion Harmon" ist jetzt für alle Spieler sichtbar!
UPDATE `test_world`.`creature_template_addon` SET `auras` = '0' WHERE `creature_template_addon`.`entry` =16016 LIMIT 1 ;

-- Doppelt gespawnten Bodley löschen!
DELETE FROM creature WHERE guid = 298638;

-- Bodley ist jetzt für alle Spieler sichtbar!
UPDATE `test_world`.`creature_template_addon` SET `auras` = '0' WHERE `creature_template_addon`.`entry` =16033 LIMIT 1 ;
UPDATE `test_world`.`creature` SET `position_x` =  '-7542.91',
`position_y` = '-1217.6',
`position_z` = '286.777',
`orientation` = '0.425224' WHERE `creature`.`guid` =94490 LIMIT 1 ;
UPDATE `test_world`.`creature_template` SET `npcflag` = '3' WHERE `creature_template`.`entry` =16033 LIMIT 1 ;

-- Klare Queststruktur herstellen![Teil1]
UPDATE `test_world`.`creature_questrelation` SET `id` = '0' WHERE `creature_questrelation`.`id` =16033 AND `creature_questrelation`.`quest` =8962 LIMIT 1 ;
UPDATE `test_world`.`creature_questrelation` SET `id` = '0' WHERE `creature_questrelation`.`id` =16033 AND `creature_questrelation`.`quest` =8963 LIMIT 1 ;
UPDATE `test_world`.`creature_questrelation` SET `id` = '0' WHERE `creature_questrelation`.`id` =16033 AND `creature_questrelation`.`quest` =8965 LIMIT 1 ;

-- Klare Queststruktur herstellen![Teil2]
UPDATE `test_world`.`creature_questrelation` SET `id` = '0' WHERE `creature_questrelation`.`id` =16033 AND `creature_questrelation`.`quest` =8985 LIMIT 1 ;
UPDATE `test_world`.`creature_questrelation` SET `id` = '0' WHERE `creature_questrelation`.`id` =16033 AND `creature_questrelation`.`quest` =8987 LIMIT 1 ;
UPDATE `test_world`.`creature_questrelation` SET `id` = '0' WHERE `creature_questrelation`.`id` =16033 AND `creature_questrelation`.`quest` =8988 LIMIT 1 ;

-- Fürst der Asche spawmen
INSERT INTO `creature` VALUES(352941, 15206, 1, 0, 0, -6992.23, 1179.82, 9.80489, 3.0293, 900, 5, 0, 52000, 12840, 0, 0);
UPDATE `test_world`.`creature_template` SET `scale` = '3' WHERE `creature_template`.`entry` =15206 LIMIT 1 ;
UPDATE `test_world`.`creature_loot_template` SET `ChanceOrQuestChance` = '0' WHERE `creature_loot_template`.`entry` =15206 AND `creature_loot_template`.`item` =20514 LIMIT 1 ;
UPDATE `test_world`.`creature_loot_template` SET `ChanceOrQuestChance` = '0' WHERE `creature_loot_template`.`entry` =15206 AND `creature_loot_template`.`item` =20665 LIMIT 1 ;
UPDATE `test_world`.`creature_loot_template` SET `ChanceOrQuestChance` = '0' WHERE `creature_loot_template`.`entry` =15206 AND `creature_loot_template`.`item` =20666 LIMIT 1 ;
UPDATE `test_world`.`creature_template` SET `mindmg` = '300',
`maxdmg` = '500' WHERE `creature_template`.`entry` =15206 LIMIT 1 ;



