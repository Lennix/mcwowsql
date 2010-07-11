-- Hier kommen alle Aenderungen fuer Zul Gurub rein

-- Son of Hakkar - 5 minute respawn
UPDATE creature SET spawntimesecs = 300 WHERE id = 11357;

-- Correct ScriptNames
UPDATE creature_template SET ScriptName = "mob_sonofhakkar" WHERE entry = 11357;
UPDATE creature_template SET ScriptName = "mob_healing_ward" WHERE entry = 14987;
UPDATE creature_template SET ScriptName = "mob_brain_wash_totem" WHERE entry = 15112;
UPDATE creature_template SET ScriptName = "mob_bloodseeker_bat" WHERE entry = 14965;


