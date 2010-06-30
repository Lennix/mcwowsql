-- -----------------------------------------------------
-- 	MC-Entertainment                               --
--	Databasefix by Baum UPDATE 1.18 [30.06.2010]   --
--	for mc-wow [Lennix]                            --
-- -----------------------------------------------------

DELETE FROM `gameobject` WHERE `guid` = 35790;
DELETE FROM `gameobject` WHERE `guid` = 16323161;
DELETE FROM `gameobject` WHERE `guid` = 16322870;
DELETE FROM `gameobject` WHERE `guid` = 16322812;
DELETE FROM `gameobject` WHERE `guid` = 16322589;
DELETE FROM `gameobject` WHERE `guid` = 16322788;
DELETE FROM `gameobject` WHERE `guid` = 16322808;
DELETE FROM `gameobject` WHERE `guid` = 16322668;
DELETE FROM `gameobject` WHERE `guid` = 16323261;
DELETE FROM `gameobject` WHERE `guid` = 16323262;
DELETE FROM `gameobject` WHERE `guid` = 16323263;
DELETE FROM `gameobject` WHERE `guid` = 16323264;
DELETE FROM `gameobject` WHERE `guid` = 16323265;
DELETE FROM `gameobject` WHERE `guid` = 16323266;
DELETE FROM `gameobject` WHERE `guid` = 16323267;
DELETE FROM `gameobject_scripts` WHERE datalong = 16323261;
DELETE FROM `gameobject_scripts` WHERE datalong = 16323262;
DELETE FROM `gameobject_scripts` WHERE datalong = 16323263;
DELETE FROM `gameobject_scripts` WHERE datalong = 16323264;
DELETE FROM `gameobject_scripts` WHERE datalong = 16323265;
DELETE FROM `gameobject_scripts` WHERE datalong = 16323266;
DELETE FROM `gameobject_scripts` WHERE datalong = 16323267;

UPDATE `gameobject_template` SET `size` = '0.6' WHERE `gameobject_template`.`entry` =175194 LIMIT 1 ;
UPDATE `gameobject_template` SET `size` = '0.6' WHERE `gameobject_template`.`entry` =175195 LIMIT 1 ;
UPDATE `gameobject_template` SET `size` = '0.6' WHERE `gameobject_template`.`entry` =175196 LIMIT 1 ;
UPDATE `gameobject_template` SET `size` = '0.6' WHERE `gameobject_template`.`entry` =175197 LIMIT 1 ;
UPDATE `gameobject_template` SET `size` = '0.6' WHERE `gameobject_template`.`entry` =175198 LIMIT 1 ;
UPDATE `gameobject_template` SET `size` = '0.6' WHERE `gameobject_template`.`entry` =175199 LIMIT 1 ;
UPDATE `gameobject_template` SET `size` = '0.6' WHERE `gameobject_template`.`entry` =175200 LIMIT 1 ;

UPDATE `gameobject_template` SET 
`faction` = '0',`data0` = '0',`data1` = '57' 
WHERE `gameobject_template`.`entry` =175194 LIMIT 1 ;
UPDATE `gameobject_template` SET 
`faction` = '0',`data0` = '0',`data1` = '57' 
WHERE `gameobject_template`.`entry` =175195 LIMIT 1 ;
UPDATE `gameobject_template` SET 
`faction` = '0',`data0` = '0',`data1` = '57' 
WHERE `gameobject_template`.`entry` =175196 LIMIT 1 ;
UPDATE `gameobject_template` SET 
`faction` = '0',`data0` = '0',`data1` = '57' 
WHERE `gameobject_template`.`entry` =175197 LIMIT 1 ;
UPDATE `gameobject_template` SET 
`faction` = '0',`data0` = '0',`data1` = '57' 
WHERE `gameobject_template`.`entry` =175198 LIMIT 1 ;
UPDATE `gameobject_template` SET 
`faction` = '0',`data0` = '0',`data1` = '57' 
WHERE `gameobject_template`.`entry` =175199 LIMIT 1 ;
UPDATE `gameobject_template` SET 
`faction` = '0',`data0` = '0',`data1` = '57' 
WHERE `gameobject_template`.`entry` =175200 LIMIT 1 ;

