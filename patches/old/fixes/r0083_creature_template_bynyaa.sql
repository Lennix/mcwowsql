/* repair bot should repair too, but does not atm; fix:*/
update creature_template set npcflag=2052  where entry=14337;
/* creature loot missing adding it + updating creature_template to use the loot */
update `creature_template` set lootid=14454 WHERE entry=14454;
delete from creature_loot_template where entry=14454;
/* references are already in the db so i won't touch them, just use them here*/
insert into `creature_loot_template` values
('14454','7069','73.0769','0','3','5','0','0','0'),
('14454','7081','75.9615','0','2','4','0','0','0'),
('14454','7082','80.7692','0','1','2','0','0','0'),
('14454','7909','0.62','0','1','1','0','0','0'),
('14454','14499','0.62','0','1','1','0','0','0'),
('14454','18676','25','0','1','1','0','0','0'),
('14454','18677','57.6923','0','1','1','0','0','0'),
('14454','19268','13.4615','0','1','1','0','0','0'),
('14454','21548','30.56','0','1','1','0','0','0'),
('14454','22527','79.8077','0','2','4','0','0','0'),
('14454','24016','1','1','-24016','1','0','0','0'),
('14454','24018','1','1','-24018','1','0','0','0'),
('14454','24033','1','1','-24033','1','0','0','0');
/* fix vendor loot for eng. supplies */
insert into npc_vendor values
(2685,18651,0,0);