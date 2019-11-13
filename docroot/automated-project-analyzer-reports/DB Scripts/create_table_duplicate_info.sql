CREATE TABLE `csc_se`.`duplicate_info` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `number_of_duplicate_lines` INT NOT NULL DEFAULT 0,
  `percentage_of_duplicate_lines` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC));


ALTER TABLE `csc_se`.`duplicate_info` 
CHANGE COLUMN `id` `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Id of the table' ,
CHANGE COLUMN `number_of_duplicate_lines` `number_of_duplicate_lines` INT(11) NOT NULL DEFAULT '0' COMMENT 'Number of duplicate lines in the file/directory.' ,
CHANGE COLUMN `percentage_of_duplicate_lines` `percentage_of_duplicate_lines` INT(11) NOT NULL DEFAULT '0' COMMENT 'Percentage of duplicate lines in the files/directory' ;

ALTER TABLE `csc_se`.`duplicate_info` 
ADD COLUMN `created_at` DATETIME NOT NULL AFTER `percentage_of_duplicate_lines`,
ADD COLUMN `updated_at` DATETIME NULL DEFAULT NULL AFTER `created_at`;
