# Mock Services

## Introduction

Modular Open Source Identity Platform (MOSIP) integrates a suite of Mock Services designed to emulate key functionalities of MOSIP services within the framework. In the development, testing, and demonstration phases, Mock Services will make available a controlled environment to evaluate MOSIP features. Developers and testers can refer to this documentation to gain a comprehensive understanding of the structure and functionality of each Mock Service within the MOSIP framework.

{% hint style="info" %}
Mock Services are not intended to be a substitute for production systems. Instead, their purpose is to facilitate evaluation during the development and testing stages.
{% endhint %}

### Benefits of using Mock Services

1. **Faster Development and Testing:** Enables rapid development and testing cycles without need to access to production systems.
2. **Reduced Costs:** Avoids the need for production resources, lowering development and testing costs.
3. **Controlled Environment:** Testing with Mock Services provides consistent and predictable behavior, ideal to isolate and troubleshoot.
4. **Data Privacy:** Sensitive data remains secure, as development and testing occur with mock data.

This document details each of the Mock Services and explains its significance within the MOSIP architecture.

### Mock Services in MOSIP

Below mentioned are the current set of mock services available in MOSIP.

1. **Mock MDS** ([MOSIP Device Services](https://docs.mosip.io/1.1.5/biometrics/mosip-device-service-specification))
   * Simulates device services for testing, authentication, and delete registration functionalities.
   * Allows developers to interact with a device-service environment without a physical device.
2. **Mock MV** (Manual Verification)
   * Reproduces the manual verification process for testing and validation purposes.
   * Enables the testing of manual verification workflows without human intervention.
3. **Mock ABIS** ([Automated Biometric Identification System](https://docs.mosip.io/1.2.0/\~/changes/EDXkAXJ2BnUpKbwo76Y3/biometrics/abis))
   * Simulates the functionality of the Automated Biometric Identification System (ABIS).
   * Facilitates testing of biometric matching, searching, and integrating with ABIS without accessing production data.
   * Maintains resident biometric uniqueness through de-duplication.
   * Interfaces with MOSIP via message queues in JSON format.
   * Supports 1:N de-duplication and adheres to [ABIS API](https://docs.mosip.io/1.2.0/\~/changes/EDXkAXJ2BnUpKbwo76Y3/biometrics/abis-api) Specifications.
4. **Mock SDK** ([Software Development Kit](https://docs.mosip.io/1.2.0/biometrics/biometric-sdk))
   * Replicates MOSIP's Biometric Software Development Kit (SDK) for testing and debugging.
   * Allows developers to integrate biometric functionalities into applications without connecting to a physical device.
   * Used for 1:N match, quality, and extraction, etc.
   * Simulation is available as Mock BioSDK, installed in the MOSIP sandbox.
   * Exposes REST APIs for 1:1 match and quality check at the MOSIP backend.
5.  **Mock SMTP** (Simple Mail Transfer Protocol)

    * Simulates an SMTP server for testing email notifications without sending actual emails.
    * Enables the testing of communication workflows and email content.

    **Mock SMTP Server**

    * Is installed as part of the default MOSIP installation.
    * Mimics real SMTP server behavior for testing and development purposes.

### Modules utilizing MOSIP Mock Services

MOSIP uses Mock Services in the following modules:

#### Registration Client

The [Registration Client](registration-client/) module uses below mentioned Mock Services during the execution of the registration process. To capture biometric data, check the quality of the captured biometric data, etc., the following services are run:

* **Mock MDS** ([MOSIP Device Service](https://docs.mosip.io/1.1.5/biometrics/mosip-device-service-specification)): The Registration Client module interacts with Mock MDS to capture biometric data during the registration. This facilitates the development of simulated biometrics, which are crucial for finalizing the registration process and generating the Unique Identification Number (UIN).
* **Mock SDK** ([Software Development Kit](https://docs.mosip.io/1.2.0/biometrics/biometric-sdk)): The Registration Client module interacts with mock SDK to perform 1:N match for biometrics, extracts biometric templates, and checks the quality of the captured biometrics.

#### Registration Processor

Mock Services help [Registration Processor](registration-processor/) to process packets by providing support to emulate key functionalities such as search for the duplicate biometric data, to perform manual verification, and to check the quality of the captured biometric data.

Mentioned below are the services utilized by the Registration Processor module to facilitate the functions.

* **Mock ABIS** ([Automated Biometric Identification System](https://docs.mosip.io/1.2.0/\~/changes/EDXkAXJ2BnUpKbwo76Y3/biometrics/abis)): Registration Processor module interacts with mock ABIS for testing matching performance and error handling.
* **Mock MV** (Manual Verification): Registration Processor module interacts with Mock MV to process the packets that are marked for manual verification.
* **Mock SDK** ([Software Development Kit](https://docs.mosip.io/1.2.0/biometrics/biometric-sdk)): Registration Processor module interacts with Mock SDK to check the quality of the captured biometrics and for authentication purposes.

#### ID Authentication

[ID Authentication](https://docs.mosip.io/1.2.0/modules/id-authentication-services) module also utilizes the mock services during development, testing, and demonstration phases. It uses Mock SDK to carry out the biometric authentication.

Furthermore, the development and improvement of Mock Services is an ongoing and evolving process.&#x20;
