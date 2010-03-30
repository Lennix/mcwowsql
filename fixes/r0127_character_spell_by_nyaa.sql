/* add racial to characters that have it missing caused by bug */
 delete from character_spell where spell=20572;
 insert into character_spell (select guid, 20572 as Spell, 1 as active, 0 as disabled from characters where race=2);
