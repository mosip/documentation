# MOSIP BRANCHING STRATEGY 

MOSIP releases would typically use two branches, namely `develop` and `master`.
There is a also a third branch called `release_branch` that would be used to control the code check-in at the time of release.

Below is a description of each branch.

* `master`  branch
The `master` branch should always be production-ready. This means that any code that is committed into the master should have been tested before merging. Thus, anybody should be able to build and deploy a fully-tested code from the `master`.  In other words, all MOSIP releases happen from the `master` branch.

* `develop` branch
The `develop` branch is the active trunk and most of our development happens here. Developers make code changes on their private git repositories forked out of MOSIP repos. Their changes are raised as Pull Requests (PRs) which are carefully reviewed and merged into develop branch by one or more repo maintainers. At this point, it is easy to infer that several PRs flowing in may get merged in various repos. Automatic builds are triggered resulting in build executables (jars/Zips/EXEs) deployed on servers against which automated tests are run.

* `release` branch
The release_x.x.x.x branch is the one on which final release development happens. Developers make code changes on their private git repositories forked out of MOSIP repos. Their changes are raised as Pull Requests (PRs) which are carefully reviewed and merged into release_x.x.x.x branch by one or more repo maintainers.  At this point, it is easy to infer that several PRs flowing in may get merged in various repos.  Automatic builds are triggered resulting in build executables (jars/Zips/EXEs) deployed on servers against which automated tests are run. Most often this is a final stage before release and unknown or unplanned PR's will not be accepted.

* `feature` branch
The `feature` branch is created by a team when they need active development on a specific feature.  Developers make code changes on their private git repositories forked out of MOSIP repos.  Their changes are raised as Pull Requests (PRs) which are carefully reviewed and merged into feature branch by the respective feature owners. Automatic builds are triggered resulting in build executables (jars/Zips/EXEs) but not deployed on servers until the feature is adopted by MOSIP. These branches are not long-lived and would be deleted or cleaned up once the feature is complete or absolute.

Details
Continuous development happens on the 'develop' branch where code is continuously merged as code contributions flow in on a daily basis.  It is important that as and when the code gets developed, the corresponding tests also get developed in parallel so that both code and tests are merged together.  This ensures that the tests that are run daily help in maintaining the sanctity of the code.

After a release_<version> branch cutover from develop the pom versions are changed to the next version with SNAPSHOT. This enables continuous development. The pom version in develop branch always has 3 digits separated by ".". 

For eg: Let us assume develop-SNAPSHOT is the current POM version in develop(all POM versions are the same in a given repo.). When a release_1.2.0.1 release branch is cut, all the POM versions in the newly created branch are updated as 1.2.0.1-SNAPSHOT. 

In MOSIP we follow 4 digit version as 1.2.0.0. The branches are cut over for every version. so release_1.2.0.1 will have its own branch and would be based on 1.2.0 or the latest of 1.2.0.x

