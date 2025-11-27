# Version 0.15.0

**Release Name:** Inji Web Wallet 0.15.0

**Release Type**: Developer

**Release Date**: _Coming Soon!_

### **Overview**

Inji Web **0.15.0** introduces a major milestone with the **first end-to-end** [**OpenID4VP** ](https://openid.net/specs/openid-4-verifiable-presentations-1_0-ID3.html#name-same-device-flow)**VC Presentation support**, along with significant UI enhancements, improved security, updated libraries, functional bug fixes, and extensive code quality improvements.

This release brings the Inji Web Wallet closer to fully supporting verifier-driven flows and aligns with open standards.

### **Key Highlights of the Release**

#### **OpenID4VP End-to-End Flow (Initial Implementation)**

* Redirect from verifier
* Trust screen
* Credential matching & selection
* User consent
* Presentation creation & submission
* UI for negative flows (No matching credentials / No internet/API Failures)
* Updated verifier request URL format

#### **UI/UX Enhancements**

* Branding updates with fonts, colours and icon changes
* Updated component naming
* UX fixes for credential list interactions
* End-to-end OpenID4VP UI polish

#### **Platform Improvements**

* CORS issue fix
* Configurable Redis usage
* Improved error handling
* Documentation updates

### **Features Released**

<table><thead><tr><th width="132.23828125">Type</th><th>Feature / Enhancement</th><th>Jira Link</th></tr></thead><tbody><tr><td>Story</td><td>OpenID4VP Flow – Verifier request URL format change</td><td><a href="https://mosip.atlassian.net/browse/INJIWEB-1747">INJIWEB-1747</a></td></tr><tr><td>Story</td><td>Enhance error handling in OpenID4VP flow with retry &#x26; close</td><td><a href="https://mosip.atlassian.net/browse/INJIWEB-1735">INJIWEB-1735</a></td></tr><tr><td>Story</td><td>Branding updates across Inji Web UI </td><td><a href="https://mosip.atlassian.net/browse/INJIWEB-1726">INJIWEB-1726</a></td></tr><tr><td>Story</td><td>UI – Results, redirect back &#x26; negative flows (No internet)</td><td><a href="https://mosip.atlassian.net/browse/INJIWEB-1717">INJIWEB-1717</a></td></tr><tr><td>Story</td><td>UI – Credential selection, consent &#x26; no matching credential flow</td><td><a href="https://mosip.atlassian.net/browse/INJIWEB-1715">INJIWEB-1715</a></td></tr><tr><td>Story</td><td>UI – Redirect from verifier &#x26; display trust screen</td><td><a href="https://mosip.atlassian.net/browse/INJIWEB-1714">INJIWEB-1714</a></td></tr><tr><td>Story</td><td>API – Manage verifier trust decision</td><td><a href="https://mosip.atlassian.net/browse/INJIWEB-1713">INJIWEB-1713</a></td></tr><tr><td>Story</td><td>API – Credential selection, consent &#x26; submission</td><td><a href="https://mosip.atlassian.net/browse/INJIWEB-1712">INJIWEB-1712</a></td></tr><tr><td>Story</td><td>API – Get matching credentials for presentation</td><td><a href="https://mosip.atlassian.net/browse/INJIWEB-1711">INJIWEB-1711</a></td></tr><tr><td>Story</td><td>API – Implement OpenID4VP Authorization Request Handler</td><td><a href="https://mosip.atlassian.net/browse/INJIWEB-1704">INJIWEB-1704</a></td></tr><tr><td>Story</td><td>Configure special keys to identify face rendering</td><td><a href="https://mosip.atlassian.net/browse/INJIWEB-1673">INJIWEB-1673</a></td></tr></tbody></table>

### **Repositories Released**

| Module                   | Version     |
| ------------------------ | ----------- |
| inji-config              | **v0.13.0** |
| inji-openid4vp           | **v0.6.0**  |
| inji-openid4vp-ios-swift | **v0.6.0**  |
| mimoto                   | **v0.20.0** |
| inji-web                 | **v0.15.0** |

### **Compatible Modules**

| Module       | Version                                                                    |
| ------------ | -------------------------------------------------------------------------- |
| eSignet      | [v1.6.2](https://github.com/mosip/esignet/releases/tag/v1.6.2)             |
| inji-certify | [v0.12.2](https://github.com/mosip/inji-certify/releases/tag/v0.12.2)      |
| durian       | [v1.3.0-beta.2](https://github.com/mosip/durian/releases/tag/1.3.0-beta.2) |
| inji-verify  | [v0.15.0](https://github.com/mosip/inji-verify/releases/tag/v0.15.0)       |

#### **Known Issues** <a href="#known-issues" id="known-issues"></a>

Below is the list of key known issues specific to this release. For all known issues, click [here](https://mosip.atlassian.net/issues/?jql=project%3D%22Inji%20Web%22%20and%20type%20in%20%28bug%29%20and%20status%20not%20in%20%28closed%2C%20canceled%29%20order%20by%20created%20DESC).

_To be Added!_

### Bug Fixes <a href="#bug-fixes" id="bug-fixes"></a>

Below is the list of bug fixes as part of the **0.15.0** release:

| Jira Issue                                                      | Description                                              |
| --------------------------------------------------------------- | -------------------------------------------------------- |
| [INJIWEB-1765](https://mosip.atlassian.net/browse/INJIWEB-1765) | “Do not trust this verifier” still continued flow        |
| [INJIWEB-1748](https://mosip.atlassian.net/browse/INJIWEB-1748) | User has to scroll for last row VC options               |
| [INJIWEB-1729](https://mosip.atlassian.net/browse/INJIWEB-1729) | Fix Sonar code issues                                    |
| [INJIWEB-1692](https://mosip.atlassian.net/browse/INJIWEB-1692) | CORS issue when accessing Mimoto APIs via docker-compose |

#### Release Documentation <a href="#release-documentation" id="release-documentation"></a>

* [Feature Documentation](../../overview/features/verifiable-credential-presentation-openid4vp.md)
* [End User Guide](../../functional-overview/end-user-guide.md#openid4vp-presenting-verifiable-credentials)
* [API Documentation](https://mosip.stoplight.io/docs/mimoto/x4k8ruhin2f09-authorize-verifiable-presentation)
* QA Report

#### Additional Resources <a href="#additional-resources" id="additional-resources"></a>

* [Feature Documentation](https://docs.inji.io/inji-wallet/inji-web/overview/features) - Contains detailed explanations of all available features of Inji Web Waller and its usage.
* [Backend Services ](https://docs.inji.io/inji-wallet/inji-web/technical-overview/backend-services)- Provides detailed instructions to set up the backend for the Inji Web Wallet.
* [End User Guide](https://docs.inji.io/inji-wallet/inji-web/functional-overview/end-user-guide) - Offers end-to-end guidance for end users on setup and daily usage.
* [API Documentation](https://mosip.stoplight.io/docs/mimoto/k6907m3dzc1gi-mimoto) - Includes comprehensive details of all APIs, endpoints, request/response formats, and examples.
