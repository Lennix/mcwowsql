/* Ohgan sleep immune fix */
update creature_template set npcflag=npcflag+(npcflag | 0x00000200) where entry=14988;
update creature_template set minhealth=273776,maxhealth=273776 where entry=14515;