-- Runes --
INSERT INTO `gameobject` VALUES
(16323161, 175194, 229, 125.524, -340.426, 70.8639, 0.77414, 0, 0, 0.377477, 0.926019, 25, 0, 1),
(16322870, 175195, 229, 192.739, -258.471, 76.8483, 4.70268, 0, 0, 0.71053, -0.703667, 25, 0, 1),
(16322812, 175196, 229, 155.33, -353.032, 70.8468, 1.5829, 0, 0, 0.711373, 0.702815, 25, 0, 1),
(16322589, 175197, 229, 124.758, -298.067, 70.8639, 5.50774, 0, 0, 0.37808, -0.925773, 25, 0, 1),
(16322788, 175198, 229, 215.208, -334.68, 76.8483, 2.41543, 0, 0, 0.934808, 0.355155, 25, 0, 1),
(16322808, 175199, 229, 155.304, -286.107, 70.8639, 4.72233, 0, 0, 0.703583, -0.710613, 25, 0, 1),
(16322668, 175200, 229, 228.831, -301.502, 76.8483, 3.12075, 0, 0, 0.999946, 0.01042, 25, 0, 1);

-- Doors --
INSERT INTO `gameobject` VALUES
(16323261, 170577, 229, 216.551, -286.111, 76.9474, 6.26239, 0, 0, 0.0103991, -0.999946, 25, 0, 1),
(16323262, 170577, 229, 216.551, -286.111, 76.9474, 6.26239, 0, 0, 0.0103991, -0.999946, 25, 0, 1),
(16323263, 170577, 229, 216.551, -286.111, 76.9474, 6.26239, 0, 0, 0.0103991, -0.999946, 25, 0, 1),
(16323264, 170577, 229, 216.551, -286.111, 76.9474, 6.26239, 0, 0, 0.0103991, -0.999946, 25, 0, 1),
(16323265, 170577, 229, 216.551, -286.111, 76.9474, 6.26239, 0, 0, 0.0103991, -0.999946, 25, 0, 1),
(16323266, 170577, 229, 216.551, -286.111, 76.9474, 6.26239, 0, 0, 0.0103991, -0.999946, 25, 0, 1),
(16323267, 170577, 229, 216.551, -286.111, 76.9474, 6.26239, 0, 0, 0.0103991, -0.999946, 25, 0, 1);

-- push -> rune = open -> door --
INSERT INTO `gameobject_scripts` VALUES 
('16323161', '0', '11', '16323261', '999999', '0', '0', '0', '0', '0', '0', '0', '0'),
('16322870', '0', '11', '16323262', '999999', '0', '0', '0', '0', '0', '0', '0', '0'),
('16322812', '0', '11', '16323263', '999999', '0', '0', '0', '0', '0', '0', '0', '0'),
('16322589', '0', '11', '16323264', '999999', '0', '0', '0', '0', '0', '0', '0', '0'),
('16322788', '0', '11', '16323265', '999999', '0', '0', '0', '0', '0', '0', '0', '0'),
('16322808', '0', '11', '16323266', '999999', '0', '0', '0', '0', '0', '0', '0', '0'),
('16322668', '0', '11', '16323267', '999999', '0', '0', '0', '0', '0', '0', '0', '0');

-- ------------------------------------------------------ --
DELETE FROM `gameobject` WHERE `guid` = 16323390;
DELETE FROM `gameobject` WHERE `guid` = 16323392;
DELETE FROM `gameobject` WHERE `guid` = 16323394;
DELETE FROM `gameobject` WHERE `guid` = 16323396;
DELETE FROM `gameobject` WHERE `guid` = 16323398;
DELETE FROM `gameobject` WHERE `guid` = 16323400;
DELETE FROM `gameobject` WHERE `guid` = 16323402;
DELETE FROM `gameobject` WHERE `guid` = 16323517;
DELETE FROM gameobject_scripts WHERE id = 16323400;
DELETE FROM creature WHERE guid = 40453;

