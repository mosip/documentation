# Table of contents

* [MOSIP Platform](Platform.md)
    * [Releases](MOSIP-Releases.md)
        * [Release Notes 0.9.0](Release-Notes-0.9.0.md)
        * [Release Notes 1.0.0](Release-Notes-1.0.0.md)
            * [Features](Release-Notes-1.0.0-Features.md)
        * [Release Notes 1.0.5](Release-Notes-1.0.5.md)
        * [Release Notes 1.0.6](Release-Notes-1.0.6.md)
        * [Release Notes 1.1.0](Release-Notes-1.1.0.md)
            * [Features](Release-Notes-1.1.0-Features.md)
            * [Bug Fixes](Release-Notes-1.1.0-Bug-Fixes.md)
            * [Artifact Version](Release-Notes-1.1.0-Artifact-Version.md)
        * [Release Notes 1.1.1](Release-Notes-1.1.1.md)
            * [Bug Fixes](Release-Notes-1.1.1-Bug-Fixes.md)
            * [Artifact Version](Release-Notes-1.1.1-Artifact-Version.md)
        * [Release Notes 1.1.2](Release-Notes-1.1.2.md)
            * [Features](Release-Notes-1.1.2-Features.md)
            * [Bug Fixes](Release-Notes-1.1.2-Bug-Fixes.md)
    * [Roadmap](Roadmap.md)
        * [Roadmap Activities](Roadmap-Activities.md)
    * [Revision History](Revision-History.md)
    * [Planned Updates](Documentation-Updates.md)
