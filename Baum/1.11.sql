-- -----------------------------------------------------
-- 	MC-Entertainment                               --
--	Databasefix by Baum UPDATE 1.11 [03.05.2010]   --
--	for mc-wow [Lennix]                            --
-- -----------------------------------------------------

-- ---------------------------------------------------------
-- Quest - Sicherung der Versorgungslinien nun annehmbar --
-- ---------------------------------------------------------
UPDATE `quest_template` SET `PrevQuestId` = '0' WHERE `quest_template`.`entry` =8280 LIMIT 1 ;

-- ------------------------------------------------
-- Quest - Lards vergessene Brotzeit nun lösbar --
-- ------------------------------------------------
DELETE from `creature_loot_template` WHERE item = 19034;
DELETE from `gameobject_loot_template` WHERE entry = 19034;
DELETE from `creature` WHERE guid = 377037;
DELETE from `creature` WHERE guid = 377038;
DELETE from `creature` WHERE guid = 377039; 
UPDATE `gameobject_template` SET `type` = '3',
`data1` = '19034',
`data2` = '0',
`data3` = '0',
`flags` =  '4' WHERE `gameobject_template`.`entry` =179910 LIMIT 1 ;
INSERT INTO `gameobject_loot_template` VALUES 
('19034', '19034', '-100', '0', '1', '1', '0', '0', '0');
INSERT INTO `creature` VALUES
(377037, 14748, 0, 0, 0, 409.303, -4828.48, 10.5791, 1.79154, 200, 5, 0, 2934, 0, 0, 0),
(377038, 7809, 0, 0, 0, 410.866, -4826.92, 10.9057, 3.10536, 200, 5, 0, 2832, 0, 0, 0),
(377039, 7809, 0, 0, 0, 407.339, -4827.69, 10.3551, 0.442854, 200, 5, 0, 2832, 0, 0, 0);

-- ---------------------------------------------
-- Der Fisch "Winterkalmar" ist nun Angelbar --
-- ---------------------------------------------
delete from `fishing_loot_template` where item = 13755; 
INSERT INTO `fishing_loot_template` VALUES 
('1230', '13755', '10', '0', '1', '1', '0', '0', '0'),
('1231', '13755', '10', '0', '1', '1', '0', '0', '0'),
('1228', '13755', '10', '0', '1', '1', '0', '0', '0'),
('1940', '13755', '10', '0', '1', '1', '0', '0', '0'),
('1336', '13755', '10', '0', '1', '1', '0', '0', '0'),
('988', '13755', '10', '0', '1', '1', '0', '0', '0'),
('1256', '13755', '10', '0', '1', '1', '0', '0', '0'),
('986', '13755', '10', '0', '1', '1', '0', '0', '0'),
('977', '13755', '10', '0', '1', '1', '0', '0', '0'),
('1102', '13755', '10', '0', '1', '1', '0', '0', '0'),
('3138', '13755', '10', '0', '1', '1', '0', '0', '0'),
('1226', '13755', '10', '0', '1', '1', '0', '0', '0');

-- --------------------------------------
-- Quest - Gordunni Cobalt nun lösbar --
-- --------------------------------------
DELETE from `gameobject` WHERE id = 144064;
INSERT INTO `gameobject`  VALUES
(306973, 144064, 1, -3907.05, 180.45, 115.488, 2.83498, 0, 0, 0.988271, 0.152708, 25, 0, 1),
(306948, 144064, 1, -3881.07, 139.906, 123.976, 0.0782291, 0, 0, 0.0391046, 0.999235, 25, 0, 1),
(306898, 144064, 1, -3893.19, 137.561, 125.437, 2.73603, 0, 0, 0.97951, 0.201396, 25, 0, 1),
(306341, 144064, 1, -3957.66, 144.374, 112.274, 4.30743, 0, 0, 0.834861, -0.550461, 25, 0, 1),
(306342, 144064, 1, -3961.32, 139.053, 112.142, 3.88724, 0, 0, 0.931303, -0.364245, 25, 0, 1),
(306873, 144064, 1, -3966.99, 128.577, 109.997, 1.02081, 0, 0, 0.488529, 0.872548, 25, 0, 1),
(306874, 144064, 1, -3968.64, 118.715, 110.017, 4.48442, 0, 0, 0.782944, -0.622092, 25, 0, 1),
(306876, 144064, 1, -3914.15, 195.694, 119.872, 3.27883, 0, 0, 0.997647, -0.0685668, 25, 0, 1),
(306877, 144064, 1, -3913.56, 191.079, 120.109, 4.42156, 0, 0, 0.802106, -0.597182, 25, 0, 1),
(306878, 144064, 1, -3913.23, 187.806, 120.092, 4.81426, 0, 0, 0.670189, -0.74219, 25, 0, 1),
(306879, 144064, 1, -3911.1, 125.896, 132.649, 3.56547, 0, 0, 0.977624, -0.210358, 25, 0, 1),
(306880, 144064, 1, -3921.68, 121.126, 132.439, 3.56547, 0, 0, 0.977624, -0.210358, 25, 0, 1),
(306881, 144064, 1, -3914.56, 172.937, 111.707, 3.17276, 0, 0, 0.999879, -0.0155822, 25, 0, 1),
(306882, 144064, 1, -3889.54, 137.762, 125.463, 3.60865, 0, 0, 0.972856, -0.23141, 25, 0, 1),
(306883, 144064, 1, -3901.98, 123.254, 131.856, 5.49751, 0, 0, 0.382811, -0.923826, 25, 0, 1),
(306976, 144064, 1, -3961.92, 192.875, 102.02, 4.99483, 0, 0, 0.60054, -0.799595, 25, 0, 1),
(306977, 144064, 1, -3931.33, 110.729, 131.719, 2.59681, 0, 0, 0.96313, 0.269036, 25, 0, 1),
(306978, 144064, 1, -3929.47, 195.55, 105.803, 2.12871, 0, 0, 0.874476, 0.485069, 25, 0, 1);

