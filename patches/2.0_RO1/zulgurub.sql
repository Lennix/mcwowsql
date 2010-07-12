-- Hier kommen alle Aenderungen fuer Zul Gurub rein

-- Son of Hakkar - 5 minute respawn
UPDATE creature SET spawntimesecs = 300 WHERE id = 11357;

-- Correct ScriptNames
UPDATE creature_template SET ScriptName = "mob_sonofhakkar" WHERE entry = 11357;
UPDATE creature_template SET ScriptName = "mob_healing_ward" WHERE entry = 14987;
UPDATE creature_template SET ScriptName = "mob_brain_wash_totem" WHERE entry = 15112;
UPDATE creature_template SET ScriptName = "mob_bloodseeker_bat" WHERE entry = 14965;

-- Venoxis added 4 adds
UPDATE `creature_template` SET `AIName` = 'EventAI ' WHERE `creature_template`.`entry` =11373 LIMIT 1 ;
DELETE from creature_ai_scripts where id = 113731;
INSERT INTO `creature_ai_scripts` VALUES
 ('113731', '11373', '4', '0', '100', '0', '0', '0', '0', '0', '39', '10', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '');

-- Arlokk's Panther ADDS[NERF]
UPDATE `creature_template` SET `mindmg` = '300',
`maxdmg` = '400',
`attackpower` = '200',
`baseattacktime` = '1200',
`rangeattacktime` = '1500',
`minrangedmg` = '100',
`maxrangedmg` = '140',
`rangedattackpower` = '120' WHERE `creature_template`.`entry` =15101 LIMIT 1 ;

-- [15114]Gahz'ranka[NERF]
UPDATE `creature_template` SET `mindmg` = '1300',
`maxdmg` = '1800',
`attackpower` = '1200',
`baseattacktime` = '1500',
`rangeattacktime` = '2100',
`minrangedmg` = '864',
`maxrangedmg` = '1190',
`rangedattackpower` = '110' WHERE `creature_template`.`entry` =15114 LIMIT 1 ;

-- [15233]Shade of Jin'do[push]
UPDATE `creature_template` SET `mindmg` = '1000',
`maxdmg` = '1500' WHERE `creature_template`.`entry` =14986 LIMIT 1 ;



