 UPDATE creature_template p INNER JOIN creature_loot_template pp ON p.entry = pp.entry SET p.lootid = pp.entry;