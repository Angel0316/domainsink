-- ================================================================
--
-- @version $Id: structure.sql 2017-06-01 12:12:05 gewa $
-- @package CMS Pro
-- @copyright 2019. wojoscripts.com
--
-- ================================================================
-- Database Content
-- ================================================================
--
-- Table structure for table `activity`
--

DROP TABLE IF EXISTS `activity`;
CREATE TABLE IF NOT EXISTS `activity` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `username` varchar(80) DEFAULT NULL,
  `ip` varbinary(16) DEFAULT NULL,
  `failed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `failed_last` int(11) unsigned NOT NULL DEFAULT '0',
  `type` varchar(20) DEFAULT NULL,
  `message` varchar(150) DEFAULT NULL,
  `importance` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1 yes, 0 =no',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `banlist`
--

DROP TABLE IF EXISTS `banlist`;
CREATE TABLE IF NOT EXISTS `banlist` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `item` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('IP','Email') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'IP',
  `comment` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ban_ip` (`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `uid` int(11) unsigned NOT NULL DEFAULT '0',
  `mid` int(11) unsigned NOT NULL DEFAULT '0',
  `cid` int(11) unsigned NOT NULL DEFAULT '0',
  `tax` decimal(13,2) unsigned NOT NULL DEFAULT '0.00',
  `totaltax` decimal(13,2) unsigned NOT NULL DEFAULT '0.00',
  `coupon` decimal(13,2) unsigned NOT NULL DEFAULT '0.00',
  `total` decimal(13,2) unsigned NOT NULL DEFAULT '0.00',
  `originalprice` decimal(13,2) unsigned NOT NULL DEFAULT '0.00',
  `totalprice` decimal(13,2) unsigned NOT NULL DEFAULT '0.00',
  `cart_id` varchar(100) DEFAULT NULL,
  `order_id` varchar(100) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`),
  KEY `idx_user` (`uid`),
  KEY `idx_membership` (`mid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
CREATE TABLE IF NOT EXISTS `countries` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `abbr` varchar(2) NOT NULL,
  `name` varchar(70) NOT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `home` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `vat` decimal(13,2) unsigned NOT NULL DEFAULT '0.00',
  `sorting` smallint(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `abbrv` (`abbr`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` VALUES(1, 'AF', 'Afghanistan', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(2, 'AL', 'Albania', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(3, 'DZ', 'Algeria', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(4, 'AS', 'American Samoa', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(5, 'AD', 'Andorra', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(6, 'AO', 'Angola', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(7, 'AI', 'Anguilla', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(8, 'AQ', 'Antarctica', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(9, 'AG', 'Antigua and Barbuda', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(10, 'AR', 'Argentina', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(11, 'AM', 'Armenia', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(12, 'AW', 'Aruba', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(13, 'AU', 'Australia', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(14, 'AT', 'Austria', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(15, 'AZ', 'Azerbaijan', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(16, 'BS', 'Bahamas', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(17, 'BH', 'Bahrain', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(18, 'BD', 'Bangladesh', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(19, 'BB', 'Barbados', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(20, 'BY', 'Belarus', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(21, 'BE', 'Belgium', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(22, 'BZ', 'Belize', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(23, 'BJ', 'Benin', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(24, 'BM', 'Bermuda', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(25, 'BT', 'Bhutan', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(26, 'BO', 'Bolivia', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(27, 'BA', 'Bosnia and Herzegowina', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(28, 'BW', 'Botswana', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(29, 'BV', 'Bouvet Island', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(30, 'BR', 'Brazil', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(31, 'IO', 'British Indian Ocean Territory', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(32, 'VG', 'British Virgin Islands', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(33, 'BN', 'Brunei Darussalam', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(34, 'BG', 'Bulgaria', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(35, 'BF', 'Burkina Faso', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(36, 'BI', 'Burundi', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(37, 'KH', 'Cambodia', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(38, 'CM', 'Cameroon', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(39, 'CA', 'Canada', 1, 1, '13.00', 1000);
INSERT INTO `countries` VALUES(40, 'CV', 'Cape Verde', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(41, 'KY', 'Cayman Islands', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(42, 'CF', 'Central African Republic', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(43, 'TD', 'Chad', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(44, 'CL', 'Chile', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(45, 'CN', 'China', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(46, 'CX', 'Christmas Island', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(47, 'CC', 'Cocos (Keeling) Islands', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(48, 'CO', 'Colombia', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(49, 'KM', 'Comoros', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(50, 'CG', 'Congo', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(51, 'CK', 'Cook Islands', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(52, 'CR', 'Costa Rica', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(53, 'CI', 'Cote D''ivoire', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(54, 'HR', 'Croatia', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(55, 'CU', 'Cuba', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(56, 'CY', 'Cyprus', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(57, 'CZ', 'Czech Republic', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(58, 'DK', 'Denmark', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(59, 'DJ', 'Djibouti', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(60, 'DM', 'Dominica', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(61, 'DO', 'Dominican Republic', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(62, 'TP', 'East Timor', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(63, 'EC', 'Ecuador', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(64, 'EG', 'Egypt', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(65, 'SV', 'El Salvador', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(66, 'GQ', 'Equatorial Guinea', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(67, 'ER', 'Eritrea', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(68, 'EE', 'Estonia', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(69, 'ET', 'Ethiopia', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(70, 'FK', 'Falkland Islands (Malvinas)', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(71, 'FO', 'Faroe Islands', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(72, 'FJ', 'Fiji', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(73, 'FI', 'Finland', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(74, 'FR', 'France', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(75, 'GF', 'French Guiana', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(76, 'PF', 'French Polynesia', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(77, 'TF', 'French Southern Territories', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(78, 'GA', 'Gabon', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(79, 'GM', 'Gambia', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(80, 'GE', 'Georgia', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(81, 'DE', 'Germany', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(82, 'GH', 'Ghana', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(83, 'GI', 'Gibraltar', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(84, 'GR', 'Greece', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(85, 'GL', 'Greenland', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(86, 'GD', 'Grenada', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(87, 'GP', 'Guadeloupe', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(88, 'GU', 'Guam', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(89, 'GT', 'Guatemala', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(90, 'GN', 'Guinea', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(91, 'GW', 'Guinea-Bissau', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(92, 'GY', 'Guyana', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(93, 'HT', 'Haiti', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(94, 'HM', 'Heard and McDonald Islands', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(95, 'HN', 'Honduras', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(96, 'HK', 'Hong Kong', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(97, 'HU', 'Hungary', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(98, 'IS', 'Iceland', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(99, 'IN', 'India', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(100, 'ID', 'Indonesia', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(101, 'IQ', 'Iraq', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(102, 'IE', 'Ireland', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(103, 'IR', 'Islamic Republic of Iran', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(104, 'IL', 'Israel', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(105, 'IT', 'Italy', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(106, 'JM', 'Jamaica', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(107, 'JP', 'Japan', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(108, 'JO', 'Jordan', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(109, 'KZ', 'Kazakhstan', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(110, 'KE', 'Kenya', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(111, 'KI', 'Kiribati', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(112, 'KP', 'Korea, Dem. Peoples Rep of', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(113, 'KR', 'Korea, Republic of', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(114, 'KW', 'Kuwait', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(115, 'KG', 'Kyrgyzstan', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(116, 'LA', 'Laos', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(117, 'LV', 'Latvia', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(118, 'LB', 'Lebanon', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(119, 'LS', 'Lesotho', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(120, 'LR', 'Liberia', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(121, 'LY', 'Libyan Arab Jamahiriya', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(122, 'LI', 'Liechtenstein', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(123, 'LT', 'Lithuania', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(124, 'LU', 'Luxembourg', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(125, 'MO', 'Macau', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(126, 'MK', 'Macedonia', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(127, 'MG', 'Madagascar', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(128, 'MW', 'Malawi', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(129, 'MY', 'Malaysia', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(130, 'MV', 'Maldives', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(131, 'ML', 'Mali', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(132, 'MT', 'Malta', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(133, 'MH', 'Marshall Islands', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(134, 'MQ', 'Martinique', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(135, 'MR', 'Mauritania', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(136, 'MU', 'Mauritius', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(137, 'YT', 'Mayotte', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(138, 'MX', 'Mexico', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(139, 'FM', 'Micronesia', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(140, 'MD', 'Moldova, Republic of', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(141, 'MC', 'Monaco', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(142, 'MN', 'Mongolia', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(143, 'MS', 'Montserrat', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(144, 'MA', 'Morocco', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(145, 'MZ', 'Mozambique', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(146, 'MM', 'Myanmar', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(147, 'NA', 'Namibia', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(148, 'NR', 'Nauru', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(149, 'NP', 'Nepal', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(150, 'NL', 'Netherlands', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(151, 'AN', 'Netherlands Antilles', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(152, 'NC', 'New Caledonia', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(153, 'NZ', 'New Zealand', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(154, 'NI', 'Nicaragua', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(155, 'NE', 'Niger', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(156, 'NG', 'Nigeria', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(157, 'NU', 'Niue', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(158, 'NF', 'Norfolk Island', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(159, 'MP', 'Northern Mariana Islands', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(160, 'NO', 'Norway', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(161, 'OM', 'Oman', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(162, 'PK', 'Pakistan', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(163, 'PW', 'Palau', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(164, 'PA', 'Panama', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(165, 'PG', 'Papua New Guinea', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(166, 'PY', 'Paraguay', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(167, 'PE', 'Peru', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(168, 'PH', 'Philippines', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(169, 'PN', 'Pitcairn', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(170, 'PL', 'Poland', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(171, 'PT', 'Portugal', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(172, 'PR', 'Puerto Rico', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(173, 'QA', 'Qatar', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(174, 'RE', 'Reunion', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(175, 'RO', 'Romania', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(176, 'RU', 'Russian Federation', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(177, 'RW', 'Rwanda', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(178, 'LC', 'Saint Lucia', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(179, 'WS', 'Samoa', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(180, 'SM', 'San Marino', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(181, 'ST', 'Sao Tome and Principe', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(182, 'SA', 'Saudi Arabia', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(183, 'SN', 'Senegal', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(184, 'RS', 'Serbia', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(185, 'SC', 'Seychelles', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(186, 'SL', 'Sierra Leone', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(187, 'SG', 'Singapore', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(188, 'SK', 'Slovakia', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(189, 'SI', 'Slovenia', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(190, 'SB', 'Solomon Islands', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(191, 'SO', 'Somalia', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(192, 'ZA', 'South Africa', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(193, 'ES', 'Spain', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(194, 'LK', 'Sri Lanka', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(195, 'SH', 'St. Helena', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(196, 'KN', 'St. Kitts and Nevis', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(197, 'PM', 'St. Pierre and Miquelon', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(198, 'VC', 'St. Vincent and the Grenadines', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(199, 'SD', 'Sudan', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(200, 'SR', 'Suriname', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(201, 'SJ', 'Svalbard and Jan Mayen Islands', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(202, 'SZ', 'Swaziland', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(203, 'SE', 'Sweden', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(204, 'CH', 'Switzerland', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(205, 'SY', 'Syrian Arab Republic', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(206, 'TW', 'Taiwan', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(207, 'TJ', 'Tajikistan', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(208, 'TZ', 'Tanzania, United Republic of', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(209, 'TH', 'Thailand', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(210, 'TG', 'Togo', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(211, 'TK', 'Tokelau', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(212, 'TO', 'Tonga', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(213, 'TT', 'Trinidad and Tobago', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(214, 'TN', 'Tunisia', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(215, 'TR', 'Turkey', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(216, 'TM', 'Turkmenistan', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(217, 'TC', 'Turks and Caicos Islands', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(218, 'TV', 'Tuvalu', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(219, 'UG', 'Uganda', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(220, 'UA', 'Ukraine', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(221, 'AE', 'United Arab Emirates', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(222, 'GB', 'United Kingdom (GB)', 1, 0, '23.00', 999);
INSERT INTO `countries` VALUES(224, 'US', 'United States', 1, 0, '7.50', 998);
INSERT INTO `countries` VALUES(225, 'VI', 'United States Virgin Islands', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(226, 'UY', 'Uruguay', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(227, 'UZ', 'Uzbekistan', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(228, 'VU', 'Vanuatu', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(229, 'VA', 'Vatican City State', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(230, 'VE', 'Venezuela', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(231, 'VN', 'Vietnam', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(232, 'WF', 'Wallis And Futuna Islands', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(233, 'EH', 'Western Sahara', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(234, 'YE', 'Yemen', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(235, 'ZR', 'Zaire', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(236, 'ZM', 'Zambia', 1, 0, '0.00', 0);
INSERT INTO `countries` VALUES(237, 'ZW', 'Zimbabwe', 1, 0, '0.00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

DROP TABLE IF EXISTS `coupons`;
CREATE TABLE IF NOT EXISTS `coupons` (
  `id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `code` varchar(30) NOT NULL,
  `discount` smallint(2) unsigned NOT NULL DEFAULT '0',
  `type` enum('p','a') NOT NULL DEFAULT 'p',
  `membership_id` varchar(50) NOT NULL DEFAULT '0',
  `ctype` varchar(30) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields`
--

DROP TABLE IF EXISTS `custom_fields`;
CREATE TABLE IF NOT EXISTS `custom_fields` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `title_en` varchar(60) NOT NULL,
  `tooltip_en` varchar(100) DEFAULT NULL,
  `name` varchar(20) NOT NULL,
  `required` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `section` varchar(30) DEFAULT NULL,
  `sorting` int(4) unsigned NOT NULL DEFAULT '0',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- --------------------------------------------------------

--
-- Table structure for table `custom_fields_data`
--

DROP TABLE IF EXISTS `custom_fields_data`;
CREATE TABLE IF NOT EXISTS `custom_fields_data` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `field_id` int(11) unsigned NOT NULL DEFAULT '0',
  `digishop_id` int(11) unsigned NOT NULL DEFAULT '0',
  `portfolio_id` int(11) unsigned NOT NULL DEFAULT '0',
  `field_name` varchar(40) DEFAULT NULL,
  `field_value` varchar(100) DEFAULT NULL,
  `section` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user` (`user_id`),
  KEY `idx_field` (`field_id`),
  KEY `idx_digishop` (`digishop_id`),
  KEY `idx_portfolio` (`portfolio_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

DROP TABLE IF EXISTS `email_templates`;
CREATE TABLE IF NOT EXISTS `email_templates` (
  `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name_en` varchar(100) NOT NULL,
  `subject_en` varchar(150) NOT NULL,
  `help_en` tinytext,
  `body_en` text NOT NULL,
  `type` enum('news','mailer') DEFAULT 'mailer',
  `typeid` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` VALUES(1, 'Registration Email', 'Please verify your email', 'This template is used to send Registration Verification Email, when Configuration->Registration Verification is set to YES', '<table bgcolor="#F0F0F0" border="0" cellpadding="0" cellspacing="0" height="100%" width="100%">\r\n  <tbody><tr>\r\n    <td style="background-color: #ffffff;" align="center" bgcolor="#ffffff" valign="top"><br>\r\n<table class="container" style="width:600px;max-width:600px" border="0" cellpadding="0" cellspacing="0" width="600px">\r\n<tbody><tr>\r\n<td height="30"></td>\r\n</tr>\r\n<tr>\r\n<td align="center">[LOGO]</td>\r\n</tr>\r\n<tr>\r\n<td height="20"></td>\r\n</tr>\r\n<tr>\r\n<td><p style="text-align:center;margin:0;font-family:Helvetica, Arial, sans-serif;font-size:26px;color:#222222;">Welcome to [COMPANY]</p></td>\r\n</tr>\r\n<tr>\r\n<td align="center"><img src="[SITEURL]/assets/images/line.png" alt="line" height="43" width="251" style="width:250px"></td>\r\n</tr>\r\n<tr>\r\n<td height="30"></td>\r\n</tr>\r\n<tr>\r\n<td class="container-padding content" style="padding-left:24px;padding-right:24px;padding-top:12px;padding-bottom:12px;background-color:#ffffff" align="left"><br>\r\n  <div class="title" style="font-family:Helvetica, Arial, sans-serif;font-size:18px;font-weight:600;color:#374550">Congratulations!</div>\r\n  <br>\r\n  <div class="body-text" style="font-family:Helvetica, Arial, sans-serif;font-size:14px;line-height:20px;text-align:left;color:#222222"> You are now registered member<br>\r\n    <br>\r\n    The administrator of this site has requested all new accounts to be activated by the users who created them thus your account is currently inactive. To activate your account, please visit the link below. <br>\r\n    <br>\r\n  </div></td>\r\n</tr>\r\n<tr>\r\n<td class="container-padding content" style="padding-left:24px;padding-right:24px;padding-top:12px;padding-bottom:12px;background-color:#ffffff" align="left"><div class="body-text" style="font-family:Helvetica, Arial, sans-serif;font-size:14px;line-height:20px;text-align:left;color:#222222"> Here are your login details. Please keep them in a safe place: <br>\r\n    <br>\r\n    Username: [USERNAME]<br>\r\n    Password: [PASSWORD] </div></td>\r\n</tr>\r\n<tr>\r\n<td height="65"></td>\r\n</tr>\r\n<tr>\r\n<td align="center"><table>\r\n    <tbody><tr>\r\n<td style="background:#289CDC; padding:15px 18px;-webkit-border-radius: 4px; border-radius: 4px;font-family:Helvetica, Arial, sans-serif" align="center" bgcolor="#289CDC"><div align="center"> <a target="_blank" href="[LINK]" style="color:#ffffff;text-decoration: none;font-size: 16px;">Activate your Account</a> </div></td>\r\n    </tr>\r\n  </tbody></table></td>\r\n</tr>\r\n<tr>\r\n<td height="65"></td>\r\n</tr>\r\n<tr>\r\n<td style="border-bottom:1px solid #DDDDDD;"></td>\r\n</tr>\r\n<tr>\r\n<td height="25"></td>\r\n</tr>\r\n<tr>\r\n<td><table align="center" border="0" cellpadding="0" cellspacing="0" width="100%">\r\n    <tbody><tr>\r\n<td style="font-family:Helvetica, Arial, sans-serif" align="left" valign="top"><div align="left">\r\n<p style="text-align:left;color:#999999;font-size:12px;font-weight:normal;line-height:20px;">This email is sent to you directly from <a href="[SITEURL]">[COMPANY]</a> The information above is gathered from the user input. <br>\r\n  ©[DATE] <a href="[SITEURL]">[COMPANY]</a>. All rights reserved. \r\n</p></div></td>\r\n<td width="30"></td>\r\n<td valign="top" width="52"><a target="_blank" href="http://facebook.com/[FB]"><img src="[SITEURL]/assets/images/facebook.png" alt="facebook icon" height="53" width="52" style="width:52px"></a></td>\r\n<td width="16"></td>\r\n<td valign="top" width="52"><a target="_blank" href="http://twitter.com/[TW]"><img src="[SITEURL]/assets/images/twitter.png" alt="twitter icon" height="53" width="52" style="width:52px"></a></td>\r\n    </tr>\r\n  </tbody></table></td>\r\n</tr>\r\n</tbody></table></td>\r\n  </tr>\r\n</tbody></table>', 'mailer', 'regMail');
INSERT INTO `email_templates` VALUES(2, 'Forgot Password Email', 'Password Reset', 'This template is used for retrieving lost user password', '<table border="0" width="100%" cellspacing="0" cellpadding="0" bgcolor="#F0F0F0">\r\n  <tbody>\r\n    <tr>\r\n<td style="background-color: #ffffff;" align="center" valign="top" bgcolor="#ffffff"><br />\r\n<table class="container" style="width: 100%px; max-width: 600px;" border="0" width="100%" cellspacing="0" cellpadding="0">\r\n<tbody>\r\n  <tr>\r\n    <td height="30"> </td>\r\n  </tr>\r\n  <tr>\r\n    <td align="center">[LOGO]</td>\r\n  </tr>\r\n  <tr>\r\n    <td height="20"> </td>\r\n  </tr>\r\n  <tr>\r\n    <td><p style="text-align: center; margin: 0; font-family: Helvetica, Arial, sans-serif; font-size: 26px; color: #222222;">New password reset from [COMPANY]</p></td>\r\n  </tr>\r\n  <tr>\r\n    <td align="center"><img style="width: 250px;" src="[SITEURL]/assets/images/line.png" alt="line" width="251" height="43" /></td>\r\n  </tr>\r\n  <tr>\r\n    <td height="30"> </td>\r\n  </tr>\r\n  <tr>\r\n    <td class="container-padding content" style="background-color: #ffffff; padding: 12px 24px 12px 24px;" align="left"><br />\r\nHello, [NAME] <br />\r\nIt seems that you or someone requested a new password for you.<br />\r\nWe have generated a new password, as requested: <br /></td>\r\n  </tr>\r\n  <tr>\r\n    <td class="container-padding content" style="background-color: #ffffff; padding: 12px 24px 12px 24px;" align="left"> New Password: [PASSWORD] </td>\r\n  </tr>\r\n  <tr>\r\n    <td height="65"> </td>\r\n  </tr>\r\n  <tr>\r\n    <td align="center"><table>\r\n<tbody>\r\n<tr>\r\n  <td style="background: #289CDC; padding: 15px 18px; -webkit-border-radius: 4px; border-radius: 4px; font-family: Helvetica, Arial, sans-serif;" align="center" bgcolor="#289CDC"><a target="_blank" href="[LINK]" style="color: #ffffff; text-decoration: none; font-size: 16px;">Login</a></td>\r\n</tr>\r\n</tbody>\r\n</table></td>\r\n  </tr>\r\n  <tr>\r\n    <td style="border-bottom: 1px solid #DDDDDD;"> </td>\r\n  </tr>\r\n  <tr>\r\n    <td height="25"> </td>\r\n  </tr>\r\n  <tr>\r\n    <td style="text-align: center;" align="center"><table border="0" width="95%" cellspacing="0" cellpadding="0" align="center">\r\n<tbody>\r\n<tr>\r\n  <td style="font-family: Helvetica, Arial, sans-serif;" align="left" valign="top"><p style="text-align: left; color: #999999; font-size: 12px; font-weight: normal; line-height: 20px;">This email is sent to you directly from <a href="[SITEURL]">[COMPANY]</a> The information above is gathered from the user input. <br />\r\n©[DATE] <a href="[SITEURL]">[COMPANY]</a>. All rights reserved.</p></td>\r\n  <td width="30"> </td>\r\n  <td valign="top" width="52"><a target="_blank" href="http://facebook.com/[FB]"><img style="width: 52px;" src="[SITEURL]/assets/images/facebook.png" alt="facebook icon" width="52" height="53" /></a></td>\r\n  <td width="16"> </td>\r\n  <td valign="top" width="52"><a target="_blank" href="http://twitter.com/[TW]"><img style="width: 52px;" src="[SITEURL]/assets/images/twitter.png" alt="twitter icon" width="52" height="53" /></a></td>\r\n</tr>\r\n</tbody>\r\n</table></td>\r\n  </tr>\r\n</tbody>\r\n</table></td>\r\n    </tr>\r\n  </tbody>\r\n</table>', 'mailer', 'userPassReset');
INSERT INTO `email_templates` VALUES(3, 'Welcome Mail From Admin', 'You have been registered', 'This template is used to send welcome email, when user is added by administrator', '<table border="0" width="100%" cellspacing="0" cellpadding="0" bgcolor="#F0F0F0">\n<tbody>\n<tr>\n<td style="background-color: #ffffff;" align="center" valign="top" bgcolor="#ffffff"><br />\n<table class="container" style="width: 100%px; max-width: 600px;" border="0" width="100%" cellspacing="0" cellpadding="0">\n<tbody>\n<tr>\n<td height="30"> </td>\n</tr>\n<tr>\n<td align="center">[LOGO]</td>\n</tr>\n<tr>\n<td height="20"> </td>\n</tr>\n<tr>\n<td>\n<p style="text-align: center; margin: 0; font-family: Helvetica, Arial, sans-serif; font-size: 26px; color: #222222;">Welcome to [COMPANY]</p>\n</td>\n</tr>\n<tr>\n<td align="center"><img style="width: 250px;" src="[SITEURL]/assets/images/line.png" alt="line" width="251" height="43" /></td>\n</tr>\n<tr>\n<td height="30"> </td>\n</tr>\n<tr>\n<td class="container-padding content" style="background-color: #ffffff; padding: 12px 24px 12px 24px;" align="left"><br />\nHello, [NAME]\n<br /> <br />\nYou''re now a member of [SITE_NAME]. <br /> Here are your login details. Please keep them in a safe place:\n</td>\n</tr>\n<tr>\n<td class="container-padding content" style="background-color: #ffffff; padding: 12px 24px 12px 24px;" align="left">\nHere are your login details. Please keep them in a safe place: <br /> <br /> Username: [USERNAME]<br /> Password: [PASSWORD]\n</td>\n</tr>\n<tr>\n<td height="65"> </td>\n</tr>\n<tr>\n<td align="center">\n<table>\n<tbody>\n<tr>\n<td style="background: #289CDC; padding: 15px 18px; -webkit-border-radius: 4px; border-radius: 4px; font-family: Helvetica, Arial, sans-serif;" align="center" bgcolor="#289CDC">\n<a target="_blank" href="[LINK]" style="color: #ffffff; text-decoration: none; font-size: 16px;">Login</a>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<tr>\n<td height="65"> </td>\n</tr>\n<tr>\n<td style="border-bottom: 1px solid #DDDDDD;"> </td>\n</tr>\n<tr>\n<td height="25"> </td>\n</tr>\n<tr>\n<td style="text-align: center;" align="center">\n<table border="0" width="95%" cellspacing="0" cellpadding="0" align="center">\n<tbody>\n<tr>\n<td style="font-family: Helvetica, Arial, sans-serif;" align="left" valign="top">\n\n<p style="text-align: left; color: #999999; font-size: 12px; font-weight: normal; line-height: 20px;">This email is sent to you directly from <a href="[SITEURL]">[COMPANY]</a> The information above is gathered from the user input. <br /> ©[DATE] <a href="[SITEURL]">[COMPANY]</a>. All rights reserved.</p>\n\n</td>\n<td width="30"> </td>\n<td valign="top" width="52"><a target="_blank" href="http://facebook.com/[FB]"><img style="width: 52px;" src="[SITEURL]/assets/images/facebook.png" alt="facebook icon" width="52" height="53" /></a></td>\n<td width="16"> </td>\n<td valign="top" width="52"><a target="_blank" href="http://twitter.com/[TW]"><img style="width: 52px;" src="[SITEURL]/assets/images/twitter.png" alt="twitter icon" width="52" height="53" /></a></td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n</tbody>\n</table>', 'mailer', 'regMailAdmin');
INSERT INTO `email_templates` VALUES(4, 'Default Newsletter', 'Newsletter', 'This is a default newsletter template', '<table border="0" width="100%" cellspacing="0" cellpadding="0" bgcolor="#F0F0F0">\r\n<tbody>\r\n<tr>\r\n<td style="background-color: #ffffff;" align="center" valign="top" bgcolor="#ffffff"><br />\r\n<table style="width: 100%px; max-width: 600px;" border="0" width="100%" cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td height="30"> </td>\r\n</tr>\r\n<tr>\r\n<td align="center">[LOGO]</td>\r\n</tr>\r\n<tr>\r\n<td height="20"> </td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p style="text-align: center; margin: 0; font-family: Helvetica, Arial, sans-serif; font-size: 26px; color: #222222;">[COMPANY] Newsletter</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td align="center"><img style="width: 250px;" src="[SITEURL]/assets/images/line.png" alt="line" width="251" height="43" /></td>\r\n</tr>\r\n<tr>\r\n<td height="30"> </td>\r\n</tr>\r\n<tr>\r\n<td style="background-color: #ffffff; padding: 12px 24px 12px 24px;" align="left"><br />\r\nHello, [NAME]\r\n<br /> <br />\r\n[ATTACHMENT]\r\n<br /> <br />\r\nNewsletter content goes here...: <br /> \r\n</td>\r\n</tr>\r\n<tr>\r\n<td height="65"> </td>\r\n</tr>\r\n<tr>\r\n<td style="border-bottom: 1px solid #DDDDDD;"> </td>\r\n</tr>\r\n<tr>\r\n<td height="25"> </td>\r\n</tr>\r\n<tr>\r\n<td style="text-align: center;" align="center">\r\n<table border="0" width="95%" cellspacing="0" cellpadding="0" align="center">\r\n<tbody>\r\n<tr>\r\n<td style="font-family: Helvetica, Arial, sans-serif;" align="left" valign="top">\r\n\r\n<p style="text-align: left; color: #999999; font-size: 12px; font-weight: normal; line-height: 20px;">This email is sent to you directly from <a href="[SITEURL]">[COMPANY]</a> The information above is gathered from the user input. <br /> ©[DATE] <a href="[SITEURL]">[COMPANY]</a>. All rights reserved.</p>\r\n\r\n</td>\r\n<td width="30"> </td>\r\n<td valign="top" width="52"><a target="_blank" href="http://facebook.com/[FB]"><img style="width: 52px;" src="[SITEURL]/assets/images/facebook.png" alt="facebook icon" width="52" height="53" /></a></td>\r\n<td width="16"> </td>\r\n<td valign="top" width="52"><a target="_blank" href="http://twitter.com/[TW]"><img style="width: 52px;" src="[SITEURL]/assets/images/twitter.png" alt="twitter icon" width="52" height="53" /></a></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>', 'news', 'newsletter');
INSERT INTO `email_templates` VALUES(5, 'Transaction Completed', 'Payment Completed', 'This template is used to notify administrator on successful payment transaction', '<table bgcolor="#F0F0F0" border="0" cellpadding="0" cellspacing="0" height="100%" width="100%">\n  <tbody>\n    <tr>\n<td style="background-color: #ffffff;" align="center" bgcolor="#ffffff" valign="top"><br>\n<table style="width:100%px;max-width:600px" border="0" cellpadding="0" cellspacing="0" width="100%">\n<tbody>\n  <tr>\n    <td height="30"></td>\n  </tr>\n  <tr>\n    <td align="center">[LOGO]</td>\n  </tr>\n  <tr>\n    <td height="20"></td>\n  </tr>\n  <tr>\n    <td><p style="text-align:center;margin:0;font-family:Helvetica, Arial, sans-serif;font-size:26px;color:#222222;"> Hello Admin</p></td>\n  </tr>\n  <tr>\n    <td align="center"><img src="[SITEURL]/assets/images/line.png" alt="line" style="width:250px" height="43" width="251"></td>\n  </tr>\n  <tr>\n    <td height="30"></td>\n  </tr>\n  <tr>\n    <td class="container-padding content" style="padding-left:24px;padding-right:24px;padding-top:12px;padding-bottom:12px;background-color:#ffffff" align="left">\n<div class="body-text" style="font-family:Helvetica, Arial, sans-serif;font-size:14px;line-height:20px;text-align:left;color:#222222"> You have received new payment following: </div>\n<br>\n<div class="body-text" style="font-family:Helvetica, Arial, sans-serif;font-size:14px;line-height:20px;text-align:left;color:#222222">\n<table>\n<tbody><tr>\n  <td style="width:120px"><strong>Username:</strong></td>\n  <td>[NAME]</td>\n</tr>\n<tr>\n  <td><strong>Membership:</strong></td>\n  <td>[ITEMNAME]</td>\n</tr>\n<tr>\n  <td><strong>Price:</strong></td>\n  <td>[PRICE]</td>\n</tr>\n<tr>\n  <td><strong>Status:</strong></td>\n  <td>[STATUS]</td>\n</tr>\n<tr>\n  <td><strong>Processor:</strong></td>\n  <td>[PP]</td>\n</tr>\n<tr>\n  <td><strong>IP:</strong></td>\n  <td>[IP]</td>\n</tr>\n</tbody></table>\n</div>\n</td>\n  </tr>\n  <tr>\n    <td height="65"></td>\n  </tr>\n  <tr>\n    <td style="border-bottom:1px solid #DDDDDD;"></td>\n  </tr>\n  <tr>\n    <td height="25"></td>\n  </tr>\n  <tr>\n    <td style="text-align:center" align="center"><table align="center" border="0" cellpadding="0" cellspacing="0" width="95%">\n<tbody>\n<tr>\n  <td style="font-family:Helvetica, Arial, sans-serif" align="left" valign="top"><div align="left">\n<p style="text-align:left;color:#999999;font-size:12px;font-weight:normal;line-height:20px;">This email is sent to you directly from <a href="[SITEURL]">[COMPANY]</a> The information above is gathered from the user input. <br>\n©[DATE] <a href="[SITEURL]">[COMPANY]</a>. All rights reserved. </p>\n    </div></td>\n  <td width="30"></td>\n  <td valign="top" width="52"><a target="_blank" href="http://facebook.com/[FB]"><img src="[SITEURL]/assets/images/facebook.png" alt="facebook icon" style="width:52px" height="53" width="52"></a></td>\n  <td width="16"></td>\n  <td valign="top" width="52"><a target="_blank" href="http://twitter.com/[TW]"><img src="[SITEURL]/assets/images/twitter.png" alt="twitter icon" style="width:52px" height="53" width="52"></a></td>\n</tr>\n</tbody>\n</table></td>\n  </tr>\n</tbody>\n</table></td>\n    </tr>\n  </tbody>\n</table>', 'mailer', 'payComplete');
INSERT INTO `email_templates` VALUES(6, 'Transaction Suspicious', 'Suspicious Transaction', 'This template is used to notify administrator on failed/suspicious payment transaction', '<table bgcolor="#F0F0F0" border="0" cellpadding="0" cellspacing="0" height="100%" width="100%">\n  <tbody>\n    <tr>\n<td style="background-color: #ffffff;" align="center" bgcolor="#ffffff" valign="top"><br>\n<table style="width:100%px;max-width:600px" border="0" cellpadding="0" cellspacing="0" width="100%">\n<tbody>\n  <tr>\n    <td height="30"></td>\n  </tr>\n  <tr>\n    <td align="center">[LOGO]</td>\n  </tr>\n  <tr>\n    <td height="20"></td>\n  </tr>\n  <tr>\n    <td><p style="text-align:center;margin:0;font-family:Helvetica, Arial, sans-serif;font-size:26px;color:#222222;"> Hello Admin</p></td>\n  </tr>\n  <tr>\n    <td align="center"><img src="[SITEURL]/assets/images/line.png" alt="line" style="width:250px" height="43" width="251"></td>\n  </tr>\n  <tr>\n    <td height="30"></td>\n  </tr>\n  <tr>\n    <td class="container-padding content" style="padding-left:24px;padding-right:24px;padding-top:12px;padding-bottom:12px;background-color:#ffffff" align="left"><div class="body-text" style="font-family:Helvetica, Arial, sans-serif;font-size:14px;line-height:20px;text-align:left;color:#222222"> The following transaction has been disabled due to suspicious activity: </div>\n<br>\n<br>\n<div class="body-text" style="font-family:Helvetica, Arial, sans-serif;font-size:14px;line-height:20px;text-align:left;color:#222222">\n<table>\n<tbody>\n  <tr>\n    <td style="width:120px"><strong>Buyer:</strong></td>\n    <td>[USERNAME]</td>\n  </tr>\n  <tr>\n    <td><strong>Item:</strong></td>\n    <td>[ITEM]</td>\n  </tr>\n  <tr>\n    <td><strong>Price:</strong></td>\n    <td>[PRICE]</td>\n  </tr>\n  <tr>\n    <td><strong>Status:</strong></td>\n    <td>[STATUS]</td>\n  </tr>\n  <tr>\n    <td><strong>Processor:</strong></td>\n    <td>[PP]</td>\n  </tr>\n</tbody>\n</table>\n</div>\n<br>\n<br>\n<div class="body-text" style="font-family:Helvetica, Arial, sans-serif;font-size:12px;line-height:20px;text-align:left;color:#222222"> <em>Please verify this transaction is correct. If it is, please activate it in the transaction section of your site''s administration control panel. If not, it appears that someone tried to fraudulently obtain products from your site.</em> </div>\n</td>\n  </tr>\n  <tr>\n    <td height="65"></td>\n  </tr>\n  <tr>\n    <td style="border-bottom:1px solid #DDDDDD;"></td>\n  </tr>\n  <tr>\n    <td height="25"></td>\n  </tr>\n  <tr>\n    <td style="text-align:center" align="center"><table align="center" border="0" cellpadding="0" cellspacing="0" width="95%">\n<tbody>\n<tr>\n  <td style="font-family:Helvetica, Arial, sans-serif" align="left" valign="top"><div align="left">\n<p style="text-align:left;color:#999999;font-size:12px;font-weight:normal;line-height:20px;">This email is sent to you directly from <a href="[SITEURL]">[COMPANY]</a> The information above is gathered from the user input. <br>\n©[DATE] <a href="[SITEURL]">[COMPANY]</a>. All rights reserved. </p>\n    </div></td>\n  <td width="30"></td>\n  <td valign="top" width="52"><a target="_blank" href="http://facebook.com/[FB]"><img src="[SITEURL]/assets/images/facebook.png" alt="facebook icon" style="width:52px" height="53" width="52"></a></td>\n  <td width="16"></td>\n  <td valign="top" width="52"><a target="_blank" href="http://twitter.com/[TW]"><img src="[SITEURL]/assets/images/twitter.png" alt="twitter icon" style="width:52px" height="53" width="52"></a></td>\n</tr>\n</tbody>\n</table></td>\n  </tr>\n</tbody>\n</table></td>\n    </tr>\n  </tbody>\n</table>', 'mailer', 'payBad');
INSERT INTO `email_templates` VALUES(7, 'Welcome Email', 'Welcome', 'This template is used to welcome newly registered user when Configuration->Registration Verification and Configuration->Auto Registration are both set to YES', '<table bgcolor="#F0F0F0" border="0" cellpadding="0" cellspacing="0" height="100%" width="100%">\n  <tbody>\n    <tr>\n<td style="background-color: #ffffff;" align="center" bgcolor="#ffffff" valign="top"><br>\n<table class="container" style="width:100%px;max-width:600px" border="0" cellpadding="0" cellspacing="0" width="100%">\n<tbody>\n  <tr>\n    <td height="30"></td>\n  </tr>\n  <tr>\n    <td align="center">[LOGO]</td>\n  </tr>\n  <tr>\n    <td height="20"></td>\n  </tr>\n  <tr>\n    <td><p style="text-align:center;margin:0;font-family:Helvetica, Arial, sans-serif;font-size:26px;color:#222222;">Welcome to [COMPANY]</p></td>\n  </tr>\n  <tr>\n    <td align="center"><img src="[SITEURL]/assets/images/line.png" alt="line" height="43" width="251" style="width:250px"></td>\n  </tr>\n  <tr>\n    <td height="30"></td>\n  </tr>\n  <tr>\n    <td class="container-padding content" style="padding-left:24px;padding-right:24px;padding-top:12px;padding-bottom:12px;background-color:#ffffff" align="left"><br>\n<div class="title" style="font-family:Helvetica, Arial, sans-serif;font-size:18px;font-weight:600;color:#374550">Hello, [NAME]</div>\n<br>\n<br>\n<div class="body-text" style="font-family:Helvetica, Arial, sans-serif;font-size:14px;line-height:20px;text-align:left;color:#222222"> You''re now a member of [SITE_NAME]. <br>\nHere are your login details. Please keep them in a safe place: <br>\n<br>\n</div></td>\n  </tr>\n  <tr>\n    <td class="container-padding content" style="padding-left:24px;padding-right:24px;padding-top:12px;padding-bottom:12px;background-color:#ffffff" align="left"><div class="body-text" style="font-family:Helvetica, Arial, sans-serif;font-size:14px;line-height:20px;text-align:left;color:#222222"> Here are your login details. Please keep them in a safe place: <br>\n<br>\nUsername: [USERNAME]<br>\nPassword: [PASSWORD] </div></td>\n  </tr>\n  <tr>\n    <td height="65"></td>\n  </tr>\n  <tr>\n    <td style="border-bottom:1px solid #DDDDDD;"></td>\n  </tr>\n  <tr>\n    <td height="25"></td>\n  </tr>\n  <tr>\n    <td style="text-align:center" align="center"><table align="center" border="0" cellpadding="0" cellspacing="0" width="95%">\n<tbody>\n<tr>\n  <td style="font-family:Helvetica, Arial, sans-serif" align="left" valign="top"><div align="left">\n<p style="text-align:left;color:#999999;font-size:12px;font-weight:normal;line-height:20px;">This email is sent to you directly from <a href="[SITEURL]">[COMPANY]</a> The information above is gathered from the user input. <br>\n©[DATE] <a href="[SITEURL]">[COMPANY]</a>. All rights reserved. </p>\n    </div></td>\n  <td width="30"></td>\n  <td valign="top" width="52"><a target="_blank" href="http://facebook.com/[FB]"><img src="[SITEURL]/assets/images/facebook.png" alt="facebook icon" height="53" width="52" style="width:52px"></a></td>\n  <td width="16"></td>\n  <td valign="top" width="52"><a target="_blank" href="http://twitter.com/[TW]"><img src="[SITEURL]/assets/images/twitter.png" alt="twitter icon" height="53" width="52" style="width:52px"></a></td>\n</tr>\n</tbody>\n</table></td>\n  </tr>\n</tbody>\n</table></td>\n    </tr>\n  </tbody>\n</table>\n', 'mailer', 'welcomeEmail');
INSERT INTO `email_templates` VALUES(8, 'Membership Expire 7 days', 'Your membership will expire in 7 days', 'This template is used to remind user that membership will expire in 7 days', '<table bgcolor="#F0F0F0" border="0" cellpadding="0" cellspacing="0" height="100%" width="100%">\n  <tbody>\n    <tr>\n<td style="background-color: #ffffff;" align="center" bgcolor="#ffffff" valign="top"><br>\n<table class="container" style="width:100%px;max-width:600px" border="0" cellpadding="0" cellspacing="0" width="100%">\n<tbody>\n  <tr>\n    <td height="30"></td>\n  </tr>\n  <tr>\n    <td align="center">[LOGO]</td>\n  </tr>\n  <tr>\n    <td height="20"></td>\n  </tr>\n  <tr>\n    <td><p style="text-align:center;margin:0;font-family:Helvetica, Arial, sans-serif;font-size:26px;color:#222222;">Membership Notification From [COMPANY]</p></td>\n  </tr>\n  <tr>\n    <td align="center"><img src="[SITEURL]/assets/images/line.png" alt="line" style="width:250px" height="43" width="251"></td>\n  </tr>\n  <tr>\n    <td height="30"></td>\n  </tr>\n  <tr>\n    <td class="container-padding content" style="padding-left:24px;padding-right:24px;padding-top:12px;padding-bottom:12px;background-color:#ffffff" align="left"><br>\n<div class="title" style="font-family:Helvetica, Arial, sans-serif;font-size:18px;font-weight:600;color:#374550">Hello, [NAME]</div>\n<br>\n<br>\n<div class="body-text" style="font-family:Helvetica, Arial, sans-serif;font-size:14px;line-height:20px;text-align:left;color:#222222"> Your current membership will expire in 7 days: <br>\n<br>\n</div></td>\n  </tr>\n  <tr>\n    <td class="container-padding content" style="padding-left:24px;padding-right:24px;padding-top:12px;padding-bottom:12px;background-color:#ffffff" align="left"><div class="body-text" style="font-family:Helvetica, Arial, sans-serif;font-size:14px;line-height:20px;text-align:left;color:#222222"> Please <a href="[SITEURL]">login</a> to your user panel to extend or upgrade your membership.</div></td>\n  </tr>\n  <tr>\n    <td height="65"></td>\n  </tr>\n  <tr>\n    <td style="border-bottom:1px solid #DDDDDD;"></td>\n  </tr>\n  <tr>\n    <td height="25"></td>\n  </tr>\n  <tr>\n    <td style="text-align:center" align="center"><table align="center" border="0" cellpadding="0" cellspacing="0" width="95%">\n<tbody>\n<tr>\n  <td style="font-family:Helvetica, Arial, sans-serif" align="left" valign="top"><div align="left">\n<p style="text-align:left;color:#999999;font-size:12px;font-weight:normal;line-height:20px;">This email is sent to you directly from <a href="[SITEURL]">[COMPANY]</a> The information above is gathered from the user input. <br>\n©[DATE] <a href="[SITEURL]">[COMPANY]</a>. All rights reserved. </p>\n    </div></td>\n  <td width="30"></td>\n  <td valign="top" width="52"><a target="_blank" href="http://facebook.com/[FB]"><img src="[SITEURL]/assets/images/facebook.png" alt="facebook icon" style="width:52px" height="53" width="52"></a></td>\n  <td width="16"></td>\n  <td valign="top" width="52"><a target="_blank" href="http://twitter.com/[TW]"><img src="[SITEURL]/assets/images/twitter.png" alt="twitter icon" style="width:52px" height="53" width="52"></a></td>\n</tr>\n</tbody>\n</table></td>\n  </tr>\n</tbody>\n</table></td>\n    </tr>\n  </tbody>\n</table>', 'mailer', 'memExp7');
INSERT INTO `email_templates` VALUES(9, 'Membership expired today', 'Your membership has expired', 'This template is used to remind user that membership had expired', '<table bgcolor="#F0F0F0" border="0" cellpadding="0" cellspacing="0" height="100%" width="100%">\n  <tbody>\n    <tr>\n<td style="background-color: #ffffff;" align="center" bgcolor="#ffffff" valign="top"><br>\n<table class="container" style="width:100%px;max-width:600px" border="0" cellpadding="0" cellspacing="0" width="100%">\n<tbody>\n  <tr>\n    <td height="30"></td>\n  </tr>\n  <tr>\n    <td align="center">[LOGO]</td>\n  </tr>\n  <tr>\n    <td height="20"></td>\n  </tr>\n  <tr>\n    <td><p style="text-align:center;margin:0;font-family:Helvetica, Arial, sans-serif;font-size:26px;color:#222222;">Membership Notification From [COMPANY]</p></td>\n  </tr>\n  <tr>\n    <td align="center"><img src="[SITEURL]/assets/images/line.png" alt="line" style="width:250px" height="43" width="251"></td>\n  </tr>\n  <tr>\n    <td height="30"></td>\n  </tr>\n  <tr>\n    <td class="container-padding content" style="padding-left:24px;padding-right:24px;padding-top:12px;padding-bottom:12px;background-color:#ffffff" align="left"><br>\n<div class="title" style="font-family:Helvetica, Arial, sans-serif;font-size:18px;font-weight:600;color:#374550">Hello, [NAME]</div>\n<br>\n<br>\n<div class="body-text" style="font-family:Helvetica, Arial, sans-serif;font-size:30px;line-height:30px;text-align:left;color:red"> Your current membership has expired! <br>\n<br>\n</div></td>\n  </tr>\n  <tr>\n    <td class="container-padding content" style="padding-left:24px;padding-right:24px;padding-top:12px;padding-bottom:12px;background-color:#ffffff" align="left"><div class="body-text" style="font-family:Helvetica, Arial, sans-serif;font-size:14px;line-height:20px;text-align:left;color:#222222"> Please <a href="[SITEURL]">login</a> to your user panel to extend or upgrade your membership.</div></td>\n  </tr>\n  <tr>\n    <td height="65"></td>\n  </tr>\n  <tr>\n    <td style="border-bottom:1px solid #DDDDDD;"></td>\n  </tr>\n  <tr>\n    <td height="25"></td>\n  </tr>\n  <tr>\n    <td style="text-align:center" align="center"><table align="center" border="0" cellpadding="0" cellspacing="0" width="95%">\n<tbody>\n<tr>\n  <td style="font-family:Helvetica, Arial, sans-serif" align="left" valign="top"><div align="left">\n<p style="text-align:left;color:#999999;font-size:12px;font-weight:normal;line-height:20px;">This email is sent to you directly from <a href="[SITEURL]">[COMPANY]</a> The information above is gathered from the user input. <br>\n©[DATE] <a href="[SITEURL]">[COMPANY]</a>. All rights reserved. </p>\n    </div></td>\n  <td width="30"></td>\n  <td valign="top" width="52"><a target="_blank" href="http://facebook.com/[FB]"><img src="[SITEURL]/assets/images/facebook.png" alt="facebook icon" style="width:52px" height="53" width="52"></a></td>\n  <td width="16"></td>\n  <td valign="top" width="52"><a target="_blank" href="http://twitter.com/[TW]"><img src="[SITEURL]/assets/images/twitter.png" alt="twitter icon" style="width:52px" height="53" width="52"></a></td>\n</tr>\n</tbody>\n</table></td>\n  </tr>\n</tbody>\n</table></td>\n    </tr>\n  </tbody>\n</table>', 'mailer', 'memExp');
INSERT INTO `email_templates` VALUES(10, 'Contact Request', 'Contact Inquiry', 'This template is used to send default Contact Request Form', '<table bgcolor="#F0F0F0" border="0" cellpadding="0" cellspacing="0" height="100%" width="100%">\n  <tbody>\n    <tr>\n<td style="background-color: #ffffff;" align="center" bgcolor="#ffffff" valign="top"><br>\n<table style="width:100%px;max-width:600px" border="0" cellpadding="0" cellspacing="0" width="100%">\n<tbody>\n  <tr>\n    <td height="30"></td>\n  </tr>\n  <tr>\n    <td align="center">[LOGO]</td>\n  </tr>\n  <tr>\n    <td height="20"></td>\n  </tr>\n  <tr>\n    <td><p style="text-align:center;margin:0;font-family:Helvetica, Arial, sans-serif;font-size:26px;color:#222222;"> Hello Admin</p></td>\n  </tr>\n  <tr>\n    <td align="center"><img src="[SITEURL]/assets/images/line.png" alt="line" style="width:250px" height="43" width="251"></td>\n  </tr>\n  <tr>\n    <td height="30"></td>\n  </tr>\n  <tr>\n    <td class="container-padding content" style="padding-left:24px;padding-right:24px;padding-top:12px;padding-bottom:12px;background-color:#ffffff" align="left"><div class="body-text" style="font-family:Helvetica, Arial, sans-serif;font-size:14px;line-height:20px;text-align:left;color:#222222"> You have a new contact request:</div>\n<br>\n<br>\n<div class="body-text" style="font-family:Helvetica, Arial, sans-serif;font-size:14px;line-height:20px;text-align:left;color:#222222">\n<table>\n<tbody><tr>\n  <td style="width:120px"><strong>From:</strong></td>\n  <td>[EMAIL] - [NAME]</td>\n</tr>\n<tr>\n  <td><strong>Telephone:</strong></td>\n  <td>[PHONE]</td>\n</tr>\n<tr>\n  <td><strong>Subject:</strong></td>\n  <td>[MAILSUBJECT]</td>\n</tr>\n<tr>\n  <td><strong>IP:</strong></td>\n  <td>[IP]</td>\n</tr>\n</tbody></table>\n</div>\n<br>\n<div class="body-text" style="font-family:Helvetica, Arial, sans-serif;font-size:14px;line-height:20px;text-align:left;color:#222222"> [MESSAGE] </div></td>\n  </tr>\n  <tr>\n    <td height="65"></td>\n  </tr>\n  <tr>\n    <td style="border-bottom:1px solid #DDDDDD;"></td>\n  </tr>\n  <tr>\n    <td height="25"></td>\n  </tr>\n  <tr>\n    <td style="text-align:center" align="center"><table align="center" border="0" cellpadding="0" cellspacing="0" width="95%">\n<tbody>\n<tr>\n  <td style="font-family:Helvetica, Arial, sans-serif" align="left" valign="top"><div align="left">\n<p style="text-align:left;color:#999999;font-size:12px;font-weight:normal;line-height:20px;">This email is sent to you directly from <a href="[SITEURL]">[COMPANY]</a> The information above is gathered from the user input. <br>\n©[DATE] <a href="[SITEURL]">[COMPANY]</a>. All rights reserved. </p>\n    </div></td>\n  <td width="30"></td>\n  <td valign="top" width="52"><a target="_blank" href="http://facebook.com/[FB]"><img src="[SITEURL]/assets/images/facebook.png" alt="facebook icon" style="width:52px" height="53" width="52"></a></td>\n  <td width="16"></td>\n  <td valign="top" width="52"><a target="_blank" href="http://twitter.com/[TW]"><img src="[SITEURL]/assets/images/twitter.png" alt="twitter icon" style="width:52px" height="53" width="52"></a></td>\n</tr>\n</tbody>\n</table></td>\n  </tr>\n</tbody>\n</table></td>\n    </tr>\n  </tbody></table>', 'mailer', 'contact');
INSERT INTO `email_templates` VALUES(11, 'New Comment', 'New Comment Added', 'This template is used to notify admin when new comment has been added', '<table bgcolor="#F0F0F0" border="0" cellpadding="0" cellspacing="0" height="100%" width="100%">\r\n  <tbody>\r\n    <tr>\r\n<td style="background-color: #ffffff;" align="center" bgcolor="#ffffff" valign="top"><br>\r\n<table style="width:100%px;max-width:600px" border="0" cellpadding="0" cellspacing="0" width="100%">\r\n<tbody>\r\n  <tr>\r\n    <td height="30"></td>\r\n  </tr>\r\n  <tr>\r\n    <td align="center">[LOGO]</td>\r\n  </tr>\r\n  <tr>\r\n    <td height="20"></td>\r\n  </tr>\r\n  <tr>\r\n    <td><p style="text-align:center;margin:0;font-family:Helvetica, Arial, sans-serif;font-size:26px;color:#222222;"> Hello Admin</p></td>\r\n  </tr>\r\n  <tr>\r\n    <td align="center"><img src="[SITEURL]/assets/images/line.png" alt="line" style="width:250px" height="43" width="251"></td>\r\n  </tr>\r\n  <tr>\r\n    <td height="30"></td>\r\n  </tr>\r\n  <tr>\r\n    <td class="container-padding content" style="padding-left:24px;padding-right:24px;padding-top:12px;padding-bottom:12px;background-color:#ffffff" align="left"><div class="body-text" style="font-family:Helvetica, Arial, sans-serif;font-size:14px;line-height:20px;text-align:left;color:#222222"> You have a new comment post. If comments are not auto approved, you will need to manually approve from admin panel. Here are the details: </div>\r\n<br>\r\n<br>\r\n<div class="body-text" style="font-family:Helvetica, Arial, sans-serif;font-size:14px;line-height:20px;text-align:left;color:#222222">\r\n<table>\r\n<tbody>\r\n  <tr>\r\n    <td style="width:120px"><strong>From:</strong></td>\r\n    <td>[NAME]</td>\r\n  </tr>\r\n  <tr>\r\n    <td><strong>Page Url:</strong></td>\r\n    <td><a href="[PAGEURL]">[PAGEURL]</a></td>\r\n  </tr>\r\n  <tr>\r\n    <td><strong>IP:</strong></td>\r\n    <td>[IP]</td>\r\n  </tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n<br>\r\n<div class="body-text" style="font-family:Helvetica, Arial, sans-serif;font-size:14px;line-height:20px;text-align:left;color:#222222">[MESSAGE] </div></td>\r\n  </tr>\r\n  <tr>\r\n    <td height="65"></td>\r\n  </tr>\r\n  <tr>\r\n    <td style="border-bottom:1px solid #DDDDDD;"></td>\r\n  </tr>\r\n  <tr>\r\n    <td height="25"></td>\r\n  </tr>\r\n  <tr>\r\n    <td style="text-align:center" align="center"><table align="center" border="0" cellpadding="0" cellspacing="0" width="95%">\r\n<tbody>\r\n<tr>\r\n  <td style="font-family:Helvetica, Arial, sans-serif" align="left" valign="top"><div align="left">\r\n<p style="text-align:left;color:#999999;font-size:12px;font-weight:normal;line-height:20px;">This email is sent to you directly from <a href="[SITEURL]">[COMPANY]</a> The information above is gathered from the user input. <br>\r\n©[DATE] <a href="[SITEURL]">[COMPANY]</a>. All rights reserved. </p>\r\n    </div></td>\r\n  <td width="30"></td>\r\n  <td valign="top" width="52"><a target="_blank" href="http://facebook.com/[FB]"><img src="[SITEURL]/assets/images/facebook.png" alt="facebook icon" style="width:52px" height="53" width="52"></a></td>\r\n  <td width="16"></td>\r\n  <td valign="top" width="52"><a target="_blank" href="http://twitter.com/[TW]"><img src="[SITEURL]/assets/images/twitter.png" alt="twitter icon" style="width:52px" height="53" width="52"></a></td>\r\n</tr>\r\n</tbody>\r\n</table></td>\r\n  </tr>\r\n</tbody>\r\n</table></td>\r\n    </tr>\r\n  </tbody>\r\n</table>', 'mailer', 'newComment');
INSERT INTO `email_templates` VALUES(12, 'Single Email', 'Single User Email', 'This template is used to email single user', '<table bgcolor="#F0F0F0" border="0" cellpadding="0" cellspacing="0" height="100%" width="100%">\n  <tbody>\n    <tr>\n<td style="background-color: #ffffff;" align="center" bgcolor="#ffffff" valign="top"><br>\n<table style="width:100%px;max-width:600px" border="0" cellpadding="0" cellspacing="0" width="100%">\n<tbody>\n  <tr>\n    <td height="30"></td>\n  </tr>\n  <tr>\n    <td align="center">[LOGO]</td>\n  </tr>\n  <tr>\n    <td height="20"></td>\n  </tr>\n  <tr>\n    <td><p style="text-align:center;margin:0;font-family:Helvetica, Arial, sans-serif;font-size:26px;color:#222222;"> Hello [NAME]</p></td>\n  </tr>\n  <tr>\n    <td align="center"><img src="[SITEURL]/assets/images/line.png" alt="line" style="width:250px" height="43" width="251"></td>\n  </tr>\n  <tr>\n    <td height="30"></td>\n  </tr>\n  <tr>\n    <td class="container-padding content" style="padding-left:24px;padding-right:24px;padding-top:12px;padding-bottom:12px;background-color:#ffffff" align="left"><div class="body-text" style="font-family:Helvetica, Arial, sans-serif;font-size:14px;line-height:20px;text-align:left;color:#222222"> Your message goes here... </div></td>\n  </tr>\n  <tr>\n    <td height="65"></td>\n  </tr>\n  <tr>\n    <td style="border-bottom:1px solid #DDDDDD;"></td>\n  </tr>\n  <tr>\n    <td height="25"></td>\n  </tr>\n  <tr>\n    <td style="text-align:center" align="center"><table align="center" border="0" cellpadding="0" cellspacing="0" width="95%">\n<tbody>\n<tr>\n  <td style="font-family:Helvetica, Arial, sans-serif" align="left" valign="top"><div align="left">\n<p style="text-align:left;color:#999999;font-size:12px;font-weight:normal;line-height:20px;">This email is sent to you directly from <a href="[SITEURL]">[COMPANY]</a> The information above is gathered from the user input. <br>\n©[DATE] <a href="[SITEURL]">[COMPANY]</a>. All rights reserved. </p>\n    </div></td>\n  <td width="30"></td>\n  <td valign="top" width="52"><a target="_blank" href="http://facebook.com/[FB]"><img src="[SITEURL]/assets/images/facebook.png" alt="facebook icon" style="width:52px" height="53" width="52"></a></td>\n  <td width="16"></td>\n  <td valign="top" width="52"><a target="_blank" href="http://twitter.com/[TW]"><img src="[SITEURL]/assets/images/twitter.png" alt="twitter icon" style="width:52px" height="53" width="52"></a></td>\n</tr>\n</tbody>\n</table></td>\n  </tr>\n</tbody>\n</table></td>\n    </tr>\n  </tbody>\n</table>\n\n', 'mailer', 'singleMail');
INSERT INTO `email_templates` VALUES(13, 'Notify Admin', 'New User Registration', 'This template is used to notify admin of new registration when Configuration->Registration Notification is set to YES', '<table bgcolor="#F0F0F0" border="0" cellpadding="0" cellspacing="0" height="100%" width="100%">\n  <tbody>\n    <tr>\n<td style="background-color: #ffffff;" align="center" bgcolor="#ffffff" valign="top"><br>\n<table style="width:100%px;max-width:600px" border="0" cellpadding="0" cellspacing="0" width="100%">\n<tbody>\n  <tr>\n    <td height="30"></td>\n  </tr>\n  <tr>\n    <td align="center">[LOGO]</td>\n  </tr>\n  <tr>\n    <td height="20"></td>\n  </tr>\n  <tr>\n    <td><p style="text-align:center;margin:0;font-family:Helvetica, Arial, sans-serif;font-size:26px;color:#222222;"> Hello Admin</p></td>\n  </tr>\n  <tr>\n    <td align="center"><img src="[SITEURL]/assets/images/line.png" alt="line" height="43" width="251" style="width:250px"></td>\n  </tr>\n  <tr>\n    <td height="30"></td>\n  </tr>\n  <tr>\n    <td class="container-padding content" style="padding-left:24px;padding-right:24px;padding-top:12px;padding-bottom:12px;background-color:#ffffff" align="left"><div class="body-text" style="font-family:Helvetica, Arial, sans-serif;font-size:14px;line-height:20px;text-align:left;color:#222222"> You have a new user registration. You can login into your admin panel to view details:</div>\n<br>\n<br>\n<div class="body-text" style="font-family:Helvetica, Arial, sans-serif;font-size:14px;line-height:20px;text-align:left;color:#222222">\n<table>\n<tr>\n  <td style="width:120px"><strong>Username:</strong></td>\n  <td>[USERNAME]</td>\n</tr>\n<tr>\n  <td><strong>Name:</strong></td>\n  <td>[NAME]</td>\n</tr>\n<tr>\n  <td><strong>IP:</strong></td>\n  <td>[IP]</td>\n</tr>\n</table>\n</div></td>\n  </tr>\n  <tr>\n    <td height="65"></td>\n  </tr>\n  <tr>\n    <td style="border-bottom:1px solid #DDDDDD;"></td>\n  </tr>\n  <tr>\n    <td height="25"></td>\n  </tr>\n  <tr>\n    <td style="text-align:center" align="center"><table align="center" border="0" cellpadding="0" cellspacing="0" width="95%">\n<tbody>\n<tr>\n  <td style="font-family:Helvetica, Arial, sans-serif" align="left" valign="top"><div align="left">\n<p style="text-align:left;color:#999999;font-size:12px;font-weight:normal;line-height:20px;">This email is sent to you directly from <a href="[SITEURL]">[COMPANY]</a> The information above is gathered from the user input. <br>\n©[DATE] <a href="[SITEURL]">[COMPANY]</a>. All rights reserved. </p>\n    </div></td>\n  <td width="30"></td>\n  <td valign="top" width="52"><a target="_blank" href="http://facebook.com/[FB]"><img src="[SITEURL]/assets/images/facebook.png" alt="facebook icon" height="53" width="52" style="width:52px"></a></td>\n  <td width="16"></td>\n  <td valign="top" width="52"><a target="_blank" href="http://twitter.com/[TW]"><img src="[SITEURL]/assets/images/twitter.png" alt="twitter icon" height="53" width="52" style="width:52px"></a></td>\n</tr>\n</tbody>\n</table></td>\n  </tr>\n</tbody>\n</table></td>\n    </tr>\n  </tbody>\n</table>\n', 'mailer', 'notifyAdmin');
INSERT INTO `email_templates` VALUES(14, 'Registration Pending', 'Registration Verification Pending', 'This template is used to send Registration Verification Email, when Configuration->Auto Registration is set to NO', '<table bgcolor="#F0F0F0" border="0" cellpadding="0" cellspacing="0" height="100%" width="100%">\n  <tbody>\n    <tr>\n<td style="background-color: #ffffff;" align="center" bgcolor="#ffffff" valign="top"><br>\n<table class="container" style="width:600px;max-width:600px" border="0" cellpadding="0" cellspacing="0" width="600px">\n<tbody>\n  <tr>\n    <td height="30"></td>\n  </tr>\n  <tr>\n    <td align="center">[LOGO]</td>\n  </tr>\n  <tr>\n    <td height="20"></td>\n  </tr>\n  <tr>\n    <td><p style="text-align:center;margin:0;font-family:Helvetica, Arial, sans-serif;font-size:26px;color:#222222;">Welcome to [COMPANY]</p></td>\n  </tr>\n  <tr>\n    <td align="center"><img src="[SITEURL]/assets/images/line.png" alt="line" height="43" width="251" style="width:250px"></td>\n  </tr>\n  <tr>\n    <td height="30"></td>\n  </tr>\n  <tr>\n    <td class="container-padding content" style="padding-left:24px;padding-right:24px;padding-top:12px;padding-bottom:12px;background-color:#ffffff" align="left"><br>\n<div class="title" style="font-family:Helvetica, Arial, sans-serif;font-size:18px;font-weight:600;color:#374550">Congratulations!</div>\n<br>\n<div class="body-text" style="font-family:Helvetica, Arial, sans-serif;font-size:14px;line-height:20px;text-align:left;color:#222222"> You are now registered member<br>\n<br>\nThe administrator of this site has requested all new accounts\nto be activated by the users who created them thus your account\nis currently pending verification process. <br>\n<br>\n</div></td>\n  </tr>\n  <tr>\n    <td class="container-padding content" style="padding-left:24px;padding-right:24px;padding-top:12px;padding-bottom:12px;background-color:#ffffff" align="left"><div class="body-text" style="font-family:Helvetica, Arial, sans-serif;font-size:14px;line-height:20px;text-align:left;color:#222222"> Here are your login details. Please keep them in a safe place: <br>\n<br>\nUsername: [USERNAME]<br>\nPassword: [PASSWORD] </div></td>\n  </tr>\n  <tr>\n    <td height="65"></td>\n  </tr>\n  <tr>\n    <td style="border-bottom:1px solid #DDDDDD;"></td>\n  </tr>\n  <tr>\n    <td height="25"></td>\n  </tr>\n  <tr>\n    <td><table align="center" border="0" cellpadding="0" cellspacing="0" width="100%">\n<tbody>\n<tr>\n  <td style="font-family:Helvetica, Arial, sans-serif" align="left" valign="top"><div align="left">\n<p style="text-align:left;color:#999999;font-size:12px;font-weight:normal;line-height:20px;">This email is sent to you directly from <a href="[SITEURL]">[COMPANY]</a> The information above is gathered from the user input. <br>\n©[DATE] <a href="[SITEURL]">[COMPANY]</a>. All rights reserved. </p>\n    </div></td>\n  <td width="30"></td>\n  <td valign="top" width="52"><a target="_blank" href="http://facebook.com/[FB]"><img src="[SITEURL]/assets/images/facebook.png" alt="facebook icon" height="53" width="52" style="width:52px"></a></td>\n  <td width="16"></td>\n  <td valign="top" width="52"><a target="_blank" href="http://twitter.com/[TW]"><img src="[SITEURL]/assets/images/twitter.png" alt="twitter icon" height="53" width="52" style="width:52px"></a></td>\n</tr>\n</tbody>\n</table></td>\n  </tr>\n</tbody>\n</table></td>\n    </tr>\n  </tbody>\n</table>\n', 'mailer', 'regMailPending');
INSERT INTO `email_templates` VALUES(15, 'Offline Payment', 'Offline Notification', 'This template is used to send notification to a user when offline payment method is being used', '<table bgcolor="#F0F0F0" border="0" cellpadding="0" cellspacing="0" height="100%" width="100%">\n  <tbody>\n    <tr>\n<td style="background-color: #ffffff;" align="center" bgcolor="#ffffff" valign="top"><br>\n<table class="container" style="width:600px;max-width:600px" border="0" cellpadding="0" cellspacing="0" width="600px">\n<tbody>\n  <tr>\n    <td height="30"></td>\n  </tr>\n  <tr>\n    <td align="center">[LOGO]</td>\n  </tr>\n  <tr>\n    <td height="20"></td>\n  </tr>\n  <tr>\n    <td><p style="text-align:center;margin:0;font-family:Helvetica, Arial, sans-serif;font-size:26px;color:#222222;">Purchase From [COMPANY]</p></td>\n  </tr>\n  <tr>\n    <td align="center"><img src="[SITEURL]/assets/images/line.png" alt="line" height="43" width="251" style="width:250px"></td>\n  </tr>\n  <tr>\n    <td height="30"></td>\n  </tr>\n  <tr>\n    <td class="container-padding content" style="padding-left:24px;padding-right:24px;padding-top:12px;padding-bottom:12px;background-color:#ffffff" align="left"><br>\n<div class="title" style="font-family:Helvetica, Arial, sans-serif;font-size:18px;font-weight:600;color:#374550">Hello [NAME]!</div>\n<br>\n<div class="body-text" style="font-family:Helvetica, Arial, sans-serif;font-size:14px;line-height:20px;text-align:left;color:#222222"> You have purchased the following:</div>\n<br>\n<div class="body-text" style="font-family:Helvetica, Arial, sans-serif;font-size:14px;line-height:20px;text-align:left;color:#222222">[ITEMS]</div></td>\n  </tr>\n  <tr>\n    <td class="container-padding content" style="padding-left:24px;padding-right:24px;padding-top:12px;padding-bottom:12px;background-color:#ffffff" align="left"><div class="body-text" style="font-family:Helvetica, Arial, sans-serif;font-size:14px;line-height:20px;text-align:left;color:#222222">Please send your payment to: </div>\n<br>\n<div class="body-text" style="font-family:Helvetica, Arial, sans-serif;font-size:14px;line-height:20px;text-align:left;color:#222222">[INFO]</div></td>\n  </tr>\n  <tr>\n    <td height="65"></td>\n  </tr>\n  <tr>\n    <td style="border-bottom:1px solid #DDDDDD;"></td>\n  </tr>\n  <tr>\n    <td height="25"></td>\n  </tr>\n  <tr>\n    <td><table align="center" border="0" cellpadding="0" cellspacing="0" width="100%">\n<tbody>\n<tr>\n  <td style="font-family:Helvetica, Arial, sans-serif" align="left" valign="top"><div align="left">\n<p style="text-align:left;color:#999999;font-size:12px;font-weight:normal;line-height:20px;">This email is sent to you directly from <a href="[SITEURL]">[COMPANY]</a> The information above is gathered from the user input. <br>\n©[DATE] <a href="[SITEURL]">[COMPANY]</a>. All rights reserved. </p>\n    </div></td>\n  <td width="30"></td>\n  <td valign="top" width="52"><a target="_blank" href="http://facebook.com/[FB]"><img src="[SITEURL]/assets/images/facebook.png" alt="facebook icon" height="53" width="52" style="width:52px"></a></td>\n  <td width="16"></td>\n  <td valign="top" width="52"><a target="_blank" href="http://twitter.com/[TW]"><img src="[SITEURL]/assets/images/twitter.png" alt="twitter icon" height="53" width="52" style="width:52px"></a></td>\n</tr>\n</tbody>\n</table></td>\n  </tr>\n</tbody>\n</table></td>\n    </tr>\n  </tbody>\n</table>\n', 'mailer', 'offlinePay');
INSERT INTO `email_templates` VALUES(16, 'Event Payment', 'Event Payment Completed', 'This template is used to notify user on successful booking event payment transaction.', '<table bgcolor="#F0F0F0" border="0" cellpadding="0" cellspacing="0" height="100%" width="100%">\n  <tbody>\n    <tr>\n<td style="background-color: #ffffff;" align="center" bgcolor="#ffffff" valign="top"><br>\n<table class="container" style="width:600px;max-width:600px" border="0" cellpadding="0" cellspacing="0" width="600px">\n<tbody>\n  <tr>\n    <td height="30"></td>\n  </tr>\n  <tr>\n    <td align="center">[LOGO]</td>\n  </tr>\n  <tr>\n    <td height="20"></td>\n  </tr>\n  <tr>\n    <td><p style="text-align:center;margin:0;font-family:Helvetica, Arial, sans-serif;font-size:26px;color:#222222;">Purchase From [COMPANY]</p></td>\n  </tr>\n  <tr>\n    <td align="center"><img src="[SITEURL]/assets/images/line.png" alt="line" height="43" width="251" style="width:250px"></td>\n  </tr>\n  <tr>\n    <td height="30"></td>\n  </tr>\n  <tr>\n    <td class="container-padding content" style="padding-left:24px;padding-right:24px;padding-top:12px;padding-bottom:12px;background-color:#ffffff" align="left"><br>\n<div class="title" style="font-family:Helvetica, Arial, sans-serif;font-size:18px;font-weight:600;color:#374550">Hello [NAME]!</div>\n<br>\n<div class="body-text" style="font-family:Helvetica, Arial, sans-serif;font-size:14px;line-height:20px;text-align:left;color:#222222"> You have successfully purchased and booked:</div>\n<br>\n<div class="body-text" style="font-family:Helvetica, Arial, sans-serif;font-size:14px;line-height:20px;text-align:left;color:#222222"> [ITEM]</div>\n<br>\n<div class="body-text" style="font-family:Helvetica, Arial, sans-serif;font-size:14px;line-height:20px;text-align:left;color:#222222"><a href="[EVENTURL]">View Event Details</a></div></td>\n  </tr>\n  <tr>\n    <td height="65"></td>\n  </tr>\n  <tr>\n    <td style="border-bottom:1px solid #DDDDDD;"></td>\n  </tr>\n  <tr>\n    <td height="25"></td>\n  </tr>\n  <tr>\n    <td><table align="center" border="0" cellpadding="0" cellspacing="0" width="100%">\n<tbody>\n<tr>\n  <td style="font-family:Helvetica, Arial, sans-serif" align="left" valign="top"><div align="left">\n<p style="text-align:left;color:#999999;font-size:12px;font-weight:normal;line-height:20px;">This email is sent to you directly from <a href="[SITEURL]">[COMPANY]</a> The information above is gathered from the user input. <br>\n©[DATE] <a href="[SITEURL]">[COMPANY]</a>. All rights reserved. </p>\n    </div></td>\n  <td width="30"></td>\n  <td valign="top" width="52"><a target="_blank" href="http://facebook.com/[FB]"><img src="[SITEURL]/assets/images/facebook.png" alt="facebook icon" height="53" width="52" style="width:52px"></a></td>\n  <td width="16"></td>\n  <td valign="top" width="52"><a target="_blank" href="http://twitter.com/[TW]"><img src="[SITEURL]/assets/images/twitter.png" alt="twitter icon" height="53" width="52" style="width:52px"></a></td>\n</tr>\n</tbody>\n</table></td>\n  </tr>\n</tbody>\n</table></td>\n    </tr>\n  </tbody>\n</table>\n', 'mailer', 'eventPay');
INSERT INTO `email_templates` VALUES(17, 'New Invoice', 'You have new invoice', 'This template is used to notify user of a invoice being sent (Invoice Manager)', '<table bgcolor="#F0F0F0" border="0" cellpadding="0" cellspacing="0" height="100%" width="100%">\n  <tbody>\n    <tr>\n<td style="background-color: #ffffff;" align="center" bgcolor="#ffffff" valign="top"><br>\n<table class="container" style="width:600px;max-width:600px" border="0" cellpadding="0" cellspacing="0" width="600px">\n<tbody>\n  <tr>\n    <td height="30"></td>\n  </tr>\n  <tr>\n    <td align="center">[LOGO]</td>\n  </tr>\n  <tr>\n    <td height="20"></td>\n  </tr>\n  <tr>\n    <td><p style="text-align:center;margin:0;font-family:Helvetica, Arial, sans-serif;font-size:26px;color:#222222;">Invoice From [COMPANY]</p></td>\n  </tr>\n  <tr>\n    <td align="center"><img src="[SITEURL]/assets/images/line.png" alt="line" height="43" width="251" style="width:250px"></td>\n  </tr>\n  <tr>\n    <td height="30"></td>\n  </tr>\n  <tr>\n    <td class="container-padding content" style="padding-left:24px;padding-right:24px;padding-top:12px;padding-bottom:12px;background-color:#ffffff" align="left"><br>\n<div class="title" style="font-family:Helvetica, Arial, sans-serif;font-size:18px;font-weight:600;color:#374550">Hello [NAME]!</div>\n<br>\n<div class="body-text" style="font-family:Helvetica, Arial, sans-serif;font-size:14px;line-height:20px;text-align:left;color:#222222">We have attached an invoice in the amount of [AMOUNT]</div>\n<br>\n<div class="body-text" style="font-family:Helvetica, Arial, sans-serif;font-size:14px;line-height:20px;text-align:left;color:#222222">You may pay, view and print the invoice online by visiting link bellow.</div></td>\n  </tr>\n  <tr>\n    <td height="65"></td>\n  </tr>\n  <tr>\n    <td align="center"><table>\n<tbody>\n<tr>\n  <td style="background:#289CDC; padding:15px 18px;-webkit-border-radius: 4px; border-radius: 4px;font-family:Helvetica, Arial, sans-serif" align="center" bgcolor="#289CDC"><div align="center"> <a target="_blank" href="[LINK]" style="color:#ffffff;text-decoration: none;font-size: 16px;">View Invoice</a> </div></td>\n</tr>\n</tbody>\n</table></td>\n  </tr>\n  <tr>\n    <td style="border-bottom:1px solid #DDDDDD;"></td>\n  </tr>\n  <tr>\n    <td height="25"></td>\n  </tr>\n  <tr>\n    <td><table align="center" border="0" cellpadding="0" cellspacing="0" width="100%">\n<tbody>\n<tr>\n  <td style="font-family:Helvetica, Arial, sans-serif" align="left" valign="top"><div align="left">\n<p style="text-align:left;color:#999999;font-size:12px;font-weight:normal;line-height:20px;">This email is sent to you directly from <a href="[SITEURL]">[COMPANY]</a> The information above is gathered from the user input. <br>\n©[DATE] <a href="[SITEURL]">[COMPANY]</a>. All rights reserved. </p>\n    </div></td>\n  <td width="30"></td>\n  <td valign="top" width="52"><a target="_blank" href="http://facebook.com/[FB]"><img src="[SITEURL]/assets/images/facebook.png" alt="facebook icon" height="53" width="52" style="width:52px"></a></td>\n  <td width="16"></td>\n  <td valign="top" width="52"><a target="_blank" href="http://twitter.com/[TW]"><img src="[SITEURL]/assets/images/twitter.png" alt="twitter icon" height="53" width="52" style="width:52px"></a></td>\n</tr>\n</tbody>\n</table></td>\n  </tr>\n</tbody>\n</table></td>\n    </tr>\n  </tbody>\n</table>\n', 'mailer', 'newInvoice');
INSERT INTO `email_templates` VALUES(18, 'Transaction Completed IM', 'Payment Completed IM', 'This template is used to notify administrator on successful payment transaction from Invoice Manager', '<table bgcolor="#F0F0F0" border="0" cellpadding="0" cellspacing="0" height="100%" width="100%">\n  <tbody>\n    <tr>\n<td style="background-color: #ffffff;" align="center" bgcolor="#ffffff" valign="top"><br>\n<table style="width:100%px;max-width:600px" border="0" cellpadding="0" cellspacing="0" width="100%">\n<tbody>\n  <tr>\n    <td height="30"></td>\n  </tr>\n  <tr>\n    <td align="center">[LOGO]</td>\n  </tr>\n  <tr>\n    <td height="20"></td>\n  </tr>\n  <tr>\n    <td><p style="text-align:center;margin:0;font-family:Helvetica, Arial, sans-serif;font-size:26px;color:#222222;"> Hello Admin</p></td>\n  </tr>\n  <tr>\n    <td align="center"><img src="[SITEURL]/assets/images/line.png" alt="line" style="width:250px" height="43" width="251"></td>\n  </tr>\n  <tr>\n    <td height="30"></td>\n  </tr>\n  <tr>\n    <td class="container-padding content" style="padding-left:24px;padding-right:24px;padding-top:12px;padding-bottom:12px;background-color:#ffffff" align="left"><div class="body-text" style="font-family:Helvetica, Arial, sans-serif;font-size:14px;line-height:20px;text-align:left;color:#222222"> You have received new payment following: </div>\n<br>\n<div class="body-text" style="font-family:Helvetica, Arial, sans-serif;font-size:14px;line-height:20px;text-align:left;color:#222222">\n<table>\n<tbody>\n  <tr>\n    <td style="width:120px"><strong>Client Name:</strong></td>\n    <td>[NAME]</td>\n  </tr>\n  <tr>\n    <td><strong>Invoice #:</strong></td>\n    <td>[INVID]</td>\n  </tr>\n  <tr>\n    <td><strong>Amount:</strong></td>\n    <td>[AMOUNT]</td>\n  </tr>\n  <tr>\n    <td><strong>Status:</strong></td>\n    <td>[STATUS]</td>\n  </tr>\n  <tr>\n    <td><strong>Processor:</strong></td>\n    <td>[PP]</td>\n  </tr>\n  <tr>\n    <td><strong>IP:</strong></td>\n    <td>[IP]</td>\n  </tr>\n</tbody>\n</table>\n</div>\n<br>\n<div class="body-text" style="font-family:Helvetica, Arial, sans-serif;font-size:14px;line-height:20px;text-align:left;color:#222222"> You can view this transaction from your <a href="[URL]">admin panel</a></div></td>\n  </tr>\n  <tr>\n    <td height="65"></td>\n  </tr>\n  <tr>\n    <td style="border-bottom:1px solid #DDDDDD;"></td>\n  </tr>\n  <tr>\n    <td height="25"></td>\n  </tr>\n  <tr>\n    <td style="text-align:center" align="center"><table align="center" border="0" cellpadding="0" cellspacing="0" width="95%">\n<tbody>\n<tr>\n  <td style="font-family:Helvetica, Arial, sans-serif" align="left" valign="top"><div align="left">\n<p style="text-align:left;color:#999999;font-size:12px;font-weight:normal;line-height:20px;">This email is sent to you directly from <a href="[SITEURL]">[COMPANY]</a> The information above is gathered from the user input. <br>\n©[DATE] <a href="[SITEURL]">[COMPANY]</a>. All rights reserved. </p>\n    </div></td>\n  <td width="30"></td>\n  <td valign="top" width="52"><a target="_blank" href="http://facebook.com/[FB]"><img src="[SITEURL]/assets/images/facebook.png" alt="facebook icon" style="width:52px" height="53" width="52"></a></td>\n  <td width="16"></td>\n  <td valign="top" width="52"><a target="_blank" href="http://twitter.com/[TW]"><img src="[SITEURL]/assets/images/twitter.png" alt="twitter icon" style="width:52px" height="53" width="52"></a></td>\n</tr>\n</tbody>\n</table></td>\n  </tr>\n</tbody>\n</table></td>\n    </tr>\n  </tbody>\n</table>\n\n', 'mailer', 'payCompleteIM');
INSERT INTO `email_templates` VALUES(19, 'PsDrive Submission', 'New PsDrive user submission', 'This template is used to notify administrator on successful PsDrive user submission', '<table bgcolor="#F0F0F0" border="0" cellpadding="0" cellspacing="0" height="100%" width="100%">\n  <tbody>\n    <tr>\n<td style="background-color: #ffffff;" align="center" bgcolor="#ffffff" valign="top"><br>\n<table style="width:100%px;max-width:600px" border="0" cellpadding="0" cellspacing="0" width="100%">\n<tbody>\n  <tr>\n    <td height="30"></td>\n  </tr>\n  <tr>\n    <td align="center">[LOGO]</td>\n  </tr>\n  <tr>\n    <td height="20"></td>\n  </tr>\n  <tr>\n    <td><p style="text-align:center;margin:0;font-family:Helvetica, Arial, sans-serif;font-size:26px;color:#222222;"> Hello Admin</p></td>\n  </tr>\n  <tr>\n    <td align="center"><img src="[SITEURL]/assets/images/line.png" alt="line" style="width:250px" height="43" width="251"></td>\n  </tr>\n  <tr>\n    <td height="30"></td>\n  </tr>\n  <tr>\n    <td class="container-padding content" style="padding-left:24px;padding-right:24px;padding-top:12px;padding-bottom:12px;background-color:#ffffff" align="left"><div class="body-text" style="font-family:Helvetica, Arial, sans-serif;font-size:14px;line-height:20px;text-align:left;color:#222222"> You have received a new PsDrive file submission: </div>\n<br>\n<div class="body-text" style="font-family:Helvetica, Arial, sans-serif;font-size:14px;line-height:20px;text-align:left;color:#222222">\n<table>\n<tbody>\n  <tr>\n    <td style="width:120px"><strong>User Name:</strong></td>\n    <td>[USERNAME]</td>\n  </tr>\n  <tr>\n    <td><strong>Filename:</strong></td>\n    <td>[FILENAME]</td>\n  </tr>\n  <tr>\n    <td><strong>Url:</strong></td>\n    <td>[FILEURL]</td>\n  </tr>\n  <tr>\n    <td><strong>IP:</strong></td>\n    <td>[IP]</td>\n  </tr>\n</tbody>\n</table>\n</div>\n<br>\n<br>\n<div class="body-text" style="font-family:Helvetica, Arial, sans-serif;font-size:14px;line-height:20px;text-align:left;color:#222222"> You can view this transaction from your <a href="[URL]">admin panel</a></div></td>\n  </tr>\n  <tr>\n    <td height="65"></td>\n  </tr>\n  <tr>\n    <td style="border-bottom:1px solid #DDDDDD;"></td>\n  </tr>\n  <tr>\n    <td height="25"></td>\n  </tr>\n  <tr>\n    <td style="text-align:center" align="center"><table align="center" border="0" cellpadding="0" cellspacing="0" width="95%">\n<tbody>\n<tr>\n  <td style="font-family:Helvetica, Arial, sans-serif" align="left" valign="top"><div align="left">\n<p style="text-align:left;color:#999999;font-size:12px;font-weight:normal;line-height:20px;">This email is sent to you directly from <a href="[SITEURL]">[COMPANY]</a> The information above is gathered from the user input. <br>\n©[DATE] <a href="[SITEURL]">[COMPANY]</a>. All rights reserved. </p>\n    </div></td>\n  <td width="30"></td>\n  <td valign="top" width="52"><a target="_blank" href="http://facebook.com/[FB]"><img src="[SITEURL]/assets/images/facebook.png" alt="facebook icon" style="width:52px" height="53" width="52"></a></td>\n  <td width="16"></td>\n  <td valign="top" width="52"><a target="_blank" href="http://twitter.com/[TW]"><img src="[SITEURL]/assets/images/twitter.png" alt="twitter icon" style="width:52px" height="53" width="52"></a></td>\n</tr>\n</tbody>\n</table></td>\n  </tr>\n</tbody>\n</table></td>\n    </tr>\n  </tbody>\n</table>\n\n', 'mailer', 'psdNotifyAdmin');
INSERT INTO `email_templates` VALUES(20, 'Digishop User Notification', 'Transaction Completed', 'This template is used to notify user of completed transaction  (Digishop Manager)', '<table bgcolor="#F0F0F0" border="0" cellpadding="0" cellspacing="0" height="100%" width="100%">\n<tbody>\n<tr>\n<td style="background-color: #ffffff;" align="center" bgcolor="#ffffff" valign="top"><br />\n<table style="width: 100%px; max-width: 600px;" border="0" cellpadding="0" cellspacing="0" width="100%">\n<tbody>\n<tr>\n<td height="30"></td>\n</tr>\n<tr>\n<td align="center">[LOGO]</td>\n</tr>\n<tr>\n<td height="20"></td>\n</tr>\n<tr>\n<td>\n<p style="text-align: center; margin: 0; font-family: Helvetica, Arial, sans-serif; font-size: 26px; color: #222222;">Hello [NAME]</p>\n</td>\n</tr>\n<tr>\n<td align="center"><img src="[SITEURL]/assets/images/line.png" alt="line" style="width: 250px;" height="43" width="251" /></td>\n</tr>\n<tr>\n<td height="30"></td>\n</tr>\n<tr>\n<td class="container-padding content" style="background-color: #ffffff; padding: 12px 24px 12px 24px;" align="left">\n<div class="body-text" style="font-family: Helvetica, Arial, sans-serif; font-size: 14px; line-height: 20px; text-align: left; color: #222222;">You have purchased the following items:</div>\n<br />\n<div class="body-text" style="font-family: Helvetica, Arial, sans-serif; font-size: 14px; line-height: 20px; text-align: left; color: #222222;">[ITEMS]</div>\n<br /> <br />\n<div class="body-text" style="font-family: Helvetica, Arial, sans-serif; font-size: 14px; line-height: 20px; text-align: left; color: #222222;">You can now download your item(s) above from <a href="[URL]">user dashboard</a></div>\n</td>\n</tr>\n<tr>\n<td height="65"></td>\n</tr>\n<tr>\n<td style="border-bottom: 1px solid #DDDDDD;"></td>\n</tr>\n<tr>\n<td height="25"></td>\n</tr>\n<tr>\n<td style="text-align: center;" align="center">\n<table align="center" border="0" cellpadding="0" cellspacing="0" width="95%">\n<tbody>\n<tr>\n<td style="font-family: Helvetica, Arial, sans-serif;" align="left" valign="top">\n<div align="left">\n<p style="text-align: left; color: #999999; font-size: 12px; font-weight: normal; line-height: 20px;">This email is sent to you directly from <a href="[SITEURL]">[COMPANY]</a> The information above is gathered from the user input. <br /> ©[DATE] <a href="[SITEURL]">[COMPANY]</a>. All rights reserved.</p>\n</div>\n</td>\n<td width="30"></td>\n<td valign="top" width="52"><a target="_blank" href="http://facebook.com/[FB]"><img src="[SITEURL]/assets/images/facebook.png" alt="facebook icon" style="width: 52px;" height="53" width="52" /></a></td>\n<td width="16"></td>\n<td valign="top" width="52"><a target="_blank" href="http://twitter.com/[TW]"><img src="[SITEURL]/assets/images/twitter.png" alt="twitter icon" style="width: 52px;" height="53" width="52" /></a></td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n</tbody>\n</table>\n<p></p>', 'mailer', 'digiNotifyUser');
INSERT INTO `email_templates` VALUES(21, 'Visual Form Submission', 'New Form Submission', 'This template is used to notify Admin on new visual form submission', '<table bgcolor="#F0F0F0" border="0" cellpadding="0" cellspacing="0" height="100%" width="100%">\r\n  <tbody>\r\n    <tr>\r\n<td style="background-color: #ffffff;" align="center" bgcolor="#ffffff" valign="top"><br>\r\n<table style="width:100%px;max-width:600px" border="0" cellpadding="0" cellspacing="0" width="100%">\r\n<tbody>\r\n  <tr>\r\n    <td height="30"></td>\r\n  </tr>\r\n  <tr>\r\n    <td align="center">[LOGO]</td>\r\n  </tr>\r\n  <tr>\r\n    <td height="20"></td>\r\n  </tr>\r\n  <tr>\r\n    <td><p style="text-align:center;margin:0;font-family:Helvetica, Arial, sans-serif;font-size:26px;color:#222222;"> Hello Admin</p></td>\r\n  </tr>\r\n  <tr>\r\n    <td align="center"><img src="[SITEURL]/assets/images/line.png" alt="line" height="43" width="251" style="width:250px"></td>\r\n  </tr>\r\n  <tr>\r\n    <td height="30"></td>\r\n  </tr>\r\n  <tr>\r\n    <td class="container-padding content" style="padding-left:24px;padding-right:24px;padding-top:12px;padding-bottom:12px;background-color:#ffffff" align="left"><div class="body-text" style="font-family:Helvetica, Arial, sans-serif;font-size:14px;line-height:20px;text-align:left;color:#222222"> You have a new [FORMNAME] form submission:</div>\r\n<br>\r\n<br>\r\n<div class="body-text" style="font-family:Helvetica, Arial, sans-serif;font-size:14px;line-height:20px;text-align:left;color:#222222"> [FORMDATA] </div></td>\r\n  </tr>\r\n  <tr>\r\n    <td height="65"></td>\r\n  </tr>\r\n  <tr>\r\n    <td style="border-bottom:1px solid #DDDDDD;"></td>\r\n  </tr>\r\n  <tr>\r\n    <td height="25"></td>\r\n  </tr>\r\n  <tr>\r\n    <td style="text-align:center" align="center"><table align="center" border="0" cellpadding="0" cellspacing="0" width="95%">\r\n<tbody>\r\n<tr>\r\n  <td style="font-family:Helvetica, Arial, sans-serif" align="left" valign="top"><div align="left">\r\n<p style="text-align:left;color:#999999;font-size:12px;font-weight:normal;line-height:20px;">This email is sent to you directly from <a href="[SITEURL]">[COMPANY]</a> The information above is gathered from the user input. <br>\r\n©[DATE] <a href="[SITEURL]">[COMPANY]</a>. All rights reserved. </p>\r\n    </div></td>\r\n  <td width="30"></td>\r\n  <td valign="top" width="52"><a target="_blank" href="http://facebook.com/[FB]"><img src="[SITEURL]/assets/images/facebook.png" alt="facebook icon" height="53" width="52" style="width:52px"></a></td>\r\n  <td width="16"></td>\r\n  <td valign="top" width="52"><a target="_blank" href="http://twitter.com/[TW]"><img src="[SITEURL]/assets/images/twitter.png" alt="twitter icon" height="53" width="52" style="width:52px"></a></td>\r\n</tr>\r\n</tbody>\r\n</table></td>\r\n  </tr>\r\n</tbody>\r\n</table></td>\r\n    </tr>\r\n  </tbody>\r\n</table>', 'mailer', 'visualFormAdmin');
INSERT INTO `email_templates` VALUES(22, 'Blog Notification Admin', 'New Article Submission', 'This template is used to notify Admin on new blog article submission', '<table bgcolor="#F0F0F0" border="0" cellpadding="0" cellspacing="0" height="100%" width="100%">\r\n  <tbody>\r\n    <tr>\r\n<td style="background-color: #ffffff;" align="center" bgcolor="#ffffff" valign="top"><br>\r\n<table style="width:100%px;max-width:600px" border="0" cellpadding="0" cellspacing="0" width="100%">\r\n<tbody>\r\n  <tr>\r\n    <td height="30"></td>\r\n  </tr>\r\n  <tr>\r\n    <td align="center">[LOGO]</td>\r\n  </tr>\r\n  <tr>\r\n    <td height="20"></td>\r\n  </tr>\r\n  <tr>\r\n    <td><p style="text-align:center;margin:0;font-family:Helvetica, Arial, sans-serif;font-size:26px;color:#222222;"> Hello Admin</p></td>\r\n  </tr>\r\n  <tr>\r\n    <td align="center"><img src="[SITEURL]/assets/images/line.png" alt="line" height="43" width="251" style="width:250px"></td>\r\n  </tr>\r\n  <tr>\r\n    <td height="30"></td>\r\n  </tr>\r\n  <tr>\r\n    <td class="container-padding content" style="padding-left:24px;padding-right:24px;padding-top:12px;padding-bottom:12px;background-color:#ffffff" align="left"><div class="body-text" style="font-family:Helvetica, Arial, sans-serif;font-size:14px;line-height:20px;text-align:left;color:#222222"> You have a new <strong>[FORMNAME]</strong> article pending approval.</div>\r\n<br>\r\n<br>\r\n<div class="body-text" style="font-family:Helvetica, Arial, sans-serif;font-size:14px;line-height:20px;text-align:left;color:#222222"> You can review  this article from your admin panel in Blog Module section. </div></td>\r\n  </tr>\r\n  <tr>\r\n    <td height="65"></td>\r\n  </tr>\r\n  <tr>\r\n    <td style="border-bottom:1px solid #DDDDDD;"></td>\r\n  </tr>\r\n  <tr>\r\n    <td height="25"></td>\r\n  </tr>\r\n  <tr>\r\n    <td style="text-align:center" align="center"><table align="center" border="0" cellpadding="0" cellspacing="0" width="95%">\r\n<tbody>\r\n<tr>\r\n  <td style="font-family:Helvetica, Arial, sans-serif" align="left" valign="top"><div align="left">\r\n<p style="text-align:left;color:#999999;font-size:12px;font-weight:normal;line-height:20px;">This email is sent to you directly from <a href="[SITEURL]">[COMPANY]</a> The information above is gathered from the user input. <br>\r\n©[DATE] <a href="[SITEURL]">[COMPANY]</a>. All rights reserved. </p>\r\n    </div></td>\r\n  <td width="30"></td>\r\n  <td valign="top" width="52"><a target="_blank" href="http://facebook.com/[FB]"><img src="[SITEURL]/assets/images/facebook.png" alt="facebook icon" height="53" width="52" style="width:52px"></a></td>\r\n  <td width="16"></td>\r\n  <td valign="top" width="52"><a target="_blank" href="http://twitter.com/[TW]"><img src="[SITEURL]/assets/images/twitter.png" alt="twitter icon" height="53" width="52" style="width:52px"></a></td>\r\n</tr>\r\n</tbody>\r\n</table></td>\r\n  </tr>\r\n</tbody>\r\n</table></td>\r\n    </tr>\r\n  </tbody>\r\n</table>', 'mailer', 'blogAdminNotify');
INSERT INTO `email_templates` VALUES(23, 'Blog Notification User', 'New Article Submission', 'This template is used to notify user on blog artilce status submission', '<table bgcolor="#F0F0F0" border="0" cellpadding="0" cellspacing="0" height="100%" width="100%">\r\n  <tbody>\r\n    <tr>\r\n<td style="background-color: #ffffff;" align="center" bgcolor="#ffffff" valign="top"><br>\r\n<table style="width:100%px;max-width:600px" border="0" cellpadding="0" cellspacing="0" width="100%">\r\n<tbody>\r\n  <tr>\r\n    <td height="30"></td>\r\n  </tr>\r\n  <tr>\r\n    <td align="center">[LOGO]</td>\r\n  </tr>\r\n  <tr>\r\n    <td height="20"></td>\r\n  </tr>\r\n  <tr>\r\n    <td><p style="text-align:center;margin:0;font-family:Helvetica, Arial, sans-serif;font-size:26px;color:#222222;"> Hello [NAME]</p></td>\r\n  </tr>\r\n  <tr>\r\n    <td align="center"><img src="[SITEURL]/assets/images/line.png" alt="line" height="43" width="251" style="width:250px"></td>\r\n  </tr>\r\n  <tr>\r\n    <td height="30"></td>\r\n  </tr>\r\n  <tr>\r\n    <td class="container-padding content" style="padding-left:24px;padding-right:24px;padding-top:12px;padding-bottom:12px;background-color:#ffffff" align="left"><div class="body-text" style="font-family:Helvetica, Arial, sans-serif;font-size:14px;line-height:20px;text-align:left;color:#222222">Your submitted article has been [STATUS]</div></td>\r\n  </tr>\r\n  <tr>\r\n    <td height="65"></td>\r\n  </tr>\r\n  <tr>\r\n    <td style="border-bottom:1px solid #DDDDDD;"></td>\r\n  </tr>\r\n  <tr>\r\n    <td height="25"></td>\r\n  </tr>\r\n  <tr>\r\n    <td style="text-align:center" align="center"><table align="center" border="0" cellpadding="0" cellspacing="0" width="95%">\r\n<tbody>\r\n<tr>\r\n  <td style="font-family:Helvetica, Arial, sans-serif" align="left" valign="top"><div align="left">\r\n<p style="text-align:left;color:#999999;font-size:12px;font-weight:normal;line-height:20px;">This email is sent to you directly from <a href="[SITEURL]">[COMPANY]</a> The information above is gathered from the user input. <br>\r\n©[DATE] <a href="[SITEURL]">[COMPANY]</a>. All rights reserved. </p>\r\n    </div></td>\r\n  <td width="30"></td>\r\n  <td valign="top" width="52"><a target="_blank" href="http://facebook.com/[FB]"><img src="[SITEURL]/assets/images/facebook.png" alt="facebook icon" height="53" width="52" style="width:52px"></a></td>\r\n  <td width="16"></td>\r\n  <td valign="top" width="52"><a target="_blank" href="http://twitter.com/[TW]"><img src="[SITEURL]/assets/images/twitter.png" alt="twitter icon" height="53" width="52" style="width:52px"></a></td>\r\n</tr>\r\n</tbody>\r\n</table></td>\r\n  </tr>\r\n</tbody>\r\n</table></td>\r\n    </tr>\r\n  </tbody>\r\n</table>', 'mailer', 'blogUserNotify');
INSERT INTO `email_templates` VALUES(24, 'Forgot Password Admin', 'Password Reset', 'This template is used for retrieving lost admin password', '<table border="0" width="100%" cellspacing="0" cellpadding="0" bgcolor="#F0F0F0">\r\n<tbody>\r\n<tr>\r\n<td style="background-color: #ffffff;" align="center" valign="top" bgcolor="#ffffff"><br />\r\n<table class="container" style="width: 100%px; max-width: 600px;" border="0" width="100%" cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td height="30"> </td>\r\n</tr>\r\n<tr>\r\n<td align="center">[LOGO]</td>\r\n</tr>\r\n<tr>\r\n<td height="20"> </td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p style="text-align: center; margin: 0; font-family: Helvetica, Arial, sans-serif; font-size: 26px; color: #222222;">New password reset from [COMPANY]</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td align="center"><img style="width: 250px;" src="[SITEURL]/assets/images/line.png" alt="line" width="251" height="43" /></td>\r\n</tr>\r\n<tr>\r\n<td height="30"> </td>\r\n</tr>\r\n<tr>\r\n<td class="container-padding content" style="background-color: #ffffff; padding: 12px 24px 12px 24px;" align="left"><br />\r\nHello, [NAME]\r\n<br />\r\nIt seems that you or someone requested a new password for you.<br /> We have generated a new password, as requested: <br /> \r\n</td>\r\n</tr>\r\n<tr>\r\n<td class="container-padding content" style="background-color: #ffffff; padding: 12px 24px 12px 24px;" align="left">\r\nNew Password: [PASSWORD]\r\n</td>\r\n</tr>\r\n<tr>\r\n<td height="65"> </td>\r\n</tr>\r\n<tr>\r\n<td align="center">\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td style="background: #289CDC; padding: 15px 18px; -webkit-border-radius: 4px; border-radius: 4px; font-family: Helvetica, Arial, sans-serif;" align="center" bgcolor="#289CDC">\r\n<a target="_blank" href="[LINK]" style="color: #ffffff; text-decoration: none; font-size: 16px;">Admin Panel</a>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style="border-bottom: 1px solid #DDDDDD;"> </td>\r\n</tr>\r\n<tr>\r\n<td height="25"> </td>\r\n</tr>\r\n<tr>\r\n<td style="text-align: center;" align="center">\r\n<table border="0" width="95%" cellspacing="0" cellpadding="0" align="center">\r\n<tbody>\r\n<tr>\r\n<td style="font-family: Helvetica, Arial, sans-serif;" align="left" valign="top">\r\n\r\n<p style="text-align: left; color: #999999; font-size: 12px; font-weight: normal; line-height: 20px;">This email is sent to you directly from <a href="[SITEURL]">[COMPANY]</a> The information above is gathered from the user input. <br /> ©[DATE] <a href="[SITEURL]">[COMPANY]</a>. All rights reserved.</p>\r\n\r\n</td>\r\n<td width="30"> </td>\r\n<td valign="top" width="52"><a target="_blank" href="http://facebook.com/[FB]"><img style="width: 52px;" src="[SITEURL]/assets/images/facebook.png" alt="facebook icon" width="52" height="53" /></a></td>\r\n<td width="16"> </td>\r\n<td valign="top" width="52"><a target="_blank" href="http://twitter.com/[TW]"><img style="width: 52px;" src="[SITEURL]/assets/images/twitter.png" alt="twitter icon" width="52" height="53" /></a></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>', 'mailer', 'adminPassReset');

-- --------------------------------------------------------

--
-- Table structure for table `gateways`
--

DROP TABLE IF EXISTS `gateways`;
CREATE TABLE IF NOT EXISTS `gateways` (
  `id` tinyint(1) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `displayname` varchar(50) NOT NULL,
  `dir` varchar(25) NOT NULL,
  `live` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `extra_txt` varchar(100) DEFAULT NULL,
  `extra_txt2` varchar(100) DEFAULT NULL,
  `extra_txt3` varchar(100) DEFAULT NULL,
  `extra` varchar(100) DEFAULT NULL,
  `extra2` varchar(100) DEFAULT NULL,
  `extra3` text,
  `is_recurring` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `active` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gateways`
--

INSERT INTO `gateways` VALUES(1, 'paypal', 'PayPal', 'paypal', 1, 'Email Address', 'Currency Code', 'Not in Use', 'paypal@address.com', 'CAD', '', 1, 1);
INSERT INTO `gateways` VALUES(2, 'skrill', 'Skrill', 'skrill', 1, 'Email Address', 'Currency Code', 'Secret Passphrase', 'moneybookers@address.com', 'EUR', 'mypassphrase', 1, 1);
INSERT INTO `gateways` VALUES(3, 'offline', 'Offline Payment', 'offline', 0, 'Not in Use', 'Not in Use', 'Instructions', '', '', 'Please submit all payments to:\nBank Name:\nBank Account:\netc...', 0, 1);
INSERT INTO `gateways` VALUES(4, 'stripe', 'Stripe', 'stripe', 0, 'Secret Key', 'Currency Code', 'Publishable Key', 'ooo', 'CAD', 'ooo', 1, 1);
INSERT INTO `gateways` VALUES(5, 'payfast', 'PayFast', 'payfast', 0, 'Merchant ID', 'Merchant Key', 'PassPhrase', '', '', '', 0, 1);
INSERT INTO `gateways` VALUES(6, 'ideal', 'iDeal', 'ideal', 0, 'API Key', 'Currency Code', 'Not in Use', 'ooo', 'EUR', NULL, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
CREATE TABLE IF NOT EXISTS `language` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `abbr` varchar(2) DEFAULT NULL,
  `langdir` enum('ltr','rtl') DEFAULT 'ltr',
  `color` varchar(7) DEFAULT NULL,
  `author` varchar(200) DEFAULT NULL,
  `home` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `language`
--

INSERT INTO `language` VALUES(1, 'English', 'en', 'ltr', '#7ACB95', 'http://www.wojoscripts.com', 1);

-- --------------------------------------------------------

--
-- Table structure for table `layout`
--

DROP TABLE IF EXISTS `layout`;
CREATE TABLE IF NOT EXISTS `layout` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plug_id` int(11) unsigned NOT NULL DEFAULT '0',
  `page_id` int(11) unsigned NOT NULL DEFAULT '0',
  `mod_id` int(11) unsigned NOT NULL DEFAULT '0',
  `modalias` varchar(30) DEFAULT NULL,
  `page_slug_en` varchar(150) DEFAULT NULL,
  `is_content` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `plug_name` varchar(60) DEFAULT NULL,
  `place` varchar(20) DEFAULT NULL,
  `space` tinyint(1) unsigned NOT NULL DEFAULT '10',
  `type` varchar(8) DEFAULT NULL,
  `sorting` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_page_id` (`page_id`),
  KEY `idx_plug_id` (`plug_id`),
  KEY `idx_mod_id` (`mod_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `memberships`
--

DROP TABLE IF EXISTS `memberships`;
CREATE TABLE IF NOT EXISTS `memberships` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title_en` varchar(80) NOT NULL DEFAULT '',
  `description_en` varchar(150) DEFAULT NULL,
  `thumb` varchar(40) DEFAULT NULL,
  `price` float(10,2) unsigned NOT NULL DEFAULT '0.00',
  `days` smallint(3) unsigned NOT NULL DEFAULT '1',
  `period` varchar(1) NOT NULL DEFAULT 'D',
  `trial` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `recurring` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `private` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `memberships`
--

INSERT INTO `memberships` VALUES(1, 'Trial 7', 'This is 7 days trial membership...', 'bronze.png', 0.00, 7, 'D', 1, 0, 0, 1);
INSERT INTO `memberships` VALUES(2, 'Basic 30', 'This is 30 days basic membership', 'silver.png', 29.99, 1, 'M', 0, 0, 0, 1);
INSERT INTO `memberships` VALUES(3, 'Platinum', 'Platinum Monthly Subscription.', 'gold.png', 49.99, 1, 'Y', 0, 1, 0, 1);
INSERT INTO `memberships` VALUES(4, 'Weekly Access', 'This is 7 days basic membership', 'platinum.png', 5.99, 1, 'W', 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
CREATE TABLE IF NOT EXISTS `menus` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) unsigned NOT NULL DEFAULT '0',
  `page_id` int(11) unsigned NOT NULL DEFAULT '0',
  `page_slug_en` varchar(100) DEFAULT NULL,
  `name_en` varchar(100) NOT NULL,
  `mod_id` int(6) unsigned NOT NULL DEFAULT '0',
  `mod_slug` varchar(100) DEFAULT NULL,
  `caption_en` varchar(100) DEFAULT NULL,
  `content_type` varchar(20) NOT NULL DEFAULT 'page',
  `link` varchar(200) DEFAULT NULL,
  `target` varchar(15) NOT NULL DEFAULT '_blank',
  `icon` varchar(50) DEFAULT NULL,
  `cols` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `position` int(11) unsigned NOT NULL DEFAULT '0',
  `home_page` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_parent_id` (`parent_id`),
  KEY `idx_page_id` (`page_id`),
  KEY `idx_mod_id` (`mod_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `parent_id`, `page_id`, `page_slug_en`, `name_en`, `mod_id`, `mod_slug`, `caption_en`, `content_type`, `link`, `target`, `icon`, `cols`, `position`, `home_page`, `active`) VALUES(1, 0, 3, 'our-contact-info', 'Contact Us', 0, 'contact-us', 'Get in touch', 'page', '', '', 'mail icon', 1, 28, 0, 1);
INSERT INTO `menus` (`id`, `parent_id`, `page_id`, `page_slug_en`, `name_en`, `mod_id`, `mod_slug`, `caption_en`, `content_type`, `link`, `target`, `icon`, `cols`, `position`, `home_page`, `active`) VALUES(2, 0, 1, 'home', 'Home Page', 8, 'blog', 'Let&#39;s Start here', 'module', '', '', 'home icon', 1, 1, 1, 1);
INSERT INTO `menus` (`id`, `parent_id`, `page_id`, `page_slug_en`, `name_en`, `mod_id`, `mod_slug`, `caption_en`, `content_type`, `link`, `target`, `icon`, `cols`, `position`, `home_page`, `active`) VALUES(3, 52, 7, 'middle-column', 'Single Column', 0, NULL, '', 'page', '', '', 'icon brightness', 1, 6, 0, 1);
INSERT INTO `menus` (`id`, `parent_id`, `page_id`, `page_slug_en`, `name_en`, `mod_id`, `mod_slug`, `caption_en`, `content_type`, `link`, `target`, `icon`, `cols`, `position`, `home_page`, `active`) VALUES(5, 51, 5, 'demo-gallery-page', 'Gallery', 1, 'gallery', 'Gallery page', 'module', '#', '', 'photo icon', 1, 18, 0, 1);
INSERT INTO `menus` (`id`, `parent_id`, `page_id`, `page_slug_en`, `name_en`, `mod_id`, `mod_slug`, `caption_en`, `content_type`, `link`, `target`, `icon`, `cols`, `position`, `home_page`, `active`) VALUES(6, 0, 0, NULL, 'External Link', 0, 'external-link', '', 'web', 'http://www.google.com', '_blank', 'anchor icon', 1, 27, 0, 0);
INSERT INTO `menus` (`id`, `parent_id`, `page_id`, `page_slug_en`, `name_en`, `mod_id`, `mod_slug`, `caption_en`, `content_type`, `link`, `target`, `icon`, `cols`, `position`, `home_page`, `active`) VALUES(7, 0, 0, NULL, 'More Pages', 0, 'more-pages', 'Demo Pages', 'web', '#', '_self', 'copy icon', 2, 2, 0, 1);
INSERT INTO `menus` (`id`, `parent_id`, `page_id`, `page_slug_en`, `name_en`, `mod_id`, `mod_slug`, `caption_en`, `content_type`, `link`, `target`, `icon`, `cols`, `position`, `home_page`, `active`) VALUES(11, 52, 2, 'what-is-cms-pro', 'About Us', 0, 'about-us', 'Who are we', 'page', '', '', 'globe icon', 1, 8, 0, 1);
INSERT INTO `menus` (`id`, `parent_id`, `page_id`, `page_slug_en`, `name_en`, `mod_id`, `mod_slug`, `caption_en`, `content_type`, `link`, `target`, `icon`, `cols`, `position`, `home_page`, `active`) VALUES(17, 52, 9, 'members-only', 'Members Only', 0, 'members-only', NULL, 'page', '', '', NULL, 1, 9, 0, 1);
INSERT INTO `menus` (`id`, `parent_id`, `page_id`, `page_slug_en`, `name_en`, `mod_id`, `mod_slug`, `caption_en`, `content_type`, `link`, `target`, `icon`, `cols`, `position`, `home_page`, `active`) VALUES(18, 52, 10, 'membership-only', 'Membership Only', 0, 'membership-only', NULL, 'page', '', '', NULL, 1, 10, 0, 1);
INSERT INTO `menus` (`id`, `parent_id`, `page_id`, `page_slug_en`, `name_en`, `mod_id`, `mod_slug`, `caption_en`, `content_type`, `link`, `target`, `icon`, `cols`, `position`, `home_page`, `active`) VALUES(19, 51, 11, 'event-calendar-demo', 'Event Manager Demo', 0, NULL, '', 'page', '', '', 'time icon', 1, 19, 0, 1);
INSERT INTO `menus` (`id`, `parent_id`, `page_id`, `page_slug_en`, `name_en`, `mod_id`, `mod_slug`, `caption_en`, `content_type`, `link`, `target`, `icon`, `cols`, `position`, `home_page`, `active`) VALUES(20, 52, 12, 'page-with-comments', 'Comment Page', 0, NULL, '', 'page', '', '', 'photo icon', 1, 7, 0, 1);
INSERT INTO `menus` (`id`, `parent_id`, `page_id`, `page_slug_en`, `name_en`, `mod_id`, `mod_slug`, `caption_en`, `content_type`, `link`, `target`, `icon`, `cols`, `position`, `home_page`, `active`) VALUES(21, 52, 13, 'right-sidebar', 'Sidebar Right', 0, NULL, '', 'page', '', '', 'browser icon', 1, 5, 0, 1);
INSERT INTO `menus` (`id`, `parent_id`, `page_id`, `page_slug_en`, `name_en`, `mod_id`, `mod_slug`, `caption_en`, `content_type`, `link`, `target`, `icon`, `cols`, `position`, `home_page`, `active`) VALUES(23, 7, 0, NULL, 'Helpdesk', 0, NULL, '', 'web', 'http://ckb.wojoscripts.com', '_blank', '', 1, 21, 0, 1);
INSERT INTO `menus` (`id`, `parent_id`, `page_id`, `page_slug_en`, `name_en`, `mod_id`, `mod_slug`, `caption_en`, `content_type`, `link`, `target`, `icon`, `cols`, `position`, `home_page`, `active`) VALUES(34, 38, 0, 'portfolio', 'Portfolio', 6, 'portfolio', NULL, 'web', '#', '', 'grid layout icon', 1, 24, 0, 1);
INSERT INTO `menus` (`id`, `parent_id`, `page_id`, `page_slug_en`, `name_en`, `mod_id`, `mod_slug`, `caption_en`, `content_type`, `link`, `target`, `icon`, `cols`, `position`, `home_page`, `active`) VALUES(35, 57, 8, 'timeline-custom-demo', 'Timeline Custom', 0, NULL, '', 'page', '', '', 'photo icon', 1, 16, 0, 1);
INSERT INTO `menus` (`id`, `parent_id`, `page_id`, `page_slug_en`, `name_en`, `mod_id`, `mod_slug`, `caption_en`, `content_type`, `link`, `target`, `icon`, `cols`, `position`, `home_page`, `active`) VALUES(36, 38, 0, 'digishop', 'Digishop', 7, 'digishop', '', 'web', '#', '', 'cart icon', 1, 25, 0, 1);
INSERT INTO `menus` (`id`, `parent_id`, `page_id`, `page_slug_en`, `name_en`, `mod_id`, `mod_slug`, `caption_en`, `content_type`, `link`, `target`, `icon`, `cols`, `position`, `home_page`, `active`) VALUES(37, 38, 6, 'visual-forms', 'Visual Forms', 0, 'visual-forms', '', 'web', '#', '', 'tasks icon', 1, 26, 0, 1);
INSERT INTO `menus` (`id`, `parent_id`, `page_id`, `page_slug_en`, `name_en`, `mod_id`, `mod_slug`, `caption_en`, `content_type`, `link`, `target`, `icon`, `cols`, `position`, `home_page`, `active`) VALUES(38, 0, 0, '', 'Premium Modules', 0, 'premium-modules', 'Premium Modules', 'web', '#', '', 'puzzle piece icon', 1, 22, 0, 1);
INSERT INTO `menus` (`id`, `parent_id`, `page_id`, `page_slug_en`, `name_en`, `mod_id`, `mod_slug`, `caption_en`, `content_type`, `link`, `target`, `icon`, `cols`, `position`, `home_page`, `active`) VALUES(39, 38, 0, 'blog', 'Blog Manager', 8, 'blog', '', 'web', '#', '', 'tasks icon', 1, 23, 0, 1);
INSERT INTO `menus` (`id`, `parent_id`, `page_id`, `page_slug_en`, `name_en`, `mod_id`, `mod_slug`, `caption_en`, `content_type`, `link`, `target`, `icon`, `cols`, `position`, `home_page`, `active`) VALUES(42, 52, 21, 'left-sidebar', 'Sidebar Left', 0, NULL, '', 'page', '', '', 'photo icon', 0, 4, 0, 1);
INSERT INTO `menus` (`id`, `parent_id`, `page_id`, `page_slug_en`, `name_en`, `mod_id`, `mod_slug`, `caption_en`, `content_type`, `link`, `target`, `icon`, `cols`, `position`, `home_page`, `active`) VALUES(43, 51, 22, 'demo-faq', 'FAQ Manager', 0, 'faq-manager', '', 'page', '', '', 'help icon', 0, 20, 0, 1);
INSERT INTO `menus` (`id`, `parent_id`, `page_id`, `page_slug_en`, `name_en`, `mod_id`, `mod_slug`, `caption_en`, `content_type`, `link`, `target`, `icon`, `cols`, `position`, `home_page`, `active`) VALUES(51, 7, 0, NULL, 'Modules', 0, NULL, 'Modules', 'web', '#', '_self', '', 1, 17, 0, 1);
INSERT INTO `menus` (`id`, `parent_id`, `page_id`, `page_slug_en`, `name_en`, `mod_id`, `mod_slug`, `caption_en`, `content_type`, `link`, `target`, `icon`, `cols`, `position`, `home_page`, `active`) VALUES(52, 7, 0, NULL, 'Demo Pages', 0, NULL, 'Demo Pages', 'web', '#', '_self', '', 1, 3, 0, 1);
INSERT INTO `menus` (`id`, `parent_id`, `page_id`, `page_slug_en`, `name_en`, `mod_id`, `mod_slug`, `caption_en`, `content_type`, `link`, `target`, `icon`, `cols`, `position`, `home_page`, `active`) VALUES(53, 57, 0, 'timeline-event-demo', 'Timeline Events', 0, NULL, '', 'page', '', '', '', 1, 14, 0, 1);
INSERT INTO `menus` (`id`, `parent_id`, `page_id`, `page_slug_en`, `name_en`, `mod_id`, `mod_slug`, `caption_en`, `content_type`, `link`, `target`, `icon`, `cols`, `position`, `home_page`, `active`) VALUES(54, 57, 0, 'timeline-portfolio-demo', 'Timeline Portfolio', 0, NULL, '', 'page', '', '', '', 1, 13, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

DROP TABLE IF EXISTS `modules`;
CREATE TABLE IF NOT EXISTS `modules` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title_en` varchar(120) NOT NULL,
  `info_en` varchar(200) DEFAULT NULL,
  `modalias` varchar(60) NOT NULL,
  `hasconfig` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hascoupon` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hasfields` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `system` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `content` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `parent_id` smallint(3) unsigned NOT NULL DEFAULT '0',
  `is_menu` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_builder` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `keywords_en` varchar(200) DEFAULT NULL,
  `description_en` text,
  `icon` varchar(50) DEFAULT NULL,
  `ver` decimal(4,2) unsigned NOT NULL DEFAULT '1.00',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `title_en`, `info_en`, `modalias`, `hasconfig`, `hascoupon`, `hasfields`, `system`, `content`, `parent_id`, `is_menu`, `is_builder`, `keywords_en`, `description_en`, `icon`, `ver`, `created`, `active`) VALUES(1, 'Gallery', 'Fully featured gallery module', 'gallery', 1, 0, 0, 1, 1, 0, 1, 0, '', '', 'gallery/thumb.svg', '5.00', '2014-04-28 22:19:32', 1);
INSERT INTO `modules` (`id`, `title_en`, `info_en`, `modalias`, `hasconfig`, `hascoupon`, `hasfields`, `system`, `content`, `parent_id`, `is_menu`, `is_builder`, `keywords_en`, `description_en`, `icon`, `ver`, `created`, `active`) VALUES(3, 'Comments', 'Encourage your readers to join in the discussion and leave comments and respond promptly to the comments left by your readers to make them feel valued', 'comments', 1, 0, 0, 0, 1, 0, 0, 0, NULL, NULL, 'comments/thumb.svg', '5.00', '2016-10-15 14:05:56', 1);
INSERT INTO `modules` (`id`, `title_en`, `info_en`, `modalias`, `hasconfig`, `hascoupon`, `hasfields`, `system`, `content`, `parent_id`, `is_menu`, `is_builder`, `keywords_en`, `description_en`, `icon`, `ver`, `created`, `active`) VALUES(4, 'Event Manager', 'Easily publish and manage your company events.', 'events', 1, 0, 0, 0, 1, 0, 0, 1, NULL, NULL, 'events/thumb.svg', '5.00', '2016-10-15 16:03:54', 1);
INSERT INTO `modules` (`id`, `title_en`, `info_en`, `modalias`, `hasconfig`, `hascoupon`, `hasfields`, `system`, `content`, `parent_id`, `is_menu`, `is_builder`, `keywords_en`, `description_en`, `icon`, `ver`, `created`, `active`) VALUES(6, 'Universal Timeline', 'Create unlimited timline pugins.', 'timeline', 1, 0, 0, 1, 1, 0, 0, 0, NULL, NULL, 'timeline/thumb.svg', '5.00', '2016-10-28 12:59:59', 1);
INSERT INTO `modules` (`id`, `title_en`, `info_en`, `modalias`, `hasconfig`, `hascoupon`, `hasfields`, `system`, `content`, `parent_id`, `is_menu`, `is_builder`, `keywords_en`, `description_en`, `icon`, `ver`, `created`, `active`) VALUES(9, 'AdBlock', 'Manage Ad Campaigns', 'adblock', 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 'adblock/thumb.svg', '5.00', '2016-11-14 18:20:18', 1);
INSERT INTO `modules` (`id`, `title_en`, `info_en`, `modalias`, `hasconfig`, `hascoupon`, `hasfields`, `system`, `content`, `parent_id`, `is_menu`, `is_builder`, `keywords_en`, `description_en`, `icon`, `ver`, `created`, `active`) VALUES(11, 'Location Maps', 'Add Google Maps with multiple markers', 'gmaps', 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 'gmaps/thumb.svg', '5.00', '2016-11-19 18:08:30', 1);
INSERT INTO `modules` (`id`, `title_en`, `info_en`, `modalias`, `hasconfig`, `hascoupon`, `hasfields`, `system`, `content`, `parent_id`, `is_menu`, `is_builder`, `keywords_en`, `description_en`, `icon`, `ver`, `created`, `active`) VALUES(12, 'Album One', NULL, 'gallery', 0, 0, 0, 0, 0, 1, 0, 1, NULL, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod', 'gallery/thumb.svg', '1.00', '2017-01-04 10:18:56', 1);
INSERT INTO `modules` (`id`, `title_en`, `info_en`, `modalias`, `hasconfig`, `hascoupon`, `hasfields`, `system`, `content`, `parent_id`, `is_menu`, `is_builder`, `keywords_en`, `description_en`, `icon`, `ver`, `created`, `active`) VALUES(13, 'Album Two', NULL, 'gallery', 0, 0, 0, 0, 0, 2, 0, 1, NULL, NULL, 'gallery/thumb.svg', '1.00', '2017-01-04 10:27:41', 1);
INSERT INTO `modules` (`id`, `title_en`, `info_en`, `modalias`, `hasconfig`, `hascoupon`, `hasfields`, `system`, `content`, `parent_id`, `is_menu`, `is_builder`, `keywords_en`, `description_en`, `icon`, `ver`, `created`, `active`) VALUES(14, 'Album Three', NULL, 'gallery', 0, 0, 0, 0, 0, 3, 0, 1, NULL, NULL, 'gallery/thumb.svg', '1.00', '2017-01-04 10:28:17', 1);
INSERT INTO `modules` (`id`, `title_en`, `info_en`, `modalias`, `hasconfig`, `hascoupon`, `hasfields`, `system`, `content`, `parent_id`, `is_menu`, `is_builder`, `keywords_en`, `description_en`, `icon`, `ver`, `created`, `active`) VALUES(15, 'Album Four', NULL, 'gallery', 0, 0, 0, 0, 0, 4, 0, 1, NULL, NULL, 'gallery/thumb.svg', '1.00', '2017-01-04 10:28:48', 1);
INSERT INTO `modules` (`id`, `title_en`, `info_en`, `modalias`, `hasconfig`, `hascoupon`, `hasfields`, `system`, `content`, `parent_id`, `is_menu`, `is_builder`, `keywords_en`, `description_en`, `icon`, `ver`, `created`, `active`) VALUES(19, 'Event Timeline', NULL, 'timeline', 0, 0, 0, 0, 0, 2, 0, 1, NULL, NULL, 'timeline/thumb.svg', '1.00', '2017-01-04 10:49:05', 1);
INSERT INTO `modules` (`id`, `title_en`, `info_en`, `modalias`, `hasconfig`, `hascoupon`, `hasfields`, `system`, `content`, `parent_id`, `is_menu`, `is_builder`, `keywords_en`, `description_en`, `icon`, `ver`, `created`, `active`) VALUES(20, 'Rss Timeline', NULL, 'timeline', 0, 0, 0, 0, 0, 3, 0, 1, NULL, NULL, 'timeline/thumb.svg', '1.00', '2017-01-04 10:49:34', 1);
INSERT INTO `modules` (`id`, `title_en`, `info_en`, `modalias`, `hasconfig`, `hascoupon`, `hasfields`, `system`, `content`, `parent_id`, `is_menu`, `is_builder`, `keywords_en`, `description_en`, `icon`, `ver`, `created`, `active`) VALUES(23, 'Custom Timeline', NULL, 'timeline/custom_timeline', 0, 0, 0, 0, 0, 6, 0, 1, NULL, NULL, 'timeline/thumb.svg', '1.00', '2017-01-04 10:51:06', 1);
INSERT INTO `modules` (`id`, `title_en`, `info_en`, `modalias`, `hasconfig`, `hascoupon`, `hasfields`, `system`, `content`, `parent_id`, `is_menu`, `is_builder`, `keywords_en`, `description_en`, `icon`, `ver`, `created`, `active`) VALUES(24, 'F.A.Q. Manager', 'Complete Frequently Asked Question Management Module', 'faq', 1, 0, 0, 0, 1, 0, 0, 1, NULL, NULL, 'faq/thumb.svg', '1.00', '2017-05-25 07:54:17', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mod_adblock`
--

DROP TABLE IF EXISTS `mod_adblock`;
CREATE TABLE IF NOT EXISTS `mod_adblock` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title_en` varchar(100) NOT NULL,
  `plugin_id` varchar(30) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `total_views_allowed` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `total_clicks_allowed` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `minimum_ctr` decimal(10,2) UNSIGNED NOT NULL DEFAULT '0.00',
  `image` varchar(50) DEFAULT NULL,
  `image_link` varchar(100) DEFAULT NULL,
  `image_alt` varchar(100) DEFAULT NULL,
  `html` text,
  `total_views` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `total_clicks` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mod_adblock`
--

INSERT INTO `mod_adblock` (`id`, `title_en`, `plugin_id`, `start_date`, `end_date`, `total_views_allowed`, `total_clicks_allowed`, `minimum_ctr`, `image`, `image_link`, `image_alt`, `html`, `total_views`, `total_clicks`, `created`) VALUES
(1, 'Default Campaign', 'adblock/wojo-advert', '2014-04-24', '2025-10-01', 0, 0, '0.00', 'BANNER_sg2GlexD6Fnz.png', 'http://wojoscripts.com/', 'Wojo Advert', NULL, 4213, 1282, '2019-03-08 19:56:24');

-- --------------------------------------------------------

--
-- Table structure for table `mod_comments`
--

DROP TABLE IF EXISTS `mod_comments`;
CREATE TABLE IF NOT EXISTS `mod_comments` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `comment_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `parent_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `username` varchar(50) DEFAULT NULL,
  `section` varchar(20) NOT NULL,
  `vote_up` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `vote_down` int(11) NOT NULL DEFAULT '0',
  `body` text,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `active` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_parent` (`parent_id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_comment_id` (`comment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
--
-- Table structure for table `mod_events`
--

DROP TABLE IF EXISTS `mod_events`;
CREATE TABLE IF NOT EXISTS `mod_events` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `title_en` varchar(100) NOT NULL,
  `venue_en` varchar(100) DEFAULT NULL,
  `date_start` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  `time_start` time DEFAULT NULL,
  `time_end` time DEFAULT NULL,
  `body_en` text,
  `contact_person` varchar(100) DEFAULT NULL,
  `contact_email` varchar(80) DEFAULT NULL,
  `contact_phone` varchar(24) DEFAULT NULL,
  `color` varchar(7) DEFAULT NULL,
  `active` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mod_faq`
--

DROP TABLE IF EXISTS `mod_faq`;
CREATE TABLE IF NOT EXISTS `mod_faq` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(4) unsigned NOT NULL DEFAULT '0',
  `question_en` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `answer_en` text COLLATE utf8_unicode_ci,
  `sorting` int(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ixd_category` (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='contains f.a.q. data';

-- --------------------------------------------------------

--
-- Table structure for table `mod_faq_categories`
--

CREATE TABLE `mod_faq_categories` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `name_en` varchar(50) NOT NULL,
  `sorting` int(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mod_faq_categories`
--

DROP TABLE IF EXISTS `mod_faq_categories`;
CREATE TABLE IF NOT EXISTS `mod_faq_categories` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `name_en` varchar(50) CHARACTER SET utf16 NOT NULL,
  `sorting` int(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf16;

-- --------------------------------------------------------

--
-- Dumping data for table `mod_faq_categories`
--

INSERT INTO `mod_faq_categories` (`id`, `name_en`, `sorting`) VALUES
(1, 'Basics', 1),
(2, 'Syncing', 2),
(3, 'Account', 3),
(4, 'Privacy', 4);

-- --------------------------------------------------------

--
-- Table structure for table `mod_gallery`
--

DROP TABLE IF EXISTS `mod_gallery`;
CREATE TABLE IF NOT EXISTS `mod_gallery` (
  `id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title_en` varchar(60) NOT NULL,
  `slug_en` varchar(100) DEFAULT NULL,
  `description_en` varchar(100) DEFAULT NULL,
  `thumb_w` smallint(1) UNSIGNED DEFAULT '500',
  `thumb_h` smallint(1) UNSIGNED NOT NULL DEFAULT '500',
  `poster` varchar(60) DEFAULT NULL,
  `cols` smallint(1) UNSIGNED NOT NULL DEFAULT '300',
  `dir` varchar(40) NOT NULL,
  `resize` varchar(30) DEFAULT NULL,
  `watermark` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'ebable watermark',
  `likes` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'enable like',
  `sorting` int(4) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mod_gallery`
--

INSERT INTO `mod_gallery` VALUES(1, 'Album One', 'album-one', '- New gallery module (albums), responsive images different layouts -', 500, 500, 'image_1.jpg', 400, 'album_one', 'thumbnail', 1, 1, 1);
INSERT INTO `mod_gallery` VALUES(2, 'Album Two', 'album-two', NULL, 500, 500, 'image_2.jpg', 300, 'album_two', 'bestFit', 0, 0, 2);
INSERT INTO `mod_gallery` VALUES(3, 'Album Three', 'album-three', NULL, 500, 500, 'image_3.jpg', 400, 'album_three', 'bestFit', 0, 0, 3);
INSERT INTO `mod_gallery` VALUES(4, 'Album Four', 'album-four', NULL, 500, 500, 'image_4.jpg', 400, 'album_four', 'bestFit', 0, 0, 4);

-- --------------------------------------------------------

--
-- Table structure for table `mod_gallery_data`
--

DROP TABLE IF EXISTS `mod_gallery_data`;
CREATE TABLE IF NOT EXISTS `mod_gallery_data` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `title_en` varchar(80) NOT NULL,
  `description_en` varchar(200) DEFAULT NULL,
  `thumb` varchar(80) DEFAULT NULL,
  `likes` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `sorting` int(11) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_parent_id` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mod_gallery_data`
--

INSERT INTO `mod_gallery_data` VALUES(1, 1, 'Design in a Box', 'Hop duon tioma lumigi nv, if tiela poezio sezononomo fri, semi pleje lingvonomo ac unt.', 'image_1.jpg', 150, 1);
INSERT INTO `mod_gallery_data` VALUES(2, 1, 'Social Vision', 'Hop duon tioma lumigi nv, if tiela poezio sezononomo fri, semi pleje lingvonomo ac unt.', 'image_2.jpg', 226, 2);
INSERT INTO `mod_gallery_data` VALUES(3, 1, 'Planning and Planning', 'Hop duon tioma lumigi nv, if tiela poezio sezononomo fri, semi pleje lingvonomo ac unt.', 'image_3.jpg', 328, 3);
INSERT INTO `mod_gallery_data` VALUES(4, 1, 'Up, up and away', 'Hop duon tioma lumigi nv, if tiela poezio sezononomo fri, semi pleje lingvonomo ac unt.', 'image_4.jpg', 489, 4);
INSERT INTO `mod_gallery_data` VALUES(5, 1, 'Flying Ideas', 'Hop duon tioma lumigi nv, if tiela poezio sezononomo fri, semi pleje lingvonomo ac unt.', 'image_5.jpg', 292, 5);
INSERT INTO `mod_gallery_data` VALUES(6, 1, 'Shopping Touch', 'Hop duon tioma lumigi nv, if tiela poezio sezononomo fri, semi pleje lingvonomo ac unt.', 'image_6.jpg', 544, 6);
INSERT INTO `mod_gallery_data` VALUES(7, 1, 'True Colors', 'Hop duon tioma lumigi nv, if tiela poezio sezononomo fri, semi pleje lingvonomo ac unt.', 'image_7.jpg', 754, 7);
INSERT INTO `mod_gallery_data` VALUES(8, 1, 'Touch the Future', 'Hop duon tioma lumigi nv, if tiela poezio sezononomo fri, semi pleje lingvonomo ac unt.', 'image_8.jpg', 659, 8);
INSERT INTO `mod_gallery_data` VALUES(10, 2, 'Design in a Box', 'Hop duon tioma lumigi nv, if tiela poezio sezononomo fri, semi pleje lingvonomo ac unt.', 'image_1.jpg', 156, 1);
INSERT INTO `mod_gallery_data` VALUES(11, 2, 'Social Vision', 'Hop duon tioma lumigi nv, if tiela poezio sezononomo fri, semi pleje lingvonomo ac unt.', 'image_2.jpg', 225, 2);
INSERT INTO `mod_gallery_data` VALUES(12, 2, 'Planning and Planning', 'Hop duon tioma lumigi nv, if tiela poezio sezononomo fri, semi pleje lingvonomo ac unt.', 'image_3.jpg', 358, 3);
INSERT INTO `mod_gallery_data` VALUES(13, 2, 'Up, up and away', 'Hop duon tioma lumigi nv, if tiela poezio sezononomo fri, semi pleje lingvonomo ac unt.', 'image_4.jpg', 487, 4);
INSERT INTO `mod_gallery_data` VALUES(14, 2, 'Flying Ideas', 'Hop duon tioma lumigi nv, if tiela poezio sezononomo fri, semi pleje lingvonomo ac unt.', 'image_5.jpg', 289, 5);
INSERT INTO `mod_gallery_data` VALUES(15, 2, 'Shopping Touch', 'Hop duon tioma lumigi nv, if tiela poezio sezononomo fri, semi pleje lingvonomo ac unt.', 'image_6.jpg', 541, 6);
INSERT INTO `mod_gallery_data` VALUES(16, 2, 'True Colors', 'Hop duon tioma lumigi nv, if tiela poezio sezononomo fri, semi pleje lingvonomo ac unt.', 'image_7.jpg', 752, 7);
INSERT INTO `mod_gallery_data` VALUES(17, 2, 'Touch the Future', 'Hop duon tioma lumigi nv, if tiela poezio sezononomo fri, semi pleje lingvonomo ac unt.', 'image_8.jpg', 657, 8);
INSERT INTO `mod_gallery_data` VALUES(19, 3, 'Design in a Box', 'Hop duon tioma lumigi nv, if tiela poezio sezononomo fri, semi pleje lingvonomo ac unt.', 'image_1.jpg', 150, 1);
INSERT INTO `mod_gallery_data` VALUES(20, 3, 'Social Vision', 'Hop duon tioma lumigi nv, if tiela poezio sezononomo fri, semi pleje lingvonomo ac unt.', 'image_2.jpg', 647, 2);
INSERT INTO `mod_gallery_data` VALUES(21, 3, 'Planning and Planning', 'Hop duon tioma lumigi nv, if tiela poezio sezononomo fri, semi pleje lingvonomo ac unt.', 'image_3.jpg', 325, 3);
INSERT INTO `mod_gallery_data` VALUES(22, 3, 'Up, up and away', 'Hop duon tioma lumigi nv, if tiela poezio sezononomo fri, semi pleje lingvonomo ac unt.', 'image_4.jpg', 487, 4);
INSERT INTO `mod_gallery_data` VALUES(23, 3, 'Flying Ideas', 'Hop duon tioma lumigi nv, if tiela poezio sezononomo fri, semi pleje lingvonomo ac unt.', 'image_5.jpg', 658, 5);
INSERT INTO `mod_gallery_data` VALUES(24, 3, 'Shopping Touch', 'Hop duon tioma lumigi nv, if tiela poezio sezononomo fri, semi pleje lingvonomo ac unt.', 'image_6.jpg', 541, 6);
INSERT INTO `mod_gallery_data` VALUES(25, 3, 'True Colors', 'Hop duon tioma lumigi nv, if tiela poezio sezononomo fri, semi pleje lingvonomo ac unt.', 'image_7.jpg', 752, 7);
INSERT INTO `mod_gallery_data` VALUES(26, 3, 'Touch the Future', 'Hop duon tioma lumigi nv, if tiela poezio sezononomo fri, semi pleje lingvonomo ac unt.', 'image_8.jpg', 657, 8);
INSERT INTO `mod_gallery_data` VALUES(28, 4, 'Design in a Box', 'Hop duon tioma lumigi nv, if tiela poezio sezononomo fri, semi pleje lingvonomo ac unt.', 'image_1.jpg', 150, 1);
INSERT INTO `mod_gallery_data` VALUES(29, 4, 'Social Vision', 'Hop duon tioma lumigi nv, if tiela poezio sezononomo fri, semi pleje lingvonomo ac unt.', 'image_2.jpg', 225, 2);
INSERT INTO `mod_gallery_data` VALUES(30, 4, 'Planning and Planning', 'Hop duon tioma lumigi nv, if tiela poezio sezononomo fri, semi pleje lingvonomo ac unt.', 'image_3.jpg', 325, 3);
INSERT INTO `mod_gallery_data` VALUES(31, 4, 'Up, up and away', 'Hop duon tioma lumigi nv, if tiela poezio sezononomo fri, semi pleje lingvonomo ac unt.', 'image_4.jpg', 487, 4);
INSERT INTO `mod_gallery_data` VALUES(32, 4, 'Flying Ideas', 'Hop duon tioma lumigi nv, if tiela poezio sezononomo fri, semi pleje lingvonomo ac unt.', 'image_5.jpg', 289, 5);
INSERT INTO `mod_gallery_data` VALUES(33, 4, 'Shopping Touch', 'Hop duon tioma lumigi nv, if tiela poezio sezononomo fri, semi pleje lingvonomo ac unt.', 'image_6.jpg', 541, 6);
INSERT INTO `mod_gallery_data` VALUES(34, 4, 'True Colors', 'Hop duon tioma lumigi nv, if tiela poezio sezononomo fri, semi pleje lingvonomo ac unt.', 'image_7.jpg', 752, 7);
INSERT INTO `mod_gallery_data` VALUES(35, 4, 'Touch the Future', 'Hop duon tioma lumigi nv, if tiela poezio sezononomo fri, semi pleje lingvonomo ac unt.', 'image_8.jpg', 897, 8);

-- --------------------------------------------------------

--
-- Table structure for table `mod_gmaps`
--

DROP TABLE IF EXISTS `mod_gmaps`;
CREATE TABLE IF NOT EXISTS `mod_gmaps` (
  `id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `plugin_id` varchar(40) DEFAULT NULL,
  `lat` decimal(10,6) NOT NULL DEFAULT '0.000000',
  `lng` decimal(10,6) NOT NULL DEFAULT '0.000000',
  `body` tinytext,
  `zoom` tinyint(1) UNSIGNED NOT NULL DEFAULT '12',
  `minmaxzoom` varchar(5) DEFAULT NULL,
  `layout` varchar(50) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `type_control` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `streetview` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `style` blob,
  `pin` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mod_gmaps`
--

INSERT INTO `mod_gmaps` VALUES(1, 'Head Office', 'gmaps/head-office', '43.650319', '-79.378860', '1 Adelaide St W, Toronto, ON M5H 1L6, Canada', 14, '1,20', 'muted-blue', 'roadmap', 0, 0, 0x5b0d0a202020207b0d0a2020202020202020226665617475726554797065223a2022616c6c222c0d0a2020202020202020227374796c657273223a205b0d0a2020202020202020202020207b0d0a202020202020202020202020202020202273617475726174696f6e223a20300d0a2020202020202020202020207d2c0d0a2020202020202020202020207b0d0a2020202020202020202020202020202022687565223a202223653765636630220d0a2020202020202020202020207d0d0a20202020202020205d0d0a202020207d2c0d0a202020207b0d0a2020202020202020226665617475726554797065223a2022726f6164222c0d0a2020202020202020227374796c657273223a205b0d0a2020202020202020202020207b0d0a202020202020202020202020202020202273617475726174696f6e223a202d37300d0a2020202020202020202020207d0d0a20202020202020205d0d0a202020207d2c0d0a202020207b0d0a2020202020202020226665617475726554797065223a20227472616e736974222c0d0a2020202020202020227374796c657273223a205b0d0a2020202020202020202020207b0d0a20202020202020202020202020202020227669736962696c697479223a20226f6666220d0a2020202020202020202020207d0d0a20202020202020205d0d0a202020207d2c0d0a202020207b0d0a2020202020202020226665617475726554797065223a2022706f69222c0d0a2020202020202020227374796c657273223a205b0d0a2020202020202020202020207b0d0a20202020202020202020202020202020227669736962696c697479223a20226f6666220d0a2020202020202020202020207d0d0a20202020202020205d0d0a202020207d2c0d0a202020207b0d0a2020202020202020226665617475726554797065223a20227761746572222c0d0a2020202020202020227374796c657273223a205b0d0a2020202020202020202020207b0d0a20202020202020202020202020202020227669736962696c697479223a202273696d706c6966696564220d0a2020202020202020202020207d2c0d0a2020202020202020202020207b0d0a202020202020202020202020202020202273617475726174696f6e223a202d36300d0a2020202020202020202020207d0d0a20202020202020205d0d0a202020207d0d0a5d, 'pin2.png');

-- --------------------------------------------------------

--
-- Table structure for table `mod_timeline`
--

DROP TABLE IF EXISTS `mod_timeline`;
CREATE TABLE IF NOT EXISTS `mod_timeline` (
  `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `plugin_id` varchar(25) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `limiter` tinyint(1) UNSIGNED NOT NULL DEFAULT '10',
  `showmore` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `maxitems` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `colmode` varchar(20) DEFAULT 'dual',
  `readmore` varchar(150) DEFAULT NULL,
  `rssurl` varchar(200) DEFAULT NULL,
  `fbid` varchar(150) DEFAULT NULL,
  `fbpage` varchar(150) DEFAULT NULL,
  `fbtoken` varchar(150) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mod_timeline`
--

INSERT INTO `mod_timeline` VALUES(1, 'Blog Timeline', 'timeline/blog', 'blog', 10, 0, 0, 'dual', NULL, '0', NULL, NULL, NULL, '2016-10-28 18:46:39');
INSERT INTO `mod_timeline` VALUES(2, 'Event Timeline', 'timeline/event', 'event', 16, 10, 5, 'dual', NULL, NULL, NULL, NULL, NULL, '2016-10-28 18:46:39');
INSERT INTO `mod_timeline` VALUES(3, 'Rss Timeline', 'timeline/rss', 'rss', 20, 0, 0, 'dual', NULL, 'http://www.thestar.com/feeds.topstories.rss', NULL, NULL, NULL, '2016-10-28 18:46:39');
INSERT INTO `mod_timeline` VALUES(4, 'Portfolio Timeline', 'timeline/portfolio', 'portfolio', 12, 0, 0, 'dual', NULL, NULL, NULL, NULL, NULL, '2016-10-28 18:46:39');
INSERT INTO `mod_timeline` VALUES(6, 'Custom Timeline', 'timeline/custom_timeline', 'custom', 30, 10, 10, 'dual', NULL, NULL, NULL, NULL, NULL, '2016-10-28 18:46:39');

-- --------------------------------------------------------

--
-- Table structure for table `mod_timeline_data`
--

DROP TABLE IF EXISTS `mod_timeline_data`;
CREATE TABLE IF NOT EXISTS `mod_timeline_data` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tid` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'timeline id',
  `type` varchar(30) DEFAULT NULL,
  `title_en` varchar(100) DEFAULT NULL,
  `body_en` text,
  `images` blob,
  `dataurl` varchar(250) DEFAULT NULL,
  `height` smallint(3) UNSIGNED NOT NULL DEFAULT '300',
  `readmore` varchar(200) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `tid` (`tid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mod_timeline_data`
--

INSERT INTO `mod_timeline_data` VALUES(5, 6, 'blog_post', 'HTML Support', '<div class="content-center"> <a><i class="twitter big circular inverted success icon link"></i></a> <a><i class="facebook big circular inverted info icon link"></i></a> <a><i class="google plus big circular inverted danger icon link"></i></a> <a><i class="pinterest big circular inverted warning icon link"></i></a> <a><i class="dribbble big circular inverted purple icon link"></i></a> </div>', NULL, NULL, 0, NULL, '2016-01-20 03:28:02');
INSERT INTO `mod_timeline_data` VALUES(6, 6, 'iframe', 'Google Maps', '', NULL, 'https://google.com/maps/embed?pb=!1m14!1m8!1m3!1d5774.551951139716!2d-79.38573735330591!3d43.64242624743821!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x882b34d68bf33a9b%3A0x15edd8c4de1c7581!2sCN+Tower!5e0!3m2!1sen!2sca!4v1422155824800', 300, '', '2016-01-18 16:30:00');
INSERT INTO `mod_timeline_data` VALUES(7, 6, 'iframe', 'Youtube Videos', NULL, NULL, '//youtube.com/embed/YvR8LGOUpNA', 300, NULL, '2016-01-18 04:26:23');
INSERT INTO `mod_timeline_data` VALUES(8, 6, 'blog_post', 'Image Slider', NULL, 0x5b2274696d656c696e655c2f67616c6c6572795f31312e6a7067222c2274696d656c696e655c2f67616c6c6572795f31322e6a7067222c2274696d656c696e655c2f67616c6c6572795f31332e6a7067222c2274696d656c696e655c2f67616c6c6572795f31342e6a7067222c2274696d656c696e655c2f67616c6c6572795f31352e6a7067222c2274696d656c696e655c2f67616c6c6572795f31362e6a7067225d, NULL, 300, NULL, '2016-01-25 04:29:15');
INSERT INTO `mod_timeline_data` VALUES(9, 6, 'gallery', 'Gallery Slider', '', 0x5b2274696d656c696e655c2f67616c6c6572795f31312e6a7067222c2274696d656c696e655c2f67616c6c6572795f31322e6a7067222c2274696d656c696e655c2f67616c6c6572795f31332e6a7067222c2274696d656c696e655c2f67616c6c6572795f31342e6a7067222c2274696d656c696e655c2f67616c6c6572795f31352e6a7067222c2274696d656c696e655c2f67616c6c6572795f31362e6a7067225d, NULL, 300, '', '2016-01-22 05:08:26');
INSERT INTO `mod_timeline_data` VALUES(10, 6, 'blog_post', 'Single Image Only', NULL, 0x5b2274696d656c696e652f64656d6f5f696d6167655f342e6a7067225d, NULL, 0, NULL, '2015-01-24 00:45:21');
INSERT INTO `mod_timeline_data` VALUES(11, 6, 'blog_post', 'Single Image With Text', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In sodales dapibus dui, sed iaculis metus facilisis sed. Curae; Pellentesque ullamcorper nisl id justo ultrices hendrerit', 0x5b2274696d656c696e652f64656d6f5f696d6167655f322e6a7067225d, NULL, 0, NULL, '2015-01-23 03:20:29');
INSERT INTO `mod_timeline_data` VALUES(12, 6, 'blog_post', 'Single Image With Read More', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In sodales dapibus dui, sed iaculis metus facilisis sed. Curae; Pellentesque ullamcorper nisl id justo ultrices hendrerit</p>', 0x5b2274696d656c696e652f64656d6f5f696d6167655f332e6a7067225d, NULL, 300, '//wojoscripts.com', '2015-01-20 16:30:00');
INSERT INTO `mod_timeline_data` VALUES(13, 6, 'blog_post', 'Text Only', 'Duis dapibus aliquam mi, eget euismod sem scelerisque ut. Vivamus at elit quis urna adipiscing iaculis. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas<br><br>Duis dapibus aliquam mi, eget euismod sem scelerisque ut. Vivamus at elit quis urna adipiscing iaculis. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas', NULL, NULL, 0, NULL, '2015-01-22 03:24:25');
INSERT INTO `mod_timeline_data` VALUES(14, 6, 'blog_post', 'HTML Support', '<div class="content-center"> <a><i class="twitter big circular inverted green icon link"></i></a> <a><i class="facebook big circular inverted blue icon link"></i></a> <a><i class="google plus big circular inverted red icon link"></i></a> <a><i class="pinterest big circular inverted orange icon link"></i></a> <a><i class="dribbble big circular inverted purple icon url alt link"></i></a> </div>', NULL, NULL, 0, NULL, '2015-01-20 03:28:02');
INSERT INTO `mod_timeline_data` VALUES(15, 6, 'iframe', 'Google Maps', NULL, NULL, 'https://google.com/maps/embed?pb=!1m14!1m8!1m3!1d5774.551951139716!2d-79.38573735330591!3d43.64242624743821!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x882b34d68bf33a9b%3A0x15edd8c4de1c7581!2sCN+Tower!5e0!3m2!1sen!2sca!4v1422155824800', 300, NULL, '2015-01-19 03:44:22');
INSERT INTO `mod_timeline_data` VALUES(16, 6, 'iframe', 'Youtube Videos', NULL, NULL, '//youtube.com/embed/YvR8LGOUpNA', 300, NULL, '2015-01-18 04:26:23');
INSERT INTO `mod_timeline_data` VALUES(17, 6, 'blog_post', 'Image Slider', '', 0x5b2274696d656c696e655c2f67616c6c6572795f31312e6a7067222c2274696d656c696e655c2f67616c6c6572795f31322e6a7067222c2274696d656c696e655c2f67616c6c6572795f31332e6a7067222c2274696d656c696e655c2f67616c6c6572795f31342e6a7067222c2274696d656c696e655c2f67616c6c6572795f31352e6a7067222c2274696d656c696e655c2f67616c6c6572795f31362e6a7067225d, NULL, 300, '', '2015-01-24 16:30:00');
INSERT INTO `mod_timeline_data` VALUES(18, 6, 'gallery', 'Gallery Slider', NULL, 0x5b2274696d656c696e655c2f67616c6c6572795f31312e6a7067222c2274696d656c696e655c2f67616c6c6572795f31322e6a7067222c2274696d656c696e655c2f67616c6c6572795f31332e6a7067222c2274696d656c696e655c2f67616c6c6572795f31342e6a7067222c2274696d656c696e655c2f67616c6c6572795f31352e6a7067222c2274696d656c696e655c2f67616c6c6572795f31362e6a7067225d, NULL, 300, NULL, '2015-01-22 05:08:26');
INSERT INTO `mod_timeline_data` VALUES(19, 6, 'blog_post', 'Single Image Only', NULL, 0x5b2274696d656c696e652f64656d6f5f696d6167655f342e6a7067225d, NULL, 0, NULL, '2014-01-24 00:45:21');
INSERT INTO `mod_timeline_data` VALUES(20, 6, 'blog_post', 'Single Image With Text', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In sodales dapibus dui, sed iaculis metus facilisis sed. Curae; Pellentesque ullamcorper nisl id justo ultrices hendrerit', 0x5b2274696d656c696e652f64656d6f5f696d6167655f322e6a7067225d, NULL, 0, NULL, '2014-01-23 03:20:29');
INSERT INTO `mod_timeline_data` VALUES(21, 6, 'blog_post', 'Single Image With Read More', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In sodales dapibus dui, sed iaculis metus facilisis sed. Curae; Pellentesque ullamcorper nisl id justo ultrices hendrerit', 0x5b2274696d656c696e652f64656d6f5f696d6167655f332e6a7067225d, NULL, 0, '//wojoscripts.com', '2014-01-21 03:25:30');
INSERT INTO `mod_timeline_data` VALUES(22, 6, 'blog_post', 'Text Only', 'Duis dapibus aliquam mi, eget euismod sem scelerisque ut. Vivamus at elit quis urna adipiscing iaculis. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas<br><br>Duis dapibus aliquam mi, eget euismod sem scelerisque ut. Vivamus at elit quis urna adipiscing iaculis. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas', NULL, NULL, 0, NULL, '2014-01-22 03:24:25');
INSERT INTO `mod_timeline_data` VALUES(23, 6, 'blog_post', 'HTML Support', '<div class="content-center"> <a><i class="twitter big circular inverted green icon link"></i></a> <a><i class="facebook big circular inverted blue icon link"></i></a> <a><i class="google plus big circular inverted red icon link"></i></a> <a><i class="pinterest big circular inverted orange icon link"></i></a> <a><i class="dribbble big circular inverted purple icon url alt link"></i></a> </div>', NULL, NULL, 0, NULL, '2014-01-20 03:28:02');
INSERT INTO `mod_timeline_data` VALUES(24, 6, 'iframe', 'Google Maps', NULL, NULL, 'https://google.com/maps/embed?pb=!1m14!1m8!1m3!1d5774.551951139716!2d-79.38573735330591!3d43.64242624743821!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x882b34d68bf33a9b%3A0x15edd8c4de1c7581!2sCN+Tower!5e0!3m2!1sen!2sca!4v1422155824800', 300, NULL, '2014-01-19 03:44:22');
INSERT INTO `mod_timeline_data` VALUES(25, 6, 'iframe', 'Youtube Videos', NULL, NULL, '//youtube.com/embed/YvR8LGOUpNA', 300, NULL, '2014-01-18 04:26:23');
INSERT INTO `mod_timeline_data` VALUES(26, 6, 'blog_post', 'Image Slider', NULL, 0x5b2274696d656c696e655c2f67616c6c6572795f31312e6a7067222c2274696d656c696e655c2f67616c6c6572795f31322e6a7067222c2274696d656c696e655c2f67616c6c6572795f31332e6a7067222c2274696d656c696e655c2f67616c6c6572795f31342e6a7067222c2274696d656c696e655c2f67616c6c6572795f31352e6a7067222c2274696d656c696e655c2f67616c6c6572795f31362e6a7067225d, NULL, 300, NULL, '2014-01-25 04:29:15');
INSERT INTO `mod_timeline_data` VALUES(27, 6, 'gallery', 'Gallery Slider', NULL, 0x5b2274696d656c696e655c2f67616c6c6572795f31312e6a7067222c2274696d656c696e655c2f67616c6c6572795f31322e6a7067222c2274696d656c696e655c2f67616c6c6572795f31332e6a7067222c2274696d656c696e655c2f67616c6c6572795f31342e6a7067222c2274696d656c696e655c2f67616c6c6572795f31352e6a7067222c2274696d656c696e655c2f67616c6c6572795f31362e6a7067225d, NULL, 300, NULL, '2014-01-22 05:08:26');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title_en` varchar(200) NOT NULL,
  `slug_en` varchar(150) DEFAULT NULL,
  `caption_en` varchar(150) DEFAULT NULL,
  `is_admin` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `page_type` enum('normal','home','contact','login','activate','account','register','search','sitemap','profile','policy') NOT NULL DEFAULT 'normal',
  `membership_id` varchar(20) NOT NULL DEFAULT '0',
  `is_comments` tinyint(1) NOT NULL DEFAULT '0',
  `custom_bg_en` varchar(100) DEFAULT NULL,
  `show_header` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `theme` varchar(60) DEFAULT NULL,
  `access` enum('Public','Registered','Membership') NOT NULL DEFAULT 'Public',
  `body_en` text,
  `jscode` text,
  `keywords_en` varchar(200) DEFAULT NULL,
  `description_en` text,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `created_by_name` varchar(80) DEFAULT NULL,
  `is_system` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `active` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `title_en`, `slug_en`, `caption_en`, `is_admin`, `page_type`, `membership_id`, `is_comments`, `custom_bg_en`, `show_header`, `theme`, `access`, `body_en`, `jscode`, `keywords_en`, `description_en`, `created`, `created_by`, `created_by_name`, `is_system`, `active`) VALUES(1, 'Welcome To Cms pro', 'home', '', 1, 'home', '0', 0, '', 1, NULL, 'Public', '<div class=\"section\">\n  <div class=\"row\">\n    <div class=\"columns\"> %%slider/master|plugin|3|5%% </div>\n  </div>\n</div>\n<div class=\"section\" style=\"padding:128px 0 32px 0\">\n  <div class=\"wojo-grid\">\n    <div class=\"row double-gutters align-middle\">\n      <div class=\"columns mobile-100 phone-100\">\n        <div data-weditable=\"true\">\n<h2 class=\"wojo primary text\">CMS Pro in <span class=\"wojo semi text\">frames</span>\n</h2>\n<p>Enhance your brand with easy-to-use powerful customization features.</p>\n<p class=\"margin-bottom\">The time has come to bring those ideas and plans to life. This is where we really begin to visualize your napkin sketches and make them into beautiful pixels.</p>\n<a href=\"#\" class=\"wojo small primary right button\" data-type=\"button\">Find out More <i class=\"icon chevron right\"></i></a>\n        </div>\n      </div>\n      <div class=\"columns relative mobile-100 phone-100\">\n        <div class=\"row half-gutters\">\n<div class=\"columns screen-40 tablet-40 mobile-50 phone-50 align-self-bottom\">\n  <a href=\"[SITEURL]/uploads/images/content_img4.jpg\" class=\"wojo basic rounded image lightbox\" data-gallery=\"images\">\n<img src=\"[SITEURL]/uploads/thumbs/content_img4.jpg\" data-weditable=\"true\">\n<span class=\"viewer\"><i class=\"icon plus\"></i></span>\n  </a>\n</div>\n<div class=\"columns screen-60 tablet-60 mobile-50 phone-50\">\n  <a href=\"[SITEURL]/uploads/images/content_img3.jpg\" class=\"wojo basic rounded image lightbox\" data-gallery=\"images\">\n<img src=\"[SITEURL]/uploads/thumbs/content_img3.jpg\" data-weditable=\"true\">\n<span class=\"viewer\"><i class=\"icon plus\"></i></span>\n  </a>\n</div>\n<div class=\"columns screen-offset-10 tablet-offset-10 screen-40 tablet-40 mobile-50 phone-50\">\n  <a href=\"[SITEURL]/uploads/images/content_img2.jpg\" class=\"wojo basic rounded image lightbox\" data-gallery=\"images\">\n<img src=\"[SITEURL]/uploads/thumbs/content_img2.jpg\" data-weditable=\"true\" class=\"\">\n<span class=\"viewer\"><i class=\"icon plus\"></i></span>\n  </a>\n</div>\n<div class=\"columns screen-50 tablet-50 mobile-50 phone-50\">\n  <a href=\"[SITEURL]/uploads/images/content_img1.jpg\" class=\"wojo basic rounded image lightbox\" data-gallery=\"images\">\n<img src=\"[SITEURL]/uploads/thumbs/content_img1.jpg\" data-weditable=\"true\">\n<span class=\"viewer\"><i class=\"icon plus\"></i></span>\n  </a>\n</div>\n        </div>\n        <div style=\"z-index:-1;position: absolute;top: 50%;-webkit-transform: translate(0, -50%);transform: translate(0, -50%);max-width: 100%\">\n<figure class=\"wojo basic image\">\n  <svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 1109.8 797.1\">\n<path fill=\"#377dff\" d=\"M105.1 267.1C35.5 331.5-3.5 423 .3 517.7 6.1 663 111 831.9 588.3 790.8c753-64.7 481.3-358.3 440.4-398.3-4-3.9-7.9-7.9-11.7-12L761.9 104.8C639.4-27.6 432.5-35.6 299.9 87L105.1 267.1z\" opacity=\".1\"></path>\n  </svg>\n</figure>\n        </div>\n      </div>\n    </div>\n  </div>\n</div>\n<div class=\"section relative\" style=\"padding:96px 0;background-color: #377dff;\">\n  <div class=\"wojo-grid\">\n    <div class=\"row align-center\">\n      <div class=\"columns screen-60 tablet-80 mobile-100 phone-100\">\n        <div class=\"content-center\" data-weditable=\"true\" style=\"position:relative;z-index:1\">\n<a class=\"wojo white large passive circular icon button\" data-type=\"button\">\n  <i class=\"icon big umbrella\"></i>\n</a>\n<h1 class=\"wojo white text half-top-margin\">Device <span class=\"wojo semi text\">friendly</span> features</h1>\n<p class=\"wojo white dimmed thin medium text\">Your website is fully responsive so visitors can view your content from their choice of device.</p>\n        </div>\n      </div>\n    </div>\n  </div>\n  <figure class=\"absolute\" style=\"top: 50%;-webkit-transform: translate(0, -50%);transform: translate(0, -50%);width:100%;z-index:0\">\n    <svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"803 -87.1 1653 222.1\">\n      <g fill=\"none\" stroke=\"#FFF\" stroke-miterlimit=\"10\" opacity=\".3\">\n        <path d=\"M803.5 113.1s1.3.4 3.8 1.2\"></path>\n        <path stroke-dasharray=\"7.9643,7.9643\" d=\"M815 116.3c31.8 8.4 125.8 28.7 233.9 11.3 74.3-12 150.4-23.1 219.4-55 51.4-23.8 93.7-64.1 147.1-84.2 24.2-9.1 49.4-15.5 74.7-20.5 65.8-12.9 137.3-16.7 205.9-8 67.6 8.6 125.9 33.9 179.7 52.6 335.2 116.6 538.6-59.1 574.2-93.5\"></path>\n        <path d=\"M2452.7-83.7c1.8-1.9 2.8-2.9 2.8-2.9\"></path>\n      </g>\n      <circle cx=\"2089.1\" cy=\"52\" r=\"7.9\" fill=\"none\" stroke=\"#FFF\" stroke-miterlimit=\"10\" stroke-opacity=\".15\" stroke-width=\"12\"></circle>\n      <circle cx=\"2089.1\" cy=\"52\" r=\"4.5\" fill=\"none\" stroke=\"#FFF\" stroke-miterlimit=\"10\" stroke-width=\"5\"></circle>\n      <circle cx=\"1400.1\" cy=\"-5\" r=\"7.9\" fill=\"none\" stroke=\"#FFF\" stroke-miterlimit=\"10\" stroke-opacity=\".15\" stroke-width=\"12\"></circle>\n      <circle cx=\"1400.1\" cy=\"-5\" r=\"4.5\" fill=\"none\" stroke=\"#FFF\" stroke-miterlimit=\"10\" stroke-width=\"5\"></circle>\n      <g fill=\"none\" stroke=\"#FFF\" stroke-miterlimit=\"10\">\n        <circle cx=\"1251.1\" cy=\"79\" r=\"7.9\" stroke-opacity=\".15\" stroke-width=\"12\"></circle>\n        <circle cx=\"1251.1\" cy=\"79\" r=\"4.5\" stroke-width=\"5\"></circle>\n      </g>\n    </svg>\n  </figure>\n</div>\n<div class=\"section\" style=\"padding:96px 0 32px 0\">\n  <div class=\"wojo-grid\">\n    <div class=\"row align-center\">\n      <div class=\"columns screen-50 tablet-80 phone-100 mobile-100 content-center\">\n        What we do?\n        <h3 class=\"wojo semi text\">Fast and easy design</h3>\n      </div>\n    </div>\n  </div>\n</div>\n<div class=\"section\" style=\"padding:32px 0\">\n  <div class=\"wojo-grid\">\n    <div class=\"row screen-block-2 tablet-block-2 mobile-block-1 phone-block-1 double-gutters\">\n      <div class=\"column\">\n        <div class=\"wojo basic icon message\" data-weditable=\"true\">\n<figure class=\"wojo basic small image margin-right\">\n  <img src=\"[SITEURL]/uploads/builder/icon9.svg\" alt=\"Email us\">\n</figure>\n<div class=\"content half-left-padding\">\n  <h5>Responsive</h5>\n  <p>CMS Pro is an incredibly beautiful, fully responsive, and mobile-first projects on the web.</p>\n  <a href=\"#\">Explore now <i class=\"icon middle chevron right\" data-type=\"icon\"></i></a>\n</div>\n        </div>\n      </div>\n      <div class=\"column\">\n        <div class=\"wojo basic icon message\" data-weditable=\"true\">\n<figure class=\"wojo basic small image margin-right\">\n  <img src=\"[SITEURL]/uploads/builder/icon3.svg\" alt=\"Email us\">\n</figure>\n<div class=\"content half-left-padding\">\n  <h5>Customizable</h5>\n  <p>CMS Pro can be easily customized with its cutting-edge components and features.</p>\n  <a href=\"#\">Explore now <i class=\"icon middle chevron right\" data-type=\"icon\"></i></a>\n</div>\n        </div>\n      </div>\n      <div class=\"column\">\n        <div class=\"wojo basic icon message\" data-weditable=\"true\">\n<figure class=\"wojo basic small image margin-right\">\n  <img src=\"[SITEURL]/uploads/builder/icon5.svg\" alt=\"Email us\">\n</figure>\n<div class=\"content half-left-padding\">\n  <h5>Premium</h5>\n  <p>We want to answer all of your queries. Get in touch and we\'ll get back to you as soon as we can.</p>\n  <a href=\"#\">Explore now <i class=\"icon middle chevron right\" data-type=\"icon\"></i></a>\n</div>\n        </div>\n      </div>\n      <div class=\"column\">\n        <div class=\"wojo basic icon message\" data-weditable=\"true\">\n<figure class=\"wojo basic small image margin-right\">\n  <img src=\"[SITEURL]/uploads/builder/icon2.svg\" alt=\"Email us\">\n</figure>\n<div class=\"content half-left-padding\">\n  <h5>Documentation </h5>\n  <p>Every component and plugin is well documented with live examples.</p>\n  <a href=\"#\">Explore now <i class=\"icon middle chevron right\" data-type=\"icon\"></i></a>\n</div>\n        </div>\n      </div>\n    </div>\n  </div>\n</div>\n<div class=\"section\" style=\"padding:32px 0\">\n  <div class=\"wojo-grid\">\n    <div class=\"row\">\n      <div class=\"columns screen-100 tablet-100 mobile-100 phone-100 content-center\">\n        <div data-weditable=\"true\">\n<span class=\"wojo positive label half-bottom-margin\">Our Team</span>\n<h2 class=\"wojo primary text\">Trust the <span class=\"wojo semi text\">professionals</span>\n</h2>\n<p>Our top professionals are ready to help with your business.</p>\n        </div>\n      </div>\n    </div>\n  </div>\n</div>\n<div class=\"section\" style=\"padding:32px 0 128px 0\">\n  <div class=\"wojo-grid\">\n    <div class=\"row\">\n      <div class=\"columns\"> %%carousel/team|plugin|3|36%% </div>\n    </div>\n  </div>\n</div>\n<div class=\"section\" style=\"padding:128px 0;background-color: #f8f9fa\">\n  <div class=\"wojo-grid\">\n    <div class=\"row double-vertical-gutters align-center\">\n      <div class=\"columns screen-60 tablet-80 mobile-100 phone-100 content-center\">\n        <div data-weditable=\"true\" class=\"\">\n<span class=\"wojo positive label half-bottom-margin\">news</span>\n<h2 class=\"wojo primary text\">Read our <span class=\"wojo semi text\">news &amp; blogs</span>\n</h2>\n<p>Our duty towards you is to share our experience we\'re reaching in our work path with you.</p>\n        </div>\n      </div>\n      <div class=\"columns screen-100 tablet-100 mobile-100 phone-100\"> %%blog/carousel|plugin|0|37%% </div>\n    </div>\n  </div>\n</div>', '\"\"', 'builder,mistaken,idea,denouncing,pleasure,praising,pain,give,complete,account,system,expound,actual,teachings,explorer,truth,master,human,happiness', 'Cms pro is a web content management system made for the peoples who don&#39;t have much technical knowledge of HTML or PHP but know how to use a simple notepad with computer keyboard', '2014-01-27 18:11:36', 1, 'Web Master', 1, 1);
INSERT INTO `pages` (`id`, `title_en`, `slug_en`, `caption_en`, `is_admin`, `page_type`, `membership_id`, `is_comments`, `custom_bg_en`, `show_header`, `theme`, `access`, `body_en`, `jscode`, `keywords_en`, `description_en`, `created`, `created_by`, `created_by_name`, `is_system`, `active`) VALUES(2, 'A few words about us', 'what-is-cms-pro', 'We are the only professional consulting firm backed by a business association.', 0, 'normal', '0', 0, '', 0, NULL, 'Public', '<div class=\"section\" style=\"background-color: #f8fafd;background-image: url([SITEURL]/uploads/builder/shapes_1_bg.svg);height:100vh;background-repeat: no-repeat;background-size: cover;background-position: top center;\">\n  <div class=\"wojo-grid\">\n    <div class=\"row gutters align-middle align-center\" style=\"min-height:100vh\">\n      <div class=\"columns screen-40 tablet-80 mobile-100 phone-100 content-center\">\n        <div data-weditable=\"true\">\n<h1 class=\"wojo primary semi huge text\">Make Cms Pro work for you</h1>\n<p class=\"wojo thin medium text margin-bottom\">Building brands people can\'t live without is how our clients grow.</p>\n<a href=\"#next_section\" data-scroll=\"true\" data-offset=\"140\" data-type=\"button\" class=\"wojo relaxed big rounded primary button\">Get Started</a>\n        </div>\n      </div>\n    </div>\n  </div>\n</div>\n<div id=\"next_section\" class=\"section\" style=\"padding:80px 0;\">\n  <div class=\"wojo-grid\">\n    <div class=\"row gutters\">\n      <div class=\"columns screen-40 tablet-50 mobile-100 phone-100\">\n        <div data-weditable=\"true\">\n<span class=\"wojo positive label half-bottom-margin\">Opportunity</span>\n<h2 class=\"wojo primary text\">Our core <span class=\"wojo demi text\">values</span></h2>\n<p class=\"margin-bottom\">At CMS Pro, we don\'t just accept difference—we celebrate it, we support it, and we thrive on it for the benefit of our employees, our products, and our community.</p>\n<div class=\"row horizontal-gutters\">\n  <div class=\"columns\">\n<div class=\"wojo relaxed flex list align-middle\">\n<div class=\"item\">\n  <div class=\"content shrink\"><span class=\"wojo small negative circular icon button\" data-type=\"button\"><i class=\"icon heart\"></i></span></div>\n  <div class=\"content half-left-padding\">Empathy</div>\n</div>\n<div class=\"item\">\n  <div class=\"content shrink\"><span class=\"wojo small primary circular icon button\" data-type=\"button\"><i class=\"icon smile\"></i></span></div>\n  <div class=\"content half-left-padding\">Courtesy</div>\n</div>\n<div class=\"item\">\n  <div class=\"content shrink\"><span class=\"wojo small positive circular icon button\" data-type=\"button\"><i class=\"icon maple leaf\"></i></span></div>\n  <div class=\"content half-left-padding\">Thriving</div>\n</div>\n</div>\n  </div>\n  <div class=\"columns\">\n<div class=\"wojo relaxed flex list align-middle\">\n<div class=\"item\">\n  <div class=\"content shrink\"><span class=\"wojo small negative circular icon button\" data-type=\"button\"><i data-type=\"icon\" class=\"icon feather\"></i></span></div>\n  <div class=\"content half-left-padding\">Craftsmanship</div>\n</div>\n<div class=\"item\">\n  <div class=\"content shrink\"><span class=\"wojo small primary circular icon button\" data-type=\"button\"><i class=\"icon tennis ball\"></i></span></div>\n  <div class=\"content half-left-padding\">Playfulness</div>\n</div>\n<div class=\"item\">\n  <div class=\"content shrink\"><span class=\"wojo small positive circular icon button\" data-type=\"button\"><i class=\"icon storage\"></i></span></div>\n  <div class=\"content half-left-padding\">Solidarity</div>\n</div>\n</div>\n  </div>\n</div>\n        </div>\n      </div>\n      <div class=\"columns screen-60 tablet-50 mobile-100 phone-100\">\n        <figure data-weditable=\"true\" class=\"relative\" style=\"background-image: url([SITEURL]/uploads/builder/shapes_6_bg.svg);background-repeat: no-repeat;background-size: auto;background-position: top center;padding:3em;\">\n<a href=\"http://vimeo.com/75976293\" data-wbox=\"video\" class=\"wojo huge white circular icon button centered lightbox\" data-type=\"button\">\n  <i class=\"icon medium play\"></i>\n</a>\n<img src=\"[SITEURL]/uploads/builder/office-people.jpg\" alt=\"In The Office\">\n        </figure>\n      </div>\n    </div>\n  </div>\n</div>\n<div class=\"section\" style=\"padding:0 32px 0 0;\">\n  <div class=\"wojo-grid\">\n    <div class=\"row\">\n      <div class=\"columns\">\n        <h2 class=\"wojo primary semi text content-center\">Our Greatful Clients</h2>\n      </div>\n    </div>\n  </div>\n</div>\n<div class=\"section\" style=\"padding: 100px 0px;\">\n  <div class=\"wojo-grid\">\n    <div class=\"row phone-block-1 mobile-block-1 tablet-block-2 screen-block-2 gutters\">\n      <div class=\"column\">\n        <div class=\"wojo basic icon message align-middle\">\n<div class=\"wojo basic image\"><img src=\"[SITEURL]/uploads/images/partner2.png\" alt=\"Frank\'s Co.\"></div>\n<div class=\"content\">\n  <div class=\"header\">Frank\'s Co.</div>\n  www.franksco.comp\n  <p>We are open and transparent about the work we do and how we do it.</p>\n</div>\n        </div>\n      </div>\n      <div class=\"column\">\n        <div class=\"wojo basic icon message align-middle\">\n<div class=\"wojo basic image\"><img src=\"[SITEURL]/uploads/images/partner3.png\" alt=\"Retro Beats\"></div>\n<div class=\"content\">\n  <div class=\"header\">Retro Beats</div>\n  www.retrobeats.comp\n  <p>We commit to achieving demonstrable impact for our stakeholders.</p>\n</div>\n        </div>\n      </div>\n      <div class=\"column\">\n        <div class=\"wojo basic icon message align-middle\">\n<div class=\"wojo basic image\"><img src=\"[SITEURL]/uploads/images/partner4.png\" alt=\"Tourner\"></div>\n<div class=\"content\">\n  <div class=\"header\">Tourner</div>\n  www.tourner.comp\n  <p>We are awed by human resilience, and believe in the ability of all people to thrive.</p>\n</div>\n        </div>\n      </div>\n      <div class=\"column\">\n        <div class=\"wojo basic icon message align-middle\">\n<div class=\"wojo basic image\"><img src=\"[SITEURL]/uploads/images/partner5.png\" alt=\"Retro Press\"></div>\n<div class=\"content\">\n  <div class=\"header\">Retro Press</div>\n  www.retropress.comp\n  <p>We believe that all people have the right to live in peaceful communities.</p>\n</div>\n        </div>\n      </div>\n    </div>\n  </div>\n</div>\n<div class=\"section\" style=\"background-color:#f8f9fa; padding: 64px 0 0 0;\">\n  <div class=\"wojo-grid\">\n    <div class=\"row double-gutters\">\n      <div class=\"columns screen-50 tablet-50 mobile-100 phone-100\">\n        <div data-weditable=\"true\">\n<h4 class=\"wojo primary text\">Progress Bars</h4>\n<p>Cool looking progress bars</p>\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor ua labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat</p>\n<div class=\"wojo teal mini progress\" data-percent=\"35\">\n  <div class=\"bar\"></div>\n  <div class=\"label\">35% Funded</div>\n</div>\n<div class=\"wojo violet mini progress\" data-percent=\"92\">\n  <div class=\"bar\"></div>\n  <div class=\"label\">32% Uploading</div>\n</div>\n<div class=\"wojo red mini progress\" data-percent=\"60\">\n  <div class=\"bar\"></div>\n  <div class=\"label\">60% Earned</div>\n</div>\n<div class=\"wojo yellow tiny progress\" data-percent=\"81\">\n  <div class=\"bar\"></div>\n  <div class=\"label\">81% To Go</div>\n</div>\n<div class=\"wojo green tiny progress\" data-percent=\"100\">\n  <div class=\"bar\"></div>\n  <div class=\"label\">100% Completed</div>\n</div>\n        </div>\n      </div>\n      <div class=\"columns screen-50 tablet-50 mobile-100 phone-100\">\n        <h4 class=\"wojo primary text\">Youtube Player</h4>\n        <p>Crete unlimited youtube players with built in CMS Pro yplayer plugin</p>\n        %%yplayer/vertical|plugin|2|19%%</div>\n    </div>\n  </div>\n</div>\n<div class=\"section relative\" style=\"background-color: #f8f9fa ;padding:32px 0 164px 0\">\n  <div class=\"wojo-grid\">\n    <div class=\"row gutters align-center\">\n      <div class=\"columns screen-40 tablet-60 mobile-100 phone-100\">\n        <div class=\"content-center\" data-weditable=\"true\">\n<div class=\"margin-bottom\">\n  <span class=\"wojo white icon passive circular button\" data-type=\"button\"><i class=\"icon big wojologo alt\"></i></span>\n</div>\n<div class=\"margin-bottom\">\n  <h2 class=\"wojo primary text\">\n<span class=\"wojo semi text\">Ready</span> to hire us? </h2>\n  <p>Cms Pro helps you managing your Enterprise identity.</p>\n</div>\n<a class=\"wojo primary inverted rounded wide button\" data-type=\"button\">Hire Our Team</a>\n        </div>\n      </div>\n    </div>\n  </div>\n  <figure class=\"absolute\" style=\"bottom:0;left:0;width:100%\">\n    <svg preserveAspectRatio=\"none\" xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 150 512 200\" width=\"100%\" height=\"200px\">\n      <path fill=\"#fff\" d=\"M38.6 264.9S111.8 196 188 236.5c131.9 70.3 193.4-3.9 250.3-9.5 83-8.1 121.8 34 121.8 34v107l-521.4.3V264.9z\" opacity=\".4\"></path>\n      <path fill=\"#fffefe\" d=\"M-72 267s70.2-69.7 146.3-29.1c131.9 70.3 193.4-3.9 250.3-9.5 83-8.1 119.4 32.4 119.4 32.4v108.8l-516 .4V267z\" opacity=\".4\"></path>\n      <path fill=\"#fff\" d=\"M-72 302s94.3-90.3 204-54.7c139.7 45.4 190 12.3 250.3-9.5C472.9 205.1 560 311 560 311v74H-72v-83z\"></path>\n    </svg>\n  </figure>\n</div>', NULL, '', '', '2014-01-28 18:11:36', 1, 'Web Master', 0, 1);
INSERT INTO `pages` (`id`, `title_en`, `slug_en`, `caption_en`, `is_admin`, `page_type`, `membership_id`, `is_comments`, `custom_bg_en`, `show_header`, `theme`, `access`, `body_en`, `jscode`, `keywords_en`, `description_en`, `created`, `created_by`, `created_by_name`, `is_system`, `active`) VALUES(3, 'Our Contact Info', 'our-contact-info', 'Got a question?', 1, 'normal', '0', 0, NULL, 1, NULL, 'Public', '<div class=\"section\" style=\"padding:60px 0\">\r\n  <div class=\"row half-gutters\">\r\n    <div class=\"columns screen-25 tablet-50 mobile-100 phone-100\">\r\n      <div class=\"content-center padding\" data-weditable=\"true\">\r\n        <figure class=\"wojo basic small image half-bottom-margin\">\r\n<img src=\"[SITEURL]/uploads/builder/icon8.svg\" alt=\"Address\">\r\n        </figure>\r\n        <h6>Address</h6>\r\n        <p class=\"wojo small text\">153 Toronto Plaza, 09514</p>\r\n      </div>\r\n    </div>\r\n    <div class=\"columns screen-25 tablet-50 mobile-100 phone-100 relative divider\">\r\n      <div class=\"content-center padding\" data-weditable=\"true\">\r\n        <figure class=\"wojo basic small image half-bottom-margin\">\r\n<img src=\"[SITEURL]/uploads/builder/icon15.svg\" alt=\"Email\">\r\n        </figure>\r\n        <h6>Email</h6>\r\n        <p class=\"wojo small text\">support@wojoscripts.com</p>\r\n      </div>\r\n    </div>\r\n    <div class=\"columns screen-25 tablet-50 mobile-100 phone-100 relative divider\">\r\n      <div class=\"content-center padding\" data-weditable=\"true\">\r\n        <figure class=\"wojo basic small image half-bottom-margin\">\r\n<img src=\"[SITEURL]/uploads/builder/icon16.svg\" alt=\"Phone Number\">\r\n        </figure>\r\n        <h6>Phone Number</h6>\r\n        <p class=\"wojo small text\">+1 (416) 109-9222</p>\r\n      </div>\r\n    </div>\r\n    <div class=\"columns screen-25 tablet-50 mobile-100 phone-100 relative divider\">\r\n      <div class=\"content-center padding\" data-weditable=\"true\">\r\n        <figure class=\"wojo basic small image half-bottom-margin\">\r\n<img src=\"[SITEURL]/uploads/builder/icon17.svg\" alt=\"Fax\">\r\n        </figure>\r\n        <h6>Fax</h6>\r\n        <p class=\"wojo small text\">+1 (416) 109-9223</p>\r\n      </div>\r\n    </div>\r\n  </div>\r\n</div>\r\n<div class=\"section\" style=\"padding:32px 0\">\r\n  <div class=\"wojo-grid\">\r\n    <div class=\"row align-center\">\r\n      <div class=\"columns screen-60 tablet-80 mobile-100 phone-100\"> %%contact|plugin|1|5%% </div>\r\n    </div>\r\n  </div>\r\n</div>\r\n<div class=\"section\" style=\"padding:64px 0 0 0\">\r\n  <div class=\"row gutters\">\r\n    <div class=\"columns\"> %%gmaps/head-office|plugin|1|20%% </div>\r\n  </div>\r\n</div>', '', '', '', '2010-07-23 12:11:55', 1, 'Web Master', 1, 1);
INSERT INTO `pages` (`id`, `title_en`, `slug_en`, `caption_en`, `is_admin`, `page_type`, `membership_id`, `is_comments`, `custom_bg_en`, `show_header`, `theme`, `access`, `body_en`, `jscode`, `keywords_en`, `description_en`, `created`, `created_by`, `created_by_name`, `is_system`, `active`) VALUES(5, 'Demo Gallery Page', 'demo-gallery-page', 'Responsive fluid gallery...', 0, 'normal', '0', 0, NULL, 1, NULL, 'Public', NULL, NULL, '', '', '2010-07-23 12:11:55', 1, 'Web Master', 0, 1);
INSERT INTO `pages` (`id`, `title_en`, `slug_en`, `caption_en`, `is_admin`, `page_type`, `membership_id`, `is_comments`, `custom_bg_en`, `show_header`, `theme`, `access`, `body_en`, `jscode`, `keywords_en`, `description_en`, `created`, `created_by`, `created_by_name`, `is_system`, `active`) VALUES(7, 'Middle Column', 'middle-column', 'Featuring middle column only layout', 0, 'normal', '0', 0, '', 0, NULL, 'Public', '<div class=\"section\">\r\n  <div class=\"row\">\r\n    <div class=\"columns\"> %%slider/master|plugin|1|8%% </div>\r\n  </div>\r\n</div>\r\n<div class=\"section\" style=\"padding:64px\">\r\n  <div class=\"wojo-grid\">\r\n    <div class=\"row align-center\">\r\n      <div class=\"columns screen-70 tablet-100 mobile-100 phone-100\">\r\n        <h2 class=\"wojo center aligned header\">Page Without Sidebar Centered</h2>\r\n        <p class=\"sub header\">- Built with CMS Pro /Pagebuilder/ -</p>\r\n        <div class=\"wojo space divider\"></div>\r\n        <p>Perhaps you are a new entrepreneur about to launch a business or innovation you have been dreaming about for years. Or maybe you have an established business and things are going well, or maybe even too well. In both instances you are going to need capital - the \'oxygen\' that every business needs to grow and prosper.</p>\r\n      </div>\r\n    </div>\r\n  </div>\r\n</div>\r\n<div class=\"section\" style=\"background-color: #f8f9fa;padding:128px 0 96px 0\">\r\n  <div class=\"wojo-grid\">\r\n    <div class=\"row gutters\">\r\n      <div class=\"columns mobile-50 phone-100\">\r\n        <div class=\"wojo photo basic card\" data-weditable=\"true\">\r\n<img class=\"wojo basic image\" src=\"[SITEURL]/uploads/builder/card-image-small-1.jpg\" alt=\"Image Description\">\r\n<div class=\"content\">\r\n  <small class=\"wojo secondary text\">March 20, 2018</small>\r\n  <h6>\r\n<a href=\"#\" class=\"black\">Remote workers, here\'s how to dodge distractions</a>\r\n  </h6>\r\n</div>\r\n        </div>\r\n      </div>\r\n      <div class=\"columns mobile-50 phone-100\">\r\n        <div class=\"wojo photo basic card\" data-weditable=\"true\">\r\n<img class=\"wojo basic image\" src=\"[SITEURL]/uploads/builder/card-image-small-2.jpg\" alt=\"Image Description\">\r\n<div class=\"content\">\r\n  <small class=\"wojo secondary text\">April 29, 2018</small>\r\n  <h6>\r\n<a href=\"#\" class=\"black\">How to make trust your competitive advantage</a>\r\n  </h6>\r\n</div>\r\n        </div>\r\n      </div>\r\n      <div class=\"columns mobile-50 phone-100\">\r\n        <div class=\"wojo photo basic card\" data-weditable=\"true\">\r\n<img class=\"wojo basic image\" src=\"[SITEURL]/uploads/builder/card-image-small-3.jpg\" alt=\"Image Description\">\r\n<div class=\"content\">\r\n  <small class=\"wojo secondary text\">March 20, 2018</small>\r\n  <h6>\r\n<a href=\"#\" class=\"black\">How to change careers or start a home-based business?</a>\r\n  </h6>\r\n</div>\r\n        </div>\r\n      </div>\r\n    </div>\r\n  </div>\r\n</div>\r\n<div class=\"section\" style=\"padding:64px\">\r\n  <div class=\"wojo-grid\">\r\n    <div class=\"row gutters\">\r\n      <div class=\"columns screen-40 tablet-50 mobile-100 phone-100\">\r\n        <h5>Bringing the culture to everyone.</h5>\r\n        <p>We know the power of sharing is real, and we want to create an opportunity for everyone to try CMS Pro and explore how transformative open communication can be. Now you can have a team of one or two designers and unlimited spectators (think PMs, management, marketing, etc.) share work and explore the design process earlier</p>\r\n        <p>Capital that is generated internally through positive cash flow from business operations (e.g., selling stuff), or from external funding sources. The new entrepreneur is limited to only one option - external funding <a href=\"#\">sources</a>.</p>\r\n      </div>\r\n      <div class=\"columns screen-60 tablet-50 mobile-100 phone-100\">\r\n        <h4>Latest Twitts</h4>\r\n        <p>- This plugin is included in CMS Pro core -</p>\r\n        %%twitts|plugin|0|15%% </div>\r\n    </div>\r\n  </div>\r\n</div>\r\n<div class=\"section relative\" style=\"background-image: linear-gradient(150deg, #2d1582 0%, #19a0ff 100%);padding:128px 0\">\r\n  <div class=\"wojo-grid\">\r\n    <div class=\"row align-middle\">\r\n      <div class=\"columns\">\r\n        <div class=\"wojo white text content-center\" data-weditable=\"true\">\r\n<h3 class=\"wojo semi warning text half-bottom-margin\">Ready to get started?</h3>\r\n<p class=\"wojo white medium thin text\">\r\n  <span class=\"wojo semi text\">CMS Pro</span> – the simplest and fastest way to build sites. </p>\r\n<a class=\"wojo white button\" href=\"#\" data-type=\"button\">Start Free Trial</a>\r\n        </div>\r\n      </div>\r\n    </div>\r\n  </div>\r\n  <figure class=\"absolute mobile-hide phone-hide\" style=\"top:0;left:0;max-width: 13rem;\">\r\n    <svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"168 -117.3 384.1 283.3\">\r\n      <circle cx=\"361.8\" cy=\"140.5\" r=\"14.4\" fill=\"none\" stroke=\"#00DFFC\" stroke-miterlimit=\"10\" stroke-width=\"3\"/>\r\n      <circle cx=\"370.8\" cy=\"102.7\" r=\"5.4\" fill=\"none\" stroke=\"#00DFFC\" stroke-miterlimit=\"10\" stroke-width=\"2\"/>\r\n      <path fill=\"#00DFFC\" d=\"M168 4.6v-121.9h205.9C398.5-80 354.3-43.4 325-26.4c-26.8 15.5-53.5 29.6-82.8 39.9-15.2 5.4-31.6 8.8-47.5 5.9-12.1-2.2-20.4-7.6-26.7-14.8z\"/>\r\n      <path fill=\"#FFC107\" d=\"M208.9-65.6c-13.7 24.7-22.3 55.9-14.8 83.9 7.5 28.2 36.2 56.4 66.7 40.8 35.1-18 43.6-64.2 82.1-79.3 24.1-9.4 45.7 1.1 63 18.9 11 11.4 19.3 25.2 26.5 39.4 16.5 32.6 49.9 60.7 86.9 35.6 53.3-36 28-118.9 17.8-169.5-1.4-7.1-2.9-14.3-4.3-21.5H227.4c.3 18.8-9.1 34.7-18.5 51.7z\"/>\r\n    </svg>\r\n  </figure>\r\n  <figure class=\"absolute mobile-hide phone-hide\" style=\"bottom:0;right:0;max-width: 13rem;\">\r\n    <svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 350 280\">\r\n      <path fill=\"#55C8E7\" d=\"M226.1 110.7c7.3 20.5 16.6 50.9 8 71.1-6.6 15.6-19 38.5-34.6 35.4-13.1-16.9-39.8-52.3-57-66.2-14.2-11.4-36-23.3-49.8-35.7C58.6 84.4 45.4 42.5 26.4.6 61 4.1 95.2 10.6 129 20.1c21.8 6.2 44.3 14.2 60.7 29.5 18.4 15.7 28.8 38.2 36.4 61.1z\"/>\r\n      <path fill=\"#FFF\" d=\"M28.5 2.4c40.3 19.3 77.3 44.3 109 75.3 34.4 34.1 57.5 74.1 83.2 114.1.4 1.2 2.7 0 1.6-1.2C178.2 107.9 116.1 38.1 28.5 1.2c0 .1-.8.5 0 1.2zm23.4 52.7c27.8-1.6 52-.4 76.2 14.9 1.6 1.2 3.1-1.6 1.6-2.7C108.3 53.2 77 44.5 51.6 53.2c-.8.7-.8 1.9.3 1.9zm43.4 46.2c13.3 0 26.2-.4 39.1 2.7 11.7 2.7 23.1 7 34.8 11.3 1.6.4 2-1.6.4-2.7-23.5-8.6-50.1-18.9-75-12.5.4.8.4 1.2.7 1.2zm51.6 41.2c9 .4 18.8 1.6 27.8 3.1 10.6 2 17.6 7.4 24.6 15.6 1.2 1.2 3.1-.4 2-2-6.3-7.4-12.9-12.9-23.1-15.6-10.2-2-21.1-2.7-31.7-2 0-.3 0 .9.4.9zM109 22.9c.4 10.2 5.9 20.4 9.8 29.8 2.7 5.9 4.7 16 12.5 17.2.4 0 1.2-.4.4-1.2-12.9-10.6-13.3-31.8-21.9-45.9 0-.7-.8-.7-.8.1zM150.8 35c2.7 27.9 11.3 55.3 21.1 81.2.4 1.2 2.7.4 2-.4C163.7 89.6 158.3 62.5 152 35c-.4-.4-1.2-.4-1.2 0zm45 58.9c0 23.6 5.9 47.8 9.8 71 .4 1.6 3.1 1.2 2.7-.4-4.3-23.6-7.4-46.6-11.3-70.6-.1-1.2-1.2-1.2-1.2 0z\"/>\r\n      <path fill=\"none\" stroke=\"#55C8E7\" stroke-miterlimit=\"10\" stroke-width=\"3\" d=\"M318.9 48.9c-.1-1.9-1-3.6-2.5-4.7-2.3-1.7-6.1-2.2-11.4 5.5-8.4 12.2-.5 11.7.6 11.6h.3l7.3-.5c3.5-.2 6.2-3.3 6-6.8l-.3-5.1z\"/>\r\n      <path fill=\"#FDC113\" d=\"M196 180.5c-11.3-15.7-29.2-24.9-48.6-24.7-50.2.5-69.3 46.9-76.2 89.9-1.8 11.5-3.1 23.3-4.6 34.9h146.2c-5.4-32.9 3.8-71.4-16.8-100.1z\"/>\r\n      <linearGradient id=\"a\" x1=\"2751.534\" x2=\"3158.839\" y1=\"757.064\" y2=\"757.064\" gradientTransform=\"rotate(142.902 1630.174 56.262)\" gradientUnits=\"userSpaceOnUse\">\r\n        <stop offset=\"0\" stop-color=\"#4f75ba\"/>\r\n        <stop offset=\"1\" stop-color=\"#332c7d\"/>\r\n      </linearGradient>\r\n      <path fill=\"url(#a)\" d=\"M348.8 257.6c0-.9.1-1.9.1-2.9 2.9-75.4-83.3-119.8-143.8-75.1-28.3 20.9-68.9 43.3-123 55-44.9 9.7-69.1 27.6-81.9 46h350c-1.3-7.1-1.9-14.7-1.4-23z\"/>\r\n    </svg>\r\n  </figure>\r\n</div>\r\n', '', '', 'Aliquam vitae metus non elit laoreet varius. Pellentesque et enim lorem. Suspendisse potenti. Nam ut iaculis lectus. Ut et leo odio. In euismod lobortis nisi, eu placerat nisi laoreet a.\nCras lobortis lobortis elit, at pellentesque erat vulputate ac. Phasellus in sapien non elit semper pellentesque ut a turpis. Quisque mollis auctor feugiat. Fusce a nisi diam, eu dapibus nibh.Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Etiam a justo libero, aliquam auctor felis. Nulla a odio ut magna ultrices vestibulum.\nInteger urna magna, euismod sed pharetra eget, ornare in dolor. Etiam bibendum mi ut nisi facilisis lobortis. Phasellus turpis orci, interdum adipiscing aliquam ut, convallis volutpat tellus. Nunc massa nunc, dapibus eget scelerisque ac, eleifend eget ligula. Maecenas accumsan tortor in quam adipiscing hendrerit. Donec ac risus nec est molestie malesuada ac id risus. In hac habitasse platea dictumst. In quam dui, blandit id interdum id, facilisis a leo.\nNullam fringilla quam pharetra enim interdum accumsan. Phasellus nec euismod quam. Donec tempor accumsan posuere. Phasellus ac metus orci, ac venenatis magna. Suspendisse sit amet odio at enim ultricies pellentesque eget ac risus. Vestibulum eleifend odio ut tellus faucibus malesuada feugiat nisi rhoncus. Proin nec sem ut augue placerat blandit ut ut orci. Cras aliquet venenatis enim, quis rutrum urna sollicitudin vel.', '2010-07-23 12:40:19', 1, 'Web Master', 0, 1);
INSERT INTO `pages` (`id`, `title_en`, `slug_en`, `caption_en`, `is_admin`, `page_type`, `membership_id`, `is_comments`, `custom_bg_en`, `show_header`, `theme`, `access`, `body_en`, `jscode`, `keywords_en`, `description_en`, `created`, `created_by`, `created_by_name`, `is_system`, `active`) VALUES(8, 'Right Sidebar', 'right-sidebar', 'Right sidebar demo page', 0, 'normal', '0', 0, '', 0, NULL, 'Public', '<div class=\"section\" style=\"padding:0;\">\r\n  <div class=\"row\">\r\n    <div class=\"columns screen-50 tablet-50 mobile-100 phone-100 relative wojo primary gradient\">\r\n      <div class=\"double-padding\">\r\n        <div class=\"row align-right\">\r\n<div class=\"columns screen-50 tablet-100 mobile-100 phone-100\">\r\n  <div data-weditable=\"true\">\r\n<h2 class=\"wojo white text\">Have a project?</h2>\r\n<p class=\"wojo white dimmed text\">Hire us. Our top professionals are ready to help with your business.</p>\r\n<a class=\"wojo wide white button\" data-type=\"button\" href=\"#\">Hire Us</a>\r\n  </div>\r\n</div>\r\n        </div>\r\n        <figure class=\"absolute phone-hide\" style=\"bottom:0;right:3em;width:250px;\">\r\n<img data-weditable=\"true\" src=\"[SITEURL]/uploads/builder/building-site.svg\" alt=\"Building Site\">\r\n        </figure>\r\n      </div>\r\n    </div>\r\n    <div class=\"screen-50 tablet-50 mobile-100 phone-100\" style=\"background-image: linear-gradient(25deg, #ffc107 30%, #de4437 100%);background-repeat: repeat-x;\">\r\n      <div class=\"row\">\r\n        <div class=\"columns relative screen-50 tablet-100 mobile-100 phone-100\">\r\n<div class=\"double-padding\">\r\n  <div data-weditable=\"true\">\r\n<h2 class=\"wojo white text\">Get in touch</h2>\r\n<p class=\"wojo white dimmed text\">If you would like to find out more about how we can help you, please give us a call or drop us an email..</p>\r\n<a class=\"wojo wide white button\" data-type=\"button\" href=\"#\">Contact Us</a>\r\n  </div>\r\n  <figure class=\"absolute phone-hide\" style=\"bottom:0;right:0;width:250px;\">\r\n<img data-weditable=\"true\" src=\"[SITEURL]/uploads/builder/pushing-boundaries.svg\" alt=\"Pushing Boundaries\">\r\n  </figure>\r\n</div>\r\n        </div>\r\n      </div>\r\n    </div>\r\n  </div>\r\n</div>\r\n<div class=\"section\" style=\"padding:96px 0\">\r\n  <div class=\"wojo-grid\">\r\n    <div class=\"row double-gutters\">\r\n      <div class=\"columns screen-70 tablet-60 mobile-100 phone-100\">\r\n        <h2 class=\"wojo primary text\">Page With Right Sidebar</h2>\r\n        <p>- Built with CMS Pro /Pagebuilder/ -</p>\r\n        <div class=\"wojo divider\"></div>\r\n        <p>Perhaps you are a new entrepreneur about to launch a business or innovation you have been dreaming about for years. Or maybe you have an established business and things are going well, or maybe even too well. In both instances you are going to need capital - the \'oxygen\' that every business needs to grow and prosper. </p>\r\n        <figure class=\"vertical-margin\" data-weditable=\"true\">\r\n<img alt=\"\" src=\"[SITEURL]/uploads/builder/analysis-illustration.svg\" class=\"wojo basic image\">\r\n        </figure>\r\n        <div class=\"content-center bottom-margin\"><small>We know how to help you</small></div>\r\n        <p>So now you are writing your first business plan or touching up the old one in anticipation of raising capital. Capital can only come into a business in one of two ways. Capital that is generated internally through positive cash flow from business operations (e.g., selling stuff), or from external funding sources. The new entrepreneur is limited to only one option - external funding sources. </p>\r\n        <div class=\"wojo divider\"></div>\r\n        <h4>Contact Us</h4>\r\n        <p>- Place contact plugin on any page -</p>\r\n        <div class=\"row gutters\">\r\n<div class=\"columns\">%%contact|plugin|1|0%% </div>\r\n        </div>\r\n      </div>\r\n      <div class=\"columns screen-30 tablet-40 mobile-100 phone-100\">\r\n        <div class=\"wojo plugin attached segment\" data-weditabe=\"true\">\r\n<a href=\"[SITEURL]/uploads/builder/in-the-office.svg\" class=\"lightbox\"><img alt=\"\" src=\"[SITEURL]/uploads/builder/in-the-office.svg\"></a>\r\n<div class=\"content-center vertical-margin\">\r\n  <p>Our business solutions are designed around the real needs of businesses, our information resources, tools and... </p>\r\n  <p><a class=\"wojo secondary button\" href=\"[SITEURL]/page/what-is-cms-pro/\">learn more</a>\r\n  </p>\r\n</div>\r\n        </div>\r\n        %%adblock/wojo-advert|plugin|1|21%%\r\n        %%blog/latest|plugin|0|27%% </div>\r\n    </div>\r\n  </div>\r\n</div>', '', '', '', '2010-08-10 14:06:58', 1, 'Web Master', 0, 1);
INSERT INTO `pages` (`id`, `title_en`, `slug_en`, `caption_en`, `is_admin`, `page_type`, `membership_id`, `is_comments`, `custom_bg_en`, `show_header`, `theme`, `access`, `body_en`, `jscode`, `keywords_en`, `description_en`, `created`, `created_by`, `created_by_name`, `is_system`, `active`) VALUES(9, 'Members Only', 'members-only', '', 0, 'normal', '0', 0, '', 1, NULL, 'Registered', '<div class=\"section\" style=\"padding:64px\">\r\n  <div class=\"wojo-grid\">\r\n    <div class=\"row align-center\">\r\n      <div class=\"columns screen-70 tablet-100 mobile-100 phone-100\">\r\n        <h2>Members Only Page</h2>\r\n        <p>- Limited  Access-</p>\r\n        <div class=\"wojo divider\"></div>\r\n        <p>Perhaps you are a new entrepreneur about to launch a business or innovation you have been dreaming about for years. Or maybe you have an established business and things are going well, or maybe even too well. In both instances you are going to need capital - the \'oxygen\' that every business needs to grow and prosper.</p>\r\n      </div>\r\n    </div>\r\n  </div>\r\n</div>', '', '', '', '2011-05-20 07:28:29', 1, 'Web Master', 0, 1);
INSERT INTO `pages` (`id`, `title_en`, `slug_en`, `caption_en`, `is_admin`, `page_type`, `membership_id`, `is_comments`, `custom_bg_en`, `show_header`, `theme`, `access`, `body_en`, `jscode`, `keywords_en`, `description_en`, `created`, `created_by`, `created_by_name`, `is_system`, `active`) VALUES(10, 'Membership Only', 'membership-only', '', 0, 'normal', '2,4', 0, '', 1, NULL, 'Membership', '<div class=\"section\" style=\"padding:64px\">\r\n  <div class=\"wojo-grid\">\r\n    <div class=\"row align-center\">\r\n      <div class=\"columns screen-70 tablet-100 mobile-100 phone-100\">\r\n        <h2>Members Only Page</h2>\r\n        <p>- Limited  Access-</p>\r\n        <div class=\"wojo divider\"></div>\r\n        <p>Perhaps you are a new entrepreneur about to launch a business or innovation you have been dreaming about for years. Or maybe you have an established business and things are going well, or maybe even too well. In both instances you are going to need capital - the \'oxygen\' that every business needs to grow and prosper.</p>\r\n      </div>\r\n    </div>\r\n  </div>\r\n</div>', '', '', '', '2011-05-20 07:28:48', 1, 'Web Master', 0, 1);
INSERT INTO `pages` (`id`, `title_en`, `slug_en`, `caption_en`, `is_admin`, `page_type`, `membership_id`, `is_comments`, `custom_bg_en`, `show_header`, `theme`, `access`, `body_en`, `jscode`, `keywords_en`, `description_en`, `created`, `created_by`, `created_by_name`, `is_system`, `active`) VALUES(11, 'Event Manager Demo', 'event-calendar-demo', '', 0, 'normal', '0', 0, NULL, 1, NULL, 'Public', '<div class=\"section\" style=\"padding:64px 0\"> \r\n<div class=\"wojo-grid\">\r\n  <div class=\"row gutters\">\r\n    <div class=\"columns\">\r\n       %%events|module|0|4%% \r\n    </div>\r\n  </div>\r\n</div>\r\n</div>\r\n', NULL, 'Event calendar', 'Event Manager', '2012-01-02 18:05:43', 1, 'Web Master', 0, 1);
INSERT INTO `pages` (`id`, `title_en`, `slug_en`, `caption_en`, `is_admin`, `page_type`, `membership_id`, `is_comments`, `custom_bg_en`, `show_header`, `theme`, `access`, `body_en`, `jscode`, `keywords_en`, `description_en`, `created`, `created_by`, `created_by_name`, `is_system`, `active`) VALUES(12, 'Page With Comments', 'page-with-comments', 'Comments Demo', 0, 'normal', '0', 1, '', 1, NULL, 'Public', '<div class=\"section\" style=\"padding:64px 0 32px 0\">\r\n  <div class=\"wojo-grid\">\r\n    <div class=\"row\">\r\n      <div class=\"columns\">\r\n        <h2>Page With Comments</h2>\r\n        <p>- Built with CMS Pro /Pagebuilder/ -</p>\r\n        <p>Perhaps you are a new entrepreneur about to launch a business or innovation you have been dreaming about for years. Or maybe you have an established business and things are going well, or maybe even too well. In both instances you are going to need capital - the \'oxygen\' that every business needs to grow and prosper.</p>\r\n        <p>So now you are writing your first business plan or touching up the old one in anticipation of raising capital. Capital can only come into a business in one of two ways. Capital that is generated internally through positive cash flow from business operations (e.g., selling stuff), or from external funding sources. The new entrepreneur is limited to only one option - external funding sources. </p>\r\n      </div>\r\n    </div>\r\n  </div>\r\n</div>\r\n<div class=\"section\" style=\"padding:32px 0 64px 0\">\r\n  <div class=\"wojo-grid\">\r\n    <div class=\"row gutters\">\r\n      <div class=\"columns\">\r\n        <figure data-weditable=\"true\"> \r\n        <img alt=\"\" src=\"[SITEURL]/uploads/images/demoimage2.jpg\" class=\"wojo basic rounded image\">\r\n        </figure>\r\n      </div>\r\n      <div class=\"columns\">\r\n        <figure data-weditable=\"true\"> \r\n        <img alt=\"\" src=\"[SITEURL]/uploads/images/demoimage2.jpg\" class=\"wojo basic rounded image\">\r\n        </figure>\r\n      </div>\r\n    </div>\r\n  </div>\r\n</div>', '', '', '', '2012-01-02 18:08:46', 1, 'Web Master', 0, 1);
INSERT INTO `pages` (`id`, `title_en`, `slug_en`, `caption_en`, `is_admin`, `page_type`, `membership_id`, `is_comments`, `custom_bg_en`, `show_header`, `theme`, `access`, `body_en`, `jscode`, `keywords_en`, `description_en`, `created`, `created_by`, `created_by_name`, `is_system`, `active`) VALUES(13, 'Left Sidebar', 'left-sidebar', 'Left sidebar demo page', 0, 'normal', '0', 0, '', 0, NULL, 'Public', '<div class=\"section\" style=\"background-image:url([SITEURL]/uploads/builder/header_1_bg.png);background-repeat: no-repeat;background-size: auto;background-position:center top;padding:160px 0\">\r\n  <div class=\"wojo-grid\">\r\n    <div class=\"row gutters align-center\">\r\n      <div class=\"columns screen-100 tablet-100 mobile-100 phone-100\">\r\n        <h1 class=\"wojo white huge text content-center\" data-weditable=\"true\">Say <span class=\"wojo semi text\">Hello </span> to all businesses</h1>\r\n      </div>\r\n      <div class=\"columns screen-50 tablet-100 mobile-100 phone-100\">\r\n        <p class=\"wojo white thin medium dimmed text content-center half-bottom-margin\" data-weditable=\"true\">Achieve virtually any look and layout from within the one template. Covert more visitors, and win more business with CMS pro.</p>\r\n      </div>\r\n    </div>\r\n    <div class=\"row gutters align-center\">\r\n      <div class=\"columns screen-40 tablet-100 mobile-100 phone-100\">\r\n       <form id=\"wojo_form_newsletter\" name=\"wojo_form_newsletter\" method=\"post\">\r\n        <div class=\"wojo fluid large right action input\">\r\n<input type=\"email\" name=\"email\" placeholder=\"Email\">\r\n<button type=\"button\" data-url=\"plugins_/newsletter\" data-hide=\"true\" data-action=\"processNewsletter\" name=\"dosubmit\" class=\"wojo simple icon button\"><i class=\"icon medium primary paper plane\"></i></button>\r\n        </div>\r\n         </form>\r\n      </div>\r\n    </div>\r\n  </div>\r\n</div>\r\n\r\n\r\n<div class=\"section\" style=\"padding:96px 0\">\r\n  <div class=\"wojo-grid\">\r\n    <div class=\"row double-gutters\">\r\n      <div class=\"columns screen-30 tablet-40 mobile-50 phone-100\">\r\n        <div class=\"wojo plugin attached segment\" data-weditabe=\"true\">\r\n<a href=\"[SITEURL]/uploads/images/services1.jpg\" class=\"lightbox\"><img alt=\"\" src=\"[SITEURL]/uploads/images/services1.jpg\"></a>\r\n<div class=\"content-center vertical-margin\">\r\n  <p>Our business solutions are designed around the real needs of businesses, our information resources, tools and... </p>\r\n  <p><a class=\"wojo secondary button\" href=\"[SITEURL]/page/what-is-cms-pro/\">learn more</a></p>\r\n</div>\r\n        </div>\r\n        %%upevent|plugin|0|16%%\r\n        %%adblock/wojo-advert|plugin|1|21%% </div>\r\n      <div class=\"columns screen-70 tablet-60 mobile-50 phone-100\">\r\n        <h2 class=\"wojo primary text\">Page With Left Sidebar</h2>\r\n        <p>- Built with CMS Pro /Pagebuilder/ -</p>\r\n        <div class=\"wojo divider\"></div>\r\n        <p>Perhaps you are a new entrepreneur about to launch a business or innovation you have been dreaming about for years. Or maybe you have an established business and things are going well, or maybe even too well. In both instances you are going to need capital - the \'oxygen\' that every business needs to grow and prosper.</p>\r\n        <figure class=\"vertical-margin\" data-weditable=\"true\">\r\n<svg xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" viewBox=\"0 0 614.8 747.7\">\r\n  <path class=\"wojo primary fill\" opacity=\".05\" d=\"M186.9,138.9C125.8,144.5,69.7,176,34.4,226c-54.3,76.8-67.1,204.7,193.8,371.7c411.5,263.5,387.9,6,382.7-30.6 c-0.5-3.6-0.9-7.2-1.3-10.7l-22.1-241.9C576.8,198.3,474,112.7,357.7,123.3L186.9,138.9z\"></path>\r\n  <g>\r\n<defs>\r\n<path id=\"a\" d=\"M168.6,729.7L168.6,729.7c135.8,53,290.2-14.8,343.2-150.6l85-217.9C649.8,225.4,582,71,446.2,18l0,0 C310.4-34.9,156,32.8,103,168.6L18,386.5C-34.9,522.3,32.8,676.7,168.6,729.7z\"></path>\r\n</defs>\r\n<clipPath id=\"b\">\r\n<use xlink:href=\"#a\" style=\"overflow:visible;\"></use>\r\n</clipPath>\r\n<g style=\"clip-path:url(#b);\">\r\n<!-- Apply your (615px width to 750px height) image here -->\r\n<image style=\"overflow:visible;\" width=\"100%\" height=\"100%\" xlink:href=\"[SITEURL]/uploads/builder/content_1.jpg\" transform=\"matrix(1 0 0 1 -0.1366 -0.9532)\"></image>\r\n</g>\r\n  </g>\r\n  <circle class=\"wojo negative fill\" cx=\"126.3\" cy=\"693.8\" r=\"16.3\"></circle>\r\n  <circle class=\"wojo positive fill\" cx=\"132.9\" cy=\"632.6\" r=\"10.6\"></circle>\r\n  <circle class=\"wojo primary fill\" cx=\"77\" cy=\"655.9\" r=\"21.6\"></circle>\r\n  <circle class=\"wojo warning fill\" cx=\"38.8\" cy=\"708.1\" r=\"3.9\"></circle>\r\n</svg>\r\n        </figure>\r\n        <div class=\"content-center bottom-margin\"><small>We know how to help you</small></div>\r\n        <p>So now you are writing your first business plan or touching up the old one in anticipation of raising capital. Capital can only come into a business in one of two ways. Capital that is generated internally through positive cash flow from business operations (e.g., selling stuff), or from external funding sources. The new entrepreneur is limited to only one option - external funding sources. </p>\r\n        <div class=\"wojo divider\"></div>\r\n        <h4>Poll &amp; Donations</h4>\r\n        <p>- Both of these plugins are included -</p>\r\n        <div class=\"row gutters\">\r\n<div class=\"columns tablet-100 mobile-100 phone-100\"> %%donation/paypal|plugin|1|13%% </div>\r\n<div class=\"columns tablet-100 mobile-100 phone-100\"> %%poll/install|plugin|1|3%% </div>\r\n        </div>\r\n        <h4>All Our Clients</h4>\r\n        <p>- Built with carousel plugin -</p>\r\n        <div class=\"row gutters\">\r\n<div class=\"columns\"> %%carousel/clients|plugin|2|26%% </div>\r\n        </div>\r\n      </div>\r\n    </div>\r\n  </div>\r\n</div>\r\n<div class=\"section\" style=\"background-color:#377dff;padding:48px 0\">\r\n  <div class=\"wojo-grid\">\r\n    <div class=\"row align-middle\">\r\n      <div class=\"columns\">\r\n        <div class=\"wojo white text content-center\" data-weditable=\"true\">\r\n<span class=\"wojo semi text\">CMS Pro</span>\r\n<span class=\"wojo thin text half-right-margin\">– the simplest and fastest way to build sites.</span>\r\n<a class=\"wojo white small button\" href=\"#\" data-type=\"button\">Start Enterprise Trial</a>\r\n        </div>\r\n      </div>\r\n    </div>\r\n  </div>\r\n</div>', '', 'testimonials,carousel,plugin', '\n\n\n\nCLIENTS &amp; TESTIMONIALS\n- Create unlimited carousels, with built in carousel plugin -\n\n%%carousel/testimonials|plugin|1|23%%\n\n\n', '2012-01-02 18:08:53', 1, 'Web Master', 0, 1);
INSERT INTO `pages` (`id`, `title_en`, `slug_en`, `caption_en`, `is_admin`, `page_type`, `membership_id`, `is_comments`, `custom_bg_en`, `show_header`, `theme`, `access`, `body_en`, `jscode`, `keywords_en`, `description_en`, `created`, `created_by`, `created_by_name`, `is_system`, `active`) VALUES(14, 'Video Slider', 'video-slider', NULL, 0, 'normal', '0', 0, NULL, 1, NULL, 'Public', NULL, NULL, '', '', '2012-01-02 18:09:08', 1, 'Web Master', 0, 1);
INSERT INTO `pages` (`id`, `title_en`, `slug_en`, `caption_en`, `is_admin`, `page_type`, `membership_id`, `is_comments`, `custom_bg_en`, `show_header`, `theme`, `access`, `body_en`, `jscode`, `keywords_en`, `description_en`, `created`, `created_by`, `created_by_name`, `is_system`, `active`) VALUES(15, 'Login Page', 'login', NULL, 1, 'login', '0', 0, NULL, 1, NULL, 'Public', NULL, NULL, '', '', '2014-04-27 14:11:36', 1, 'Web Master', 1, 1);
INSERT INTO `pages` (`id`, `title_en`, `slug_en`, `caption_en`, `is_admin`, `page_type`, `membership_id`, `is_comments`, `custom_bg_en`, `show_header`, `theme`, `access`, `body_en`, `jscode`, `keywords_en`, `description_en`, `created`, `created_by`, `created_by_name`, `is_system`, `active`) VALUES(16, 'User Registration', 'registration', NULL, 1, 'register', '0', 0, NULL, 1, NULL, 'Public', NULL, NULL, '', '', '2014-04-27 17:22:53', 1, 'Web Master', 1, 1);
INSERT INTO `pages` (`id`, `title_en`, `slug_en`, `caption_en`, `is_admin`, `page_type`, `membership_id`, `is_comments`, `custom_bg_en`, `show_header`, `theme`, `access`, `body_en`, `jscode`, `keywords_en`, `description_en`, `created`, `created_by`, `created_by_name`, `is_system`, `active`) VALUES(17, 'Account Acctivation', 'activate', '', 1, 'activate', '0', 0, NULL, 1, NULL, 'Public', NULL, NULL, '', '', '2014-04-28 05:08:29', 1, 'Web Master', 1, 1);
INSERT INTO `pages` (`id`, `title_en`, `slug_en`, `caption_en`, `is_admin`, `page_type`, `membership_id`, `is_comments`, `custom_bg_en`, `show_header`, `theme`, `access`, `body_en`, `jscode`, `keywords_en`, `description_en`, `created`, `created_by`, `created_by_name`, `is_system`, `active`) VALUES(18, 'User Dashboard', 'dashboard', NULL, 1, 'account', '0', 0, NULL, 1, NULL, 'Public', NULL, NULL, '', '', '2014-04-28 06:06:43', 1, 'Web Master', 1, 1);
INSERT INTO `pages` (`id`, `title_en`, `slug_en`, `caption_en`, `is_admin`, `page_type`, `membership_id`, `is_comments`, `custom_bg_en`, `show_header`, `theme`, `access`, `body_en`, `jscode`, `keywords_en`, `description_en`, `created`, `created_by`, `created_by_name`, `is_system`, `active`) VALUES(19, 'How can we help?', 'search', 'Search our site', 1, 'search', '0', 0, '', 1, NULL, 'Public', NULL, '', '', '', '2014-04-29 15:32:44', 1, 'Web Master', 1, 1);
INSERT INTO `pages` (`id`, `title_en`, `slug_en`, `caption_en`, `is_admin`, `page_type`, `membership_id`, `is_comments`, `custom_bg_en`, `show_header`, `theme`, `access`, `body_en`, `jscode`, `keywords_en`, `description_en`, `created`, `created_by`, `created_by_name`, `is_system`, `active`) VALUES(20, 'Sitemap', 'sitemap', NULL, 1, 'sitemap', '0', 0, NULL, 1, NULL, 'Public', NULL, NULL, '', '', '2014-05-08 09:00:53', 1, 'Web Master', 1, 1);
INSERT INTO `pages` (`id`, `title_en`, `slug_en`, `caption_en`, `is_admin`, `page_type`, `membership_id`, `is_comments`, `custom_bg_en`, `show_header`, `theme`, `access`, `body_en`, `jscode`, `keywords_en`, `description_en`, `created`, `created_by`, `created_by_name`, `is_system`, `active`) VALUES(21, 'Slider Manager', 'slider-manager', 'Responsive multiple sliders', 0, 'normal', '0', 0, NULL, 1, NULL, 'Public', NULL, NULL, '', '', '2014-05-27 09:02:13', 1, 'Web Master', 0, 1);
INSERT INTO `pages` (`id`, `title_en`, `slug_en`, `caption_en`, `is_admin`, `page_type`, `membership_id`, `is_comments`, `custom_bg_en`, `show_header`, `theme`, `access`, `body_en`, `jscode`, `keywords_en`, `description_en`, `created`, `created_by`, `created_by_name`, `is_system`, `active`) VALUES(22, 'Demo F.A.Q', 'demo-faq', 'Browse our help section', 0, 'normal', '0', 1, '', 0, NULL, 'Public', '<div class=\"section relative\" style=\"background-image: linear-gradient(150deg, #2d1582 0%, #19a0ff 100%);background-repeat: repeat-x;padding:100px 0\">\r\n  <div class=\"wojo-grid\">\r\n    <div class=\"row gutters align-middle\">\r\n      <div class=\"columns screen-40 tablet-50 mobile-100 phone-100\">\r\n        <div data-weditable=\"true\">\r\n<h1 class=\"wojo primary semi huge white text\"><span class=\"wojo warning text\">Improve</span>\r\n  &amp; boost your services</h1>\r\n<p class=\"wojo dimmed white text\">We provide all kinds of services and will help your audience grow through all platforms..</p>\r\n        </div>\r\n      </div>\r\n      <div class=\"columns screen-60 tablet-50 mobile-100 phone-100\">\r\n        <figure class=\"wojo basic big image\" data-weditable=\"true\"><img data-weditable=\"true\" src=\"[SITEURL]/uploads/builder/teamwork-concept-illustration.svg\" alt=\"teamwork concept\"></figure>\r\n      </div>\r\n    </div>\r\n  </div>\r\n  <figure class=\"absolute\" style=\"bottom:0\">\r\n    <svg xmlns=\"http://www.w3.org/2000/svg\" style=\"margin-bottom:-4px\" viewBox=\"0 0 1920 140\">\r\n      <path d=\"M960 92.9c-148.6.4-297.2-3.5-444.7-13.9-138.6-9.8-277.1-26.2-409-53.3C97.8 24 0 6.5 0 0v140l960-1.2 960 1.2V0c0 2.7-42.1 11.3-45.8 12.2-45.1 11-91.5 20.1-138.4 28.1-176.2 30.1-359.9 43.8-542.9 48.9-77.5 2.2-155.2 3.5-232.9 3.7z\" class=\"wojo white fill\"/>\r\n    </svg>\r\n  </figure>\r\n</div>\r\n\r\n<div class=\"section\" style=\"padding:40px 0;\">\r\n  <div class=\"wojo-grid\">\r\n    <div class=\"row double-gutters\">\r\n      <div class=\"columns screen-50 tablet-50 mobile-100 phone-100\">\r\n        <div class=\"double-padding content-center\" data-weditable=\"true\">\r\n<figure class=\"margin-bottom\">\r\n  <img src=\"[SITEURL]/uploads/builder/pushing-boundaries.svg\" alt=\"Pushing Boundaries\">\r\n</figure>\r\n<h4>Using CMS Pro</h4>\r\n<p>Find the answer to any question, from the basics all the way to advanced tips and tricks!</p>\r\n<a class=\"wojo primary button\" data-type=\"button\" href=\"http://ckb.wojoscripts.com\" target=\"_blank\">Browse all article</a>\r\n        </div>\r\n      </div>\r\n      <div class=\"columns screen-50 tablet-50 mobile-100 phone-100 relative divider\">\r\n        <div class=\"double-padding content-center\" data-weditable=\"true\">\r\n<figure class=\"margin-bottom\">\r\n  <img src=\"[SITEURL]/uploads/builder/building-site.svg\" alt=\"Building Site\">\r\n</figure>\r\n<h4>Workspace administration</h4>\r\n<p>Want to learn more about setting up and managing your team? Look no further!</p>\r\n<a class=\"wojo primary button\" data-type=\"button\" href=\"[SITEURL]/admin/\">Browse all article</a>\r\n        </div>\r\n      </div>\r\n    </div>\r\n  </div>\r\n</div>\r\n<section style=\"padding:0 0 64px 0\">\r\n  <div class=\"wojo-grid\">\r\n    <div class=\"row gutters\">\r\n      <div class=\"columns\"> %%faq|module|24|0%% </div>\r\n    </div>\r\n  </div>\r\n</section>\r\n<div class=\"section\" style=\"padding:60px 0\">\r\n  <div class=\"wojo-grid\">\r\n    <div class=\"row double-gutters\">\r\n      <div class=\"columns screen-50 tablet-50 mobile-100 phone-100\">\r\n        <div class=\"wojo basic icon message\" data-weditable=\"true\">\r\n<figure class=\"wojo basic small image margin-right\">\r\n  <img src=\"[SITEURL]/uploads/builder/icon15.svg\" alt=\"Email us\">\r\n</figure>\r\n<div class=\"content half-left-padding\">\r\n  <h5>Can\'t find your answer?</h5>\r\n  <p>We want to answer all of your queries. Get in touch and we\'ll get back to you as soon as we can.</p>\r\n  <a href=\"#\">Email us <i class=\"icon middle chevron right\"></i></a>\r\n</div>\r\n        </div>\r\n      </div>\r\n      <div class=\"columns screen-50 tablet-50 mobile-100 phone-100 relative divider\">\r\n        <div class=\"wojo basic icon message\" data-weditable=\"true\">\r\n<figure class=\"wojo basic small image margin-right\">\r\n  <img src=\"[SITEURL]/uploads/builder/icon4.svg\" alt=\"Have a question\">\r\n</figure>\r\n<div class=\"content half-left-padding\">\r\n  <h5>Technical questions</h5>\r\n  <p>Have some technical questions? Hit us on community page or just say hello..</p>\r\n  <a href=\"#\">Open ticket <i class=\"icon middle chevron right\"></i></a>\r\n</div>\r\n        </div>\r\n      </div>\r\n    </div>\r\n  </div>\r\n</div>', '', '', '', '2014-06-02 13:06:27', 1, 'Web Master', 0, 1);
INSERT INTO `pages` (`id`, `title_en`, `slug_en`, `caption_en`, `is_admin`, `page_type`, `membership_id`, `is_comments`, `custom_bg_en`, `show_header`, `theme`, `access`, `body_en`, `jscode`, `keywords_en`, `description_en`, `created`, `created_by`, `created_by_name`, `is_system`, `active`) VALUES(23, 'Profile', 'profile', 'Public User Profile', 0, 'profile', '0', 0, NULL, 1, NULL, 'Public', NULL, NULL, '', '', '2014-11-14 13:27:25', 1, 'Web Master', 1, 1);
INSERT INTO `pages` (`id`, `title_en`, `slug_en`, `caption_en`, `is_admin`, `page_type`, `membership_id`, `is_comments`, `custom_bg_en`, `show_header`, `theme`, `access`, `body_en`, `jscode`, `keywords_en`, `description_en`, `created`, `created_by`, `created_by_name`, `is_system`, `active`) VALUES(24, 'Timeline Blog Demo', 'timeline-blog-demo', 'Timeline demo and Blog Manager', 0, 'normal', '0', 0, NULL, 0, NULL, 'Public', '<div class=\"section relative\" style=\"background-color: #f8f9fa ;padding:64px 0 164px 0\">\r\n  <div class=\"wojo-grid\">\r\n    <div class=\"row gutters align-center\">\r\n      <div class=\"columns screen-40 tablet-60 mobile-100 phone-100\">\r\n        <div class=\"content-center\" data-weditable=\"true\">\r\n<h2 class=\"wojo primary text\">\r\n  <span class=\"wojo semi text\">Timeline demo</span> and Blog Manager </h2>\r\n<p>Create beautiful timeline in a matter of minutes.</p>\r\n        </div>\r\n      </div>\r\n    </div>\r\n  </div>\r\n  <figure class=\"absolute\" style=\"bottom:0;left:0;width:100%\">\r\n    <svg preserveAspectRatio=\"none\" xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 150 512 200\" width=\"100%\" height=\"200px\">\r\n      <path fill=\"#fff\" d=\"M38.6 264.9S111.8 196 188 236.5c131.9 70.3 193.4-3.9 250.3-9.5 83-8.1 121.8 34 121.8 34v107l-521.4.3V264.9z\" opacity=\".4\"/>\r\n      <path fill=\"#fffefe\" d=\"M-72 267s70.2-69.7 146.3-29.1c131.9 70.3 193.4-3.9 250.3-9.5 83-8.1 119.4 32.4 119.4 32.4v108.8l-516 .4V267z\" opacity=\".4\"/>\r\n      <path fill=\"#fff\" d=\"M-72 302s94.3-90.3 204-54.7c139.7 45.4 190 12.3 250.3-9.5C472.9 205.1 560 311 560 311v74H-72v-83z\"/>\r\n    </svg>\r\n  </figure>\r\n</div>\r\n<div class=\"section\" style=\"padding:0\">\r\n  <div class=\"wojo-grid\">\r\n    <div class=\"row gutters\">\r\n      <div class=\"columns\"> %%timeline/blog_timeline|module|18|1%% </div>\r\n    </div>\r\n  </div>\r\n</div>', NULL, '', '', '2015-01-20 19:43:27', 1, 'Web Master', 0, 1);
INSERT INTO `pages` (`id`, `title_en`, `slug_en`, `caption_en`, `is_admin`, `page_type`, `membership_id`, `is_comments`, `custom_bg_en`, `show_header`, `theme`, `access`, `body_en`, `jscode`, `keywords_en`, `description_en`, `created`, `created_by`, `created_by_name`, `is_system`, `active`) VALUES(25, 'Timeline Event Demo', 'timeline-event-demo', 'Timeline demo and Event Manager', 0, 'normal', '0', 0, NULL, 0, NULL, 'Public', '<div class=\"section relative\" style=\"background-color: #f8f9fa ;padding:64px 0 164px 0\">\r\n  <div class=\"wojo-grid\">\r\n    <div class=\"row gutters align-center\">\r\n      <div class=\"columns screen-40 tablet-60 mobile-100 phone-100\">\r\n        <div class=\"content-center\" data-weditable=\"true\">\r\n<h2 class=\"wojo primary text\">\r\n  <span class=\"wojo semi text\">Timeline demo</span> and Event Manager </h2>\r\n<p>This module is included in CMS pro base package.</p>\r\n        </div>\r\n      </div>\r\n    </div>\r\n  </div>\r\n  <figure class=\"absolute\" style=\"bottom:0;left:0;width:100%\">\r\n    <svg preserveAspectRatio=\"none\" xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 150 512 200\" width=\"100%\" height=\"200px\">\r\n      <path fill=\"#fff\" d=\"M38.6 264.9S111.8 196 188 236.5c131.9 70.3 193.4-3.9 250.3-9.5 83-8.1 121.8 34 121.8 34v107l-521.4.3V264.9z\" opacity=\".4\"/>\r\n      <path fill=\"#fffefe\" d=\"M-72 267s70.2-69.7 146.3-29.1c131.9 70.3 193.4-3.9 250.3-9.5 83-8.1 119.4 32.4 119.4 32.4v108.8l-516 .4V267z\" opacity=\".4\"/>\r\n      <path fill=\"#fff\" d=\"M-72 302s94.3-90.3 204-54.7c139.7 45.4 190 12.3 250.3-9.5C472.9 205.1 560 311 560 311v74H-72v-83z\"/>\r\n    </svg>\r\n  </figure>\r\n</div>\r\n<div class=\"section\";padding:0\">\r\n<div class=\"wojo-grid\">\r\n  <div class=\"row gutters\">\r\n    <div class=\"columns\"> %%timeline/custom_timeline|module|19|2%% </div>\r\n  </div>\r\n</div>\r\n</div>', NULL, '', '', '2015-01-22 20:16:40', 1, 'Web Master', 0, 1);
INSERT INTO `pages` (`id`, `title_en`, `slug_en`, `caption_en`, `is_admin`, `page_type`, `membership_id`, `is_comments`, `custom_bg_en`, `show_header`, `theme`, `access`, `body_en`, `jscode`, `keywords_en`, `description_en`, `created`, `created_by`, `created_by_name`, `is_system`, `active`) VALUES(27, 'Timeline Portfolio Demo', 'timeline-portfolio-demo', 'Timeline demo and Portfolio Module', 0, 'normal', '0', 0, NULL, 0, NULL, 'Public', '<div class=\"section relative\" style=\"background-color: #f8f9fa ;padding:64px 0 164px 0\">\r\n  <div class=\"wojo-grid\">\r\n    <div class=\"row gutters align-center\">\r\n      <div class=\"columns screen-40 tablet-60 mobile-100 phone-100\">\r\n        <div class=\"content-center\" data-weditable=\"true\">\r\n<h2 class=\"wojo primary text\">\r\n  <span class=\"wojo semi text\">Timeline demo</span> and Portfolio Module </h2>\r\n<p>Create beautiful timeline in a matter of minutes.</p>\r\n        </div>\r\n      </div>\r\n    </div>\r\n  </div>\r\n  <figure class=\"absolute\" style=\"bottom:0;left:0;width:100%\">\r\n    <svg preserveAspectRatio=\"none\" xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 150 512 200\" width=\"100%\" height=\"200px\">\r\n      <path fill=\"#fff\" d=\"M38.6 264.9S111.8 196 188 236.5c131.9 70.3 193.4-3.9 250.3-9.5 83-8.1 121.8 34 121.8 34v107l-521.4.3V264.9z\" opacity=\".4\"/>\r\n      <path fill=\"#fffefe\" d=\"M-72 267s70.2-69.7 146.3-29.1c131.9 70.3 193.4-3.9 250.3-9.5 83-8.1 119.4 32.4 119.4 32.4v108.8l-516 .4V267z\" opacity=\".4\"/>\r\n      <path fill=\"#fff\" d=\"M-72 302s94.3-90.3 204-54.7c139.7 45.4 190 12.3 250.3-9.5C472.9 205.1 560 311 560 311v74H-72v-83z\"/>\r\n    </svg>\r\n  </figure>\r\n</div>\r\n<div class=\"section\" style=\"padding:0\">\r\n  <div class=\"wojo-grid\">\r\n    <div class=\"row gutters\">\r\n      <div class=\"columns\"> %%timeline/portfolio_timeline|module|21|4%% </div>\r\n    </div>\r\n  </div>\r\n</div>\r\n', NULL, '', '', '2015-01-23 13:08:19', 1, 'Web Master', 0, 1);
INSERT INTO `pages` (`id`, `title_en`, `slug_en`, `caption_en`, `is_admin`, `page_type`, `membership_id`, `is_comments`, `custom_bg_en`, `show_header`, `theme`, `access`, `body_en`, `jscode`, `keywords_en`, `description_en`, `created`, `created_by`, `created_by_name`, `is_system`, `active`) VALUES(26, 'Timeline Rss Demo', 'timeline-rss-demo', 'Timeline demo and Rss Feed', 0, 'normal', '0', 0, NULL, 0, NULL, 'Public', '<div class=\"section relative\" style=\"background-color: #f8f9fa ;padding:64px 0 164px 0\">\r\n  <div class=\"wojo-grid\">\r\n    <div class=\"row gutters align-center\">\r\n      <div class=\"columns screen-40 tablet-60 mobile-100 phone-100\">\r\n        <div class=\"content-center\" data-weditable=\"true\">\r\n<h2 class=\"wojo primary text\">\r\n  <span class=\"wojo semi text\">Timeline demo</span> and custom RSS feed </h2>\r\n<p>This module is included in CMS pro base package.</p>\r\n        </div>\r\n      </div>\r\n    </div>\r\n  </div>\r\n  <figure class=\"absolute\" style=\"bottom:0;left:0;width:100%\">\r\n    <svg preserveAspectRatio=\"none\" xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 150 512 200\" width=\"100%\" height=\"200px\">\r\n      <path fill=\"#fff\" d=\"M38.6 264.9S111.8 196 188 236.5c131.9 70.3 193.4-3.9 250.3-9.5 83-8.1 121.8 34 121.8 34v107l-521.4.3V264.9z\" opacity=\".4\"/>\r\n      <path fill=\"#fffefe\" d=\"M-72 267s70.2-69.7 146.3-29.1c131.9 70.3 193.4-3.9 250.3-9.5 83-8.1 119.4 32.4 119.4 32.4v108.8l-516 .4V267z\" opacity=\".4\"/>\r\n      <path fill=\"#fff\" d=\"M-72 302s94.3-90.3 204-54.7c139.7 45.4 190 12.3 250.3-9.5C472.9 205.1 560 311 560 311v74H-72v-83z\"/>\r\n    </svg>\r\n  </figure>\r\n</div>\r\n<div class=\"section\" style=\"padding:0\">\r\n  <div class=\"wojo-grid\">\r\n    <div class=\"row gutters\">\r\n      <div class=\"columns\"> %%timeline/rss_timeline|module|20|3%% </div>\r\n    </div>\r\n  </div>\r\n</div>', NULL, '', '', '2015-01-22 12:31:30', 1, 'Web Master', 0, 1);
INSERT INTO `pages` (`id`, `title_en`, `slug_en`, `caption_en`, `is_admin`, `page_type`, `membership_id`, `is_comments`, `custom_bg_en`, `show_header`, `theme`, `access`, `body_en`, `jscode`, `keywords_en`, `description_en`, `created`, `created_by`, `created_by_name`, `is_system`, `active`) VALUES(29, 'Timeline Custom', 'timeline-custom-demo', 'Timeline demo custom', 0, 'normal', '0', 0, NULL, 0, NULL, 'Public', '<div class=\"section relative\" style=\"background-color: #f8f9fa ;padding:64px 0 164px 0\">\r\n  <div class=\"wojo-grid\">\r\n    <div class=\"row gutters align-center\">\r\n      <div class=\"columns screen-40 tablet-60 mobile-100 phone-100\">\r\n        <div class=\"content-center\" data-weditable=\"true\">\r\n<h2 class=\"wojo primary text\">\r\n  <span class=\"wojo semi text\">Timeline demo</span> and custom mixed content </h2>\r\n<p>This module is included in CMS pro base package.</p>\r\n        </div>\r\n      </div>\r\n    </div>\r\n  </div>\r\n  <figure class=\"absolute\" style=\"bottom:0;left:0;width:100%\">\r\n    <svg preserveAspectRatio=\"none\" xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 150 512 200\" width=\"100%\" height=\"200px\">\r\n      <path fill=\"#fff\" d=\"M38.6 264.9S111.8 196 188 236.5c131.9 70.3 193.4-3.9 250.3-9.5 83-8.1 121.8 34 121.8 34v107l-521.4.3V264.9z\" opacity=\".4\"/>\r\n      <path fill=\"#fffefe\" d=\"M-72 267s70.2-69.7 146.3-29.1c131.9 70.3 193.4-3.9 250.3-9.5 83-8.1 119.4 32.4 119.4 32.4v108.8l-516 .4V267z\" opacity=\".4\"/>\r\n      <path fill=\"#fff\" d=\"M-72 302s94.3-90.3 204-54.7c139.7 45.4 190 12.3 250.3-9.5C472.9 205.1 560 311 560 311v74H-72v-83z\"/>\r\n    </svg>\r\n  </figure>\r\n</div>\r\n<div class=\"section\" style=\"padding:0\">\r\n  <div class=\"wojo-grid\">\r\n    <div class=\"row gutters\">\r\n      <div class=\"columns\"> %%timeline/custom_timeline|module|23|6%% </div>\r\n    </div>\r\n  </div>\r\n</div>', NULL, '', '', '2015-01-23 14:35:50', 1, 'Web Master', 0, 1);
INSERT INTO `pages` (`id`, `title_en`, `slug_en`, `caption_en`, `is_admin`, `page_type`, `membership_id`, `is_comments`, `custom_bg_en`, `show_header`, `theme`, `access`, `body_en`, `jscode`, `keywords_en`, `description_en`, `created`, `created_by`, `created_by_name`, `is_system`, `active`) VALUES(31, 'Privacy Policy', 'privacy-policy', 'Privacy Policy', 1, 'policy', '0', 0, '', 0, NULL, 'Public', '<div class=\"section\" style=\"padding:64px 0\">\r\n    <div class=\"wojo-grid\">\r\n      <div class=\"row align-center\">\r\n        <div class=\"columns screen-70 tablet-100 mobile-100 phone-100\">\r\n<div class=\"wojo fitted card\">\r\n  <div class=\"header relative wojo primary gradient\">\r\n<div class=\"double-padding\">\r\n<h1 class=\"wojo white semi text\">Privacy &amp; Policy</h1>\r\n<p class=\"wojo white dimmed text padding-bottom\">Last modified: March 27, 2018</p>\r\n</div>\r\n<figure class=\"absolute\" style=\"bottom:0;left:0;width:100%;\">\r\n<svg preserveAspectRatio=\"none\" xmlns=\"http://www.w3.org/2000/svg\" width=\"100%\" height=\"140px\" style=\"margin-bottom:-32px\" viewBox=\"20 -20 300 100\"  xml:space=\"preserve\">\r\n  <path d=\"M30.913 43.944s42.911-34.464 87.51-14.191c77.31 35.14 113.304-1.952 146.638-4.729 48.654-4.056 69.94 16.218 69.94 16.218v54.396H30.913V43.944z\" class=\"wojo white fill\" opacity=\".4\"/>\r\n  <path d=\"M-35.667 44.628s42.91-34.463 87.51-14.191c77.31 35.141 113.304-1.952 146.639-4.729 48.653-4.055 69.939 16.218 69.939 16.218v54.396H-35.667V44.628z\" class=\"wojo white fill\" opacity=\".4\"/>\r\n  <path d=\"M-34.667 62.998s56-45.667 120.316-27.839C167.484 57.842 197 41.332 232.286 30.428c53.07-16.399 104.047 36.903 104.047 36.903l1.333 36.667-372-2.954-.333-38.046z\" class=\"wojo white fill\"/>\r\n</svg>\r\n</figure>\r\n  </div>\r\n  <div class=\"content\">\r\n<p>My Company (\"us\", \"we\", or \"our\") operates http://www.mysite.com  (the\r\n\"Site\"). This page informs you of our policies regarding the\r\ncollection, use and disclosure of Personal Information we receive from users of\r\nthe Site.</p>\r\n<p>We use your Personal Information only for providing and\r\nimproving the Site. By using the Site, you agree to the collection and use of\r\ninformation in accordance with this policy.<br>\r\n<br>\r\n</p>\r\n<p><b>Information\r\nCollection And Use</b></p>\r\n<p>While using our Site, we may ask you to provide us with\r\ncertain personally identifiable information that can be used to contact or\r\nidentify you. Personally identifiable information may include, but is not\r\nlimited to your name (\"Personal Information\").<br>\r\n<br>\r\n<br>\r\n</p>\r\n<p><b>Log Data</b></p>\r\n<p>Like many site operators, we collect information that your\r\nbrowser sends whenever you visit our Site (\"Log Data\").</p>\r\n<p>This Log Data may include information such as your\r\ncomputer\'s Internet Protocol (\"IP\") address, browser type, browser\r\nversion, the pages of our Site that you visit, the time and date of your visit,\r\nthe time spent on those pages and other statistics.</p>\r\n<p>In addition, we may use third party services such as Google\r\nAnalytics that collect, monitor and analyze this …<br>\r\n<br>\r\n<br>\r\n</p>\r\n<p><b>Communications</b></p>\r\n<p>We may use your Personal Information to contact you with\r\nnewsletters, marketing or promotional materials and other information that ...<br>\r\n<br>\r\n<br>\r\n</p>\r\n<p><b>Cookies</b></p>\r\n<p>Cookies are files with small amount of data, which may\r\ninclude an anonymous unique identifier. Cookies are sent to your browser from a\r\nweb site and stored on your computer\'s hard drive.</p>\r\n<p>Like many sites, we use \"cookies\" to collect\r\ninformation. You can instruct your browser to refuse all cookies or to indicate\r\nwhen a cookie is being sent. However, if you do not accept cookies, you may not\r\nbe able to use some portions of our Site.<br>\r\n<br>\r\n<br>\r\n</p>\r\n<p><b>Security</b></p>\r\n<p>The security of your Personal Information is important to\r\nus, but remember that no method of transmission over the Internet, or method of\r\nelectronic storage, is 100% secure. While we strive to use commercially\r\nacceptable means to protect your Personal Information, we cannot guarantee its\r\nabsolute security.<br>\r\n<br>\r\n<br>\r\n</p>\r\n<p><b>Changes To This\r\nPrivacy Policy</b></p>\r\n<p>This Privacy Policy is effective as of (October 20. 2017) and will remain in effect except\r\nwith respect to any changes in its provisions in the future, which will be in\r\neffect immediately after being posted on this page.</p>\r\n<p>We reserve the right to update or change our Privacy Policy\r\nat any time and you should check this Privacy Policy periodically. Your\r\ncontinued use of the Service after we post any modifications to the Privacy\r\nPolicy on this page will constitute your acknowledgment of the modifications\r\nand your consent to abide and be bound by the modified Privacy Policy.</p>\r\n<p>If we make any material changes to this Privacy Policy, we\r\nwill notify you either through the email address you have provided us, or by\r\nplacing a prominent notice on our website.<br>\r\n<br>\r\n<br>\r\n</p>\r\n<p><b>Contact Us</b></p>\r\n<p>If you have any questions about this Privacy Policy, please <a href=\"[SITEURL]/page/our-contact-info\">contact us.</a>\r\n</p>\r\n  </div>\r\n</div>\r\n        </div>\r\n      </div>\r\n    </div>\r\n  </div>', '\"\"', '', '', '2018-06-19 21:27:26', 1, 'Web Master', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
CREATE TABLE IF NOT EXISTS `payments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `txn_id` varchar(50) DEFAULT NULL,
  `membership_id` int(11) unsigned NOT NULL DEFAULT '0',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `rate_amount` decimal(12,2) unsigned NOT NULL DEFAULT '0.00',
  `tax` decimal(12,2) unsigned NOT NULL DEFAULT '0.00',
  `coupon` decimal(12,2) unsigned NOT NULL DEFAULT '0.00',
  `total` decimal(12,2) unsigned NOT NULL DEFAULT '0.00',
  `currency` varchar(4) DEFAULT NULL,
  `pp` varchar(20) NOT NULL DEFAULT 'Stripe',
  `ip` varbinary(16) DEFAULT '000.000.000.000',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_membership` (`membership_id`),
  KEY `idx_user` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
CREATE TABLE IF NOT EXISTS `plugins` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title_en` varchar(120) NOT NULL,
  `body_en` text,
  `jscode` text,
  `show_title` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `alt_class` varchar(30) DEFAULT NULL,
  `system` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `cplugin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `info_en` varchar(150) DEFAULT NULL,
  `plugalias` varchar(50) DEFAULT NULL,
  `hasconfig` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `multi` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `parent_id` int(11) unsigned NOT NULL DEFAULT '0',
  `plugin_id` int(11) unsigned NOT NULL DEFAULT '0',
  `groups` varchar(20) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `icon` varchar(60) DEFAULT NULL,
  `ver` decimal(4,2) NOT NULL DEFAULT '1.00',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_plugin_id` (`plugin_id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `plugins`
--

INSERT INTO `plugins` (`id`, `title_en`, `body_en`, `jscode`, `show_title`, `alt_class`, `system`, `cplugin`, `info_en`, `plugalias`, `hasconfig`, `multi`, `parent_id`, `plugin_id`, `groups`, `created`, `icon`, `ver`, `active`) VALUES(1, 'Universal Slider', NULL, NULL, 0, NULL, 1, 0, NULL, 'slider', 1, 1, 0, 0, 'slider', '2016-06-18 02:28:53', 'slider/thumb.svg', '1.00', 1);
INSERT INTO `plugins` (`id`, `title_en`, `body_en`, `jscode`, `show_title`, `alt_class`, `system`, `cplugin`, `info_en`, `plugalias`, `hasconfig`, `multi`, `parent_id`, `plugin_id`, `groups`, `created`, `icon`, `ver`, `active`) VALUES(2, 'Ajax Poll', NULL, NULL, 0, NULL, 1, 1, NULL, 'poll', 1, 1, 0, 0, 'poll', '2016-06-18 02:30:15', 'poll/thumb.svg', '1.00', 1);
INSERT INTO `plugins` (`id`, `title_en`, `body_en`, `jscode`, `show_title`, `alt_class`, `system`, `cplugin`, `info_en`, `plugalias`, `hasconfig`, `multi`, `parent_id`, `plugin_id`, `groups`, `created`, `icon`, `ver`, `active`) VALUES(3, 'How do you find CMS pro! Installation?', NULL, NULL, 0, 'primary', 1, 1, NULL, 'poll/install', 0, 0, 2, 1, 'poll', '2016-06-18 02:31:45', 'poll/thumb.svg', '1.00', 1);
INSERT INTO `plugins` (`id`, `title_en`, `body_en`, `jscode`, `show_title`, `alt_class`, `system`, `cplugin`, `info_en`, `plugalias`, `hasconfig`, `multi`, `parent_id`, `plugin_id`, `groups`, `created`, `icon`, `ver`, `active`) VALUES(4, 'What is the best CMS?', NULL, NULL, 0, NULL, 1, 0, NULL, 'poll/cms', 0, 0, 2, 2, 'poll', '2016-06-18 02:36:05', 'poll/thumb.svg', '1.00', 1);
INSERT INTO `plugins` (`id`, `title_en`, `body_en`, `jscode`, `show_title`, `alt_class`, `system`, `cplugin`, `info_en`, `plugalias`, `hasconfig`, `multi`, `parent_id`, `plugin_id`, `groups`, `created`, `icon`, `ver`, `active`) VALUES(5, 'Image Slider', NULL, NULL, 0, NULL, 1, 1, NULL, 'slider/master', 0, 0, 1, 1, 'slider', '2016-06-18 02:36:35', 'slider/thumb.svg', '1.00', 1);
INSERT INTO `plugins` (`id`, `title_en`, `body_en`, `jscode`, `show_title`, `alt_class`, `system`, `cplugin`, `info_en`, `plugalias`, `hasconfig`, `multi`, `parent_id`, `plugin_id`, `groups`, `created`, `icon`, `ver`, `active`) VALUES(6, 'Carousel Slider', NULL, NULL, 0, NULL, 1, 1, NULL, 'slider', 0, 0, 1, 2, 'slider', '2016-06-18 02:36:56', 'slider/thumb.svg', '1.00', 1);
INSERT INTO `plugins` (`id`, `title_en`, `body_en`, `jscode`, `show_title`, `alt_class`, `system`, `cplugin`, `info_en`, `plugalias`, `hasconfig`, `multi`, `parent_id`, `plugin_id`, `groups`, `created`, `icon`, `ver`, `active`) VALUES(7, 'Content Slider', NULL, NULL, 0, NULL, 1, 1, NULL, 'slider/demo', 0, 0, 1, 3, 'slider', '2016-06-18 02:37:15', 'slider/thumb.svg', '1.00', 1);
INSERT INTO `plugins` (`id`, `title_en`, `body_en`, `jscode`, `show_title`, `alt_class`, `system`, `cplugin`, `info_en`, `plugalias`, `hasconfig`, `multi`, `parent_id`, `plugin_id`, `groups`, `created`, `icon`, `ver`, `active`) VALUES(8, 'Sync Slider', NULL, NULL, 0, NULL, 1, 1, NULL, 'slider', 0, 0, 1, 4, 'slider', '2016-06-18 03:47:50', 'slider/thumb.svg', '1.00', 1);
INSERT INTO `plugins` (`id`, `title_en`, `body_en`, `jscode`, `show_title`, `alt_class`, `system`, `cplugin`, `info_en`, `plugalias`, `hasconfig`, `multi`, `parent_id`, `plugin_id`, `groups`, `created`, `icon`, `ver`, `active`) VALUES(9, 'Rss Feed', NULL, NULL, 0, NULL, 1, 1, NULL, 'rss', 1, 1, 0, 0, 'rss', '2016-09-30 12:58:22', 'rss/thumb.svg', '1.00', 1);
INSERT INTO `plugins` (`id`, `title_en`, `body_en`, `jscode`, `show_title`, `alt_class`, `system`, `cplugin`, `info_en`, `plugalias`, `hasconfig`, `multi`, `parent_id`, `plugin_id`, `groups`, `created`, `icon`, `ver`, `active`) VALUES(10, 'CTV Top Stories', NULL, NULL, 0, NULL, 1, 0, NULL, 'rss/ctv', 0, 0, 9, 1, 'rss', '2016-10-01 03:44:52', 'rss/thumb.svg', '1.00', 1);
INSERT INTO `plugins` (`id`, `title_en`, `body_en`, `jscode`, `show_title`, `alt_class`, `system`, `cplugin`, `info_en`, `plugalias`, `hasconfig`, `multi`, `parent_id`, `plugin_id`, `groups`, `created`, `icon`, `ver`, `active`) VALUES(11, 'Yahoo Feed', NULL, NULL, 0, NULL, 1, 0, NULL, 'rss/yahoo', 0, 0, 9, 2, 'rss', '2016-10-01 03:46:22', 'rss/thumb.svg', '1.00', 1);
INSERT INTO `plugins` (`id`, `title_en`, `body_en`, `jscode`, `show_title`, `alt_class`, `system`, `cplugin`, `info_en`, `plugalias`, `hasconfig`, `multi`, `parent_id`, `plugin_id`, `groups`, `created`, `icon`, `ver`, `active`) VALUES(12, 'Donate', NULL, NULL, 0, NULL, 1, 1, NULL, 'donation', 1, 1, 0, 0, 'donation', '2016-10-02 05:14:27', 'donation/thumb.svg', '1.00', 1);
INSERT INTO `plugins` (`id`, `title_en`, `body_en`, `jscode`, `show_title`, `alt_class`, `system`, `cplugin`, `info_en`, `plugalias`, `hasconfig`, `multi`, `parent_id`, `plugin_id`, `groups`, `created`, `icon`, `ver`, `active`) VALUES(13, 'Paypal Donations', 'Help us raise $150 with a matching gift opportunity.', NULL, 1, NULL, 1, 0, NULL, 'donation/paypal', 0, 0, 12, 1, 'donation', '2016-10-02 07:20:02', 'donation/thumb.svg', '1.00', 1);
INSERT INTO `plugins` (`id`, `title_en`, `body_en`, `jscode`, `show_title`, `alt_class`, `system`, `cplugin`, `info_en`, `plugalias`, `hasconfig`, `multi`, `parent_id`, `plugin_id`, `groups`, `created`, `icon`, `ver`, `active`) VALUES(14, 'Paypal Donations II', NULL, NULL, 0, NULL, 1, 0, NULL, 'donation/paypal_alt', 0, 0, 12, 2, 'donation', '2016-10-02 07:20:46', 'donation/thumb.svg', '1.00', 1);
INSERT INTO `plugins` (`id`, `title_en`, `body_en`, `jscode`, `show_title`, `alt_class`, `system`, `cplugin`, `info_en`, `plugalias`, `hasconfig`, `multi`, `parent_id`, `plugin_id`, `groups`, `created`, `icon`, `ver`, `active`) VALUES(15, 'Latest Twitts', NULL, NULL, 0, NULL, 1, 1, NULL, 'twitts', 1, 0, 0, 0, 'twitts', '2016-10-02 14:31:04', 'twitts/thumb.svg', '1.00', 1);
INSERT INTO `plugins` (`id`, `title_en`, `body_en`, `jscode`, `show_title`, `alt_class`, `system`, `cplugin`, `info_en`, `plugalias`, `hasconfig`, `multi`, `parent_id`, `plugin_id`, `groups`, `created`, `icon`, `ver`, `active`) VALUES(16, 'Upcoming Events', NULL, NULL, 1, NULL, 1, 1, NULL, 'upevent', 1, 0, 0, 0, 'upevent', '2016-10-18 11:30:27', 'upevent/thumb.svg', '1.00', 1);
INSERT INTO `plugins` (`id`, `title_en`, `body_en`, `jscode`, `show_title`, `alt_class`, `system`, `cplugin`, `info_en`, `plugalias`, `hasconfig`, `multi`, `parent_id`, `plugin_id`, `groups`, `created`, `icon`, `ver`, `active`) VALUES(17, 'Youtube Player', NULL, NULL, 0, NULL, 1, 0, NULL, 'yplayer', 1, 1, 0, 0, 'yplayer', '2016-10-19 09:53:43', 'yplayer/thumb.svg', '1.00', 1);
INSERT INTO `plugins` (`id`, `title_en`, `body_en`, `jscode`, `show_title`, `alt_class`, `system`, `cplugin`, `info_en`, `plugalias`, `hasconfig`, `multi`, `parent_id`, `plugin_id`, `groups`, `created`, `icon`, `ver`, `active`) VALUES(18, 'Horizontal Player', NULL, NULL, 0, NULL, 1, 1, NULL, 'yplayer/horizontal', 0, 0, 17, 1, 'yplayer', '2016-10-19 16:14:25', 'yplayer/thumb.svg', '1.00', 1);
INSERT INTO `plugins` (`id`, `title_en`, `body_en`, `jscode`, `show_title`, `alt_class`, `system`, `cplugin`, `info_en`, `plugalias`, `hasconfig`, `multi`, `parent_id`, `plugin_id`, `groups`, `created`, `icon`, `ver`, `active`) VALUES(19, 'Vertical Player', NULL, NULL, 0, NULL, 1, 1, NULL, 'yplayer/vertical', 0, 0, 17, 2, 'yplayer', '2016-10-19 16:17:27', 'yplayer/thumb.svg', '1.00', 1);
INSERT INTO `plugins` (`id`, `title_en`, `body_en`, `jscode`, `show_title`, `alt_class`, `system`, `cplugin`, `info_en`, `plugalias`, `hasconfig`, `multi`, `parent_id`, `plugin_id`, `groups`, `created`, `icon`, `ver`, `active`) VALUES(20, 'Head Office', NULL, NULL, 0, NULL, 1, 1, NULL, 'gmaps/head-office', 0, 0, 0, 1, 'gmaps', '2016-11-22 11:22:56', 'gmaps/thumb.svg', '1.00', 1);
INSERT INTO `plugins` (`id`, `title_en`, `body_en`, `jscode`, `show_title`, `alt_class`, `system`, `cplugin`, `info_en`, `plugalias`, `hasconfig`, `multi`, `parent_id`, `plugin_id`, `groups`, `created`, `icon`, `ver`, `active`) VALUES(21, 'Default Campaign', NULL, '', 0, '', 1, 1, '', 'adblock/wojo-advert', 0, 0, 0, 1, 'adblock', '2016-12-30 14:02:28', 'adblock/thumb.svg', '1.00', 1);
INSERT INTO `plugins` (`id`, `title_en`, `body_en`, `jscode`, `show_title`, `alt_class`, `system`, `cplugin`, `info_en`, `plugalias`, `hasconfig`, `multi`, `parent_id`, `plugin_id`, `groups`, `created`, `icon`, `ver`, `active`) VALUES(22, 'Universal Carousel', NULL, NULL, 0, NULL, 1, 0, NULL, 'carousel', 1, 1, 0, 0, 'carousel', '2017-01-11 11:19:47', 'carousel/thumb.svg', '1.00', 1);
INSERT INTO `plugins` (`id`, `title_en`, `body_en`, `jscode`, `show_title`, `alt_class`, `system`, `cplugin`, `info_en`, `plugalias`, `hasconfig`, `multi`, `parent_id`, `plugin_id`, `groups`, `created`, `icon`, `ver`, `active`) VALUES(23, 'Testimonials', NULL, NULL, 0, NULL, 1, 1, NULL, 'carousel/testimonials', 0, 0, 22, 1, 'carousel', '2017-01-11 12:55:40', 'carousel/thumb.svg', '1.00', 1);
INSERT INTO `plugins` (`id`, `title_en`, `body_en`, `jscode`, `show_title`, `alt_class`, `system`, `cplugin`, `info_en`, `plugalias`, `hasconfig`, `multi`, `parent_id`, `plugin_id`, `groups`, `created`, `icon`, `ver`, `active`) VALUES(24, 'Testimonial', '<div class=\"relative\" style=\"background-image: linear-gradient(150deg, #2d1582 0%, #19a0ff 100%);background-repeat: repeat-x; padding:8rem 0\">\r\n  <div class=\"wojo-grid\">\r\n    <div class=\"row align-center\">\r\n      <div class=\"columns content-center screen-60\">\r\n        <figure class=\"wojo small circular image\">\r\n          <img src=\"[SITEURL]/uploads/avatars/avatar_0015.jpg\" alt=\"Image Description\">\r\n        </figure>\r\n        <div class=\"wojo white thin tall large text margin-bottom\"> The template is really nice and offers quite a large set of options. It\'s beautiful and the coding is done quickly and seamlessly. Thank you! </div>\r\n        <h4 class=\"wojo warning text\">Maria Muszynska</h4>\r\n      </div>\r\n    </div>\r\n  </div>\r\n  <figure class=\"absolute\" style=\"bottom:-3rem;left:0;width:25%\">\r\n    <svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"-19 21 8 8\">\r\n      <path fill=\"#FFF\" d=\"M-15.3 26.5c0 .9-.7 1.6-1.6 1.6-.7 0-1.3-.4-1.5-1.1-.2-.5-.3-1.1-.3-1.4 0-1.6.8-2.9 2.5-3.7l.2.5c-1 .4-1.8 1.4-1.8 2.3v.4c.3-.2.6-.3.9-.3.9 0 1.6.8 1.6 1.7zm2.4-1.7c-.3 0-.6.1-.9.3v-.4c0-.9.8-1.9 1.8-2.3l-.2-.5c-1.7.8-2.5 2.1-2.5 3.7 0 .4.1.9.3 1.4.2.6.8 1.1 1.5 1.1.9 0 1.6-.7 1.6-1.6s-.7-1.7-1.6-1.7z\" opacity=\".1\"/>\r\n    </svg>\r\n  </figure>\r\n  <figure class=\"absolute\" style=\"left:0;bottom:0;width:100%\">\r\n    <svg xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" width=\"100%\" height=\"140px\" data-parent=\"#SVGwave1BottomSMShape\" preserveAspectRatio=\"none\" style=\"margin-bottom:-8px\" viewBox=\"0 0 300 100\">\r\n      <style>\r\n    .wave-bottom-1-sm-0{fill:#fff}\r\n  </style>\r\n      <defs>\r\n        <path id=\"waveBottom1SMID1\" d=\"M0 0h300v100H0z\"/>\r\n      </defs>\r\n      <clipPath id=\"waveBottom1SMID2\">\r\n        <use overflow=\"visible\" xlink:href=\"#waveBottom1SMID1\"/>\r\n      </clipPath>\r\n      <path d=\"M10.9 63.9s42.9-34.5 87.5-14.2c77.3 35.1 113.3-2 146.6-4.7 48.7-4 70 16.2 70 16.2v54.4H10.9V63.9z\" class=\"wave-bottom-1-sm-0 fill-white\" clip-path=\"url(#waveBottom1SMID2)\" opacity=\".4\"/>\r\n      <path d=\"M-55.7 64.6s42.9-34.5 87.5-14.2c77.3 35.1 113.3-2 146.6-4.7 48.7-4.1 69.9 16.2 69.9 16.2v54.4h-304V64.6z\" class=\"wave-bottom-1-sm-0 fill-white\" clip-path=\"url(#waveBottom1SMID2)\" opacity=\".4\"/>\r\n      <path fill-opacity=\"0\" d=\"M23.4 118.3s48.3-68.9 109.1-68.9c65.9 0 98 67.9 98 67.9v3.7H22.4l1-2.7z\" class=\"wave-bottom-1-sm-0 fill-white\" clip-path=\"url(#waveBottom1SMID2)\" opacity=\".4\"/>\r\n      <path d=\"M-54.7 83s56-45.7 120.3-27.8c81.8 22.7 111.4 6.2 146.6-4.7 53.1-16.4 104 36.9 104 36.9l1.3 36.7-372-3-.2-38.1z\" class=\"wave-bottom-1-sm-0 fill-white\" clip-path=\"url(#waveBottom1SMID2)\"/>\r\n    </svg>\r\n  </figure>\r\n</div>', NULL, 0, '', 0, 0, 'Testimonial used on blog page', NULL, 0, 0, 0, 0, NULL, '2017-01-13 13:33:21', NULL, '1.00', 1);
INSERT INTO `plugins` (`id`, `title_en`, `body_en`, `jscode`, `show_title`, `alt_class`, `system`, `cplugin`, `info_en`, `plugalias`, `hasconfig`, `multi`, `parent_id`, `plugin_id`, `groups`, `created`, `icon`, `ver`, `active`) VALUES(25, 'About Us', '<div class=\"sidebar-module\">\r\n  <h4>about us</h4>\r\n  <div class=\"thumbnail-3 thumbnail-mod-2\"><img alt=\"\" src=\"[SITEURL]/uploads/images/services1.jpg\">\r\n    <div class=\"caption\">\r\n      <p>Our business solutions are designed around the real needs of businesses, our information resources, tools and... </p>\r\n      <a class=\"wojo red button\" href=\"about.html\">learn more</a> </div>\r\n  </div>\r\n</div>', NULL, 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, '2017-01-16 21:23:52', NULL, '1.00', 1);
INSERT INTO `plugins` (`id`, `title_en`, `body_en`, `jscode`, `show_title`, `alt_class`, `system`, `cplugin`, `info_en`, `plugalias`, `hasconfig`, `multi`, `parent_id`, `plugin_id`, `groups`, `created`, `icon`, `ver`, `active`) VALUES(26, 'Our Clients', NULL, NULL, 0, NULL, 1, 1, NULL, 'carousel/clients', 0, 0, 22, 2, 'carousel', '2017-01-19 17:14:27', 'carousel/thumb.svg', '1.00', 1);
INSERT INTO `plugins` (`id`, `title_en`, `body_en`, `jscode`, `show_title`, `alt_class`, `system`, `cplugin`, `info_en`, `plugalias`, `hasconfig`, `multi`, `parent_id`, `plugin_id`, `groups`, `created`, `icon`, `ver`, `active`) VALUES(35, 'Newsletter', NULL, NULL, 0, NULL, 1, 1, NULL, 'newsletter', 1, 0, 0, 0, 'newsletter', '2017-05-27 06:00:20', 'newsletter/thumb.svg', '1.00', 1);
INSERT INTO `plugins` (`id`, `title_en`, `body_en`, `jscode`, `show_title`, `alt_class`, `system`, `cplugin`, `info_en`, `plugalias`, `hasconfig`, `multi`, `parent_id`, `plugin_id`, `groups`, `created`, `icon`, `ver`, `active`) VALUES(36, 'Our Team', NULL, NULL, 1, '', 0, 1, '', 'carousel/team', 0, 0, 22, 3, 'carousel', '2018-04-14 05:17:18', 'carousel/thumb.svg', '1.00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `plug_carousel`
--

DROP TABLE IF EXISTS `plug_carousel`;
CREATE TABLE IF NOT EXISTS `plug_carousel` (
  `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title_en` varchar(100) NOT NULL,
  `body_en` text,
  `dots` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `nav` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `autoplay` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `margin` smallint(4) UNSIGNED NOT NULL DEFAULT '0',
  `loop` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `settings` blob,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `plug_carousel`
--


INSERT INTO `plug_carousel` (`id`, `title_en`, `body_en`, `dots`, `nav`, `autoplay`, `margin`, `loop`, `settings`) VALUES(1, 'Testimonials', '<div class=\"row gutters\">\n<div class=\"columns screen-20 tablet-20 mobile-100 phone-100 content-center\"><img src=\"[SITEURL]/uploads/images/partner1.png\" alt=\"\" />\n<p class=\"wojo bold text half-vertical-margin\">Retro Press Inc.</p>\n<p><a href=\"#\">www.retropress.corp</a></p>\n</div>\n<div class=\"columns screen-40 tablet-40 mobile-100 phone-100\">\n<p>Our team of specialists is constantly expanding and now we are looking for business consulting experts. If you know what is included in dealing with business management of all kinds - from entrepreneurship, management, business planning, financial analysis, and more, we will be glad to see you at our company.</p>\n<div class=\"wojo big space divider\"></div>\n<p>We are also searching for financial consultants who would like to change the economic and financial state of their countries for the better. Browse our website to find out more about necessary skills and experience for the position of financial consultant at our company. experience for the position of financial consultant at our company.</p>\n</div>\n<div class=\"columns screen-40 tablet-40 mobile-100 phone-100\">\n<div class=\"wojo primary bg relaxed fluid basic card\">\n<div class=\"content\"><img class=\"left floated wojo small circular image\" src=\"[SITEURL]/uploads/avatars/av6.jpg\" />\n<p>Thanks a lot for the quick response. I was really impressed, your solution is excellent! Your competence is justified!</p>\n<div class=\"wojo primary text bold\">Michelle Smith, manager</div>\n</div>\n</div>\n<div class=\"wojo primary bg relaxed fluid basic card\">\n<div class=\"content\"><img class=\"left floated wojo small circular image\" src=\"[SITEURL]/uploads/avatars/av1.jpg\" />\n<p>Thank you for your prompt response and real help. You always have a quick solution to any problem.</p>\n<div class=\"wojo primary text bold\">Timothy Holmes, manager</div>\n</div>\n</div>\n</div>\n</div>\n<div class=\"row gutters\">\n<div class=\"columns screen-20 tablet-10 mobile-100 phone-100 content-center\"><img src=\"[SITEURL]/uploads/images/partner1.png\" alt=\"\" />\n<p class=\"wojo bold text half-vertical-margin\">Retro Press Inc.</p>\n<p><a href=\"#\">www.retropress.corp</a></p>\n</div>\n<div class=\"columns screen-40 tablet-40 mobile-100 phone-100\">\n<p>Our team of specialists is constantly expanding and now we are looking for business consulting experts. If you know what is included in dealing with business management of all kinds - from entrepreneurship, management, business planning, financial analysis, and more, we will be glad to see you at our company.</p>\n<div class=\"wojo big space divider\"></div>\n<p>We are also searching for financial consultants who would like to change the economic and financial state of their countries for the better. Browse our website to find out more about necessary skills and experience for the position of financial consultant at our company. experience for the position of financial consultant at our company.</p>\n</div>\n<div class=\"columns screen-40 tablet-50 mobile-100 phone-100\">\n<div class=\"wojo primary bg relaxed fluid basic card\">\n<div class=\"content\"><img class=\"left floated wojo small circular image\" src=\"[SITEURL]/uploads/avatars/av6.jpg\" />\n<p>Thanks a lot for the quick response. I was really impressed, your solution is excellent! Your competence is justified!</p>\n<div class=\"wojo primary text bold\">Michelle Smith, manager</div>\n</div>\n</div>\n<div class=\"wojo primary bg relaxed fluid basic card\">\n<div class=\"content\"><img class=\"left floated wojo small circular image\" src=\"[SITEURL]/uploads/avatars/av1.jpg\" />\n<p>Thank you for your prompt response and real help. You always have a quick solution to any problem.</p>\n<div class=\"wojo primary text bold\">Timothy Holmes, manager</div>\n</div>\n</div>\n</div>\n</div>\n<div class=\"row gutters\">\n<div class=\"columns screen-20 tablet-10 mobile-100 phone-100 content-center\"><img src=\"[SITEURL]/uploads/images/partner1.png\" alt=\"\" />\n<p class=\"wojo bold text half-vertical-margin\">Retro Press Inc.</p>\n<p><a href=\"#\">www.retropress.corp</a></p>\n</div>\n<div class=\"columns screen-40 tablet-40 mobile-100 phone-100\">\n<p>Our team of specialists is constantly expanding and now we are looking for business consulting experts. If you know what is included in dealing with business management of all kinds - from entrepreneurship, management, business planning, financial analysis, and more, we will be glad to see you at our company.</p>\n<div class=\"wojo big space divider\"></div>\n<p>We are also searching for financial consultants who would like to change the economic and financial state of their countries for the better. Browse our website to find out more about necessary skills and experience for the position of financial consultant at our company. experience for the position of financial consultant at our company.</p>\n</div>\n<div class=\"columns screen-40 tablet-50 mobile-100 phone-100\">\n<div class=\"wojo primary bg relaxed fluid basic card\">\n<div class=\"content\"><img class=\"left floated wojo small circular image\" src=\"[SITEURL]/uploads/avatars/av6.jpg\" />\n<p>Thanks a lot for the quick response. I was really impressed, your solution is excellent! Your competence is justified!</p>\n<div class=\"wojo primary text bold\">Michelle Smith, manager</div>\n</div>\n</div>\n<div class=\"wojo primary bg relaxed fluid basic card\">\n<div class=\"content\"><img class=\"left floated wojo small circular image\" src=\"[SITEURL]/uploads/avatars/av1.jpg\" />\n<p>Thank you for your prompt response and real help. You always have a quick solution to any problem.</p>\n<div class=\"wojo primary text bold\">Timothy Holmes, manager</div>\n</div>\n</div>\n</div>\n</div>', 1, 0, 0, 0, 0, 0x7b22646f7473223a747275652c226e6176223a66616c73652c226175746f706c6179223a66616c73652c226d617267696e223a302c226c6f6f70223a66616c73652c22726573706f6e73697665223a7b2230223a7b226974656d73223a317d2c22373639223a7b226974656d73223a317d2c2231303234223a7b226974656d73223a317d7d7d);
INSERT INTO `plug_carousel` (`id`, `title_en`, `body_en`, `dots`, `nav`, `autoplay`, `margin`, `loop`, `settings`) VALUES(2, 'Our Clients', '<div><img src=\"[SITEURL]/uploads/images/partner2.png\" alt=\"\" /></div>\n<div><a href=\"[SITEURL]/our-contact-info/\"><img src=\"[SITEURL]/uploads/images/partner3.png\" alt=\"\" /></a></div>\n<div><img src=\"[SITEURL]/uploads/images/partner4.png\" alt=\"\" /></div>\n<div><img src=\"[SITEURL]/uploads/images/partner5.png\" alt=\"\" /></div>\n<div><img src=\"[SITEURL]/uploads/images/partner6.png\" alt=\"\" /></div>\n<div><img src=\"[SITEURL]/uploads/images/partner2.png\" alt=\"\" /></div>\n<div><img src=\"[SITEURL]/uploads/images/partner3.png\" alt=\"\" /></div>\n<div><img src=\"[SITEURL]/uploads/images/partner4.png\" alt=\"\" /></div>\n<div><img src=\"[SITEURL]/uploads/images/partner5.png\" alt=\"\" /></div>\n<div><img src=\"[SITEURL]/uploads/images/partner6.png\" alt=\"\" /></div>\n<div><img src=\"[SITEURL]/uploads/images/partner2.png\" alt=\"\" /></div>\n<div><img src=\"[SITEURL]/uploads/images/partner3.png\" alt=\"\" /></div>\n<div><img src=\"[SITEURL]/uploads/images/partner4.png\" alt=\"\" /></div>\n<div><img src=\"[SITEURL]/uploads/images/partner5.png\" alt=\"\" /></div>\n<div><img src=\"[SITEURL]/uploads/images/partner6.png\" alt=\"\" /></div>', 1, 0, 1, 40, 0, 0x7b22646f7473223a747275652c226e6176223a66616c73652c226175746f706c6179223a747275652c226d617267696e223a34302c226c6f6f70223a747275652c22726573706f6e73697665223a7b2230223a7b226974656d73223a317d2c22373639223a7b226974656d73223a337d2c2231303234223a7b226974656d73223a357d7d7d);
INSERT INTO `plug_carousel` (`id`, `title_en`, `body_en`, `dots`, `nav`, `autoplay`, `margin`, `loop`, `settings`) VALUES(3, 'Our Team', '          <div class=\"items\">\r\n<div class=\"row gutters\">\r\n  <div class=\"columns phone-100 align-self-bottom\">\r\n    <h4>Maria Muszynska</h4>\r\n    <span class=\"wojo primary label\">#maria</span>\r\n    <p class=\"wojo small text vertical-margin\">I am an ambitious workaholic, but apart from that, pretty simple person.</p>\r\n    <div class=\"padding-top\">\r\n      <a href=\"#\" class=\"wojo small secondary icon button\"><i class=\"icon facebook\"></i></a>\r\n      <a href=\"#\" class=\"wojo small secondary icon button\"><i class=\"icon google\"></i></a>\r\n      <a href=\"#\" class=\"wojo small secondary icon button\"><i class=\"icon twitter\"></i></a>\r\n    </div>\r\n  </div>\r\n  <div class=\"columns phone-100\">\r\n    <figure class=\"wojo basic rounded image\"><img src=\"[SITEURL]/uploads/images/team/person1.jpg\" alt=\"Image Description\"></figure>\r\n  </div>\r\n</div>\r\n          </div>\r\n          <div class=\"items\">\r\n<div class=\"row gutters\">\r\n  <div class=\"columns phone-100 align-self-bottom\">\r\n    <h4>Jack Wayley</h4>\r\n    <span class=\"wojo primary label\">#jack</span>\r\n    <p class=\"wojo small text vertical-margin\">I am an ambitious workaholic, but apart from that, pretty simple person.</p>\r\n    <div class=\"padding-top\">\r\n      <a href=\"#\" class=\"wojo small secondary icon button\"><i class=\"icon facebook\"></i></a>\r\n      <a href=\"#\" class=\"wojo small secondary icon button\"><i class=\"icon google\"></i></a>\r\n      <a href=\"#\" class=\"wojo small secondary icon button\"><i class=\"icon twitter\"></i></a>\r\n    </div>\r\n  </div>\r\n  <div class=\"columns\">\r\n    <figure class=\"wojo basic rounded image\"><img src=\"[SITEURL]/uploads/images/team/person2.jpg\" alt=\"Image Description\"></figure>\r\n  </div>\r\n</div>\r\n          </div>\r\n          <div class=\"items\">\r\n<div class=\"row gutters\">\r\n  <div class=\"columns phone-100 align-self-bottom\">\r\n    <h4>Tammy Ballis</h4>\r\n    <span class=\"wojo primary label\">#tammy</span>\r\n    <p class=\"wojo small text vertical-margin\">I am an ambitious workaholic, but apart from that, pretty simple person.</p>\r\n    <div class=\"padding-top\">\r\n      <a href=\"#\" class=\"wojo small secondary icon button\"><i class=\"icon facebook\"></i></a>\r\n      <a href=\"#\" class=\"wojo small secondary icon button\"><i class=\"icon google\"></i></a>\r\n      <a href=\"#\" class=\"wojo small secondary icon button\"><i class=\"icon twitter\"></i></a>\r\n    </div>\r\n  </div>\r\n  <div class=\"columns\">\r\n    <figure class=\"wojo basic rounded image\"><img src=\"[SITEURL]/uploads/images/team/person5.jpg\" alt=\"Image Description\"></figure>\r\n  </div>\r\n</div>\r\n          </div>\r\n          <div class=\"items\">\r\n<div class=\"row gutters\">\r\n  <div class=\"columns phone-100 align-self-bottom\">\r\n    <h4>Emmely Jackson</h4>\r\n    <span class=\"wojo primary label\">#emily</span>\r\n    <p class=\"wojo small text vertical-margin\">I am an ambitious workaholic, but apart from that, pretty simple person.</p>\r\n    <div class=\"padding-top\">\r\n      <a href=\"#\" class=\"wojo small secondary icon button\"><i class=\"icon facebook\"></i></a>\r\n      <a href=\"#\" class=\"wojo small secondary icon button\"><i class=\"icon google\"></i></a>\r\n      <a href=\"#\" class=\"wojo small secondary icon button\"><i class=\"icon twitter\"></i></a>\r\n    </div>\r\n  </div>\r\n  <div class=\"columns\">\r\n    <figure class=\"wojo basic rounded image\"><img src=\"[SITEURL]/uploads/images/team/person3.jpg\" alt=\"Image Description\"></figure>\r\n  </div>\r\n</div>\r\n          </div>\r\n          <div class=\"items\">\r\n<div class=\"row gutters\">\r\n  <div class=\"columns phone-100 align-self-bottom\">\r\n    <h4>Mark McManus</h4>\r\n    <span class=\"wojo primary label\">#mark</span>\r\n    <p class=\"wojo small text vertical-margin\">I am an ambitious workaholic, but apart from that, pretty simple person.</p>\r\n    <div class=\"padding-top\">\r\n      <a href=\"#\" class=\"wojo small secondary icon button\"><i class=\"icon facebook\"></i></a>\r\n      <a href=\"#\" class=\"wojo small secondary icon button\"><i class=\"icon google\"></i></a>\r\n      <a href=\"#\" class=\"wojo small secondary icon button\"><i class=\"icon twitter\"></i></a>\r\n    </div>\r\n  </div>\r\n  <div class=\"columns\">\r\n    <figure class=\"wojo basic rounded image\"><img src=\"[SITEURL]/uploads/images/team/person4.jpg\" alt=\"Image Description\"></figure>\r\n  </div>\r\n</div>\r\n          </div>', 1, 0, 0, 64, 0, 0x7b226d617267696e223a36342c226974656d73223a322c226c6f6f70223a66616c73652c226e6176223a66616c73652c22646f7473223a747275652c22726573706f6e73697665223a207b2230223a207b226974656d73223a20317d2c22373639223a207b226974656d73223a20317d2c2231303234223a207b226974656d73223a20327d7d7d);

-- --------------------------------------------------------

--
-- Table structure for table `plug_donation`
--

DROP TABLE IF EXISTS `plug_donation`;
CREATE TABLE IF NOT EXISTS `plug_donation` (
  `id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(80) DEFAULT NULL,
  `target_amount` decimal(12,2) UNSIGNED NOT NULL DEFAULT '0.00',
  `pp_email` varchar(80) NOT NULL,
  `redirect_page` int(1) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `plug_donation`
--

INSERT INTO `plug_donation` VALUES(1, 'Paypa Donations', '150.00', 'webmaster@paypal.com', 1);
INSERT INTO `plug_donation` VALUES(2, 'Paypa Donations II', '2500.00', 'webmaster@paypal.com', 1);

-- --------------------------------------------------------

--
-- Table structure for table `plug_donation_data`
--

DROP TABLE IF EXISTS `plug_donation_data`;
CREATE TABLE IF NOT EXISTS `plug_donation_data` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `amount` decimal(12,2) UNSIGNED NOT NULL DEFAULT '0.00',
  `name` varchar(80) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `pp` varchar(50) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_parent_id` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `plug_donation_data`
--

INSERT INTO `plug_donation_data` VALUES(1, 1, '12.00', 'Timothy Fields', 'jrussell1@ameblo.jp', 'PayPal', '2016-10-02 11:23:40');
INSERT INTO `plug_donation_data` VALUES(2, 1, '15.00', 'Keith Butler', 'kmontgomery8@jigsy.com', 'PayPal', '2016-10-02 11:23:47');

-- --------------------------------------------------------

--
-- Table structure for table `plug_newsletter`
--

DROP TABLE IF EXISTS `plug_newsletter`;
CREATE TABLE IF NOT EXISTS `plug_newsletter` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` varchar(100) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `plug_poll_options`
--

DROP TABLE IF EXISTS `plug_poll_options`;
CREATE TABLE IF NOT EXISTS `plug_poll_options` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `question_id` int(11) UNSIGNED NOT NULL,
  `value` varchar(150) NOT NULL,
  `position` tinyint(2) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_question` (`question_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `plug_poll_options`
--

INSERT INTO `plug_poll_options` VALUES(4, 1, 'Hard', 4);
INSERT INTO `plug_poll_options` VALUES(3, 1, 'Easy', 3);
INSERT INTO `plug_poll_options` VALUES(2, 1, 'Very Easy', 2);
INSERT INTO `plug_poll_options` VALUES(1, 1, 'Piece of cake', 1);
INSERT INTO `plug_poll_options` VALUES(5, 2, 'CMS PRO', 1);
INSERT INTO `plug_poll_options` VALUES(6, 2, 'Wordpress', 2);
INSERT INTO `plug_poll_options` VALUES(7, 2, 'Joomla', 3);
INSERT INTO `plug_poll_options` VALUES(8, 2, 'Drupal', 4);

-- --------------------------------------------------------

--
-- Table structure for table `plug_poll_questions`
--

DROP TABLE IF EXISTS `plug_poll_questions`;
CREATE TABLE IF NOT EXISTS `plug_poll_questions` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `question` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `plug_poll_questions`
--

INSERT INTO `plug_poll_questions` VALUES(1, 'How do you find CMS pro! Installation?', '2010-10-14 03:42:18', 1);
INSERT INTO `plug_poll_questions` VALUES(2, 'What is the best CMS?', '2016-06-16 13:07:11', 1);

-- --------------------------------------------------------

--
-- Table structure for table `plug_poll_votes`
--

DROP TABLE IF EXISTS `plug_poll_votes`;
CREATE TABLE IF NOT EXISTS `plug_poll_votes` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `option_id` int(11) UNSIGNED NOT NULL,
  `voted_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip` varbinary(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_option` (`option_id`)
) ENGINE=MyISAM AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `plug_poll_votes`
--

INSERT INTO `plug_poll_votes` VALUES(1, 2, '2010-10-15 10:00:55', 0x3132372e302e302e31);
INSERT INTO `plug_poll_votes` VALUES(2, 1, '2010-10-15 10:01:27', 0x3132372e302e302e31);
INSERT INTO `plug_poll_votes` VALUES(3, 1, '2010-10-15 10:02:04', 0x3132372e302e302e31);
INSERT INTO `plug_poll_votes` VALUES(4, 1, '2010-10-15 10:02:13', 0x3132372e302e302e31);
INSERT INTO `plug_poll_votes` VALUES(5, 3, '2010-10-15 10:02:16', 0x3132372e302e302e31);
INSERT INTO `plug_poll_votes` VALUES(6, 4, '2010-10-15 10:02:21', 0x3132372e302e302e31);
INSERT INTO `plug_poll_votes` VALUES(7, 3, '2010-10-15 10:02:24', 0x3132372e302e302e31);
INSERT INTO `plug_poll_votes` VALUES(8, 1, '2010-10-15 10:02:27', 0x3132372e302e302e31);
INSERT INTO `plug_poll_votes` VALUES(9, 2, '2010-10-15 10:02:31', 0x3132372e302e302e31);
INSERT INTO `plug_poll_votes` VALUES(11, 1, '2010-10-15 10:02:38', 0x3132372e302e302e31);
INSERT INTO `plug_poll_votes` VALUES(12, 2, '2010-10-15 10:02:43', 0x3132372e302e302e31);
INSERT INTO `plug_poll_votes` VALUES(13, 1, '2010-10-15 10:02:46', 0x3132372e302e302e31);
INSERT INTO `plug_poll_votes` VALUES(14, 1, '2010-10-15 10:02:50', 0x3132372e302e302e31);
INSERT INTO `plug_poll_votes` VALUES(15, 1, '2010-10-15 10:05:26', 0x3132372e302e302e31);
INSERT INTO `plug_poll_votes` VALUES(16, 1, '2010-10-15 10:05:29', 0x3132372e302e302e31);
INSERT INTO `plug_poll_votes` VALUES(17, 4, '2010-10-15 10:05:33', 0x3132372e302e302e31);
INSERT INTO `plug_poll_votes` VALUES(18, 2, '2010-10-15 10:05:36', 0x3132372e302e302e31);
INSERT INTO `plug_poll_votes` VALUES(19, 1, '2010-10-15 10:05:40', 0x3132372e302e302e31);
INSERT INTO `plug_poll_votes` VALUES(20, 3, '2010-10-15 10:05:46', 0x3132372e302e302e31);
INSERT INTO `plug_poll_votes` VALUES(21, 2, '2010-10-15 10:05:49', 0x3132372e302e302e31);
INSERT INTO `plug_poll_votes` VALUES(22, 2, '2010-10-15 10:21:37', 0x3132372e302e302e31);
INSERT INTO `plug_poll_votes` VALUES(23, 1, '2010-10-15 10:21:53', 0x3132372e302e302e31);
INSERT INTO `plug_poll_votes` VALUES(25, 1, '2010-10-15 10:35:27', 0x3132372e302e302e31);
INSERT INTO `plug_poll_votes` VALUES(26, 1, '2010-10-15 20:42:05', 0x3132372e302e302e31);
INSERT INTO `plug_poll_votes` VALUES(27, 3, '2010-10-15 20:49:42', 0x3132372e302e302e31);
INSERT INTO `plug_poll_votes` VALUES(28, 2, '2010-10-15 21:22:00', 0x3132372e302e302e31);
INSERT INTO `plug_poll_votes` VALUES(29, 2, '2010-10-15 21:24:51', 0x3132372e302e302e31);
INSERT INTO `plug_poll_votes` VALUES(30, 1, '2010-10-15 21:37:21', 0x3132372e302e302e31);
INSERT INTO `plug_poll_votes` VALUES(31, 1, '2010-10-15 21:38:48', 0x3132372e302e302e31);
INSERT INTO `plug_poll_votes` VALUES(32, 1, '2010-10-15 21:41:30', 0x3132372e302e302e31);
INSERT INTO `plug_poll_votes` VALUES(33, 1, '2010-10-15 21:42:21', 0x3132372e302e302e31);
INSERT INTO `plug_poll_votes` VALUES(34, 1, '2010-10-16 00:53:42', 0x3132372e302e302e31);
INSERT INTO `plug_poll_votes` VALUES(35, 3, '2010-10-16 01:09:14', 0x3132372e302e302e31);
INSERT INTO `plug_poll_votes` VALUES(36, 3, '2010-11-25 22:00:27', 0x3132372e302e302e31);
INSERT INTO `plug_poll_votes` VALUES(37, 3, '2010-11-29 01:56:07', 0x3132372e302e302e31);
INSERT INTO `plug_poll_votes` VALUES(38, 3, '2012-12-23 22:57:05', 0x3132372e302e302e31);
INSERT INTO `plug_poll_votes` VALUES(39, 1, '2012-12-23 23:46:26', 0x3132372e302e302e31);
INSERT INTO `plug_poll_votes` VALUES(41, 1, '2012-12-27 21:20:01', 0x3132372e302e302e31);
INSERT INTO `plug_poll_votes` VALUES(42, 1, '2014-04-21 08:45:03', 0x3132372e302e302e31);
INSERT INTO `plug_poll_votes` VALUES(43, 3, '2014-04-21 08:46:53', 0x3132372e302e302e31);
INSERT INTO `plug_poll_votes` VALUES(44, 1, '2014-04-21 08:47:38', 0x3132372e302e302e31);
INSERT INTO `plug_poll_votes` VALUES(46, 3, '2014-04-24 13:07:37', 0x3132372e302e302e31);
INSERT INTO `plug_poll_votes` VALUES(47, 3, '2014-04-24 13:11:36', 0x3132372e302e302e31);
INSERT INTO `plug_poll_votes` VALUES(48, 3, '2014-05-20 13:09:13', 0x3132372e302e302e31);
INSERT INTO `plug_poll_votes` VALUES(49, 1, '2014-05-20 13:13:01', 0x3132372e302e302e31);
INSERT INTO `plug_poll_votes` VALUES(50, 5, '2016-06-17 14:43:10', 0x3132372e302e302e31);
INSERT INTO `plug_poll_votes` VALUES(51, 5, '2016-06-17 14:43:10', 0x3132372e302e302e31);
INSERT INTO `plug_poll_votes` VALUES(52, 5, '2016-06-17 14:43:11', 0x3132372e302e302e31);
INSERT INTO `plug_poll_votes` VALUES(53, 5, '2016-06-17 14:43:11', 0x3132372e302e302e31);
INSERT INTO `plug_poll_votes` VALUES(54, 5, '2016-06-17 14:43:11', 0x3132372e302e302e31);
INSERT INTO `plug_poll_votes` VALUES(55, 5, '2016-06-17 14:43:11', 0x3132372e302e302e31);
INSERT INTO `plug_poll_votes` VALUES(56, 5, '2016-06-17 14:43:12', 0x3132372e302e302e31);
INSERT INTO `plug_poll_votes` VALUES(57, 5, '2016-06-17 14:43:12', 0x3132372e302e302e31);
INSERT INTO `plug_poll_votes` VALUES(58, 6, '2016-06-17 14:43:36', 0x3132372e302e302e31);
INSERT INTO `plug_poll_votes` VALUES(59, 7, '2016-06-17 14:43:37', 0x3132372e302e302e31);
INSERT INTO `plug_poll_votes` VALUES(60, 8, '2016-06-17 14:43:38', 0x3132372e302e302e31);
INSERT INTO `plug_poll_votes` VALUES(61, 6, '2016-06-17 14:43:54', 0x3132372e302e302e31);
INSERT INTO `plug_poll_votes` VALUES(62, 7, '2016-06-17 14:43:55', 0x3132372e302e302e31);
INSERT INTO `plug_poll_votes` VALUES(63, 1, '2017-01-18 16:33:31', 0x3132372e302e302e31);
INSERT INTO `plug_poll_votes` VALUES(64, 1, '2017-01-18 16:34:07', 0x3132372e302e302e31);
INSERT INTO `plug_poll_votes` VALUES(65, 1, '2017-01-18 17:21:46', 0x3132372e302e302e31);
INSERT INTO `plug_poll_votes` VALUES(66, 1, '2017-01-18 18:00:36', 0x3132372e302e302e31);
INSERT INTO `plug_poll_votes` VALUES(67, 1, '2017-01-18 18:23:35', 0x3132372e302e302e31);
INSERT INTO `plug_poll_votes` VALUES(68, 1, '2017-01-18 18:30:55', 0x3132372e302e302e31);
INSERT INTO `plug_poll_votes` VALUES(69, 5, '2017-01-18 18:43:26', 0x3132372e302e302e31);
INSERT INTO `plug_poll_votes` VALUES(70, 5, '2017-01-18 18:47:00', 0x3132372e302e302e31);
INSERT INTO `plug_poll_votes` VALUES(71, 5, '2017-01-18 18:48:23', 0x3132372e302e302e31);

-- --------------------------------------------------------

--
-- Table structure for table `plug_rss`
--

DROP TABLE IF EXISTS `plug_rss`;
CREATE TABLE IF NOT EXISTS `plug_rss` (
  `id` int(2) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `url` varchar(120) NOT NULL,
  `items` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `show_date` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `show_desc` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `max_words` smallint(4) UNSIGNED NOT NULL DEFAULT '100',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `plug_rss`
--

INSERT INTO `plug_rss` VALUES(1, 'CTV Top Stories', 'http://ctvnews.ca/rss/TopStories', 5, 1, 1, 20);
INSERT INTO `plug_rss` VALUES(2, 'Yahoo Feed', 'https://ca.sports.yahoo.com/nhl/rss.xml', 10, 1, 1, 100);

-- --------------------------------------------------------

--
-- Table structure for table `plug_slider`
--

DROP TABLE IF EXISTS `plug_slider`;
CREATE TABLE IF NOT EXISTS `plug_slider` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(80) NOT NULL,
  `type` varchar(15) DEFAULT NULL,
  `layout` varchar(25) DEFAULT NULL,
  `autoplay` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `autoplaySpeed` smallint(1) unsigned NOT NULL DEFAULT '1000',
  `autoplayHoverPause` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `autoloop` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `height` smallint(3) unsigned NOT NULL DEFAULT '100',
  `fullscreen` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `settings` blob,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `plug_slider`
--

INSERT INTO `plug_slider` (`id`, `title`, `type`, `layout`, `autoplay`, `autoplaySpeed`, `autoplayHoverPause`, `autoloop`, `height`, `fullscreen`, `settings`) VALUES(1, 'Image Slider', 'image', 'dots', 1, 1500, 1, 0, 60, 0, 0x7b226175746f6c6f6f70223a66616c73652c2266756c6c73637265656e223a302c226175746f706c6179223a747275652c226175746f706c61795370656564223a2231353030222c226175746f706c6179486f7665725061757365223a747275652c226c61796f7574223a22646f7473222c227468756d6273223a66616c73652c226172726f7773223a66616c73652c22627574746f6e73223a747275657d);
INSERT INTO `plug_slider` (`id`, `title`, `type`, `layout`, `autoplay`, `autoplaySpeed`, `autoplayHoverPause`, `autoloop`, `height`, `fullscreen`, `settings`) VALUES(2, 'Carousel Slider', 'carousel', 'basic', 1, 1000, 1, 1, 50, 0, NULL);
INSERT INTO `plug_slider` (`id`, `title`, `type`, `layout`, `autoplay`, `autoplaySpeed`, `autoplayHoverPause`, `autoloop`, `height`, `fullscreen`, `settings`) VALUES(3, 'Content Slider', 'image', 'standard', 0, 1000, 1, 1, 100, 0, 0x7b226175746f6c6f6f70223a747275652c2266756c6c73637265656e223a302c226175746f706c6179223a66616c73652c226175746f706c61795370656564223a2231303030222c226175746f706c6179486f7665725061757365223a747275652c226c61796f7574223a227374616e64617264222c227468756d6273223a66616c73652c226172726f7773223a747275652c22627574746f6e73223a66616c73657d);
INSERT INTO `plug_slider` (`id`, `title`, `type`, `layout`, `autoplay`, `autoplaySpeed`, `autoplayHoverPause`, `autoloop`, `height`, `fullscreen`, `settings`) VALUES(4, 'Sync Slider', 'sync', 'thumbs_down', 1, 1000, 1, 1, 50, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `plug_slider_data`
--

DROP TABLE IF EXISTS `plug_slider_data`;
CREATE TABLE IF NOT EXISTS `plug_slider_data` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) unsigned NOT NULL DEFAULT '0',
  `title` varchar(50) NOT NULL,
  `html_raw` text,
  `html` text,
  `image` varchar(60) DEFAULT NULL,
  `color` varchar(30) DEFAULT NULL,
  `attrib` varchar(60) DEFAULT NULL,
  `mode` varchar(2) NOT NULL DEFAULT 'bg',
  `sorting` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_parent` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `plug_slider_data`
--

INSERT INTO `plug_slider_data` (`id`, `parent_id`, `title`, `html_raw`, `html`, `image`, `color`, `attrib`, `mode`, `sorting`) VALUES(1, 1, 'Third Slide', '<div class=\"uitem\" id=\"item_1\" data-type=\"bg\">\n  <div class=\"uimage\" style=\"background-size: cover; background-position: center center; background-repeat: no-repeat; background-image: url([SITEURL]/uploads/slider/slider_img1.jpg); min-height: 600px;\">\n    <div class=\"ucontent align-center align-middle\" style=\"min-height: 600px;\">\n      <div class=\"row\" data-id=\"nwEKD2r\">\n        <div class=\"columns\">\n          <div class=\"ws-layer\" data-delay=\"50\" data-duration=\"600\" data-animation=\"popInLeft\">\n<div data-text=\"true\" style=\"font-size: 40px;\"><span style=\"color: #ffffff;\">WELCOME TO CMS PRO</span></div>\n          </div>\n        </div>\n      </div>\n      <div class=\"row\" data-id=\"HtoyaqB\">\n        <div class=\"columns\">\n          <div class=\"ws-layer\" data-delay=\"100\" data-duration=\"600\" data-animation=\"popInLeft\">\n<div data-text=\"true\" style=\"font-size: 40px; letter-spacing: 2px;\" class=\"wojo bold text\"><span style=\"color: #ffffff;\">WE ARE <span class=\"wojo primary text\">BUSNESS</span> COMPANY</span></div>\n          </div>\n        </div>\n      </div>\n      <div class=\"row\" data-id=\"BNU5eGH\">\n        <div class=\"columns\">\n          <div class=\"ws-layer\" data-delay=\"500\" data-duration=\"800\" data-animation=\"unfold\">\n<i style=\"width: 128px; height: 128px; font-size: 96px; color: #fff; border-radius: 128px;\" class=\"icon wojologo\"></i>\n          </div>\n        </div>\n      </div>\n    </div>\n  </div>\n</div>', '<div class=\"row\">\n        <div class=\"columns\">\n          <div class=\"ws-layer\" data-delay=\"50\" data-duration=\"600\" data-animation=\"popInLeft\">\n<div data-text=\"true\" style=\"font-size: 40px;\"><span style=\"color: #ffffff;\">WELCOME TO CMS PRO</span></div>\n          </div>\n        </div>\n      </div>\n      <div class=\"row\">\n        <div class=\"columns\">\n          <div class=\"ws-layer\" data-delay=\"100\" data-duration=\"600\" data-animation=\"popInLeft\">\n<div data-text=\"true\" style=\"font-size: 40px; letter-spacing: 2px;\" class=\"wojo bold text\"><span style=\"color: #ffffff;\">WE ARE <span class=\"wojo primary text\">BUSNESS</span> COMPANY</span></div>\n          </div>\n        </div>\n      </div>\n      <div class=\"row\">\n        <div class=\"columns\">\n          <div class=\"ws-layer\" data-delay=\"500\" data-duration=\"800\" data-animation=\"unfold\">\n<i style=\"width: 128px; height: 128px; font-size: 96px; color: #fff; border-radius: 128px;\" class=\"icon wojologo\"></i>\n          </div>\n        </div>\n      </div>', 'slider/slider_img1.jpg', '#dddddd', 'align-center align-middle', 'bg', 1);
INSERT INTO `plug_slider_data` (`id`, `parent_id`, `title`, `html_raw`, `html`, `image`, `color`, `attrib`, `mode`, `sorting`) VALUES(2, 1, 'Second Slide', '<div class=\"uitem\" id=\"item_2\" data-type=\"bg\">\n  <div class=\"uimage\" style=\"background-size: cover; background-position: center center; background-repeat: no-repeat; background-image: url([SITEURL]/uploads/slider/slider_img3.jpg); min-height: 600px;\">\n    <div class=\"ucontent align-center align-middle\" style=\"min-height: 600px;\">\n      <div class=\"row\" data-id=\"eDRof6n\">\n        <div class=\"columns\">\n          <div class=\"ws-layer\" data-delay=\"50\" data-duration=\"600\" data-animation=\"fadeInTop\">\n<div data-text=\"true\" style=\"font-size: 40px;\"><span style=\"color: #ffffff;\">WELCOME TO CMS PRO</span></div>\n          </div>\n        </div>\n      </div>\n      <div class=\"row\" data-id=\"hpQY4I4\">\n        <div class=\"columns\">\n          <div class=\"ws-layer\" data-delay=\"100\" data-duration=\"600\" data-animation=\"fadeInTop\">\n<div data-text=\"true\" style=\"font-size: 40px; letter-spacing: 2px;\" class=\"wojo bold text\"><span style=\"color: #ffffff;\">WE ARE <span class=\"wojo primary text\">BUSNESS</span> COMPANY</span></div>\n          </div>\n        </div>\n      </div>\n      <div class=\"row\" data-id=\"ARnjU6n\">\n        <div class=\"columns\">\n          <div class=\"ws-layer\" data-delay=\"500\" data-duration=\"800\" data-animation=\"spinIn\"><img src=\"[SITEURL]/uploads/svg/checked.svg\" alt=\"checked.svg\" class=\"wojo small basic image\"></div>\n        </div>\n      </div>\n    </div>\n  </div>\n</div>', '<div class=\"row\">\n        <div class=\"columns\">\n          <div class=\"ws-layer\" data-delay=\"150\" data-duration=\"600\" data-animation=\"fadeInTop\">\n<div data-text=\"true\" style=\"font-size: 40px;\"><span style=\"color: #ffffff;\">WELCOME TO CMS PRO</span></div>\n          </div>\n        </div>\n      </div>\n      <div class=\"row\">\n        <div class=\"columns\">\n          <div class=\"ws-layer\" data-delay=\"200\" data-duration=\"600\" data-animation=\"fadeInTop\">\n<div data-text=\"true\" style=\"font-size: 40px; letter-spacing: 2px;\" class=\"wojo bold text\"><span style=\"color: #ffffff;\">WE ARE <span class=\"wojo primary text\">BUSNESS</span> COMPANY</span></div>\n          </div>\n        </div>\n      </div>\n      <div class=\"row\">\n        <div class=\"columns\">\n          <div class=\"ws-layer\" data-delay=\"500\" data-duration=\"800\" data-animation=\"spinIn\"><img src=\"[SITEURL]/uploads/svg/checked.svg\" alt=\"checked.svg\" class=\"wojo small basic image\"></div>\n        </div>\n      </div>', 'slider/slider_img3.jpg', 'rgba(0, 0, 0, 0)', 'align-center align-middle', 'bg', 2);
INSERT INTO `plug_slider_data` (`id`, `parent_id`, `title`, `html_raw`, `html`, `image`, `color`, `attrib`, `mode`, `sorting`) VALUES(3, 1, 'First Slide', '<div class=\"uitem\" id=\"item_3\" data-type=\"bg\">\n  <div class=\"uimage\" style=\"background-size: cover; background-position: center center; background-repeat: no-repeat; background-image: url([SITEURL]/uploads/slider/slider_img2.jpg); min-height: 600px;\">\n    <div class=\"ucontent align-center\" style=\"min-height: 600px;\">\n      <div class=\"row\" data-id=\"hvF4TT5\">\n        <div class=\"columns\">\n          <div class=\"ws-layer\" data-delay=\"300\" data-duration=\"600\" data-animation=\"fadeInTop\" data-type=\"header\">\n<div data-text=\"true\" style=\"font-size: 40px;\"><span style=\"color: #ffffff;\">WELCOME TO CMS PRO</span></div>\n          </div>\n          <div class=\"ws-layer\" data-delay=\"400\" data-duration=\"600\" data-animation=\"fadeInTop\" data-type=\"header\" style=\"margin-bottom:4rem\">\n<div data-text=\"true\" style=\"font-size: 40px; letter-spacing: 2px;color: #ffffff;\" class=\"wojo bold text\">WE ARE <span class=\"wojo primary text\">BUSNESS</span> COMPANY</div>\n          </div>\n        </div>\n      </div>\n      <div class=\"row\" data-id=\"eFgSb0A\">\n        <div class=\"columns shrink\">\n          <div class=\"ws-layer\" data-delay=\"100\" data-duration=\"800\" data-animation=\"rollInLeft\" data-type=\"para\">\n<img src=\"[SITEURL]/uploads/slider/wlogo1.png\" alt=\"\">\n          </div>\n        </div>\n        <div class=\"columns shrink\">\n          <div class=\"ws-layer\" data-delay=\"200\" data-duration=\"800\" data-animation=\"rollInRight\">\n<img src=\"[SITEURL]/uploads/slider/wlogo2.png\" alt=\"\">\n          </div>\n        </div>\n      </div>\n      <div class=\"row\" data-id=\"aMdMRmb\">\n        <div class=\"columns shrink\">\n          <div class=\"ws-layer\" data-delay=\"150\" data-duration=\"800\" data-animation=\"rollInLeft\">\n<img src=\"[SITEURL]/uploads/slider/wlogo3.png\" alt=\"\">\n          </div>\n        </div>\n        <div class=\"columns shrink\">\n          <div class=\"ws-layer\" data-delay=\"250\" data-duration=\"800\" data-animation=\"rollInRight\">\n<img src=\"[SITEURL]/uploads/slider/wlogo4.png\" alt=\"\">\n          </div>\n        </div>\n      </div>\n    </div>\n  </div>\n</div>', '<div class=\"row\">\r\n  <div class=\"columns\">\r\n    <div class=\"ws-layer\" data-delay=\"300\" data-duration=\"600\" data-animation=\"fadeInTop\" data-type=\"header\">\r\n      <div data-text=\"true\" style=\"font-size: 40px;\"><span style=\"color: #ffffff;\">WELCOME TO CMS PRO</span></div>\r\n    </div>\r\n    <div class=\"ws-layer\" data-delay=\"400\" data-duration=\"600\" data-animation=\"fadeInTop\" data-type=\"header\" style=\"margin-bottom:4rem\">\r\n      <div data-text=\"true\" style=\"font-size: 40px; letter-spacing: 2px;color: #ffffff;\" class=\"wojo bold text\">WE ARE <span class=\"wojo primary text\">BUSNESS</span> COMPANY</div>\r\n    </div>\r\n  </div>\r\n</div>\r\n<div class=\"row\">\r\n  <div class=\"columns shrink\">\r\n    <div class=\"ws-layer\" data-delay=\"100\" data-duration=\"800\" data-animation=\"rollInLeft\" data-type=\"para\">\r\n      <img src=\"[SITEURL]/uploads/slider/wlogo1.png\" alt=\"\">\r\n    </div>\r\n  </div>\r\n  <div class=\"columns shrink\">\r\n    <div class=\"ws-layer\" data-delay=\"200\" data-duration=\"800\" data-animation=\"rollInRight\">\r\n      <img src=\"[SITEURL]/uploads/slider/wlogo2.png\" alt=\"\">\r\n    </div>\r\n  </div>\r\n</div>\r\n<div class=\"row\">\r\n  <div class=\"columns shrink\">\r\n    <div class=\"ws-layer\" data-delay=\"150\" data-duration=\"800\" data-animation=\"rollInLeft\">\r\n      <img src=\"[SITEURL]/uploads/slider/wlogo3.png\" alt=\"\">\r\n    </div>\r\n  </div>\r\n  <div class=\"columns shrink\">\r\n    <div class=\"ws-layer\" data-delay=\"250\" data-duration=\"800\" data-animation=\"rollInRight\">\r\n      <img src=\"[SITEURL]/uploads/slider/wlogo4.png\" alt=\"\">\r\n    </div>\r\n  </div>\r\n</div>', 'slider/slider_img2.jpg', 'rgba(0, 0, 0, 0)', 'align-center', 'bg', 3);
INSERT INTO `plug_slider_data` (`id`, `parent_id`, `title`, `html_raw`, `html`, `image`, `color`, `attrib`, `mode`, `sorting`) VALUES(4, 3, 'slide 1', '<div class=\"uitem\" id=\"item_4\" data-type=\"bg\">\n  <div class=\"uimage\" style=\"background-size: cover; background-position: center center; background-repeat: no-repeat; background-image: url([SITEURL]/uploads/slider/slider_12.jpg); min-height: 100vh;\">\n    <div class=\"ucontent align-center\" style=\"min-height: 100vh;\">\n      <div class=\"row\" data-id=\"iGsvF2E\">\n        <div class=\"columns\">\n          <div class=\"ws-layer\" data-delay=\"50\" data-duration=\"400\" data-animation=\"fadeInBottom\">\n<p style=\"font-size: 1.5rem;color:#fff\">CMS Pro is a</p>\n          </div>\n        </div>\n      </div>\n      <div class=\"row\" data-id=\"eQSySCB\">\n        <div class=\"columns\">\n          <div class=\"ws-layer\" data-delay=\"200\" data-duration=\"1000\" data-animation=\"fadeInBottom\">\n<h1 style=\"font-size: 3.5rem;font-weight: 300;line-height: 1.2;color:#fff\" data-text=\"true\">Self-<span class=\"wojo semi text\">mastering </span><br>\n  piece of art</h1>\n          </div>\n        </div>\n      </div>\n    </div>\n  </div>\n</div>', '<div class=\"row\">\n        <div class=\"columns\">\n          <div class=\"ws-layer\" data-delay=\"50\" data-duration=\"400\" data-animation=\"fadeInBottom\">\n<p style=\"font-size: 1.5rem;color:#fff\">CMS Pro is a</p>\n          </div>\n        </div>\n      </div>\n      <div class=\"row\">\n        <div class=\"columns\">\n          <div class=\"ws-layer\" data-delay=\"200\" data-duration=\"1000\" data-animation=\"fadeInBottom\">\n<h1 style=\"font-size: 3.5rem;font-weight: 300;line-height: 1.2;color:#fff\" data-text=\"true\">Self-<span class=\"wojo semi text\">mastering </span><br>\n  piece of art</h1>\n          </div>\n        </div>\n      </div>', 'slider/slider_12.jpg', 'rgba(0, 0, 0, 0)', 'align-center', 'bg', 0);
INSERT INTO `plug_slider_data` (`id`, `parent_id`, `title`, `html_raw`, `html`, `image`, `color`, `attrib`, `mode`, `sorting`) VALUES(5, 3, 'slide 2', '<div class=\"uitem\" id=\"item_5\" data-type=\"bg\">\n  <div class=\"uimage\" style=\"background-size: cover; background-position: center center; background-repeat: no-repeat; background-image: url([SITEURL]/uploads/slider/slider_11.jpg); min-height: 100vh;\">\n    <div class=\"ucontent align-center\" style=\"min-height: 100vh;\">\n      <div class=\"row\" data-id=\"FQ27Ayl\">\n        <div class=\"column\">\n          <div class=\"ws-layer\" data-delay=\"50\" data-duration=\"400\" data-animation=\"fadeInBottom\">\n<p class=\"wojo white text\" style=\"font-size: 1.5rem;\">it is on</p>\n          </div>\n        </div>\n      </div>\n      <div class=\"row\" data-id=\"dv1hZka\">\n        <div class=\"column\">\n          <div class=\"ws-layer\" data-delay=\"200\" data-duration=\"1000\" data-animation=\"fadeInBottom\">\n<h1 class=\"wojo white text\" style=\"font-size: 3.5rem;font-weight: 300;line-height: 1.2;\" data-text=\"true\"><span class=\"wojo semi text\">Easy</span> Business with <br>\n  CMS pro</h1>\n          </div>\n        </div>\n      </div>\n    </div>\n  </div>\n</div>', '<div class=\"row\">\n        <div class=\"column\">\n          <div class=\"ws-layer\" data-delay=\"50\" data-duration=\"400\" data-animation=\"fadeInBottom\">\n<p class=\"wojo white text\" style=\"font-size: 1.5rem;\">it is on</p>\n          </div>\n        </div>\n      </div>\n      <div class=\"row\">\n        <div class=\"column\">\n          <div class=\"ws-layer\" data-delay=\"200\" data-duration=\"1000\" data-animation=\"fadeInBottom\">\n<h1 class=\"wojo white text\" style=\"font-size: 3.5rem;font-weight: 300;line-height: 1.2;\" data-text=\"true\"><span class=\"wojo semi text\">Easy</span> Business with <br>\n  CMS pro</h1>\n          </div>\n        </div>\n      </div>', 'slider/slider_11.jpg', 'rgba(0, 0, 0, 0)', 'align-center', 'bg', 0);
-- --------------------------------------------------------

--
-- Table structure for table `plug_yplayer`
--

DROP TABLE IF EXISTS `plug_yplayer`;
CREATE TABLE IF NOT EXISTS `plug_yplayer` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `layout` varchar(10) DEFAULT NULL,
  `config` blob,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `plug_yplayer`
--

INSERT INTO `plug_yplayer` VALUES(1, 'Horizontal Player', 'horizontal', 0x7b22706c61796c697374223a66616c73652c226368616e6e656c223a66616c73652c2275736572223a66616c73652c22766964656f73223a2246325546413862745a2d342c49503370487768386b71342c6e3944776f5137485776492c762d3472596630782d46342c326f6e78676d4b543166772c3656704e6b776b53505a6f222c226170695f6b6579223a2259544b4559222c226d61785f726573756c7473223a223530222c22706167696e6174696f6e223a2231222c22636f6e74696e756f7573223a2231222c2273686f775f706c61796c697374223a66616c73652c22706c61796c6973745f74797065223a22686f72697a6f6e74616c222c2273686f775f6368616e6e656c5f696e5f706c61796c697374223a2231222c2273686f775f6368616e6e656c5f696e5f7469746c65223a2231222c226e6f775f706c6179696e675f74657874223a224e6f7720506c6179696e67222c226c6f61645f6d6f72655f74657874223a224c6f6164204d6f7265222c226175746f706c6179223a66616c73652c22666f7263655f6864223a2230222c2273686172655f636f6e74726f6c223a2230222c22636f6c6f7273223a7b22636f6e74726f6c735f6267223a227267626128302c302c302c2e373529222c22627574746f6e73223a2272676261283235352c3235352c3235352c2e3529222c22627574746f6e735f686f766572223a2272676261283235352c3235352c3235352c3129222c22627574746f6e735f616374697665223a2272676261283235352c3235352c3235352c3129222c2274696d655f74657874223a2223464646464646222c226261725f6267223a2272676261283235352c3235352c3235352c2e3529222c22627566666572223a2272676261283235352c3235352c3235352c2e323529222c2266696c6c223a2223464646464646222c22766964656f5f7469746c65223a2223464646464646222c22766964656f5f6368616e6e656c223a2272676261283235352c20302c20302c20302e333529222c22706c61796c6973745f6f7665726c6179223a227267626128302c302c302c2e373529222c22706c61796c6973745f7469746c65223a2223464646464646222c22706c61796c6973745f6368616e6e656c223a2272676261283235352c20302c20302c20302e333529222c227363726f6c6c626172223a2223464646464646222c227363726f6c6c6261725f6267223a2272676261283235352c3235352c3235352c2e323529227d7d);
INSERT INTO `plug_yplayer` VALUES(2, 'Vertical Player', 'vertical', 0x7b22706c61796c697374223a66616c73652c226368616e6e656c223a66616c73652c2275736572223a66616c73652c22766964656f73223a2246325546413862745a2d342c49503370487768386b71342c6e3944776f5137485776492c762d3472596630782d46342c326f6e78676d4b543166772c3656704e6b776b53505a6f222c226170695f6b6579223a2259544b4559222c226d61785f726573756c7473223a223530222c22706167696e6174696f6e223a2231222c22636f6e74696e756f7573223a2231222c2273686f775f706c61796c697374223a66616c73652c22706c61796c6973745f74797065223a22766572746963616c222c2273686f775f6368616e6e656c5f696e5f706c61796c697374223a2231222c2273686f775f6368616e6e656c5f696e5f7469746c65223a2231222c226e6f775f706c6179696e675f74657874223a224e6f7720506c6179696e67222c226c6f61645f6d6f72655f74657874223a224c6f6164204d6f7265222c226175746f706c6179223a66616c73652c22666f7263655f6864223a2230222c2273686172655f636f6e74726f6c223a2230222c22636f6c6f7273223a7b22636f6e74726f6c735f6267223a227267626128302c302c302c2e373529222c22627574746f6e73223a2272676261283235352c3235352c3235352c2e3529222c22627574746f6e735f686f766572223a2272676261283235352c3235352c3235352c3129222c22627574746f6e735f616374697665223a2272676261283235352c3235352c3235352c3129222c2274696d655f74657874223a2223464646464646222c226261725f6267223a2272676261283235352c3235352c3235352c2e3529222c22627566666572223a2272676261283235352c3235352c3235352c2e323529222c2266696c6c223a2223464646464646222c22766964656f5f7469746c65223a2223464646464646222c22766964656f5f6368616e6e656c223a2272676261283235352c20302c20302c20302e333529222c22706c61796c6973745f6f7665726c6179223a227267626128302c302c302c2e373529222c22706c61796c6973745f7469746c65223a2223464646464646222c22706c61796c6973745f6368616e6e656c223a2272676261283235352c20302c20302c20302e333529222c227363726f6c6c626172223a2223464646464646222c227363726f6c6c6261725f6267223a2272676261283235352c3235352c3235352c2e323529227d7d);

-- --------------------------------------------------------

--
-- Table structure for table `privileges`
--

DROP TABLE IF EXISTS `privileges`;
CREATE TABLE IF NOT EXISTS `privileges` (
  `id` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `description` varchar(60) DEFAULT NULL,
  `mode` varchar(8) NOT NULL,
  `type` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `privileges`
--

INSERT INTO `privileges` VALUES(1, 'manage_users', 'Manage Users', 'Permission to add/edit/delete users', 'manage', 'Users');
INSERT INTO `privileges` VALUES(2, 'manage_files', 'Manage Files', 'Permission to access File Manager', 'manage', 'Files');
INSERT INTO `privileges` VALUES(3, 'manage_pages', 'Manage Pages', 'Permission to Add/edit/delete pages', 'manage', 'Pages');
INSERT INTO `privileges` VALUES(4, 'manage_menus', 'Manage Menus', 'Permission to Add/edit and delete menus', 'manage', 'Menus');
INSERT INTO `privileges` VALUES(5, 'manage_email', 'Manage Email Templates', 'Permission to modify email templates', 'manage', 'Emails');
INSERT INTO `privileges` VALUES(6, 'manage_languages', 'Manage Language Phrases', 'Permission to modify language phrases', 'manage', 'Languages');
INSERT INTO `privileges` VALUES(7, 'manage_backup', 'Manage Database Backups', 'Permission to create backups and restore', 'manage', 'Backups');
INSERT INTO `privileges` VALUES(8, 'manage_memberships', 'Manage Memberships', 'Permission to manage memberships', 'manage', 'Memberships');
INSERT INTO `privileges` VALUES(9, 'edit_user', 'Edit Users', 'Permission to edit user', 'edit', 'Users');
INSERT INTO `privileges` VALUES(10, 'add_user', 'Add User', 'Permission to add users', 'add', 'Users');
INSERT INTO `privileges` VALUES(11, 'delete_user', 'Delete Users', 'Permission to delete users', 'delete', 'Users');
INSERT INTO `privileges` VALUES(12, 'manage_plugins', 'Manage Plugins', 'Permission to Add/Edit and delete user plugins', 'manage', 'Plugins');
INSERT INTO `privileges` VALUES(13, 'manage_fields', 'Manage Custom Fields', 'Permission to Add/Edit and delete custom fields', 'manage', 'Fields');
INSERT INTO `privileges` VALUES(14, 'manage_newsletter', 'Manage Newsletter', 'Permission to send newsletter', 'manage', 'Newsletter');
INSERT INTO `privileges` VALUES(15, 'manage_countries', 'Manage Countries', 'Permission to manage countries', 'manage', 'Countries');
INSERT INTO `privileges` VALUES(16, 'manage_coupons', 'Manage Coupons', 'Permission to Add/Edit and delete coupons', 'manage', 'Coupons');
INSERT INTO `privileges` VALUES(17, 'manage_modules', 'Manage Modules', 'Permission to manage all modules', 'manage', 'Modules');
INSERT INTO `privileges` VALUES(18, 'manage_layout', 'Manage Layouts', 'Permission to access layout manager', 'manage', 'Layout');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` smallint(4) UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `icon` varchar(20) DEFAULT NULL,
  `name` varchar(30) NOT NULL,
  `description` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` VALUES(1, 'owner', 'badge', 'Site Owner', 'Site Owner is the owner of the site, has all privileges and could not be removed.');
INSERT INTO `roles` VALUES(2, 'staff', 'trophy', 'Staff Member', 'The &#34;Staff&#34; members  is required to assist the Owner, has different privileges and may be created by Site Owner.');
INSERT INTO `roles` VALUES(3, 'editor', 'note', 'Editor', 'The "Editor" is required to assist the Staff Members, has different privileges and may be created by Site Owner.');

-- --------------------------------------------------------

--
-- Table structure for table `role_privileges`
--

DROP TABLE IF EXISTS `role_privileges`;
CREATE TABLE IF NOT EXISTS `role_privileges` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `rid` int(6) UNSIGNED NOT NULL DEFAULT '0',
  `pid` int(6) UNSIGNED NOT NULL DEFAULT '0',
  `active` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx` (`rid`,`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `role_privileges`
--

INSERT INTO `role_privileges` VALUES(1, 1, 1, 1);
INSERT INTO `role_privileges` VALUES(2, 2, 1, 1);
INSERT INTO `role_privileges` VALUES(3, 3, 1, 0);
INSERT INTO `role_privileges` VALUES(4, 1, 2, 1);
INSERT INTO `role_privileges` VALUES(5, 2, 2, 1);
INSERT INTO `role_privileges` VALUES(6, 3, 2, 1);
INSERT INTO `role_privileges` VALUES(7, 1, 3, 1);
INSERT INTO `role_privileges` VALUES(8, 2, 3, 1);
INSERT INTO `role_privileges` VALUES(9, 3, 3, 1);
INSERT INTO `role_privileges` VALUES(10, 1, 4, 1);
INSERT INTO `role_privileges` VALUES(11, 2, 4, 1);
INSERT INTO `role_privileges` VALUES(12, 3, 4, 1);
INSERT INTO `role_privileges` VALUES(13, 1, 5, 1);
INSERT INTO `role_privileges` VALUES(14, 2, 5, 1);
INSERT INTO `role_privileges` VALUES(15, 3, 5, 0);
INSERT INTO `role_privileges` VALUES(16, 1, 6, 1);
INSERT INTO `role_privileges` VALUES(17, 2, 6, 1);
INSERT INTO `role_privileges` VALUES(18, 3, 6, 1);
INSERT INTO `role_privileges` VALUES(19, 1, 7, 1);
INSERT INTO `role_privileges` VALUES(20, 2, 7, 1);
INSERT INTO `role_privileges` VALUES(21, 3, 7, 0);
INSERT INTO `role_privileges` VALUES(22, 1, 8, 1);
INSERT INTO `role_privileges` VALUES(23, 2, 8, 1);
INSERT INTO `role_privileges` VALUES(24, 3, 8, 0);
INSERT INTO `role_privileges` VALUES(25, 1, 9, 1);
INSERT INTO `role_privileges` VALUES(26, 2, 9, 1);
INSERT INTO `role_privileges` VALUES(27, 3, 9, 0);
INSERT INTO `role_privileges` VALUES(28, 1, 10, 1);
INSERT INTO `role_privileges` VALUES(29, 2, 10, 1);
INSERT INTO `role_privileges` VALUES(30, 3, 10, 0);
INSERT INTO `role_privileges` VALUES(31, 1, 11, 1);
INSERT INTO `role_privileges` VALUES(32, 2, 11, 1);
INSERT INTO `role_privileges` VALUES(33, 3, 11, 0);
INSERT INTO `role_privileges` VALUES(34, 1, 12, 1);
INSERT INTO `role_privileges` VALUES(35, 2, 12, 1);
INSERT INTO `role_privileges` VALUES(36, 3, 12, 1);
INSERT INTO `role_privileges` VALUES(37, 1, 13, 1);
INSERT INTO `role_privileges` VALUES(38, 2, 13, 1);
INSERT INTO `role_privileges` VALUES(39, 3, 13, 0);
INSERT INTO `role_privileges` VALUES(40, 1, 14, 1);
INSERT INTO `role_privileges` VALUES(41, 2, 14, 1);
INSERT INTO `role_privileges` VALUES(42, 3, 14, 0);
INSERT INTO `role_privileges` VALUES(43, 1, 15, 1);
INSERT INTO `role_privileges` VALUES(44, 2, 15, 1);
INSERT INTO `role_privileges` VALUES(45, 3, 15, 1);
INSERT INTO `role_privileges` VALUES(46, 1, 16, 1);
INSERT INTO `role_privileges` VALUES(47, 2, 16, 1);
INSERT INTO `role_privileges` VALUES(48, 3, 16, 0);
INSERT INTO `role_privileges` VALUES(49, 1, 17, 1);
INSERT INTO `role_privileges` VALUES(50, 2, 17, 1);
INSERT INTO `role_privileges` VALUES(51, 3, 17, 0);
INSERT INTO `role_privileges` VALUES(52, 1, 18, 1);
INSERT INTO `role_privileges` VALUES(53, 2, 18, 1);
INSERT INTO `role_privileges` VALUES(54, 3, 18, 0);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` tinyint(1) unsigned NOT NULL AUTO_INCREMENT,
  `site_name` varchar(100) NOT NULL,
  `company` varchar(100) NOT NULL,
  `site_dir` varchar(50) DEFAULT NULL,
  `site_email` varchar(50) NOT NULL,
  `theme` varchar(32) NOT NULL,
  `perpage` tinyint(2) unsigned NOT NULL,
  `backup` varchar(64) NOT NULL,
  `thumb_w` tinyint(3) unsigned NOT NULL,
  `thumb_h` tinyint(3) unsigned NOT NULL,
  `img_w` smallint(3) unsigned NOT NULL,
  `img_h` smallint(3) unsigned NOT NULL,
  `avatar_w` tinyint(2) unsigned NOT NULL,
  `avatar_h` tinyint(2) unsigned NOT NULL,
  `short_date` varchar(20) NOT NULL,
  `long_date` varchar(30) NOT NULL,
  `time_format` varchar(10) DEFAULT NULL,
  `dtz` varchar(120) DEFAULT NULL,
  `locale` varchar(200) DEFAULT NULL,
  `weekstart` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `lang` varchar(2) NOT NULL DEFAULT 'en',
  `lang_list` blob NOT NULL,
  `ploader` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `eucookie` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `offline` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `offline_msg` text,
  `offline_d` date DEFAULT NULL,
  `offline_t` time DEFAULT NULL,
  `offline_info` text,
  `logo` varchar(50) DEFAULT NULL,
  `plogo` varchar(50) DEFAULT NULL,
  `showlang` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `showlogin` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `showsearch` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `showcrumbs` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `currency` varchar(4) DEFAULT NULL,
  `enable_tax` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `file_size` int(4) unsigned NOT NULL DEFAULT '20971520',
  `file_ext` varchar(150) NOT NULL DEFAULT 'png,jpg,jpeg,bmp',
  `reg_verify` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `auto_verify` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `notify_admin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `flood` int(3) unsigned NOT NULL DEFAULT '3600',
  `attempt` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `logging` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `analytics` varchar(100) DEFAULT NULL,
  `mailer` enum('PHP','SMTP','SMAIL') DEFAULT NULL,
  `sendmail` varchar(60) DEFAULT NULL,
  `smtp_host` varchar(150) DEFAULT NULL,
  `smtp_user` varchar(50) DEFAULT NULL,
  `smtp_pass` varchar(50) DEFAULT NULL,
  `smtp_port` varchar(3) DEFAULT NULL,
  `is_ssl` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `inv_info` text,
  `inv_note` text,
  `system_slugs` blob,
  `url_slugs` blob,
  `social_media` blob,
  `ytapi` varchar(120) DEFAULT NULL,
  `mapapi` varchar(120) DEFAULT NULL,
  `wojon` decimal(4,2) unsigned NOT NULL DEFAULT '0.00',
  `wojov` decimal(4,2) unsigned NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `site_name`, `company`, `site_dir`, `site_email`, `theme`, `perpage`, `backup`, `thumb_w`, `thumb_h`, `img_w`, `img_h`, `avatar_w`, `avatar_h`, `short_date`, `long_date`, `time_format`, `dtz`, `locale`, `weekstart`, `lang`, `lang_list`, `ploader`, `eucookie`, `offline`, `offline_msg`, `offline_d`, `offline_t`, `offline_info`, `logo`, `plogo`, `showlang`, `showlogin`, `showsearch`, `showcrumbs`, `currency`, `enable_tax`, `file_size`, `file_ext`, `reg_verify`, `auto_verify`, `notify_admin`, `flood`, `attempt`, `logging`, `analytics`, `mailer`, `sendmail`, `smtp_host`, `smtp_user`, `smtp_pass`, `smtp_port`, `is_ssl`, `inv_info`, `inv_note`, `system_slugs`, `url_slugs`, `social_media`, `ytapi`, `mapapi`, `wojon`, `wojov`) VALUES
(1, 'CMS Pro', '', '', '', 'master', 12, '08-Mar-2019_15-10-59.sql', 150, 150, 800, 800, 250, 250, 'dd MMM yyyy', 'MMMM dd, yyyy hh:mm a', 'HH:mm', 'America/Toronto', 'en_CA', 1, 'en', 0x5b7b226964223a312c226e616d65223a22456e676c697368222c2261626272223a22656e222c226c616e67646972223a226c7472222c22636f6c6f72223a2223374143423935222c22617574686f72223a22687474703a5c2f5c2f7777772e776f6a6f736372697074732e636f6d222c22686f6d65223a317d5d, 0, 0, 0, '<p>Our website is under construction, we are working very hard to give you the best experience on our new web site.</p>', '2019-04-01', '18:00:00', '<p>Instructions for offline payments...</p>\r\n<p>Your bank name etc...</p>', 'logo.svg', 'print_logo.png', 1, 1, 1, 1, 'CAD', 0, 20971520, 'png,jpg,jpeg,bmp,zip,pdf,doc,docx,txt,mp4', 1, 1, 1, 1800, 3, 1, '', 'PHP', '/usr/sbin/sendmail -t -i', 'mail.hostname.com', 'yourusername', 'yourpass', '25', 0, '<p><b>ABC Company Pty Ltd</b><br />123 Burke Street, Toronto ON, CANADA<br />Tel : (416) 1234-5678, Fax : (416) 1234-5679, Email : sales@abc-company.com<br />Web Site : www.abc-company.com</p>', '<p>TERMS &amp; CONDITIONS<br />1. Interest may be levied on overdue accounts. <br />2. Goods sold are not returnable or refundable</p>', 0x7b0d0a20202022686f6d65223a5b0d0a2020202020207b0d0a20202020202020202022706167655f74797065223a22686f6d65222c0d0a20202020202020202022736c75675f656e223a22686f6d65222c0d0a20202020202020202022736c75675f6672223a22686f6d65220d0a2020202020207d0d0a2020205d2c0d0a202020226e6f726d616c223a5b0d0a2020202020207b0d0a20202020202020202022706167655f74797065223a226e6f726d616c222c0d0a20202020202020202022736c75675f656e223a226f75722d636f6e746163742d696e666f222c0d0a20202020202020202022736c75675f6672223a226f75722d636f6e746163742d696e666f220d0a2020202020207d0d0a2020205d2c0d0a202020226c6f67696e223a5b0d0a2020202020207b0d0a20202020202020202022706167655f74797065223a226c6f67696e222c0d0a20202020202020202022736c75675f656e223a226c6f67696e222c0d0a20202020202020202022736c75675f6672223a226c6f67696e220d0a2020202020207d0d0a2020205d2c0d0a202020227265676973746572223a5b0d0a2020202020207b0d0a20202020202020202022706167655f74797065223a227265676973746572222c0d0a20202020202020202022736c75675f656e223a22726567697374726174696f6e222c0d0a20202020202020202022736c75675f6672223a22726567697374726174696f6e220d0a2020202020207d0d0a2020205d2c0d0a202020226163746976617465223a5b0d0a2020202020207b0d0a20202020202020202022706167655f74797065223a226163746976617465222c0d0a20202020202020202022736c75675f656e223a226163746976617465222c0d0a20202020202020202022736c75675f6672223a226163746976617465220d0a2020202020207d0d0a2020205d2c0d0a202020226163636f756e74223a5b0d0a2020202020207b0d0a20202020202020202022706167655f74797065223a226163636f756e74222c0d0a20202020202020202022736c75675f656e223a2264617368626f617264222c0d0a20202020202020202022736c75675f6672223a2264617368626f617264220d0a2020202020207d0d0a2020205d2c0d0a20202022736561726368223a5b0d0a2020202020207b0d0a20202020202020202022706167655f74797065223a22736561726368222c0d0a20202020202020202022736c75675f656e223a22736561726368222c0d0a20202020202020202022736c75675f6672223a22736561726368220d0a2020202020207d0d0a2020205d2c0d0a20202022736974656d6170223a5b0d0a2020202020207b0d0a20202020202020202022706167655f74797065223a22736974656d6170222c0d0a20202020202020202022736c75675f656e223a22736974656d6170222c0d0a20202020202020202022736c75675f6672223a22736974656d6170220d0a2020202020207d0d0a2020205d2c0d0a2020202270726f66696c65223a5b0d0a2020202020207b0d0a20202020202020202022706167655f74797065223a2270726f66696c65222c0d0a20202020202020202022736c75675f656e223a2270726f66696c65222c0d0a20202020202020202022736c75675f6672223a2270726f66696c65220d0a2020202020207d0d0a2020205d2c0d0a20202022706f6c696379223a5b0d0a2020202020207b0d0a20202020202020202022706167655f74797065223a22706f6c696379222c0d0a20202020202020202022736c75675f656e223a22707269766163792d706f6c696379222c0d0a20202020202020202022736c75675f6672223a22707269766163792d706f6c696379220d0a2020202020207d0d0a2020205d0d0a7d0d0a, 0x7b0d0a202020226d6f64646972223a7b0d0a202020202020226469676973686f70223a226469676973686f70222c0d0a20202020202022626c6f67223a22626c6f67222c0d0a20202020202022706f7274666f6c696f223a22706f7274666f6c696f222c0d0a2020202020202267616c6c657279223a2267616c6c657279220d0a2020207d2c0d0a202020227061676564617461223a7b0d0a2020202020202270616765223a2270616765220d0a2020207d2c0d0a202020226d6f64756c65223a7b0d0a202020202020226469676973686f70223a226469676973686f70222c0d0a202020202020226469676973686f702d636174223a2263617465676f7279222c0d0a202020202020226469676973686f702d636865636b6f7574223a22636865636b6f7574222c0d0a20202020202022626c6f67223a22626c6f67222c0d0a20202020202022626c6f672d636174223a2263617465676f7279222c0d0a20202020202022626c6f672d736561726368223a22736561726368222c0d0a20202020202022626c6f672d61726368697665223a2261726368697665222c0d0a20202020202022626c6f672d617574686f72223a22617574686f72222c0d0a20202020202022626c6f672d746167223a22746167222c0d0a20202020202022706f7274666f6c696f223a22706f7274666f6c696f222c0d0a20202020202022706f7274666f6c696f2d636174223a2263617465676f7279222c0d0a2020202020202267616c6c657279223a2267616c6c657279222c0d0a2020202020202267616c6c6572792d616c62756d223a22616c62756d220d0a2020207d0d0a7d, 0x7b2266616365626f6f6b223a2266616365626f6f6b5f70616765222c2274776974746572223a22747769747465725f70616765227d, 'AIzaSyAqlXS1Kd8u42l4pOm_geud-HZZqxl_N5k', 'AIzaSyAbflOjxx-oxzmV35LCHFb7NeBBs7wQDbA', '1.20', '5.10');

-- --------------------------------------------------------

--
-- Table structure for table `stats`
--

DROP TABLE IF EXISTS `stats`;
CREATE TABLE IF NOT EXISTS `stats` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `day` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `pageviews` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `uniquevisitors` int(11) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `trash`
--

DROP TABLE IF EXISTS `trash`;
CREATE TABLE IF NOT EXISTS `trash` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent` varchar(15) DEFAULT NULL,
  `parent_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `type` varchar(15) DEFAULT NULL,
  `dataset` blob,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `fname` varchar(32) NOT NULL,
  `lname` varchar(32) NOT NULL,
  `email` varchar(60) NOT NULL,
  `membership_id` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `mem_expire` datetime DEFAULT NULL,
  `trial_used` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `memused` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `salt` varchar(25) NOT NULL,
  `hash` varchar(70) NOT NULL,
  `token` varchar(40) NOT NULL DEFAULT '0',
  `userlevel` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `type` varchar(10) NOT NULL DEFAULT 'member',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastlogin` datetime DEFAULT NULL,
  `lastip` varbinary(16) DEFAULT '000.000.000.000',
  `avatar` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `country` varchar(4) DEFAULT NULL,
  `notify` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `access` text,
  `notes` tinytext,
  `info` tinytext,
  `fb_link` varchar(100) DEFAULT NULL,
  `tw_link` varchar(100) DEFAULT NULL,
  `gp_link` varchar(100) DEFAULT NULL,
  `newsletter` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `stripe_cus` varchar(100) DEFAULT NULL,
  `modaccess` varchar(150) DEFAULT NULL,
  `plugaccess` varchar(150) DEFAULT NULL,
  `active` enum('y','n','t','b') NOT NULL DEFAULT 'n',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_memberships`
--

DROP TABLE IF EXISTS `user_memberships`;
CREATE TABLE IF NOT EXISTS `user_memberships` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tid` int(11) unsigned NOT NULL DEFAULT '0',
  `uid` int(11) unsigned NOT NULL DEFAULT '0',
  `mid` int(11) unsigned NOT NULL DEFAULT '0',
  `activated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `expire` timestamp NULL DEFAULT NULL,
  `recurring` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0 = expired, 1 = active',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `pages` ADD FULLTEXT KEY `idx_search` (`title_en`,`body_en`);