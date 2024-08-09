# Version 0.8.0

**Release Name**: Inji Verify 0.8.0

**Support**: Developer Release

**Release Date**: 8th May, 2024

### **Overview**

We are excited to announce the release of **Inji Verify version 0.8.0**! This release introduces several new features like scanning QR code, uploading QR code, and error handling aimed at improving the user experience and functionality of the verification portal. Below are the key highlights of this release:

**New Features:**

1. **QR Code Scanning:** Users can now scan QR codes directly from their device cameras using the built-in scanning feature. This allows for quick and seamless verification of Verifiable Credentials without the need for manual data entry.
2. **QR Code Upload:** In addition to QR code scanning, users have the option to upload QR code files from their devices for verification. This provides flexibility for users who may have QR codes saved as digital files.
3. **Error Handling:** Error messages and prompts have been added to provide clearer guidance to users in case of issues such as unsupported QR code formats, unreadable QR codes, or scan session timeouts.

**Scan Feature QR Code Compatibility:**

* QR code versions supported for the scan feature range from v22 and below.

**Camera Resolution Requirement:**

* The device's front or web camera resolution must exceed 8 megapixels.
* Cameras should be used in well-lit environments without filters, ensuring proper alignment for optimal scanning.

**Upload Feature QR Code Compatibility:**

* QR code versions supported for the upload feature range from v32 and below.

{% hint style="info" %}
As of the current release, Inji Verify supports QR code scanning from laptops/desktops and mobile devices with a front camera, but not on the responsive version of mobile browsers. Additionally, the platform allows for uploading QR codes. However, physical paper scanning is not supported.
{% endhint %}



### Repositories: Released/Dependent

| **Repositories**   | **Tags: Released/Dependent**                                          |
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
* [QA Report ](https://app.gitbook.com/o/-M1FyzBr-VmticWYm8QI/s/aY8BQ4hdzhSchZV814Ev/\~/changes/377/inji-verify/releases/release-notes/test-report)
