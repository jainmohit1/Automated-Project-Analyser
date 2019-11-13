
CREATE TABLE `file_metrics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_info_id` int(11) NOT NULL,
  `code_percentage` int(11) NOT NULL DEFAULT '0',
  `docstring_percentage` int(11) NOT NULL DEFAULT '0',
  `comment_percentage` int(11) NOT NULL DEFAULT '0',
  `empty_percenage` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `file_id_idx` (`file_info_id`),
  CONSTRAINT `file_info_id` FOREIGN KEY (`file_info_id`) REFERENCES `file_info` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1


ALTER TABLE `csc_se`.`file_metrics` 
DROP FOREIGN KEY `file_info_id`;
ALTER TABLE `csc_se`.`file_metrics` 
CHANGE COLUMN `id` `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Id of the table.' ,
CHANGE COLUMN `file_info_id` `file_info_id` INT(11) NOT NULL COMMENT 'Foreign Key of the table file info.' ,
CHANGE COLUMN `code_percentage` `code_percentage` INT(11) NOT NULL DEFAULT '0' COMMENT 'Volume of the Code written.' ,
CHANGE COLUMN `docstring_percentage` `docstring_percentage` INT(11) NOT NULL DEFAULT '0' COMMENT 'Volume of the docstring written.' ,
CHANGE COLUMN `comment_percentage` `comment_percentage` INT(11) NOT NULL DEFAULT '0' COMMENT 'Volume of the comment written.' ,
CHANGE COLUMN `empty_percenage` `empty_percenage` INT(11) NOT NULL DEFAULT '0' COMMENT 'Volume of the empty written.' ;
ALTER TABLE `csc_se`.`file_metrics` 
ADD CONSTRAINT `file_info_id`
  FOREIGN KEY (`file_info_id`)
  REFERENCES `csc_se`.`file_info` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `csc_se`.`file_metrics` 
ADD COLUMN `created_at` DATETIME NOT NULL AFTER `empty_percenage`,
ADD COLUMN `updated_at` VARCHAR(45) NULL DEFAULT NULL AFTER `created_at`;

ALTER TABLE `csc_se`.`file_metrics` 
CHANGE COLUMN `empty_percenage` `empty_percentage` INT(11) NOT NULL DEFAULT '0' ;

