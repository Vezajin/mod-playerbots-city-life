-- City Life: reset the bundled hubs and spots to the values shipped with the module.
-- Apply manually to the WORLD database. The DB updater never runs this file.
--
-- This DISCARDS in-game edits to the bundled hubs (enabled, team, level range, map, population, priority)
-- and deletes every spot of a bundled hub, including spots added with .citylife spot add.
-- Hubs and spots of custom hubs (any hub name not listed here) are not touched.
--
-- Order: run this file first, then data/sql/db-world/world_city_life.sql, which inserts the bundled spots
-- again. Keep the hub rows below in sync with the seed hubs in that file.

INSERT INTO `city_life_hub`
(`name`,`enabled`,`team`,`min_level`,`max_level`,`map_id`,`default_population`,`priority`)
VALUES
('Stormwind',1,0,1,80,0,25,220),
('Orgrimmar',1,1,1,80,1,25,220),
('Ironforge',1,0,1,80,0,18,190),
('Undercity',1,1,1,80,0,18,190),
('Darnassus',1,0,1,80,1,10,150),
('ThunderBluff',1,1,1,80,1,10,150),
('Exodar',1,0,1,80,530,5,120),
('Silvermoon',1,1,1,80,530,8,130),
('Shattrath',1,2,58,80,530,20,200),
('Dalaran',1,2,68,80,571,25,210),
('WintergraspAlliance',1,0,70,80,571,40,230),
('WintergraspHorde',1,1,70,80,571,40,230),
('Gadgetzan',1,2,35,80,1,8,110),
('Goldshire',1,0,1,30,0,8,100),
('HonorHold',1,0,58,80,530,6,100),
('Thrallmar',1,1,58,80,530,6,100),
('BootyBay',1,2,35,80,0,10,110),
('Darkshire',1,0,18,80,0,8,105),
('RebelCamp',1,0,30,80,0,6,105),
('ValianceKeep',1,0,68,80,571,10,115),
('WarsongHold',1,1,68,80,571,10,115),
('RebelCampQuesting',1,0,30,40,0,8,180),
('FarshireQuesting',1,0,68,72,571,8,180),
('WarsongHoldQuesting',1,1,68,72,571,8,180)
ON DUPLICATE KEY UPDATE
`enabled`=VALUES(`enabled`),`team`=VALUES(`team`),`min_level`=VALUES(`min_level`),
`max_level`=VALUES(`max_level`),`map_id`=VALUES(`map_id`),
`default_population`=VALUES(`default_population`),`priority`=VALUES(`priority`);

DELETE `spot` FROM `city_life_spot` AS `spot`
INNER JOIN `city_life_hub` AS `hub` ON `hub`.`id`=`spot`.`hub_id`
WHERE `hub`.`name` IN
('Stormwind','Orgrimmar','Ironforge','Undercity','Darnassus','ThunderBluff','Exodar','Silvermoon',
 'Shattrath','Dalaran','WintergraspAlliance','WintergraspHorde','Gadgetzan','Goldshire','HonorHold',
 'Thrallmar','BootyBay','Darkshire','RebelCamp','ValianceKeep','WarsongHold','RebelCampQuesting',
 'FarshireQuesting','WarsongHoldQuesting');
