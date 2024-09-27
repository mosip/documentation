# Resident Services DP1

**Release Name**: Resident Services

**Release version**: vDP1

**Support**: Developer Preview Release1

**Release Date**: 12th Sept, 2023

## Overview

This release marks the developer's preview release of Resident Services, offering valuable insights into the range of features and functionality available. Resident Services is designed to run on 1.2.0.1-B3 version of MOSIP platform. Resident Services are the self-services which are used by the residents themselves via a portal. [Resident Portal](https://docs.mosip.io/1.2.0/modules/resident-services/resident-portal-user-guide) is a web-based UI application that provides residents of a country the services related to their Unique Identification Number (UIN). The residents can perform various operations related to their UIN/ VID and can also raise concerns if any through the portal.

The key features provided on the Resident portal are:

1. Avail **UIN services** using UIN/VID (through [e-Signet](https://docs.esignet.io)):
   * View My History
   * Manage My VID
   * Secure My ID
   * Track My Requests
   * Get Personalised Card
   * Share My Data
   * Logout
2. Get Information
   * About Registration Centers
   * List of supporting documents
3. Get My UIN (using UIN/ VID/ AID)
4. Verify email ID and/ or phone number
5. Responsive UI support- Support for the application to work seamlessly on various resolutions.
6. Book an appointment for new enrolment (via the pre-registration portal)
7. Ancillary features
   * Font size
   * Get Notifications (email and bell notifications)
   * View profile details of the logged in user (name, photo, and last login details)

For a quick overview of the design principles and to understand the relationship of Resident Services with other services, read [Resident Services Overview](../modules/resident-services/).

## Repository Released

| **Repositories**  | **Tags Released**                                                                      |
| ----------------- | -------------------------------------------------------------------------------------- |
| Resident Services | [Resident Services vDP1](https://github.com/mosip/resident-services/releases/tag/vDP1) |
| Resident UI       | [Resident UI vDP1](https://github.com/mosip/resident-ui/releases/tag/vDP1)             |

## Services

For detailed description of Resident services, the code and design, refer to [resident services repo](https://github.com/mosip/resident-services/releases/tag/vDP1).

## Resident Portal UI

MOSIP provides a reference implementation of the Resident portal that can be customized as per the country’s needs. The sample implementation is available [here](https://github.com/mosip/resident-ui/releases/tag/vDP1).

For getting started with the resident portal, refer to the [Resident Portal User Guide](../modules/resident-services/resident-portal-user-guide.md).

## Build and Deploy

To access the build and read through the deployment instructions, refer to the [Resident Services Deployment Guide](https://docs.mosip.io/1.2.0/modules/resident-services/resident-services-deployment-guide).

## Configurations

For details related to resident portal configurations, refer to the [Configuration Guide](https://docs.mosip.io/1.2.0/modules/resident-services/resident-portal-configuration-guide).

## Developers Guide

For a detailed description of Resident Services, code, design, and setup steps, refer to:

1. [Resident Services Developers Guide](../modules/resident-services/resident-services-developer-guide.md)
2. [Resident Services UI Developers Guide](../modules/resident-services/resident-services-ui-developer-guide.md)

## API

Refer [API Documentation](https://mosip.stoplight.io/docs/resident/9a5192571fc51-document).

## Test Report

For details on the test results, refer [here](https://github.com/mosip/test-management/tree/master/).
