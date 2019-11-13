# Deployment

## Webapp direcotry contains docker configuration files, apache2 vhost and logs.

## Directory Information

### Configuration
 - apache2
  - This directory contains virtual hosts for the app.

### logs
 - All the logs are saved into this directory.

## How to use
### Build Docker Image
 - docker build -t csc510 .
 - docker images
 - docker tag <id> abprk/csc510:latest
 - docker push abprk/csc510:latest

### Docker Operations
 - docker images
 - docker container ls
 - docker container ls -a
 - docker-compose down
 - docker-compose up -d
 - docker exec -it webapp_api_1 bin/bash

### Remove/Prune docker images/containers
 - docker system prune
 - docker container stop <id>
 - docker container prune
 - docker image prune -a
 - docker container rm <id>
 - docker rm <id>
 - docker rmi <id>

### Docroot
 - There is a directory called docroot in the repo, the main business logic resides in that directory.

### Data Ingest/Update (Portal)
 ##### We are storing all the data in Database. There are various tables as follows:
 1) duplicate_info - This tables stores information about duplication of the entire project.
 2) error_code_details - This is the meta data table which contains information regarding Pylint error codes.
 3) error_info - This table contains information regarding the error information for each file.
 4) file_info - This table contains information about each Python files in the repository.
 5) file_info - This table contains information about each files code percentage, empty percentage, comment percentage etc.
 5) users - This table contains information about all the users who came to the system.
 
 ##### We are using Tableau to show all our visualization.
1) For Code Metrics we join file_info and file_metrics table to get all the information from the DB to show up in Tableau. We show code, empty, docstring and comment percentage of individual file. Data regarding the file is genetared via Pylint. Pylint is a source-code, bug and quality checker for the Python programming language. Information given after running Pylint on each and every python file in GitHub is stored in a temporary folder called downloaded_data and then we read the desired information from the files within the same folder to store in a DB table called file_metrics and file_info.
2) For Error Metrics we join file_info, error_code_details and error_info table to get all the information from the DB to show up in Tableau. We show number of Convention, Error, Warning, Refactor presented by the Pylint for the entire project . Data regarding the project is genetared via Pylint. Information given after running Pylint on the entire project on GitHub is stored in a temporary folder name called downloaded_data and then we read the desired information to store in a DB table called file_info, error_code_details and error_info.
3) For Code duplication Metrics we use information from the table duplicate_info to show graph in Tableau. We are showing number of duplicated lines and percentage of duplicated lines in the entire repository. Note: It is not per file based as the code can be duplicated in different files as well.For example - a method can be copied in various files. Again to get the data about duplication we run pylint on the entire repository and store the output data in a temporary folder name called downloaded_data. We parse the files inside the folder to fetch the required information.
4) For calculating and showing individual error/convention/warning/refactor types we are using a meta data table called error_code_details. This table is populated with the error code given by the pylint. We got the data from their document ans populated using sql scripts. This population is one time work as we would be needing this table data to match the error code we get after running pylint for any file and showing the various description on the graph.

##### Auto-refresh of data:
We have written a cron expression which runs once a day to fetch the latest content from the Github repo and update the database with the new data included. 
 

### Worksheet: [Click here](https://github.ncsu.edu/apareek2/csc510-project/blob/master/docroot/automated-project-analyzer-reports/WORKSHEET3.md)

### Screencast - [Click here](https://youtu.be/Im2C__e2o7U)