* Community
    * [License](License.md)
    * [Code of Conduct](Code-of-Conduct.md)
    * [Issue Reporting Guideline](Issue-Reporting-Guideline.md)
    * Contributions
        * Contributors
        * [Contributor's Guide](Contributor-Guide.md)
        * [Call for Contribution](Call-for-Contribution.md)
        * Coding Standards
            * [Auth Angular User Guide](Auth-Angular-User-Guide.md)
            * [Auth SpringBoot User Guide](Auth-SpringBoot-User-Guide.md)
            * [Data Model Naming Standards](Data-Model-Naming-Standards.md)
            * [Encryption in DTO Layer](Encryption-in-DTO-Layer.md)
            * [Gitub Workflow](Github-Workflow.md)
            * [MOSIP Java Coding Standards](MOSIP-Java-Coding-Standards.md)
            * [MOSIP REST API guidelines](MOSIP-REST-API-guidelines.md)
            * [Registration Client UI Developer Document](Registration-Client-UI-Developer-Document.md)
            * [Registration Client Developer Documentation](Registration-Client-Developer-Documentation.md)
            * [Security Tools](Security-Tools.md)
* Overview
    * [Architecture and Design](Architecture.md)
        * [Guiding Principles](Architecture-Principles.md)
        * [MOSIP Architecture](Mosip-Architecture.md)
            * [Technology Stack](Technology-Stack.md)
    * Design Patterns
        * [MOSIP and Data](Data-Architecture.md)
            * [Naming Standards](Data-Model-Naming-Standards.md)
            * [Data-Model](MOSIP-Data-Model.md)
        * [Privacy & Security](Privacy-and-Security.md)    
            * [Cryptography in MOSIP](Encryption-in-DTO-Layer.md)
    * Features
    * [Terminology and Definitions](Glossary.md)
* Standards and Specifications
    * Biometrics 
        * [ABIS](Automated-Biometric-Identification-System-ABIS.md)
        * [Biometric SDK](Biometric-SDK.md)
        * [MDS Specification](MOSIP-Device-Service-Specification.md)
        * [Biometric Data Specification](Biometric-Data-Specification.md)
        * [CBEFF XML](CBEFF-XML.md)
    * [MOSIP Schema](MOSIP-Schema.md)
        * [ID Object Definition](MOSIP-ID-Object-Definition.md)
        * [UI Specification for Pre-registration](UI-Specification-for-Pre-Registration.md)
        * [UI Specification for Registration Client](UI-Specification-for-Registration-Client.md)
        * [VID Policy Schema](VID-Policy-Schema.md)
        * [Authentication Policy Schema](Auth-Policy-Schema.md)
        * [Data Share Policy Schema](Data-Share-Policy-Schema.md)
* Modules
    * MOSIP Core
    * [MOSIP Commons](Kernel.md)
        * [Audit Manager Functionality](Audit-Manager-Functionality.md)
        * [Authentication and Authorization Functionality](Authentication-and-Authorization-Functionality.md)      
        * [Common Services Functionality](Common-Services-Functionality.md)
        * [Data Services Functionality](Data-Services-Functionality.md)
		* [Data Share Functionality](Data-Share-Functionality.md)
        * [Master Data Services Functionality](Master-Data-Services-Functionality.md)
		* [Packet Manager Functionality](Packet-Manager-Functionality.md)
        * [UIN and VID Generation Service Functionality](UIN-and-VID-Generation-Service-Functionality.md)
		* [Web Sub Functionality](Web-Sub-Functionality.md)
	* [ID Repository](ID-Repository.md)
	    * [Credential Share Functionality](Credential-Share-Functionality.md)
    * Registration
        * [Pre-Registration](Pre-Registration.md)
            * [Pre-Registration Functionality](Pre-Registration-Functionality.md)
            * [Pre-Registration Configuration](Pre-Registration-Configuration.md)
        * [Registration](Registration-Client.md)
            * [Registration Functionality](Registration-Functionality.md)
            * [Registration Packet](Registration-Packet.md)
            * [Registration Client Setup](Registration-Client-Setup.md)
            * [First User Registration and Onboarding](First-User-Registration-and-Onboarding.md)
            * [Guide to Configure MOSIP for Biometrics](Guide-to-Configure-MOSIP-for-Biometrics.md)
            * [Guide to On-board Biometric Devices](Guide-to-On-board-Biometric-Devices.md)
            * [Device Integration Specifications](Device-Integration-Specifications.md)
        * [Registration Processor](Registration-Processor.md)
            * [Registration Processor Functionality](Registration-Processor-Functionality.md)
            * [Deduplication and Manual Adjudication](Deduplication-and-Manual-Adjudication.md)
    * Identity Services
        * [ID Authentication](ID-Authentication.md)
            * [ID Authentication Functionality](ID-Authentication-Functionality.md)
        * [Resident Services](Resident-Services.md)
            * [Resident Services Functionality](Resident-Services-Functionality.md)
    * Operations
        * [Partner Management](Partner-Management.md)
            * [Partner Management Functionality](Partner-Management-Functionality.md)
        * [Administration](Admin.md)
            * [Admin Services Functionality](Admin-Services-Functionality.md)
        * Reporting
    * Automation Testing
        * Proxies and Test Kits
        * Test Rigs
            * [Test Rig Design](Test-Rig-Design.md)
            * [Tester Documentation](Tester-Documentation.md)
            * [Testing Attachments   Kernel](Testing-Attachments---Kernel.md)
* API Docs
    * [ABIS APIs](ABIS-APIs.md)
    * [Admin APIs](Admin-APIs.md)
    * [AuthN and AuthZ APIs](AuthN-and-AuthZ-APIs.md)
    * [Biometric SDK APIs](Biometric-SDK-API-Specification.md)
    * [BlacklistedWords APIs](BlacklistedWords-APIs.md)
    * [Common APIs](Common-APIs.md)
    * [Device APIs](Device-APIs.md)
    * [Device Type and Subtype APIs](Device-Type-and-Subtype-APIs.md)
    * [Device Management APIs](Device-Management-APIs.md)
    * [Document APIs](Document-APIs.md)
	* [Dynamic Fields APIs](Dynamic-Fields-APIs.md)
    * [Holiday APIs](Holiday-APIs.md)
    * [ID Authentication APIs](ID-Authentication-APIs.md)
    * [ID Repository APIs](ID-Repository-APIs.md)
	* [ID Schema APIs](ID-Schema-APIs.md)
    * [Kernel APIs](Kernel-APIs.md)
    * [Machine APIs](Machine-APIs.md)
    * [Master Data Biometric APIs](Master-Data-Biometric-APIs.md)
    * [Packet APIs](Packet-APIs.md)
	* [Packet Manager APIs](Packet-Manager-APIs.md)
    * [Partner Management Service APIs](Partner-Management-Service-APIs.md)
    * [Pre Registration APIs](Pre-Registration-APIs.md)
    * [Registration Center APIs](Registration-Center-APIs.md)
    * [Registration Processor APIs](Registration-Processor-APIs.md)
    * [Resident Service APIs](Resident-Service-APIs.md)
	* [Sync Data APIs](Sync-Data-APIs.md)
    * [Template APIs](Template-APIs.md)
    * [Zone APIs](Zone-APIs.md)
* [MOSIP Guides](Guides.md)
    * [Getting Started Guide](Getting-Started.md)
    	* Planning
        * [Deploying](Build-and-Deploy.md)
            * [Deployment Architectures](Deployment-Architectures.md)
            * [Cell Based Deployment Architecture](Cell-Based-Deployment-Architecture.md)
            * [Hardware Security Module HSM Specifications](Hardware-Security-Module-HSM-Specifications.md)
            * [Hardware Sizing](Hardware-Sizing.md)
            * [Customizations for a Country](Customisations-for-a-Country.md)
            * Other Installation Guides
                * [Steps to Install and Configure HDFS](Steps-to-Install-and-Configure-HDFS.md)
                * [Steps to Install and use PostgreSql Version 10.2 on RHEL 7.5](Steps-to-Install-and-use-PostgreSql-Version-10.2-on-RHEL-7.5.md)
                * [Steps to Install Clam AntiVirus Version 0.101.0](Steps-to-Install-Clam-AntiVirus-Version-0.101.0.md)
                * [Steps to Install Keycloak Standalone Server](Steps-to-Install-Keycloak-Standalone-Server.md)
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
    * [Building On Mosip](Using-Mosip.md)
        * Identity Verification
        * Credentials and KYC
        * Service Delivery
        * Functional IDs
    * [Troubleshooting MOSIP](Troubleshooting.md)
        * Known issues and limitations
        * Frequenty asked questions
