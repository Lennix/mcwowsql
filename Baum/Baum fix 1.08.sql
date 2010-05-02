-------------------------------------------------------
-- 	MC-Entertainment                               --
--	Databasefix by Baum UPDATE 1.08 [26.04.2010]   --
--	for mc-wow [Lennix]                            --
-------------------------------------------------------

--
-- Zul'Gurub DAMAGE PUSH[%]!
--

---------
--Bosse--
---------

-- [14507]Venoxis[+20%]
UPDATE `creature_template` SET `mindmg` = '720,0',
`maxdmg` = '1300,0',
`attackpower` = '5984',
`baseattacktime` = '2160',
`minrangedmg` = '744,0',
`maxrangedmg` = '1023,0',
`rangedattackpower` = '120' WHERE `creature_template`.`entry` =14507 LIMIT 1 ;

-- [14517]Jeklik[+20%]
UPDATE `creature_template` SET `mindmg` = '600,0',
`maxdmg` = '1200,0',
`attackpower` = '5880',
`baseattacktime` = '2160',
`minrangedmg` = '768,0',
`maxrangedmg` = '1056,0',
`rangedattackpower` = '120' WHERE `creature_template`.`entry` =14517 LIMIT 1 ;

-- [14510]Mar'li[+20%]
UPDATE `creature_template` SET `mindmg` = '720,0',
`maxdmg` = '1300,0',
`attackpower` = '6984',
`baseattacktime` = '2160',
`minrangedmg` = '720,0',
`maxrangedmg` = '990,0',
`rangedattackpower` = '120' WHERE `creature_template`.`entry` =14510 LIMIT 1 ;

-- [11382]Mandokir[+20%]
UPDATE `creature_template` SET `mindmg` = '1172,0',
`maxdmg` = '2084,0',
`attackpower` = '11398',
`baseattacktime` = '2700',
`minrangedmg` = '600,0',
`maxrangedmg` = '800,0',
`rangedattackpower` = '120,0' WHERE `creature_template`.`entry` =11382 LIMIT 1 ;

-- [14509]Thekal[+20%]
UPDATE `creature_template` SET `mindmg` = '902,0',
`maxdmg` = '1599,0',
`attackpower` = '8755,2',
`baseattacktime` = '2900',
`minrangedmg` = '720,0',
`maxrangedmg` = '990,0',
`rangedattackpower` = '120' WHERE `creature_template`.`entry` =14509 LIMIT 1 ;

-- [15114]Gahz'ranka[+20%]
UPDATE `creature_template` SET `mindmg` = '1400',
`maxdmg` = '2016',
`attackpower` = '120',
`baseattacktime` = '1200',
`rangeattacktime` = '2100',
`minrangedmg` = '864',
`maxrangedmg` = '1190',
`rangedattackpower` = '110' WHERE `creature_template`.`entry` =15114 LIMIT 1 ;

-- [14515]Arlokk[workaround]
UPDATE `creature_template` SET `mindmg` = '1100',
`maxdmg` = '1800',
`attackpower` = '8000',
`baseattacktime` = '1800' WHERE `creature_template`.`entry` =14515 LIMIT 1 ;

---------
--Trash--
---------

-- [15101]Arlokk's Panther ADDS[workaround]
UPDATE `creature_template` SET `mindmg` = '300',
`maxdmg` = '500',
`attackpower` = '200',
`baseattacktime` = '1300',
`rangeattacktime` = '1500',
`minrangedmg` = '100',
`maxrangedmg` = '140',
`minhealth` = '4260',
`maxhealth` = '4560',
`rangedattackpower` = '120' WHERE `creature_template`.`entry` =15101 LIMIT 1 ;

-- [11352]Gurubashi Berserker[workaround]
UPDATE `creature_template` SET `mindmg` = '1000',
`maxdmg` = '1500',
`attackpower` = '6000',
`baseattacktime` = '1500',
`minrangedmg` = '800',
`maxrangedmg` = '1400',
`mechanic_immune_mask`  = '1073741823',
`rangedattackpower` = '200' WHERE `creature_template`.`entry` =11352 LIMIT 1 ;

-- [15233]Shade of Jin'do[nerf]
UPDATE `creature_template` SET `mindmg` = '400',
`maxdmg` = '600' WHERE `creature_template`.`entry` =14986 LIMIT 1 ;









