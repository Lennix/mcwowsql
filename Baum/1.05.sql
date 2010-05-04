-- ----------------------------------------------------
-- 	MC-Entertainment                               --
--	Databasefix by Baum UPDATE 1.05 [21.04.2010]   --
--	for mc-wow [Lennix]                            --
-- ----------------------------------------------------

-- -------------------------------------------------------------
-- Draki Adds sind nun immun gegen -> fear/sleep/bleed/sheep! --
-- -------------------------------------------------------------
UPDATE `creature_template` SET `mechanic_immune_mask`  = '82448' WHERE `creature_template`.`entry` =10814 LIMIT 1 ;

-- --------------------------------
-- Mondklaue ist nun besiegbar! --
-- --------------------------------
UPDATE `creature_template` SET `attackpower` = '0',
`baseattacktime` = '0',
`rangeattacktime` = '0',
`minrangedmg`  = '10',
`maxrangedmg` = '12',
 `mindmg`  = '12',
`maxdmg` = '18',
`rangedattackpower` = '0' WHERE `creature_template`.`entry` =12138 LIMIT 1 ;

-- -----------------------------------------------------------
-- [1786]Der Foliant der Offenbarung ist nun abschließbar! --
-- -----------------------------------------------------------
UPDATE `quest_template` SET `ReqItemId1` = '0',
`ReqItemCount1` = '0' WHERE `quest_template`.`entry` =1786 LIMIT 1 ;
UPDATE `quest_template` SET `ReqItemId1` = '0',
`ReqItemCount1` = '0' WHERE `quest_template`.`entry` =1783  LIMIT 1 ;

-- ---------------------------------------------------------
-- Die Quest Prüfung des Seelöwens ist nun abschließbar! --
-- ---------------------------------------------------------
delete from `gameobject` where guid = 306332;
delete from `gameobject` where guid = 306333;
INSERT INTO `gameobject` VALUES
(306332, 177844, 0, 839.285, 2206.66, -136.303, 5.21363, 0, 0, 0.50965, -0.860382, 25, 0, 1),
(306333, 3740, 0, 842.031, 2208.47, -136.614, 3.62714, 0, 0, 0.970675, -0.240395, 25, 0, 1);

-- ---------------------------------------------
-- Die Quest Hand von Iruxos ist nun lösbar! --
-- ---------------------------------------------
delete from `gameobject` where guid = 306334;
delete from `gameobject_loot_template` where item = 13542;
delete from `gameobject_template` where entry = 538153;
INSERT INTO `gameobject_template` VALUES 
('538153', '3', '10', 'Hand of Iruxos Box', '0', '4', '1', '93', '5381', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `gameobject_loot_template`VALUES 
('5381', '13542', '-100', '0', '1', '1', '0', '0', '0');
INSERT INTO `gameobject` VALUES
(306334, 538153, 1, -350.07, 1760.8, 138.37, 0.6346, 0, 0, 0.312003, 0.950081, 25, 0, 1);