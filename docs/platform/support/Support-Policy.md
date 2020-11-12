#TBD - Review and Update

Support is a critical aspect of adopting any software. MOSIP too offers support to adopting countries and their solutions providers on the platform. This enables MOSIP users to get fixes and updates on the platform. This document lays down the MOSIP support policy, while also specifying how these apply to the various versions of MOSIP that have been released and the ones to come in the future.

 

Support status of a release

Release versions will have an associated support type/status, and this will be mentioned on the release page in the documentation. 

Support Status

Applies to

Support Details

Defects Reporting

Sunset

Active Support

Current Evolution

Receives Patches with fixes for functionality, performance, and security

Open. Users can reports issues. These will be actively triaged

Moves to Essential Support when next evolution is released

v1.1.x moves to essential support when v1.2.0 is released.

Current LTS Evolution

Moves to Essential Support when the next LTS evolution is released.

v.1.2.0 LTS moves to essential support when v2.3.0 LTS is released.

Essential Support

Previous Evolutions

Receives Patches with select fixes for functionality, performance and security

Closed. New issues cannot be reported. Applicable issues from current evolution will be selected.

Moves to Not Supported when the current evolution becomes the previous evolution.

v1.1.x moves to Not Supported when v1.3.0 is released 

Previous LTS Evolution

Moves to Not Supported 5 years after release.

It can receive longer support in some cases:

Till the current LTS Evolution is 2 years old

Support life extended at the discretion of MOSIP

Not Supported

Older Evolutions

Patches with essential security and essential critical fixes will be made available on request in cases where production versions are on this. Such fixes are at the discretion of MOSIP. The production versions are urged to move to the latest evolution.

Closed. New issues cannot be reported. Issues reported from the current evolution will not be actively considered.

Community managed defects lists might be open.

Moves to End of Life when next version is released.

Support might be available via MOSIP CSPs (Commercial Service Providers) beyond MOSIP provided support periods.

Older LTS Evolutions

Moves to End of Life when Current LTS Evolution becomes Previous LTS Evolution or 8 Years after release, whichever is earlier. 

End of Life

Older Evolutions of Previous or Older Versions

No Patches will be issued. Migration to the supported evolution of the relevant version is advised.

Closed. Community managed defects lists might be open.

Support might be available via MOSIP CSPs (Commercial Service Providers) beyond MOSIP provided support periods. 

Patches and Hotfixes

Patch releases are done on an evolution of a version of MOSIP. They are not explicitly supported. The user is expected to migrate to the latest patch in order to get fixes. Patches will not introduce new features. New evolutions typically include the fixes in patches issued on the current evolution.

For e.g. v1.2.0 includes the fixes in patches v1.1.1, v1.1.2, v1.1.3.

Hotfixes are special point releases that are issued out of turn and are typically included in the next patch. A sample hotfix tagging will look like this v1.1.2.1 (format is vVersion.Evolution.Patch.Hotfix). Hotfixes are not always applied to all patches and evolutions even if they are relevant. They are issued only for production systems on a discretionary basis.

Option Packs

Once a version has move to its LTS Evolution, no additional work is done on it other than fixes via patches. New features are not added. In some rare cases where compliance to some open standards are needed or new versions of specifications need to be supported for integration and interoperability, an option pack might be released to add these capabilities to the LTS version. Option packs will mirror the LTS version support policy where possible. In exceptional cases, they might come with their own support terms. 

Breaking Changes and Upgrade Path

Patch releases typically do not introduce breaking changes and will include a migration process and scripts. The scripts will migrate configuration and data as needed and upgrade requisite MOSIP components. Configuration updates to software infrastructure will be provided as instructions where applicable.

Evolution releases include new features and potentially breaking changes, along with all the patches on the previous evolution. A migration process and scripts will be provided to move from one evolution to the next. The process might also include steps to be undertaken outside of running the scripts. Customizations and integrations might need to be refactored.

Moving from one version of MOSIP to a newer version is a non-trivial exercise. Backward compatibility and migration scripts might provide only part of the migration. In order to take advantage of the newer features, workflow configuration, customization, integration, and infrastructural changes might be needed. Such an exercise must be undertaken as a project with complete testing and upgrade.