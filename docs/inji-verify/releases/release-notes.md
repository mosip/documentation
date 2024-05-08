# Release Notes

## **Version 0.8.0**

**Release Name**: Inji Verify v0.8.0

**Support**: Developer Release

**Release Date**: 8th May, 2024

### **Overview**

We are excited to announce the release of **Inji Verify version 0.8.0**! This release introduces several new features like scanning QR code, uploading QR code, and error handling aimed at improving the user experience and functionality of the verification portal. Below are the key highlights of this release:

**New Features:**

1. **QR Code Scanning:** Users can now scan QR codes directly from their device cameras using the built-in scanning feature. This allows for quick and seamless verification of Verifiable Credentials without the need for manual data entry.
2. **QR Code Upload:** In addition to QR code scanning, users have the option to upload QR code files from their devices for verification. This provides flexibility for users who may have QR codes saved as digital files.
3. **Error Handling:** Error messages and prompts have been added to provide clearer guidance to users in case of issues such as unsupported QR code formats, unreadable QR codes, or scan session timeouts.

**Scan Feature Acceptance for Release v0.8.0:**

* **QR Code Compatibility**:
  * Version 21 and 22 of the QR code are compatible with v0.8.0 of Inji Verify.
* **Camera Resolution Requirement**:
  * The device's front camera or web camera resolution should be above 8 megapixels.
  * The camera should be used in a well-lit environment without filters, ensuring proper alignment for optimal scanning.
* **Upload Feature QR Code Compatibility**:
  * QR code versions supported for the upload feature range from v21 to v32.

{% hint style="info" %}
As of the current release, Inji Verify supports QR code scanning from laptops/desktops and mobile devices with a front camera, but not on the responsive version of mobile browsers. Additionally, the platform allows for uploading QR codes. However, physical paper scanning is not supported.
{% endhint %}



**Repository Released**

| **Repositories**   | **Tags Released**                                                     |
| ------------------ | --------------------------------------------------------------------- |
| Inji Verify        |  [**v0.8.0**](https://github.com/mosip/inji-verify/tree/v0.8.0)       |
| Pixel-Pass Library |  [**v0.1.4**](https://www.npmjs.com/package/@mosip/pixelpass/v/0.1.4) |





### **Known Issues**

| **Jira ID**                                                             | **Description**                                                                                        |
| ----------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| [**Inji Verify -150**](https://mosip.atlassian.net/browse/INJIVER-150)  | Inji-Verify: Able to upload and validate QR Code when internet connection is off.                      |
| [**Inji Verify - 159**](https://mosip.atlassian.net/browse/INJIVER-159) | Inji-Verify: Upload QR Code is accepting image with two same working QR Codes added in one image.      |
| [**Inji Verify -160**](https://mosip.atlassian.net/browse/INJIVER-160)  | Inji-Verify: Upload QR Code is accepting image with two different working QR Codes added in one image. |
| [**Inji Verify -245**](https://mosip.atlassian.net/browse/INJIVER-245)  | Inji-Verify : Scan is not happening for an invalid QR code                                             |
| [**Inji Verify -237**](https://mosip.atlassian.net/browse/INJIVER-237)  | Inji Verify: Unable to scan Sunbird QR code through Mobile/Windows/Mac                                 |
| [**Inji Verify -234**](https://mosip.atlassian.net/browse/INJIVER-234)  | Inji Verify: The scan feature is not working in Windows (web-based) for the 1 mp camera                |

### **Documentation**

* [Feature Documentation](https://docs.mosip.io/inji/inji-verify/functional-overview/features)
* [User Guide](https://docs.mosip.io/inji/inji-verify/functional-overview/end-user-guide)
* QA Report
