### Use Case Refinement

#### Use Case 1: Fetch and process data from GitHub repository.
    1) Preconditions: User must be on the page http://csc-se.lc.
    
    2) Main Flow
        a) The repository administrator will be able to put GitHub repo details along with github_username, github_repository, github_activation_key, and email_id and fetch the GitHub.
        b) Click the “Populate Database” button to submit details to flask backend and verify the submitted details.
        c) Once it validates the GitHub details, the script will fetch all files from GitHub and stores them in a specified location.
        d) After all the files are stored, the Pylint is run over the stored files to fetch the gist out of it.
    3) Alternative Flows: [E1] If the user has not submitted correct information (for ex: incorrect github_username or github_repository or activation_key) then an error message will be displayed to the user saying “Incorrect credentials” or else “Success” message will be displayed.
    
#### Use Case 2: Viewing graphs for metrics
    1) Preconditions: User must be logged in to the system and must be on the first dashboard screen.
    2) Main Flow:
        a) The user will be able to navigate to three tabs which consist following metrics (Error Metrics, Code Metrics, Code duplication Metrics)
        b) The user may navigate to error metrics to view the amount of errors/warnings/ refactor / convention_issues etc in the whole project on the left side of the screen in each tab.
        c) The user can then observe the detailed errors/warnings/ refactor / convention_issues for each file on the right side of the same screen which will be a separate section on the screen.
    3) Alternative Flows: [E1] If the data in the repository is not sufficient to generate graphs then empty graphs will be shown.
    
#### Use Case 3: Report generation
    1) Preconditions: User must be logged in to the system and must have at least view permission.
    2) Main Flow:
        a) Click any metric tab among (errors/warnings/refactor/convention_issues).
        b) The user will be able to generate and download report of each corresponding metric (errors/warnings/refactor/convention_issues) by clicking the download button.
    3) Alternative Flows: [E1] If the intention is to share the live webpage of the metric a share button will serve a shareable link which can be emailed to anyone with access to this account.


### Mocking Stratergy

1) We are using stub data (data inserted using DB scripts) to create graphs in Tableau.
2) We have created MySQL database schema (remote server - http://206.189.202.188/) which is connected from Tableau. 
3) Tableau uses the various tables and columns in the table to create informative graphical interaction. Below are the list of graphs and tables used for them.
    
    a) Error Metrics - Here we are showing number of errors and type of errors found in the code. We have inserted data in error_info, error_code_details, file_info table and using that data from Tableau to draw various graphs.
    
    b) Code Metrics - Here we are showing various code metrics such as percentage of code written in the file, percentage of docstring in the file, percentage of comments in the file etc. We have inserted data in file_metrics, file_info table and using that data from Tableau to draw various graphs.
    
    c) Code Duplication - Here we are showing duplicated lines and duplicated line percentage of the entire project. We have inserted data in duplicate_info table and using that data from Tableau to draw the graph.
    
