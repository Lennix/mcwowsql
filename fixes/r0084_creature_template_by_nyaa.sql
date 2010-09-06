/* fix trainers */
UPDATE creature_template SET npcflag=npcflag-(npcflag & 0x00000040);
update creature_template set npcflag=npcflag-(npcflag & 0x00000002) where entry=3357;