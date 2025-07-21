# v1.5.1

**Release Number**: v1.5.1(Patch)

**Release Date**:   24th Feb, 2025

### **Overview**

We are excited to announce eSignet v1.5.1, which resolves critical issues to improve user experience and system functionality. Key fixes include IDT authentication, KYC slot availability, and an updated [README.md](https://github.com/mosip/esignet-signup/blob/v1.1.1/docker-compose/README.md) file for the docker compose setup of the signup service. These updates ensure more reliable and efficient access to services.

#### **Major Highlights**

1. **Fixed bug in IDT authentication:** Resolved issues related to invalid individual ID handling, including incorrect individual IDs provided in the request body.
2. **Reused Challenge Authentication:** Added validations for reused challenge IDT(ID token)-based authentication, ensuring it now functions correctly.
3. **Periodic Slot Availability Checks in UI:** Added support for periodic slot availability checks during the loading screen process, based on configuration.
4. **Documentation:** Updated the Sign-up Docker Compose README to ensure a smooth local setup for Sign-up services.

#### **Bug Fixes**

* Several known issues from v1.5.0 have been resolved to improve platform stability. A detailed list of fixes is available [here](https://mosip.atlassian.net/issues/ES-2224?jql=%22Release%20Number%5BLabels%5D%22%20%3D%20esignet_v1.5.1%20and%20issuetype%20%3D%20Bug%20and%20status%20not%20in%20%28Cancelled%2CCanceled%29%20ORDER%20BY%20cf%5B10017%5D%20desc).

We believe this release will greatly improve eSignet's security, efficiency, and user experience.&#x20;

Thank you for your continued support!

#### **Key Known Issues**

| Jira Issue                                            | Summary                                                                                 |
| ----------------------------------------------------- | --------------------------------------------------------------------------------------- |
| [ES-2222](https://mosip.atlassian.net/browse/ES-2222) | The user is not getting registered with an 8-digit UIN in MOSIP IDA.                    |
| [ES-2023](https://mosip.atlassian.net/browse/ES-2023) | Intermittent: Signup register and reset password are throwing errors but able to login. |

Please refer to [this link](https://mosip.atlassian.net/issues/MOSIP-35494?jql=labels%20%3D%20ES_v1.5.1_known_issue) for the list of all known issues.

#### **Repositories Released**

| Repository Released   | Tags                                                                                                                    |
| --------------------- | ----------------------------------------------------------------------------------------------------------------------- |
| esignet               |  [v1.5.1](https://github.com/mosip/esignet/tree/v1.5.1)                                                                 |
| esignet-signup        | [ ](https://github.com/mosip/esignet-signup/tree/v1.1.1)[v1.1.1](https://github.com/mosip/esignet-signup/tree/v1.1.1)   |
| esignet-mock-services | [v0.10.1](https://github.com/mosip/esignet-mock-services/tree/v0.10.1)                                                  |
| esignet-plugins       | [ ](https://github.com/mosip/esignet-plugins/tree/v1.3.1)[v1.3.1](https://github.com/mosip/esignet-plugins/tree/v1.3.1) |

#### **Compatible Modules**

| Module/Repository          | Compatible Version                                                                               |
| -------------------------- | ------------------------------------------------------------------------------------------------ |
| ID Authentication          | [1.2.1.0](https://github.com/mosip/id-authentication/tree/v1.2.1.0)                              |
| ID Repository              | [1.2.1.0](https://github.com/mosip/id-repository/tree/v1.2.1.0)                                  |
| kernel - core              | [1.2.0.1](https://github.com/mosip/commons/tree/v1.2.0.1/kernel/kernel-core)                     |
| kernel-notfication-service | [1.2.0.1](https://github.com/mosip/commons/tree/v1.2.0.1/kernel/kernel-notification-service)     |
| kernel-idgenerator-service | [1.2.0.1](https://github.com/mosip/commons/tree/v1.2.0.1/kernel/kernel-idgenerator-service)      |
| kernel-auth-adaptor        | [1.2.0.1](https://github.com/mosip/mosip-openid-bridge/tree/v1.2.0.1/kernel/kernel-auth-adapter) |
| kernel-auth-service        | [1.2.0.1](https://github.com/mosip/mosip-openid-bridge/tree/v1.2.0.1/kernel/kernel-auth-service) |
| kernel-otp-manager         | [1.2.0.1](https://github.com/mosip/otp-manager/tree/v1.2.0.1/kernel/kernel-otpmanager-service)   |
| Sunbird                    | [v2.0.0-rc3](https://github.com/Sunbird-RC/sunbird-rc-core/tree/v2.0.0-rc3)                      |

### **DB Changes**

**eSignet**

* Changed public\_key column data type to JSONB in the client\_details table. Please refer [here](https://github.com/mosip/esignet/blob/v1.5.1/db_upgrade_script/mosip_esignet/sql/1.5.0_to_1.5.1_upgrade.sql) for details.

**eSignet mock services**

* The length limit on the identity\_json column has been removed from the identity database. Please refer [here](https://github.com/mosip/esignet-mock-services/blob/v0.10.1/db_upgrade_script/mosip_mockidentitysystem/sql/0.10.0_to_0.10.1_upgrade.sql) for details.

### **Config Changes**

**eSignet mock services**

* Introduced json schema based validation. Below two properties are added:
  1. mosip.mock.ida.identity.schema.url
  2. mosip.mock.ida.update-identity.non-mandatory.fields

Please refer [here](https://github.com/mosip/esignet-mock-services/blob/v0.10.1/mock-identity-system/src/main/resources/application-default.properties) for details.

#### **Documentation**

1. [API Documentation](https://mosip.stoplight.io/docs/identity-provider/branches/1.5.0/7oz4lmhu3pf6b-e-signet)
2. [Integration Guides](../../../esignet-authentication/develop/integration/relying-party/development-and-integration-with-esignet.md)
3. [End User Guide](../../../esignet-authentication/test/end-user-guide/README.md)
4. [QA Report](../v1.5.1/test-report.md)
