UPDATE gameobject_template SET data0 = 0 WHERE entry IN (181598, 181597); -- without this, the client sends a spellcast packet on go use instead of use go packet
UPDATE gameobject_template SET data0 = 0 WHERE entry = 181682;

UPDATE creature_template SET AIName = 'OutdoorPvPObjectiveAI', ScriptName = '' WHERE entry = 12999;

DELETE FROM game_graveyard_zone WHERE id IN (927); -- DELETE na, za, epl pvp graveyard associations, they should only be available to the controlling faction

DELETE FROM npc_option WHERE id = 51;
INSERT INTO npc_option(id, gossip_id, npcflag, icon, action, option_text) VALUES (51,0,536870912,0,18,"UNIT_NPC_FLAG_OUTDOORPVP");

DELETE FROM `mangos_string` WHERE `entry` BETWEEN 9033 AND 9050;
INSERT INTO `mangos_string` (`entry`, `content_default`) VALUES
-- eastern plaguelands
(9033,'The Horde has taken the Northpass Tower!'),
(9034,'The Alliance has taken the Northpass Tower!'),
(9035,'The Horde has taken the Eastwall Tower!'),
(9036,'The Alliance has taken the Eastwall Tower!'),
(9037,'The Horde has taken the Crown Guard Tower!'),
(9038,'The Alliance has taken the Crown Guard Tower!'),
(9039,'The Horde has taken the Plaguewood Tower!'),
(9040,'The Alliance has taken the Plaguewood Tower!'),
(9041,'The Horde lost the Northpass Tower!'),
(9042,'The Alliance lost the Northpass Tower!'),
(9043,'The Horde lost the Eastwall Tower!'),
(9044,'The Alliance lost the Eastwall Tower!'),
(9045,'The Horde lost the Crown Guard Tower!'),
(9046,'The Alliance lost the Crown Guard Tower!'),
(9047,'The Horde lost the Plaguewood Tower!'),
(9048,'The Alliance lost the Plaguewood Tower!'),
-- silithus
(9049,'The Horde has collected 200 silithyst!'),
(9050,'The Alliance has collected 200 silithyst!');
