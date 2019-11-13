CREATE TABLE `csc_se`.`error_code_details` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `error_code` VARCHAR(45) NOT NULL,
  `error_code_description` VARCHAR(200) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `error_code_UNIQUE` (`error_code` ASC));


ALTER TABLE `csc_se`.`error_code_details` 
ADD COLUMN `error_category` VARCHAR(45) NOT NULL AFTER `error_code_description`;


ALTER TABLE `csc_se`.`error_code_details` 
CHANGE COLUMN `id` `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Id of the table' ,
CHANGE COLUMN `error_code` `error_code` VARCHAR(45) NOT NULL COMMENT 'error code as mentioned in PyLint Library.' ,
CHANGE COLUMN `error_code_description` `error_code_description` VARCHAR(200) NULL DEFAULT NULL COMMENT 'error code description of the error code in PyLint Library.' ,
CHANGE COLUMN `error_category` `error_category` VARCHAR(45) NOT NULL COMMENT 'Error code category. Should be either of these 4:  Convention, Refactor, Error, Warning ' ;
