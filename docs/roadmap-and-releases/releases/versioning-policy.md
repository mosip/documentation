# MOSIP Versioning and Release Policy

## 1. Purpose

MOSIP follows two complementary release approaches: **platform releases** and **component releases**.

Platform releases provide a consolidated, validated baseline for countries and implementation partners that prioritize stability, predictable upgrades and a fully tested deployment path.

Component releases allow individual modules or coordinated groups of modules to evolve independently, enabling faster delivery of features, fixes and country-specific requirements without waiting for the next platform release.

This policy explains how MOSIP versions its software, how platform and component releases relate to each other, and how countries and implementers can choose the release approach that best suits their needs.

## 2. Understanding the MOSIP Release Model

### 2.1 Platform Releases

A platform release is a consolidated release of MOSIP that brings together selected, compatible versions of its required components and associated deployment artifacts into a validated platform baseline.

Platform releases are typically published every six to twelve months, depending on the roadmap, feature readiness and release validation.

Each platform release provides:

- A defined set of component versions and deployment artifacts.
    
- A consolidated release baseline validated by the MOSIP QA team.
    
- A documented upgrade path from the preceding supported platform baseline, where applicable.
    
- Release notes, deployment instructions, compatibility information and database migration guidance.
    
- A stable reference point for countries planning to adopt or upgrade their MOSIP deployment.
    

Platform releases are the recommended approach for countries and implementers who prioritize stability and want to follow a consolidated, fully tested release.

### 2.2 Component Releases

A component release is an independently published release of an individual MOSIP module or a coordinated group of related modules.

Component releases may be published whenever new features, bug fixes, security updates or country-specific requirements are ready for release. They do not have to coincide with a platform release.

Component releases allow individual repositories to evolve independently while retaining the existing platform baseline as the reference point for compatibility and testing.

Each component release must document, as applicable:

- The component name and version.
    
- New features, bug fixes and security updates.
    
- The platform version or versions to which the release applies.
    
- Dependencies on other components and any required coordinated upgrades.
    
- Database schema changes, migration scripts and upgrade instructions.
    
- Known limitations and compatibility considerations.
    

A component release does not automatically create a new platform release or change the component versions included in an already published platform release.

### 2.3 Relationship Between Platform and Component Releases

Platform releases and component releases serve different purposes and follow different release cadences.

A platform release establishes a consolidated baseline. Component releases published afterward may provide new capabilities or fixes for specific components without changing that baseline.

When a new platform release is published, it consolidates a selected set of component versions that have been validated together. It is not necessarily a collection of every component release published since the preceding platform release.

The published platform release documentation identifies the component versions included in that release.

## 3. MOSIP Versioning Conventions

MOSIP uses different versioning conventions for individual repositories and consolidated platform releases.

### 3.1 Component and Repository Versioning

MOSIP repositories and modules follow **Semantic Versioning 2.0.0 (SemVer)** for component-level releases.

Under SemVer, a version follows the format:

`MAJOR.MINOR.PATCH`

- **MAJOR:** Introduces incompatible API changes.
    
- **MINOR:** Introduces backward-compatible functionality.
    
- **PATCH:** Introduces backward-compatible bug fixes.
    

Where applicable, prerelease identifiers and build metadata follow the SemVer 2.0.0 specification.

Individual repository versions are maintained independently. Consequently, different components may have different version numbers and may release new versions at different times.

A component's version number must not be interpreted as the platform version or as proof that it is compatible with a particular platform baseline. Compatibility must be established through the release documentation.

### 3.2 Platform Versioning

MOSIP currently retains a four-part numeric versioning convention for platform releases.

This convention was retained to preserve continuity with the existing MOSIP 1.2.x platform line, which serves as a Long-Term Support (LTS) baseline. Moving the platform immediately to a conventional three-part SemVer scheme would change the versioning progression and could create confusion around the existing platform line and its maintenance releases.

The current platform convention therefore preserves the established platform version series while allowing the consolidated component versions to evolve.

For practical purposes:

- Individual repositories follow SemVer 2.0.0.
    
- The platform retains its established four-part version format.
    
- A platform release consolidates selected versions of the required components into a validated baseline.
    
- Platform version numbers and repository version numbers represent different things and must not be used interchangeably.
    

MOSIP intends to transition to SemVer 2.0.0 for a future new LTS platform line. This transition will be communicated explicitly to the community and implementing countries, including the implications for version identification, release history, compatibility and upgrade planning.

Until that transition is announced, users should follow the published platform versioning convention and the version information in the relevant release notes.

## 4. Choosing the Right Release Approach

MOSIP supports two approaches, depending on the requirements of the implementation.

### 4.1 Follow a Platform Release for Stability

Countries and implementation partners that prioritize stability should follow the recommended platform release.

This approach provides:

- A consolidated set of component versions validated together.
    
- A known platform baseline for deployment and operation.
    
- A documented and tested platform upgrade path.
    
- A coordinated set of release notes, configuration guidance and database migration instructions.
    

When moving from one platform release to another, implementers should follow the official upgrade documentation rather than independently upgrading components to their latest versions.

This is the preferred approach for production deployments that require predictable upgrades and a well-defined support baseline.

