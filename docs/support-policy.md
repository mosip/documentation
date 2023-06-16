# MOSIP Support Policy

Support is a critical aspect of adopting any software. MOSIP too offers support to adopting countries and their solutions providers on the platform. This enables MOSIP users to get fixes and updates on the platform. This document lays down the MOSIP support policy, while also specifying how these apply to the various versions of MOSIP that have been released and the ones to come in the future.

## Versions in MOSIP and their meaning

The MOSIP platform has versions. The first version of MOSIP is v1 and it has a planned set of features defined in its backlog/roadmap. Versions of MOSIP evolve and start with a base release version - e.g. v1.0.0

The release version tag has the format “vVersion(x.y).Version.Evolution.Patch”

* v1.2.1 means Version 1.2, evolution 1, no patch
* v1.2.0 means Version 1.2, base evolution, no patch
* v1.1.0.1 means Version 1.1, base evolution, patch 1
* v1.1.2 means Version 1.1, evolution 2, no patch
* v1.2.3.2 means Version 1.2, evolution 3, patch 2
* v2.0.0 means Version 2.0, base evolution, no patch

## Version - A vision of MOSIP

MOSIP is an open source, and open standards project created so adoption of digital governance across the globe becomes easier, friendlier, safer, and transparent. As part of its evolutionary journey, MOSIP has clear visions and missions. The project and its roadmaps are then structured to achieve the vision and missions.

Versions of MOSIP indicate the phases of implementation of the MOSIP roadmap. v1 of MOSIP aims to provide a base platform for countries with features for issuance, lifecycle management of ID, and identity verification services keeping in mind first-time users and identity programs as the end user. The next phase of the roadmap will expand on this and bring more power to the platform catering to steady-state operations, migration from other systems and advanced use cases.

Evolutions are part of the working structure in MOSIP. Every version introduces changes to the platform. The changes introduced get finetuned over multiple evolutions. In true agile fashion and to bring interim usability and testability, features and capabilities are built incrementally and the version evolves both in capability and maturity. A new evolution release of the version that will retain the “Version” number, increment the “Evolution” number and reset the “Patch” number to zero.

A new patch release on the evolution (Patch Release) will retain the “Version” and “Evolution” numbers, and increment the “Patch” number.

Patch releases are done on an evolution of a version of MOSIP. They are not explicitly supported. The user is expected to migrate to the latest patch in order to get fixes. Patches will not introduce new features. New evolutions typically include the fixes in patches issued on the current evolution.

For e.g. v1.2.1 includes the fixes in patches v1.1.1, v1.1.2, v1.1.3.

Hotfixes are special point releases that are issued out of turn and are typically included in the next patch. A sample hotfix tagging will look like this v1.1.2.1 (format is vVersion.Evolution.Patch.Hotfix). Hotfixes are not always applied to all patches and evolutions even if they are relevant. They are issued only for production systems on a discretionary basis.

MOSIP follows a “Release Train” versioning. The core team continuously works towards improving and building new features. Every release is a rollover. So there is no breaking vs non-breaking release concept in MOSIP. As a part of this MOSIP would deprecate each and every work it does as part of its new rollover so that systems built over MOSIP can adopt these versions easily.

We highly recommend the adopters to keep their systems in sync with our releases so they gain full control over the digital governance vision.

## Support status of a release

MOSIP uses a Support Rollover concept where MOSIP actively supports current evolutions, and provides essential support for the previous evolution and older evolutions move out of support. As newer evolutions are introduced the support is phased out for older evolutions.

An evolution typically goes through the support lifecycle of “Active Support” when it is current, “Essential Support” when it is superseded by a new evolution, and later moves into “Not Supported” and “End of Life” as more evolutions are introduced.

### Long Term Support

While all evolutions typically go though the support lifecycle churn rapidly, specific stable versions are designated as Long Term Support versions. These versions are supported for many years and their rollover happens on the basis of the introduction of the next LTS evolution. Minimum support duration is assured for LTS versions. Countries are encouraged to base their systems on LTS versions to benefit from the long term support they get.

All support for MOSIP is provided under the MPL 2.0 license terms with no express warranties or guarantees.

Release versions will have an associated support type/status, and this will be mentioned on the release page in the documentation.

