# Code Contribution

## Overview

The recommended Github workflow here is for developers to submit code and documentation contributions to e-Signet open-source repositories.

### Repositories

{% embed url="https://github.com/mosip/idp" %}

{% embed url="https://github.com/mosip/idp-ui" %}

## Setup your development machine

1. Fork repository of interest
2.  Clone the fork to your local machine. E.g.:

    ```
    $ git clone https://github.com/<your_github_id>/idp.git
    ```
3.  Set the upstream project as the original from where you forked. E.g.:

    ```
    $ cd idp
    $ git remote add upstream https://github.com/mosip/idp.git
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
   1. Follow the issue template provided.
   2. Please provide as much information as possible
   3. In case you want to develop a new feature please elaborate the idea and discuss the design before starting development.
2. In your local repository fetch the upstream

```
$ git fetch upstream
```

3\. On your local repo switch to a branch if you are working on a older release (like the 0.9.0 branch) or stay in `main/develop` branch.&#x20;

```
$ git checkout upstream/<branch> 
```

{% hint style="info" %}
You will get a warning from git. So dont worry our next step will take care of this warning.
{% endhint %}

4\. Create a new issue branch with the name of the issue.

```
$ git switch -c issue-<issue number>
```

5\. Make sure you are up-to-date with the upstream repo.

```
$ git pull upstream <branch> 
```

{% hint style="info" %}
You should do this quite often to ensure you are upto date.
{% endhint %}

6\. Now feel free to make the change in the code or documentation. Reach out to <mark style="background-color:red;">\[our community]\(https://community.mosip.io)</mark> for any query. Once you are done with the work, commit your changes by referring to the Issue ID in the commit message. Eg:

```
$ git commit -m "[#1234] Adding new upload feature in e-Signet service module for POA documents"
```

7\. Once again ensure that you are up-to-date with the upstream repo as it may have moved forward.

```
$ git pull upstream <branch> 
```

8\. Build and test your code. Make sure to follow the coding guidelines. Provide unit test cases for the changes you have built.

9\. Push to your forked repo (origin).

```
$ git push --set-upstream origin issue-<issue number>
```

10\. On your forked remote repository from github create a pull request using the contribute button. Direct the pull-request to `main` or any specific branch upstream.&#x20;

{% hint style="info" %}
Most often its the same branch in the upstream (as in Step 3).&#x20;
{% endhint %}

11\. Make sure the automatic tests on github for your pull request pass.

12\. The pull request shall be reviewed by reviewers. Reach out to the <mark style="background-color:red;">\[community]\(https://community.mosip.io)</mark> for any faster response.&#x20;
