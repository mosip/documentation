# Version 0.9.0

**Release Name**: Inji Web v0.9.0

**Support**: Developer Release

**Release Date**: 29th June, 2024

## **Overview** <a href="#overview" id="overview"></a>

Inji Web 0.9.0 introduces a dedicated repository for configurations specific to Inji stack, significant tech upgrades in addition to Localization and Theme Customization support along with UI enhancements.

### **Summary**

Below are the details for the **Inji Version 0.9.0** release:

**inji-config** Repository to maintain inji stack related configurations.

**Tech Upgrades**

  1. CSS library: Inji Web has moved from MaterialUI to Tailwind CSS library for more flexibility.

  2. Conversion of JS to TS: Migration of React project from javascript to typescript.

**Customization**

  1. Localization: Inji Web now supports below languages:
  
       * International : English, French and Arabic
       * Indian : Hindi, Kannada, Tamil 
  
  2. Theme Customization: Inji Web offers theme customization of the UI.

**UI Enhancements**

  1. Responsive views: Users can now view Inji Web portal in Tablets and Mobile devices.

  2. PDF Layout changes The layout of the VC generated as PDF is now in similar lines of VC detailed view in Inji Wallet.

## Repository Released

| **Repositories** | **Tags Released**                                                           |
| ---------------- | --------------------------------------------------------------------------- |
| Inji Web         | [**v0.9.0**](https://github.com/mosip/inji-web/releases/tag/v0.9.0)         |
| mimoto           |   [**v0.13.0**](https://github.com/mosip/mimoto/releases/tag/v0.13.0)       |
| inji-config      |  [**v0.1.1**](https://github.com/mosip/inji-config/releases/tag/v0.1.1)     |

## Known Issues <a href="#known-issues" id="known-issues"></a>

Below are the list of known issues. To read in detail click [here](https://mosip.atlassian.net/issues/?jql=project%3D%22Inji%20Web%22%20and%20type%20in%20%28bug%29%20and%20status%20not%20in%20%28closed%2C%20canceled%29%20order%20by%20created%20DESC).

| **Jira ID**	|                             **Description**                                                                              |
| ------------| -------------------------------------------------------------------------------------------------------------------------|
| [**INJIWEB-599**](https://mosip.atlassian.net/browse/INJIWEB-599)	| Inji-web: Getting invalid credentials error message for valid data, when we leave authentication page idle for sometime  |
| [**INJIWEB-594**](https://mosip.atlassian.net/browse/INJIWEB-594)	| Injiweb: If the browser zoom in incresed then the some of options are not visible                                     |
| [**INJIWEB-593**](https://mosip.atlassian.net/browse/INJIWEB-593)	| INJIWEB: After navigating to Issuer type page , close/back button is missing in the esignet page                      |
| [**INJIWEB-590**](https://mosip.atlassian.net/browse/INJIWEB-590)	| Injiweb: credential strings are not properly displayed for diff dimensions under mosip issuer                         |
| [**INJIWEB-570**](https://mosip.atlassian.net/browse/INJIWEB-570)	| Injiweb: If the filed values are not provided during policy creation, in downloaded VC getting expressions directly   |
| [**INJIWEB-568**](https://mosip.atlassian.net/browse/INJIWEB-568)	| Injiweb: Observed access violation when "IBM Equal Access Accessibility Checker" executed on inji-web portal          |
| [**INJIWEB-290**](https://mosip.atlassian.net/browse/INJIWEB-290)	| Inji-web: QR code is not working on VC card                                                                           |
| [**INJIWEB-180**](https://mosip.atlassian.net/browse/INJIWEB-180)	| Inji-web: :Not getting proper error message when the website is down                                                  |


## Bug Fixes <a href="#bug-fixes" id="bug-fixes"></a>

Below are the list of fixes as part of 0.9.0 release:

| **Jira ID**	|                             **Description**                                                                                                                          |
| ------------| ---------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [**INJIWEB-291**](https://mosip.atlassian.net/browse/INJIWEB-291) | Inji-web: Multi languages support is not working at Authentication window                                      |
| [**INJIWEB-243**](https://mosip.atlassian.net/browse/INJIWEB-243) | Inji-web: Observed drop down box in search bar at issuer selection page as well as at credential download pages|
| [**INJIWEB-132**](https://mosip.atlassian.net/browse/INJIWEB-132) | Inji-web: Data in VC(PDF) are not properly aligned                                                             |
| [**INJIWEB-131**](https://mosip.atlassian.net/browse/INJIWEB-131) | Inji-web: attributes are missing compared to the VC on Inji Wallet                                             |


## Documentation <a href="#documentation" id="documentation"></a>

* [Feature documentation](https://docs.mosip.io/inji/inji-web/functional-overview/features)
* [User guide](https://docs.mosip.io/inji/inji-web/functional-overview/end-user-guide)
* [QA Report](https://docs.mosip.io/inji/inji-web/inji-web/version-0.9.0/test-report)
* [API Documentation](https://docs.mosip.io/inji/inji-web/technical-overview/backend-services/mimoto-bff)

