# Table of contents

* [MOSIP Platform](platform/Platform.md)
    * [Releases](platform/releases/MOSIP-Releases.md)
        * [Release Notes 0.9.0](platform/releases/Release-Notes-0.9.0.md)
        * [Release Notes 1.0.0](platform/releases/Release-Notes-1.0.0.md)
            * [Features](platform/releases/Release-Notes-1.0.0-Features.md)
        * [Release Notes 1.0.5](platform/releases/Release-Notes-1.0.5.md)
        * [Release Notes 1.0.6](platform/releases/Release-Notes-1.0.6.md)
        * [Release Notes 1.1.0](platform/releases/Release-Notes-1.1.0.md)
            * [Features](platform/releases/Release-Notes-1.1.0-Features.md)
            * [Bug Fixes](platform/releases/Release-Notes-1.1.0-Bug-Fixes.md)
            * [Artifact Version](platform/releases/Release-Notes-1.1.0-Artifact-Version.md)
        * [Release Notes 1.1.1](platform/releases/Release-Notes-1.1.1.md)
            * [Bug Fixes](platform/releases/Release-Notes-1.1.1-Bug-Fixes.md)
            * [Artifact Version](platform/releases/Release-Notes-1.1.1-Artifact-Version.md)
        * [Release Notes 1.1.2](platform/releases/Release-Notes-1.1.2.md)
            * [Features](platform/releases/Release-Notes-1.1.2-Features.md)
            * [Bug Fixes](platform/releases/Release-Notes-1.1.2-Bug-Fixes.md)
    * [Roadmap](platform/roadmap/Roadmap.md)
        * [Roadmap Activities](platform/roadmap/Roadmap-Activities.md)
    * [Revision History](platform/Revision-History.md)
    * [Planned Updates](platform/Documentation-Updates.md)
