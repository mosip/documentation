# 1.2.0.1

## Release Notes

**Release Version**: 1.2.0.1 

**Upgrade From**: 1.2.0

**Release Date**: 06th March, 2024

This **1.2.0.1** release comprises of all features which have been released as beta release and few major fixes as requested by the countries. This release focuses on testability, usability, and security.

Domain Specific Language (DSL) Automation scripts, which are part of this release, enable platform testing. Also, few security related issues are resolved. Click [here](https://docs.mosip.io/1.2.0/test-automation) to know more about test automation.

One of the major highlights of this patch release is the print stage. The print stage, now re-named as **Credential Requester Stage**, additionally manages the initiation of credential requests tailored to partner-specific information needs.  

Click [here](https://docs.mosip.io/1.2.0/modules/registration-processor#stages-and-services) to know more about Credential Requestor Stage.

Implementation of custom handles in ID Repository is also included as a part of this release. Refer [here](https://docs.mosip.io/1.2.0/modules/id-repository/custom-handle) to know more about handles and its implementation.


**Major Areas of Work**

* Credential Requestor Stage
* Introduction of Handles in ID Repository
* Functional bug fixes
* Security bug fixes
* Test Automation
* Performance fixes
* Sonar bug fixes

## Repository Released

| **Repositories**            | **Tags Released**                                                                    |
| --------------------------- | ------------------------------------------------------------------------------------ |
| admin-ui                    |[v1.2.0.1](https://github.com/mosip/admin-ui/tree/v1.2.0.1/)                          |
| admin-services              |[v1.2.0.1](https://github.com/mosip/admin-services/tree/v1.2.0.1/)                    |
| audit-manager               |[v1.2.0.1](https://github.com/mosip/audit-manager/tree/v1.2.0.1/)                     |
| biosdk-client               |[v1.2.0.1](https://github.com/mosip/biosdk-client/tree/v1.2.0.1/)                     |
| id-authentication           |[v1.2.0.1](https://github.com/mosip/id-authentication/tree/v1.2.0.1/)                 |
| id-repository               |[v1.2.0.1](https://github.com/mosip/id-repository/tree/v1.2.0.1/)                     |
| commons                     |[v1.2.0.1](https://github.com/mosip/commons/tree/v1.2.0.1/)                           |
| packet-manager              |[v1.2.0.1](https://github.com/mosip/packet-manager/tree/v1.2.0.1/)                    |
| durian                      |[v1.2.0.1](https://github.com/mosip/durian/tree/v1.2.0.1/)                            |
| keymanager                  |[v1.2.0.1](https://github.com/mosip/keymanager/tree/v1.2.0.1/)                        |
| partner-management-services |[v1.2.0.1]( https://github.com/mosip/partner-management-services/tree/v1.2.0.1/)      |
| partner-management-portal   |[v1.2.0.1](https://github.com/mosip/partner-management-services/tree/v1.2.0.1/)       |
| pre-registration            |[v1.2.0.1](https://github.com/mosip/pre-registration/tree/v1.2.0.1/)                  |
| print                       |[v1.2.0.1](https://github.com/mosip/print/tree/v1.2.0.1/)                             |
| resident-services           |[v1.2.0.1](https://github.com/mosip/resident-services/tree/v1.2.0.1/)                 |
| registration                |[v1.2.0.1](https://github.com/mosip/registration/tree/v1.2.0.1/)                      |
| registration-client         |[v1.2.0.1](https://github.com/mosip/registration-client/tree/v1.2.0.1/)               |
| mosip-openid-bridge         |[v1.2.0.1](https://github.com/mosip/mosip-openid-bridge/tree/v1.2.0.1/)               |
| biosdk-services             |[v1.2.0.1](https://github.com/mosip/biosdk-services/tree/v1.2.0.1/)                   |
| bio-utils                   |[v1.2.0.1](https://github.com/mosip/bio-utils/tree/v1.2.0.1/)                         |
| mosip-config                |[v1.2.0.1](https://github.com/mosip/mosip-config/tree/v1.2.0.1/)                      |
| keyclock                    |[v1.2.0.1](https://github.com/mosip/keycloak/tree/v1.2.0.1/)                          |
| khazana                     |[v1.2.0.1](https://github.com/mosip/khazana/tree/v1.2.0.1/)                           |
| mosip-data                  |[v1.2.0.1](https://github.com/mosip/mosip-data/tree/v1.2.0.1/)                        |
| mosip-ref-impl              |[v1.2.0.1](https://github.com/mosip/mosip-ref-impl/tree/v1.2.0.1/)                    |
| mosip-file-server           |[v1.2.0.1](https://github.com/mosip/mosip-file-server/tree/v1.2.0.1/)                 |
| k8s-infra                   |[v1.2.0.1](https://github.com/mosip/k8s-infra/tree/v1.2.0.1/)                         |
| mosip-onboarding            |[v1.2.0.1](https://github.com/mosip/mosip-onboarding/tree/v1.2.0.1/)                  |
| reporting                   |[v1.2.0.1](https://github.com/mosip/reporting/tree/v1.2.0.1/)                         |
| demosdk                     |[v1.2.0.1](https://github.com/mosip/demosdk/tree/v1.2.0.1/)                           |
| pre-registration-ui         |[v1.2.0.1](https://github.com/mosip/pre-registration-ui/tree/v1.2.0.1/)               |
| digital-card-service        |[v1.2.0.1](https://github.com/mosip/digital-card-service/tree/v1.2.0.1/)              |
| converters                  | [v1.2.0.1](https://github.com/mosip/converters/tree/v1.2.0.1/)                       |

## Documentation

* [Enhancements and bug fixes](https://docs.mosip.io/1.2.0/releases/release-notes-1.2.0.1/enhancements-and-bug-fixes)
* [Functional test report](https://docs.mosip.io/1.2.0/releases/release-notes-1.2.0.1/test-report-1.2.0.1)
* [Known Issues](https://mosip.atlassian.net/browse/MOSIP-29944?jql=labels%20%3D%20Known_Issue_1.2.0.1) 
