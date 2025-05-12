# Version 0.11.1

**Release Name**: Inji Verify 0.11.1 (Patch)

**Support**: Developer Release

**Release Date**: 12th May, 2025

### **Overview**

Inji Verify 0.11.1 focuses on ensuring seamless interoperability with Inji Mobile Wallet version 0.16.0 by aligning with the [OpenID4VP - Draft 21 specification](https://openid.net/specs/openid-4-verifiable-presentations-1_0-21.html#section-9.1). This patch incorporates the following key updates required for compatibility with the mobile wallets following OpenID4VP specification (Draft 21):

1. **QR Data Encoding:** QR data is now URL-encoded instead of Base64-encoded.
2. **Mandatory** vp\_format&#x73;**:** When client\_metadata is provided, the vp\_formats parameter is now mandatory to ensure proper format negotiation between wallet and verifier.

{% hint style="warning" %}
**Note:** We reccommend users to upgrade to **Inji Verify v0.11.1** instead of using **v0.11.0**, as the **OpenID4VP Cross-Device Flow** does not function as expected in v0.11.0. _(Refer to_ [_MOSIP Community Announcement_](https://community.mosip.io/t/important-announcement-openid4vp-cross-device-flow-non-functional-in-inji-verify-v0-11-0/1990) _for more details)._

Additionally, please note that the OpenID4VP Cross-Device Flow is compatible only with Inji Mobile Wallet v0.16.0. It is not supported with v0.15.0 as the two key updates (**QR Data Encoding** and **Mandatory vp\_formats**), required for compatibility, have been incorporated starting v0.16.0 of Inji Mobile Wallet.
{% endhint %}

### **Repositories: Released/Dependent**

| Repositories | Tags: Released/Dependent                                     |
| ------------ | ------------------------------------------------------------ |
| Inji Verify  | [v0.11.1](https://github.com/mosip/inji-verify/tree/v0.11.1) |

### **Compatible modules**

The following table outlines the tested and certified compatibility of Inji Verify 0.11.1 with other modules.

| Module              | Version                                                      |
| ------------------- | ------------------------------------------------------------ |
| Inji Wallet         | [v0.16.0](https://github.com/mosip/inji-wallet/tree/v0.16.0) |
| Inji Web            | [v0.10.0](https://github.com/mosip/inji-web/tree/v0.10.0)    |
| Pixel-Pass library  | [v0.5.0](https://github.com/mosip/pixelpass/tree/v0.5.0)     |
| vc-verifier library | [v1.2.0](https://github.com/mosip/vc-verifier/tree/v1.2.0)   |

### **Known Issue**

| Jira ID                                                         | Description                                                                                                                                                                              |
| --------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [INJIVER-1137](https://mosip.atlassian.net/browse/INJIVER-1137) | OpenID4VP - Cross device flow is not working in iOS (works only on Inji mobile wallet in Android phones currently). The supported fix will be provided in 0.12.0 which will be out soon. |



### **Bug Fixes**

Below is the list of fixes as part of the **0.11.1** release:

| Jira ID                                                         | Description                                                                                                                          |
| --------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------ |
| [INJIVER-1084](https://mosip.atlassian.net/browse/INJIVER-1084) | VC result is incorrectly displayed under the **Upload** tab When a Verifiable Credential (VC) is scanned using the **Scan** feature. |
| [INJIVER-1086](https://mosip.atlassian.net/browse/INJIVER-1086) | VP Verification is not compatible with Inji Mobile 0.16.0                                                                            |

### **Documentation**

* [Feature documentation](https://docs.inji.io/inji-verify/overview)
* [User guide](https://docs.inji.io/inji-verify/functional-overview/end-user-guide)
* [Workflow](https://docs.inji.io/inji-verify/functional-overview/workflow)
* [Local Setup](https://docs.inji.io/inji-verify/build-and-deploy/local-setup)
* [Collab Guide](https://docs.inji.io/inji-verify/functional-overview/releases-1/inji-verify-collab-guide)
* [QA Report](https://docs.inji.io/inji-verify/releases/version-0.11.1/test-report)
