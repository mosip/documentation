Once a foundation ID is in place for a country, the next step is to allow the verification of the ID holders for both government and private agencies to provide various services. Using the current authentication module for verification requires the relying parties to build custom components specific to the authentication module in various layers of their applications. It allows more flexibility for the relying parties like designing their own user interaction flow and request for very specific user details in KYC etc.

But a few straightforward applications like enabling unique login to their website, and fetching some basic details like name, age etc. does not need the above flexibilities but need a simple integration mechanism.

Hence, we have developed a new module called IdP (Identity Provider), which will be OpenID Connect and OAuth 2.0 compliant system and can be used by a relying party to perform quick and simple integration to any authentication system for user verification.

## Architecture Principles


## Build and deploy

To access the build and read through the deployment instructions, refer to the below mentioned READMEs:
1. [Compliance Tool Kit README (backend)](https://github.com/mosip/mosip-compliance-toolkit/tree/develop#readme)
2. [Compliance Tool Kit UI README](https://github.com/mosip/mosip-compliance-toolkit-ui/tree/develop#readme)

## Configurations

For details related to the Compliance Tool Kit configurations, refer [Compliance Tool Kit configuration document](https://github.com/mosip/mosip-compliance-toolkit/tree/0.0.9-B1).

## Developer Guide

To be able to add new test cases to CTK, refer [How to add more test cases](https://docs.mosip.io/1.2.0/modules/compliance-tool-kit/how-to-guides/ctk-test-cases).

## Source code

To access the source code for Compliance Tool Kit, refer, 
* [Compliance Tool Kit Backend](https://github.com/mosip/mosip-compliance-toolkit/tree/0.0.9-B1)
* [Compliance Tool Kit UI](https://github.com/mosip/mosip-compliance-toolkit-ui/tree/0.0.9-B1)

