# Code Contributions

## Overview
The recommended Github workflow here is for developers to submit code and documentation contributions to MOSIP open source repositories.  

## Setup
1. Fork MOSIP repository of interest from https://github.com/mosip/

1. Clone the fork to your local machine. E.g.: 
    ```
    $ git clone https://github.com/<your_github_id>/commons.git
    ```
1. Set upstream project as the original from where you forked. E.g.:
    ```
    $ cd commons
    $ git remote add upstream https://github.com/mosip/commons.git
    ```

1. Make sure you never directly push to upstream.
    ```
    $ git remote set-url --push upstream no_push
    ```

1. Confirm the origin and upstream.
    ```
    $ git remote -v
    ```

## Code changes

1. Create a new issue in [MOSIP Jira](https://mosip.atlassian.net/).

1. You may work on `master`, switch to a branch (like Release branch) or create a new branch.

1. Make sure you are up-to-date with upstream repo. 
    ```
    $ git pull upstream <branch> 
    ```

1. Once you are done with the work, commit your changes referring to Jira number in the commit message. Eg:
    ```
    $ git commit -m "[MOS-2346] Adding new upload feature in Pre-registration module for POA documents"
    ```

1. Once again ensure that you are up-to-date with upstream repo as it may have moved forward. 
    ```
    $ git pull upstream <branch> 
    ```
    
1. Build and test your code. Make sure it follows the coding guidelines.

1. Push to your forked repo (origin).
    ``` 
    $ git push 
    ```

1. Create a pull-request on your forked repo.  Direct the pull-request to `master` or any specific branch on upstream (like a Release branch).
	
1. Make sure the automatic tests on Github for your pull-request pass.

1. The pull-request shall be reviewed by reviewers.

