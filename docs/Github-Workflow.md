## Setup
1. Fork MOSIP repository of interest from 
    https://github.com/mosip/

1. Clone the fork to your local machine. Example: 
    ```
    $ git clone https://github.com/<your_github_id>/commons.git
    $ cd commons
    ```
1. Set upstream project as the original from where you forked: 
    ```
    $ cd commons
    $ git remote add upstream https://github.com/mosip/commons.git
    ```

1. Make sure you never directly push to upstream:
    ```
    $ git remote set-url --push upstream no_push
    ```

1. Confirm the origin and upstream with: 
    ```
    $ git remote -v
    ```

## Code changes

1. First, update your master with the latest changes from upstream repo: 
    ```
    $ git fetch upstream
    $ git checkout master
    $ git rebase upstream/master
    ```

1. Create a new issue in [MOSIP Jira](https://mosip.atlassian.net/)

1. Create a branch to work on your changes or continue to work on `master` (developer's choice).  To create a branch: 
    ```
    $ git checkout -b <issue-id> 
    ```

1. Once you are done with the work, commit your changes:
    ```
    $ git commit -m "[issue-id] <meaningful commit message>.." 
    ```
    Note that specifying issue-id tags the commit with Jira. Example:
    ```
    $ git commit -m "[MOS-2346] Adding new upload feature in Pre registration module for POA documents"
    ```

1. Once again sync with upstream: 
    ```
    $ git fetch upstream
    $ git rebase upstream/master
    ```

1. Push to origin  

    * If you are working on branch: 
    ```
    $ git push -u origin <issue-id>
    ```

    * If you are working on master:
    ```
    $ git push 
    ```
1. Build and test your code.  Make sure it follows the coding guidelines.

1. Create a pull request: On Github page of your forked repo (example: `https://github.com/<your_github_id>/common`) select your branch (example: `issue-id`) and create a new pull request.
	
1. The pull request shall be reviewed by reviewers.
