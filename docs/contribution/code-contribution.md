# Code Contribution

## Overview

The below recommended Github workflow allows developers to submit code and documentation contributions to eSignet open-source repositories.

### Repositories

{% embed url="https://github.com/mosip/esignet" %}

{% embed url="https://github.com/mosip/esignet-mock-services" %}

## Setup your development machine

1. Fork repository of interest.
2.  Clone the fork to your local machine. E.g.:

    ```
    $ git clone https://github.com/<your_github_id>/esignet.git
    ```
3.  Set the upstream project as the original from where you forked. E.g.:

    ```
    $ cd esignet
    $ git remote add upstream https://github.com/mosip/esignet.git
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
   2. Please provide as much information as possible.
   3. If you want to develop a new feature, please elaborate on the idea and discuss the design before starting development.
2. In your local repository, fetch the upstream.

```
$ git fetch upstream
```

3\. On your local repo, switch to a branch if you are working on an older release (like the 1.0.0 branch) or stay in `main/develop` branch.

```
$ git checkout upstream/<branch> 
```

{% hint style="info" %}
You will get a warning from git. Don't worry, our next step will take care of this warning.
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
You should do this quite often to ensure you are up to date.
{% endhint %}

6\. Now feel free to make the change in the code or documentation. Reach out to [our community](https://community.mosip.io) for any queries. Once done with the work, commit your changes by referring to the Issue ID in the commit message. Eg:

```
$ git commit -m "[#1234] Adding new upload feature in eSignet service"
```

7\. Once again, ensure you are up-to-date with the upstream repo as it may have moved forward.

```
$ git pull upstream <branch> 
```

8\. Build and test your code. Make sure to follow the coding guidelines. Provide unit test cases for the changes you have built.

9\. Push to your forked repo (origin).

```
$ git push --set-upstream origin issue-<issue number>
```

10\. On your forked remote repository from GitHub, create a pull request using the Contribute button. Direct the pull-request to `main` or any specific branch upstream.

{% hint style="info" %}
Most often it's the same branch in the upstream (as in Step 3).
{% endhint %}

11\. Make sure the automatic tests on GitHub for your pull request pass.

12\. Reviewers shall review the pull request. Reach out to the [community](https://community.mosip.io) for a faster response.
