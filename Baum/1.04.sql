-------------------------------------------------------
-- 	MC-Entertainment                               --
--	Databasefix by Baum UPDATE 1.04 [19.04.2010]   --
--	for mc-wow [Lennix]                            --
-------------------------------------------------------


--
-- Magistrat in Stratholme steht nun richtig!
--

UPDATE `creature` SET `position_x` =  '4076.01',
`position_y` = '-3537.65',
`position_z` = '123.893',
`orientation` = '2.75528' WHERE `creature`.`guid` =54237 LIMIT 1 ;


--
-- Arenazuschauer in BRD sind jetzt neutral!
--

UPDATE `creature_template` SET `faction_A` = '7',
`faction_H` = '7' WHERE `creature_template`.`entry` =8896 LIMIT 1 ;
UPDATE `creature_template` SET `faction_A` = '7',
`faction_H` = '7' WHERE `creature_template`.`entry` =8916 LIMIT 1 ;
UPDATE `creature_template` SET `faction_A` = '7',
`faction_H` = '7' WHERE `creature_template`.`entry` =8902 LIMIT 1 ;
UPDATE `creature_template` SET `faction_A` = '7',
`faction_H` = '7' WHERE `creature_template`.`entry` =8894 LIMIT 1 ;
UPDATE `creature_template` SET `faction_A` = '7',
`faction_H` = '7' WHERE `creature_template`.`entry` =8895 LIMIT 1 ;
UPDATE `creature_template` SET `faction_A` = '7',
`faction_H` = '7' WHERE `creature_template`.`entry` =8893 LIMIT 1 ;
UPDATE `creature_template` SET `faction_A` = '7',
`faction_H` = '7' WHERE `creature_template`.`entry` =8904 LIMIT 1 ;


--
-- Timmy der Grausame spawnt nun richtig!
--

UPDATE `creature` SET `spawntimesecs` = '12000' WHERE `creature`.`guid` =351085 LIMIT 1 ;
