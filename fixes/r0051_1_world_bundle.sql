-- UDW: http://udw.altervista.org/zeroproject/viewtopic.php?f=68&t=499

-- Ruins of Ahn'Qiraj - Onyx Idol 
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`lootcondition`,`condition_value1`,`condition_value2`) VALUES ('15333','20867','-2','0','1','1','0','0','0'); 
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`lootcondition`,`condition_value1`,`condition_value2`) VALUES ('15335','20867','-1.9','0','1','1','0','0','0'); 
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`lootcondition`,`condition_value1`,`condition_value2`) VALUES ('15319','20867','-1','0','1','1','0','0','0'); 
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`lootcondition`,`condition_value1`,`condition_value2`) VALUES ('15320','20867','-0.9','0','1','1','0','0','0'); 
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`lootcondition`,`condition_value1`,`condition_value2`) VALUES ('15336','20867','-0.8','0','1','1','0','0','0'); 
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`lootcondition`,`condition_value1`,`condition_value2`) VALUES ('15392','20867','-0.8','0','1','1','0','0','0'); 
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`lootcondition`,`condition_value1`,`condition_value2`) VALUES ('15390','20867','-0.8','0','1','1','0','0','0'); 
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`lootcondition`,`condition_value1`,`condition_value2`) VALUES ('15325','20867','-0.6','0','1','1','0','0','0'); 
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`lootcondition`,`condition_value1`,`condition_value2`) VALUES ('15324','20867','-0.6','0','1','1','0','0','0'); 
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`lootcondition`,`condition_value1`,`condition_value2`) VALUES ('15343','20867','-0.6','0','1','1','0','0','0'); 
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`lootcondition`,`condition_value1`,`condition_value2`) VALUES ('15323','20867','-0.6','0','1','1','0','0','0'); 
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`lootcondition`,`condition_value1`,`condition_value2`) VALUES ('15327','20867','-0.5','0','1','1','0','0','0'); 
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`lootcondition`,`condition_value1`,`condition_value2`) VALUES ('15355','20867','-0.5','0','1','1','0','0','0'); 
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`lootcondition`,`condition_value1`,`condition_value2`) VALUES ('15318','20867','-0.5','0','1','1','0','0','0'); 
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`lootcondition`,`condition_value1`,`condition_value2`) VALUES ('15388','20867','-0.5','0','1','1','0','0','0'); 
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`lootcondition`,`condition_value1`,`condition_value2`) VALUES ('15338','20867','-0.4','0','1','1','0','0','0'); 
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`lootcondition`,`condition_value1`,`condition_value2`) VALUES ('15461','20867','-0.4','0','1','1','0','0','0'); 
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`lootcondition`,`condition_value1`,`condition_value2`) VALUES ('15462','20867','-0.4','0','1','1','0','0','0'); 
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`lootcondition`,`condition_value1`,`condition_value2`) VALUES ('15389','20867','-0.4','0','1','1','0','0','0'); 
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`lootcondition`,`condition_value1`,`condition_value2`) VALUES ('15385','20867','-0.4','0','1','1','0','0','0'); 
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`lootcondition`,`condition_value1`,`condition_value2`) VALUES ('15391','20867','-0.3','0','1','1','0','0','0'); 
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`lootcondition`,`condition_value1`,`condition_value2`) VALUES ('15386','20867','-0.3','0','1','1','0','0','0'); 
 
-- Item&NPC: Field Repair Bot 74A 
UPDATE `creature_template` SET `npcflag`='16388' WHERE (`entry`='14337'); 
 
-- Quest:Attunement to the Core, loot object:Core Fragment. 
UPDATE `gameobject_template` SET `flags`='32', `data8`='7487' WHERE (`entry`='179553'); 
 
-- Quest series:The Scourge Cauldrons 
UPDATE `creature_template` SET `lootid`='11075' WHERE (`entry`='11075'); 
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`lootcondition`,`condition_value1`,`condition_value2`) VALUES ('11075','13194','-96','0','1','1','0','0','0'); 
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`lootcondition`,`condition_value1`,`condition_value2`) VALUES ('11075','12841','-26','0','1','1','0','0','0'); 
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`lootcondition`,`condition_value1`,`condition_value2`) VALUES ('11075','13356','-1','0','1','1','0','0','0'); 
UPDATE `creature_template` SET `lootid`='11077' WHERE (`entry`='11077'); 
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`lootcondition`,`condition_value1`,`condition_value2`) VALUES ('11077','13195','-97','0','1','1','0','0','0'); 
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`lootcondition`,`condition_value1`,`condition_value2`) VALUES ('11077','12841','-24','0','1','1','0','0','0'); 
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`lootcondition`,`condition_value1`,`condition_value2`) VALUES ('11077','13357','-3','0','1','1','0','0','0'); 
UPDATE `creature_template` SET `lootid`='11076' WHERE (`entry`='11076'); 
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`lootcondition`,`condition_value1`,`condition_value2`) VALUES ('11076','13197','-98','0','1','1','0','0','0'); 
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`lootcondition`,`condition_value1`,`condition_value2`) VALUES ('11076','12841','-24','0','1','1','0','0','0'); 
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`lootcondition`,`condition_value1`,`condition_value2`) VALUES ('11076','13357','-3','0','1','1','0','0','0'); 
UPDATE `creature_template` SET `lootid`='11078' WHERE (`entry`='11078'); 
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`lootcondition`,`condition_value1`,`condition_value2`) VALUES ('11078','13196','-98','0','1','1','0','0','0'); 
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`lootcondition`,`condition_value1`,`condition_value2`) VALUES ('11078','12841','-24','0','1','1','0','0','0'); 
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`lootcondition`,`condition_value1`,`condition_value2`) VALUES ('11078','13354','-2','0','1','1','0','0','0'); 
-- Start quest series:Scholomance 
UPDATE `quest_template` SET `RequiredRaces`='77' WHERE (`entry`='5533'); 
UPDATE `quest_template` SET `RequiredRaces`='178' WHERE (`entry`='5098'); 
-- quest:All Along the Watchtowers 
UPDATE `quest_template` SET `ReqSpellCast1`='17016',`ReqSpellCast2`='17016',`ReqSpellCast3`='17016',`ReqSpellCast4`='17016' WHERE (`entry`='5098'); 
UPDATE `quest_template` SET `ReqSpellCast1`='17016',`ReqSpellCast2`='17016',`ReqSpellCast3`='17016',`ReqSpellCast4`='17016' WHERE (`entry`='5097'); 
-- Loot object:Araj's Phylactery 
INSERT INTO `gameobject_loot_template` (`entry`,`item`,`ChanceOrQuestChance`) VALUES ('177241','17114','-68'); 
INSERT INTO `gameobject_loot_template` (`entry`,`item`,`ChanceOrQuestChance`) VALUES ('177241','14610','-51'); 
UPDATE `gameobject_template` SET `flags`='0', `data1`='177241' WHERE (`entry`='177241');