INSERT INTO `csc_se`.`error_info` (`error_code_detail_id`) VALUES ('1');
UPDATE `csc_se`.`error_info` SET `file_id` = '1' WHERE (`id` = '1');

INSERT INTO `csc_se`.`error_info` (`error_code_detail_id`) VALUES ('2');
INSERT INTO `csc_se`.`error_info` (`error_code_detail_id`) VALUES ('1');
INSERT INTO `csc_se`.`error_info` (`error_code_detail_id`) VALUES ('3');
INSERT INTO `csc_se`.`error_info` (`error_code_detail_id`) VALUES ('4');
INSERT INTO `csc_se`.`error_info` (`error_code_detail_id`, `file_id`) VALUES ('2', '4');
INSERT INTO `csc_se`.`error_info` (`error_code_detail_id`) VALUES ('3');

UPDATE `csc_se`.`error_info` SET `file_id` = '4' WHERE (`id` = '7');

UPDATE `csc_se`.`error_info` SET `error_code_detail_id` = '3' WHERE (`id` = '3');
UPDATE `csc_se`.`error_info` SET `error_code_detail_id` = '4' WHERE (`id` = '4');
UPDATE `csc_se`.`error_info` SET `error_code_detail_id` = '5' WHERE (`id` = '5');
UPDATE `csc_se`.`error_info` SET `error_code_detail_id` = '6' WHERE (`id` = '6');
UPDATE `csc_se`.`error_info` SET `error_code_detail_id` = '7' WHERE (`id` = '7');
INSERT INTO `csc_se`.`error_info` (`error_code_detail_id`, `file_id`) VALUES ('8', '1');