* Community
    * [License](community/License.md)
    * [Code of Conduct](community/Code-of-Conduct.md)
    * [Issue Reporting Guideline](community/Issue-Reporting-Guideline.md)
    * Contributions
        * [Contributors](community/contributions/Contributors.md)
        * [Contributor's Guide](community/contributions/Contributor-Guide.md)
        * [Call for Contribution](community/contributions/Call-for-Contribution.md)
        * Coding Standards
            * [Auth Angular User Guide](community/contributions/coding-standards/Auth-Angular-User-Guide.md)
            * [Auth SpringBoot User Guide](community/contributions/coding-standards/Auth-SpringBoot-User-Guide.md)
            * [Data Model Naming Standards](community/contributions/coding-standards/Data-Model-Naming-Standards.md)
            * [GitHub Work-flow](community/contributions/coding-standards/Github-Workflow.md)
            * [MOSIP Java Coding Standards](community/contributions/coding-standards/MOSIP-Java-Coding-Standards.md)
            * [MOSIP REST API guidelines](community/contributions/coding-standards/MOSIP-REST-API-guidelines.md)
            * [Registration Client UI Developer Document](community/contributions/coding-standards/Registration-Client-UI-Developer-Document.md)
            * [Registration Client Developer Documentation](community/contributions/coding-standards/Registration-Client-Developer-Documentation.md)
            * [Security Tools](community/contributions/coding-standards/Security-Tools.md)
* Overview
    * [Architecture and Design](overview/architecture/Architecture.md)
        * [Guiding Principles](overview/architecture/Architecture-Principles.md)
        * [MOSIP Architecture](overview/architecture/MOSIP-Architecture.md)
            * [Technology Stack](overview/architecture/Technology-Stack.md)
    * Design Patterns
        * [MOSIP and Data](overview/design/Data-Architecture.md)
            * [Naming Standards](overview/design/Data-Model-Naming-Standards.md)
            * [Data Model](overview/design/MOSIP-Data-Model.md)
        * [Privacy & Security](overview/design/Privacy-and-Security.md)
    * Features
    * [Terminology and Definitions](overview/Glossary.md)
* Standards and Specifications
    * Biometrics 
        * [ABIS](standards/biometrics/Automated-Biometric-Identification-System-ABIS.md)
        * [Biometric SDK](standards/biometrics/Biometric-SDK.md)
        * [MDS Specification](standards/biometrics/MOSIP-Device-Service-Specification.md)
        * [Biometric Data Specification](standards/biometrics/Biometric-Data-Specification.md)
        * [CBEFF XML](standards/biometrics/CBEFF-XML.md)
    * MOSIP Schema
        * [ID Object Definition](standards/schemas/MOSIP-ID-Object-Definition.md)
        * [UI Specification for Pre-registration](standards/schemas/UI-Specification-for-Pre-Registration.md)
        * [UI Specification for Registration Client](standards/schemas/UI-Specification-for-Registration-Client.md)
        * [VID Policy Schema](standards/schemas/VID-Policy-Schema.md)
        * [Authentication Policy Schema](standards/schemas/Auth-Policy-Schema.md)
        * [Data Share Policy Schema](standards/schemas/Data-Share-Policy-Schema.md)
* Modules
    * MOSIP Core
    * [MOSIP Commons](modules/mosip-commons/Kernel.md)
        * [Audit Manager Functionality](modules/mosip-commons/Audit-Manager-Functionality.md)
        * [Authentication and Authorization Functionality](modules/mosip-commons/Authentication-and-Authorization-Functionality.md)      
        * [Common Services Functionality](modules/mosip-commons/Common-Services-Functionality.md)
        * [Data Services Functionality](modules/mosip-commons/Data-Services-Functionality.md)
		* [Data Share Functionality](modules/mosip-commons/Data-Share-Functionality.md)
        * [Master Data Services Functionality](modules/mosip-commons/Master-Data-Services-Functionality.md)
		* [Packet Manager Functionality](modules/mosip-commons/Packet-Manager-Functionality.md)
        * [UIN and VID Generation Service Functionality](modules/mosip-commons/UIN-and-VID-Generation-Service-Functionality.md)
		* [Web Sub Functionality](modules/mosip-commons/Web-Sub-Functionality.md)
	* [ID Repository](modules/id-repository/ID-Repository.md)
	    * [Credential Share Functionality](modules/id-repository/Credential-Share-Functionality.md)
    * Registration
        * [Pre-Registration](modules/registration/pre-registration/Pre-Registration.md)
            * [Pre-Registration Functionality](modules/registration/pre-registration/Pre-Registration-Functionality.md)
            * [Pre-Registration Configuration](modules/registration/pre-registration/Pre-Registration-Configuration.md)
        * [Registration](modules/registration/client/Registration-Client.md)
            * [Registration Functionality](modules/registration/client/Registration-Functionality.md)
            * [Registration Packet](modules/registration/client/Registration-Packet.md)
            * [Registration Client Setup](modules/registration/client/Registration-Client-Setup.md)
            * [First User Registration and Onboarding](modules/registration/client/First-User-Registration-and-Onboarding.md)
            * [Guide to Configure MOSIP for Biometrics](modules/registration/client/Guide-to-Configure-MOSIP-for-Biometrics.md)
            * [Guide to On-board Biometric Devices](modules/registration/client/Guide-to-On-board-Biometric-Devices.md)
            * [Device Integration Specifications](modules/registration/client/Device-Integration-Specifications.md)
        * [Registration Processor](modules/registration/processor/Registration-Processor.md)
            * [Registration Processor Functionality](modules/registration/processor/Registration-Processor-Functionality.md)
            * [Deduplication and Manual Adjudication](modules/registration/processor/Deduplication-and-Manual-Adjudication.md)
    * Identity Services
        * [ID Authentication](modules/identity-services/id-authentication/ID-Authentication.md)
            * [ID Authentication Functionality](modules/identity-services/id-authentication/ID-Authentication-Functionality.md)
        * [Resident Services](modules/identity-services/resident-services/Resident-Services.md)
            * [Resident Services Functionality](modules/identity-services/resident-services/Resident-Services-Functionality.md)
    * Operations
        * [Partner Management](modules/operations/partner-management/Partner-Management.md)
            * [Partner Management Functionality](modules/operations/partner-management/Partner-Management-Functionality.md)
        * [Administration](modules/operations/administration/Admin.md)
            * [Admin Services Functionality](modules/operations/administration/Admin-Services-Functionality.md)
        * [Reporting](modules/operations/reporting/Reporting.md)
    * Automation Testing
        * Proxies and Test Kits
        * Test Rigs
            * [Test Rig Design](modules/testing/Test-Rig-Design.md)
            * [Tester Documentation](modules/testing/Tester-Documentation.md)
* API Docs
    * [ABIS APIs](api-reference/ABIS-APIs.md)
    * [Admin APIs](api-reference/Admin-APIs.md)
    * [Authentication and Authorization APIs](api-reference/AuthN-and-AuthZ-APIs.md)
    * [Biometric SDK APIs](api-reference/Biometric-SDK-API-Specification.md)
    * [BlacklistedWords APIs](api-reference/BlacklistedWords-APIs.md)
    * [Common APIs](api-reference/Common-APIs.md)
	* [Credential Issuace APIs.md](api-reference/Credential-Issuance-APIs.md)
	* [Data Share APIs](api-reference/Data-Share-APIs.md)
    * [Device APIs](api-reference/Device-APIs.md)
    * [Device Management APIs](api-reference/Device-Management-APIs.md)
	* [Device Type and Subtype APIs](api-reference/Device-Type-and-Subtype-APIs.md)
    * [Document APIs](api-reference/Document-APIs.md)
	* [Dynamic Fields APIs](api-reference/Dynamic-Fields-APIs.md)
    * [Holiday APIs](api-reference/Holiday-APIs.md)
    * [ID Authentication APIs](api-reference/ID-Authentication-APIs.md)
    * [ID Repository APIs](api-reference/ID-Repository-APIs.md)
	* [ID Schema APIs](api-reference/ID-Schema-APIs.md)
    * [Kernel APIs](api-reference/Kernel-APIs.md)
    * [Machine APIs](api-reference/Machine-APIs.md)
    * [Master Data Biometric APIs](api-reference/Master-Data-Biometric-APIs.md)
    * [Packet APIs](api-reference/Packet-APIs.md)
	* [Packet Manager APIs](api-reference/Packet-Manager-APIs.md)
    * [Partner Management Service APIs](api-reference/Partner-Management-Service-APIs.md)
    * [Pre Registration APIs](api-reference/Pre-Registration-APIs.md)
    * [Registration Center APIs](api-reference/Registration-Center-APIs.md)
    * [Registration Processor APIs](api-reference/Registration-Processor-APIs.md)
    * [Resident Service APIs](api-reference/Resident-Service-APIs.md)
	* [Sync Data APIs](api-reference/Sync-Data-APIs.md)
    * [Template APIs](api-reference/Template-APIs.md)
    * [Zone APIs](api-reference/Zone-APIs.md)
* [MOSIP Guides](guides/Guides.md)
    * [Getting Started Guide](guides/getting-started/Getting-Started.md)
    	* [Planning](guides/getting-started/Planning.md)
        * [Deploying](guides/getting-started/Build-and-Deploy.md)
            * [Deployment Architectures](guides/getting-started/Deployment-Architectures.md)
            * [Cell Based Deployment Architecture](guides/getting-started/Cell-Based-Deployment-Architecture.md)
            * [Hardware Security Module HSM Specifications](guides/getting-started/Hardware-Security-Module-HSM-Specifications.md)
            * [Hardware Sizing](guides/getting-started/Hardware-Sizing.md)
            * [Customizations for a Country](guides/getting-started/Customisations-for-a-Country.md)
            * Other Installation Guides
                * [Steps to Install and Configure HDFS](guides/getting-started/Steps-to-Install-and-Configure-HDFS.md)
                * [Steps to Install and use PostgreSql Version 10.2 on RHEL 7.5](guides/getting-started/Steps-to-Install-and-use-PostgreSql-Version-10.2-on-RHEL-7.5.md)
                * [Steps to Install Clam AntiVirus Version 0.101.0](guides/getting-started/Steps-to-Install-Clam-AntiVirus-Version-0.101.0.md)
                * [Steps to Install Keycloak Standalone Server](guides/getting-started/Steps-to-Install-Keycloak-Standalone-Server.md)
        * Configuring
        * Customizing
        * Extending
        * Integrating
        * Testing
        * Scaling
        * Monitoring
        * Securing
        * Maintaining
        * Upgrading
        * Auditing
        * Troubleshooting
    * [Building On MOSIP](guides/using-mosip/Using-MOSIP.md)
        * Identity Verification
        * Credentials and KYC
        * Service Delivery
        * Functional IDs
    * [Troubleshooting MOSIP](guides/troubleshooting/Troubleshooting.md)
        * Known issues and limitations
        * Frequenty asked questions
