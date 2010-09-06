/* delete gameobject till it's fixed to avoid abuse, requested by lennix */
delete from gameobject where id=179501;
/* gameobject should respawn every 8 hours, fixed to prevent abuse of chest */
update gameobject_template set data2=28800 WHERE entry=179697