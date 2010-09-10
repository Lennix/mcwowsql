-- !!!!!!!!!!!!!--
-- Molten Core --
-- !!!!!!!!!!!!!--

-- -------
-- TRASH--
-- -------

-- ------------------------------------------------------
-- Geschmolzener Riese/Zerstörer adden im Doppelpack! --
-- ------------------------------------------------------
UPDATE `creature` SET `position_x` =  '1135.50',
`position_y` = '-537.8640',
`position_z` = '-107.7470',
`orientation` = '2.499830' WHERE `creature`.`guid` =56705 LIMIT 1 ;
UPDATE `creature` SET `position_x` =  '1127.180',
`position_y` = '-546.0730',
`position_z` = '-107.9050',
`orientation` = '2.285190' WHERE `creature`.`guid` =56704 LIMIT 1 ;
UPDATE `creature` SET `position_x` =  '1172.050',
`position_y` = '-574.9870',
`position_z` = '-113.2920',
`orientation` = '3.012470' WHERE `creature`.`guid` =56715 LIMIT 1 ;
UPDATE `creature` SET `position_x` =  '1173.310',
`position_y` = '-562.6660',
`position_z` = '-112.7120',
`orientation` = '3.290510' WHERE `creature`.`guid` =56714 LIMIT 1 ;
UPDATE `creature` SET `position_x` =  '1068.820',
`position_y` = '-766.5470',
`position_z` = '-151.6320',
`orientation` = '0.5078610' WHERE `creature`.`guid` =56717 LIMIT 1 ;
UPDATE `creature` SET `position_x` =  '1079.980',
`position_y` = '-771.1460',
`position_z` = '-151.5970',
`orientation` = '1.500610' WHERE `creature`.`guid` =56716 LIMIT 1 ;
UPDATE `creature` SET `position_x` =  '1047.240',
`position_y` = '-718.8710',
`position_z` = '-154.330',
`orientation` = '5.811950' WHERE `creature`.`guid` =56747 LIMIT 1 ;
UPDATE `creature` SET `position_x` =  '1046.070',
`position_y` = '-706.5170',
`position_z` = '-158.7850',
`orientation` = '0.5510540' WHERE `creature`.`guid` =56748 LIMIT 1 ;
UPDATE `creature` SET `position_x` =  '967.3230',
`position_y` = '-573.0560',
`position_z` = '-202.8190',
`orientation` = '5.332540' WHERE `creature`.`guid` =56706 LIMIT 1 ;
UPDATE `creature` SET `position_x` =  '954.8570',
`position_y` = '-656.030',
`position_z` = '-199.6860',
`orientation` = '5.367870' WHERE `creature`.`guid` =56702 LIMIT 1 ;
UPDATE `creature` SET `position_x` =  '858.6190',
`position_y` = '-577.2030',
`position_z` = '-203.8270',
`orientation` = '0.6381570' WHERE `creature`.`guid` =56709 LIMIT 1 ;
UPDATE `creature` SET `position_x` =  '861.5610',
`position_y` = '-587.940',
`position_z` = '-203.5690',
`orientation` = '5.989890' WHERE `creature`.`guid` =56708 LIMIT 1 ;
UPDATE `creature` SET `position_x` =  '798.0480',
`position_y` = '-547.8310',
`position_z` = '-212.3920',
`orientation` = '5.497710' WHERE `creature`.`guid` =56718 LIMIT 1 ;
UPDATE `creature` SET `position_x` =  '760.7720',
`position_y` = '-502.1540',
`position_z` = '-212.9070',
`orientation` = '3.988940' WHERE `creature`.`guid` =56712 LIMIT 1 ;
UPDATE `creature` SET `position_x` =  '692.270',
`position_y` = '-560.8460',
`position_z` = '-210.9580',
`orientation` = '0.4035910' WHERE `creature`.`guid` =56700 LIMIT 1 ;
UPDATE `creature` SET `position_x` =  '683.1610',
`position_y` = '-552.0670',
`position_z` = '-209.9490',
`orientation` = '0.7939290' WHERE `creature`.`guid` =56701 LIMIT 1 ;

