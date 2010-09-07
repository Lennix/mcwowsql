-- ---------------------
-- majordomo trigger --
-- ---------------------
DELETE from creature_template WHERE entry = 383725;
INSERT INTO `creature_template` VALUES (383725, 0, 0, 0, 1126, 0, 'Majordomo Executus', '0', 0, 1, 1, 8, 8, 0, 0, 0, 35, 35, 0, 1, 1.14286, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 1, 0, 0, 130, '');
DELETE from creature WHERE guid = 383725;
DELETE from creature WHERE guid = 383888;
INSERT INTO `creature` VALUES (383725, 383725, 409, 0, 0, 753.814, -1193.78, -118.397, 2.7085, 25, 5, 0, 8, 0, 0, 0);
INSERT INTO `creature` VALUES (383888, 383725, 409, 0, 0, 841.941, -832.391, -231.926, 4.42719, 25, 5, 0, 8, 0, 0, 0);

-- ------------------------------
-- runen mit script verküpfen --
-- ------------------------------
UPDATE `gameobject_template` SET `ScriptName` = 'go_runes_of_moltencore' WHERE `gameobject_template`.`entry` =176951 LIMIT 1 ;
UPDATE `gameobject_template` SET `ScriptName` = 'go_runes_of_moltencore' WHERE `gameobject_template`.`entry` =176952 LIMIT 1 ;
UPDATE `gameobject_template` SET `ScriptName` = 'go_runes_of_moltencore' WHERE `gameobject_template`.`entry` =176953 LIMIT 1 ;
UPDATE `gameobject_template` SET `ScriptName` = 'go_runes_of_moltencore' WHERE `gameobject_template`.`entry` =176954 LIMIT 1 ;
UPDATE `gameobject_template` SET `ScriptName` = 'go_runes_of_moltencore' WHERE `gameobject_template`.`entry` =176955 LIMIT 1 ;
UPDATE `gameobject_template` SET `ScriptName` = 'go_runes_of_moltencore' WHERE `gameobject_template`.`entry` =176956 LIMIT 1 ;
UPDATE `gameobject_template` SET `ScriptName` = 'go_runes_of_moltencore' WHERE `gameobject_template`.`entry` =176957 LIMIT 1 ;

-- ----------------------
-- MajorDomus Lootbox --
-- ----------------------
DELETE from gameobject where guid = 308223;
INSERT INTO `gameobject` VALUES (308223, 179703, 409, 759.264, -1167.09, -119.16, 3.51278, 0, 0, 0.982827, -0.184532, -25, 0, 1);

-- --------------------
-- Ragnaros löschen --
-- --------------------
DELETE from creature where guid = 227530;

-- -------------------------
-- Gehennas Adds löschen --
-- -------------------------
DELETE from creature where guid = 56738;
DELETE from creature where guid = 56739;

-- ---------------------
-- Garr Adds löschen --
-- ---------------------
DELETE from creature where guid = 56610;
DELETE from creature where guid = 56616;
DELETE from creature where guid = 56619;
DELETE from creature where guid = 56620;
DELETE from creature where guid = 56622;
DELETE from creature where guid = 56626;
DELETE from creature where guid = 56627;
DELETE from creature where guid = 56628;

-- -------------------------
-- Sulfuron Adds löschen --
-- -------------------------
DELETE from creature where guid = 56681;
DELETE from creature where guid = 56679;
DELETE from creature where guid = 56678;
DELETE from creature where guid = 56682;

-- -------------------------
-- Golemagg Adds löschen --
-- -------------------------
DELETE from creature where guid = 56685;
DELETE from creature where guid = 56699;

-- -------------------------
-- Lucifron Adds löschen --
-- -------------------------
DELETE from creature where guid = 56606;
DELETE from creature where guid = 56607;

