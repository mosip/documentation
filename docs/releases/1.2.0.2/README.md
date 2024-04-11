# 1.2.0.2

## Release Notes

**Release Version**: 1.2.0.2

**Release Date**: 5th April 2024

The **1.2.0.2** release addresses critical bugs that were reported, enhancing the stability and usability of the software to ensure a seamless customer experience. Below, you'll find a detailed description of the fixes included in this version:

### Bug fixes

1. **Issue with Policy Creation**: Previously, while attempting to create an Authorization or DataShare policy, the application encountered difficulties in successfully establishing the policy. Issue is resolved now and users can effortlessly define their Authorization or DataShare policies after creating and activating policy groups. [#MOSIP-31976](https://mosip.atlassian.net/browse/MOSIP-31976)
2. **Login Failure in Registration Client**: Previously, users were unable to log into Registeration Client as  'Submit' button did not work as expected. Issue is resolved now, users can now successfully log into Registration Client. [#MOSIP-32037](https://mosip.atlassian.net/browse/MOSIP-32027)

**Major Areas of Work**

* Registration Client
* Partner Management Portal

## Repository Released

| Repositories              | Tags Released                                                                |
| ------------------------- | ---------------------------------------------------------------------------- |
| registration-client       | [v1.2.0.2](https://github.com/mosip/registration-client/tree/v1.2.0.2)       |
| mosip-mock-services       | [v1.2.0.2](https://github.com/mosip/mosip-mock-services/tree/v1.2.0.2)       |
| artifactory-ref-impl      | [v1.2.0.2](https://github.com/mosip/artifactory-ref-impl/tree/v1.2.0.2)      |
| mosip-infra               | [v1.2.0.2](https://github.com/mosip/mosip-infra/tree/v1.2.0.2)               |
| mosip-helm                | [v1.2.0.2](https://github.com/mosip/mosip-helm/tree/v1.2.0.2)                |
| K8s-infra                 | [v1.2.0.2](https://github.com/mosip/k8s-infra/tree/v1.2.0.2)                 |
| partner-management-portal | [v1.2.0.2](https://github.com/mosip/partner-management-portal/tree/v1.2.0.2) |

## Documentation

* [Functional test report](https://docs.mosip.io/1.2.0/releases/1.2.0.2/test-report)
* [Known Issues](https://mosip.atlassian.net/issues/?jql=labels%20%3D%20%22known\_issue\_1202%22)