-- --------------------------------
-- Elementare adden im Quartett --
-- --------------------------------
UPDATE `creature` SET `position_x` =  '652.8940',
`position_y` = '-749.7680',
`position_z` = '-208.8720',
`orientation` = '5.479370',
`MovementType` = '0' WHERE `creature`.`guid` =91286 LIMIT 1 ;
UPDATE `creature` SET `position_x` =  '638.0760',
`position_y` = '-793.8770',
`position_z` = '-208.5750',
`orientation` = '3.224480',
`MovementType` = '0' WHERE `creature`.`guid` =91263 LIMIT 1 ;
UPDATE `creature` SET `position_x` =  '605.0750',
`position_y` = '-847.1980',
`position_z` = '-207.610',
`orientation` = '3.20170',
`MovementType` = '0' WHERE `creature`.`guid` =91268 LIMIT 1 ;
UPDATE `creature` SET `position_x` =  '646.5370',
`position_y` = '-858.5990',
`position_z` = '-208.4280',
`orientation` = '0.2413050' WHERE `creature`.`guid` =56724 LIMIT 1 ;


-- ------------------
-- Flammenwichtel --
-- ------------------
UPDATE `creature` SET `spawntimesecs` = '420' WHERE `creature`.`id` =11669;

-- -------------------------------
-- Geschmolzener Riese DMGPUSH --
-- -------------------------------
UPDATE `creature_template` SET `mindmg` = '3500',
`maxdmg` = '5000',
`attackpower` = '10000',
`baseattacktime` = '4500',
`mechanic_immune_mask`  = '1073741823'
 WHERE `creature_template`.`entry` =11658 LIMIT 1 ;

-- -----------------------------------
-- Geschmolzener Zerstörer DMGPUSH --
-- -----------------------------------
UPDATE `creature_template` SET `mindmg` = '4000',
`maxdmg` = '5500',
`attackpower` = '11000',
`baseattacktime` = '5000',
`mechanic_immune_mask`  = '1073741823'
 WHERE `creature_template`.`entry` =11659 LIMIT 1 ;

-- ----------------------------
-- Uralter Kernhund DMGPUSH --
-- ----------------------------
UPDATE `creature_template` SET `mindmg` = '4000',
`maxdmg` = '4800',
`attackpower` = '8000',
`baseattacktime` = '6000',
`mechanic_immune_mask`  = '1073741823'
 WHERE `creature_template`.`entry` =11673 LIMIT 1 ;

-- ---------------------
-- Feuerlord DMGPUSH --
-- ---------------------
UPDATE `creature_template` SET `mindmg` = '2500',
`maxdmg` = '3000',
`attackpower` = '5000',
`baseattacktime` = '2000' WHERE `creature_template`.`entry` =11668 LIMIT 1 ;

-- --------------------------
-- Lavavernichter DMGPUSH --
-- --------------------------
UPDATE `creature_template` SET `mindmg` = '2500',
`maxdmg` = '3000',
`attackpower` = '5000',
`baseattacktime` = '2000' WHERE `creature_template`.`entry` =11665 LIMIT 1 ;

-- ---------------------
-- Lavawoger DMGPUSH --
-- ---------------------
UPDATE `creature_template` SET `mindmg` = '2500',
`maxdmg` = '3000',
`attackpower` = '5000',
`baseattacktime` = '2000' WHERE `creature_template`.`entry` =12101 LIMIT 1 ;

-- -------------------------
-- Lavaelementar DMGPUSH --
-- -------------------------
UPDATE `creature_template` SET `mindmg` = '1200',
`maxdmg` = '1800',
`attackpower` = '2000' WHERE `creature_template`.`entry` =12076 LIMIT 1 ;

-- --------------------------
-- Flammenwächter DMGPUSH --
-- --------------------------
UPDATE `creature_template` SET `mindmg` = '1200',
`maxdmg` = '1800',
`attackpower` = '2000' WHERE `creature_template`.`entry` =11667 LIMIT 1 ;

-- -----------------------
-- Feuergänger DMGPUSH --
-- -----------------------
UPDATE `creature_template` SET `mindmg` = '1200',
`maxdmg` = '1800',
`attackpower` = '2000',
`MovementType`  = '0' WHERE `creature_template`.`entry` =11666 LIMIT 1 ;

-- -----------------------
-- Lavahäscher DMGPUSH --
-- -----------------------
UPDATE `creature_template` SET `mindmg` = '1200',
`maxdmg` = '1800',
`attackpower` = '2000' WHERE `creature_template`.`entry` =12100 LIMIT 1 ;


-- ----------
-- BOSSADDS--
-- ----------