-- -----------------------
-- Majordomo Hot Coals --
-- -----------------------
delete from gameobject_template where entry = 1112466; 
INSERT INTO `gameobject_template` VALUES
(1112466, 6, 0, 'Fire', 14, 0, 1, 0, 60, 10, 16144, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
delete from gameobject where guid = 308262;
INSERT INTO `gameobject` VALUES (308262, 1112466, 409, 737.225, -1176.58, -118.959, 3.80173, 0, 0, 0.94602, -0.324108, 25, 0, 1);

-- ---------------------------------------
-- Majordomo Adds mit Script verbinden --
-- ---------------------------------------
UPDATE creature_template SET `AIName` = '',
`ScriptName` = 'mob_flamewaker_heal' WHERE `creature_template`.`entry` =11663 LIMIT 1 ;
UPDATE creature_template SET `AIName` = '',
`ScriptName` = 'mob_flamewaker_elite' WHERE `creature_template`.`entry` =11664 LIMIT 1 ;

-- ------------------------------
-- Ragnaros LavaBurst Trigger --
-- ------------------------------
DELETE from creature_template WHERE entry = 384727;
INSERT INTO `creature_template` VALUES (384727, 0, 0, 0, 8909, 0, 'LavaBurst Trigger', '0', 0, 100, 100, 8000000, 8000000, 0, 0, 0, 91, 91, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 1, 0, 0, 130, '');
delete from creature where guid = 387170;
delete from creature where guid = 387174;
delete from creature where guid = 387182;
delete from creature where guid = 387180;
delete from creature where guid = 387172;
delete from creature where guid = 387176;
delete from creature where guid = 387178;
INSERT INTO `creature` VALUES (387170, 384727, 409, 0, 0, 820.816, -871.463, -225.626, 1.85236, 25, 5, 0, 550000, 70000, 0, 1);
INSERT INTO `creature` VALUES (387174, 384727, 409, 0, 0, 878.011, -831.047, -225.365, 0.438606, 25, 5, 0, 550000, 70000, 0, 1);
INSERT INTO `creature` VALUES (387182, 384727, 409, 0, 0, 823.413, -752.138, -225.75, 4.79118, 25, 5, 0, 550000, 70000, 0, 1);
INSERT INTO `creature` VALUES (387180, 384727, 409, 0, 0, 893.889, -793.192, -225.378, 2.13971, 25, 5, 0, 550000, 70000, 0, 1);
INSERT INTO `creature` VALUES (387172, 384727, 409, 0, 0, 856.011, -869.837, -225.481, 0.235189, 25, 5, 0, 550000, 70000, 0, 1);
INSERT INTO `creature` VALUES (387176, 384727, 409, 0, 0, 858.859, -795.649, -225.888, 1.80519, 25, 5, 0, 550000, 70000, 0, 1);
INSERT INTO `creature` VALUES (387178, 384727, 409, 0, 0, 808.055, -815.082, -225.438, 2.95027, 25, 5, 0, 550000, 70000, 0, 1);

-- ---------------
-- KickTrigger --
-- ---------------
DELETE from creature_template WHERE entry = 384728;
INSERT INTO `creature_template` VALUES (384728, 0, 0, 0, 10045, 0, 'Kick', '0', 0, 100, 100, 8000000, 8000000, 0, 0, 0, 91, 91, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 1, 0, 0, 2, '');
	
-- ---------------------
-- CoreHound Trigger --
-- ---------------------
DELETE from creature_template WHERE entry = 384729;
INSERT INTO `creature_template` VALUES (384729, 0, 0, 0, 10045, 0, 'CoreHound Trigger', '0', 0, 65, 65, 8000000, 8000000, 0, 0, 0, 54, 54, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 1, 0, 0, 128, 'CoreHoundTrigger');	
delete from creature where guid = 388222;
delete from creature where guid = 388218;
delete from creature where guid = 388220;
delete from creature where guid = 388226;
delete from creature where guid = 388224;
INSERT INTO `creature` VALUES (388222, 384729, 409, 0, 0, 1079.37, -972.815, -182.883, 6.22432, 25, 5, 0, 8000000, 0, 0, 0);
INSERT INTO `creature` VALUES (388218, 384729, 409, 0, 0, 993.741, -971.852, -181.133, 0.378204, 25, 5, 0, 8000000, 0, 0, 0);
INSERT INTO `creature` VALUES (388220, 384729, 409, 0, 0, 1035.91, -963.213, -179.855, 0.103984, 25, 5, 0, 8000000, 0, 0, 0);
INSERT INTO `creature` VALUES (388226, 384729, 409, 0, 0, 1088.88, -1020.34, -186.486, 4.03933, 25, 5, 0, 8000000, 0, 0, 0);
INSERT INTO `creature` VALUES (388224, 384729, 409, 0, 0, 1115.92, -992.053, -185.663, 5.96355, 25, 5, 0, 8000000, 0, 0, 0);

-- ------------------------------------------
-- Ragnaros und Geddon machen Feuerdamage --
-- ------------------------------------------
UPDATE creature_template SET `dmgschool` = 2
 WHERE `creature_template`.`entry` =11502 LIMIT 1 ;
UPDATE creature_template SET `dmgschool` = 2
 WHERE `creature_template`.`entry` =12056 LIMIT 1 ;
UPDATE creature_template SET `dmgschool` = 2
 WHERE `creature_template`.`entry` =12143 LIMIT 1 ;

-- --------------------------------------
-- Ragnaros Adds mit Script verbinden --
-- --------------------------------------
UPDATE creature_template SET `AIName` = '',
`ScriptName` = 'mob_SonOfFlame' WHERE `creature_template`.`entry` =12143 LIMIT 1 ;

													