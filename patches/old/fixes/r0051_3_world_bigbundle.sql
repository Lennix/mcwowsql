-- UDW: http://udw.altervista.org/zeroproject/viewtopic.php?f=68&t=431

/* REV 1 */
DELETE FROM `gameobject_template` where `entry` IN (123329, 124371);
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `ScriptName`) VALUES
(123329, 3, 1, 'Baelog''s Chest', 0, 0, 1, 93, 5066, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(124371, 0, 1369, 'Keystone', 0, 32, 1, 0, 359, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'go_keystone_chamber');

DELETE FROM `gameobject_loot_template` where `entry` = 5066;
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES (5066, 7740, 100, 0, 1, 1, 0, 0, 0);

UPDATE `areatrigger_teleport` SET `name`='The Barrens - Wailing Caverns', `target_position_x`='-163.49', `target_position_y`='132.9', `target_position_z`='-73.66', `target_orientation`='5.83' WHERE (`id`='228');

/* REV 2 */
/* Spawns of bosses */
DELETE FROM `creature` WHERE `id` IN (16042, 16080, 16097, 16098, 16101, 16102, 16118);
INSERT INTO `creature` (`id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(16042,229,0,0,25.92,-537.7,110.93,1.519747,86400,0,0,110000,2620,0,0), (16080,229,0,0,-16.05,-451.82,-18.64,3.17777,86400,0,0,47000,36510,0,0),
(16097,429,0,0,263.38,-452.69,-119.96,4.65000,86400,0,0,24000,36510,0,0),(16101,329,0,0,3415.90,-3042.72,136.523,5.342696,86400,0,0,36000,36510,0,0),
(16102,329,0,0,3413.88,-3044.55,136.523,5.358406,86400,0,0,16000,36510,0,0), (16118,289,0,0,-3.82,141.88,83.9,0,86400,0,0,36000,36510,0,0);

/* Non-colision factions for bosses */
UPDATE `creature_template` SET `faction_A` = '28', `faction_H` = '28' WHERE `entry`=16080;
UPDATE `creature_template` SET `faction_A` = '14', `faction_H` = '14' WHERE `entry` IN (16097, 16098, 16101, 16102);
UPDATE `creature_template` SET `faction_A` = '233', `faction_H` = '233' WHERE `entry`=16118;
UPDATE `creature_template` SET `faction_A` = '16', `faction_H` = '16' WHERE `entry` =16066;

/* REV 4 */
UPDATE `creature_template` SET `minhealth` = '1', `maxhealth` = '1' WHERE `entry` = '721';
UPDATE `creature` SET `curhealth` = '1' WHERE `id` = '721';
UPDATE `creature_template` SET `minhealth` = '42', `maxhealth` = '55' WHERE `entry` = '6';
UPDATE `creature_template` SET `npcflag` = '135' WHERE `entry` = '6740';
UPDATE `creature_template` SET `npcflag` =  '19' WHERE `entry` = '5941';

/* REV 5 */
UPDATE creature_template SET `npcflag` = '16388' WHERE `npcflag` IN (132,133,134,135,136) AND creature_template.entry NOT IN (SELECT `id` FROM `creature_involvedrelation`) AND creature_template.entry NOT IN (SELECT `id` FROM `creature_questrelation`) AND `subname` NOT LIKE "Innkeeper";

UPDATE creature_template SET `npcflag` = '16391' WHERE `npcflag` IN (132,133,134,135,136) AND `subname` NOT LIKE "Innkeeper" AND creature_template.entry IN (SELECT `id` FROM `creature_involvedrelation`);

UPDATE creature_template SET `npcflag` = '16391' WHERE `npcflag` IN (132,133,134,135,136) AND `subname` NOT LIKE "Innkeeper" AND creature_template.entry IN (SELECT `id` FROM `creature_questrelation`);

/* REV 6 */
/* Terrordale Spirit */
UPDATE `creature_template` SET  `mindmg` =  '136', `maxdmg` =  '202', `baseattacktime` =  '2000' WHERE `entry` =14564;

/* Fix Q for druid */
UPDATE `quest_template` SET  `RequiredRaces` =  '40' WHERE `entry` =29;

/* Make Q - Junkboxes Needed repeatable */
UPDATE `quest_template` SET `SpecialFlags` = '1' WHERE `entry` = 8249;
 
/* Correct position of Ravenholdt */
UPDATE `creature` SET `position_x` = '19.335829', `position_y` = '-1449.727295', `position_z` = '176.424301', `orientation` = '3.275114' WHERE `id` = 13936;

/* Spawn of Landmark GO*/
DELETE FROM `gameobject` WHERE `id` = 142189;
INSERT INTO `gameobject` (`id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES (142189, 1, -10119.7, -4052.46, 5.33005, -0.366519, 0, 0, 0.182236, -0.983255, 900, 100, 1);

/* Loot for Cuergo's Key*/
UPDATE `creature_template` SET `lootid` = `entry` WHERE `entry` IN (7899, 7901, 7902);
DELETE FROM `creature_loot_template` WHERE `entry` IN (7899, 7901, 7902) AND `item` = 9275;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES
(7899, 9275, -30, 0, 1, 1, 0, 0, 0),
(7901, 9275, -30, 0, 1, 1, 0, 0, 0),
(7902, 9275, -30, 0, 1, 1, 0, 0, 0);

/* REV #7: Defias Raider */
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = 14 WHERE `entry` = 6180;

/* REV #8 */
/* Added missing loot for Discordant Surge */
UPDATE `creature_template` SET `lootid`='13279' WHERE (`entry`='13279');
DELETE FROM `creature_loot_template` WHERE `entry` = 13279;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES ('13279',  '17309',  '-96',  '0',  '1',  '1',  '0',  '0',  '0');

/* Fix use elixir */
UPDATE spell_elixir SET mask = 0;

/* Fixes from TDB forum */
/* Set Item Proc Rate */
UPDATE `item_template` SET `spellppmRate_1`=1.4 WHERE `entry`=13032;

/* remove item 5691 Barrow Key from creature_loot_template */
DELETE FROM creature_loot_template WHERE item=5691;

/* set shorter spawntime on book of ur in SFK */
UPDATE `gameobject` SET `spawntimesecs`=5 WHERE `guid`=40667;

/* set proper lootid for Grenka Bloodscreech */
UPDATE `creature_template` SET `lootid`=4490 WHERE `entry`=4490;
DELETE FROM creature_loot_template WHERE entry = 4490;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES
('4490','422','0.34','0','1','1','0','0','0'),
('4490','858','0.06','0','1','1','0','0','0'),
('4490','929','1.1524','0','1','1','0','0','0'),
('4490','1205','1.7926','0','1','1','0','0','0'),
('4490','1478','0.24','0','1','1','0','0','0'),
('4490','1529','0.12','0','1','1','0','0','0'),
('4490','1705','0.06','0','1','1','0','0','0'),
('4490','1711','0.3','0','1','1','0','0','0'),
('4490','1712','0.52','0','1','1','0','0','0'),
('4490','1725','0.06','0','1','1','0','0','0'),
('4490','2290','0.24','0','1','1','0','0','0'),
('4490','2592','8.9629','0','1','2','0','0','0'),
('4490','2772','0.02','0','1','1','0','0','0'),
('4490','2838','0.12','0','1','1','0','0','0'),
('4490','2997','0.06','0','1','1','0','0','0'),
('4490','3357','0.12','0','1','1','0','0','0'),
('4490','3385','1.1524','0','1','1','0','0','0'),
('4490','3770','5.3777','0','1','1','0','0','0'),
('4490','3864','0.06','0','1','1','0','0','0'),
('4490','3871','0.06','0','1','1','0','0','0'),
('4490','4306','16.9014','0','1','2','0','0','0'),
('4490','4538','0.12','0','1','1','0','0','0'),
('4490','4542','0.06','0','1','1','0','0','0'),
('4490','4606','0.06','0','1','1','0','0','0'),
('4490','4634','0.2561','0','1','1','0','0','0'),
('4490','5116','2.5608','0','1','1','0','0','0'),
('4490','5117','16.9014','0','1','1','0','0','0'),
('4490','5635','3.9693','0','1','1','0','0','0'),
('4490','5636','1.2804','0','1','1','0','0','0'),
('4490','5843','-100','0','1','1','0','0','0'),
('4490','7363','0.06','0','1','1','0','0','0'),
('4490','24047','5','1','-24047','1','0','0','0'),
('4490','24048','1','1','-24048','1','0','0','0'),
('4490','24049','0.5','1','-24049','1','0','0','0'),
('4490','24050','1','1','-24050','1','0','0','0'),
('4490','24052','1','1','-24052','1','0','0','0'),
('4490','24058','5','1','-24058','1','0','0','0');

/* set proper lootid for Frostmaw */
UPDATE `creature_template` SET `lootid` = 4504 WHERE `entry` = 4504;
DELETE FROM creature_loot_template WHERE entry = 4504;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES
('4504','1477','0.5','0','1','1','0','0','0'),
('4504','1705','0.02','0','1','1','0','0','0'),
('4504','1708','2.5921','0','1','1','0','0','0'),
('4504','1710','1.6371','0','1','1','0','0','0'),
('4504','1725','0.02','0','1','1','0','0','0'),
('4504','2289','0.38','0','1','1','0','0','0'),
('4504','2772','0.12','0','1','1','0','0','0'),
('4504','2838','0.06','0','1','1','0','0','0'),
('4504','3385','0.8186','0','1','1','0','0','0'),
('4504','3720','-80','0','1','1','0','0','0'),
('4504','3771','4.3656','0','1','1','0','0','0'),
('4504','3819','0.06','0','1','1','0','0','0'),
('4504','3864','0.2729','0','1','1','0','0','0'),
('4504','3870','0.1','0','1','1','0','0','0'),
('4504','3873','0.02','0','1','1','0','0','0'),
('4504','3874','0.06','0','1','1','0','0','0'),
('4504','4353','0.06','0','1','1','0','0','0'),
('4504','4417','0.1','0','1','1','0','0','0'),
('4504','4421','0.16','0','1','1','0','0','0'),
('4504','4424','0.22','0','1','1','0','0','0'),
('4504','4614','0.06','0','1','1','0','0','0'),
('4504','4636','0.32','0','1','1','0','0','0'),
('4504','5637','2.7285','0','1','1','0','0','0'),
('4504','5811','-100','0','1','1','0','0','0'),
('4504','7084','0.06','0','1','1','0','0','0'),
('4504','7450','0.06','0','1','1','0','0','0'),
('4504','7909','0.1364','0','1','1','0','0','0'),
('4504','8146','0.8186','0','1','1','0','0','0'),
('4504','10601','0.06','0','1','1','0','0','0'),
('4504','24037','1','1','-24037','1','0','0','0'),
('4504','24038','0.5','1','-24038','1','0','0','0'),
('4504','24047','5','1','-24047','1','0','0','0'),
('4504','24052','1','1','-24052','1','0','0','0'),
('4504','24054','1','1','-24054','1','0','0','0'),
('4504','24055','0.5','1','-24055','1','0','0','0'),
('4504','24056','1','1','-24056','1','0','0','0'),
('4504','24057','0.5','1','-24057','1','0','0','0'),
('4504','24058','5','1','-24058','1','0','0','0');

/* set proper lootid for Ishamuhale */
UPDATE `creature_template` SET `lootid`=3257 WHERE `entry`=3257;
DELETE FROM creature_loot_template WHERE entry = 3257;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES
('3257','818','0.36','0','1','1','0','0','0'),
('3257','856','0.75','0','1','1','0','0','0'),
('3257','1206','0.1','0','1','1','0','0','0'),
('3257','1210','0.28','0','1','1','0','0','0'),
('3257','2406','0.02','0','1','1','0','0','0'),
('3257','2409','0.04','0','1','1','0','0','0'),
('3257','2447','0.02','0','1','1','0','0','0'),
('3257','2450','0.02','0','1','1','0','0','0'),
('3257','2452','0.02','0','1','1','0','0','0'),
('3257','2657','0.02','0','1','1','0','0','0'),
('3257','3180','9.3539','0','1','1','0','0','0'),
('3257','3393','0.02','0','1','1','0','0','0'),
('3257','3610','0.02','0','1','1','0','0','0'),
('3257','4293','0.04','0','1','1','0','0','0'),
('3257','4345','0.02','0','1','1','0','0','0'),
('3257','5055','-80','0','1','1','0','0','0'),
('3257','5062','-100','0','1','1','0','0','0'),
('3257','5101','-100','0','1','1','0','0','0'),
('3257','5124','34.4262','0','1','1','0','0','0'),
('3257','5503','0.12','0','1','1','0','0','0'),
('3257','5573','0.02','0','1','1','0','0','0'),
('3257','5574','0.02','0','1','1','0','0','0'),
('3257','5635','3.1823','0','1','1','0','0','0'),
('3257','5972','0.02','0','1','1','0','0','0'),
('3257','6271','0.04','0','1','1','0','0','0'),
('3257','6344','0.04','0','1','1','0','0','0'),
('3257','6347','0.02','0','1','1','0','0','0'),
('3257','6348','0.02','0','1','1','0','0','0'),
('3257','6661','0.18','0','1','1','0','0','0'),
('3257','6663','0.04','0','1','1','0','0','0'),
('3257','6716','0.02','0','1','1','0','0','0'),
('3257','7288','0.02','0','1','1','0','0','0'),
('3257','11039','0.02','0','1','1','0','0','0'),
('3257','14169','0.0964','0','1','1','0','0','0'),
('3257','14368','0.02','0','1','1','0','0','0'),
('3257','14728','0.06','0','1','1','0','0','0'),
('3257','15019','0.06','0','1','1','0','0','0'),
('3257','15496','0.02','0','1','1','0','0','0'),
('3257','24060','1','1','-24060','1','0','0','0'),
('3257','24062','1','1','-24062','1','0','0','0'),
('3257','24064','1','1','-24064','1','0','0','0'),
('3257','24077','1','1','-24077','1','0','0','0'),
('3257','24078','1','1','-24078','1','0','0','0');

/* set proper lootid for Echeyakee */
UPDATE `creature_template` SET `lootid`=3475 WHERE `entry`=3475;
DELETE FROM creature_loot_template WHERE entry = 3475;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES
('3475','765','0.06','0','1','1','0','0','0'),
('3475','818','0.18','0','1','1','0','0','0'),
('3475','856','0.0714','0','1','1','0','0','0'),
('3475','1206','0.16','0','1','1','0','0','0'),
('3475','1210','0.34','0','1','1','0','0','0'),
('3475','2409','0.04','0','1','1','0','0','0'),
('3475','2553','0.02','0','1','1','0','0','0'),
('3475','2657','0.02','0','1','1','0','0','0'),
('3475','2771','0.04','0','1','1','0','0','0'),
('3475','2836','0.02','0','1','1','0','0','0'),
('3475','3311','0.0714','0','1','1','0','0','0'),
('3475','3394','0.02','0','1','1','0','0','0'),
('3475','3610','0.02','0','1','1','0','0','0'),
('3475','3731','26.0714','0','1','1','0','0','0'),
('3475','4293','0.02','0','1','1','0','0','0'),
('3475','4345','0.02','0','1','1','0','0','0'),
('3475','4346','0.04','0','1','1','0','0','0'),
('3475','4408','0.02','0','1','1','0','0','0'),
('3475','4409','0.06','0','1','1','0','0','0'),
('3475','5100','-100','0','1','1','9','881','0'),
('3475','5134','4.7143','0','1','1','0','0','0'),
('3475','5135','21.7143','0','1','1','0','0','0'),
('3475','5503','0.04','0','1','1','0','0','0'),
('3475','5573','0.02','0','1','1','0','0','0'),
('3475','5574','0.02','0','1','1','0','0','0'),
('3475','5635','2.0714','0','1','1','0','0','0'),
('3475','6344','0.02','0','1','1','0','0','0'),
('3475','6347','0.04','0','1','1','0','0','0'),
('3475','6348','0.02','0','1','1','0','0','0');

/* set proper lootid for Arikara */
UPDATE `creature_template` SET `lootid`=10882 WHERE `entry`=10882;
DELETE FROM creature_loot_template WHERE entry = 10882;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES
('10882','804','0.04','0','1','1','0','0','0'),
('10882','929','0.04','0','1','1','0','0','0'),
('10882','1206','0.02','0','1','1','0','0','0'),
('10882','1529','0.06','0','1','1','0','0','0'),
('10882','1705','0.202','0','1','1','0','0','0'),
('10882','3393','0.04','0','1','1','0','0','0'),
('10882','3870','0.04','0','1','1','0','0','0'),
('10882','4350','0.04','0','1','1','0','0','0'),
('10882','4633','0.101','0','1','1','0','0','0'),
('10882','5374','0.04','0','1','1','0','0','0'),
('10882','5636','1.1111','0','1','1','0','0','0'),
('10882','6444','12.6263','0','1','1','0','0','0'),
('10882','6826','19.596','0','1','1','0','0','0'),
('10882','11165','0.04','0','1','1','0','0','0'),
('10882','12925','-100','0','1','1','0','0','0'),
('10882','17056','26.2626','0','1','1','0','0','0'),
('10882','24048','1','1','-24048','1','0','0','0'),
('10882','24066','0.5','1','-24066','1','0','0','0'),
('10882','24067','0.5','1','-24067','1','0','0','0'),
('10882','24068','1','1','-24068','1','0','0','0');

/* set proper hp for Deviate Lasher */
UPDATE `creature_template` SET `minhealth` = '135', `maxhealth` = '140' WHERE `entry` =5055;

/* delete item 1081 from loot template of creature 3632 */
DELETE FROM `creature_loot_template` WHERE `entry` = 3632 AND `item` = 1081;

/* fix for Q409 */
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) VALUES('410','5','10','1946','180000','0','2468.28','15.26','23.89','0.37');

/* Karus (Banker) */
UPDATE `creature_template` SET `npcflag`='259' WHERE (`entry`='3309');

/* fixed some models */
UPDATE `creature` SET `modelid`='7604' WHERE (`guid`='35907');
UPDATE `creature` SET `modelid`='7916' WHERE (`guid`='1791');
UPDATE `creature` SET `modelid`='15352' WHERE (`guid`='6492');
UPDATE `creature` SET `modelid`='612' WHERE (`guid`='5086');
UPDATE `creature` SET `modelid`='3016' WHERE (`id`='5057');
UPDATE `creature` SET `modelid`='4225' WHERE (`id`='3727');
UPDATE `creature` SET `modelid`='14378' WHERE (`id`='14327');
UPDATE `creature` SET `modelid`='9149' WHERE (`id`='9836');
UPDATE `creature` SET `modelid`='13150' WHERE (`id`='13085');
UPDATE `creature` SET `modelid`='11660' WHERE (`guid`='29113');
UPDATE `creature` SET `modelid`='2352' WHERE (`guid`='18714');
UPDATE `creature` SET `modelid`='11650' WHERE (`guid`='34160');
UPDATE `creature` SET `modelid`='11650' WHERE (`guid`='31846');
UPDATE `creature` SET `modelid`='11650' WHERE (`id`='11198');
UPDATE `creature` SET `modelid`='1643' WHERE (`id`='3730');
UPDATE `creature` SET `modelid`='11669' WHERE (`guid`='35883');
UPDATE `creature` SET `modelid`='11668' WHERE (`guid`='53738');
UPDATE `creature` SET `modelid`='11672' WHERE (`guid`='35887');
UPDATE `creature` SET `modelid`='11394' WHERE (`guid`='45431');
UPDATE `creature` SET `modelid`='4731' WHERE (`guid`='72002');
UPDATE `creature` SET `modelid`='4494' WHERE (`guid`='31845');
UPDATE `creature` SET `modelid`='10199' WHERE (`guid`='42317');
UPDATE `creature` SET `modelid`='4691' WHERE (`guid`='37087');
UPDATE `creature` SET `modelid`='3293' WHERE (`guid`='90463');
UPDATE `creature` SET `modelid`='4731' WHERE (`guid`='10500');
UPDATE `creature` SET `modelid`='9754' WHERE (`guid`='53739');
UPDATE `creature` SET `modelid`='11671' WHERE (`guid`='53175');

/* duplicite mailbox deleted */
DELETE FROM `gameobject` WHERE (`guid`='73034');

/* REV 10 */
/* Graveyard for Blackrock Depths */ 
DELETE FROM game_graveyard_zone WHERE id = 636 AND ghost_zone = 1584;  
INSERT INTO game_graveyard_zone VALUES (636, 1584, 0);

/* fixing loot of Silithid Mound */  
DELETE from gameobject_loot_template where entry=2620 and item>5058;  
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance` = -100, `mincountOrRef` = 2 WHERE (`entry`=2620) AND (`item`=5058);

/* spawning Kalin Windflight */  
DELETE FROM `creature` WHERE `id`=7772;  
INSERT INTO creature VALUES (104265,7772,1,0,0,-3285.62,2004.17,245.867,2.53433,900,0,0,3857,0,0,0);

/* "Battle of Darrowshire" quest chain fix */ 
UPDATE quest_template SET NextQuestId = 5210, ExclusiveGroup = 0 WHERE entry = 5154;  
UPDATE quest_template SET PrevQuestId = 5210, ExclusiveGroup = -5181 WHERE entry = 5168;  
UPDATE quest_template SET NextQuestId = 5206, ExclusiveGroup = -5181 WHERE entry = 5181;

/* Quest Therylune's Escape */ 
UPDATE `quest_start_scripts` SET dataint ='2000000017' where `id`=945 and `delay`=0;  
UPDATE `quest_start_scripts` SET dataint ='2000000018' where `id`=945 and `delay`=92;

/* delete skeleton 6412 it is a summoned creature */ 
DELETE FROM creature WHERE id=6412;  
DELETE FROM creature_addon WHERE guid in (9629,9630,9740,9741,9742,9743,9777,10547,10548,10739,10757,10764,10767,10784,10815,10816,10817,10818,10823,11161);

/* typo Vultros loot */
UPDATE `creature_loot_template` SET `item`=5114 WHERE `entry`=462 AND `item`=5514;

/* The Defias Brotherhood */
DELETE FROM quest_end_scripts WHERE id=166;  
INSERT INTO quest_end_scripts VALUES  (166, 1, 0, 2, 0, 2000000028, 0, 0, 0, 0);  
DELETE FROM db_script_string WHERE entry=2000000028;  
INSERT INTO db_script_string VALUES  (2000000028, 'The People of Westfall salute $N, a brave and valiant defender of freedom.', NULL, NULL, NULL, NULL, 

NULL, NULL, NULL, NULL);
UPDATE quest_template SET CompleteScript = 166 WHERE entry = 166;

/* REV 11 */
/* Flag fix */
UPDATE creature_template SET npcflag = 2049 WHERE entry IN (347, 857, 907, 2302, 2804, 3890, 5118, 7410, 7427, 10360, 12197, 12198, 14942, 14981, 14982, 15006, 15007, 15008);
UPDATE creature_template SET npcflag = 11 WHERE entry IN (352, 523, 931, 1233, 1387, 1571, 1572, 1573, 2226, 2299, 2389, 2409, 2432, 2835, 2851, 2858, 2859, 2861, 2941, 2995, 3305, 3310, 3615, 3838, 3841, 4267, 4312, 4314, 4317, 4319, 4321, 4407, 4551, 6026, 6706, 6726, 7823, 7824, 8018, 8019, 8020, 8609, 8610, 10378, 10897, 11138, 11139, 11899, 11900, 11901, 12577, 12578, 12596, 12616, 12617, 12636, 12740, 13177, 14242, 15177, 15178, 10583, 16227);
UPDATE creature_template SET npcflag = 135 WHERE entry IN (295, 1247, 1464, 2352, 2388, 3934, 5111, 5688, 5814, 6272, 6727, 6734, 6735, 6736, 6737, 6738, 6739, 6740, 6741, 6746, 6747, 6790, 6791, 6807, 6928, 6929, 6930, 7714, 7731, 7733, 7736, 7737, 7744, 8931, 8999, 9356, 9501, 11103, 11106, 11116, 11118, 12196, 14731, 15174, 15309, 16458);
UPDATE creature_template SET npcflag = 1536 WHERE entry IN (3370, 4161, 4613, 4974, 5054, 5130);
UPDATE creature_template SET npcflag = 1029 WHERE entry IN (5049, 5052, 5188, 5189, 5190, 5191, 5193);

/* REV 13 */
/* Twilight Aquamancer */
UPDATE `creature_ai_scripts` SET `event_param1` = '180000', `event_param2` = '180000' WHERE `id` =481102 ;

/* REV 14 */
/* Some Q fix */ 
UPDATE quest_template SET RequestItemsText = 'Your continued defense of the children of Kalimdor has been acknowledged. Hand me your signet ring so that I may enhance its powers.' WHERE entry = 8748;  
UPDATE quest_template SET RequestItemsText = 'You honor my kind, $N. Strike down the enemies of Kalimdor! Show them what it means to deface the land of eternal starlight.$b$bYou have earned another enhancement. Hand me your signet ring so that I may bolster its power.' WHERE entry = 8749;  
UPDATE quest_template SET RequestItemsText = 'Dedication of this magnitude is a rarity. You have shown that your will is unfaltering, $N. You shall be greatly rewarded for your stalwart watch over our world.$b$bHand me your signet ring so that I may strengthen its enchantment.' WHERE entry = 8750;   
UPDATE quest_template SET RequestItemsText = 'Your continued defense of the children of Kalimdor has been acknowledged. Hand me your signet ring so that I may enhance its powers.' WHERE entry = 8753;  
UPDATE quest_template SET RequestItemsText = 'You honor my kind, $N. Strike down the enemies of Kalimdor! Show them what it means to deface the land of eternal starlight.$b$bYou have earned another enhancement. Hand me your signet ring so that I may bolster its power.' WHERE entry = 8754;  
UPDATE quest_template SET RequestItemsText = 'Dedication of this magnitude is a rarity. You have shown that your will is unfaltering, $N. You shall be greatly rewarded for your stalwart watch over our world.$b$bHand me your signet ring so that I may strengthen its enchantment.' WHERE entry = 8755;   
UPDATE quest_template SET RequestItemsText = 'Your continued defense of the children of Kalimdor has been acknowledged. Hand me your signet ring so that I may enhance its powers.' WHERE entry = 8758;  
UPDATE quest_template SET RequestItemsText = 'You honor my kind, $N. Strike down the enemies of Kalimdor! Show them what it means to deface the land of eternal starlight.$b$bYou have earned another enhancement. Hand me your signet ring so that I may bolster its power.' WHERE entry = 8759;  
UPDATE quest_template SET RequestItemsText = 'Dedication of this magnitude is a rarity. You have shown that your will is unfaltering, $N. You shall be greatly rewarded for your stalwart watch over our world.$b$bHand me your signet ring so that I may strengthen its enchantment.' WHERE entry = 8760;

/* REV #15: Screecher Spirit */
UPDATE `creature_template` SET `npcflag` = 1 WHERE `entry` = 8612;

/* REV 16 */
/* Fixed stealth NPC */
UPDATE `creature_ai_scripts` SET  `action1_param1` =  '6920' WHERE `id` =94701;
DELETE FROM `creature_ai_scripts` WHERE `id` = '345702';
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES ('345702', '3457', '1', '0', '100', '0', '1000', '1000', '0', '0', '11', '6920', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Razormane Stalker - Cast Stealth on Spawn');
UPDATE `creature_template` SET `flags_extra` = '0' WHERE `entry` =947;

/* REV 17 */
/* Quest Escape Through Force script fix */ 
DELETE FROM quest_start_scripts WHERE id=994 AND delay=130;  
INSERT INTO quest_start_scripts (id, delay, command, datalong, datalong2, dataint, X, Y, z, o) VALUES (994, 130, 7, 

994, 15, 0, 0, 0, 0, 0);  
/* Quest Escape Through Stealth script fix */ 
DELETE FROM quest_start_scripts WHERE id=995 AND delay=15;    
INSERT INTO quest_start_scripts (id, delay, command, datalong, datalong2, dataint, X, Y, z, o) VALUES (995, 15, 7, 

995, 15, 0, 0, 0, 0, 0);  
/* Quest Therylune's Escape script fix */ 
DELETE FROM quest_start_scripts WHERE id=945 AND delay=93;    
INSERT INTO quest_start_scripts (id, delay, command, datalong, datalong2, dataint, X, Y, z, o) VALUES (945, 93, 7, 

945, 15, 0, 0, 0, 0, 0);

/* REV 18 */
/* Fixed objects with flags 4 */
UPDATE `gameobject_template` SET `data1`='900' WHERE `entry` IN (4072, 61936, 61935);
UPDATE `gameobject_template` SET `flags`='0' WHERE (`entry`='181629');
UPDATE `gameobject_template` SET `data1`='1022' WHERE (`entry`='19027');
UPDATE `gameobject_template` SET `data1`='5165' WHERE `entry` IN (176158, 176159, 176160, 176161);
UPDATE `gameobject_template` SET `data1`='6381' WHERE (`entry`='177929');
UPDATE `gameobject_template` SET `data1`='498' WHERE (`entry`='1721');
UPDATE `gameobject_template` SET `data1`='1140' WHERE (`entry`='20352');

/* REV 19 */
/* Beaten corpse fix */
UPDATE `creature_template` SET `minhealth` = '356', `maxhealth` = '356', `npcflag` = '1', `dynamicflags` = '32' 

WHERE `entry` =10668;

/* REV 20 */
/* Quest 9433 Fix */
UPDATE `creature_template` SET `spell2`=29992 WHERE `entry`=17178;

/* Quest 117 Fix */
UPDATE `creature_template` SET `npcflag`=3 WHERE `entry`=239;

/* Quest 5650, 5648, 5624, 5625, 5621, 9586 Fix */
UPDATE `creature_template` SET `unit_flags`= 4096 WHERE `entry` IN (12429, 12430, 12427, 12423, 12428, 17551);
UPDATE `quest_template` SET `SpecialFlags`= 2 WHERE `entry` IN (5650, 5648, 5624, 5625, 5621, 9586);
UPDATE `quest_template` SET `ReqItemId1` = '0', `ReqCreatureOrGOId1` = '14467', `ReqCreatureOrGOCount1` = '1', `ReqSpellCast1` = '23054' WHERE `entry` = 7603;

/* Fix Elder Mottled Boar */
UPDATE `creature_template_addon` SET `bytes1`=0, `bytes2`=4097 WHERE `entry`=3100;
DELETE FROM `creature_addon` WHERE `guid` IN (SELECT `guid` FROM `creature` WHERE `id`=3100);
UPDATE `creature` SET `modelid` = 193, `spawntimesecs` = 300 WHERE `guid` IN (21020, 21022, 21024, 21026, 21034, 

21036);

/* Disenchant Stuff */
/* Disenchant Req Skill */
UPDATE `item_template` SET `RequiredDisenchantSkill` = 0 WHERE `entry` IN (4116, 7748, 9602, 13254, 16165, 18970, 19879, 20487, 20488, 21587, 3034, 7027, 12772);
UPDATE `item_template` SET `RequiredDisenchantSkill` = 1 WHERE `entry` IN (727, 816, 820, 821, 826, 827, 832, 899, 1009, 1190, 1211, 1214, 1219, 1220, 1270, 1287, 1300, 1302, 1303, 1304, 1306, 1310, 1314, 1355, 1387, 1391, 1394, 1405, 1436, 1440, 1446, 1448, 1460, 1469, 1473, 1480, 1539, 1557, 1561, 1566, 1832, 1893, 1917, 1925, 1926, 1927, 1928, 1929, 1930, 1933, 1934, 1936, 1943, 1944, 1945, 1951, 1958, 1959, 2020, 2036, 2037, 2073, 2074, 2075, 2078, 2079, 2087, 2088, 2089, 2140, 2166, 2167, 2203, 2204, 2218, 2235, 2241, 2254, 2265, 2266, 2267, 2274, 2281, 2283, 2284, 2300, 2308, 2309, 2312, 2317, 2572, 2578, 2583, 2632, 2694, 2817, 2818, 2821, 2822, 2823, 2864, 2899, 2903, 2904, 2907, 2908, 2957, 2958, 2961, 2962, 2965, 2966, 2969, 2970, 2973, 2974, 2976, 2977, 2978, 2980, 2982, 2983, 2984, 2986, 2987, 2988, 2992, 3000, 3019, 3036, 3040, 3079, 3103, 3154, 3160, 3161, 3166, 3184, 3188, 3192, 3195, 3196, 3205, 3211, 3217, 3223, 3235, 3282, 3283, 3287, 3288, 3291, 3292, 3302, 3305, 3306, 3307, 3308, 3309, 3310, 3313, 3314, 3315, 3330, 3344, 3440, 3446, 3449, 3450, 3451, 3457, 3458, 3471, 3473, 3474, 3487, 3488, 3489, 3511, 3563, 3565, 3567, 3570, 3572, 3578, 3581, 3582, 3586, 3645, 3651, 3652, 3653, 3654, 3848, 3902, 4242, 4243, 4244, 4290, 4303, 4309, 4310, 4312, 4313, 4362, 4368, 4434, 4437, 4561, 4562, 4564, 4566, 4567, 4569, 4570, 4571, 4575, 4577, 4660, 4676, 4695, 4697, 4699, 4701, 4765, 4766, 4767, 4768, 4771, 4777, 4778, 4781, 4782, 4786, 4788, 4789, 4861, 4909, 4939, 4947, 4948, 4964, 4971, 4974, 5069, 5071, 5111, 5112, 5182, 5207, 5212, 5241, 5242, 5275, 5279, 5299, 5302, 5306, 5309, 5310, 5312, 5314, 5315, 5318, 5320, 5321, 5324, 5325, 5326, 5327, 5328, 5337, 5340, 5341, 5343, 5344, 5345, 5346, 5351, 5420, 5422, 5459, 5542, 5587, 5604, 5610, 5611, 5615, 5617, 5626, 5627, 5629, 5630, 5744, 5757, 5780, 5781, 5944, 5967, 6084, 6085, 6092, 6094, 6179, 6180, 6186, 6187, 6188, 6195, 6205, 6215, 6238, 6239, 6240, 6241, 6242, 6263, 6266, 6267, 6268, 6269, 6336, 6337, 6378, 6379, 6380, 6466, 6477, 6480, 6511, 6512, 6527, 6528, 6531, 6536, 6537, 6538, 6539, 6540, 6541, 6542, 6543, 6545, 6546, 6547, 6548, 6550, 6551, 6552, 6553, 6554, 6556, 6557, 6558, 6559, 6560, 6563, 6575, 6585, 6659, 6709, 6731, 6966, 6967, 6968, 6969, 6970, 6978, 6979, 6980, 6981, 6982, 6983, 6984, 6985, 7108, 7115, 7116, 7117, 7118, 7120, 7229, 7280, 7282, 7283, 7298, 7326, 7327, 7328, 7329, 7507, 7508, 7509, 7510, 7554, 7559, 7738, 7739, 8178, 8180, 8350, 9513, 9514, 9598, 9599, 9603, 9747, 9748, 9749, 9753, 9756, 9757, 9763, 9764, 9765, 9770, 9775, 9776, 9777, 9778, 9779, 9780, 9783, 9784, 9785, 9786, 9787, 9788, 9789, 9790, 10400, 10401, 10402, 10549, 10553, 10554, 10637, 10638, 10820, 10821, 10919, 11303, 11304, 11853, 11854, 11855, 11936, 11965, 11981, 12295, 12296, 12522, 14025, 14090, 14091, 14094, 14096, 14097, 14109, 14113, 14114, 14117, 14119, 14120, 14121, 14122, 14123, 14124, 14129, 14131, 14160, 14161, 14166, 14167, 14168, 14173, 14174, 14364, 14365, 14366, 14367, 14370, 14559, 14560, 14561, 14563, 14564, 14722, 14723, 14724, 14725, 14726, 14727, 14729, 14745, 15009, 15010, 15011, 15012, 15014, 15016, 15017, 15018, 15110, 15112, 15114, 15202, 15203, 15204, 15205, 15206, 15207, 15210, 15222, 15248, 15268, 15298, 15303, 15304, 15305, 15306, 15307, 15308,15309, 15310, 15312, 15335, 15396, 15397, 15399, 15403, 15404, 15405, 15406, 15424, 15443, 15444, 15445, 15449, 15450, 15451, 15452, 15453, 15477, 15479, 15485, 15486, 15487, 15489, 15491, 15492, 15493, 15494, 15495, 15497, 15498, 15499, 15501, 15502, 15507, 15508, 15510, 15866, 15925, 15926, 15932, 15933, 15944, 15945, 15969, 15970, 15971, 16604, 16605, 16606, 16607, 16608, 16981, 17922, 18957, 20575);
UPDATE `item_template` SET `RequiredDisenchantSkill` = 25 WHERE `entry` IN (789, 790, 872, 880, 885, 890, 892, 911, 920, 935, 1076, 1121, 1131, 1156, 1172, 1215, 1218, 1273, 1275, 1292, 1296, 1299, 1317, 1318, 1319, 1406, 1449, 1455, 1457, 1458, 1459, 1461, 1462, 1481, 1482, 1483, 1484, 1486, 1489, 1491, 1560, 1935, 1937, 1938, 1974, 2021, 2033, 2034, 2035, 2041, 2042, 2046, 2059, 2168, 2169, 2175, 2194, 2205, 2230, 2232, 2236, 2256, 2263, 2271, 2292, 2567, 2585, 2807, 2865, 2868, 2879, 2910, 2911, 2949, 2950, 2981, 2985, 2989, 2990, 2991, 3018, 3021, 3022, 3039, 3057, 3058, 3065, 3066, 3074, 3076, 3193, 3194, 3198, 3199, 3202, 3227, 3229, 3231, 3400, 3413, 3415, 3429, 3431, 3452, 3461, 3462, 3481, 3490, 3491, 3555, 3558, 3559, 3571, 3585, 3647, 3655, 3733, 3739, 3740, 3741, 3752, 4249, 4250, 4311, 4316, 4317, 4320, 4331, 4369, 4372, 4373, 4436, 4439, 4444, 4445, 4568, 4576, 4706, 4708, 4709, 4710, 4785, 4790, 4792, 4793, 4794, 4795, 4796, 4797, 4798, 4799, 4800, 4816, 4817, 4818, 4820, 4821, 4822, 4949, 4998, 5183, 5187, 5191, 5192, 5193, 5194, 5195, 5196, 5197, 5198, 5199, 5200, 5201, 5202, 5240, 5243, 5252, 5254, 5311, 5313, 5316, 5317, 5323, 5404, 5423, 5425, 5426, 5443, 5444, 5540, 5609, 5613, 5622, 5749, 5750, 5751, 5812, 5943, 5958, 5961, 5969, 5970, 5975, 6087, 6095, 6191, 6197, 6199, 6226, 6264, 6323, 6332, 6333, 6341, 6360, 6381, 6382, 6383, 6447, 6448, 6449, 6459, 6460, 6465, 6467, 6468, 6469, 6472, 6473, 6481, 6482, 6502, 6503, 6504, 6505, 6561, 6562, 6564, 6565, 6567, 6568, 6569, 6570, 6571, 6572, 6573, 6574, 6576, 6577, 6578, 6580, 6581, 6582, 6583, 6584, 6586, 6587, 6628, 6629, 6630, 6631, 6632, 6633, 6642, 6666, 6669, 6721, 6743, 6898, 6907, 6908, 6998, 7000, 7230, 7284, 7285, 7336, 7348, 7506, 7558, 7606, 7607, 7608, 8071, 9607, 9766, 9767, 9768, 9771, 9781, 9782, 9792, 9793, 9794, 9801, 9805, 9810, 9811, 9812, 9813, 9814, 9815, 9816, 9818, 10048, 10399, 10403, 10410, 10411, 10412, 10413, 10658, 11967, 11982, 11993, 11994, 12006, 12007, 12052, 12053, 12054, 12975, 12976, 12977, 12978, 12979, 12982, 12983, 12984, 12985, 12987, 12988, 12989, 12990, 12992, 12994, 12996, 12997, 12998, 12999, 13136, 13245, 14125, 14127, 14133, 14145, 14147, 14148, 14149, 14150, 14151, 14159, 14162, 14164, 14165, 14171, 14172, 14175, 14179, 14369, 14371, 14373, 14374, 14375, 14376, 14562, 14565, 14566, 14567, 14568, 14569, 14571, 14572, 14730, 14742, 14743, 14746, 14747, 14748, 15109, 15111, 15113, 15115, 15117, 15122, 15124, 15211, 15223, 15224, 15230, 15259, 15269, 15311, 15329, 15330, 15331, 15333, 15461, 15462, 15463, 15488, 15500, 15503, 15504, 15506, 15509, 15511, 15512, 15513, 15515, 15517, 15519, 15526, 15893, 15894, 15912, 15946, 15972, 16889, 16890, 16891, 16894, 16985, 16986, 17692, 17694, 19970, 23171, 23173);
UPDATE `item_template` SET `RequiredDisenchantSkill` = 50 WHERE `entry` IN (720, 753, 756, 886, 888, 897, 914, 1077, 1155, 1264, 1276, 1351, 1454, 1493, 1547, 1717, 1727, 1955, 1975, 1976, 1978, 2011, 2013, 2014, 2015, 2017, 2018, 2039, 2058, 2072, 2077, 2084, 2098, 2226, 2227, 2233, 2234, 2264, 2280, 2545, 2549, 2566, 2800, 2819, 2869, 2870, 2878, 2902, 2906, 2913, 2941, 2942, 3045, 3047, 3048, 3049, 3053, 3055, 3056, 3067, 3069, 3072, 3073, 3078, 3186, 3191, 3201, 3203, 3204, 3206, 3210, 3212, 3228, 3230, 3324, 3336, 3392, 3414, 3416, 3417, 3482, 3483, 3484, 3485, 3492, 3493, 3556, 3561, 3562, 3566, 3569, 3656, 3742, 3743, 3747, 3748, 3749, 3750, 3751, 4036, 4037, 4049, 4051, 4064, 4072, 4247, 4248, 4251, 4252, 4253, 4254, 4318, 4319, 4321, 4324, 4379, 4381, 4383, 4385, 4438, 4446, 4447, 4448, 4449, 4454, 4534, 4661, 4705, 4707, 4711, 4712, 4713, 4714, 4715, 4723, 4724, 4824, 4825, 4826, 4827, 4828, 4829, 4830, 4831, 4832, 4833, 4835, 4836, 4837, 4838, 4999, 5001, 5002, 5244, 5246, 5250, 5274, 5322, 5355, 5356, 5357, 5541, 5752, 5766, 5770, 5814, 5817, 5818, 5971, 6093, 6198, 6200, 6220, 6314, 6315, 6318, 6319, 6320, 6321, 6324, 6335, 6340, 6386, 6387, 6388, 6392, 6393, 6394, 6395, 6397, 6398, 6399, 6414, 6461, 6463, 6590, 6591, 6592, 6593, 6594, 6595, 6596, 6597, 6598, 6599, 6600, 6601, 6602, 6603, 6604, 6605, 6607, 6608, 6611, 6612, 6613, 6614, 6615, 6617, 6627, 6641, 6664, 6665, 6667, 6668, 6670, 6671, 6675, 6676, 6677, 6678, 6679, 6685, 6719, 6722, 6739, 6740, 6751, 6752, 6901, 6902, 6903, 6904, 6905, 6906, 6972, 6973, 7001, 7002, 7003, 7004, 7046, 7047, 7049, 7132, 7133, 7334, 7335, 7349, 7352, 7356, 7358, 7359, 7415, 7419, 7751, 7754, 7786, 8183, 8184, 8186, 9485, 9486, 9487, 9488, 9490, 9509, 9535, 9536, 9604, 9605, 9769, 9772, 9773, 9774, 9791, 9795, 9796, 9797, 9798, 9799, 9800, 9802, 9803, 9804, 9806, 9807, 9808, 9809, 9817, 9821, 9822, 9827, 9829, 9831, 9837, 9838, 10287, 10298, 10404, 10653, 10657, 11121, 11968, 11969, 11983, 11984, 11995, 12008, 12047, 13005, 13010, 13011, 13012, 13016, 13024, 13031, 13032, 13041, 13049, 13057, 13062, 13079, 13094, 13097, 13099, 13114, 13131, 14158, 14163, 14176, 14177, 14180, 14181, 14182, 14183, 14184, 14185, 14186, 14187, 14188, 14191, 14194, 14195, 14197, 14372, 14377, 14378, 14379, 14380, 14400, 14402, 14406, 14570, 14573, 14574, 14578, 14580, 14582, 14744, 14749, 14750, 14752, 14754, 14755, 14756, 15116, 15118, 15120, 15121, 15123, 15125, 15126, 15127, 15132, 15135, 15212, 15241, 15242, 15249, 15284, 15332, 15334, 15336, 15337, 15338, 15340, 15341, 15342, 15343, 15347, 15348, 15351, 15457, 15458, 15459, 15464, 15465, 15466, 15468, 15469, 15470, 15471, 15514, 15516, 15518, 15520, 15521, 15522, 15523, 15525, 15527, 15528, 15529, 15531, 15532, 15535, 15537, 15538, 15539, 15545, 15547, 15891, 15927, 15947, 15973, 15974, 16659, 16660, 16661, 16886, 16887, 16975, 16977, 16978, 16987, 16990, 17005, 17006, 17047, 17695);
UPDATE `item_template` SET `RequiredDisenchantSkill` = 75 WHERE `entry` IN (776, 791, 865, 1116, 1282, 1297, 1488, 1991, 1997, 1998, 2000, 2043, 2044, 2080, 2277, 2278, 2299, 2565, 2721, 2805, 2816, 2877, 2912, 2916, 2917, 2933, 2943, 2953, 2954, 3020, 3037, 3041, 3042, 3185, 3197, 3209, 3341, 3560, 3753, 3754, 3755, 3758, 3759, 3760, 3761, 3822, 3836, 3840, 3841, 3842, 3843, 3849, 3850, 3851, 3852, 4035, 4039, 4040, 4048, 4050, 4052, 4054, 4055, 4066, 4071, 4073, 4075, 4076, 4077, 4121, 4126, 4135, 4140, 4255, 4256, 4257, 4258, 4322, 4323, 4325, 4455, 4456, 4462, 4463, 4464, 4465, 4474, 4476, 4477, 4504, 4505, 4535, 4643, 4716, 4717, 4718, 4719, 4720, 4721, 4722, 5003, 5005, 5007, 5016, 5180, 5181, 5213, 5214, 5245, 5256, 5614, 5753, 5754, 5755, 5782, 5813, 5815, 5819, 5820, 5962, 5963, 5964, 6194, 6204, 6223, 6282, 6389, 6396, 6400, 6403, 6404, 6406, 6407, 6408, 6409, 6410, 6609, 6610, 6616, 6681, 6682, 6686, 6687, 6688, 6689, 6690, 6691, 6695, 6696, 6697, 6737, 6738, 6744, 6745, 6748, 6749, 6750, 6790, 6804, 6909, 6910, 6911, 6953, 6971, 6974, 7051, 7052, 7053, 7055, 7065, 7106, 7107, 7110, 7129, 7130, 7330, 7331, 7344, 7353, 7354, 7355, 7357, 7366, 7367, 7368, 7369, 7370, 7373, 7374, 7375, 7406, 7407, 7408, 7409, 7410, 7411, 7412, 7413, 7414, 7416, 7417, 7418, 7420, 7421, 7422, 7423, 7424, 7436, 7460, 7511, 7512, 7609, 7682, 7683, 7684, 7686, 7687, 7688, 7689, 7690, 7691, 7708, 7709, 7727, 7728, 7729, 7730, 7731, 7750, 7752, 7753, 7756, 7787, 7913, 7914, 7915, 8226, 9395, 9405, 9406, 9428, 9445, 9446, 9447, 9448, 9449, 9450, 9452, 9453, 9454, 9455, 9456, 9457, 9489, 9491, 9508, 9510, 9515, 9516, 9538, 9588, 9608, 9609, 9622, 9687, 9698, 9699, 9819, 9820, 9823, 9824, 9825, 9826, 9828, 9830, 9832, 9833, 9834, 9835, 9836, 9839, 9840, 9841, 9842, 9843, 9845, 9846, 9847, 9853, 9855, 9857, 9860, 9861, 9865, 9867, 9868, 9869, 10043, 10288, 10289, 10299, 10332, 10406, 10408, 10409, 10423, 10499, 10654, 11229, 11305, 11306, 11884, 11970, 11985, 11996, 12009, 12019, 12028, 12029, 12039, 12247, 12248, 12249, 12250, 12974, 13019, 13033, 13037, 13045, 13048, 13063, 13084, 13087, 13106, 13108, 13124, 13127, 13137, 14178, 14189, 14190, 14192, 14193, 14196, 14198, 14199, 14200, 14201, 14203, 14205, 14206, 14209, 14210, 14211, 14212, 14214, 14219, 14221, 14397, 14398, 14399, 14401, 14403, 14404, 14405, 14408, 14409, 14411, 14414, 14416, 14579, 14581, 14583, 14584, 14585, 14587, 14590, 14593, 14608, 14751, 14753, 14757, 14758, 14759, 14761, 14763, 14764, 15128, 15129, 15130, 15131, 15133, 15136, 15137, 15139, 15140, 15142, 15143, 15147, 15148, 15225, 15231, 15232, 15250, 15285, 15286, 15339, 15344, 15345, 15346, 15349, 15350, 15352, 15354, 15355, 15357, 15358, 15467, 15524, 15530, 15533, 15534, 15536, 15540, 15541, 15542, 15543, 15544, 15548, 15549, 15550, 15551, 15553, 15554, 15555, 15556, 15559, 15560, 15566, 15568, 15571, 15579, 15585, 15587, 15588, 15689, 15892, 15928, 15934, 15935, 15962, 15975, 16658, 16740, 16741, 17046, 18585, 18586, 18948, 23168, 23169, 23170);
UPDATE `item_template` SET `RequiredDisenchantSkill` = 100 WHERE `entry` IN (863, 864, 870, 873, 934, 936, 937, 1207, 1265, 1280, 1465, 1522, 1523, 1602, 1659, 1678, 1679, 1716, 1726, 1988, 1990, 1992, 1993, 1996, 2032, 2231, 2262, 2276, 2620, 2621, 2622, 2951, 2955, 3011, 3345, 3763, 3764, 3765, 3837, 3844, 3845, 3846, 3847, 3853, 3854, 3855, 3856, 4038, 4041, 4042, 4043, 4044, 4057, 4059, 4060, 4065, 4067, 4068, 4074, 4078, 4079, 4086, 4107, 4108, 4115, 4120, 4122, 4123, 4124, 4127, 4132, 4133, 4139, 4197, 4259, 4260, 4262, 4264, 4326, 4327, 4328, 4329, 4393, 4443, 4509, 4511, 4543, 4545, 4547, 4725, 4726, 4727, 4729, 4731, 4732, 4741, 4744, 4745, 4746, 4810, 4975, 4976, 4978, 4980, 5009, 5011, 5079, 5247, 5248, 5249, 5253, 5257, 5608, 5624, 5756, 5783, 5965, 6327, 6331, 6402, 6405, 6412, 6413, 6416, 6417, 6418, 6419, 6420, 6421, 6422, 6692, 6693, 6694, 6720, 6725, 6729, 6732, 6742, 6746, 6747, 6757, 6780, 6784, 6791, 6792, 6793, 6794, 6797, 6798, 6801, 6806, 6828, 6900, 6975, 6976, 6977, 7054, 7056, 7057, 7059, 7060, 7061, 7111, 7377, 7378, 7386, 7387, 7390, 7391, 7429, 7430, 7431, 7432, 7433, 7434, 7435, 7437, 7438, 7439, 7440, 7441, 7443, 7444, 7445, 7446, 7447, 7448, 7454, 7455, 7456, 7457, 7458, 7459, 7461, 7462, 7463, 7465, 7474, 7476, 7483, 7492, 7493, 7513, 7514, 7515, 7556, 7685, 7710, 7711, 7712, 7713, 7714, 7736, 7755, 7757, 7758, 7759, 7760, 7761, 7916, 7917, 7963, 8006, 8156, 8158, 8159, 8160, 8161, 8174, 8188, 8223, 8224, 8225, 9375, 9378, 9381, 9382, 9383, 9384, 9385, 9386, 9388, 9390, 9391, 9392, 9393, 9396, 9397, 9398, 9403, 9407, 9420, 9435, 9458, 9459, 9461, 9492, 9517, 9518, 9519, 9522, 9623, 9624, 9625, 9718, 9844, 9848, 9849, 9850, 9851, 9852, 9854, 9856, 9858, 9859, 9862, 9863, 9864, 9866, 9870, 9871, 9872, 9873, 9875, 9876, 9877, 9879, 9880, 9885, 9886, 9889, 9890, 9891, 9892, 9895, 9896, 9898, 9900, 9901, 10328, 10329, 10331, 10333, 10358, 10359, 10567, 10570, 10571, 10572, 10573, 10574, 10578, 10581, 10582, 10583, 10584, 10710, 10760, 10766, 11263, 11971, 11972, 11986, 11997, 12010, 12020, 12030, 12040, 12251, 12252, 12259, 12260, 13017, 13020, 13025, 13038, 13054, 13081, 13093, 13103, 13105, 13110, 13119, 13121, 13129, 13145, 14202, 14204, 14207, 14208, 14213, 14215, 14217, 14218, 14220, 14222, 14223, 14224, 14226, 14229, 14231, 14232, 14233, 14235, 14236, 14239, 14240, 14251, 14407, 14410, 14412, 14413, 14415, 14418, 14419, 14420, 14422, 14423, 14426, 14588, 14589, 14591, 14592, 14594, 14595, 14596, 14598, 14600, 14602, 14607, 14760, 14762, 14765, 14766, 14767, 14770, 14771, 14772, 14773, 14896, 14897, 14898, 14900, 14903, 15104, 15105, 15106, 15107, 15108, 15134, 15144, 15145, 15146, 15149, 15150, 15151, 15153, 15154, 15155, 15158, 15160, 15213, 15214, 15226, 15233, 15234, 15243, 15260, 15261, 15322, 15353, 15356, 15360, 15361, 15362, 15364, 15365, 15366, 15367, 15368, 15455, 15456, 15546, 15552, 15557, 15558, 15561, 15562, 15563, 15565, 15567, 15569, 15570, 15572, 15573, 15574, 15575, 15576, 15577, 15580, 15581, 15582, 15590, 15594, 15595, 15598, 15691, 15692, 15695, 15697, 15698, 15864, 15865, 15918, 15929, 15963, 15976, 15977, 15990, 16788, 16789, 16791, 16793, 16794, 16873, 17039, 17042, 17043, 17688, 17704, 17721, 18238, 19969, 19972);
UPDATE `item_template` SET `RequiredDisenchantSkill` = 125 WHERE `entry` IN (744, 866, 867, 868, 869, 1204, 1404, 1521, 1604, 1613, 1624, 1625, 1640, 1664, 1680, 1713, 1714, 1715, 1718, 1722, 1980, 1981, 1982, 1986, 2164, 2623, 2624, 2802, 2815, 2825, 3187, 3430, 4045, 4046, 4047, 4058, 4061, 4062, 4063, 4070, 4080, 4083, 4087, 4109, 4110, 4111, 4112, 4113, 4114, 4117, 4119, 4125, 4128, 4129, 4131, 4136, 4137, 4138, 4430, 4478, 4507, 4508, 4548, 4652, 4653, 4734, 4735, 4736, 4737, 4738, 4977, 4979, 4983, 4984, 4987, 5215, 5216, 6411, 6415, 6423, 6424, 6425, 6426, 6428, 6429, 6431, 6432, 6433, 6723, 6726, 6727, 6773, 6774, 6788, 6789, 6802, 6803, 6829, 6830, 6831, 6832, 7063, 7064, 7112, 7189, 7332, 7468, 7469, 7470, 7471, 7472, 7473, 7475, 7477, 7478, 7479, 7480, 7481, 7482, 7484, 7485, 7486, 7487, 7488, 7489, 7490, 7491, 7494, 7495, 7496, 7522, 7524, 7525, 7533, 7534, 7544, 7545, 7552, 7555, 7610, 7717, 7718, 7719, 7720, 7721, 7722, 7723, 7724, 7726, 7746, 7747, 7749, 7918, 7919, 7920, 7921, 7924, 7926, 7927, 7928, 7929, 7938, 7941, 7942, 7943, 8120, 8137, 8139, 8140, 8141, 8142, 8144, 8157, 8162, 8163, 8175, 8176, 8187, 8189, 8192, 8194, 8196, 8198, 8200, 8201, 8203, 8204, 8205, 8210, 8211, 8214, 8345, 8347, 9149, 9243, 9285, 9286, 9287, 9288, 9289, 9290, 9291, 9292, 9359, 9366, 9387, 9389, 9394, 9400, 9401, 9404, 9408, 9409, 9410, 9411, 9422, 9423, 9424, 9425, 9426, 9427, 9429, 9430, 9431, 9432, 9434, 9465, 9520, 9521, 9626, 9627, 9630, 9631, 9632, 9633, 9635, 9636, 9637, 9658, 9660, 9661, 9662, 9663, 9664, 9678, 9679, 9680, 9682, 9703, 9704, 9705, 9706, 9874, 9878, 9881, 9882, 9883, 9884, 9887, 9893, 9894, 9897, 9899, 9902, 9903, 9904, 9906, 9907, 9908, 9909, 9910, 9912, 9915, 9916, 9917, 9918, 9919, 9920, 9921, 9923, 9925, 9926, 9927, 9928, 9929, 9930, 9931, 9932, 9933, 9934, 9935, 9959, 9966, 9967, 9968, 9969, 9970, 9971, 9972, 9973, 9998, 9999, 10001, 10002, 10003, 10004, 10007, 10008, 10009, 10018, 10019, 10021, 10023, 10042, 10088, 10089, 10094, 10330, 10461, 10500, 10501, 10502, 10508, 10510, 10518, 10542, 10543, 10545, 10700, 10701, 10702, 10703, 10711, 10721, 10724, 10747, 10748, 10758, 10761, 10762, 10763, 10764, 10765, 10767, 10768, 10769, 10770, 10771, 10772, 10774, 10775, 10776, 10777, 10823, 10824, 11262, 11265, 11856, 11858, 11859, 11973, 11987, 11998, 12011, 12012, 12022, 12023, 12031, 12042, 12253, 12254, 12257, 13026, 13029, 13034, 13042, 13051, 13058, 13064, 13068, 13071, 13088, 13095, 13100, 13115, 13117, 13132, 13138, 13199, 14216, 14225, 14228, 14230, 14234, 14238, 14241, 14242, 14243, 14245, 14246, 14247, 14248, 14250, 14252, 14253, 14255, 14257, 14258, 14260, 14261, 14262, 14270, 14417, 14421, 14424, 14425, 14428, 14429, 14430, 14431, 14432, 14435, 14549, 14599, 14601, 14603, 14604, 14605, 14606, 14652, 14654, 14656, 14768, 14769, 14774, 14775, 14776, 14777, 14778, 14781, 14782, 14821, 14825, 14826, 14827, 14828, 14829, 14830, 14831, 14832, 14833, 14834, 14838, 14839, 14841, 14895, 14899, 14901, 14902, 14905, 14906, 14909, 14910, 14940, 14941, 14942, 14943, 14944, 14945, 14946, 14956, 15152, 15156, 15157, 15159, 15161, 15162, 15163, 15165, 15166, 15168, 15169, 15215, 15244, 15251, 15287, 15359, 15363, 15369, 15370, 15371, 15372, 15374, 15375, 15377, 15382, 15578, 15583, 15584, 15589, 15591, 15592, 15593, 15596, 15597, 15599, 15600, 15602, 15603, 15605, 15606, 15607, 15608, 15610, 15611, 15612, 15613, 15614, 15617, 15624, 15690, 15964, 15978, 15979, 17508, 17686, 17687, 17772, 17773, 19507, 19508, 19509, 19808, 20640, 20641, 23177, 23178);
UPDATE `item_template` SET `RequiredDisenchantSkill` = 150 WHERE `entry` IN (754, 809, 862, 871, 940, 943, 1169, 1447, 1490, 1608, 1639, 1677, 1720, 1979, 1994, 2040, 2100, 2291, 2564, 2820, 3208, 4069, 4082, 4084, 4088, 4089, 4090, 4091, 4118, 4130, 4134, 4549, 4550, 4733, 4743, 5028, 5029, 5616, 6427, 6430, 6440, 7113, 7517, 7518, 7519, 7520, 7521, 7523, 7526, 7527, 7528, 7529, 7530, 7531, 7532, 7535, 7536, 7537, 7538, 7539, 7540, 7541, 7542, 7543, 7546, 7549, 7551, 7553, 7557, 7611, 7673, 7888, 7930, 7931, 7932, 7933, 7934, 7935, 7936, 7937, 7939, 7944, 7945, 7946, 7954, 7959, 7961, 8107, 8108, 8109, 8110, 8111, 8112, 8114, 8115, 8116, 8117, 8118, 8121, 8122, 8123, 8124, 8125, 8127, 8128, 8129, 8130, 8131, 8133, 8135, 8138, 8143, 8185, 8191, 8193, 8197, 8199, 8202, 8206, 8207, 8208, 8209, 8212, 8213, 8215, 8216, 8248, 8255, 8257, 8259, 8273, 8276, 8277, 8278, 8279, 8280, 8281, 8346, 8348, 8349, 9379, 9412, 9413, 9414, 9415, 9416, 9418, 9419, 9433, 9467, 9469, 9470, 9473, 9474, 9475, 9476, 9477, 9478, 9479, 9480, 9481, 9482, 9483, 9484, 9511, 9512, 9527, 9531, 9533, 9534, 9634, 9638, 9639, 9640, 9641, 9642, 9645, 9646, 9647, 9648, 9653, 9654, 9655, 9656, 9657, 9665, 9666, 9905, 9911, 9913, 9914, 9922, 9924, 9936, 9937, 9938, 9939, 9940, 9941, 9942, 9945, 9947, 9948, 9949, 9951, 9952, 9953, 9955, 9956, 9957, 9958, 9960, 9961, 9962, 9963, 9964, 9965, 10024, 10025, 10026, 10027, 10028, 10029, 10030, 10031, 10033, 10041, 10044, 10058, 10059, 10060, 10066, 10067, 10069, 10071, 10076, 10079, 10080, 10081, 10086, 10087, 10090, 10091, 10092, 10127, 10129, 10130, 10131, 10194, 10201, 10202, 10205, 10206, 10207, 10208, 10209, 10462, 10503, 10504, 10506, 10576, 10588, 10623, 10624, 10625, 10626, 10627, 10628, 10629, 10631, 10632, 10634, 10704, 10705, 10706, 10726, 10745, 10746, 10826, 10827, 11086, 11118, 11122, 11307, 11308, 11310, 11311, 11469, 11502, 11857, 11860, 11861, 11888, 11889, 11974, 11975, 11988, 11999, 12001, 12013, 12024, 12032, 12043, 12255, 12256, 12405, 12406, 12470, 12471, 13018, 13021, 13035, 13039, 13043, 13046, 13055, 13065, 13074, 13076, 13082, 13089, 13102, 13109, 13112, 13125, 13128, 13134, 13139, 14237, 14244, 14249, 14254, 14259, 14263, 14264, 14266, 14268, 14269, 14271, 14272, 14273, 14276, 14278, 14279, 14280, 14282, 14285, 14286, 14291, 14292, 14427, 14433, 14434, 14436, 14438, 14439, 14440, 14441, 14442, 14443, 14446, 14551, 14653, 14655, 14657, 14658, 14659, 14660, 14661, 14663, 14665, 14779, 14780, 14783, 14784, 14785, 14786, 14787, 14788, 14791, 14792, 14793, 14794, 14835, 14840, 14842, 14843, 14846, 14847, 14848, 14853, 14904, 14907, 14908, 14911, 14912, 14913, 14914, 14917, 14918, 14921, 14923, 14939, 14947, 14949, 14950, 14951, 14952, 14953, 14955, 14965, 15164, 15167, 15171, 15172, 15173, 15174, 15176, 15177, 15178, 15183, 15227, 15235, 15245, 15252, 15262, 15263, 15270, 15323, 15373, 15376, 15378, 15379, 15380, 15383, 15384, 15385, 15386, 15387, 15392, 15601, 15604, 15609, 15615, 15616, 15618, 15619, 15620, 15623, 15625, 15626, 15627, 15628, 15629, 15630, 15632, 15635, 15636, 15638, 15639, 15643, 15965, 15980, 15981, 16738, 16739, 17054, 17055, 17752, 17754, 17755, 17768, 17770, 17774, 17775, 17776, 17777, 17778, 17779, 18082, 18083, 18709, 18710, 18711, 18712, 19022, 19037, 19038, 19039, 19040, 19041, 19042, 19116, 19117, 19118, 19119, 19123, 19124, 19125, 19126, 19127, 19128, 19141, 20642, 

20643, 21311, 21312);
UPDATE `item_template` SET `RequiredDisenchantSkill` = 175 WHERE `entry` IN (810, 812, 942, 1203, 1315, 1607, 1721, 2163, 2824, 2915, 3075, 5266, 6660, 7734, 7947, 7960, 8106, 8113, 8119, 8126, 8132, 8134, 8190, 8246, 8247, 8249, 8250, 8251, 8253, 8254, 8256, 8260, 8261, 8262, 8263, 8264, 8266, 8267, 8268, 8269, 8270, 8272, 8274, 8282, 8286, 8297, 8311, 8314, 8315, 8316, 8317, 8319, 8367, 9372, 9643, 9644, 9649, 9650, 9651, 9652, 9683, 9684, 9686, 9943, 9944, 9946, 9950, 9954, 9974, 10057, 10061, 10062, 10063, 10064, 10065, 10068, 10070, 10072, 10073, 10074, 10075, 10077, 10078, 10082, 10083, 10084, 10085, 10093, 10096, 10098, 10099, 10103, 10107, 10108, 10109, 10110, 10120, 10122, 10126, 10128, 10132, 10133, 10134, 10165, 10166, 10167, 10171, 10172, 10173, 10174, 10175, 10176, 10179, 10180, 10183, 10184, 10185, 10186, 10187, 10189, 10190, 10191, 10192, 10193, 10195, 10196, 10197, 10198, 10199, 10200, 10203, 10204, 10231, 10238, 10239, 10240, 10241, 10242, 10243, 10244, 10245, 10278, 10630, 10633, 10652, 10686, 10707, 10708, 10709, 10739, 10740, 10741, 10742, 10743, 10744, 10749, 10750, 10751, 10780, 10781, 10782, 10783, 10784, 10785, 10786, 10787, 10788, 10795, 10796, 10797, 10798, 10799, 10800, 10801, 10802, 10803, 10804, 10805, 10806, 10807, 10808, 10838, 10842, 10843, 10844, 10845, 10846, 11120, 11123, 11124, 11302, 11603, 11608, 11623, 11624, 11625, 11626, 11627, 11628, 11629, 11631, 11632, 11633, 11634, 11635, 11662, 11665, 11675, 11677, 11678, 11679, 11685, 11686, 11702, 11703, 11722, 11743, 11747, 11748, 11749, 11750, 11784, 11811, 11824, 11839, 11841, 11842, 11862, 11863, 11864, 11865, 11866, 11867, 11868, 11869, 11870, 11871, 11872, 11875, 11906, 11907, 11908, 11909, 11910, 11911, 11913, 11915, 11916, 11917, 11918, 11919, 11945, 11946, 11962, 11963, 11964, 11976, 11977, 11989, 11990, 12000, 12002, 12014, 12018, 12021, 12025, 12034, 12038, 12041, 12044, 12049, 12050, 12051, 12055, 12102, 12243, 12408, 12415, 12416, 12424, 12425, 12428, 12462, 12463, 12464, 12465, 12466, 12527, 12528, 12531, 12535, 12542, 12546, 12549, 12550, 12552, 12555, 12624, 12773, 12774, 12791, 12793, 13008, 13009, 13014, 13022, 13027, 13030, 13052, 13059, 13066, 13067, 13073, 13085, 13111, 13120, 13122, 13126, 13144, 13473, 13475, 13856, 13857, 13858, 13860, 13863, 13868, 13869, 13870, 14042, 14043, 14044, 14100, 14101, 14103, 14107, 14132, 14134, 14141, 14142, 14143, 14265, 14267, 14274, 14275, 14277, 14281, 14283, 14289, 14290, 14293, 14294, 14295, 14296, 14299, 14300, 14301, 14304, 14311, 14313, 14321, 14437, 14444, 14445, 14447, 14448, 14450, 14451, 14452, 14454, 14552, 14662, 14664, 14666, 14667, 14668, 14669, 14672, 14673, 14674, 14789, 14790, 14795, 14796, 14797, 14801, 14802, 14803, 14807, 14844, 14849, 14850, 14851, 14852, 14855, 14856, 14857, 14861, 14915, 14916, 14919, 14920, 14922, 14926, 14927, 14928, 14929, 14948, 14954, 14957, 14959, 14960, 14961, 14962, 14963, 14968, 14974, 15045, 15046, 15054, 15057, 15061, 15064, 15067, 15071, 15073, 15074, 15076, 15077, 15078, 15083, 15084, 15091, 15092, 15170, 15175, 15180, 15181, 15182, 15184, 15186, 15187, 15190, 15216, 15217, 15228, 15229, 15236, 15237, 15253, 15254, 15274, 15275, 15279, 15280, 15291, 15294, 15295, 15381, 15388, 15389, 15393, 15394, 15395, 15425, 15427, 15621, 15622, 15631, 15633, 15634, 15637, 15641, 15642, 15644, 15645, 15646, 15647, 15649, 15652, 15653, 15654, 15656, 15659, 15661, 15694, 15702, 15703, 15822, 15823, 15862, 15863, 15936, 15937, 15966, 15982, 15983, 15995, 15999, 16004, 16768, 16769, 17007, 17050, 17705, 17707, 17710, 17711, 17713, 17714, 17715, 17717, 17718, 17719, 17728, 17730, 17732, 17733, 17734, 17736, 17737, 17738, 17739, 17740, 17741, 17742, 17743, 17744, 17745, 17746, 17748, 17749, 17750, 17751, 17753, 17766, 17767, 17780, 17943, 18295, 18634, 18637, 18697, 18762, 18984, 18986, 19024, 19114, 19115, 19120, 19121, 19159, 19302, 19303, 19982, 19984, 19990, 19991, 19992, 20006, 20035, 20036, 20037, 20082, 20083, 20130, 20255, 20369, 20503, 20504, 20505, 20512, 20517, 20521, 20530, 20534, 20536, 20556, 21278, 21316, 21317, 21998, 22006, 22015, 22066, 22077, 22081, 22090, 22099, 22110, 22223, 22234, 22240, 22270, 22272, 22274, 22458);
UPDATE `item_template` SET `RequiredDisenchantSkill` = 200 WHERE `entry` IN (647, 811, 833, 1168, 1263, 1443, 1973, 2099, 2244, 2245, 2246, 4696, 8245, 8252, 8258, 8265, 8271, 8275, 8284, 8285, 8287, 8288, 8289, 8291, 8292, 8293, 8294, 8295, 8298, 8299, 8300, 8301, 8302, 8304, 8305, 8306, 8307, 8308, 8310, 8312, 8318, 8320, 9402, 10095, 10097, 10100, 10101, 10102, 10104, 10105, 10106, 10111, 10112, 10113, 10118, 10119, 10121, 10123, 10124, 10125, 10136, 10138, 10144, 10145, 10147, 10148, 10156, 10159, 10164, 10168, 10169, 10170, 10177, 10178, 10181, 10182, 10188, 10210, 10211, 10212, 10213, 10214, 10216, 10219, 10221, 10222, 10223, 10224, 10225, 10228, 10229, 10230, 10232, 10233, 10234, 10235, 10236, 10237, 10258, 10275, 10276, 10277, 10279, 10280, 10281, 10282, 10362, 10363, 10364, 10365, 10369, 10370, 10371, 10372, 10374, 10375, 10376, 10377, 10380, 10381, 10391, 10455, 10659, 10696, 10697, 10698, 10778, 10779, 10828, 10829, 10833, 10835, 10836, 10837, 10847, 11193, 11194, 11195, 11196, 11604, 11605, 11606, 11607, 11669, 11684, 11726, 11728, 11729, 11730, 11731, 11735, 11744, 11745, 11746, 11755, 11764, 11765, 11766, 11767, 11768, 11782, 11783, 11785, 11786, 11787, 11802, 11803, 11805, 11807, 11808, 11809, 11810, 11812, 11814, 11815, 11816, 11817, 11819, 11820, 11821, 11822, 11823, 11832, 11873, 11874, 11876, 11882, 11902, 11904, 11905, 11920, 11921, 11922, 11923, 11924, 11925, 11926, 11927, 11928, 11929, 11930, 11931, 11932, 11933, 11935, 11978, 11991, 12004, 12015, 12026, 12035, 12045, 12046, 12056, 12057, 12059, 12061, 12062, 12065, 12066, 12082, 12083, 12108, 12109, 12110, 12111, 12112, 12113, 12114, 12115, 12185, 12409, 12410, 12414, 12417, 12418, 12419, 12422, 12426, 12427, 12532, 12543, 12544, 12545, 12547, 12548, 12551, 12553, 12554, 12556, 12557, 12582, 12604, 12605, 12608, 12610, 12611, 12621, 12626, 12628, 12631, 12632, 12633, 12634, 12637, 12651, 12653, 12775, 12776, 12777, 12781, 12782, 12792, 12930, 12952, 12953, 12960, 13002, 13003, 13004, 13007, 13013, 13036, 13040, 13044, 13047, 13053, 13056, 13060, 13070, 13072, 13077, 13091, 13096, 13101, 13118, 13130, 13135, 13146, 13166, 13167, 13168, 13169, 13170, 13175, 13177, 13178, 13179, 13181, 13182, 13183, 13198, 13203, 13204, 13210, 13211, 13212, 13213, 13244, 13248, 13252, 13253, 13255, 13257, 13261, 13282, 13283, 13284, 13285, 13286, 13371, 13372, 13373, 13374, 13375, 13376, 13378, 13379, 13383, 13384, 13394, 13395, 13396, 13399, 13400, 13402, 13403, 13404, 13405, 13408, 13409, 13474, 13498, 13515, 13534, 13535, 13537, 13538, 13539, 13864, 13865, 13866, 13871, 13958, 13959, 13961, 13962, 13963, 14045, 14104, 14108, 14111, 14128, 14136, 14137, 14138, 14144, 14284, 14287, 14288, 14297, 14298, 14302, 14303, 14305, 14306, 14307, 14309, 14310, 14314, 14315, 14316, 14319, 14320, 14323, 14324, 14327, 14331, 14449, 14453, 14455, 14457, 14458, 14459, 14465, 14531, 14576, 14670, 14671, 14675, 14676, 14677, 14678, 14682, 14683, 14684, 14798, 14799, 14800, 14804, 14805, 14806, 14808, 14810, 14813, 14854, 14858, 14859, 14860, 14863, 14864, 14865, 14869, 14924, 14925, 14930, 14932, 14933, 14934, 14935, 14937, 14938, 14958, 14964, 14967, 14969, 14970, 14971, 14972, 14973, 14977, 14983, 15048, 15049, 15050, 15051, 15053, 15056, 15058, 15059, 15060, 15062, 15063, 15065, 15066, 15069, 15070, 15072, 15075, 15079, 15080, 15082, 15086, 15087, 15088, 15093, 15094, 15095, 15119, 15138, 15179, 15185, 15188, 15189, 15191, 15192, 15218, 15219, 15238, 15255, 15256, 15264, 15265, 15271, 15272, 15276, 15278, 15281, 15282, 15324, 15325, 15390, 15391, 15426, 15428, 15429, 15430, 15431, 15432, 15436, 15640, 15648, 15650, 15651, 15655, 15657, 15658, 15662, 15663, 15664, 15665, 15666, 15668, 15671, 15672, 15673, 15674, 15681, 15683, 15693, 15704, 15705, 15706, 15707, 15708, 15709, 15782, 15783, 15784, 15786, 15787, 15789, 15791, 15792, 15795, 15796, 15797, 15799, 15800, 15801, 15802, 15804, 15812, 15813, 15814, 15815, 15824, 15825, 15827, 15853, 15854, 15855, 15856, 15857, 15858, 15859, 15860, 15861, 15867, 15873, 15890, 15930, 15938, 15939, 15967, 15984, 15985, 15986, 16008, 16009, 16022, 16039, 16622, 16623, 16669, 16670, 16671, 16672, 16673, 16675, 16676, 16679, 16680, 16681, 16682, 16683, 16684, 16685, 16689, 16691, 16692, 16695, 16696, 16697, 16701, 16702, 16703, 16704, 16705, 16708, 16710, 16711, 16712, 16713, 16714, 16715, 16716, 16717, 16718, 16729, 16724, 16722, 16725, 16723, 16733, 16734, 16735, 16736, 16737, 16982, 16983, 16989, 16992, 16993, 16994, 16995, 16999, 17013, 17014, 17061, 17523, 17759, 18043, 18044, 18048, 18289, 18296, 18298, 18301, 18302, 18305, 18306, 18307, 18308, 18309, 18310, 18311, 18312, 18313, 18314, 18315, 18317, 18318, 18319, 18321, 18322, 18323, 18324, 18325, 18326, 18327, 18328, 18337, 18338, 18339, 18340, 18343, 18344, 18345, 18346, 18354, 18366, 18367, 18368, 18369, 18387, 18400, 18402, 18410, 18411, 18425, 18450, 18451, 18458, 18459, 18460, 18462, 18463, 18464, 18475, 18476, 18477, 18478, 18479, 18480, 18481, 18482, 18491, 18493, 18494, 18496, 18497, 18498, 18535, 18536, 18602, 18638, 18639, 18671, 18672, 18673, 18674, 18692, 18698, 18699, 18700, 18701, 18702, 18725, 18726, 18727, 18728, 18729, 18730, 18742, 18743, 18744, 18745, 19043, 19044, 19047, 19051, 19052, 19056, 20218, 20219, 20295, 20296, 20645, 20646, 20647, 20649, 20650, 20652, 20653, 20654, 20655, 20656, 20657, 20658, 20659, 20660, 20661, 20662, 20663, 20692, 20693, 20694, 21318, 21319, 21320, 21322, 21995, 21997, 21999, 22003, 22005, 22009, 22013, 22060, 22061, 22064, 22065, 22069, 22074, 22075, 22076, 22080, 22083, 22084, 22087, 22089, 22091, 22102, 22097, 22096, 22107, 22109, 22113, 22204, 22205, 22207, 22208, 22212, 22225, 22241, 22242, 22245, 22254, 22255, 22256, 22257, 22266, 22271, 22275, 22385, 22395, 22397, 22400, 22656, 22657, 22659, 22667, 22668, 22678, 23124, 23125, 23126, 24222, 12625);
UPDATE `item_template` SET `RequiredDisenchantSkill` = 225 WHERE `entry` IN (944, 1728, 2243, 2801, 3475, 5267, 6622, 8283, 8290, 8296, 8303, 8309, 8313, 10135, 10137, 10139, 10140, 10141, 10142, 10143, 10146, 10149, 10150, 10151, 10152, 10153, 10154, 10155, 10157, 10158, 10160, 10161, 10162, 10163, 10215, 10217, 10218, 10220, 10226, 10227, 10246, 10247, 10248, 10249, 10250, 10251, 10252, 10253, 10254, 10255, 10256, 10257, 10259, 10260, 10261, 10262, 10263, 10264, 10265, 10266, 10267, 10268, 10269, 10270, 10271, 10272, 10273, 10274, 10366, 10367, 10368, 10373, 10378, 10379, 10382, 10383, 10384, 10385, 10386, 10387, 10388, 10389, 10390, 11934, 11979, 11980, 11992, 12005, 12016, 12017, 12027, 12036, 12048, 12058, 12103, 12420, 12429, 12583, 12587, 12588, 12589, 12590, 12592, 12602, 12603, 12606, 12609, 12612, 12613, 12614, 12618, 12619, 12620, 12636, 12639, 12640, 12641, 12709, 12752, 12756, 12757, 12783, 12784, 12790, 12794, 12796, 12797, 12798, 12895, 12903, 12905, 12926, 12927, 12929, 12935, 12936, 12939, 12940, 12945, 12963, 12964, 12965, 12966, 12967, 12968, 12969, 13000, 13001, 13006, 13015, 13023, 13028, 13075, 13083, 13098, 13107, 13113, 13116, 13123, 13133, 13141, 13142, 13143, 13148, 13161, 13162, 13163, 13164, 13171, 13184, 13185, 13205, 13206, 13208, 13216, 13217, 13218, 13243, 13246, 13249, 13258, 13259, 13260, 13314, 13315, 13340, 13344, 13345, 13346, 13348, 13349, 13353, 13358, 13359, 13360, 13361, 13368, 13369, 13380, 13381, 13382, 13385, 13386, 13387, 13388, 13389, 13390, 13391, 13392, 13393, 13397, 13398, 13401, 13502, 13505, 13524, 13525, 13526, 13527, 13528, 13529, 13530, 13531, 13532, 13533, 13867, 13937, 13938, 13944, 13950, 13951, 13952, 13953, 13954, 13955, 13956, 13957, 13960, 13964, 13965, 13966, 13967, 13968, 13969, 13982, 13983, 13984, 13986, 14002, 14022, 14023, 14024, 14106, 14112, 14130, 14139, 14140, 14146, 14152, 14153, 14154, 14308, 14312, 14317, 14318, 14322, 14325, 14326, 14328, 14329, 14330, 14332, 14333, 14334, 14335, 14336, 14337, 14340, 14456, 14460, 14461, 14462, 14463, 14464, 14487, 14502, 14503, 14522, 14525, 14528, 14536, 14537, 14538, 14539, 14541, 14543, 14545, 14548, 14553, 14554, 14555, 14557, 14558, 14577, 14611, 14612, 14614, 14615, 14616, 14620, 14621, 14622, 14623, 14624, 14626, 14629, 14631, 14632, 14633, 14636, 14637, 14638, 14640, 14641, 14680, 14681, 14685, 14686, 14687, 14688, 14809, 14811, 14812, 14814, 14815, 14816, 14817, 14862, 14866, 14867, 14868, 14931, 14936, 14966, 14975, 14976, 14978, 14979, 14980, 14981, 14982, 15047, 15052, 15055, 15068, 15081, 15085, 15090, 15096, 15193, 15194, 15195, 15220, 15221, 15239, 15240, 15246, 15247, 15257, 15258, 15266, 15267, 15273, 15283, 15288, 15289, 15296, 15411, 15413, 15418, 15421, 15433, 15434, 15435, 15437, 15438, 15439, 15440, 15441, 15442, 15660, 15667, 15669, 15670, 15675, 15676, 15677, 15678, 15679, 15680, 15682, 15684, 15685, 15686, 15687, 15805, 15806, 15887, 15931, 15940, 15941, 15942, 15943, 15968, 15987, 15988, 15989, 15991, 16007, 16058, 16666, 16667, 16668, 16674, 16677, 16678, 16686, 16687, 16688, 16690, 16693, 16694, 16698, 16699, 16700, 16706, 16707, 16709, 16719, 16720, 16721, 16728, 16727, 16726, 16730, 16731, 16732, 16795, 16796, 16797, 16798, 16799, 16800, 16801, 16802, 16803, 16804, 16805, 16806, 16807, 16808, 16809, 16810, 16811, 16812, 16813, 16814, 16815, 16816, 16817, 16818, 16819, 16820, 16821, 16822, 16823, 16824, 16825, 16826, 16827, 16828, 16829, 16830, 16831, 16832, 16833, 16834, 16835, 16836, 16837, 16838, 16839, 16840, 16841, 16842, 16843, 16844, 16845, 16846, 16847, 16848, 16849, 16850, 16851, 16852, 16853, 16854, 16855, 16856, 16857, 16858, 16859, 16860, 16861, 16862, 16863, 16864, 16865, 16866, 16867, 16868, 16897, 16898, 16899, 16900, 16901, 16902, 16903, 16904, 16905, 16906, 16907, 16908, 16909, 16910, 16911, 16912, 16913, 16914, 16915, 16916, 16917, 16918, 16919, 16920, 16921, 16922, 16923, 16924, 16925, 16926, 16927, 16928, 16929, 16930, 16931, 16932, 16933, 16934, 16935, 16936, 16937, 16938, 16939, 16940, 16941, 16942, 16943, 16944, 16945, 16946, 16947, 16948, 16949, 16950, 16951, 16952, 16953, 16954, 16955, 16956, 16957, 16958, 16959, 16960, 16961, 16962, 16963, 16964, 16965, 16966, 16979, 16980, 16984, 16988, 16996, 16997, 16998, 17001, 17002, 17003, 17004, 17015, 17016, 17044, 17045, 17063, 17064, 17065, 17066, 17067, 17068, 17069, 17070, 17071, 17072, 17073, 17074, 17075, 17076, 17077, 17078, 17082, 17102, 17103, 17104, 17105, 17106, 17107, 17109, 17110, 17111, 17112, 17113, 17193, 17223, 17982, 18022, 18047, 18102, 18103, 18104, 18168, 18202, 18203, 18204, 18205, 18208, 18263, 18282, 18347, 18349, 18350, 18351, 18352, 18353, 18370, 18371, 18372, 18373, 18374, 18375, 18376, 18377, 18378, 18379, 18380, 18381, 18382, 18383, 18384, 18385, 18386, 18388, 18389, 18390, 18391, 18392, 18393, 18394, 18395, 18396, 18397, 18398, 18399, 18403, 18404, 18405, 18406, 18407, 18408, 18409, 18413, 18420, 18421, 18424, 18483, 18484, 18485, 18486, 18490, 18495, 18499, 18500, 18502, 18503, 18504, 18505, 18506, 18507, 18508, 18509, 18510, 18511, 18520, 18521, 18522, 18523, 18524, 18525, 18526, 18527, 18528, 18529, 18530, 18531, 18532, 18533, 18534, 18537, 18538, 18541, 18542, 18543, 18544, 18545, 18546, 18547, 18676, 18677, 18678, 18679, 18680, 18681, 18682, 18683, 18684, 18686, 18689, 18690, 18691, 18693, 18694, 18695, 18696, 18716, 18717, 18718, 18720, 18721, 18722, 18723, 18734, 18735, 18736, 18737, 18738, 18739, 18740, 18741, 18754, 18755, 18756, 18757, 18758, 18759, 18760, 18761, 18803, 18805, 18806, 18807, 18808, 18809, 18810, 18811, 18812, 18813, 18814, 18815, 18816, 18817, 18820, 18821, 18822, 18823, 18824, 18829, 18832, 18842, 18861, 18870, 18872, 18875, 18878, 18879, 19048, 19049, 19050, 19057, 19058, 19059, 19105, 19106, 19107, 19108, 19109, 19110, 19111, 19112, 19113, 19130, 19131, 19132, 19133, 19134, 19135, 19136, 19137, 19138, 19139, 19140, 19142, 19143, 19144, 19145, 19146, 19147, 19148, 19149, 19156, 19157, 19162, 19163, 19164, 19165, 19166, 19167, 19168, 19169, 19170, 19287, 19288, 19289, 19290, 19334, 19335, 19336, 19337, 19339, 19340, 19341, 19342, 19343, 19344, 19345, 19346, 19347, 19348, 19349, 19350, 19351, 19352, 19353, 19354, 19355, 19356, 19357, 19358, 19360, 19361, 19362, 19363, 19364, 19365, 19366, 19367, 19368, 19369, 19370, 19371, 19372, 19373, 19374, 19375, 19376, 22802, 19378, 19379, 19380, 19381, 19382, 19383, 19384, 19385, 19386, 19387, 19388, 19389, 19390, 19391, 19392, 19393, 19394, 19395, 19396, 19397, 19398, 19399, 19400, 19401, 19402, 19403, 19405, 19406, 19407, 19426, 19430, 19431, 19432, 19433, 19434, 19435, 19436, 19437, 19438, 19439, 19491, 19682, 19683, 19684, 19685, 19686, 19687, 19688, 19689, 19690, 19691, 19692, 19693, 19694, 19695, 19852, 19853, 19854, 19855, 19856, 19857, 19859, 19861, 19862, 19863, 19864, 19865, 19866, 19867, 19869, 19870, 19871, 19873, 19874, 19875, 19876, 19877, 19878, 19884, 19885, 19886, 19887, 19888, 19889, 19890, 19891, 19892, 19893, 19894, 19895, 19896, 19897, 19898, 19899, 19900, 19901, 19903, 19904, 19905, 19906, 19907, 19908, 19909, 19910, 19912, 19913, 19915, 19918, 19919, 19920, 19921, 19922, 19923, 19925, 19927, 19928, 19929, 19930, 19944, 19945, 19946, 19947, 19948, 19949, 19950, 19961, 19962, 19963, 19964, 19965, 19967, 19968, 19979, 19993, 19998, 19999, 20032, 20038, 20039, 20134, 20213, 20215, 20216, 20217, 20257, 20258, 20259, 20260, 20261, 20262, 20263, 20264, 20265, 20266, 20380, 20476, 20477, 20478, 20479, 20480, 20481, 20537, 20538, 20539, 20549, 20550, 20551, 20577, 20578, 20579, 20580, 20581, 20582, 20599, 20600, 20615, 20616, 20617, 20618, 20619, 20621, 20622, 20623, 20624, 20625, 20626, 20627, 20628, 20629, 20630, 20631, 20632, 20633, 20634, 20635, 20636, 20637, 20638, 20639, 20648, 20664, 20665, 20666, 20667, 20668, 20669, 20670, 20671, 20672, 20673, 20674, 20675, 20680, 20681, 20682, 20683, 20684, 20685, 20686, 20687, 20688, 20689, 20690, 20691, 20695, 20696, 20697, 20698, 20699, 20700, 20701, 20702, 20703, 20704, 20705, 20706, 20707, 20710, 20711, 20712, 20713, 20714, 20715, 20716, 20717, 20720, 20721, 20722, 20723, 20724, 21126, 21128, 21134, 21178, 21179, 21180, 21181, 21182, 21183, 21184, 21185, 21186, 21187, 21188, 21242, 21244, 21268, 21269, 21272, 21273, 21275, 21326, 21329, 21330, 21331, 21332, 21333, 21334, 21335, 21336, 21337, 21338, 21343, 21344, 21345, 21346, 21347, 21348, 21349, 21350, 21351, 21352, 21353, 21354, 21355, 21356, 21357, 21359, 21360, 21361, 21362, 21364, 21365, 21366, 21367, 21368, 21370, 21372, 21373, 21374, 21375, 21376, 21387, 21388, 21389, 21390, 21391, 21452, 21453, 21454, 21455, 21456, 21457, 21458, 21459, 21460, 21461, 21462, 21463, 21464, 21466, 21467, 21468, 21469, 21470, 21471, 21472, 21473, 21474, 21475, 21476, 21477, 21478, 21479, 21480, 21481, 21482, 21483, 21484, 21485, 21486, 21487, 21488, 21489, 21490, 21491, 21492, 21493, 21494, 21495, 21496, 21497, 21498, 21499, 21500, 21501, 21502, 21503, 21504, 21505, 21506, 21507, 21517, 21520, 21521, 21522, 21523, 21526, 21527, 21529, 21530, 21531, 21532, 21579, 21581, 21582, 21583, 21585, 21586, 21596, 21597, 21598, 21599, 21600, 21601, 21602, 21603, 21604, 21605, 21606, 21607, 21608, 21609, 21610, 21611, 21615, 21616, 21617, 21618, 21619, 21620, 21621, 21622, 21623, 21624, 21625, 21626, 21627, 21635, 21639, 21645, 21647, 21648, 21650, 21651, 21652, 21663, 21664, 21665, 21666, 21667, 21668, 21669, 21670, 21671, 21672, 21673, 21674, 21675, 21676, 21677, 21678, 21679, 21680, 21681, 21682, 21683, 21684, 21685, 21686, 21687, 21688, 21689, 21690, 21691, 21692, 21693, 21694, 21695, 21696, 21697, 21698, 21699, 21700, 21701, 21702, 21703, 21704, 21705, 21706, 21707, 21708, 21709, 21710, 21712, 21715, 21800, 21801, 21802, 21803, 21804, 21805, 21806, 21809, 21810, 21814, 21836, 21837, 21838, 21839, 21856, 21888, 21889, 21891, 22000, 22001, 21996, 21994, 22002, 22004, 22007, 22008, 22010, 22011, 22016, 22017, 22062, 22063, 22067, 22068, 22070, 22071, 22072, 22073, 22078, 22079, 22082, 22085, 22086, 22088, 22092, 22093, 22101, 22100, 22095, 22098, 22106, 22108, 22111, 22112, 22149, 22150, 22191, 22194, 22195, 22196, 22197, 22198, 22231, 22232, 22247, 22253, 22267, 22268, 22269, 22301, 22302, 22303, 22304, 22305, 22306, 22311, 22313, 22314, 22315, 22317, 22318, 22319, 22321, 22322, 22325, 22326, 22327, 22328, 22329, 22330, 22331, 22332, 22333, 22334, 22335, 22336, 22337, 22339, 22340, 22343, 22345, 22347, 22348, 22377, 22378, 22379, 22380, 22383, 22384, 22394, 22396, 22398, 22399, 22401, 22402, 22403, 22404, 22405, 22406, 22407, 22408, 22409, 22410, 22411, 22412, 22417, 22418, 22419, 22420, 22421, 22422, 22423, 22424, 22426, 22427, 22428, 22429, 22430, 22431, 22433, 22437, 22438, 22439, 22440, 22441, 22442, 22443, 22465, 22466, 22467, 22468, 22469, 22470, 22471, 22472, 22477, 22478, 22479, 22480, 22481, 22482, 22483, 22489, 22490, 22491, 22492, 22493, 22494, 22495, 22497, 22498, 22499, 22500, 22501, 22502, 22503, 22505, 22506, 22507, 22508, 22509, 22510, 22511, 22513, 22514, 22515, 22516, 22517, 22518, 22519, 22652, 22654, 22655, 22658, 22660, 22661, 22662, 22663, 22664, 22665, 22666, 22669, 22670, 22671, 22680, 22681, 22688, 22689, 22690, 22699, 22700, 22701, 22702, 22707, 22711, 22712, 22713, 22714, 22715, 22716, 22718, 22720, 22721, 22722, 22725, 22730, 22731, 22732, 22756, 22757, 22758, 22759, 22760, 22761, 22762, 22763, 22764, 22803, 22804, 22806, 22807, 22808, 22810, 22813, 22815, 22816, 22818, 22820, 22935, 22936, 22937, 22938, 22939, 22940, 22941, 22942, 22943, 22947, 22954, 22960, 22961, 22967, 22968, 22981, 22983, 22988, 22994, 23000, 23001, 23004, 23005, 23006, 23009, 23014, 23017, 23018, 23019, 23020, 23021, 23028, 23029, 23030, 23032, 23035, 23044, 23068, 23069, 23070, 23075, 23078, 23081, 23082, 23085, 23084, 23087, 23088, 23089, 23090, 23091, 23092, 23093, 23127, 23128, 23129, 23132, 23139, 23156, 23198, 23199, 23200, 23201, 23203, 23219, 23220, 23221, 23226, 23237, 23238, 23557, 23558, 23570, 23663, 23664, 23665, 23666, 23667, 23668, 23056, 19377, 22342, 22691, 22801, 22800, 22799, 23038, 23031, 23073, 22811, 23023, 23071, 22809, 23025, 23027, 23033, 23036, 23042, 23037, 23039, 23242, 22798, 22812, 23054, 23577, 23197);
UPDATE `item_template` SET `RequiredDisenchantSkill` = 300 WHERE `entry` IN (23060, 22416, 22425, 22436, 22464, 22476, 22488, 22496, 22504, 22512, 23059, 23061, 23062, 23063, 23064, 23065, 23066, 23067, 22821, 23040, 22819, 23043, 23053, 23045, 23041, 23050, 23047, 23049, 23048, 23046, 23057);

/* Disenchant Loot ID */
UPDATE item_template set DisenchantID=0;
/* green armor */
UPDATE item_template SET DisenchantID = 1 WHERE quality = 2 AND ItemLevel >4 AND ItemLevel < 16 AND RequiredDisenchantSkill > '-1' AND `InventoryType` in (0,1,2,3,4,5,6,7,8,9,10,11,12,16,18,19,20,27);
UPDATE item_template SET DisenchantID = 2 WHERE quality = 2 AND ItemLevel >15 AND ItemLevel < 21 AND RequiredDisenchantSkill > '-1' AND `InventoryType` in (0,1,2,3,4,5,6,7,8,9,10,11,12,16,18,19,20,27);
UPDATE item_template SET DisenchantID = 3 WHERE quality = 2 AND ItemLevel >20 AND ItemLevel < 26 AND RequiredDisenchantSkill > '-1' AND `InventoryType` in (0,1,2,3,4,5,6,7,8,9,10,11,12,16,18,19,20,27);
UPDATE item_template SET DisenchantID = 4 WHERE quality = 2 AND ItemLevel >25 AND ItemLevel < 31 AND RequiredDisenchantSkill > '-1' AND `InventoryType` in (0,1,2,3,4,5,6,7,8,9,10,11,12,16,18,19,20,27);
UPDATE item_template SET DisenchantID = 5 WHERE quality = 2 AND ItemLevel >30 AND ItemLevel < 36 AND RequiredDisenchantSkill > '-1' AND `InventoryType` in (0,1,2,3,4,5,6,7,8,9,10,11,12,16,18,19,20,27);
UPDATE item_template SET DisenchantID = 6 WHERE quality = 2 AND ItemLevel >35 AND ItemLevel < 41 AND RequiredDisenchantSkill > '-1' AND `InventoryType` in (0,1,2,3,4,5,6,7,8,9,10,11,12,16,18,19,20,27);
UPDATE item_template SET DisenchantID = 7 WHERE quality = 2 AND ItemLevel >40 AND ItemLevel < 46 AND RequiredDisenchantSkill > '-1' AND `InventoryType` in (0,1,2,3,4,5,6,7,8,9,10,11,12,16,18,19,20,27);
UPDATE item_template SET DisenchantID = 8 WHERE quality = 2 AND ItemLevel >45 AND ItemLevel < 51 AND RequiredDisenchantSkill > '-1' AND `InventoryType` in (0,1,2,3,4,5,6,7,8,9,10,11,12,16,18,19,20,27);
UPDATE item_template SET DisenchantID = 9 WHERE quality = 2 AND ItemLevel >50 AND ItemLevel < 56 AND RequiredDisenchantSkill > '-1' AND `InventoryType` in (0,1,2,3,4,5,6,7,8,9,10,11,12,16,18,19,20,27);
UPDATE item_template SET DisenchantID = 10 WHERE quality = 2 AND ItemLevel >55 AND ItemLevel < 61 AND RequiredDisenchantSkill > '-1' AND `InventoryType` in (0,1,2,3,4,5,6,7,8,9,10,11,12,16,18,19,20,27);
UPDATE item_template SET DisenchantID = 11 WHERE quality = 2 AND ItemLevel >60 AND ItemLevel < 66 AND RequiredDisenchantSkill > '-1' AND `InventoryType` in (0,1,2,3,4,5,6,7,8,9,10,11,12,16,18,19,20,27);

/* green wpn */
UPDATE item_template SET DisenchantID = 21 WHERE quality = 2 AND ItemLevel >4 AND ItemLevel < 16 AND RequiredDisenchantSkill > '-1' AND `InventoryType` in (13,14,15,17,21,22,23,24,25,26,28);
UPDATE item_template SET DisenchantID = 22 WHERE quality = 2 AND ItemLevel >15 AND ItemLevel < 21 AND RequiredDisenchantSkill > '-1' AND `InventoryType` in (13,14,15,17,21,22,23,24,25,26,28);
UPDATE item_template SET DisenchantID = 23 WHERE quality = 2 AND ItemLevel >20 AND ItemLevel < 26 AND RequiredDisenchantSkill > '-1' AND `InventoryType` in (13,14,15,17,21,22,23,24,25,26,28);
UPDATE item_template SET DisenchantID = 24 WHERE quality = 2 AND ItemLevel >25 AND ItemLevel < 31 AND RequiredDisenchantSkill > '-1' AND `InventoryType` in (13,14,15,17,21,22,23,24,25,26,28);
UPDATE item_template SET DisenchantID = 25 WHERE quality = 2 AND ItemLevel >30 AND ItemLevel < 36 AND RequiredDisenchantSkill > '-1' AND `InventoryType` in (13,14,15,17,21,22,23,24,25,26,28);
UPDATE item_template SET DisenchantID = 26 WHERE quality = 2 AND ItemLevel >35 AND ItemLevel < 41 AND RequiredDisenchantSkill > '-1' AND `InventoryType` in (13,14,15,17,21,22,23,24,25,26,28);
UPDATE item_template SET DisenchantID = 27 WHERE quality = 2 AND ItemLevel >40 AND ItemLevel < 46 AND RequiredDisenchantSkill > '-1' AND `InventoryType` in (13,14,15,17,21,22,23,24,25,26,28);
UPDATE item_template SET DisenchantID = 28 WHERE quality = 2 AND ItemLevel >45 AND ItemLevel < 51 AND RequiredDisenchantSkill > '-1' AND `InventoryType` in (13,14,15,17,21,22,23,24,25,26,28);
UPDATE item_template SET DisenchantID = 29 WHERE quality = 2 AND ItemLevel >50 AND ItemLevel < 56 AND RequiredDisenchantSkill > '-1' AND `InventoryType` in (13,14,15,17,21,22,23,24,25,26,28);
UPDATE item_template SET DisenchantID = 30 WHERE quality = 2 AND ItemLevel >55 AND ItemLevel < 61 AND RequiredDisenchantSkill > '-1' AND `InventoryType` in (13,14,15,17,21,22,23,24,25,26,28);
UPDATE item_template SET DisenchantID = 31 WHERE quality = 2 AND ItemLevel >60 AND ItemLevel < 66 AND RequiredDisenchantSkill > '-1' AND `InventoryType` in (13,14,15,17,21,22,23,24,25,26,28);

/* rares */
UPDATE item_template SET DisenchantID = 41 WHERE quality = 3 AND ItemLevel >10 AND ItemLevel < 26 AND RequiredDisenchantSkill > '-1';
UPDATE item_template SET DisenchantID = 42 WHERE quality = 3 AND ItemLevel >25 AND ItemLevel < 31 AND RequiredDisenchantSkill > '-1';
UPDATE item_template SET DisenchantID = 43 WHERE quality = 3 AND ItemLevel >30 AND ItemLevel < 36 AND RequiredDisenchantSkill > '-1';
UPDATE item_template SET DisenchantID = 44 WHERE quality = 3 AND ItemLevel >35 AND ItemLevel < 41 AND RequiredDisenchantSkill > '-1';
UPDATE item_template SET DisenchantID = 45 WHERE quality = 3 AND ItemLevel >40 AND ItemLevel < 46 AND RequiredDisenchantSkill > '-1';
UPDATE item_template SET DisenchantID = 46 WHERE quality = 3 AND ItemLevel >45 AND ItemLevel < 51 AND RequiredDisenchantSkill > '-1';
UPDATE item_template SET DisenchantID = 47 WHERE quality = 3 AND ItemLevel >50 AND ItemLevel < 56 AND RequiredDisenchantSkill > '-1';
UPDATE item_template SET DisenchantID = 48 WHERE quality = 3 AND ItemLevel >55 AND ItemLevel < 66 AND RequiredDisenchantSkill > '-1';
UPDATE item_template SET DisenchantID = 49 WHERE quality = 3 AND ItemLevel >65 AND ItemLevel < 71 AND RequiredDisenchantSkill > '-1';
UPDATE item_template SET DisenchantID = 50 WHERE quality = 3 AND ItemLevel >70 AND ItemLevel < 100 AND RequiredDisenchantSkill > '-1';

/* epix */
UPDATE item_template SET DisenchantID = 61 WHERE quality = 4 AND ItemLevel >39 AND ItemLevel < 46 AND RequiredDisenchantSkill > '-1';
UPDATE item_template SET DisenchantID = 62 WHERE quality = 4 AND ItemLevel >45 AND ItemLevel < 51 AND RequiredDisenchantSkill > '-1';
UPDATE item_template SET DisenchantID = 63 WHERE quality = 4 AND ItemLevel >50 AND ItemLevel < 56 AND RequiredDisenchantSkill > '-1';
UPDATE item_template SET DisenchantID = 64 WHERE quality = 4 AND ItemLevel >55 AND ItemLevel < 61 AND RequiredDisenchantSkill > '-1';
UPDATE item_template SET DisenchantID = 65 WHERE quality = 4 AND ItemLevel >60 AND ItemLevel < 95 AND RequiredDisenchantSkill > '-1';

/* additional */
UPDATE disenchant_loot_template SET ChanceOrQuestChance = 0 WHERE entry = 1 AND item = 10938;
UPDATE disenchant_loot_template SET ChanceOrQuestChance = 0 WHERE entry IN (2, 3, 22, 23) AND item = 10978;
UPDATE disenchant_loot_template SET ChanceOrQuestChance = 0 WHERE entry IN (4, 24) AND item = 11084;
UPDATE disenchant_loot_template SET ChanceOrQuestChance = 0 WHERE entry IN (5, 25) AND item = 11138;
UPDATE disenchant_loot_template SET ChanceOrQuestChance = 0 WHERE entry IN (6, 26) AND item = 11139;
UPDATE disenchant_loot_template SET ChanceOrQuestChance = 0 WHERE entry IN (7, 27) AND item = 11177;
UPDATE disenchant_loot_template SET ChanceOrQuestChance = 0 WHERE entry IN (8, 28) AND item = 11178;
UPDATE disenchant_loot_template SET ChanceOrQuestChance = 0 WHERE entry IN (9, 29) AND item = 14343;
UPDATE disenchant_loot_template SET ChanceOrQuestChance = 0 WHERE entry IN (10, 11) AND item = 14344;
UPDATE disenchant_loot_template SET ChanceOrQuestChance = 0 WHERE entry = 21 AND item = 10940;
UPDATE disenchant_loot_template SET ChanceOrQuestChance = 0 WHERE entry IN (30, 31) AND item = 14344;
UPDATE disenchant_loot_template SET groupid = 0 WHERE entry BETWEEN 41 AND 47;
UPDATE disenchant_loot_template SET groupid = 0 WHERE entry BETWEEN 61 AND 65;

/* REV 21 */
/* NPC Kroshius */
UPDATE `creature_template` SET `faction_A`='14', `faction_H`='14' WHERE (`entry`='14467');

/* Quest Suppression */
UPDATE `quest_template` SET `NextQuestId`='7583', `ExclusiveGroup`='-7581', `NextQuestInChain`='7583' WHERE (`entry`='7581');
UPDATE `quest_template` SET `NextQuestId`='7583', `ExclusiveGroup`='-7581', `NextQuestInChain`='7583' WHERE (`entry`='7582');

/* Summon Felsteed */
UPDATE `creature_questrelation` SET `id`='461' WHERE (`id`='5172') AND (`quest`='4488');
DELETE FROM `creature_questrelation` WHERE `id` IN ('5172', '6251');
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES ('5172', '4487');
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES ('6251', '4490');
DELETE FROM `creature_involvedrelation` WHERE `id` IN ('5172', '6251');
INSERT INTO `creature_involvedrelation` (`id`, `quest`) VALUES ('6251', '4487');
INSERT INTO `creature_involvedrelation` (`id`, `quest`) VALUES ('6251', '4490');

/* NPC Patrols */
UPDATE `creature_addon` SET `auras`='18950 0 18950 1' WHERE `guid` IN (90484, 79768, 79818, 90438, 79670, 79675, 79690, 79792, 79807, 79814, 12088, 12093, 91, 109, 1814, 46216, 46219, 46220, 6494, 6495, 6496, 32072, 32073, 32074, 24782, 24785);
UPDATE `creature_template` SET `spell1`='14030', `spell2`='15572' WHERE `entry` IN (14439, 14423, 14438, 14365, 14363, 14367, 14380, 14379, 14378, 14402, 14403, 14404, 14441, 14440);

/* REV 22 */
/* Quest Crown of the Earth */
UPDATE `quest_template` SET `NextQuestInChain`='934' WHERE (`entry`='933');
UPDATE `quest_template` SET `PrevQuestId`='934' WHERE (`entry`='935');
DELETE FROM `creature_involvedrelation` WHERE `id` = '3515';
INSERT INTO `creature_involvedrelation` (`id`, `quest`) VALUES ('3515', '934');
DELETE FROM `creature_questrelation` WHERE `id` = '3515';
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES ('3515', '934');

/* NPC Mekgineer Thermaplugg */
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='2' WHERE (`entry`='7800') AND `item` IN (7742, 4411, 

4413, 4415);
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='20' WHERE (`entry`='7800') AND `item` IN (9492, 9459);

/* NPC Summoned Blackhand Dreadweaver */
UPDATE `creature_template` SET `faction_A`='40', `faction_H`='40' WHERE `entry` IN (10680, 9817, 9818, 9819, 10316, 10317, 10318, 10319, 10509, 10681, 10742, 10899);

/* Quest Target: XX */
DELETE FROM `creature_loot_template` WHERE (`entry`='11075');
DELETE FROM `creature_loot_template` WHERE (`entry`='11076');
DELETE FROM `creature_loot_template` WHERE (`entry`='11077');
DELETE FROM `creature_loot_template` WHERE (`entry`='11078');
INSERT INTO `creature_loot_template` VALUES ('11075', '3356', '0.02', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('11075', '8839', '0.02', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('11075', '13194', '-100', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('11075', '13356', '50', '0', '1', '1', '2', '13370', '1');
INSERT INTO `creature_loot_template` VALUES ('11076', '13197', '-100', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('11076', '13357', '50', '0', '1', '1', '2', '13370', '1');
INSERT INTO `creature_loot_template` VALUES ('11076', '13466', '0.02', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('11077', '13195', '-100', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('11077', '13357', '50', '0', '1', '1', '2', '13370', '1');
INSERT INTO `creature_loot_template` VALUES ('11077', '13466', '0.04', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('11078', '785', '0.02', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('11078', '3820', '0.02', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('11078', '13196', '-100', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('11078', '13354', '50', '0', '1', '1', '2', '13370', '1');
INSERT INTO `creature_loot_template` VALUES ('11078', '13466', '0.06', '0', '1', '1', '0', '0', '0');
UPDATE `creature_template` SET `lootid`='11075' WHERE (`entry`='11075');
UPDATE `creature_template` SET `lootid`='11077' WHERE (`entry`='11077');
UPDATE `creature_template` SET `lootid`='11078' WHERE (`entry`='11078');
UPDATE `creature_template` SET `lootid`='11076' WHERE (`entry`='11076');

/* Quest Khans' gems */
DELETE FROM `creature_loot_template` WHERE (`entry`='13738');
DELETE FROM `creature_loot_template` WHERE (`entry`='13739');
DELETE FROM `creature_loot_template` WHERE (`entry`='13740');
DELETE FROM `creature_loot_template` WHERE (`entry`='13741');
DELETE FROM `creature_loot_template` WHERE (`entry`='13742');
INSERT INTO `creature_loot_template` VALUES ('13738', '24044', '0.5', '1', '-24044', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13738', '24036', '5', '1', '-24036', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13738', '24025', '1', '1', '-24025', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13738', '24045', '1', '1', '-24045', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13738', '24043', '1', '1', '-24043', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13738', '1645', '1.54', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13738', '3395', '0.06', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13738', '3928', '1.3025', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13738', '4338', '12.5904', '0', '1', '4', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13738', '4419', '0.06', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13738', '4422', '0.12', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13738', '4425', '0.06', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13738', '4599', '2.3155', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13738', '4638', '0.1447', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13738', '6149', '0.18', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13738', '7909', '0.5', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13738', '7910', '0.1447', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13738', '7990', '0.05', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13738', '8385', '0.06', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13738', '8845', '0.06', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13738', '9298', '0.12', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13738', '10320', '0.12', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13738', '15731', '0.06', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13738', '17684', '-80', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13738', '17765', '100', '0', '1', '1', '9', '7067', '0');
INSERT INTO `creature_loot_template` VALUES ('13739', '24082', '0.1', '1', '-24082', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13739', '24042', '0.5', '1', '-24042', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13739', '24044', '0.5', '1', '-24044', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13739', '24036', '5', '1', '-24036', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13739', '24045', '1', '1', '-24045', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13739', '24043', '1', '1', '-24043', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13739', '1645', '1.46', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13739', '3928', '1.12', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13739', '4338', '13.4259', '0', '1', '4', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13739', '4419', '0.3', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13739', '4422', '0.12', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13739', '4425', '0.18', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13739', '4599', '2.0062', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13739', '4638', '0.3', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13739', '6149', '0.3', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13739', '7909', '0.1543', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13739', '7910', '0.36', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13739', '7993', '0.02', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13739', '8386', '0.06', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13739', '8389', '0.24', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13739', '9298', '0.06', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13739', '10302', '0.12', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13739', '10320', '0.12', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13739', '12683', '0.06', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13739', '17684', '-80', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13739', '17764', '100', '0', '1', '1', '9', '7067', '0');
INSERT INTO `creature_loot_template` VALUES ('13739', '24041', '1', '1', '-24041', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13740', '24040', '0.5', '1', '-24040', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13740', '24037', '1', '1', '-24037', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13740', '10300', '0.12', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13740', '10301', '0.12', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13740', '17684', '-80', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13740', '17763', '100', '0', '1', '1', '9', '7067', '0');
INSERT INTO `creature_loot_template` VALUES ('13740', '24041', '1', '1', '-24041', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13741', '24037', '1', '1', '-24037', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13741', '24039', '1', '1', '-24039', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13741', '24036', '5', '1', '-24036', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13741', '1645', '1.56', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13741', '3864', '0.08', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13741', '3869', '0.1', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13741', '3914', '0.08', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13741', '3928', '0.82', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13741', '4306', '8.5409', '0', '1', '4', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13741', '4338', '8.0071', '0', '1', '4', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13741', '4419', '0.08', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13741', '4421', '0.08', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13741', '4422', '0.16', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13741', '4599', '1.9573', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13741', '4637', '0.3559', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13741', '6149', '0.42', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13741', '7909', '0.5', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13741', '7910', '0.34', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13741', '8385', '0.16', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13741', '8386', '0.03', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13741', '9293', '0.08', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13741', '10301', '0.08', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13741', '10605', '0.08', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13741', '11202', '0.07', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13741', '11208', '0.16', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13741', '17684', '-80', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13741', '17762', '100', '0', '1', '1', '9', '7067', '0');
INSERT INTO `creature_loot_template` VALUES ('13741', '24041', '1', '1', '-24041', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13742', '24038', '0.5', '1', '-24038', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13742', '24040', '0.5', '1', '-24040', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13742', '24042', '0.5', '1', '-24042', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13742', '24037', '1', '1', '-24037', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13742', '24039', '1', '1', '-24039', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13742', '24036', '5', '1', '-24036', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13742', '24043', '1', '1', '-24043', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13742', '1645', '1.62', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13742', '3395', '0.1', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13742', '3820', '0.04', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13742', '3864', '0.28', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13742', '3869', '0.04', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13742', '3928', '0.94', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13742', '4306', '5.9767', '0', '1', '4', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13742', '4338', '10.3499', '0', '1', '4', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13742', '4416', '0.04', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13742', '4419', '0.02', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13742', '4421', '0.04', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13742', '4422', '0.04', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13742', '4424', '0.22', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13742', '4599', '2.7697', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13742', '4637', '0.1458', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13742', '6149', '0.46', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13742', '7909', '0.4373', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13742', '7910', '0.14', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13742', '7912', '0.18', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13742', '8029', '0.04', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13742', '8387', '0.04', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13742', '9298', '0.02', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13742', '10300', '0.04', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13742', '10302', '0.04', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13742', '11208', '0.04', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13742', '17684', '-80', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature_loot_template` VALUES ('13742', '17761', '100', '0', '1', '1', '9', '7067', '0');
INSERT INTO `creature_loot_template` VALUES ('13742', '24041', '1', '1', '-24041', '1', '0', '0', '0');
UPDATE `creature_template` SET `lootid`='13742' WHERE (`entry`='13742');
UPDATE `creature_template` SET `lootid`='13741' WHERE (`entry`='13741');
UPDATE `creature_template` SET `lootid`='13740' WHERE (`entry`='13740');
UPDATE `creature_template` SET `lootid`='13739' WHERE (`entry`='13739');
UPDATE `creature_template` SET `lootid`='13738' WHERE (`entry`='13738');

/* REV 23 */
/* NPC Camp Mojache Brave */
UPDATE `creature_template` SET `minlevel`='55' WHERE (`entry`='8147');

/* Quest The Brokering of Peace */
UPDATE `quest_template` SET `RequiredRaces`='1101' WHERE (`entry`='8484');
DELETE FROM `quest_template` WHERE `entry` = '8485';
INSERT INTO `quest_template` (`entry`, `ZoneOrSort`, `MinLevel`, `QuestLevel`, `RequiredRaces`, `RepObjectiveFaction`, `RepObjectiveValue`, `RequiredMinRepFaction`, `RequiredMinRepValue`, `SrcItemId`, `SrcItemCount`, `Title`, `Details`, `Objectives`, `OfferRewardText`, `RequestItemsText`, `ReqItemId1`, `ReqItemCount1`, `RewMoneyMaxLevel`, `CompleteEmote`) VALUES ('8485', '1769', '55', '60', '690', '576', '42000', '576', '42000', '21155', '1', 'The Brokering of Peace', 'Your deeds go beyond the tale of a simple hero, $N.  If you are a representative of your people, then your people are ones we would work to make peace with.$B$BPlease - take this offering to the orcish warchief that resides in the lands of Durotar; I believe you call this city Orgrimmar.  In times past, he had tried to make contact with us on behalf of his Horde.  It is now only fitting to acknowledge you as the key in your Horde\'s efforts in brokering peace.', 'Bring the Timbermaw Offering of Peace to Thrall in Orgrimmar.', 'Indeed, this is a most fortuitous turn of events. Were a lasting peace to be made with these creatures, this would certainly give us an advantage in securing Kalimdor from external threats. I will notify the other leaders of the Horde of this immediately, and further diplomats will be dispatched!$B$BAs for you, $N... you have shown courage in both diplomacy and in action. I thank you, as does the entirety of the Horde.', 'The warchief\'s greetings are bestowed upon you, $C. Your deeds make the Horde grow stronger in these troubling times.  Now, what business do you have with me?', '21155', '1', '8700', '1');
DELETE FROM `creature_questrelation` WHERE `id` = '11555';
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES ('11555', '8485');
DELETE FROM `creature_involvedrelation` WHERE `id` = '4949';
INSERT INTO `creature_involvedrelation` (`id`, `quest`) VALUES ('4949', '8485');
UPDATE `quest_template` SET `RewRepFaction1`='469', `RewRepValue1`='500' WHERE (`entry`='8484');
UPDATE `quest_template` SET `RewRepFaction1`='67', `RewRepValue1`='500' WHERE (`entry`='8485');

/* Update creature and quest template */
UPDATE `creature_template` SET `minlevel`='55', `maxlevel`='55' WHERE `entry` IN (12782, 14581);
UPDATE `creature_template` SET `minlevel`='60', `maxlevel`='60' WHERE `entry` IN (15855, 15856, 1964);
UPDATE `quest_template` SET `MinLevel`='1' WHERE `entry` IN (8744, 8767);
UPDATE `quest_template` SET `MinLevel`='20' WHERE (`entry`='8768');
UPDATE `quest_template` SET `MinLevel`='10', `QuestLevel`='60' WHERE `entry` IN (7023, 7024);

UPDATE `creature`, `creature_template` SET `creature`.`curhealth`=`creature_template`.`minhealth`,`creature`.`curmana`=`creature_template`.`minmana` WHERE`creature`.`id`=`creature_template`.`entry` and `creature_template`.`RegenHealth` = '1';

/* Support for Q 2882 */
DELETE FROM `waypoint_data` WHERE `id` IN (99901, 99902, 99903, 99905, 99905);
INSERT INTO `waypoint_data`(`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`) VALUES
(99901,1,-10090.72,-4047.45,6.21,500,1),
(99901,2,-10117.05,-4055.85,5.42,1000,0),
(99901,3,-10117.52,-4080.50,3.88,90000,0);
INSERT INTO `waypoint_data`(`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`) VALUES
(99902,1,-10090.72,-4047.45,6.21,0,1),
(99902,2,-10117.05,-4055.85,5.42,1000,0),
(99902,3,-10119.52,-4080.50,3.88,90000,0);
INSERT INTO `waypoint_data`(`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`) VALUES
(99903,1,-10090.72,-4045.45,6.21,0,1),
(99903,2,-10119.70,-4050.45,5.33,1500,0),
(99903,3,-10151.39,-4046.32,3.22,90000,0);
INSERT INTO `waypoint_data`(`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`) VALUES
(99904,1,-10090.72,-4045.45,6.21,0,1),
(99904,2,-10119.70,-4050.45,5.33,1500,0),
(99904,3,-10151.39,-4048.32,3.22,90000,0);
INSERT INTO `waypoint_data`(`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`) VALUES
(99905,1,-10090.72,-4045.45,6.21,500,1),
(99905,2,-10119.70,-4050.45,5.33,1500,0),
(99905,3,-10151.39,-4050.32,3.22,90000,0);

/* Rewrite creature_linked_respawn table */
DELETE FROM `creature_linked_respawn`;
INSERT INTO `creature_linked_respawn` VALUES (79355, 79336);
INSERT INTO `creature_linked_respawn` VALUES (79390, 79336);
INSERT INTO `creature_linked_respawn` VALUES (79384, 79336);
INSERT INTO `creature_linked_respawn` VALUES (79388, 79336);
INSERT INTO `creature_linked_respawn` VALUES (79389, 79336);
INSERT INTO `creature_linked_respawn` VALUES (79385, 79336);
INSERT INTO `creature_linked_respawn` VALUES (79335, 79336);
INSERT INTO `creature_linked_respawn` VALUES (79334, 79336);
INSERT INTO `creature_linked_respawn` VALUES (79383, 79336);
INSERT INTO `creature_linked_respawn` VALUES (79368, 79336);
INSERT INTO `creature_linked_respawn` VALUES (79370, 79336);
INSERT INTO `creature_linked_respawn` VALUES (79329, 79333);
INSERT INTO `creature_linked_respawn` VALUES (79328, 79333);
INSERT INTO `creature_linked_respawn` VALUES (79321, 79333);
INSERT INTO `creature_linked_respawn` VALUES (79356, 79333);
INSERT INTO `creature_linked_respawn` VALUES (79358, 79333);
INSERT INTO `creature_linked_respawn` VALUES (79309, 79333);
INSERT INTO `creature_linked_respawn` VALUES (79327, 79333);
INSERT INTO `creature_linked_respawn` VALUES (79319, 79333);
INSERT INTO `creature_linked_respawn` VALUES (79326, 79333);
INSERT INTO `creature_linked_respawn` VALUES (79315, 79333);
INSERT INTO `creature_linked_respawn` VALUES (79307, 79333);
INSERT INTO `creature_linked_respawn` VALUES (79310, 79333);
INSERT INTO `creature_linked_respawn` VALUES (79308, 79333);
INSERT INTO `creature_linked_respawn` VALUES (79311, 79333);
INSERT INTO `creature_linked_respawn` VALUES (79304, 79333);
INSERT INTO `creature_linked_respawn` VALUES (79320, 79333);
INSERT INTO `creature_linked_respawn` VALUES (79322, 79333);
INSERT INTO `creature_linked_respawn` VALUES (79314, 79333);
INSERT INTO `creature_linked_respawn` VALUES (79317, 79333);
INSERT INTO `creature_linked_respawn` VALUES (79305, 79333);
INSERT INTO `creature_linked_respawn` VALUES (79313, 79333);
INSERT INTO `creature_linked_respawn` VALUES (79342, 79344);
INSERT INTO `creature_linked_respawn` VALUES (79341, 79344);
INSERT INTO `creature_linked_respawn` VALUES (79340, 79344);
INSERT INTO `creature_linked_respawn` VALUES (79343, 79344);
INSERT INTO `creature_linked_respawn` VALUES (79347, 79344);
INSERT INTO `creature_linked_respawn` VALUES (79349, 79344);
INSERT INTO `creature_linked_respawn` VALUES (79350, 79344);
INSERT INTO `creature_linked_respawn` VALUES (79348, 79344);
INSERT INTO `creature_linked_respawn` VALUES (79351, 79344);
INSERT INTO `creature_linked_respawn` VALUES (79352, 79344);
INSERT INTO `creature_linked_respawn` VALUES (79354, 79344);
INSERT INTO `creature_linked_respawn` VALUES (79353, 79344);
INSERT INTO `creature_linked_respawn` VALUES (79325, 79337);
INSERT INTO `creature_linked_respawn` VALUES (79323, 79337);
INSERT INTO `creature_linked_respawn` VALUES (79332, 79337);
INSERT INTO `creature_linked_respawn` VALUES (79330, 79337);
INSERT INTO `creature_linked_respawn` VALUES (79338, 79337);
INSERT INTO `creature_linked_respawn` VALUES (79346, 79337);
INSERT INTO `creature_linked_respawn` VALUES (79345, 79337);
INSERT INTO `creature_linked_respawn` VALUES (79324, 79337);
INSERT INTO `creature_linked_respawn` VALUES (79306, 79337);
INSERT INTO `creature_linked_respawn` VALUES (79316, 79337);
INSERT INTO `creature_linked_respawn` VALUES (79300, 79337);
INSERT INTO `creature_linked_respawn` VALUES (79301, 79337);
INSERT INTO `creature_linked_respawn` VALUES (79299, 79337);
INSERT INTO `creature_linked_respawn` VALUES (79302, 79337);
INSERT INTO `creature_linked_respawn` VALUES (79297, 79337);
INSERT INTO `creature_linked_respawn` VALUES (79292, 79337);
INSERT INTO `creature_linked_respawn` VALUES (79294, 79337);
INSERT INTO `creature_linked_respawn` VALUES (79291, 79337);
INSERT INTO `creature_linked_respawn` VALUES (79289, 79337);
INSERT INTO `creature_linked_respawn` VALUES (79290, 79337);
INSERT INTO `creature_linked_respawn` VALUES (79288, 79337);
INSERT INTO `creature_linked_respawn` VALUES (79261, 79337);
INSERT INTO `creature_linked_respawn` VALUES (79360, 79337);
INSERT INTO `creature_linked_respawn` VALUES (79271, 79337);
INSERT INTO `creature_linked_respawn` VALUES (79361, 79337);
INSERT INTO `creature_linked_respawn` VALUES (79260, 79337);
INSERT INTO `creature_linked_respawn` VALUES (79259, 79337);
INSERT INTO `creature_linked_respawn` VALUES (79258, 79337);
INSERT INTO `creature_linked_respawn` VALUES (79253, 79337);
INSERT INTO `creature_linked_respawn` VALUES (79250, 79337);
INSERT INTO `creature_linked_respawn` VALUES (79251, 79337);
INSERT INTO `creature_linked_respawn` VALUES (79296, 79337);
INSERT INTO `creature_linked_respawn` VALUES (79248, 79337);
INSERT INTO `creature_linked_respawn` VALUES (79252, 79337);
INSERT INTO `creature_linked_respawn` VALUES (79249, 79337);
INSERT INTO `creature_linked_respawn` VALUES (79210, 79337);
INSERT INTO `creature_linked_respawn` VALUES (79215, 79337);
INSERT INTO `creature_linked_respawn` VALUES (79216, 79337);
INSERT INTO `creature_linked_respawn` VALUES (79214, 79337);
INSERT INTO `creature_linked_respawn` VALUES (79196, 79206);
INSERT INTO `creature_linked_respawn` VALUES (79201, 79206);
INSERT INTO `creature_linked_respawn` VALUES (79211, 79206);
INSERT INTO `creature_linked_respawn` VALUES (79204, 79206);
INSERT INTO `creature_linked_respawn` VALUES (79209, 79206);
INSERT INTO `creature_linked_respawn` VALUES (79247, 79206);
INSERT INTO `creature_linked_respawn` VALUES (79198, 79206);
INSERT INTO `creature_linked_respawn` VALUES (79380, 79206);
INSERT INTO `creature_linked_respawn` VALUES (79379, 79206);
INSERT INTO `creature_linked_respawn` VALUES (79197, 79206);
INSERT INTO `creature_linked_respawn` VALUES (79378, 79206);
INSERT INTO `creature_linked_respawn` VALUES (79205, 79206);
INSERT INTO `creature_linked_respawn` VALUES (79203, 79206);
INSERT INTO `creature_linked_respawn` VALUES (79208, 79206);
INSERT INTO `creature_linked_respawn` VALUES (79213, 79206);
INSERT INTO `creature_linked_respawn` VALUES (79218, 79206);
INSERT INTO `creature_linked_respawn` VALUES (79285, 79206);
INSERT INTO `creature_linked_respawn` VALUES (79212, 79206);
INSERT INTO `creature_linked_respawn` VALUES (79242, 79206);
INSERT INTO `creature_linked_respawn` VALUES (79243, 79206);
INSERT INTO `creature_linked_respawn` VALUES (79217, 79206);
INSERT INTO `creature_linked_respawn` VALUES (79200, 79206);
INSERT INTO `creature_linked_respawn` VALUES (79199, 79206);
INSERT INTO `creature_linked_respawn` VALUES (79284, 79206);
INSERT INTO `creature_linked_respawn` VALUES (79283, 79206);
INSERT INTO `creature_linked_respawn` VALUES (79226, 79206);
INSERT INTO `creature_linked_respawn` VALUES (79219, 79206);
INSERT INTO `creature_linked_respawn` VALUES (79377, 79206);
INSERT INTO `creature_linked_respawn` VALUES (79233, 79206);
INSERT INTO `creature_linked_respawn` VALUES (79225, 79206);
INSERT INTO `creature_linked_respawn` VALUES (79376, 79206);
INSERT INTO `creature_linked_respawn` VALUES (79229, 79206);
INSERT INTO `creature_linked_respawn` VALUES (79230, 79206);
INSERT INTO `creature_linked_respawn` VALUES (79239, 79206);
INSERT INTO `creature_linked_respawn` VALUES (79238, 79206);
INSERT INTO `creature_linked_respawn` VALUES (79240, 79206);
INSERT INTO `creature_linked_respawn` VALUES (79241, 79206);
INSERT INTO `creature_linked_respawn` VALUES (79234, 79206);
INSERT INTO `creature_linked_respawn` VALUES (79237, 79206);
INSERT INTO `creature_linked_respawn` VALUES (79232, 79206);
INSERT INTO `creature_linked_respawn` VALUES (79236, 79206);
INSERT INTO `creature_linked_respawn` VALUES (79235, 79206);
INSERT INTO `creature_linked_respawn` VALUES (79224, 79206);
INSERT INTO `creature_linked_respawn` VALUES (79227, 79223);
INSERT INTO `creature_linked_respawn` VALUES (79202, 79223);
INSERT INTO `creature_linked_respawn` VALUES (79231, 79223);
INSERT INTO `creature_linked_respawn` VALUES (79222, 79223);
INSERT INTO `creature_linked_respawn` VALUES (79221, 79223);
INSERT INTO `creature_linked_respawn` VALUES (79207, 79223);
INSERT INTO `creature_linked_respawn` VALUES (79192, 79223);
INSERT INTO `creature_linked_respawn` VALUES (79220, 79223);
INSERT INTO `creature_linked_respawn` VALUES (79195, 79223);
INSERT INTO `creature_linked_respawn` VALUES (79193, 79223);
INSERT INTO `creature_linked_respawn` VALUES (79175, 79223);
INSERT INTO `creature_linked_respawn` VALUES (79173, 79223);
INSERT INTO `creature_linked_respawn` VALUES (79176, 79223);
INSERT INTO `creature_linked_respawn` VALUES (79178, 79223);
INSERT INTO `creature_linked_respawn` VALUES (79181, 79223);
INSERT INTO `creature_linked_respawn` VALUES (79187, 79223);
INSERT INTO `creature_linked_respawn` VALUES (79177, 79223);
INSERT INTO `creature_linked_respawn` VALUES (79184, 79223);
INSERT INTO `creature_linked_respawn` VALUES (79244, 79223);
INSERT INTO `creature_linked_respawn` VALUES (79180, 79223);
INSERT INTO `creature_linked_respawn` VALUES (79281, 79223);
INSERT INTO `creature_linked_respawn` VALUES (79245, 79223);
INSERT INTO `creature_linked_respawn` VALUES (79190, 79223);
INSERT INTO `creature_linked_respawn` VALUES (84079, 79223);
INSERT INTO `creature_linked_respawn` VALUES (79194, 79223);
INSERT INTO `creature_linked_respawn` VALUES (79191, 79223);
INSERT INTO `creature_linked_respawn` VALUES (79185, 79223);
INSERT INTO `creature_linked_respawn` VALUES (79183, 79223);
INSERT INTO `creature_linked_respawn` VALUES (79182, 79223);
INSERT INTO `creature_linked_respawn` VALUES (79172, 79223);
INSERT INTO `creature_linked_respawn` VALUES (79179, 79223);
INSERT INTO `creature_linked_respawn` VALUES (79280, 79223);
INSERT INTO `creature_linked_respawn` VALUES (79169, 79223);
INSERT INTO `creature_linked_respawn` VALUES (79273, 79223);
INSERT INTO `creature_linked_respawn` VALUES (79174, 79223);
INSERT INTO `creature_linked_respawn` VALUES (79171, 79223);
INSERT INTO `creature_linked_respawn` VALUES (79170, 79223);
INSERT INTO `creature_linked_respawn` VALUES (79167, 79168);
INSERT INTO `creature_linked_respawn` VALUES (79165, 79168);
INSERT INTO `creature_linked_respawn` VALUES (79164, 79168);
INSERT INTO `creature_linked_respawn` VALUES (79163, 79168);
INSERT INTO `creature_linked_respawn` VALUES (79162, 79168);
INSERT INTO `creature_linked_respawn` VALUES (79374, 79168);
INSERT INTO `creature_linked_respawn` VALUES (79373, 79168);
INSERT INTO `creature_linked_respawn` VALUES (79161, 79168);
INSERT INTO `creature_linked_respawn` VALUES (79159, 79168);
INSERT INTO `creature_linked_respawn` VALUES (79158, 79168);
INSERT INTO `creature_linked_respawn` VALUES (79131, 79168);
INSERT INTO `creature_linked_respawn` VALUES (79129, 79168);
INSERT INTO `creature_linked_respawn` VALUES (79160, 79168);
INSERT INTO `creature_linked_respawn` VALUES (79277, 79168);
INSERT INTO `creature_linked_respawn` VALUES (79157, 79168);
INSERT INTO `creature_linked_respawn` VALUES (79154, 79168);
INSERT INTO `creature_linked_respawn` VALUES (79156, 79168);
INSERT INTO `creature_linked_respawn` VALUES (79151, 79168);
INSERT INTO `creature_linked_respawn` VALUES (79148, 79168);
INSERT INTO `creature_linked_respawn` VALUES (79140, 79168);
INSERT INTO `creature_linked_respawn` VALUES (79130, 79168);
INSERT INTO `creature_linked_respawn` VALUES (79189, 79168);
INSERT INTO `creature_linked_respawn` VALUES (79188, 79168);
INSERT INTO `creature_linked_respawn` VALUES (79133, 79168);
INSERT INTO `creature_linked_respawn` VALUES (79152, 79168);
INSERT INTO `creature_linked_respawn` VALUES (79155, 79168);
INSERT INTO `creature_linked_respawn` VALUES (79149, 79168);
INSERT INTO `creature_linked_respawn` VALUES (79135, 79168);
INSERT INTO `creature_linked_respawn` VALUES (79143, 79168);
INSERT INTO `creature_linked_respawn` VALUES (79136, 79168);
INSERT INTO `creature_linked_respawn` VALUES (79137, 79168);
INSERT INTO `creature_linked_respawn` VALUES (79128, 79168);
INSERT INTO `creature_linked_respawn` VALUES (79142, 79168);
INSERT INTO `creature_linked_respawn` VALUES (79134, 79168);
INSERT INTO `creature_linked_respawn` VALUES (79127, 79168);
INSERT INTO `creature_linked_respawn` VALUES (79139, 79168);
INSERT INTO `creature_linked_respawn` VALUES (79145, 79168);
INSERT INTO `creature_linked_respawn` VALUES (79144, 79168);
INSERT INTO `creature_linked_respawn` VALUES (79138, 79168);
INSERT INTO `creature_linked_respawn` VALUES (79146, 79168);
INSERT INTO `creature_linked_respawn` VALUES (9252, 89358);
INSERT INTO `creature_linked_respawn` VALUES (4915, 89358);
INSERT INTO `creature_linked_respawn` VALUES (10560, 89358);
INSERT INTO `creature_linked_respawn` VALUES (11906, 89358);
INSERT INTO `creature_linked_respawn` VALUES (25813, 86195);
INSERT INTO `creature_linked_respawn` VALUES (31826, 86195);
INSERT INTO `creature_linked_respawn` VALUES (1107, 86494);
INSERT INTO `creature_linked_respawn` VALUES (52048, 47572);
INSERT INTO `creature_linked_respawn` VALUES (52053, 47572);
INSERT INTO `creature_linked_respawn` VALUES (52052, 47572);
INSERT INTO `creature_linked_respawn` VALUES (52047, 47572);
INSERT INTO `creature_linked_respawn` VALUES (52051, 47572);
INSERT INTO `creature_linked_respawn` VALUES (52049, 47572);
INSERT INTO `creature_linked_respawn` VALUES (48571, 47572);
INSERT INTO `creature_linked_respawn` VALUES (48572, 47572);
INSERT INTO `creature_linked_respawn` VALUES (52050, 47572);
INSERT INTO `creature_linked_respawn` VALUES (48574, 47572);
INSERT INTO `creature_linked_respawn` VALUES (48573, 47572);
INSERT INTO `creature_linked_respawn` VALUES (84444, 84388);
INSERT INTO `creature_linked_respawn` VALUES (84439, 84388);
INSERT INTO `creature_linked_respawn` VALUES (84484, 84388);
INSERT INTO `creature_linked_respawn` VALUES (84432, 84388);
INSERT INTO `creature_linked_respawn` VALUES (84437, 84388);
INSERT INTO `creature_linked_respawn` VALUES (84436, 84388);
INSERT INTO `creature_linked_respawn` VALUES (84406, 84388);
INSERT INTO `creature_linked_respawn` VALUES (84404, 84388);
INSERT INTO `creature_linked_respawn` VALUES (84405, 84388);
INSERT INTO `creature_linked_respawn` VALUES (84403, 84388);
INSERT INTO `creature_linked_respawn` VALUES (84392, 84388);
INSERT INTO `creature_linked_respawn` VALUES (84393, 84388);
INSERT INTO `creature_linked_respawn` VALUES (84390, 84388);
INSERT INTO `creature_linked_respawn` VALUES (84389, 84388);
INSERT INTO `creature_linked_respawn` VALUES (84391, 84388);
INSERT INTO `creature_linked_respawn` VALUES (84496, 84388);
INSERT INTO `creature_linked_respawn` VALUES (84503, 84388);
INSERT INTO `creature_linked_respawn` VALUES (84511, 84388);
INSERT INTO `creature_linked_respawn` VALUES (84495, 84388);
INSERT INTO `creature_linked_respawn` VALUES (84494, 84388);
INSERT INTO `creature_linked_respawn` VALUES (84510, 84388);
INSERT INTO `creature_linked_respawn` VALUES (84509, 84388);
INSERT INTO `creature_linked_respawn` VALUES (84489, 84388);
INSERT INTO `creature_linked_respawn` VALUES (84493, 84388);
INSERT INTO `creature_linked_respawn` VALUES (84487, 84388);
INSERT INTO `creature_linked_respawn` VALUES (84486, 84388);
INSERT INTO `creature_linked_respawn` VALUES (84505, 84388);
INSERT INTO `creature_linked_respawn` VALUES (84517, 84512);
INSERT INTO `creature_linked_respawn` VALUES (84516, 84512);
INSERT INTO `creature_linked_respawn` VALUES (84515, 84512);
INSERT INTO `creature_linked_respawn` VALUES (84514, 84512);
INSERT INTO `creature_linked_respawn` VALUES (84518, 84512);
INSERT INTO `creature_linked_respawn` VALUES (84513, 84512);
INSERT INTO `creature_linked_respawn` VALUES (85845, 84387);
INSERT INTO `creature_linked_respawn` VALUES (85806, 84387);
INSERT INTO `creature_linked_respawn` VALUES (85855, 84387);
INSERT INTO `creature_linked_respawn` VALUES (85822, 84387);
INSERT INTO `creature_linked_respawn` VALUES (85854, 84387);
INSERT INTO `creature_linked_respawn` VALUES (85847, 84387);
INSERT INTO `creature_linked_respawn` VALUES (85805, 84387);
INSERT INTO `creature_linked_respawn` VALUES (85844, 84387);
INSERT INTO `creature_linked_respawn` VALUES (85836, 84387);
INSERT INTO `creature_linked_respawn` VALUES (85832, 84387);
INSERT INTO `creature_linked_respawn` VALUES (85856, 84387);
INSERT INTO `creature_linked_respawn` VALUES (85843, 84387);
INSERT INTO `creature_linked_respawn` VALUES (85821, 84387);
INSERT INTO `creature_linked_respawn` VALUES (85804, 84387);
INSERT INTO `creature_linked_respawn` VALUES (85853, 84387);
INSERT INTO `creature_linked_respawn` VALUES (85834, 84387);
INSERT INTO `creature_linked_respawn` VALUES (85802, 84387);
INSERT INTO `creature_linked_respawn` VALUES (85857, 84387);
INSERT INTO `creature_linked_respawn` VALUES (85830, 84387);
INSERT INTO `creature_linked_respawn` VALUES (85813, 84387);
INSERT INTO `creature_linked_respawn` VALUES (85841, 84387);
INSERT INTO `creature_linked_respawn` VALUES (85801, 84387);
INSERT INTO `creature_linked_respawn` VALUES (85808, 84387);
INSERT INTO `creature_linked_respawn` VALUES (85800, 84387);
INSERT INTO `creature_linked_respawn` VALUES (85799, 84387);
INSERT INTO `creature_linked_respawn` VALUES (85851, 84387);
INSERT INTO `creature_linked_respawn` VALUES (85798, 84387);
INSERT INTO `creature_linked_respawn` VALUES (85865, 84387);
INSERT INTO `creature_linked_respawn` VALUES (85864, 84387);
INSERT INTO `creature_linked_respawn` VALUES (85875, 84387);
INSERT INTO `creature_linked_respawn` VALUES (85884, 84387);
INSERT INTO `creature_linked_respawn` VALUES (85824, 84387);
INSERT INTO `creature_linked_respawn` VALUES (85797, 84387);
INSERT INTO `creature_linked_respawn` VALUES (85849, 84387);
INSERT INTO `creature_linked_respawn` VALUES (85837, 84387);
INSERT INTO `creature_linked_respawn` VALUES (85823, 84387);
INSERT INTO `creature_linked_respawn` VALUES (85796, 84387);
INSERT INTO `creature_linked_respawn` VALUES (85863, 84387);
INSERT INTO `creature_linked_respawn` VALUES (85862, 84387);
INSERT INTO `creature_linked_respawn` VALUES (85840, 84387);
INSERT INTO `creature_linked_respawn` VALUES (85825, 84387);
INSERT INTO `creature_linked_respawn` VALUES (85861, 84387);
INSERT INTO `creature_linked_respawn` VALUES (85850, 84387);
INSERT INTO `creature_linked_respawn` VALUES (85829, 84387);
INSERT INTO `creature_linked_respawn` VALUES (85828, 84387);
INSERT INTO `creature_linked_respawn` VALUES (85827, 84387);
INSERT INTO `creature_linked_respawn` VALUES (85839, 84387);
INSERT INTO `creature_linked_respawn` VALUES (85793, 84387);
INSERT INTO `creature_linked_respawn` VALUES (85788, 84387);
INSERT INTO `creature_linked_respawn` VALUES (85795, 84387);
INSERT INTO `creature_linked_respawn` VALUES (85838, 84387);
INSERT INTO `creature_linked_respawn` VALUES (85859, 84387);
INSERT INTO `creature_linked_respawn` VALUES (85848, 84387);
INSERT INTO `creature_linked_respawn` VALUES (85858, 84387);
INSERT INTO `creature_linked_respawn` VALUES (85786, 84387);
INSERT INTO `creature_linked_respawn` VALUES (84522, 84387);
INSERT INTO `creature_linked_respawn` VALUES (84527, 84387);
INSERT INTO `creature_linked_respawn` VALUES (84529, 84387);
INSERT INTO `creature_linked_respawn` VALUES (84530, 84387);
INSERT INTO `creature_linked_respawn` VALUES (84521, 84387);
INSERT INTO `creature_linked_respawn` VALUES (84528, 84387);
INSERT INTO `creature_linked_respawn` VALUES (84520, 84387);
INSERT INTO `creature_linked_respawn` VALUES (84532, 84387);
INSERT INTO `creature_linked_respawn` VALUES (84523, 84387);
INSERT INTO `creature_linked_respawn` VALUES (84526, 84387);
INSERT INTO `creature_linked_respawn` VALUES (84519, 84387);
INSERT INTO `creature_linked_respawn` VALUES (84531, 84387);
INSERT INTO `creature_linked_respawn` VALUES (84525, 84387);
INSERT INTO `creature_linked_respawn` VALUES (84524, 84387);
INSERT INTO `creature_linked_respawn` VALUES (84536, 84572);
INSERT INTO `creature_linked_respawn` VALUES (84537, 84572);
INSERT INTO `creature_linked_respawn` VALUES (84538, 84572);
INSERT INTO `creature_linked_respawn` VALUES (84542, 84572);
INSERT INTO `creature_linked_respawn` VALUES (84543, 84572);
INSERT INTO `creature_linked_respawn` VALUES (84541, 84572);
INSERT INTO `creature_linked_respawn` VALUES (84540, 84572);
INSERT INTO `creature_linked_respawn` VALUES (84533, 84572);
INSERT INTO `creature_linked_respawn` VALUES (84534, 84572);
INSERT INTO `creature_linked_respawn` VALUES (84535, 84572);
INSERT INTO `creature_linked_respawn` VALUES (84544, 84572);
INSERT INTO `creature_linked_respawn` VALUES (84545, 84572);
INSERT INTO `creature_linked_respawn` VALUES (84546, 84572);
INSERT INTO `creature_linked_respawn` VALUES (84547, 84572);
INSERT INTO `creature_linked_respawn` VALUES (84548, 84572);
INSERT INTO `creature_linked_respawn` VALUES (84549, 84572);
INSERT INTO `creature_linked_respawn` VALUES (84550, 84572);
INSERT INTO `creature_linked_respawn` VALUES (84551, 84572);
INSERT INTO `creature_linked_respawn` VALUES (84552, 84572);
INSERT INTO `creature_linked_respawn` VALUES (84553, 84572);
INSERT INTO `creature_linked_respawn` VALUES (84554, 84572);
INSERT INTO `creature_linked_respawn` VALUES (84555, 84572);
INSERT INTO `creature_linked_respawn` VALUES (84556, 84572);
INSERT INTO `creature_linked_respawn` VALUES (84557, 84572);
INSERT INTO `creature_linked_respawn` VALUES (84589, 84572);
INSERT INTO `creature_linked_respawn` VALUES (84573, 84572);
INSERT INTO `creature_linked_respawn` VALUES (84592, 84572);
INSERT INTO `creature_linked_respawn` VALUES (84590, 84572);
INSERT INTO `creature_linked_respawn` VALUES (84558, 84572);
INSERT INTO `creature_linked_respawn` VALUES (84559, 84572);
INSERT INTO `creature_linked_respawn` VALUES (84560, 84572);
INSERT INTO `creature_linked_respawn` VALUES (84567, 84572);
INSERT INTO `creature_linked_respawn` VALUES (84566, 84572);
INSERT INTO `creature_linked_respawn` VALUES (84568, 84572);
INSERT INTO `creature_linked_respawn` VALUES (84565, 84572);
INSERT INTO `creature_linked_respawn` VALUES (84569, 84572);
INSERT INTO `creature_linked_respawn` VALUES (84564, 84572);
INSERT INTO `creature_linked_respawn` VALUES (84563, 84572);
INSERT INTO `creature_linked_respawn` VALUES (84570, 84572);
INSERT INTO `creature_linked_respawn` VALUES (84561, 84572);
INSERT INTO `creature_linked_respawn` VALUES (84562, 84572);
INSERT INTO `creature_linked_respawn` VALUES (84571, 84572);
INSERT INTO `creature_linked_respawn` VALUES (84635, 85780);
INSERT INTO `creature_linked_respawn` VALUES (84634, 85780);
INSERT INTO `creature_linked_respawn` VALUES (84628, 85780);
INSERT INTO `creature_linked_respawn` VALUES (84627, 85780);
INSERT INTO `creature_linked_respawn` VALUES (85775, 85780);
INSERT INTO `creature_linked_respawn` VALUES (85773, 85780);
INSERT INTO `creature_linked_respawn` VALUES (85779, 85780);
INSERT INTO `creature_linked_respawn` VALUES (85772, 85780);
INSERT INTO `creature_linked_respawn` VALUES (85759, 85780);
INSERT INTO `creature_linked_respawn` VALUES (85768, 85780);
INSERT INTO `creature_linked_respawn` VALUES (85767, 85780);
INSERT INTO `creature_linked_respawn` VALUES (85776, 85780);
INSERT INTO `creature_linked_respawn` VALUES (85777, 85780);
INSERT INTO `creature_linked_respawn` VALUES (85766, 85780);
INSERT INTO `creature_linked_respawn` VALUES (85758, 85780);
INSERT INTO `creature_linked_respawn` VALUES (85764, 85780);
INSERT INTO `creature_linked_respawn` VALUES (85778, 85780);
INSERT INTO `creature_linked_respawn` VALUES (85760, 85780);
INSERT INTO `creature_linked_respawn` VALUES (85757, 85780);
INSERT INTO `creature_linked_respawn` VALUES (85601, 85780);
INSERT INTO `creature_linked_respawn` VALUES (85609, 85780);
INSERT INTO `creature_linked_respawn` VALUES (85611, 85780);
INSERT INTO `creature_linked_respawn` VALUES (85612, 85780);
INSERT INTO `creature_linked_respawn` VALUES (85613, 85780);
INSERT INTO `creature_linked_respawn` VALUES (85616, 85780);
INSERT INTO `creature_linked_respawn` VALUES (85620, 85780);
INSERT INTO `creature_linked_respawn` VALUES (85756, 85780);
INSERT INTO `creature_linked_respawn` VALUES (85621, 85780);
INSERT INTO `creature_linked_respawn` VALUES (85622, 85780);
INSERT INTO `creature_linked_respawn` VALUES (85623, 85780);
INSERT INTO `creature_linked_respawn` VALUES (85625, 85780);
INSERT INTO `creature_linked_respawn` VALUES (85581, 85780);
INSERT INTO `creature_linked_respawn` VALUES (84840, 85780);
INSERT INTO `creature_linked_respawn` VALUES (84651, 85780);
INSERT INTO `creature_linked_respawn` VALUES (84652, 85780);
INSERT INTO `creature_linked_respawn` VALUES (84763, 85780);
INSERT INTO `creature_linked_respawn` VALUES (84762, 85780);
INSERT INTO `creature_linked_respawn` VALUES (84761, 85780);
INSERT INTO `creature_linked_respawn` VALUES (84760, 85780);
INSERT INTO `creature_linked_respawn` VALUES (84759, 85780);
INSERT INTO `creature_linked_respawn` VALUES (84691, 85780);
INSERT INTO `creature_linked_respawn` VALUES (84692, 85780);
INSERT INTO `creature_linked_respawn` VALUES (84689, 85780);
INSERT INTO `creature_linked_respawn` VALUES (84688, 85780);
INSERT INTO `creature_linked_respawn` VALUES (84655, 85780);
INSERT INTO `creature_linked_respawn` VALUES (84654, 85780);
INSERT INTO `creature_linked_respawn` VALUES (84653, 85780);
INSERT INTO `creature_linked_respawn` VALUES (84599, 85780);
INSERT INTO `creature_linked_respawn` VALUES (84601, 85780);
INSERT INTO `creature_linked_respawn` VALUES (84603, 85780);
INSERT INTO `creature_linked_respawn` VALUES (84602, 85780);
INSERT INTO `creature_linked_respawn` VALUES (84605, 85780);
INSERT INTO `creature_linked_respawn` VALUES (84606, 85780);
INSERT INTO `creature_linked_respawn` VALUES (84614, 85780);
INSERT INTO `creature_linked_respawn` VALUES (84615, 85780);
INSERT INTO `creature_linked_respawn` VALUES (84616, 85780);
INSERT INTO `creature_linked_respawn` VALUES (84617, 85780);
INSERT INTO `creature_linked_respawn` VALUES (84618, 85780);
INSERT INTO `creature_linked_respawn` VALUES (84619, 85780);
INSERT INTO `creature_linked_respawn` VALUES (84624, 85780);
INSERT INTO `creature_linked_respawn` VALUES (84598, 85780);
INSERT INTO `creature_linked_respawn` VALUES (84623, 85780);
INSERT INTO `creature_linked_respawn` VALUES (84625, 85780);
INSERT INTO `creature_linked_respawn` VALUES (84650, 85784);
INSERT INTO `creature_linked_respawn` VALUES (84648, 85784);
INSERT INTO `creature_linked_respawn` VALUES (84639, 85784);
INSERT INTO `creature_linked_respawn` VALUES (56647, 56683);
INSERT INTO `creature_linked_respawn` VALUES (56649, 56683);
INSERT INTO `creature_linked_respawn` VALUES (56646, 56683);
INSERT INTO `creature_linked_respawn` VALUES (56644, 56683);
INSERT INTO `creature_linked_respawn` VALUES (56648, 56683);
INSERT INTO `creature_linked_respawn` VALUES (56652, 56683);
INSERT INTO `creature_linked_respawn` VALUES (56650, 56683);
INSERT INTO `creature_linked_respawn` VALUES (56653, 56683);
INSERT INTO `creature_linked_respawn` VALUES (56654, 56683);
INSERT INTO `creature_linked_respawn` VALUES (56651, 56683);
INSERT INTO `creature_linked_respawn` VALUES (56642, 56683);
INSERT INTO `creature_linked_respawn` VALUES (56639, 56683);
INSERT INTO `creature_linked_respawn` VALUES (56640, 56683);
INSERT INTO `creature_linked_respawn` VALUES (56641, 56683);
INSERT INTO `creature_linked_respawn` VALUES (56643, 56683);
INSERT INTO `creature_linked_respawn` VALUES (56632, 56683);
INSERT INTO `creature_linked_respawn` VALUES (56629, 56683);
INSERT INTO `creature_linked_respawn` VALUES (56630, 56683);
INSERT INTO `creature_linked_respawn` VALUES (56631, 56683);
INSERT INTO `creature_linked_respawn` VALUES (56633, 56683);
INSERT INTO `creature_linked_respawn` VALUES (56636, 56683);
INSERT INTO `creature_linked_respawn` VALUES (56638, 56683);
INSERT INTO `creature_linked_respawn` VALUES (56635, 56683);
INSERT INTO `creature_linked_respawn` VALUES (56637, 56683);
INSERT INTO `creature_linked_respawn` VALUES (56634, 56683);
INSERT INTO `creature_linked_respawn` VALUES (56607, 56605);
INSERT INTO `creature_linked_respawn` VALUES (56606, 56605);
INSERT INTO `creature_linked_respawn` VALUES (56598, 56605);
INSERT INTO `creature_linked_respawn` VALUES (56601, 56605);
INSERT INTO `creature_linked_respawn` VALUES (56595, 56605);
INSERT INTO `creature_linked_respawn` VALUES (56594, 56605);
INSERT INTO `creature_linked_respawn` VALUES (56596, 56605);
INSERT INTO `creature_linked_respawn` VALUES (56599, 56605);
INSERT INTO `creature_linked_respawn` VALUES (56602, 56605);
INSERT INTO `creature_linked_respawn` VALUES (56597, 56605);
INSERT INTO `creature_linked_respawn` VALUES (56603, 56605);
INSERT INTO `creature_linked_respawn` VALUES (56604, 56605);
INSERT INTO `creature_linked_respawn` VALUES (56570, 56605);
INSERT INTO `creature_linked_respawn` VALUES (56567, 56605);
INSERT INTO `creature_linked_respawn` VALUES (56568, 56605);
INSERT INTO `creature_linked_respawn` VALUES (56573, 56605);
INSERT INTO `creature_linked_respawn` VALUES (56569, 56605);
INSERT INTO `creature_linked_respawn` VALUES (56571, 56605);
INSERT INTO `creature_linked_respawn` VALUES (56566, 56605);
INSERT INTO `creature_linked_respawn` VALUES (56565, 56605);
INSERT INTO `creature_linked_respawn` VALUES (56564, 56605);
INSERT INTO `creature_linked_respawn` VALUES (56572, 56605);
INSERT INTO `creature_linked_respawn` VALUES (56562, 56605);
INSERT INTO `creature_linked_respawn` VALUES (56558, 56605);
INSERT INTO `creature_linked_respawn` VALUES (56563, 56605);
INSERT INTO `creature_linked_respawn` VALUES (56559, 56605);
INSERT INTO `creature_linked_respawn` VALUES (56560, 56605);
INSERT INTO `creature_linked_respawn` VALUES (56557, 56605);
INSERT INTO `creature_linked_respawn` VALUES (56549, 56605);
INSERT INTO `creature_linked_respawn` VALUES (56555, 56605);
INSERT INTO `creature_linked_respawn` VALUES (56556, 56605);
INSERT INTO `creature_linked_respawn` VALUES (56582, 56605);
INSERT INTO `creature_linked_respawn` VALUES (56579, 56605);
INSERT INTO `creature_linked_respawn` VALUES (56583, 56605);
INSERT INTO `creature_linked_respawn` VALUES (56578, 56605);
INSERT INTO `creature_linked_respawn` VALUES (56580, 56605);
INSERT INTO `creature_linked_respawn` VALUES (56581, 56605);
INSERT INTO `creature_linked_respawn` VALUES (56577, 56605);
INSERT INTO `creature_linked_respawn` VALUES (56576, 56605);
INSERT INTO `creature_linked_respawn` VALUES (56575, 56605);
INSERT INTO `creature_linked_respawn` VALUES (56574, 56605);
INSERT INTO `creature_linked_respawn` VALUES (56656, 56605);
INSERT INTO `creature_linked_respawn` VALUES (56591, 56605);
INSERT INTO `creature_linked_respawn` VALUES (56592, 56605);
INSERT INTO `creature_linked_respawn` VALUES (56593, 56605);
INSERT INTO `creature_linked_respawn` VALUES (56590, 56605);
INSERT INTO `creature_linked_respawn` VALUES (56584, 56605);
INSERT INTO `creature_linked_respawn` VALUES (56589, 56605);
INSERT INTO `creature_linked_respawn` VALUES (56587, 56605);
INSERT INTO `creature_linked_respawn` VALUES (56665, 56605);
INSERT INTO `creature_linked_respawn` VALUES (56588, 56605);
INSERT INTO `creature_linked_respawn` VALUES (56661, 56605);
INSERT INTO `creature_linked_respawn` VALUES (56743, 56605);
INSERT INTO `creature_linked_respawn` VALUES (56736, 56605);
INSERT INTO `creature_linked_respawn` VALUES (91293, 56605);
INSERT INTO `creature_linked_respawn` VALUES (56739, 56737);
INSERT INTO `creature_linked_respawn` VALUES (56738, 56737);
INSERT INTO `creature_linked_respawn` VALUES (91285, 56737);
INSERT INTO `creature_linked_respawn` VALUES (91282, 56737);
INSERT INTO `creature_linked_respawn` VALUES (56709, 56737);
INSERT INTO `creature_linked_respawn` VALUES (56669, 56609);
INSERT INTO `creature_linked_respawn` VALUES (56708, 56737);
INSERT INTO `creature_linked_respawn` VALUES (91284, 56737);
INSERT INTO `creature_linked_respawn` VALUES (56788, 56737);
INSERT INTO `creature_linked_respawn` VALUES (91281, 56609);
INSERT INTO `creature_linked_respawn` VALUES (56664, 56737);
INSERT INTO `creature_linked_respawn` VALUES (56710, 56609);
INSERT INTO `creature_linked_respawn` VALUES (56711, 56609);
INSERT INTO `creature_linked_respawn` VALUES (56779, 56737);
INSERT INTO `creature_linked_respawn` VALUES (56707, 56737);
INSERT INTO `creature_linked_respawn` VALUES (56706, 56737);
INSERT INTO `creature_linked_respawn` VALUES (56703, 56737);
INSERT INTO `creature_linked_respawn` VALUES (56674, 56737);
INSERT INTO `creature_linked_respawn` VALUES (56658, 56737);
INSERT INTO `creature_linked_respawn` VALUES (56721, 56737);
INSERT INTO `creature_linked_respawn` VALUES (91283, 56737);
INSERT INTO `creature_linked_respawn` VALUES (91273, 56737);
INSERT INTO `creature_linked_respawn` VALUES (91280, 56737);
INSERT INTO `creature_linked_respawn` VALUES (56675, 56737);
INSERT INTO `creature_linked_respawn` VALUES (56800, 56737);
INSERT INTO `creature_linked_respawn` VALUES (91256, 56737);
INSERT INTO `creature_linked_respawn` VALUES (56662, 56737);
INSERT INTO `creature_linked_respawn` VALUES (56796, 56737);
INSERT INTO `creature_linked_respawn` VALUES (56786, 56737);
INSERT INTO `creature_linked_respawn` VALUES (91274, 56737);
INSERT INTO `creature_linked_respawn` VALUES (56733, 56737);
INSERT INTO `creature_linked_respawn` VALUES (56704, 56737);
INSERT INTO `creature_linked_respawn` VALUES (56705, 56737);
INSERT INTO `creature_linked_respawn` VALUES (56715, 56737);
INSERT INTO `creature_linked_respawn` VALUES (56714, 56737);
INSERT INTO `creature_linked_respawn` VALUES (56777, 56737);
INSERT INTO `creature_linked_respawn` VALUES (56628, 56609);
INSERT INTO `creature_linked_respawn` VALUES (56616, 56609);
INSERT INTO `creature_linked_respawn` VALUES (56620, 56609);
INSERT INTO `creature_linked_respawn` VALUES (56622, 56609);
INSERT INTO `creature_linked_respawn` VALUES (56626, 56609);
INSERT INTO `creature_linked_respawn` VALUES (56610, 56609);
INSERT INTO `creature_linked_respawn` VALUES (56672, 56609);
INSERT INTO `creature_linked_respawn` VALUES (56701, 56609);
INSERT INTO `creature_linked_respawn` VALUES (56700, 56609);
INSERT INTO `creature_linked_respawn` VALUES (56727, 56609);
INSERT INTO `creature_linked_respawn` VALUES (56667, 56609);
INSERT INTO `creature_linked_respawn` VALUES (56673, 56609);
INSERT INTO `creature_linked_respawn` VALUES (56778, 56609);
INSERT INTO `creature_linked_respawn` VALUES (56712, 56609);
INSERT INTO `creature_linked_respawn` VALUES (56713, 56609);
INSERT INTO `creature_linked_respawn` VALUES (56780, 56609);
INSERT INTO `creature_linked_respawn` VALUES (56719, 56609);
INSERT INTO `creature_linked_respawn` VALUES (56718, 56609);
INSERT INTO `creature_linked_respawn` VALUES (56791, 56609);
INSERT INTO `creature_linked_respawn` VALUES (56734, 56609);
INSERT INTO `creature_linked_respawn` VALUES (56787, 56655);
INSERT INTO `creature_linked_respawn` VALUES (91266, 56655);
INSERT INTO `creature_linked_respawn` VALUES (56671, 56608);
INSERT INTO `creature_linked_respawn` VALUES (91267, 56655);
INSERT INTO `creature_linked_respawn` VALUES (91265, 56655);
INSERT INTO `creature_linked_respawn` VALUES (56782, 56655);
INSERT INTO `creature_linked_respawn` VALUES (56783, 56655);
INSERT INTO `creature_linked_respawn` VALUES (56781, 56655);
INSERT INTO `creature_linked_respawn` VALUES (56789, 56655);
INSERT INTO `creature_linked_respawn` VALUES (56666, 56655);
INSERT INTO `creature_linked_respawn` VALUES (56735, 56655);
INSERT INTO `creature_linked_respawn` VALUES (56722, 56655);
INSERT INTO `creature_linked_respawn` VALUES (56723, 56655);
INSERT INTO `creature_linked_respawn` VALUES (56724, 56655);
INSERT INTO `creature_linked_respawn` VALUES (91279, 56655);
INSERT INTO `creature_linked_respawn` VALUES (91278, 56655);
INSERT INTO `creature_linked_respawn` VALUES (91277, 56655);
INSERT INTO `creature_linked_respawn` VALUES (91289, 56655);
INSERT INTO `creature_linked_respawn` VALUES (91288, 56655);
INSERT INTO `creature_linked_respawn` VALUES (91286, 56655);
INSERT INTO `creature_linked_respawn` VALUES (91287, 56655);
INSERT INTO `creature_linked_respawn` VALUES (91262, 56655);
INSERT INTO `creature_linked_respawn` VALUES (91263, 56655);
INSERT INTO `creature_linked_respawn` VALUES (91264, 56655);
INSERT INTO `creature_linked_respawn` VALUES (91261, 56655);
INSERT INTO `creature_linked_respawn` VALUES (91291, 56655);
INSERT INTO `creature_linked_respawn` VALUES (91290, 56655);
INSERT INTO `creature_linked_respawn` VALUES (91292, 56655);
INSERT INTO `creature_linked_respawn` VALUES (91271, 56655);
INSERT INTO `creature_linked_respawn` VALUES (91270, 56655);
INSERT INTO `creature_linked_respawn` VALUES (91269, 56655);
INSERT INTO `creature_linked_respawn` VALUES (91268, 56655);
INSERT INTO `creature_linked_respawn` VALUES (56670, 56608);
INSERT INTO `creature_linked_respawn` VALUES (56668, 56677);
INSERT INTO `creature_linked_respawn` VALUES (56682, 56677);
INSERT INTO `creature_linked_respawn` VALUES (56679, 56677);
INSERT INTO `creature_linked_respawn` VALUES (56678, 56677);
INSERT INTO `creature_linked_respawn` VALUES (56681, 56677);
INSERT INTO `creature_linked_respawn` VALUES (56740, 56677);
INSERT INTO `creature_linked_respawn` VALUES (91257, 56677);
INSERT INTO `creature_linked_respawn` VALUES (91258, 56677);
INSERT INTO `creature_linked_respawn` VALUES (91259, 56677);
INSERT INTO `creature_linked_respawn` VALUES (91260, 56677);
INSERT INTO `creature_linked_respawn` VALUES (91272, 56677);
INSERT INTO `creature_linked_respawn` VALUES (56742, 56677);
INSERT INTO `creature_linked_respawn` VALUES (56785, 56677);
INSERT INTO `creature_linked_respawn` VALUES (56732, 56677);
INSERT INTO `creature_linked_respawn` VALUES (56731, 56677);
INSERT INTO `creature_linked_respawn` VALUES (56729, 56677);
INSERT INTO `creature_linked_respawn` VALUES (56730, 56677);
INSERT INTO `creature_linked_respawn` VALUES (56794, 56677);
INSERT INTO `creature_linked_respawn` VALUES (56795, 56677);
INSERT INTO `creature_linked_respawn` VALUES (56792, 56677);
INSERT INTO `creature_linked_respawn` VALUES (56793, 56677);
INSERT INTO `creature_linked_respawn` VALUES (91276, 56677);
INSERT INTO `creature_linked_respawn` VALUES (56749, 56677);
INSERT INTO `creature_linked_respawn` VALUES (56745, 56677);
INSERT INTO `creature_linked_respawn` VALUES (56699, 56684);
INSERT INTO `creature_linked_respawn` VALUES (56685, 56684);
INSERT INTO `creature_linked_respawn` VALUES (56744, 56684);
INSERT INTO `creature_linked_respawn` VALUES (56799, 56684);
INSERT INTO `creature_linked_respawn` VALUES (56797, 56684);
INSERT INTO `creature_linked_respawn` VALUES (56798, 56684);
INSERT INTO `creature_linked_respawn` VALUES (56790, 56684);
INSERT INTO `creature_linked_respawn` VALUES (56784, 56684);
INSERT INTO `creature_linked_respawn` VALUES (56676, 56684);
INSERT INTO `creature_linked_respawn` VALUES (56775, 56684);
INSERT INTO `creature_linked_respawn` VALUES (56776, 56684);
INSERT INTO `creature_linked_respawn` VALUES (56751, 56684);
INSERT INTO `creature_linked_respawn` VALUES (56750, 56684);
INSERT INTO `creature_linked_respawn` VALUES (91275, 56684);
INSERT INTO `creature_linked_respawn` VALUES (56659, 56684);