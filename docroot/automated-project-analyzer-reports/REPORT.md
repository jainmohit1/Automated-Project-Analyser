
### Screencast - [Click here](https://youtu.be/FN0RRQHoxpg)


## Problem: The problem project addressed

A good project is something which can be understood, maintained and extended by other developers. It is therefore essential for a developer or project manager to conform to the project standards.

There are following issues a developer has to face: 
1. Maintaining code standards
2. Code duplication in the project
3. Compile/runtime errors and warnings in the code files
4. Refactoring in the project

The developer has to maintain the coding standards of the language being used and should know whether code developed by him/her follows the correct conventions. Code duplication results in redundancy and increases project maintenance cost. This will make it cumbersome for other developers to understand the project. Moreover, it becomes difficult to manage the code if it’s not readable by other developers. Therefore, the developer should know regarding the correct refactoring and how much refactoring needs to be done in the code he/she developed.

Currently, there is no one central point of view available to the team which can help them understand and visualize the above issues in the project. Maintaining project standard is an essential part of the project to make the code more readable for other developers and the manager. 


## Features: Primary features with screenshots

### Use Case #1 Fetch and process data from GitHub repositor

#### Implementation:
1) User can enter Github username, Github repository name, and Activation key in the UI (http://csc-se.lc:82) and click on Populate Database button.
![Initial screen](https://github.ncsu.edu/apareek2/csc510-project/blob/master/docroot/automated-project-analyzer-reports/images/initialize_screen.png)
2) In the back end we use GitHub API (https://api.github.com/repos/{}/{}/branches) to select all the branches of the repository and check if we get any branch or not. If we are getting a branch list then we assume that the information provided by the user is correct. Otherwise we show the following message to user: "Please enter correct credentials".
3) If the user enters correct information we then download entire repository and run Pylint to get all the desired information. 
4) The results of running pylint is store in a temporary folder "downloaded_data". 
5) We then parse the whole cloned repository and check error metrics, code compliance, code duplication using pylint APIs.
6) Re-populate the database using automated job schedular set using cron-job which runs at 5am everyday.

### Use Case #2 Viewing graphs for metrics 

#### Implementation:
We are using Tableau to show all our visualization.
![Tableau login screen](https://github.ncsu.edu/apareek2/csc510-project/blob/master/docroot/automated-project-analyzer-reports/images/tableau_login_screen.png)
![Tableau main screen](https://github.ncsu.edu/apareek2/csc510-project/blob/master/docroot/automated-project-analyzer-reports/images/tableau_main_screen.png)
1) For Code Metrics we join file_info and file_metrics table to get all the information from the DB to show up in Tableau. We show code, empty, docstring and comment percentage of individual file. Data regarding the file is genetared via Pylint. Pylint is a source-code, bug and quality checker for the Python programming language. Information given after running Pylint on each and every python file in GitHub is stored in a temporary folder called downloaded_data and then we read the desired information from the files within the same folder to store in a DB table called file_metrics and file_info.
![Tableau main screen](https://github.ncsu.edu/apareek2/csc510-project/blob/master/docroot/automated-project-analyzer-reports/images/tableau_code_metrics.png)
2) For Error Metrics we join file_info, error_code_details and error_info table to get all the information from the DB to show up in Tableau. We show number of Convention, Error, Warning, Refactor presented by the Pylint for the entire project . Data regarding the project is genetared via Pylint. Information given after running Pylint on the entire project on GitHub is stored in a temporary folder name called downloaded_data and then we read the desired information to store in a DB table called file_info, error_code_details and error_info.
![Tableau main screen](https://github.ncsu.edu/apareek2/csc510-project/blob/master/docroot/automated-project-analyzer-reports/images/tableau_error_metric_screen.png)
3) For Code duplication Metrics we use information from the table duplicate_info to show graph in Tableau. We are showing number of duplicated lines and percentage of duplicated lines in the entire repository. Note: It is not per file based as the code can be duplicated in different files as well, for example - a method can be copied in various files. Again to get the data about duplication we run pylint on the entire repository and store the output data in a temporary folder name called downloaded_data. We parse the files inside the folder to fetch the required information.
![Tableau main screen](https://github.ncsu.edu/apareek2/csc510-project/blob/master/docroot/automated-project-analyzer-reports/images/tableau_code_duplication_screen.png)
4) For calculating and showing individual error/convention/warning/refactor types we are using a meta data table called error_code_details. This table is populated with the error code given by the pylint. We got the data from their document and populated using sql scripts. This population is one time work as we would be needing this table data to match the error code we get after running pylint for any file and showing the various description on the graph.

### Use Case #3 Report generation

#### Implementation:

We utilize Tableau Online to generate reports. We can generate reports either for particular worksheet or for the entire workbook. When generating the report the Tableau gives options of either generating a PDF, image, powerpoint, tableau workbook etc. By clicking the download button we can generate and save the report.

![Tableau download report screen](https://github.ncsu.edu/apareek2/csc510-project/blob/master/docroot/automated-project-analyzer-reports/images/tableau_download_report.png)

## Reflection: Your reflection on the development process and project
1. Team held multiple meetings and decided our project topic which is to build an "Automated project analyzer"
2. Decided the problem statement which could justify the project. 
    1. We analyzed several libraries (pyflakes, pylint, pycodestyle, mccabe) to achieve our objective
    2. We agreed upon the use of pylint in whole project which provide all the functionality in one package.
3. Thought of developing following functionalities but failed to implement it due to some difficulties.
    1. Code coverage: This functionality could not be implemented due to the lack of pylint which were unable to give us code coverage.
    2. UML diagrams: Automate the UML the diagram using pylint's internal method pyreverse but this functionality was not under the scope of our project so decide to leave it out of the project.
    3. Jenkins and Ansible: We decided to automate our deployement using Jenkins and this application could have been more scable using Ansible but due to time constraints these requirement were cutoff as they were not progress blocker.
4. Challenges faced by team during development.
    1. Pylint's API outputs a text blob which we had to save in a separate file and then parse it using regex to retrieve essential information.
    2. Integrating our own UI with tableau, we had the option to make a web window inside tableau from where we could have access our flask UI to input user credentials and the other option was to redirect from our UI to tableau once user validates its credentials on our flask UI. We choose to go with second option but this created a non-smooth experience.
5. Test cases.
    1. During the development of our project we followed funcitonal testing through the project
6. Deployment.
    1. Ubuntu 16.04 server is used to host our project
    2. Apache2 server is used to server our project.
    2. Docker is used to containerize our project codebase.
7. Automation.
    1. We developed a cron job to automatically pull updated data from registered github repository with an interval of 24 hours.

## Limitations: Any limitations and future work

Our project has the following limitations which could be improved in the future.

1. The project currently works on the repository with the Python files. We have used Pylint library which runs only on Python code. In the future, we can incorporate libraries for different programming languages as well.
2. Due to the time constraint, we only implemented the number of errors and warnings in the file but it would be useful for the project manager to know these metrics per developer.
3. The project is limited to analyze only a single Github repository. We can extend it to analyze multiple Github repository.
4. Our project doesn’t calculate the percentage of code covered by the test cases.
5. We can extend our project to include a UML diagram of the entire project so that the project manager and developer know the architecture and it would be easy for them to proceed.
6. In the future, continuous integration and continuous deployment can be implemented. We can integrate it with Jenkins and write Ansible scripts to automate certain processes.

