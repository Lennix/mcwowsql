-- -----------------------------------------------------
-- 	MC-Entertainment                               --
--	Databasefix by Baum UPDATE 1.01 [31.03.2010]   --
--	for mc-wow [Lennix]                            --
-- -----------------------------------------------------

-- ------------------------------------
-- DM-Nord-West-Schalter-Tür-öffnen --
-- ------------------------------------
delete from `gameobject_scripts` where id = 49962;
delete from `gameobject_scripts` where id = 49960;
delete from `gameobject_scripts` where id = 49958;
INSERT INTO `gameobject_scripts` 
VALUES ('49962', '0', '11', '49948', '5', '0', '0', '0', '0', '0');
INSERT INTO `gameobject_scripts` 
VALUES ('49960', '0', '11', '49945', '5', '0', '0', '0', '0', '0');
INSERT INTO `gameobject_scripts` 
VALUES ('49958', '0', '11', '49943', '5', '0', '0', '0', '0', '0');

-- -----------------------------------
-- Scholomance-Schalter-Tür-öffnen --
-- -----------------------------------
delete from `gameobject_scripts` where id = 45428;
INSERT INTO `gameobject_scripts` 
VALUES ('45428', '0', '11', '45427', '5', '0', '0', '0', '0', '0');

-- ----------------------------------
-- Stratholme-Schalter-Tür-öffnen --
-- ----------------------------------
delete from `gameobject_scripts` where id = 45625;
INSERT INTO `gameobject_scripts` 
VALUES ('45625', '0', '11', '45626', '5', '0', '0', '0', '0', '0');

-- -------------------------------------------------------------
-- BRD-DOORFIX-ALLROUND                                       --
-- [Doppelgespawnten Türen die per Schlüsse zur               --
-- Schattenschmiede geöffnet werden, sollten entfernt werden!]--
-- -------------------------------------------------------------

  -- 301063 = Schloss der Schattenschmiede[Button][verschoben]
  -- 15576  = Riesen Tür [wird geschlossen]
  -- 300000 = Schwarzfelstür(zum Blocken) [wird geöffnet]
  -- Dummys und andere Blocktüren entfernen!

delete from `gameobject` where guid = 300000;
delete from `gameobject` where guid = 301063;
delete from `gameobject_scripts` where id = 301063;
INSERT INTO `gameobject` VALUES (300000, 170576, 230, 701.743, -126.33, -45.7532, 0.822699, 0, 0, 0.399847, 0.916582, 25, 0, 1);
INSERT INTO `gameobject` VALUES (301063, 161460, 230, 678.672, -137.134, -46.2337, 1.13687, 0, 0, 0.538314, 0.842744, 0, 0, 1);
INSERT INTO `gameobject_scripts` 
VALUES ('301063', '0', '12', '15576', '15000', '0', '0', '0', '0', '0');
INSERT INTO `gameobject_scripts` 
VALUES ('301063', '0', '11', '300000', '15000', '0', '0', '0', '0', '0');


-- 232227 = Bar Tür mit Script (oft schon in db)
delete from `gameobject` where guid = 232227;
INSERT INTO `gameobject`
VALUES (232227, 170571, 230, 870.693, -228.936, -43.7509, 2.16421, 0, 0, 0.882947,0.469472, 600, 100, 1);
-- 15298  = Tür muss entfernt werden!
DELETE FROM gameobject WHERE guid = 15298;

-- 232226 = Tür wird durch Kill von Un'rel geöffnet.
-- 15334  = Tür muss entfernt werden!
DELETE FROM gameobject WHERE guid = 15334;

-- 232222 = Süd-Tor mit Script geöffnet
-- 232225 = Nord-Tor mit Script geöffnet 
-- 15540  = Tür muss entfernt werden!
DELETE FROM gameobject WHERE guid = 15540;
-- 15651  = Tür muss entfernt werden!
DELETE FROM gameobject WHERE guid = 15651;

-- 232221 = Tür wird durch Kill von Magmus geöffnet
-- 35820  = Tür muss entfernt werden!
DELETE FROM gameobject WHERE guid = 35820;


-- ------------------------
-- MC-Pre-Core-Fragment --
-- ------------------------
UPDATE `gameobject` SET `spawntimesecs` = '10' WHERE `gameobject`.`guid` =43133 LIMIT 1 ;



