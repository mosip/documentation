# Resident Services 0.9.0

**Release Name**: Resident Services

**Release version**: v0.9.0

**Support**: 0.9.0

**Release Date**: 30th May, 2024

## Overview

This release is the 0.9.0 release of Resident Services, offering valuable insights into the range of features and functionality available. Resident Services is designed to run on the 1.2.0.1 version of the MOSIP platform. Resident Services are the self-services that are used by the residents themselves via a portal. [Resident Portal](https://docs.mosip.io/1.2.0/modules/resident-services/resident-portal-user-guide) is a web-based UI application that provides residents of a country with services related to their Unique Identification Number (UIN). The residents can perform various operations related to their UIN/ VID and can also raise concerns if any through the portal.

The key features provided on the Resident portal are:

1. Avail UIN services using UIN/ VID (through [eSignet](https://docs.esignet.io)):
   * View My History
   * Manage My VID
   * Secure My ID
   * Track My Requests
   * Get Personalised Card
   * Share My Data
   * Update My Data
   * Login and Logout
2. Get Information
   1. Get the list of Registration Centres
   2. Get the list of Supporting Documents
3. Get My UIN (using UIN/ VID/ AID)
4. Verify Email ID and/ or phone number
5. Book an appointment for new enrolment (via the pre-registration portal)
6. Ancillary features
   * Multi-lingual support
   * Get Notifications (email and bell notifications)
   * View profile details of the logged in user (name, photo, and last login details)
   * Responsive UI support

For a quick overview of the design principles and to understand the relationship of Resident Services with other services, read [Resident Services Overview](https://docs.mosip.io/1.2.0/modules/resident-services).

## Repository Released

| **Repositories**            | **Tags Released**                                                                      |
| --------------------------- | -------------------------------------------------------------------------------------- |
| Resident Services           | [v1.2.1.0](https://github.com/mosip/resident-services/releases/tag/v1.2.1.0)           |
| Resident UI                 | [v.0.9.0](https://github.com/mosip/resident-ui/releases/tag/v0.9.0)                    |
| Id repository               | [v1.2.1.0](https://github.com/mosip/id-repository/releases/tag/v1.2.1.0)               |
| Partner Management Services | [v1.2.1.0](https://github.com/mosip/partner-management-services/releases/tag/v1.2.1.0) |
| Admin Services              | [v1.2.1.0](https://github.com/mosip/admin-services/releases/tag/v1.2.1.0)              |
| Mosip data                  | [v1.2.1.0](https://github.com/mosip/mosip-data/releases/tag/v1.2.1.0)                  |
| Mosip config                | [v1.2.1.0](https://github.com/mosip/mosip-config/releases/tag/v1.2.1.0)                |
| Artifactory ref impl        | [v1.2.0.2](https://github.com/mosip/artifactory-ref-impl/releases/tag/v1.2.0.2)        |
| Mosip functional tests      | [v1.2.0.2](https://github.com/mosip/mosip-functional-tests/releases/tag/v1.2.0.2)      |
| Mosip helm                  | [v1.2.0.2](https://github.com/mosip/mosip-helm/releases/tag/v1.2.0.2)                  |

## Summary

### Services

For a detailed description of Resident services, the code, and the design, refer to the [resident services repo](https://github.com/mosip/resident-services/releases/tag/v1.2.1.0).

### Resident Portal UI

MOSIP provides a reference implementation of the Resident portal that can be customized as per the country’s needs. The sample implementation is available [here](https://github.com/mosip/resident-ui/releases/tag/v0.9.0).

## Known Issues

### Complete List

To get the complete list of known bugs click [here](https://mosip.atlassian.net/issues/MOSIP-33078?filter=-4\&jql=parent%3Dmosip-20342%20and%20status%20not%20in%20%28closed%2C%20canceled%2C%20fixed%2C%20testing%2C%20%22On%20Hold%20-%20Dev%22%29%20and%20issuetype%3Dbug).

### Key Issues

Mentioned below is the list of other '**key known issues**'.

<table><thead><tr><th width="266">JIRA Issues</th><th>Issue Description</th></tr></thead><tbody><tr><td><a href="https://mosip.atlassian.net/browse/MOSIP-33073">MOSIP-33073</a></td><td>If the name is of only 3 letters, the downloaded card fails to open.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/MOSIP-33065">MOSIP-33065</a></td><td>On uploading invalid document and viewing it, the data that was entered is not persistent.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/MOSIP-33058">MOSIP-33058</a></td><td>When one data update request is processed and another one is about to be initiated, in the pop-up if we cancel the update request, an error with “no record found” is seen.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/MOSIP-32895">MOSIP-32895</a></td><td>If the same name as the existing one is entered in the “New name” field, no error is thrown.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/MOSIP-32845">MOSIP-32845</a></td><td>On clicking “Submit” button multiple times, multiple eventIds are getting created.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/MOSIP-32822">MOSIP-32822</a></td><td>If the name field is lengthy, the downloaded card does not show the entire name entered.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/MOSIP-32809">MOSIP-32809</a></td><td>On updating data, the page sometimes need to be refreshed to view the update.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/MOSIP-31136">MOSIP-31136</a></td><td>VC verification is failing for name, photo, and full address.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/MOSIP-30684">MOSIP-30684</a></td><td>To enter text before sharing data with the partner, one has to click on text field twice.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/MOSIP-30682">MOSIP-30682</a></td><td>To enter text in grievance redressal form, one has to click on text field twice.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/MOSIP-30678">MOSIP-30678</a></td><td>On downloading Personalised UIN card, email/ SMS notifications are not being sent in preferred language.</td></tr></tbody></table>



## Documentation

* [Resident Services Developers Guide](https://docs.mosip.io/1.2.0/modules/resident-services/resident-services-developer-guide)
* [Resident Services UI Developers Guide](https://docs.mosip.io/1.2.0/modules/resident-services/resident-services-ui-developer-guide)
* [Resident Portal Configuration Guide](https://docs.mosip.io/1.2.0/modules/resident-services/resident-portal-configuration-guide)
* [Resident Services Deployment Guide](https://docs.mosip.io/1.2.0/modules/resident-services/resident-services-deployment-guide)
* [Configuring Resident OIDC Client](https://docs.mosip.io/1.2.0/modules/resident-services/resident-services-configure-resident-oidc-client)
* [Resident Portal User Guide](https://docs.mosip.io/1.2.0/modules/resident-services/resident-portal-user-guide)
* [Functional Overview](https://docs.mosip.io/1.2.0/modules/resident-services/functional-overview)
* [API Documentation](https://mosip.stoplight.io/docs/resident/9a5192571fc51-document)
* [Test Report](https://docs.mosip.io/1.2.0/releases/resident-services-0.9.0/test-report)
