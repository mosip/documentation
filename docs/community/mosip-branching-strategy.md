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

## Details

Continuous development happens on the `develop` branch where code is continuously merged as code contributions flow in on a daily basis. It is important that as and when the code gets developed, the corresponding tests also get developed in parallel so that both code and tests are merged together. This ensures that the tests that are run daily help in maintaining the sanctity of the code.

After a `release_<version>` branch cutover from develop the pom versions are changed to the next version with SNAPSHOT. This enables continuous development. The pom version in `develop` branch always has 3 digits separated by ".". 

For e.g.: Let us assume `develop-SNAPSHOT` is the current POM version in `develop` (all POM versions are the same in a given repo.). When a `release_1.2.0.1` release branch is cut, all the POM versions in the newly created branch are updated as `1.2.0.1-SNAPSHOT`. 

In MOSIP, we follow a four-digit version as `1.2.0.0`. The branches are cut over for every version. So, the `release_1.2.0.1` will have it's own branch and would be based on `1.2.0` or the latest of `1.2.0.x`.


### Feature branch

Major releases may be coded in the respective feature branches within the MOSIP subsystem.  It may also be developed outside MOSIP in some other GitHub organization/repo.  Once a feature is coded and is ready to be pulled into MOSIP, the organization or team could submit a PR. All feature branches are merged into the `develop` branch after the maintainer's review. `Feature` branches are deleted after their changes are adopted by the `develop` branch.

### Release branch

When we are close to the code freeze, just before acceptance testing, the develop branch may be tagged and a new `release_branch` may be cutover. The `release branch` is meant for attaining stability through testing and bug fixing. After all the tests are successfully executed, the code is ready to be released.  At this time two things happen:

* the code from the release branch is merged into `master`, tagged with the release number and released.
* the code from the release branch is merged back into `develop` branch.
    
To identify the actual release, you are requested to use the tag. The tags for a release follow the convention as `v<release_version>`.

*Note*: Please note the release branch name does not identify the actual release. While we try our best to keep it in line, there is no guarantee that the release would have happened from this same exact branch.  The docker tags will match the release version. HELM chart maps multiple dockers from various repositories to the actual release version. 

All the modified POM versions would be the same as the tagged `release` version. 

### Minor release

Minor release is needed to support te critical issues that are faced by customers. Customers may be using different MOSIP releases at any given point in time. While it is our goal to get our customers use the latest and greatest release, they may not be ready to upgrade and it is important to support the release they have deployed. At this point, two things could happen:

* the issue might have been fixed in the current code-base and might have to be back ported.
* the issue might have to be freshly fixed.
    
The following procedure must be adopted:

1. Identify all the supported versions of MOSIP.
2. Create a minor release branch from the latest release tag.
3. Checkout code, fix and test the issue.
4. Issue the release to the customer
5. Merge the fix into the `develop` branch so that it gets into the next main/ patch release. This step is followed on a need basis. There are several cases where this merge would not make sense as the design of the component may have changed in the upcoming releases.