### 4.2 Adopt a Component Release for a Specific Requirement

A country or implementation partner may need a new feature, bug fix or security update from a particular component before the next platform release becomes available.

In this case, the implementer may adopt the relevant component release, provided that it is compatible with the deployed platform version and the required dependencies are addressed.

Before upgrading a component, implementers must:

1. Identify the component release that provides the required capability or fix.
    
2. Verify the target platform version and compatibility constraints in the release notes.
    
3. Review any dependent component upgrades that are required.
    
4. Review database schema changes and execute the documented migration steps, where applicable.
    
5. Follow the configuration, deployment and upgrade instructions.
    
6. Perform appropriate integration and regression testing in the target environment.
    

Component releases offer flexibility, but they require implementers to understand the dependencies and upgrade implications of the selected release.

A component release should not be assumed to have undergone the same full-platform validation as a consolidated platform release.

## 5. Compatibility and Testing

The distinction between platform releases and component releases is important when interpreting the scope of testing.

### Platform release validation

A platform release is validated as a consolidated baseline. The release process verifies the selected component versions together and provides a documented upgrade path for the platform.

### Component release validation

A component release is validated against the established platform baseline and the relevant components and dependencies required for that release.

The component release process does not require the complete platform release sequence to be repeated every time an individual component is updated. This allows modules to be released independently without requiring every repository to synchronize its version and release schedule.

However, implementers must follow the release-specific compatibility and dependency instructions. A component release is not automatically compatible with every MOSIP platform version.

The applicable test scope and compatibility constraints should be documented in the release notes.

## 6. Patches, Hotfixes and Maintenance Releases

A patch or hotfix may be published independently of a platform release to address a bug, security vulnerability or other urgent requirement.

Such a release may target a particular platform version or maintenance line.

The publication date determines where the release appears in the chronological release history. Its target platform and compatibility information determine which deployments can use it.

For example, a critical ID Repository patch targeting MOSIP Platform 1.2.0 must be identified as applicable to the 1.2.0 platform line. It must not be assumed to apply to Platform 1.3.0 merely because it was published after Platform 1.3.0.

Maintenance releases must identify:

- The affected component and its new version.
    
- The target platform version or maintenance line.
    
- Compatibility constraints and required dependencies.
    
- Security or bug-fix details, where appropriate.
    
- Required database migrations and upgrade instructions.
    
- Any limitations on applying the patch to other platform versions.
    

The publication of a component patch does not change the component versions recorded in an existing platform release manifest. A subsequent platform release may incorporate a later component version after the required validation.

Support availability and the duration of maintenance for each platform line are governed by the MOSIP Support Policy.

## 7. Release History and Documentation

The MOSIP Release History provides a chronological view of platform and component releases.

Platform releases act as consolidation milestones. Component releases appear according to their publication dates and identify the platform versions to which they apply.

The release history should make the following information available:

- Release date and release identifier.
    
- Release scope: platform, individual component or grouped components.
    
- Release category, such as feature release, patch, critical patch or prerelease, where applicable.
    
- Component versions included in each platform release.
    
- Platform compatibility and dependency information for component releases.
    
- Release notes, deployment instructions and database migration guidance.
    
- Links to relevant upgrade documentation and support information.
    

For a platform release, the published component-version manifest identifies the versions included in that baseline.

For a component release, the release notes identify its applicability and any additional upgrades required.

A component release may appear at the top of the global release history because it is the newest release while also being referenced in the maintenance history of an older platform line. These references represent the same release and must not be interpreted as separate releases.

## 8. Why MOSIP Uses Both Release Approaches

MOSIP introduced component-wise releases to reduce the dependencies between the release schedules of multiple repositories.

Under a fully synchronized release approach, the release of a platform could be delayed when a single component encountered a last-minute issue. Even when other components were ready, their releases could be held back because they were part of the same planned release sequence.

Component-wise releases address this limitation by allowing ready components to be released independently, subject to the applicable validation and compatibility requirements.

This approach provides several benefits:

- **Independent delivery:** Components can deliver features and fixes without waiting for every other repository.
    
- **Reduced release coupling:** A delay in one component does not automatically delay unrelated component releases.
    
- **Faster response:** Country-specific requirements and urgent fixes can be delivered when ready.
    
- **Clearer upgrade choices:** Implementers can choose between a consolidated platform baseline and a targeted component update.
    
- **Predictable platform adoption:** Countries that prioritize stability can continue to follow the fully tested platform release and upgrade path.
    

The two approaches are complementary. Platform releases provide a consolidated and predictable baseline, while component releases provide flexibility and agility between platform milestones.

## 9. Related Policies and Documentation

- **Release History:** Browse platform and component releases chronologically.
    
- **Platform Release Notes:** Review the consolidated component versions, release highlights and upgrade guidance for a platform release.
    
- **Component Release Notes:** Review component-specific changes, compatibility, dependencies and migration requirements.
    
- **MOSIP Support Policy:** Review support periods, maintenance commitments and supported platform versions.
    
- **Release Process:** Review the procedures for preparing, validating and publishing releases.
    
- **Upgrade Guides:** Follow the documented steps for platform upgrades and component-specific changes.