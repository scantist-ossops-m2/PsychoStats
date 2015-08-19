SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure
-- ----------------------------

DROP TABLE IF EXISTS `ps_config_awards`;
CREATE TABLE IF NOT EXISTS `ps_config_awards` (
  `id` int(10) unsigned NOT NULL default '0',
  `enabled` tinyint(1) unsigned NOT NULL default '1',
  `idx` int(11) NOT NULL,
  `type` enum('player','weapon','weaponclass') NOT NULL default 'player',
  `negative` tinyint(1) unsigned NOT NULL default '0',
  `class` varchar(64) NOT NULL,
  `name` varchar(128) NOT NULL default '',
  `groupname` varchar(128) NOT NULL default '',
  `phrase` varchar(255) NOT NULL,
  `expr` varchar(255) NOT NULL default '',
  `order` enum('desc','asc') NOT NULL default 'desc',
  `where` varchar(255) NOT NULL default '',
  `limit` smallint(5) unsigned NOT NULL default '1',
  `format` varchar(64) NOT NULL default '',
  `gametype` varchar(32) default NULL,
  `modtype` varchar(32) default NULL,
  `rankedonly` tinyint(1) unsigned NOT NULL default '1',
  `description` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Dumping data
-- ----------------------------

REPLACE INTO `ps_config_awards` VALUES (1, 1, 5, 'player', 0, '', 'Игрок с лучшим навыком игры', '', '{$player.link} получил награду за лучший навык игры - {$award.value}', '{$skill}', 'desc', '', 0, '%.02f', NULL, NULL, 1, 'Лучший игрок');
REPLACE INTO `ps_config_awards` VALUES (2, 1, 90, 'player', 0, '', 'Игрок с наибольшим кол-вом удачно взорванных бомб', '', '{$player.link} имеет наибольшее кол-во удачно взорванных бомб ({$award.value} bombs)', '{$bombexploded}', 'desc', '', 0, 'commify', 'halflife', 'cstrike', 1, 'Разрушитель');
REPLACE INTO `ps_config_awards` VALUES (3, 1, 10, 'player', 0, '', 'Игрок с наибольшим кол-вом убийств (за любую команду)', '', '{$player.link} убил больше всего игроков ({$award.value})', '{$kills}', 'desc', '', 0, 'commify', NULL, NULL, 1, 'Душегуб');
REPLACE INTO `ps_config_awards` VALUES (4, 1, 110, 'player', 0, '', 'Игрок, рискующий жизнью, ради спасения заложников', '', '{$player.link} спас больше всего заложников ({$award.value})', '{$rescuedhostages}', 'desc', '', 0, 'commify', 'halflife', 'cstrike', 1, 'Мастер эвакуации');
REPLACE INTO `ps_config_awards` VALUES (5, 1, 70, 'player', 0, '', 'Игрок с наибольшим временем онлайн', '', '{$player.link} больше всего находился в игре ({$award.value})', '{$onlinetime}', 'desc', '', 0, 'compacttime', NULL, NULL, 1, 'Постоялец');
REPLACE INTO `ps_config_awards` VALUES (6, 1, 170, 'weaponclass', 0, '', 'Игрок с наибольшим кол-вом убийств по типу оружия', '', '{$player.link} убил {$award.value} игроков с помощью {$weapon.class}', '{$kills}', 'desc', '', 0, 'commify', NULL, NULL, 1, 'Мастер по типам оружия');
REPLACE INTO `ps_config_awards` VALUES (7, 1, 180, 'weapon', 0, '', 'Игрок с наибольшим кол-вом убийств по определенному оружию', '', '{$player.link} убил {$award.value} игроков с помощью {$weapon.link}', '{$kills}', 'desc', '', 0, 'commify', NULL, NULL, 1, 'Оружейный специалист');
REPLACE INTO `ps_config_awards` VALUES (8, 1, 80, 'player', 0, '', 'Игрок с лучшим процентом удачно взорванных бомб', '', '{$player.link} имеет лучший процент подрыва бомб - {$award.value}', '{$bombrunner} / {$bombexploded} * 100', 'desc', '', 0, '%0.02f%%', 'halflife', 'cstrike', 1, 'Разрушитель (%)');
REPLACE INTO `ps_config_awards` VALUES (9, 1, 100, 'player', 0, '', 'Игрок с наибольшим процентом удачных обезвреживаний (должно быть хотя бы 5 обезвреживаний)', '', '{$player.link} имеет лучший процент обезвреживаний - {$award.value}', '{$bombdefused} / {$bombdefuseattempts} * 100', 'desc', '{$bombdefused} >= 5', 0, '%0.02f%%', 'halflife', 'cstrike', 1, 'Сапёр');
REPLACE INTO `ps_config_awards` VALUES (10, 1, 30, 'player', 0, '', 'Игрок, получивший наибольшее кол-во бонусных очков', '', '{$player.link} получил наибольшее кол-во бонусных очков ({$award.value})', '{$totalbonus}', 'desc', '', 0, 'commify', NULL, NULL, 1, 'Охотник за бонусами');
REPLACE INTO `ps_config_awards` VALUES (11, 1, 50, 'player', 1, '', 'Игрок, который убил больше всех товарищей по команде', '', '{$player.link} убил больше всех товарищей по команде ({$award.value})', '{$ffkills}', 'desc', '', 0, 'commify', NULL, NULL, 1, 'Худший напарник');
REPLACE INTO `ps_config_awards` VALUES (12, 1, 40, 'player', 1, '', 'Игрок, которому незачем жить', '', '{$player.link} совершил больше всех самоубийств - ({$award.value})', '{$suicides}', 'desc', '', 0, 'commify', NULL, NULL, 1, 'Король суицида');
REPLACE INTO `ps_config_awards` VALUES (13, 1, 60, 'player', 1, '', 'Игрок с наибольшим процентом убийств товарищей по команде', '', '{$player.link} имеет наибольший процент убийств товарищей по команде ({$award.value})', '{$ffkills} / {$kills} * 100', 'desc', '', 0, '%0.02f%%', NULL, NULL, 1, 'Худший напарник (%)');
REPLACE INTO `ps_config_awards` VALUES (14, 1, 120, 'player', 1, '', 'Игрок, предпочитающий убивать заложников, вместо того, чтобы спасать их', '', '{$player.link} убил больше всего заложников ({$award.value})', '{$killedhostages}', 'desc', '', 0, '%s', 'halflife', 'cstrike', 1, 'Убийца невинных');
REPLACE INTO `ps_config_awards` VALUES (15, 1, 130, 'player', 0, '', 'Игрок, любящий нападать из тени!', '', '{$player.link} убил наибольшее кол-во игроков ударом в спину ({$award.value})', '{$backstabkills}', 'desc', '', 0, 'commify', 'halflife', 'tf2', 1, 'Бесшумный убийца');

SET FOREIGN_KEY_CHECKS=1;