UPDATE `gameobject_template` SET `size` = '1.2' WHERE `gameobject_template`.`entry` =175266 LIMIT 1 ;
UPDATE `gameobject_template` SET `size` = '1.2' WHERE `gameobject_template`.`entry` =175267 LIMIT 1 ;
UPDATE `gameobject_template` SET `size` = '1.2' WHERE `gameobject_template`.`entry` =175268 LIMIT 1 ;
UPDATE `gameobject_template` SET `size` = '1.2' WHERE `gameobject_template`.`entry` =175269 LIMIT 1 ;
UPDATE `gameobject_template` SET `size` = '1.2' WHERE `gameobject_template`.`entry` =175270 LIMIT 1 ;
UPDATE `gameobject_template` SET `size` = '1.2' WHERE `gameobject_template`.`entry` =175271 LIMIT 1 ;
UPDATE `gameobject_template` SET `size` = '1.2' WHERE `gameobject_template`.`entry` =175272 LIMIT 1 ;

UPDATE `gameobject_template` SET 
`faction` = '0',`data0` = '0',`data1` = '57' 
WHERE `gameobject_template`.`entry` =175266 LIMIT 1 ;
UPDATE `gameobject_template` SET 
`faction` = '0',`data0` = '0',`data1` = '57' 
WHERE `gameobject_template`.`entry` =175267 LIMIT 1 ;
UPDATE `gameobject_template` SET 
`faction` = '0',`data0` = '0',`data1` = '57' 
WHERE `gameobject_template`.`entry` =175268 LIMIT 1 ;
UPDATE `gameobject_template` SET 
`faction` = '0',`data0` = '0',`data1` = '57' 
WHERE `gameobject_template`.`entry` =175269 LIMIT 1 ;
UPDATE `gameobject_template` SET 
`faction` = '0',`data0` = '0',`data1` = '57' 
WHERE `gameobject_template`.`entry` =175270 LIMIT 1 ;
UPDATE `gameobject_template` SET 
`faction` = '0',`data0` = '0',`data1` = '57' 
WHERE `gameobject_template`.`entry` =175271 LIMIT 1 ;
UPDATE `gameobject_template` SET 
`faction` = '0',`data0` = '0',`data1` = '57' 
WHERE `gameobject_template`.`entry` =175272 LIMIT 1 ;

INSERT INTO `gameobject` VALUES
(16323390, 175266, 229, 162.403, -276.816, 91.55, 3.091, 0, 0, 0.999689, 0.0249441, 25, 0, 1),
(16323392, 175267, 229, 162.348, -258.824, 91.4656, 3.125, 0, 0, 0.999967, 0.0080676, 25, 0, 1),
(16323394, 175268, 229, 162.276, -240.739, 91.4562, 2.022, 0, 0, 0.99968, -0.0253087, 25, 0, 1),
(16323396, 175269, 229, 144.427, -240.875, 91.4579, 4.66271, 0, 0, 0.724452, -0.689325, 25, 0, 1),
(16323398, 175270, 229, 126.359, -240.684, 91.4586, 4.71847, 0, 0, 0.704952, -0.709255, 25, 0, 1),
(16323400, 175271, 229, 126.251, -258.717, 91.4531, 6.28141, 0, 0, 0.00088683, -1, 25, 0, 1),
(16323402, 175272, 229, 126.427, -276.805, 91.4134, 0.0060718, 0, 0, 0.0030359, 0.999995, 25, 0, 1),
(16323517, 170577, 229, 113.766, -258.755, 91.5475, 6.2326, 0, 0, 0.0252901, -0.99968, 25, 0, 1);

INSERT INTO `gameobject_scripts` VALUES 
('16323400', '30', '10', '9816', '3600000', '0', '0', '0', '0', '144,37', '-258,27', '96,32', '4,76'),
('16323400', '120', '11', '16323517', '99999', '0', '0', '0', '0', '0', '0', '0', '0');


