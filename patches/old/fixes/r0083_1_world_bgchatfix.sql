DELETE FROM `mangos_string` WHERE entry IN (605,606,607,608,609,610,611,612);
INSERT INTO `mangos_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES
(605, '%s captured the Horde flag!', NULL, NULL, '%s hat die Flagge der Horde errungen!', NULL, NULL, NULL, NULL, NULL),
(606, '%s captured the Alliance flag!', NULL, NULL, '%s hat die Flagge der Allianz errungen!', NULL, NULL, NULL, NULL, NULL),
(607, 'The Horde flag was dropped by %s!', NULL, NULL, '%s hat die Flagge der Horde fallen gelassen!', NULL, NULL, NULL, NULL, NULL),
(608, 'The Alliance Flag was dropped by %s!', NULL, NULL, '%s hat die Flagge der Allianz fallen gelassen!', NULL, NULL, NULL, NULL, NULL),
(609, 'The Alliance Flag was returned to its base by %s!', NULL, NULL, 'Die Flagge der Allianz wurde von %s zu ihrem Stützpunkt zurückgebracht!', NULL, NULL, NULL, NULL, NULL),
(610, 'The Horde flag was returned to its base by %s!', NULL, NULL, 'Die Flagge der Horde wurde von %s zu ihrem Stützpunkt zurückgebracht!', NULL, NULL, NULL, NULL, NULL),
(611, 'The Horde flag was picked up by %s!', NULL, NULL, '%s hat die Flagge der Horde aufgenommen!', NULL, NULL, NULL, NULL, NULL),
(612, 'The Alliance Flag was picked up by %s!', NULL, NULL, '%s hat die Flagge der Allianz aufgenommen!', NULL, NULL, NULL, NULL, NULL);

