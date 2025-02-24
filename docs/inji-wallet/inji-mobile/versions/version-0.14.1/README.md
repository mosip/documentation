# Version 0.14.1

**Release Name:** Inji Wallet 0.14.1(Patch)

**Release Type:** Developer

**Release Date:** 24th Feb, 2025

## **Overview**

This patch release addresses a critical issue related to iOS dependency management, specifically fixing the checksum of the Boost library to enable a successful build and republishing of the iOS TestFlight release.

## **Key Highlights**

* **Fixed:** Checksum issue with Boost dependency in iOS, ensuring successful package installation.
* **iOS TestFlight Republish:** The previous TestFlight build for **release**-[**0.14.0**](https://github.com/mosip/mimoto/tree/v0.14.0) expired due to the 90-day limit. This patch enables republishing without requiring additional changes to the release branch.
* **Build Process Improvement:** The IPA is rebuilt and republished from the same branch, ensuring smooth distribution on TestFlight.

This patch ensures that iOS builds remain functional and available for testing and deployment.

{% hint style="info" %}
**Note**: The current release does not alter the android-build, it stays unchanged and is same as with Inji 0.14.0.
{% endhint %}

## **Repository Released**

| **Module**         | **Version**                                                     |
| ------------------ | --------------------------------------------------------------- |
| Inji Mobile Wallet | [**0.14.1**](https://github.com/mosip/inji-wallet/tree/v0.14.1) |

## **Compatible Modules**

| **Module**                | **Version**                                                                    |
| ------------------------- | ------------------------------------------------------------------------------ |
| Mimoto                    | [**0.14.0**](https://github.com/mosip/mimoto/tree/v0.14.0)                     |
| Inji-config               | [**v0.3.0**](https://github.com/mosip/inji-config/tree/v0.3.0)                 |
| eSignet                   | [**v1.4.1**](https://github.com/mosip/esignet/tree/v1.4.1)                     |
| Inji Verify               | [**v0.10.0**](https://github.com/mosip/inji-verify/tree/v0.10.0)               |
| tuvali                    | [**v0.5.1**](https://github.com/mosip/tuvali/tree/v0.5.1)                      |
| tuvali-ios-swift          | [**v0.5.0**](https://github.com/mosip/tuvali-ios-swift/releases/tag/v0.5.0)    |
| secure-Keystore           | [**v0.2.1**](https://github.com/mosip/secure-keystore/tree/v0.2.1)             |
| pixelpass                 | [**v0.2.1**](https://github.com/mosip/pixelpass/tree/v0.2.1)                   |
| pixelpass-ios-swift       | [**v0.2.0**](https://github.com/mosip/pixelpass-ios-swift/releases/tag/v0.2.0) |
| Inji-vci-client           | [**v0.1.1**](https://github.com/mosip/inji-vci-client/tree/v0.1.1)             |
| Inji-vci-client-ios-swift | [**v0.1.1**](https://github.com/mosip/inji-vci-client-ios-swift/tree/v0.1.1)   |

## **Known Issues**

The list of known issues can be found [**here**](https://mosip.atlassian.net/jira/software/c/projects/INJIMOB/issues/?jql=project%20%3D%20%22INJIMOB%22%20AND%20type%20%3D%20Bug%20AND%20status%20IN%20%28New%2C%20Assigned%29%20ORDER%20BY%20created%20DESC)**.**

## **Bug Fixes**

| **Jira Issue**                                                                 | **Issue Description**                                      |
| ------------------------------------------------------------------------------ | ---------------------------------------------------------- |
| [**Inji Mobile Wallet-2653**](https://mosip.atlassian.net/browse/INJIMOB-2653) | iOS build failing in PR run due to failing \`pod install\` |

## **Documentation Details:**

* [**Feature Documentation**](https://docs.mosip.io/inji/inji-mobile-wallet/overview/features)
* [**Integration Guides**](https://docs.mosip.io/inji/inji-mobile-wallet/integration-guide)
* [**User Guide**](https://docs.mosip.io/inji/inji-mobile-wallet/end-user-guide)
* [**API Documentation**](https://github.com/mosip/mimoto/tree/v0.14.0/docs/postman-collections)
