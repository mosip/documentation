# Authenticator Plugin

The Authenticator plugin is the main interface for eSignet, which provides methods to authenticate the end-user with control of the supported authentication factors and a method to fetch consented user information from the Identity system.

The two main functionalities of the authenticator interface, **KYC Auth** and **KYC Exchange,** are depicted in the below diagram

<figure><img src="../../../.gitbook/assets/activity-diagrams-authenticator (1).png" alt=""><figcaption></figcaption></figure>

For eSignet Authentication Interface refer to the [Link](https://github.com/mosip/esignet/blob/master/esignet-integration-api/src/main/java/io/mosip/esignet/api/spi/Authenticator.java)

## Who should implement the Authenticator plugin interface?

The authenticator plugin is implemented by any organization - public or private, that wishes to integrate its identity system with eSignet to enable digital identity usage

An Identity system can be as simple as a table in a database or an Excel file storing user identity data or it can be a complex Identity System.

## How to implement this plugin?

Any organization intending to integrate eSignet with an [identity system](../../../general/glossary.md) of its choice must make necessary customizations to the authenticator plugin. These modifications ensure that the plugin can seamlessly interface with the target identity system and support its specific authentication and verification workflows. This approach enables eSignet to integrate efficiently with a wide range of identity systems.

The reference implementations for eSignet integration with MOCK and MOSIP ID are available. Please refer below for more details

1. Please refer to how our [mock-plugin](https://github.com/mosip/esignet-plugins/blob/master/mock-plugin/src/main/java/io/mosip/esignet/plugin/mock/service/MockAuthenticationService.java) implements the eSignet Authenticator plugin to integrate eSignet with the mock identity system.
2. Also, look at the  [MOSIP plugin](https://github.com/mosip/esignet-plugins/blob/master/mosip-identity-plugin/src/main/java/io/mosip/esignet/plugin/mosipid/service/IdaAuthenticatorImpl.java) reference implementation enabling the eSignet integration with the MOSIP identity system.
