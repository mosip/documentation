#TBD - Review and Update

#MOSIP Branching Strategy

Reference :  https://nvie.com/posts/a-successful-git-branching-model/

MOSIP release will use two branches 

 develop         masterThere is a also a third branch called  release_branch that would be used to control code check-in at the time of release

'master'  branchThe 'master' branch should always be production-ready.  This means, any code that is committed into master should have been tested before merging.  Thus, anybody should be able to build and deploy a fully-tested code from the 'master'.  In other words, all MOSIP releases happen from the 'master' branch.

'develop' branchThe 'develop' branch is the one on which main development happens.   Developers make code changes on their private git repositories forked out of MOSIP repos.  Their changes are raised as Pull Requests (PRs) which are carefully reviewed and merged into 'develop' branch by one or more repo maintainers.  At this point, it is easy to infer that several PRs flowing in gets merged in various repos.  Daily/Nightly builds are triggered resulting in build executables (jars/Zips/EXEs) deployed on servers against which automated tests are run.

Tagging inside 'develop' branch

Continuous development happens on the 'develop' branch where code is continuously merged as code contributions flow in on a daily basis.  It is important that as and when the code gets developed, the corresponding tests also get developed in parallel so that both code and tests are merged together.  This ensures that the tests that are run daily help in maintaining the sanctity of the code.

After a Release branch cut over from develop the pom versions are changed to the next version with SNAPSHOT. This enables continuous development. The pom version in develop branch always has 3 digits separated by “.” with the last digit as 0. 

For eg: Let us assume 1.2.0-SNAPSHOT is the current POM version (all POM version are same in a given repo, any project that needs to be independent will use a different repo.) when a 1.2.0 release branch is cut the develop branch will move to 1.3.0-SNAPSHOT. 

Note: If there is a repo that need not change it can remain in the older SNAPSHOT version. But when there is a need to change it would be changed to the last release +.1 ie from 1.2.0-SNAPSHOT it would be changed to the 1.4.0-SNAPSHOT skipping the 1.3.0-SNAPSHOT

Feature branches

Major releases may be coded in the respective feature branches within the MOSIP subsystem.  It may also be developed outside MOSIP in some other github organization/repo.  Once a feature is coded and is ready to be pulled into MOSIP, it could be submitted as a PR and merged into the 'develop' branch.  

'Release'  branch

At the time of code-freeze just before acceptance testing, the branch may be tagged and a new 'release_branch' may be cut-out.  The 'release branch' ibs meant for attaining stability through testing and bug fixing.  After all the tests are successfully executed, the code is ready to be released.  At this time two things happen 

The code from the release branch is merged into 'master', tagged with the release number and released

The code from the release branch is merged back into 'develop' branch

All release branch will be named with three-digit number separated with “.”. The last digit will be 0 for all the major release.

Note: Please note the release branch name does not identify the actual release. While we try our best to keep it inline there is no guarantee that the release would have happened from this same exact branch. Also, the tags named with v<Release_Version> will be the actual release version of that repo. The docker tags in HELM charts are the absolute truth and maps multiple dockers from the various repository to the actual release version. 

All the modified POM version would be the same as the release branch name. 

Minor ReleaseMinor Release is needed to support critical issues that are faced by customers.   Customers may be using different MOSIP releases at any given point in time. While it is our goal to get our customers use the latest and greatest release, they may not be ready to upgrade and it is important to support the release they have deployed.  At this point, two things could happen.

The issue might have been fixed in the current code-base and might have to be back ported

The issue might have to be freshly fixed.

 The following procedure must be adopted

Identify the version deployed by the customer

Create a minor release branch from the tag in the master branch

Checkout code, fix and test the issue

Issue the release to the customer

Merge the fix into the 'develop' branch so that it gets into next main/patch release. (This step is followed on a need basis, There are several cases where this merge would not make sense as the design of the component may have changed in the upcoming releases and the bug fixes may not make sense or the fix is back ported.)

The pom versions in the minor releases would use a 3 digit number separated by “.”. The final digit is always a number other than “0”.

