# Overview

Compliance Tool Kit (CTK) is an online portal that can be used by MOSIP partners to test the compliance of their product developed as per specifications (specs) published/adopted by MOSIP.

Currently, CTK supports testing of compliance with the below specifications:

1. **SBI**: Secure Biometric Interface (SBI) is used to interface with biometric devices. Device partners are required to build a software layer that provides a unified communication protocol for all biometric capture use cases. The specifications that should be followed are defined as Secure Biometrics Interface (SBI) specs. The compliance tool kit ensures that the interface built by the device provider follows the specs, and a certain level of security and integrity is defined in the SBI spec. The device hardware security features are not tested as part of this toolkit.

CTK also supports the testing with [Android SBI specifications](https://docs.mosip.io/1.1.5/biometrics/mosip-device-service-specification#android-sbi-specification).

2. **SDK**: Biometric Service Providers (BSPs) provide SDK implementation which supports quality check, match, extraction, and conversion of biometrics. MOSIP defines an [iBioAPI](https://github.com/mosip/commons/blob/master/kernel/kernel-biometrics-api/src/main/java/io/mosip/kernel/biometrics/spi/IBioApi.java) as the specification for this SDK implementation. Biometric SDK providers are also required to integrate this [HTTP service](https://github.com/mosip/biosdk-services/tree/release-1.2.0) into their solution. This allows running the SDK as an independent HTTP service. The compliance tool kit would make sure that these interfaces are as per the MOSIP-defined specifications for smooth interaction.

### How does Compliance Tool Kit work?

* To support compliance with the specifications, CTK has predefined test cases for each of the above specs.
* Each test case is run on a given method of the specs. Each test case defines the attributes required to create the request to be sent to the method.
* Each test case also defines the response expected from the method. In this response, various validators are run. Each validator will perform a predefined check on the response. If all validations are successful, the test case is passed otherwise it is a failed test case.
* Partners can use CTK to run these test cases to check if their implementation adheres to the MOSIP’s specs or not.

<figure><img src=".gitbook/assets/compliance-toolkit-flow-diagram.png" alt=""><figcaption></figcaption></figure>

### Compliance Tool Kit Portal

To set up the Compliance Tool Kit, refer to [How to set up CTK](setup-steps-0.0.9.md).

To use the CTK portal, refer to the [Compliance Tool Kit User Guide](user-guide.md).

### Build and deploy

To access the build and read through the deployment instructions, refer to the below-mentioned READMEs:

1. [Compliance Tool Kit README (backend)](https://github.com/mosip/mosip-compliance-toolkit/tree/develop#readme)
2. [Compliance Tool Kit UI README](https://github.com/mosip/mosip-compliance-toolkit-ui/tree/develop#readme)

### Configurations

For details related to the Compliance Tool Kit configurations, refer [Compliance Tool Kit configuration document](https://github.com/mosip/mosip-compliance-toolkit/tree/0.0.9-B1).

### Developer Guide

To be able to add new test cases to CTK, refer to [How to add more test cases](test-cases.md).

### Source code

To access the source code for Compliance Tool Kit, refer,

* [Compliance Tool Kit Backend](https://github.com/mosip/mosip-compliance-toolkit/tree/0.0.9-B1)
* [Compliance Tool Kit UI](https://github.com/mosip/mosip-compliance-toolkit-ui/tree/0.0.9-B1)
