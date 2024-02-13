# Additional Information

### Introduction

Modular Open Source Identity Platform (**MOSIP**) integrates a suite of Mock Services designed to emulate key functionalities of MOSIP services within the framework. In the development, testing, and demonstration phases, Mock Services will make available a controlled environment to evaluate MOSIP features.

This document details each of the mock services and explains its significance within the MOSIP architecture.

Below are the current set of Mock Services available in MOSIP, the services are subject to modifications, as may be planned,  in future releases. Please refer to the latest available version of the document.

1. [**Mock MDS (MOSIP Device Services)**](https://docs.mosip.io/1.1.5/biometrics/mosip-device-service-specification)

* Simulates device services for testing, authentication and delete registration functionalities.
* Allows developers to interact with a device-service environment without a physical device.

2. **Mock MV (Manual Verification)**

* Reproduces the manual verification process for testing and validation purposes.
* Enables the testing of manual verification workflows without human intervention.

3. #### [Mock ABIS (Automated Biometric Identification System)](https://docs.mosip.io/1.1.5/biometrics/automated-biometric-identification-system-abis) <a href="#id-3.-mock-abis-automated-biometric-identification-system" id="id-3.-mock-abis-automated-biometric-identification-system"></a>

* Simulates the functionality of the Automated Biometric Identification System (ABIS).
* Facilitates testing of biometric matching, search, and integration with ABIS without accessing production data.
* Maintains resident biometric uniqueness through de-duplication.
* Interfaces with MOSIP via message queues in JSON format.
* Supports 1:N de-duplication and adheres to ABIS API Specifications.

4. #### [Mock SDK (Software Development Kit)](https://docs.mosip.io/1.1.5/biometrics/biometric-sdk) <a href="#id-4.-mock-sdk-software-development-kit" id="id-4.-mock-sdk-software-development-kit"></a>

* Replicates MOSIP's Biometric Software Development Kit (SDK) for testing and debugging purposes.
* Allows developers to integrate biometric functionalities into applications without connecting to physical device.
* Used for 1:N match, quality, extraction, etc.
* Simulation is available as Mock BioSDK, installed in the MOSIP sandbox.
* Exposes REST APIs for 1:1 match and quality check at the MOSIP backend.

5. #### Mock SMTP (Simple Mail Transfer Protocol) <a href="#id-5.-mock-smtp-simple-mail-transfer-protocol" id="id-5.-mock-smtp-simple-mail-transfer-protocol"></a>
