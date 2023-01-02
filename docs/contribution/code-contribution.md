# Code Contribution

## Overview

The recommended Github workflow here is for developers to submit code and documentation contributions to e-Signet open-source repositories.

## Setup

1. Fork repository of interest from https://github.com/idp/
2.  Clone the fork to your local machine. E.g.:

    ```
    $ git clone https://github.com/<your_github_id>/commons.git
    ```
3.  Set the upstream project as the original from where you forked. E.g.:

    ```
    $ cd commons
    $ git remote add upstream https://github.com/mosip/commons.git
    ```
4.  Make sure you never directly push upstream.

    ```
    $ git remote set-url --push upstream no_push
    ```
5.  Confirm the origin and upstream.

    ```
    $ git remote -v
    ```

## Code changes

1. Create a new issue in GitHub.
2. You may work on the master branch, switch to a branch (like the Release branch) or create a new branch.
3.  Make sure you are up-to-date with the upstream repo.

    ```
    $ git pull upstream <branch> 
    ```
4.  Once you are done with the work, commit your changes by referring to the Issue ID in the commit message. Eg:

    ```
    $ git commit -m "[#1234] Adding new upload feature in IdP service module for POA documents"
    ```
5.  Once again ensure that you are up-to-date with the upstream repo as it may have moved forward.

    ```
    $ git pull upstream <branch> 
    ```
6. Build and test your code. Make sure it follows the coding guidelines.
7.  Push to your forked repo (origin).

    ```
    $ git push 
    ```
8. Create a pull request on your forked repo. Direct the pull-request to `master` or any specific branch upstream (like a Release branch).
9. Make sure the automatic tests on Github for your pull request pass.
10. The pull request shall be reviewed by reviewers.
