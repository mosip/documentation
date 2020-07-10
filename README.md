# MOSIP
<div align="center">
    <a href="https://mosip.io">
        <img src="https://github.com/mosip/documentation/blob/master/docs/_images/mosip_logo.png"/>
    </a>
</div>

## Introduction
The Modular Open Source Identity Platform (MOSIP) helps Governments and other user organizations implement a digital, foundational identity system. Nations can use MOSIP freely as a core to build their own identity systems. Being modular in its architecture, MOSIP provides flexibility to countries in how they implement and configure their systems, and helps avoid vendor lock-in.

For more details on MOSIP documentation visit our documentation website, [docs.mosip.io](https://docs.mosip.io).

## Release 1.1
MOSIP 1.0 was a functional release of mosip with the core modules tested with biometrics. The 1.1 release of mosip builds upon the 1.0 version and adds more features, some new modules, engineering enhancements, performance and security tuning.

**Release Date:** July 03, 2020

**Code Base:** [github.com/mosip](https://github.com/mosip)

**Deployment Guide:** To deploy and test mosip you can use our [single click sandbox deployer](https://github.com/mosip/mosip-infra/tree/master/deployment/sandbox-v2)

### Key Highlights on Release 1.1

#### New Modules in MOSIP
MOSIP 1.1 has added APIs for partner management.

* **Partner Management**
    * Self-service authentication ecosystem partner (Relying party) on-boarding
    * API Key request and issue to partner with administrative approval
    * Administrative policy groups with support for multiple policies allowing various levels of authentication calls
    * De-activation and Re-activation support at partner and API key level

#### New Features
* **Commons**
    * ID Schema enhanced to support validators
    * UI Spec support added for dynamic UI
* **Pre-Registration**
    * Dynamic UI using ID Schema and UI Specification
    * Captcha Implementation during login
* **Registration Client**
    * Dynamic UI using ID Schema and UI Specification
    * Registering first user in MOSIP ecosystem
    * Public Key and Machine mapping checks for TPM and non-TPM machines
    * Generic master data sync
    * Spec changes for MDS (support for 0.9.5)
    * Spec changes for SDK (support for 0.9.0)
    * Implementation for new packet structure
* **Registration Processor**
    * Spec changes for ABIS (0.9.0)
    * Spec changes for SDK (0.9.0)
    * Device validation for registered devices
    * Packet reader utility to read packet with new packet structure
    * Input load throttling for SEDA bus through additional stage
* **Authentication**
    * Authentication as a separate module
    * Performance changes to IDA - Combining services for reduced network calls
    * Separate database for Authentication from the ID Repository
    * Zero knowledge storage
    * Caching for validations
    * Spec changes for SDK (support for 0.9.0)
    * Ecosystem support - Partner and API Key capabilities

#### Engineering Changes
* Automated deployment scripts for development, testing environments on Kubernetes
* Open build process using Travis
* GitHub actions, git commit id in builds
* Shift from private repository to public maven and  docker repositories
* Decoupling version of components from release version
* Gitbook based documentation

#### Technology Changes
* Keycloak for IAM
* ApacheDS ldap as user store deprecated
* Prometheus end points in all spring boot services
* Network HSM support added

(For more details on release 1.1 and older releases you can look at our [release documentation](https://docs.mosip.io/platform/mosip-releases))

### Next Release
Our next release 1.2 is a long term support release which will be tentatively available in Q4 of 2020. The features for the same will be published at [Release 1.2.0 Features](https://docs.mosip.io/platform/mosip-releases/release-notes-1.1.0/release-notes-1.2.0-features) soon.

---

## Contribute
You can contribute to MOSIP! 

We want to engage constructively with the community.  If you find a **vulnerability** or issue, please file a bug with the respective repository.  We welcome pull requests with fixes too.  Please see the [Contributor Guide](https://docs.mosip.io/platform/contribute/contributor-guide) on how to file bugs, contribute code, and more.

## License
This project is licensed under the terms of [Mozilla Public License 2.0](https://github.com/mosip/commons/blob/master/LICENSE)

## Communication
Join the [developer mailing list](https://groups.io/g/mosip-dev)


You may also be interested in joining our community room on Gitter via [![Gitter](https://badges.gitter.im/mosip-community/community.svg)](https://gitter.im/mosip-community/community?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)  where you could get some great community support
