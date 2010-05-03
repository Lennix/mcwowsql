------------------------------------------------------
-- 	MC-Entertainment                              --
--	Databasefix by Baum UPDATE 1.00 [28.03.2010]  --
--	for mc-wow [Lennix]                           --
------------------------------------------------------


--
-- Scholomance-Key-Horde-Questreihe 
--

UPDATE `test_world`.`quest_template` SET `PrevQuestId` = '0' WHERE `quest_template`.`entry` =838 LIMIT 1 ;

UPDATE `test_world`.`quest_template` SET `NextQuestInChain` = '5511' WHERE `quest_template`.`entry` =5804 LIMIT 1 ;

UPDATE `test_world`.`creature_questrelation` SET `id` = '11057' WHERE `creature_questrelation`.`id` =10837 AND `creature_questrelation`.`quest` =5511 LIMIT 1 ;


--
-- Scholomance-Key-Allianz-Questreihe
--

UPDATE `test_world`.`quest_template` SET `PrevQuestId` = '0' WHERE `quest_template`.`entry` =5533 LIMIT 1 ;

UPDATE `test_world`.`quest_template` SET `NextQuestInChain` = '5505' WHERE `quest_template`.`entry` =5803 LIMIT 1 ;

UPDATE `test_world`.`creature_questrelation` SET `id` = '11056' WHERE `creature_questrelation`.`id` =10838 AND `creature_questrelation`.`quest` =5505 LIMIT 1 ;


--
-- Thoriumbruderschaft-Rufquest
--

UPDATE `test_world`.`quest_template` SET `RequiredMaxRepFaction`  = '59',
`RequiredMaxRepValue` = '3000' WHERE `quest_template`.`entry` =7736 LIMIT 1 ;

UPDATE `test_world`.`quest_template` SET `RequiredMaxRepFaction`  = '59',
`RequiredMaxRepValue` = '3000' WHERE `quest_template`.`entry` =8241 LIMIT 1 ;

UPDATE `test_world`.`quest_template` SET `RequiredMaxRepFaction`  = '59',
`RequiredMaxRepValue` = '3000' WHERE `quest_template`.`entry` =8242 LIMIT 1 ;

UPDATE `test_world`.`quest_template` SET `RequiredMinRepValue` = '3000',
`RequiredMaxRepValue` = '9000' WHERE `quest_template`.`entry` =7737 LIMIT 1 ;

UPDATE `test_world`.`quest_template` SET `RequiredMinRepFaction`  = '59',
`RequiredMaxRepFaction` = '59' WHERE `quest_template`.`entry` =7737 LIMIT 1 ;


--
-- Quest-Kampf um das Hügelland[532]-Prokl. already destroyed
--

UPDATE `test_world`.`quest_template` SET `ReqCreatureOrGOId3` = '0',
`ReqCreatureOrGOCount3` = '0' WHERE `quest_template`.`entry` =532 LIMIT 1 ;


--
-- Quest-Hyperkondensator-Dingsda[5151]
--

UPDATE `test_world`.`creature_template` SET `faction_A` = '7',
`faction_H` = '7',
`unit_flags` = '512',
`flags_extra` = '0' WHERE `creature_template`.`entry` =10992 LIMIT 1 ;

											
--
-- Quest-Ruf des Wassers[63]
--
DELETE from creature_loot_template where item = 7812;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`) VALUES 
('5897', '7812', '-100', '0', '1', '1');

UPDATE `test_world`.`creature_template` SET `lootid` = '5897' WHERE `creature_template`.`entry` =5897 LIMIT 1 ;

UPDATE `test_world`.`creature_template` SET `unit_flags` = '512' WHERE `creature_template`.`entry` =5897 LIMIT 1 ;


--
-- ONY-PRE-Horde
--

UPDATE `test_world`.`quest_template` SET `QuestFlags` = '8',
`SpecialFlags` = '0' WHERE `quest_template`.`entry` =4941 LIMIT 1 ;

UPDATE `test_world`.`quest_template` SET `ReqCreatureOrGOId1` = '3144',
`ReqCreatureOrGOCount1` = '1' WHERE `quest_template`.`entry` =4941 LIMIT 1 ;


--
-- ONY-PRE-Allianz
--

UPDATE `test_world`.`quest_template` SET `QuestFlags` = '8',
`SpecialFlags` = '0',
`ReqCreatureOrGOId1` = '9023',
`ReqCreatureOrGOCount1` = '1' WHERE `quest_template`.`entry` =4322 LIMIT 1 ;

UPDATE `test_world`.`creature_template` SET `npcflag` = '3' WHERE `creature_template`.`entry` =9023 LIMIT 1 ;

UPDATE `test_world`.`quest_template` SET `QuestFlags` = '8',
`ReqCreatureOrGOId1` = '17804',
`ReqCreatureOrGOCount1` = '1' WHERE `quest_template`.`entry` =6402 LIMIT 1 ;

UPDATE `test_world`.`quest_template` SET `Type` = '81' WHERE `quest_template`.`entry` =6402 LIMIT 1 ;

UPDATE `test_world`.`quest_template` SET `Type` = '81',
`QuestFlags` = '8',
`SpecialFlags` = '0',
`ReqCreatureOrGOId1` = '1748',
`ReqCreatureOrGOCount1` = '1' WHERE `quest_template`.`entry` =6403 LIMIT 1 ;

UPDATE `test_world`.`creature_template` SET `npcflag` = '3' WHERE `creature_template`.`entry` =1748 LIMIT 1 ;

--
-- Somnus spawmen
--

--Muss um den Trauersee geadded werden, falls nicht vorhanden!