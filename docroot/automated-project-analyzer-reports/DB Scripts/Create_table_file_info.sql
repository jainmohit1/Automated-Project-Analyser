CREATE TABLE `csc_se`.`file_info` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `file_name` VARCHAR(500) NOT NULL,
  `file_type` VARCHAR(45) NOT NULL,
  `file_path` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `file_path_UNIQUE` (`file_path` ASC));


ALTER TABLE `csc_se`.`file_info` 
DROP INDEX `id_UNIQUE` ,
ADD UNIQUE INDEX `id_UNIQUE` (`file_name` ASC, `file_path` ASC, `file_type` ASC),
DROP INDEX `file_path_UNIQUE` ;
;

ALTER TABLE `csc_se`.`file_info` 
CHANGE COLUMN `id` `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Id of the table.' ,
CHANGE COLUMN `file_name` `file_name` VARCHAR(500) NOT NULL COMMENT 'File name.' ,
CHANGE COLUMN `file_type` `file_type` VARCHAR(45) NOT NULL COMMENT 'File Type' ,
CHANGE COLUMN `file_path` `file_path` VARCHAR(45) NOT NULL COMMENT 'Path of the file in GitHub.' ;

ALTER TABLE `csc_se`.`file_info` 
ADD COLUMN `created_at` DATETIME NOT NULL AFTER `file_path`,
ADD COLUMN `updated_at` VARCHAR(45) NULL DEFAULT NULL AFTER `created_at`;

ALTER TABLE `csc_se`.`file_info` 
CHANGE COLUMN `file_path` `file_path` VARCHAR(200) NOT NULL COMMENT 'Path of the file in GitHub.' ;