-- -------------------------------------------------------------
-- Zul'Gurub - Quest for rewards - Only Available for your class
-- -------------------------------------------------------------
UPDATE `quest_template` SET `SkillOrClass` = '-2' WHERE `quest_template`.`entry` =8053 LIMIT 1 ;
UPDATE `quest_template` SET `SkillOrClass` = '-2' WHERE `quest_template`.`entry` =8054 LIMIT 1 ;
UPDATE `quest_template` SET `SkillOrClass` = '-2' WHERE `quest_template`.`entry` =8055 LIMIT 1 ;
UPDATE `quest_template` SET `SkillOrClass` = '-7' WHERE `quest_template`.`entry` =8056 LIMIT 1 ;
UPDATE `quest_template` SET `SkillOrClass` = '-11' WHERE `quest_template`.`entry` =8057 LIMIT 1 ;
UPDATE `quest_template` SET `SkillOrClass` = '-1' WHERE `quest_template`.`entry` =8058 LIMIT 1 ;
UPDATE `quest_template` SET `SkillOrClass` = '-9' WHERE `quest_template`.`entry` =8059 LIMIT 1 ;
UPDATE `quest_template` SET `SkillOrClass` = '-8' WHERE `quest_template`.`entry` =8060 LIMIT 1 ;
UPDATE `quest_template` SET `SkillOrClass` = '-5' WHERE `quest_template`.`entry` =8061 LIMIT 1 ;
UPDATE `quest_template` SET `SkillOrClass` = '-3' WHERE `quest_template`.`entry` =8062 LIMIT 1 ;
UPDATE `quest_template` SET `SkillOrClass` = '-4' WHERE `quest_template`.`entry` =8063 LIMIT 1 ;
UPDATE `quest_template` SET `SkillOrClass` = '-11' WHERE `quest_template`.`entry` =8064 LIMIT 1 ;
UPDATE `quest_template` SET `SkillOrClass` = '-11' WHERE `quest_template`.`entry` =8065 LIMIT 1 ;
UPDATE `quest_template` SET `SkillOrClass` = '-3' WHERE `quest_template`.`entry` =8066 LIMIT 1 ;
UPDATE `quest_template` SET `SkillOrClass` = '-3' WHERE `quest_template`.`entry` =8067 LIMIT 1 ;
UPDATE `quest_template` SET `SkillOrClass` = '-8' WHERE `quest_template`.`entry` =8068 LIMIT 1 ;
UPDATE `quest_template` SET `SkillOrClass` = '-8' WHERE `quest_template`.`entry` =8069 LIMIT 1 ;
UPDATE `quest_template` SET `SkillOrClass` = '-5' WHERE `quest_template`.`entry` =8070 LIMIT 1 ;
UPDATE `quest_template` SET `SkillOrClass` = '-5' WHERE `quest_template`.`entry` =8071 LIMIT 1 ;
UPDATE `quest_template` SET `SkillOrClass` = '-4' WHERE `quest_template`.`entry` =8072 LIMIT 1 ;
UPDATE `quest_template` SET `SkillOrClass` = '-4' WHERE `quest_template`.`entry` =8073 LIMIT 1 ;
UPDATE `quest_template` SET `SkillOrClass` = '-7' WHERE `quest_template`.`entry` =8074 LIMIT 1 ;
UPDATE `quest_template` SET `SkillOrClass` = '-7' WHERE `quest_template`.`entry` =8075 LIMIT 1 ;
UPDATE `quest_template` SET `SkillOrClass` = '-9' WHERE `quest_template`.`entry` =8076 LIMIT 1 ;
UPDATE `quest_template` SET `SkillOrClass` = '-9' WHERE `quest_template`.`entry` =8077 LIMIT 1 ;
UPDATE `quest_template` SET `SkillOrClass` = '-1' WHERE `quest_template`.`entry` =8078 LIMIT 1 ;
UPDATE `quest_template` SET `SkillOrClass` = '-1' WHERE `quest_template`.`entry` =8079 LIMIT 1 ;
UPDATE `quest_template` SET `SkillOrClass` = '-8' WHERE `quest_template`.`entry` =8101 LIMIT 1 ;
UPDATE `quest_template` SET `SkillOrClass` = '-8' WHERE `quest_template`.`entry` =8102 LIMIT 1 ;
UPDATE `quest_template` SET `SkillOrClass` = '-8' WHERE `quest_template`.`entry` =8103 LIMIT 1 ;
UPDATE `quest_template` SET `SkillOrClass` = '-8' WHERE `quest_template`.`entry` =8104 LIMIT 1 ;
UPDATE `quest_template` SET `SkillOrClass` = '-5' WHERE `quest_template`.`entry` =8049 LIMIT 1 ;
UPDATE `quest_template` SET `SkillOrClass` = '-5' WHERE `quest_template`.`entry` =8050 LIMIT 1 ;
UPDATE `quest_template` SET `SkillOrClass` = '-5' WHERE `quest_template`.`entry` =8051 LIMIT 1 ;
UPDATE `quest_template` SET `SkillOrClass` = '-5' WHERE `quest_template`.`entry` =8052 LIMIT 1 ;
UPDATE `quest_template` SET `SkillOrClass` = '-9' WHERE `quest_template`.`entry` =8106 LIMIT 1 ;
UPDATE `quest_template` SET `SkillOrClass` = '-9' WHERE `quest_template`.`entry` =8107 LIMIT 1 ;
UPDATE `quest_template` SET `SkillOrClass` = '-9' WHERE `quest_template`.`entry` =8108 LIMIT 1 ;
UPDATE `quest_template` SET `SkillOrClass` = '-9' WHERE `quest_template`.`entry` =8109 LIMIT 1 ;
UPDATE `quest_template` SET `SkillOrClass` = '-11' WHERE `quest_template`.`entry` =8110 LIMIT 1 ;
UPDATE `quest_template` SET `SkillOrClass` = '-11' WHERE `quest_template`.`entry` =8111 LIMIT 1 ;
UPDATE `quest_template` SET `SkillOrClass` = '-11' WHERE `quest_template`.`entry` =8112 LIMIT 1 ;
UPDATE `quest_template` SET `SkillOrClass` = '-11' WHERE `quest_template`.`entry` =8113 LIMIT 1 ;
UPDATE `quest_template` SET `SkillOrClass` = '-7' WHERE `quest_template`.`entry` =8116 LIMIT 1 ;
UPDATE `quest_template` SET `SkillOrClass` = '-7' WHERE `quest_template`.`entry` =8117 LIMIT 1 ;
UPDATE `quest_template` SET `SkillOrClass` = '-7' WHERE `quest_template`.`entry` =8118 LIMIT 1 ;
UPDATE `quest_template` SET `SkillOrClass` = '-7' WHERE `quest_template`.`entry` =8119 LIMIT 1 ;
UPDATE `quest_template` SET `SkillOrClass` = '-1' WHERE `quest_template`.`entry` =8041 LIMIT 1 ;
UPDATE `quest_template` SET `SkillOrClass` = '-1' WHERE `quest_template`.`entry` =8042 LIMIT 1 ;
UPDATE `quest_template` SET `SkillOrClass` = '-1' WHERE `quest_template`.`entry` =8043 LIMIT 1 ;
UPDATE `quest_template` SET `SkillOrClass` = '-1' WHERE `quest_template`.`entry` =8044 LIMIT 1 ;
UPDATE `quest_template` SET `SkillOrClass` = '-2' WHERE `quest_template`.`entry` =8045 LIMIT 1 ;
UPDATE `quest_template` SET `SkillOrClass` = '-2' WHERE `quest_template`.`entry` =8046 LIMIT 1 ;
UPDATE `quest_template` SET `SkillOrClass` = '-2' WHERE `quest_template`.`entry` =8047 LIMIT 1 ;
UPDATE `quest_template` SET `SkillOrClass` = '-2' WHERE `quest_template`.`entry` =8048 LIMIT 1 ;
UPDATE `quest_template` SET `SkillOrClass` = '-4' WHERE `quest_template`.`entry` =8141 LIMIT 1 ;
UPDATE `quest_template` SET `SkillOrClass` = '-4' WHERE `quest_template`.`entry` =8142 LIMIT 1 ;
UPDATE `quest_template` SET `SkillOrClass` = '-4' WHERE `quest_template`.`entry` =8143 LIMIT 1 ;
UPDATE `quest_template` SET `SkillOrClass` = '-4' WHERE `quest_template`.`entry` =8144 LIMIT 1 ;
UPDATE `quest_template` SET `SkillOrClass` = '-3' WHERE `quest_template`.`entry` =8145 LIMIT 1 ;
UPDATE `quest_template` SET `SkillOrClass` = '-3' WHERE `quest_template`.`entry` =8146 LIMIT 1 ;
UPDATE `quest_template` SET `SkillOrClass` = '-3' WHERE `quest_template`.`entry` =8147 LIMIT 1 ;
UPDATE `quest_template` SET `SkillOrClass` = '-3' WHERE `quest_template`.`entry` =8148 LIMIT 1 ;







