-- UDW: http://udw.altervista.org/zeroproject/viewtopic.php?f=68&t=512
-- A Lesson to Learn - A 
-- 

UPDATE `quest_template` SET `RequiredRaces` = '8' WHERE `entry` = '27';   
UPDATE `quest_template` SET `RequiredRaces` = '8' WHERE `entry` = '29';   
UPDATE `quest_template` SET `RequiredRaces` = '8' WHERE `entry` = '272';   
UPDATE `quest_template` SET `RequiredRaces` = '8' WHERE `entry` = '5061'; 

-- 1.part 
DELETE FROM `creature_questrelation` WHERE `quest` = 27; 
DELETE FROM `gameobject_questrelation` WHERE `quest` = 27; 
UPDATE `item_template` SET `StartQuest`=0 WHERE `StartQuest` = 27; 
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (4217, 27); 
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` = 4217; 
DELETE FROM `creature_involvedrelation` WHERE `quest` = 27; 
DELETE FROM `gameobject_involvedrelation` WHERE `quest` = 27; 
INSERT INTO `creature_involvedrelation` (`id`, `quest`) VALUES (11802, 27); 
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry`=11802; 
-- 2.part 
DELETE FROM `creature_questrelation` WHERE `quest` = 29; 
DELETE FROM `gameobject_questrelation` WHERE `quest` = 29; 
UPDATE `item_template` SET `StartQuest`=0 WHERE `StartQuest` = 29; 
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (11802, 29); 
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` = 11802; 
DELETE FROM `creature_involvedrelation` WHERE `quest` = 29; 
DELETE FROM `gameobject_involvedrelation` WHERE `quest` = 29; 
INSERT INTO `creature_involvedrelation` (`id`, `quest`) VALUES (11799, 29); 
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry`=11779; 
-- 3.part 
DELETE FROM `creature_questrelation` WHERE `quest` = 272; 
DELETE FROM `gameobject_questrelation` WHERE `quest` = 272; 
UPDATE `item_template` SET `StartQuest`=0 WHERE `StartQuest` = 272; 
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (11799, 272); 
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` = 11799; 
DELETE FROM `creature_involvedrelation` WHERE `quest` = 272; 
DELETE FROM `gameobject_involvedrelation` WHERE `quest` = 272; 
INSERT INTO `creature_involvedrelation` (`id`, `quest`) VALUES (11802, 272); 
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry`=11802; 
-- 4.part 
DELETE FROM `creature_questrelation` WHERE `quest` = 5061; 
DELETE FROM `gameobject_questrelation` WHERE `quest` = 5061; 
UPDATE `item_template` SET `StartQuest`=0 WHERE `StartQuest` = 5061; 
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (11802, 5061); 
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` = 11802; 
DELETE FROM `creature_involvedrelation` WHERE `quest` = 5061; 
DELETE FROM `gameobject_involvedrelation` WHERE `quest` = 5061; 
INSERT INTO `creature_involvedrelation` (`id`, `quest`) VALUES (4217, 5061); 
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry`=4217; 

-- 
-- A Lesson to Learn - H 
-- 

UPDATE `quest_template` SET `RequiredRaces` = '32' WHERE `entry` = '26';   
UPDATE `quest_template` SET `RequiredRaces` = '32' WHERE `entry` = '28';   
UPDATE `quest_template` SET `RequiredRaces` = '32' WHERE `entry` = '30';   
UPDATE `quest_template` SET `RequiredRaces` = '32' WHERE `entry` = '31'; 

-- 1.part 
DELETE FROM `creature_questrelation` WHERE `quest` = 26; 
DELETE FROM `gameobject_questrelation` WHERE `quest` = 26; 
UPDATE `item_template` SET `StartQuest`=0 WHERE `StartQuest` = 26; 
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (3033, 26); 
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` = 3033; 
DELETE FROM `creature_involvedrelation` WHERE `quest` = 26; 
DELETE FROM `gameobject_involvedrelation` WHERE `quest` = 26; 
INSERT INTO `creature_involvedrelation` (`id`, `quest`) VALUES (11802, 26); 
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry`=11802; 
-- 2.part 
DELETE FROM `creature_questrelation` WHERE `quest` = 28; 
DELETE FROM `gameobject_questrelation` WHERE `quest` = 28; 
UPDATE `item_template` SET `StartQuest`=0 WHERE `StartQuest` = 28; 
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (11802, 28); 
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` = 11802; 
DELETE FROM `creature_involvedrelation` WHERE `quest` = 28; 
DELETE FROM `gameobject_involvedrelation` WHERE `quest` = 28; 
INSERT INTO `creature_involvedrelation` (`id`, `quest`) VALUES (11799, 28); 
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry`=11799; 
-- 3.part 
DELETE FROM `creature_questrelation` WHERE `quest` = 30; 
DELETE FROM `gameobject_questrelation` WHERE `quest` = 30; 
UPDATE `item_template` SET `StartQuest`=0 WHERE `StartQuest` = 30; 
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (11799, 30); 
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` = 11799; 
DELETE FROM `creature_involvedrelation` WHERE `quest` = 30; 
DELETE FROM `gameobject_involvedrelation` WHERE `quest` = 30; 
INSERT INTO `creature_involvedrelation` (`id`, `quest`) VALUES (11802, 30); 
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry`=11802; 
-- 4.part 
DELETE FROM `creature_questrelation` WHERE `quest` = 31; 
DELETE FROM `gameobject_questrelation` WHERE `quest` = 31; 
UPDATE `item_template` SET `StartQuest`=0 WHERE `StartQuest` = 31; 
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (11802, 31); 
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` = 11802; 
DELETE FROM `creature_involvedrelation` WHERE `quest` = 31; 
DELETE FROM `gameobject_involvedrelation` WHERE `quest` = 31; 
INSERT INTO `creature_involvedrelation` (`id`, `quest`) VALUES (3033, 31); 
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry`=3033; 

-- QuestChain & prevQ A 
UPDATE `quest_template` SET `NextQuestInChain` = '29' WHERE `entry` = '27'; 
UPDATE `quest_template` SET `PrevQuestId` = '27' WHERE `entry` =29; 

--  QuestChain & prevQ H 
UPDATE `quest_template` SET `NextQuestInChain` = '28' WHERE `entry` = '26'; 
UPDATE `quest_template` SET `PrevQuestId` = '26' WHERE `entry` =28; 