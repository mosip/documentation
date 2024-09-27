# Release Process

Below is the procedure that is followed during the release process in MOSIP.

* Once an agreement has been reached between the Maintainer and the Community regarding a release, a release branch will be created.
* The branch will be named `release-<version>` and will be used to transition all dependent projects and the main project.
* The version numbers in the relevant build files will be updated accordingly.
* Following this, the release artifacts will be generated from the designated branch and transferred to the Quality Assurance (QA) team.
* Thorough release testing will be conducted under the supervision of the QA team.
* Bugs that are identified will be assessed by the community, QA team, and product owners.
* All necessary fixes will be made within the release branch.
* Once testing is completed, the QA team must provide their approval for the release.
* The fixes implemented will then be transferred from the **release** branch to the **develop** branch.
* A discussion with stakeholders will be initiated to determine whether to proceed with the release or not.
* The final documentation, including **Release Notes** and a **Test Report**, will be updated accordingly.
* Upon receiving clearance from the [`Go/No Go`](go-nogo.md) decision, the repositories will be tagged, and the artifacts will be released to NPM, Maven, Testflight, and other relevant platforms.
* The tagged code and artifacts will be deployed on Collab for sanity testing and automation.
* Once the sanity testing is successful, the release will be announced on the [Community](https://community.mosip.io/) channels.

