
# Automated project analyzer

## Problem Statement

A good project is something which can be understood, maintained and extended by other developers. It is therefore essential for a developer to conform to the project standards. There are following issues a developer has to face: maintaining code standards, avoiding code duplication and compile/runtime errors and warnings. Currently, there is no one central point of view available to the team which can help them understand and visualize the above issues in the project.
Maintaining project standard is an essential part of the project to make the code more readable for other developers and the manager. Code duplication results in redundancy and increases project maintenance cost. Also, it is difficult for managers to keep track of what parts of the code are not covered by test cases.

## Solution Description

We intend to create a dashboard to resolve the aforesaid issue, the dashboard will provide all the vital infographics regarding a project. The dashboard will host a visual representation of the code compile errors/warnings and code coverage metrics by use of histograms, bar graphs, pie charts. These graphs will give an insight to the developer regarding the number of code errors/warnings, type of code errors/warnings as per contributor in the project code (.py) files. We will use Github REST APIs to fetch files from Github. We will use Tableau to generate the visualization of graphs and metrics.

We will use Python PyLint library to analyze the Github code files for verifying the coding standards, code duplication and compile/runtime errors and warnings. Code duplication will run on the entire project, project module or on a single file. Tableau will display a table with a number of duplicated lines and the percent of duplicated lines. There will be a table for the type of code issues such as convention, refactor, warning and error. Tableau will also display the overall rating of the code based on the errors and warnings in the code file. Tableau will display a table for the number of code lines missed by the test cases i.e. the percentage of how much code is covered and what part of the code was missed by the test cases. The dashboard will provide access control to both the manager(s) and developers. They will be able to access the number of coding errors/warnings in the project files, files with duplicated code and non-compliant coding standard files. This dashboard will enable developers to better understand the project quality in a comprehensive way and will allow the manager to better manage the team the project.

This solution checks for following: 

  * (C) convention, for programming standard violation

  * (R) refactor, for bad code smell

  * (W) warning, for python specific problems

  * (E) error, for much probably bugs in the code

  * (F) fatal, if an error occurred which prevented Pylint from doing further processing.

## Use Cases

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

#### Story Board
![No Image](https://github.ncsu.edu/mjain6/Software-Engineering/blob/master/Automated%20project%20analyzer/images/StoryBoard.png "Story Board")


## Design Sketches

![No Image](https://github.ncsu.edu/mjain6/Software-Engineering/blob/master/Automated%20project%20analyzer/images/FirstPage.png "Home Page")

![No Image](https://github.ncsu.edu/mjain6/Software-Engineering/blob/master/Automated%20project%20analyzer/images/Chartspage.png "Chart page")

## Architecture Design

### Architecture components :

![No Image](https://github.ncsu.edu/mjain6/Software-Engineering/blob/master/Automated%20project%20analyzer/images/Software-engineering-arch-design.png)

 * **Graphical User Interface:**

   The user interacts with a GUI which prompts for user’s Github information like Github URL, repository name and the          personal access token. After submitting the above information an API call would be made to the code server which will        intern call mentioned GitHub URL via Github API calls. If the user has not provided correct information and GitHub API      call (GET Content) fails then we will prompt the user with message “Incorrect URL or Access token provided, Please          provide correct information”.

 * **Fetch from Github repository:**
   
   We will use Github Get Contents (GET /repos/:owner/:repo/contents/:path) API to fetch the contents of the repository. We    will then run our algortithm to analyse various files in the repository. In case of no files in the repository we will      show a "No Folder/Files Found" message to the user.

 * **Evaluating code errors/warning metrics and code-coverage metrics:**
   
   Every file fetched from the Github repository will be processed to evaluate code errors/warnings using Pylint library.      Ignoring those files which are not compliant with Pylint. For code coverage, we will make use of coverage.py library        which will give metrics about how much code is covered by test cases and how much is not covered by test cases. All for      these metrics will be stored in a database corresponding to each file in the repository along with file name.

 * **Tableau / Interface:**
   
   We will host the tableau application on our server where the code and database resides, tableau will directly interact      with the database hosted on the same server and display the metrics using data stored in our MySQL database
   We will show the following graphs: 
   * Pie chart for code errors/warnings overview: Display how many errors, warnings, code standard violations exists in the      code.
   * Detailed code errors/warnings pie chart for each file: This chart will appear upon drill down of the errors/warnings        overview section, which will display a pie chart of the breakdown of errors/warnings for each and every file in the          repository.
   * Pie chart for code coverage overview: Display how much code is covered by test cases in the overall repository and how      much is not covered by the test cases.
   * Detailed code coverage pie chart for each file: This chart will appear upon drill down of the code coverage overview        section, it will display the code coverage per file. (i.e. the metrics showing the amount of code covered by test cases      and not covered by test cases for each and every file.)
