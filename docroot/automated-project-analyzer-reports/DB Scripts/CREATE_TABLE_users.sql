CREATE TABLE `csc_se`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_name` VARCHAR(200) NULL,
  `email` VARCHAR(45) NULL,
  `activation_key` VARCHAR(255) NULL,
  `repository` VARCHAR(255) NULL,
  PRIMARY KEY (`id`));