| **Support Status** |                 **Applies to**                 |                                                                                                                      **Support Details**                                                                                                                     |                                                                                                   **Defects Reporting**                                                                                                  |                                                                                    **Sunset**                                                                                    |
| :----------------: | :--------------------------------------------: | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: |
|   Active Support   |                Current Evolution               |                                                                                           Receives Patches with fixes for functionality, performance, and security                                                                                           |                                                                              Open. Users can reports issues. These will be actively triaged                                                                              |                        <p>Moves to Essential Support when next evolution is released</p><p>v1.1.x moves to essential support when v1.2.0 is released.</p>                        |
|                    |              Current LTS Evolution             |                                                                                                                                                                                                                                                              |                                   <p>Moves to Essential Support when the next LTS evolution is released.</p><p>v.1.2.0 LTS moves to essential support when v2.x.x LTS is released.</p>                                   |                                                                                                                                                                                  |
|  Essential Support |               Previous Evolutions              |                                                                                      Receives Patches with select bug fixes for functionality, performance and security.                                                                                     |                                                 Open. New issues can be reported. Some of these and applicable issues from current evolution will be selected for fixes.                                                 |               <p>Moves to Not Supported when the current evolution becomes the previous evolution.</p><p>v1.1.x moves to Not Supported when v1.3.0 is released</p>               |
|                    |             Previous LTS Evolution             |                                                                                                                                                                                                                                                              | <p>Moves to Not Supported 3-5 years after release.</p><p>It can receive longer support in some cases:</p><p>- Till the current LTS Evolution is 2 years old</p><p>- Support life extended at the discretion of MOSIP</p> |                                                                                                                                                                                  |
|   Minimal Support  |                Older Evolutions                | Patches with essential security and essential critical fixes will be made available on request in cases where production versions are on this. Such fixes are at the discretion of MOSIP. The production versions are urged to move to the latest evolution. |                      <p>Closed. New issues cannot be reported. Issues reported from the current evolution will not be actively considered.</p><p>Community managed defects lists might be open.</p>                      | <p>Moves to End of Life when next version is released.</p><p>Support might be available via MOSIP CSPs (Commercial Service Providers) beyond MOSIP provided support periods.</p> |
|                    |              Older LTS Evolutions              |                                                                                                                                                                                                                                                              |                                              Moves to End of Life when Current LTS Evolution becomes Previous LTS Evolution or 8 Years after release, whichever is earlier.                                              |                                                                                                                                                                                  |
|     End of Life    | Older Evolutions of Previous or Older Versions |                                                                              No Patches will be issued. Migration to the supported evolution of the relevant version is advised.                                                                             |                                                                                  Closed. Community managed defects lists might be open.                                                                                  |                                  Support might be available via MOSIP CSPs (Commercial Service Providers) beyond MOSIP provided support periods.                                 |

## Option Packs

Once a version has moved to its LTS Evolution, no additional work is done on it other than fixes via patches. New features are not added. In some rare cases where compliance to some open standards is needed or new versions of specifications need to be supported for integration and interoperability, an option pack might be released to add these capabilities to the LTS version. Option packs will mirror the LTS version support policy where possible. In exceptional cases, they might come with their own support terms. Over-the-top tooling, additional adapters, and software infrastructure options will continue to evolve and grow in numbers.

## Breaking Changes and Upgrade Path

### Breaking Change

Breaking changes typically indicate a change in the Software infrastructure changes, Java interfaces, Webservice API, DB structure, Schemas, and Configuration properties. Such changes might affect integration, existing data, configuration, or customization.

### Patch Upgrade

A patch upgrade or a hotfix typically does not include any breaking changes. These changes can be applied as component upgrades, optional scripts for data upgrades if any, and manual updates to configuration. Patches are typically not systemwide and focus on specific components.

### Evolution Upgrade

Evolution releases include new features and potentially breaking changes, along with all the patches on the previous evolution. Major breaking changes are announced beforehand. All changes are documented as part of the release notes. Upgrade scripts will migrate configuration and data as needed and upgrade requisite MOSIP components. Configuration updates to software infrastructure will be provided as instructions where applicable. The process might also include steps to be undertaken outside of running the scripts. Customizations and integrations might need to be refactored.

### Version Upgrade

Moving from one version of MOSIP to a newer version is expected to be a non-trivial exercise. Backward compatibility and migration scripts might provide only part of the migration. In order to take advantage of the newer features, workflow configuration, customization, integration, and infrastructural changes might be needed. Such an exercise must be undertaken as a project with complete testing and upgrade.

## MOSIP Versions

<table><thead><tr><th width="171.33333333333331">Version</th><th width="275">Active Support</th><th>Essential Support</th></tr></thead><tbody><tr><td>1.2.0.x (Latest)</td><td>14th Feb 2022 - 13th Feb 2025</td><td>14th Feb 2025 - 13th Feb 2027</td></tr><tr><td>1.1.5.x (Latest)</td><td>23rd Apr 2021 - 22nd Apr 2022</td><td>23rd Apr 2022 - 22nd Apr 2023</td></tr><tr><td>1.1.4.x </td><td>End of Life</td><td>End of Life</td></tr><tr><td>1.1.3.x</td><td>End of Life</td><td>End of Life</td></tr></tbody></table>
