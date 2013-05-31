CREATE TABLE IF NOT EXISTS `emails` (
 `id` int(11) NOT NULL auto_increment,
 `to_email` varchar(255) NOT NULL,
 `to_name` varchar(255) default NULL,
 `from_email` varchar(255) NOT NULL,
 `from_name` varchar(255) default NULL,
 `reply_to_email` varchar(255) default NULL,
 `reply_to_name` varchar(255) default NULL,
 `subject` varchar(255) NOT NULL,
 `html` text NOT NULL,
 `plain_text` text NULL,
 `attachments` text,
 `send_on` datetime default NULL,
 `created_on` datetime NOT NULL,
 PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `meta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keywords` varchar(255) NOT NULL,
  `keywords_overwrite` enum('N','Y') NOT NULL DEFAULT 'N',
  `description` varchar(255) NOT NULL,
  `description_overwrite` enum('N','Y') NOT NULL DEFAULT 'N',
  `title` varchar(255) NOT NULL,
  `title_overwrite` enum('N','Y') NOT NULL DEFAULT 'N',
  `url` varchar(255) NOT NULL,
  `url_overwrite` enum('N','Y') NOT NULL DEFAULT 'N',
  `custom` text CHARACTER SET utf8 COMMENT 'used for custom meta-information',
  `data` text COMMENT 'used for extra meta-information',
  PRIMARY KEY (`id`),
  KEY `idx_url` (`url`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Meta-information' AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `modules` (
 `name` varchar(255) NOT NULL COMMENT 'unique module name',
 `installed_on` datetime NOT NULL,
 PRIMARY KEY (`name`),
 KEY `idx_name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE IF NOT EXISTS `modules_settings` (
 `module` varchar(255) NOT NULL COMMENT 'name of the module',
 `name` varchar(255) NOT NULL COMMENT 'name of the setting',
 `value` text NOT NULL COMMENT 'serialized value',
 PRIMARY KEY (`module`(25),`name`(100))
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE IF NOT EXISTS `modules_tags` (
 `module` varchar(255) NOT NULL,
 `tag_id` int(11) NOT NULL,
 `other_id` int(11) NOT NULL,
 PRIMARY KEY (`module`,`tag_id`,`other_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `timezones`;
CREATE TABLE IF NOT EXISTS `timezones` (
 `id` int(11) NOT NULL auto_increment,
 `timezone` varchar(255) NOT NULL,
 PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


INSERT INTO `timezones` (`id`, `timezone`) VALUES
(1, 'Africa/Abidjan'),
(2, 'Africa/Accra'),
(3, 'Africa/Addis_Ababa'),
(4, 'Africa/Algiers'),
(5, 'Africa/Asmara'),
(6, 'Africa/Asmera'),
(7, 'Africa/Bamako'),
(8, 'Africa/Bangui'),
(9, 'Africa/Banjul'),
(10, 'Africa/Bissau'),
(11, 'Africa/Blantyre'),
(12, 'Africa/Brazzaville'),
(13, 'Africa/Bujumbura'),
(14, 'Africa/Cairo'),
(15, 'Africa/Casablanca'),
(16, 'Africa/Ceuta'),
(17, 'Africa/Conakry'),
(18, 'Africa/Dakar'),
(19, 'Africa/Dar_es_Salaam'),
(20, 'Africa/Djibouti'),
(21, 'Africa/Douala'),
(22, 'Africa/El_Aaiun'),
(23, 'Africa/Freetown'),
(24, 'Africa/Gaborone'),
(25, 'Africa/Harare'),
(26, 'Africa/Johannesburg'),
(27, 'Africa/Kampala'),
(28, 'Africa/Khartoum'),
(29, 'Africa/Kigali'),
(30, 'Africa/Kinshasa'),
(31, 'Africa/Lagos'),
(32, 'Africa/Libreville'),
(33, 'Africa/Lome'),
(34, 'Africa/Luanda'),
(35, 'Africa/Lubumbashi'),
(36, 'Africa/Lusaka'),
(37, 'Africa/Malabo'),
(38, 'Africa/Maputo'),
(39, 'Africa/Maseru'),
(40, 'Africa/Mbabane'),
(41, 'Africa/Mogadishu'),
(42, 'Africa/Monrovia'),
(43, 'Africa/Nairobi'),
(44, 'Africa/Ndjamena'),
(45, 'Africa/Niamey'),
(46, 'Africa/Nouakchott'),
(47, 'Africa/Ouagadougou'),
(48, 'Africa/Porto-Novo'),
(49, 'Africa/Sao_Tome'),
(50, 'Africa/Timbuktu'),
(51, 'Africa/Tripoli'),
(52, 'Africa/Tunis'),
(53, 'Africa/Windhoek'),
(54, 'America/Adak'),
(55, 'America/Anchorage'),
(56, 'America/Anguilla'),
(57, 'America/Antigua'),
(58, 'America/Araguaina'),
(59, 'America/Argentina/Buenos_Aires'),
(60, 'America/Argentina/Catamarca'),
(61, 'America/Argentina/ComodRivadavia'),
(62, 'America/Argentina/Cordoba'),
(63, 'America/Argentina/Jujuy'),
(64, 'America/Argentina/La_Rioja'),
(65, 'America/Argentina/Mendoza'),
(66, 'America/Argentina/Rio_Gallegos'),
(67, 'America/Argentina/Salta'),
(68, 'America/Argentina/San_Juan'),
(69, 'America/Argentina/San_Luis'),
(70, 'America/Argentina/Tucuman'),
(71, 'America/Argentina/Ushuaia'),
(72, 'America/Aruba'),
(73, 'America/Asuncion'),
(74, 'America/Atikokan'),
(75, 'America/Atka'),
(76, 'America/Bahia'),
(77, 'America/Barbados'),
(78, 'America/Belem'),
(79, 'America/Belize'),
(80, 'America/Blanc-Sablon'),
(81, 'America/Boa_Vista'),
(82, 'America/Bogota'),
(83, 'America/Boise'),
(84, 'America/Buenos_Aires'),
(85, 'America/Cambridge_Bay'),
(86, 'America/Campo_Grande'),
(87, 'America/Cancun'),
(88, 'America/Caracas'),
(89, 'America/Catamarca'),
(90, 'America/Cayenne'),
(91, 'America/Cayman'),
(92, 'America/Chicago'),
(93, 'America/Chihuahua'),
(94, 'America/Coral_Harbour'),
(95, 'America/Cordoba'),
(96, 'America/Costa_Rica'),
(97, 'America/Cuiaba'),
(98, 'America/Curacao'),
(99, 'America/Danmarkshavn'),
(100, 'America/Dawson'),
(101, 'America/Dawson_Creek'),
(102, 'America/Denver'),
(103, 'America/Detroit'),
(104, 'America/Dominica'),
(105, 'America/Edmonton'),
(106, 'America/Eirunepe'),
(107, 'America/El_Salvador'),
(108, 'America/Ensenada'),
(109, 'America/Fort_Wayne'),
(110, 'America/Fortaleza'),
(111, 'America/Glace_Bay'),
(112, 'America/Godthab'),
(113, 'America/Goose_Bay'),
(114, 'America/Grand_Turk'),
(115, 'America/Grenada'),
(116, 'America/Guadeloupe'),
(117, 'America/Guatemala'),
(118, 'America/Guayaquil'),
(119, 'America/Guyana'),
(120, 'America/Halifax'),
(121, 'America/Havana'),
(122, 'America/Hermosillo'),
(123, 'America/Indiana/Indianapolis'),
(124, 'America/Indiana/Knox'),
(125, 'America/Indiana/Marengo'),
(126, 'America/Indiana/Petersburg'),
(127, 'America/Indiana/Tell_City'),
(128, 'America/Indiana/Vevay'),
(129, 'America/Indiana/Vincennes'),
(130, 'America/Indiana/Winamac'),
(131, 'America/Indianapolis'),
(132, 'America/Inuvik'),
(133, 'America/Iqaluit'),
(134, 'America/Jamaica'),
(135, 'America/Jujuy'),
(136, 'America/Juneau'),
(137, 'America/Kentucky/Louisville'),
(138, 'America/Kentucky/Monticello'),
(139, 'America/Knox_IN'),
(140, 'America/La_Paz'),
(141, 'America/Lima'),
(142, 'America/Los_Angeles'),
(143, 'America/Louisville'),
(144, 'America/Maceio'),
(145, 'America/Managua'),
(146, 'America/Manaus'),
(147, 'America/Marigot'),
(148, 'America/Martinique'),
(149, 'America/Matamoros'),
(150, 'America/Mazatlan'),
(151, 'America/Mendoza'),
(152, 'America/Menominee'),
(153, 'America/Merida'),
(154, 'America/Mexico_City'),
(155, 'America/Miquelon'),
(156, 'America/Moncton'),
(157, 'America/Monterrey'),
(158, 'America/Montevideo'),
(159, 'America/Montreal'),
(160, 'America/Montserrat'),
(161, 'America/Nassau'),
(162, 'America/New_York'),
(163, 'America/Nipigon'),
(164, 'America/Nome'),
(165, 'America/Noronha'),
(166, 'America/North_Dakota/Center'),
(167, 'America/North_Dakota/New_Salem'),
(168, 'America/Ojinaga'),
(169, 'America/Panama'),
(170, 'America/Pangnirtung'),
(171, 'America/Paramaribo'),
(172, 'America/Phoenix'),
(173, 'America/Port-au-Prince'),
(174, 'America/Port_of_Spain'),
(175, 'America/Porto_Acre'),
(176, 'America/Porto_Velho'),
(177, 'America/Puerto_Rico'),
(178, 'America/Rainy_River'),
(179, 'America/Rankin_Inlet'),
(180, 'America/Recife'),
(181, 'America/Regina'),
(182, 'America/Resolute'),
(183, 'America/Rio_Branco'),
(184, 'America/Rosario'),
(185, 'America/Santa_Isabel'),
(186, 'America/Santarem'),
(187, 'America/Santiago'),
(188, 'America/Santo_Domingo'),
(189, 'America/Sao_Paulo'),
(190, 'America/Scoresbysund'),
(191, 'America/Shiprock'),
(192, 'America/St_Barthelemy'),
(193, 'America/St_Johns'),
(194, 'America/St_Kitts'),
(195, 'America/St_Lucia'),
(196, 'America/St_Thomas'),
(197, 'America/St_Vincent'),
(198, 'America/Swift_Current'),
(199, 'America/Tegucigalpa'),
(200, 'America/Thule'),
(201, 'America/Thunder_Bay'),
(202, 'America/Tijuana'),
(203, 'America/Toronto'),
(204, 'America/Tortola'),
(205, 'America/Vancouver'),
(206, 'America/Virgin'),
(207, 'America/Whitehorse'),
(208, 'America/Winnipeg'),
(209, 'America/Yakutat'),
(210, 'America/Yellowknife'),
(211, 'Antarctica/Casey'),
(212, 'Antarctica/Davis'),
(213, 'Antarctica/DumontDUrville'),
(214, 'Antarctica/Mawson'),
(215, 'Antarctica/McMurdo'),
(216, 'Antarctica/Palmer'),
(217, 'Antarctica/Rothera'),
(218, 'Antarctica/South_Pole'),
(219, 'Antarctica/Syowa'),
(220, 'Antarctica/Vostok'),
(221, 'Arctic/Longyearbyen'),
(222, 'Asia/Aden'),
(223, 'Asia/Almaty'),
(224, 'Asia/Amman'),
(225, 'Asia/Anadyr'),
(226, 'Asia/Aqtau'),
(227, 'Asia/Aqtobe'),
(228, 'Asia/Ashgabat'),
(229, 'Asia/Ashkhabad'),
(230, 'Asia/Baghdad'),
(231, 'Asia/Bahrain'),
(232, 'Asia/Baku'),
(233, 'Asia/Bangkok'),
(234, 'Asia/Beirut'),
(235, 'Asia/Bishkek'),
(236, 'Asia/Brunei'),
(237, 'Asia/Calcutta'),
(238, 'Asia/Choibalsan'),
(239, 'Asia/Chongqing'),
(240, 'Asia/Chungking'),
(241, 'Asia/Colombo'),
(242, 'Asia/Dacca'),
(243, 'Asia/Damascus'),
(244, 'Asia/Dhaka'),
(245, 'Asia/Dili'),
(246, 'Asia/Dubai'),
(247, 'Asia/Dushanbe'),
(248, 'Asia/Gaza'),
(249, 'Asia/Harbin'),
(250, 'Asia/Ho_Chi_Minh'),
(251, 'Asia/Hong_Kong'),
(252, 'Asia/Hovd'),
(253, 'Asia/Irkutsk'),
(254, 'Asia/Istanbul'),
(255, 'Asia/Jakarta'),
(256, 'Asia/Jayapura'),
(257, 'Asia/Jerusalem'),
(258, 'Asia/Kabul'),
(259, 'Asia/Kamchatka'),
(260, 'Asia/Karachi'),
(261, 'Asia/Kashgar'),
(262, 'Asia/Kathmandu'),
(263, 'Asia/Katmandu'),
(264, 'Asia/Kolkata'),
(265, 'Asia/Krasnoyarsk'),
(266, 'Asia/Kuala_Lumpur'),
(267, 'Asia/Kuching'),
(268, 'Asia/Kuwait'),
(269, 'Asia/Macao'),
(270, 'Asia/Macau'),
(271, 'Asia/Magadan'),
(272, 'Asia/Makassar'),
(273, 'Asia/Manila'),
(274, 'Asia/Muscat'),
(275, 'Asia/Nicosia'),
(276, 'Asia/Novokuznetsk'),
(277, 'Asia/Novosibirsk'),
(278, 'Asia/Omsk'),
(279, 'Asia/Oral'),
(280, 'Asia/Phnom_Penh'),
(281, 'Asia/Pontianak'),
(282, 'Asia/Pyongyang'),
(283, 'Asia/Qatar'),
(284, 'Asia/Qyzylorda'),
(285, 'Asia/Rangoon'),
(286, 'Asia/Riyadh'),
(287, 'Asia/Saigon'),
(288, 'Asia/Sakhalin'),
(289, 'Asia/Samarkand'),
(290, 'Asia/Seoul'),
(291, 'Asia/Shanghai'),
(292, 'Asia/Singapore'),
(293, 'Asia/Taipei'),
(294, 'Asia/Tashkent'),
(295, 'Asia/Tbilisi'),
(296, 'Asia/Tehran'),
(297, 'Asia/Tel_Aviv'),
(298, 'Asia/Thimbu'),
(299, 'Asia/Thimphu'),
(300, 'Asia/Tokyo'),
(301, 'Asia/Ujung_Pandang'),
(302, 'Asia/Ulaanbaatar'),
(303, 'Asia/Ulan_Bator'),
(304, 'Asia/Urumqi'),
(305, 'Asia/Vientiane'),
(306, 'Asia/Vladivostok'),
(307, 'Asia/Yakutsk'),
(308, 'Asia/Yekaterinburg'),
(309, 'Asia/Yerevan'),
(310, 'Atlantic/Azores'),
(311, 'Atlantic/Bermuda'),
(312, 'Atlantic/Canary'),
(313, 'Atlantic/Cape_Verde'),
(314, 'Atlantic/Faeroe'),
(315, 'Atlantic/Faroe'),
(316, 'Atlantic/Jan_Mayen'),
(317, 'Atlantic/Madeira'),
(318, 'Atlantic/Reykjavik'),
(319, 'Atlantic/South_Georgia'),
(320, 'Atlantic/St_Helena'),
(321, 'Atlantic/Stanley'),
(322, 'Australia/ACT'),
(323, 'Australia/Adelaide'),
(324, 'Australia/Brisbane'),
(325, 'Australia/Broken_Hill'),
(326, 'Australia/Canberra'),
(327, 'Australia/Currie'),
(328, 'Australia/Darwin'),
(329, 'Australia/Eucla'),
(330, 'Australia/Hobart'),
(331, 'Australia/LHI'),
(332, 'Australia/Lindeman'),
(333, 'Australia/Lord_Howe'),
(334, 'Australia/Melbourne'),
(335, 'Australia/North'),
(336, 'Australia/NSW'),
(337, 'Australia/Perth'),
(338, 'Australia/Queensland'),
(339, 'Australia/South'),
(340, 'Australia/Sydney'),
(341, 'Australia/Tasmania'),
(342, 'Australia/Victoria'),
(343, 'Australia/West'),
(344, 'Australia/Yancowinna'),
(345, 'Europe/Amsterdam'),
(346, 'Europe/Andorra'),
(347, 'Europe/Athens'),
(348, 'Europe/Belfast'),
(349, 'Europe/Belgrade'),
(350, 'Europe/Berlin'),
(351, 'Europe/Bratislava'),
(352, 'Europe/Brussels'),
(353, 'Europe/Bucharest'),
(354, 'Europe/Budapest'),
(355, 'Europe/Chisinau'),
(356, 'Europe/Copenhagen'),
(357, 'Europe/Dublin'),
(358, 'Europe/Gibraltar'),
(359, 'Europe/Guernsey'),
(360, 'Europe/Helsinki'),
(361, 'Europe/Isle_of_Man'),
(362, 'Europe/Istanbul'),
(363, 'Europe/Jersey'),
(364, 'Europe/Kaliningrad'),
(365, 'Europe/Kiev'),
(366, 'Europe/Lisbon'),
(367, 'Europe/Ljubljana'),
(368, 'Europe/London'),
(369, 'Europe/Luxembourg'),
(370, 'Europe/Madrid'),
(371, 'Europe/Malta'),
(372, 'Europe/Mariehamn'),
(373, 'Europe/Minsk'),
(374, 'Europe/Monaco'),
(375, 'Europe/Moscow'),
(376, 'Europe/Nicosia'),
(377, 'Europe/Oslo'),
(378, 'Europe/Paris'),
(379, 'Europe/Podgorica'),
(380, 'Europe/Prague'),
(381, 'Europe/Riga'),
(382, 'Europe/Rome'),
(383, 'Europe/Samara'),
(384, 'Europe/San_Marino'),
(385, 'Europe/Sarajevo'),
(386, 'Europe/Simferopol'),
(387, 'Europe/Skopje'),
(388, 'Europe/Sofia'),
(389, 'Europe/Stockholm'),
(390, 'Europe/Tallinn'),
(391, 'Europe/Tirane'),
(392, 'Europe/Tiraspol'),
(393, 'Europe/Uzhgorod'),
(394, 'Europe/Vaduz'),
(395, 'Europe/Vatican'),
(396, 'Europe/Vienna'),
(397, 'Europe/Vilnius'),
(398, 'Europe/Volgograd'),
(399, 'Europe/Warsaw'),
(400, 'Europe/Zagreb'),
(401, 'Europe/Zaporozhye'),
(402, 'Europe/Zurich'),
(403, 'Indian/Antananarivo'),
(404, 'Indian/Chagos'),
(405, 'Indian/Christmas'),
(406, 'Indian/Cocos'),
(407, 'Indian/Comoro'),
(408, 'Indian/Kerguelen'),
(409, 'Indian/Mahe'),
(410, 'Indian/Maldives'),
(411, 'Indian/Mauritius'),
(412, 'Indian/Mayotte'),
(413, 'Indian/Reunion'),
(414, 'Pacific/Apia'),
(415, 'Pacific/Auckland'),
(416, 'Pacific/Chatham'),
(417, 'Pacific/Easter'),
(418, 'Pacific/Efate'),
(419, 'Pacific/Enderbury'),
(420, 'Pacific/Fakaofo'),
(421, 'Pacific/Fiji'),
(422, 'Pacific/Funafuti'),
(423, 'Pacific/Galapagos'),
(424, 'Pacific/Gambier'),
(425, 'Pacific/Guadalcanal'),
(426, 'Pacific/Guam'),
(427, 'Pacific/Honolulu'),
(428, 'Pacific/Johnston'),
(429, 'Pacific/Kiritimati'),
(430, 'Pacific/Kosrae'),
(431, 'Pacific/Kwajalein'),
(432, 'Pacific/Majuro'),
(433, 'Pacific/Marquesas'),
(434, 'Pacific/Midway'),
(435, 'Pacific/Nauru'),
(436, 'Pacific/Niue'),
(437, 'Pacific/Norfolk'),
(438, 'Pacific/Noumea'),
(439, 'Pacific/Pago_Pago'),
(440, 'Pacific/Palau'),
(441, 'Pacific/Pitcairn'),
(442, 'Pacific/Ponape'),
(443, 'Pacific/Port_Moresby'),
(444, 'Pacific/Rarotonga'),
(445, 'Pacific/Saipan'),
(446, 'Pacific/Samoa'),
(447, 'Pacific/Tahiti'),
(448, 'Pacific/Tarawa'),
(449, 'Pacific/Tongatapu'),
(450, 'Pacific/Truk'),
(451, 'Pacific/Wake'),
(452, 'Pacific/Wallis'),
(453, 'Pacific/Yap');


CREATE TABLE IF NOT EXISTS `groups` (
 `id` int(11) NOT NULL auto_increment,
 `name` varchar(255) NOT NULL,
 `parameters` text COMMENT 'serialized array containing default user module/action rights',
 PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


INSERT INTO `groups` (`id`, `name`, `parameters`) VALUES
(1, 'admin', NULL) ON DUPLICATE KEY UPDATE id=1;


CREATE TABLE IF NOT EXISTS `groups_rights_actions` (
 `id` int(11) NOT NULL auto_increment,
 `group_id` int(11) NOT NULL,
 `module` varchar(255) NOT NULL COMMENT 'name of the module',
 `action` varchar(255) NOT NULL COMMENT 'name of the action',
 `level` double NOT NULL default '1' COMMENT 'unix type levels 1, 3, 5 and 7',
 PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `groups_rights_modules` (
 `id` int(11) NOT NULL auto_increment,
 `group_id` int(11) NOT NULL,
 `module` varchar(255) NOT NULL COMMENT 'name of the module',
 PRIMARY KEY (`id`),
 KEY `idx_group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE  TABLE IF NOT EXISTS `backend_navigation` (
  `id` INT(11) UNSIGNED NOT NULL auto_increment,
  `parent_id` INT(11) NOT NULL ,
  `label` VARCHAR(255) NOT NULL ,
  `url` VARCHAR(255) NULL ,
  `selected_for` TEXT NULL ,
  `sequence` INT(11) NOT NULL ,
  PRIMARY KEY (`id`) )
 ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `hooks_queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module` varchar(255) NOT NULL,
  `callback` text NOT NULL,
  `data` text ,
  `status` enum('busy','error','queued') NOT NULL DEFAULT 'queued',
  `created_on` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `hooks_subscriptions` (
  `event_module` varchar(255) NOT NULL,
  `event_name` varchar(255) NOT NULL,
  `module` varchar(255) NOT NULL,
  `callback` text NOT NULL,
  `created_on` datetime NOT NULL,
  UNIQUE KEY `event_module` (`event_module`(100),`event_name`(100),`module`(100))
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
