# Version 0.11.1

**Release Name**: Inji Verify 0.11.1 (Patch)

**Support**: Developer Release

**Release Date**: Coming Soon

&#x20;

### **Overview**

Inji Verify 0.11.1 focuses on ensuring seamless interoperability with Inji Mobile Wallet version 0.16.0 by aligning with the [OpenID4VP - Draft 21 specification](https://openid.net/specs/openid-4-verifiable-presentations-1_0-21.html#section-9.1). This patch incorporates the following key updates required for compatibility with the mobile wallets following OpenID4VP specification (Draft 21):

1. **QR Data Encoding:** QR data is now URL-encoded instead of Base64-encoded.
2. **Mandatory** vp\_format&#x73;**:** When client\_metadata is provided, the vp\_formats parameter is now mandatory to ensure proper format negotiation between wallet and verifier.

### **Repositories: Released/Dependent**

| **Repositories**    | **Tags: Released/Dependent** |
| ------------------- | ---------------------------- |
| Inji Verify         | **v0.11.1**                  |
| vc-verifier library | v1.2.0                       |

### **Compatible modules:**

The following table outlines the tested and certified compatibility of Inji Verify 0.11.1 with other modules.

| Module             | Version     |
| ------------------ | ----------- |
| **Inji Wallet**    | **v0.16.0** |
| Inji Web           | v0.10.0     |
| Pixel-Pass library | v0.5.0      |

### **Bug Fixes**

Below is the list of fixes as part of the **0.11.1** release:

| **Jira ID**                                                     | **Description**                                                                                                                      |
| --------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------ |
| [INJIVER-1084](https://mosip.atlassian.net/browse/INJIVER-1084) | VC result is incorrectly displayed under the **Upload** tab When a Verifiable Credential (VC) is scanned using the **Scan** feature. |
| [INJIVER-1086](https://mosip.atlassian.net/browse/INJIVER-1086) | VP Verification is not compatible with Inji Mobile 0.16.0                                                                            |

### **Documentation**

* Feature documentation
* User guide
* Workflow
* Local Setup
* Collab Guide
* QA Report
