UPDATE creature_template SET minhealth = 54380, maxhealth = 54380 WHERE entry = 30639;
UPDATE creature_template SET mindmg = 980, maxdmg = 1129, attackpower = 512, faction_A = 20, faction_H = 20 WHERE entry = 31763;
UPDATE creature_template SET mindmg = 436, maxdmg = 496 WHERE entry = 30598;
UPDATE creature_template SET baseattacktime = 1750 WHERE entry = 33586;

UPDATE creature_ai_scripts SET event_chance = 100, event_param1 = 8000, event_param2 = 8000 WHERE id = 3064703;

