-- ----------------------------------------------------
-- 	MC-Entertainment                               --
--	Databasefix by Baum UPDATE 1.03 [05.04.2010]   --
--	for mc-wow [Lennix]                            --
-- ----------------------------------------------------

-- ----------------------
-- Onyxia's Lair-Pats --
-- ----------------------

-- Onyxia richtig ausrichten!
UPDATE `creature` SET `position_x` =  '-9.1662',
`position_y` = '-209.586',
`position_z` = '-87.5113',
`orientation` = '3.3004' WHERE `creature`.`guid` =47572 LIMIT 1 ;

-- Wachen richtig konfigurieren!
UPDATE `creature_template` SET 
`MovementType` = '2',
`speed_walk` = '1.42',
`InhabitType` = '3' WHERE `creature_template`.`entry` =12129 LIMIT 1 ;

-- Wachen GUID richtig konfigurieren!
UPDATE `creature` SET `currentwaypoint` = '0',
`MovementType` = '2' WHERE `creature`.`guid` =52049 LIMIT 1 ;
UPDATE `creature` SET `MovementType` =  '2' WHERE `creature`.`guid` =52048 LIMIT 1 ;
UPDATE `creature` SET `MovementType` =  '0' WHERE `creature`.`guid` =52053 LIMIT 1 ;
UPDATE `creature` SET `position_x` =  '-197.26',
`position_y` = '-201.79',
`position_z` = '-69.277',
`orientation` = '0.49916' WHERE `creature`.`guid` =52053 LIMIT 1 ;
UPDATE `creature` SET `MovementType` =  '2' WHERE `creature`.`guid` =52047 LIMIT 1 ;

-- Wegepunkte von [52049]
delete from `creature_movement` where id = 52049;
INSERT INTO `creature_movement` VALUES (
'52049', '1', '-32.0391', '-98.3822', '-35.8912', '100', '0', '0', '0', '0', '0', '0', '0', '0', '0.031786', '0', '0'
), (
'52049', '2', '-50.8427', '-98.6335', '-38.6714', '0', '0', '0', '0', '0', '0', '0', '0', '0', '3.12233', '0', '0'
), (
'52049', '3', '-74.9093', '-98.384', '-35.0042', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'
), (
'52049', '4', '-94,7', '-107,3', '-38,66', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'
), (
'52049', '5', '-75,38', '-99,72', '-35,02', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'
), (
'52049', '6', '-50.8427', '-98.6335', '-38.6714', '0', '0', '0', '0', '0', '0', '0', '0', '0', '3.12233', '0', '0'
);

-- Wegepunkte von [52048]
delete from `creature_movement` where id = 52048;
INSERT INTO `creature_movement` VALUES (
'52048', '1', '-85,79', '-214', '-82', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'
), (
'52048', '2', '-97', '-214', '-82', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'
), (
'52048', '3', '-117', '-214', '-72', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'
), (
'52048', '4', '-153', '-212', '-66', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'
),  (
'52048', '5', '-170', '-199', '-66', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'
), (
'52048', '6', '-168', '-174', '-63', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'
), (
'52048', '7', '-163', '-163', '-59', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'
), (
'52048', '8', '-149', '-151', '-53', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'
), (
'52048', '9', '-163', '-163', '-59', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'
), (
'52048', '10', '-168', '-174', '-63', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'
), (
'52048', '11', '-170', '-199', '-66', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'
), (
'52048', '12', '-153', '-212', '-66', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'
), (
'52048', '13', '-117', '-214', '-72', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'
), (
'52048', '14', '-97', '-214', '-82', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'
);

-- Wegepunkte von [52047]
delete from `creature_movement` where id = 52047;
INSERT INTO `creature_movement` VALUES (
'52047', '1', '-100', '-111', '-40', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'
), (
'52047', '2', '-112', '-121', '-48', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'
), (
'52047', '3', '-146', '-149', '-53', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'
), (
'52047', '4', '-112', '-121', '-48', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'
);

-- Überflüssige Mobs löschen
DELETE FROM creature WHERE guid = 48574;
DELETE FROM creature WHERE guid = 48573;
DELETE FROM creature WHERE guid = 48572;
DELETE FROM creature WHERE guid = 48571;
DELETE FROM creature WHERE guid = 52052;
DELETE FROM creature WHERE guid = 52051;
DELETE FROM creature WHERE guid = 52050;

-- -------------------
-- Trade-BUG-NPC's --
-- -------------------

-- Alchemist Stößelbruch handelt wieder!
UPDATE `creature_template` SET `npcflag` = '16391' WHERE `creature_template`.`entry` =5594 LIMIT 1 ;

-- Marin Noggenfogger handelt wieder!
UPDATE `creature_template` SET `npcflag` = '16391' WHERE `creature_template`.`entry` =7564 LIMIT 1 ;

-- Kaya repariert nun auch!
UPDATE `creature_template` SET `npcflag` = '16388' WHERE `creature_template`.`entry` =3322 LIMIT 1 ;

-- --------------------------
-- T0,5 additional Hotfix --
-- --------------------------
delete from `creature_questrelation` where quest = 8960;
INSERT INTO `creature_questrelation` 
VALUES ('16012', '8960');
UPDATE `quest_template` SET `NextQuestId` = '8960',
`NextQuestInChain` = '8960' WHERE `quest_template`.`entry` =9022 LIMIT 1 ;
UPDATE `quest_template` SET `NextQuestId` = '8960',
`NextQuestInChain` = '8960' WHERE `quest_template`.`entry` =9021 LIMIT 1 ;
UPDATE `quest_template` SET `NextQuestId` = '8960',
`NextQuestInChain` = '8960' WHERE `quest_template`.`entry` =9020 LIMIT 1 ;
UPDATE `quest_template` SET `NextQuestId` = '8960',
`NextQuestInChain` = '8960' WHERE `quest_template`.`entry` =9019 LIMIT 1 ;
UPDATE `quest_template` SET `NextQuestId` = '8960',
`NextQuestInChain` = '8960' WHERE `quest_template`.`entry` =9018 LIMIT 1 ;
UPDATE `quest_template` SET `NextQuestId` = '8960',
`NextQuestInChain` = '8960' WHERE `quest_template`.`entry` =9017 LIMIT 1 ;
UPDATE `quest_template` SET `NextQuestId` = '8960',
`NextQuestInChain` = '8960' WHERE `quest_template`.`entry` =9016 LIMIT 1 ;
UPDATE `quest_template` SET `NextQuestId` = '8960',
`NextQuestInChain` = '8960' WHERE `quest_template`.`entry` =8957 LIMIT 1 ;

-- -------------------------
-- Dunkeleisen verhütten --
-- -------------------------
UPDATE `quest_template` SET `RewSpell` = '0',
`RewSpellCast` = '14891' WHERE `quest_template`.`entry` =4083 LIMIT 1 ;

-- ------------------------------------------------------
-- General Drakkisath added nun seine Adds beim Pull! --
-- ------------------------------------------------------
UPDATE `creature_template` SET `faction_A` = '73',
`faction_H` = '73' WHERE `creature_template`.`entry` =10814 LIMIT 1 ;
UPDATE `creature` SET `position_x` =  '30.028',
`position_y` = '-291.72',
`position_z` = '110.94',
`orientation` = '3.095' WHERE `creature`.`guid` =90975 LIMIT 1;


-- ----------------------------------------------
-- Lord Valthalak muss nun beschworen werden! -- 
-- ----------------------------------------------
DELETE FROM npc_vendor WHERE item = 12791;

