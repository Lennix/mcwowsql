/* instance reset time fixes */
update instance_template set reset_delay=0 where reset_delay=7200;
update instance_template set reset_delay=3 where reset_delay=259200; 
update instance_template set reset_delay=5 where reset_delay=432000;
update instance_template set reset_delay=7 where reset_delay=604800;
update instance_template set reset_delay=1 where reset_delay=120000;

/* change horde quest to require one of the horde races*/
update quest_template set RequiredRaces=690 where entry=5098;