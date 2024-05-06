# 1.2.1.0 (ID Authentication)

## Release Notes

**Release Version**: 1.2.1.0

**Release Date**: 3rd May 2024

We're excited to announce a significant enhancement geared towards refining the authentication process within our system. This improvement targets the seamless resolution of UIN / VID-related errors encountered by users during authentication attempts. This release also includes a fix of a critical bug related to ID Authentication.

**Major Areas of Work**

* ID Authentication

**New feature**:

*   **Authentication Error Eventing**: Users registered with a valid UIN / VID can proceed with authentication seamlessly. In cases where an error arises due to the unavailability of UIN / VID during authentication, application prompts a message to retry after a few minutes. Simultaneously, the Kafka event will be triggered to publish the data to the topic, and subscribers will receive a message for subsequent processing. You can refer [here](https://docs.mosip.io/1.2.0/modules/id-authentication-services#authentication-error-eventing) for further information.

    **Note**: This feature will exclusively be accessible in ID Authentication version 1.2.1.0. Users are required to set up this latest version on their existing platform version 1.2.0.x.

### Bug fix

* During the authentication process, if the `authStatus` is false, the `authToken` should not be shared. However, there was an issue where the system was sending the authToken value even when the `authStatus` was false. This issue has been addressed and fixed. Now, when the `authStatus` is `false`, the `authToken` will no longer be shared. [#MOSIP-30293](https://mosip.atlassian.net/browse/MOSIP-30293).

## Repository Released

| Repositories      | Tags Released                                                        |
| ----------------- | -------------------------------------------------------------------- |
| id-authentication | [v1.2.1.0](https://github.com/mosip/id-authentication/tree/v1.2.1.0) |

## Known Issues

NA

## Documentation

* [Feature Documentation](https://docs.mosip.io/1.2.0/modules/id-authentication-services#authentication-error-eventing)
* [Functional Test Report](https://docs.mosip.io/1.2.0/releases/1.2.1.0/test-report)
