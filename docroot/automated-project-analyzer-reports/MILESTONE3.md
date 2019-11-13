### Use Case #1 Fetch and process data from GitHub repositor

#### Implementation:
1) User can enter Github username, Github repository name, and Activation key in the UI (http://csc-se.lc/) and click on Populate Database button.
2) In the back end we use GitHub API (https://api.github.com/repos/{}/{}/branches) to select all the branches of the repository and check if we get any branch or not. If we are getting a branch list then we assume that the information provided by the user is correct. Otherwise we show the user that "Please enter correct credentials".
3) If the user enters correct information we then download entire repository and run Pylint to get all the desired information. 
4) The results of running pylint is store in a temporary folder "downloaded_data". 
5) We then parse the files according to the feature set desired or according to the DB operations we are doing at a particular moment. 

### Use Case #2 Viewing graphs for metrics 

#### Implementation:
We are using Tableau to show all our visualization.
1) For Code Metrics we join file_info and file_metrics table to get all the information from the DB to show up in Tableau. We show code, empty, docstring and comment percentage of individual file. Data regarding the file is genetared via Pylint. Pylint is a source-code, bug and quality checker for the Python programming language. Information given after running Pylint on each and every python file in GitHub is stored in a temporary folder called downloaded_data and then we read the desired information from the files within the same folder to store in a DB table called file_metrics and file_info.
2) For Error Metrics we join file_info, error_code_details and error_info table to get all the information from the DB to show up in Tableau. We show number of Convention, Error, Warning, Refactor presented by the Pylint for the entire project . Data regarding the project is genetared via Pylint. Information given after running Pylint on the entire project on GitHub is stored in a temporary folder name called downloaded_data and then we read the desired information to store in a DB table called file_info, error_code_details and error_info.
3) For Code duplication Metrics we use information from the table duplicate_info to show graph in Tableau. We are showing number of duplicated lines and percentage of duplicated lines in the entire repository. Note: It is not per file based as the code can be duplicated in different files as well.For example - a method can be copied in various files. Again to get the data about duplication we run pylint on the entire repository and store the output data in a temporary folder name called downloaded_data. We parse the files inside the folder to fetch the required information.
4) For calculating and showing individual error/convention/warning/refactor types we are using a meta data table called error_code_details. This table is populated with the error code given by the pylint. We got the data from their document ans populated using sql scripts. This population is one time work as we would be needing this table data to match the error code we get after running pylint for any file and showing the various description on the graph.


### Use Case #3 Report generation

#### Implementation:

We utilize Tableau Online to generate reports. We can generate reports either for particular worksheet or for the entire workbook. When generating the report the Tableau gives options of either generating a PDF,image, powerpoint, tableau workbook etc.By clicking the download button we can generate and save the report. 


### Worksheet: [Click here](https://github.ncsu.edu/apareek2/csc510-project/blob/master/docroot/automated-project-analyzer-reports/WORKSHEET2.md)

### Screencast - [Click here](https://youtu.be/dJeG_TD5uv0)
