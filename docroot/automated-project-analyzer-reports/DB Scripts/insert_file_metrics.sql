INSERT INTO `csc_se`.`file_metrics` (`file_info_id`, `code_percentage`, `docstring_percentage`, `comment_percentage`, `empty_percenage`) VALUES ('1', '30', '20', '30', '20');
INSERT INTO `csc_se`.`file_metrics` (`file_info_id`, `code_percentage`, `docstring_percentage`, `comment_percentage`, `empty_percenage`) VALUES ('4', '40', '10', '25', '25');
INSERT INTO `csc_se`.`file_metrics` (`file_info_id`, `code_percentage`, `docstring_percentage`, `comment_percentage`) VALUES ('5', '60', '10', '10');
UPDATE `csc_se`.`file_metrics` SET `empty_percenage` = '10' WHERE (`id` = '3');
