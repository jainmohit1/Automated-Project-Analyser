CREATE TABLE `csc_se`.`error_info` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `error_code_detail_id` INT NULL,
  `file_id` INT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `error_code_detail_id_idx` (`error_code_detail_id` ASC),
  INDEX `file_id_idx` (`file_id` ASC),
  CONSTRAINT `error_code_detail_id`
    FOREIGN KEY (`error_code_detail_id`)
    REFERENCES `csc_se`.`error_code_details` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `file_id`
    FOREIGN KEY (`file_id`)
    REFERENCES `csc_se`.`file_info` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


ALTER TABLE `csc_se`.`error_info` 
DROP FOREIGN KEY `error_code_detail_id`,
DROP FOREIGN KEY `file_id`;
ALTER TABLE `csc_se`.`error_info` 
CHANGE COLUMN `id` `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Id of the table.' ,
CHANGE COLUMN `error_code_detail_id` `error_code_detail_id` INT(11) NULL DEFAULT NULL COMMENT 'Foreign Key to error code details table.' ,
CHANGE COLUMN `file_id` `file_id` INT(11) NULL DEFAULT NULL COMMENT 'Foreign key to file info table.' ;
ALTER TABLE `csc_se`.`error_info` 
ADD CONSTRAINT `error_code_detail_id`
  FOREIGN KEY (`error_code_detail_id`)
  REFERENCES `csc_se`.`error_code_details` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `file_id`
  FOREIGN KEY (`file_id`)
  REFERENCES `csc_se`.`file_info` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
