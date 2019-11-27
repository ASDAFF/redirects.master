CREATE TABLE IF NOT EXISTS `s2u_redirects_rules` (
    `ID` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `SITE_ID` CHAR(2) NOT NULL,
    `OLD_LINK` VARCHAR(255) NOT NULL,
    `NEW_LINK` VARCHAR(255) NOT NULL,
    `STATUS` SMALLINT(11) UNSIGNED NOT NULL DEFAULT '301',
    `DATE_TIME_CREATE` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `COMMENT` VARCHAR(255) NOT NULL,
    `ACTIVE` CHAR(1) NOT NULL DEFAULT 'N',
    `WITH_INCLUDES` CHAR(1) NOT NULL DEFAULT 'N',
	`USE_REGEXP` CHAR(1) NOT NULL DEFAULT 'N',
    PRIMARY KEY (`ID`),
    INDEX `date_time` (`DATE_TIME_CREATE`),
    INDEX `main_index` (`SITE_ID`, `ACTIVE`, `OLD_LINK`)
);

CREATE TABLE IF NOT EXISTS `s2u_redirects_404` (
    `ID` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    `SITE_ID` CHAR(2) NOT NULL,
    `URL` TEXT NOT NULL,
    `REFERER_URL` TEXT NOT NULL,
    `REDIRECT_STATUS` VARCHAR(32) NOT NULL,
    `DATE_TIME_CREATE` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `GUEST_ID` INT(18) NOT NULL,
    PRIMARY KEY (`ID`),
    INDEX `site-url` (`SITE_ID`, `URL`(100))
);

CREATE TABLE IF NOT EXISTS `s2u_redirects_404_ignore` (
	`ID` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
	`SITE_ID` CHAR(2) NOT NULL,
	`OLD_LINK` TEXT NOT NULL,
	`DATE_TIME_CREATE` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`COMMENT` VARCHAR(255) NOT NULL,
	`ACTIVE` CHAR(1) NOT NULL DEFAULT 'N',
	`WITH_INCLUDES` CHAR(1) NOT NULL DEFAULT 'N',
	PRIMARY KEY (`ID`),
	INDEX `date_time` (`DATE_TIME_CREATE`),
	INDEX `main_index` (`SITE_ID`, `ACTIVE`, `OLD_LINK`(255))
)