-- ---------------------------------
-- Feuerschuppenpriester DMGPUSH --
-- ---------------------------------
UPDATE `creature_template` SET `mindmg` = '2000',
`maxdmg` = '2500' WHERE `creature_template`.`entry` =11662 LIMIT 1 ;

-- ------------------------
-- Kernwüterich DMGPUSH --
-- ------------------------
UPDATE `creature_template` SET `mindmg` = '2500',
`maxdmg` = '4000' WHERE `creature_template`.`entry` =11672 LIMIT 1;

-- ------------------------
-- Feueranbeter DMGPUSH --
-- ------------------------
UPDATE `creature_template` SET `mindmg` = '1500',
`maxdmg` = '2000' WHERE `creature_template`.`entry` =12099 LIMIT 1 ;

-- ------------------------
-- Feuerschuppe DMGPUSH --
-- ------------------------
UPDATE `creature_template` SET `mindmg` = '2500',
`maxdmg` = '3000' WHERE `creature_template`.`entry` =11661 LIMIT 1;

-- -----------------------------------
-- Feuerschuppenbeschützer DMGPUSH --
-- -----------------------------------
UPDATE `creature_template` SET `mindmg` = '2500',
`maxdmg` = '3000' WHERE `creature_template`.`entry` =12119 LIMIT 1;

-- ------------------------------
-- Feuerschuppenelite DMGPUSH --
-- ------------------------------
UPDATE `creature_template` SET `mindmg` = '2500',
`maxdmg` = '3500' WHERE `creature_template`.`entry` =11664 LIMIT 1 ;

-- -------------------------------
-- Feuerschuppenheiler DMGPUSH --
-- -------------------------------
UPDATE `creature_template` SET `mindmg` = '1200',
`maxdmg` = '1800' WHERE `creature_template`.`entry` =11663 LIMIT 1 ;


-- -------
-- BOSSE--
-- -------

-- ------------
-- Lucifron --
-- ------------
UPDATE `creature_template` SET `mindmg` = '3800',
`maxdmg` = '4500' WHERE `creature_template`.`entry` =12118 LIMIT 1 ;

-- ------------
-- Magmadar --
-- ------------
UPDATE `creature_template` SET `mindmg` = '4000',
`maxdmg` = '5000' WHERE `creature_template`.`entry` =11982 LIMIT 1 ;

-- ------------
-- Gehennas --
-- ------------
UPDATE `creature_template` SET `mindmg` = '3500',
`maxdmg` = '4800' WHERE `creature_template`.`entry` =12259 LIMIT 1 ;

-- --------
-- Garr --
-- --------
UPDATE `creature_template` SET `mindmg` = '3000',
`maxdmg` = '5000' WHERE `creature_template`.`entry` =12057 LIMIT 1 ;

-- ------------
-- Shazzrah --
-- ------------
UPDATE `creature_template` SET `mindmg` = '4000',
`maxdmg` = '4800' WHERE `creature_template`.`entry` =12264 LIMIT 1 ;

-- ----------------
-- Baron Geddon --
-- ----------------
UPDATE `creature_template` SET `mindmg` = '3500',
`maxdmg` = '5000',
`attackpower` = '9000',
`baseattacktime` = '3000' WHERE `creature_template`.`entry` =12056 LIMIT 1 ;

-- ---------------------------
-- Golemagg der Verbrenner --
-- ---------------------------
UPDATE `creature_template` SET `mindmg` = '4000',
`maxdmg` = '5500',
`attackpower` = '12000',
`baseattacktime` = '4000' WHERE `creature_template`.`entry` =11988 LIMIT 1 ;

-- ------------
-- Sulfuron --
-- ------------
UPDATE `creature_template` SET `mindmg` = '3000',
`maxdmg` = '4000' WHERE `creature_template`.`entry` =12098 LIMIT 1 ;

-- ----------------------
-- Majordomo Executus --
-- ----------------------
UPDATE `creature_template` SET `mindmg` = '4500',
`maxdmg` = '5500',
`attackpower` = '8000',
`baseattacktime` = '3000' WHERE `creature_template`.`entry` =12018 LIMIT 1 ;

-- ------------
-- Ragnaros --
-- ------------
UPDATE `creature_template` SET `mindmg` = '5000',
`maxdmg` = '7500',
`attackpower` = '15000',
`baseattacktime` = '4500' WHERE `creature_template`.`entry` =11502 LIMIT 1 ;