4) Currently, we are using MySQL scripts to populate data in the tables which is being utilized by Tableau. DB Scripts can be found [here](https://github.ncsu.edu/apareek2/csc510-project/tree/master/automated-project-analyzer-reports/DB%20Scripts)
5) Below are the Table Schema architecture:
  
    a) `duplicate_info`
  
          `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id of the table',

          `number_of_duplicate_lines` int(11) NOT NULL DEFAULT '0' COMMENT 'Number of duplicate lines in the file/directory.',

          `percentage_of_duplicate_lines` int(11) NOT NULL DEFAULT '0' COMMENT 'Percentage of duplicate lines in the                     
           files/directory',

           `created_at` datetime NOT NULL,

           `updated_at` datetime DEFAULT NULL,

           PRIMARY KEY (`id`),

           UNIQUE KEY `id_UNIQUE` (`id`)
      
    b)  `error_code_details` 
  
          `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id of the table',

          `error_code` varchar(45) NOT NULL COMMENT 'error code as mentioned in PyLint Library.',

          `error_code_description` varchar(200) DEFAULT NULL COMMENT 'error code description of the error code in PyLint                Library.',

          `error_category` varchar(45) NOT NULL COMMENT 'Error code category. Should be either of these 4: Convention,                Refactor, Error, Warning ',

          `created_at` datetime NOT NULL,

          `updated_at` datetime DEFAULT NULL,

           PRIMARY KEY (`id`),

           UNIQUE KEY `id_UNIQUE` (`id`),

           UNIQUE KEY `error_code_UNIQUE` (`error_code`)
      
    c)  `error_info`
  
          `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id of the table.',

          `error_code_detail_id` int(11) DEFAULT NULL COMMENT 'Foreign Key to error code details table.',

          `file_id` int(11) DEFAULT NULL COMMENT 'Foreign key to file info table.',

          `created_at` datetime NOT NULL,

          `updated_at` datetime DEFAULT NULL,

           PRIMARY KEY (`id`),

           UNIQUE KEY `id_UNIQUE` (`id`),

           KEY `error_code_detail_id_idx` (`error_code_detail_id`),

           KEY `file_id_idx` (`file_id`),

           CONSTRAINT `error_code_detail_id` FOREIGN KEY (`error_code_detail_id`) REFERENCES `error_code_details` (`id`) ON            
           DELETE NO ACTION ON UPDATE NO ACTION,

           CONSTRAINT `file_id` FOREIGN KEY (`file_id`) REFERENCES `file_info` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION

    d)  `file_info`
  
          `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id of the table.',

          `file_name` varchar(500) NOT NULL COMMENT 'File name.',

          `file_type` varchar(45) NOT NULL COMMENT 'File Type',

          `file_path` varchar(45) NOT NULL COMMENT 'Path of the file in GitHub.',

          `created_at` datetime NOT NULL,

          `updated_at` datetime DEFAULT NULL,

           PRIMARY KEY (`id`),

           UNIQUE KEY `id_UNIQUE` (`file_name`,`file_path`,`file_type`)
       
    e)  `file_metrics`
      
          `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id of the table.',

          `file_info_id` int(11) NOT NULL COMMENT 'Foreign Key of the table file info.',

          `code_percentage` int(11) NOT NULL DEFAULT '0' COMMENT 'Volume of the Code written.',

          `docstring_percentage` int(11) NOT NULL DEFAULT '0' COMMENT 'Volume of the docstring written.',

          `comment_percentage` int(11) NOT NULL DEFAULT '0' COMMENT 'Volume of the comment written.',

          `empty_percenage` int(11) NOT NULL DEFAULT '0' COMMENT 'Volume of the empty written.',

          `created_at` datetime NOT NULL,

          `updated_at` datetime DEFAULT NULL,

           PRIMARY KEY (`id`),

           UNIQUE KEY `id_UNIQUE` (`id`),

           KEY `file_id_idx` (`file_info_id`),

           CONSTRAINT `file_info_id` FOREIGN KEY (`file_info_id`) REFERENCES `file_info` (`id`) ON DELETE NO ACTION ON UPDATE NO        
           ACTION
           
           
### Portal Implementation

Designed Pylint API’s to implement the desired functionality to get the details from the user github repository. The data is stored in a MySQL database which is then accessed by Tableau to display the data visually by use of different kinds of graphs.

#### Library Used:

1) Flask: Flask library of python is implemented to create a single webpage.

2) PyLint: Pylint checks for the errors, refactor, convention, warnings(C/R/E/W) in a file and in the code repository. We have leveraged the pylint functionality to check for the code duplication and it will output the percentage of code duplication. We have implemented the code coverage feature of pylint as well. This feature will help the developer/manager to get an overview of the how much of the code is covered by the test cases.

3) Requests: Used Requests library which is used to send REST API request to user Github repository. 

4) OS: Used Os library to run the commands from the Python script code instead of command line.

5) UnitTest: Written test cases to test the functionality of Python code.

#### MySQL:
MySQL is implemented to store the outcome of Pylint on the speciied github code repository such as errors / warnings / refactor / convention_issues metrics, results of code duplications in whole project and unit test case coverage over whole code repository and individual files.

#### Tableau:
Tableau connects with MySQL using ODBC drivers to the mysql server hosted on a digitalocean server (206.189.202.188). It then displays (bar graphs, pie charts) related to errors / warnings / refactor / convention_issues metrics, code duplications metrics and the amount of code covered by test cases.

#### Architecture:
1) MySQL database connection object will be implemented using singleton pattern.
2) Every time a CRUD (create/read/update/delete) db operation occurs in a single request then the system will use the same connection object instead of creating an object everytime.

#### Following are the API’s which are designed to give the desired output:

1) getFileNames(URL):
    This API will return a list of all the python code(.py) files in the repository. Functionality implemented using Github REST API.
2) checkValidUrl(URL):
    This API will check if the URL entered by the user is valid or not by returning True/False.
3) getRepo(URL):
    This function will download the user repository on the server machine by using OS library.
4) runCREWFile(filename):
    This function runs the pylint command on a particular file to calculate C/R/E/W and store that in the file.
5) runCREWRepo(repo):
    This function runs the pylint command on the repository to calculate C/R/E/W and store that in the file.
6) getWarningCount(filename):
    This function returns the warning count from the pylint output file.
7) getErrorCount(filename):
    This function returns the error count from the pylint output file.
8) getConventionCount(filename):
    This function returns the convention count from the pylint output file.
9) getRefactorCount(filename):
    This function returns the refactor count from the pylint output file.
10) getConventionDict(filename):
    This API returns the count of convention for each convention type.
11) getRefactorDict(filename):
    This API returns the count of refactor for each refactor type.
12) getErrorDict(filename):
    This API returns the count of error for each error type.
13) getWarningDict(filename):
    This API returns the count of warning for each warning type.
14) runDupFile(filename):
    This API runs the pylint command for duplication on a particular file and store output in a file.
15) runDupRepo():
    This API runs the pylint command for duplication on the entire repository and store output in a file.
16) getCodePercentage(filename):
    This API returns the percentage of code present in the file.
17) getDocStringPercentage(filename):
    This API returns the percentage of docstring present in the file.
18) getCommentPercentage(filename):
    This API returns the percentage of comments present in the file.
19) getEmptyPercentage(filename):
    This API returns the percentage of empty lines present in the file.
20) getNumberDuplication(filename):
    This API returns the number of duplication lines from the pylint output.
21) getPercentDuplication(filename):
    This API returns the percentage of duplication from the pylint output.
22) doCodeCoverageFile(filename):
    This API runs the pylint command for code coverage on a file and store output in a file.
23) doCodeCoverageRepo():
    This API runs the pylint command for code coverage on a repository and store output in a file.
24) getTotalCodeCoverage(filename):
    This API returns the total code coverage in the repository.


Worksheet: [Click here](https://github.ncsu.edu/apareek2/csc510-project/blob/master/docroot/automated-project-analyzer-reports/WORKSHEET.md)

Screencast: [Click here](https://www.youtube.com/watch?v=GBTT_CYv5xo&feature=youtu.be)

Setup: Please make the following entry in hosts file of your system.
Location of host file in mac/linux: /etc/hosts and in windows: c:\Windows\System32\Drivers\etc\hosts

    206.189.202.188 csc-se.lc

Open in browser: http://csc-se.lc:82 to access the dashboard
