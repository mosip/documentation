# Partner Management System

Partners are vendors or solution providers who offer their products/services to ensure the effective implementation and operation of MOSIP-based identity systems.&#x20;

Partner Management Portal (PMP) is a web based application that is designed to facilitate the collaboration and integration of external partners with the MOSIP ecosystem. This portal serves as a platform to onboard all types of MOSIP partners, manage their details and build partner specific functionalities for seamless interaction.

We are undertaking a comprehensive overhaul of our existing Partner Management Portal (PMP). This revamp includes introducing a suite of new features and significantly enhancing the current ones. Our aim is to improve usability and elevate the overall user experience (UX). Also incorporating tech stack upgrade and realigning our focus to bring user centered design to PMP, we are committed to making the PMP more intuitive, efficient, and aligned with our partners' evolving needs.

You can refer to the comprehensive documentation as below:

* [PMS - Revamp](broken-reference) :  Documentation that includes the features in new UI
* [PMS - Legacy](pms-existing/): Existing documentation (Old UI)

### Who are the partners in MOSIP?

<table data-header-hidden><thead><tr><th width="222"></th><th></th><th></th></tr></thead><tbody><tr><td><strong>Partner Type</strong></td><td><strong>What do they do in MOSIP?</strong></td><td><strong>Why do they need PMS portal?</strong></td></tr><tr><td>Authentication Partner</td><td><ul><li>They are also called Relying Party or Service Providers which uses MOSIP authentication services for delivering services</li></ul></td><td><p></p><ul><li>Shares partner certificate which would be used to build a trust store in MOSIP to cryptographically validate that they were the ones who were authenticating the citizens also this certificate is used to encrypt the response shared in e-KYC.</li></ul><ul><li>They choose a policy which they want to use and request for approval for the policy from the partner admin.</li></ul><ul><li>Once a policy is approved, they can perform eSignet (OIDC Client) and/or API based authentication.</li></ul><ul><li>They can create OIDC client for an approved policy which is used in eSignet authentication.</li></ul><ul><li>They can generate API Keys against the policy in order to use it during citizen authentication.</li></ul><ul><li>They can also deactivate an OIDC Client or API Key if it is compromised</li></ul></td></tr><tr><td>Device Provider</td><td><ul><li>Provide devices for Registration and Authentication</li></ul></td><td><ul><li>Shares partner certificate which would be used to build a trust store in MOSIP to cryptographically validate that the biometric data was captured by a device issued by the device provider.</li><li>Provides make &#x26; model details of devices for book keeping.</li><li>Provides SBI information for book keeping.</li></ul></td></tr><tr><td>FTM Chip Provider</td><td><ul><li>Provides secure chip for Authentication devices</li></ul></td><td><ul><li>Shares partner certificate which would be used to build a trust store in MOSIP to cryptographically validate that the biometric data was captured by a device integrated with a chip issued by the FTM chip provider.</li><li>Provide chip model details for book keeping.</li></ul></td></tr><tr><td>ABIS Partner</td><td><ul><li>Provides ABIS engine to deduplicate biometrics</li></ul></td><td><ul><li>Shares partner certificate which would be used for encryption the biometric data that is shared during deduplication.</li><li>The request for a policy based on which data is shared with them for deduplication</li></ul></td></tr><tr><td>Manual Adjudication System</td><td><ul><li>Manual Adjudication system helps a biometric expert to compare two sets of biometric data and few demographic data, so that, the adjudicator can take the final decision that the identified record is actually a duplicate.</li></ul></td><td><ul><li>Shares partner certificate which would be used for encryption the biometric and demographic data that is shared during deduplication.</li><li>The request for a policy based on which data is shared with them for adjudication</li></ul></td></tr><tr><td>SDK Partner</td><td><ul><li>Provides SDKs that are used for performing matching of two records, checking the quality of the biometrics or generating biometric templates.</li></ul></td><td><ul><li>They don’t need Partner Management Portal</li></ul></td></tr><tr><td>MISP (MOSIP Infrastructure Service Providers)</td><td><ul><li>They provide infrastructure services to MOSIP and help relying parties (authentication partners) access the authentication endpoints exposed by MOSIP</li></ul></td><td><ul><li>Share partner certificate which helps verify that the ISP is a genuine partner, the certificate uploaded is generally not used in MOSIP.</li><li>Generate License Keys which would be used for during citizen authentication.</li></ul></td></tr><tr><td>ID Authentication Module / Online Verification Partner</td><td><ul><li>Module that stores ID data used for authenticating the citizens</li><li>This is an internal module</li></ul></td><td><ul><li>Generally added from the backend by the administrator</li></ul></td></tr><tr><td>Printing/ Credential Partner</td><td><ul><li>They provide print solution</li></ul></td><td><ul><li>Shares partner certificate which would be used for encryption the face and demographic data that is shared for printing the ID card.</li><li>The request for a policy based on which data is shared with them for printing</li></ul></td></tr></tbody></table>



### Policy group

Common policies group examples include 'Telecom', 'Banking', 'Insurance' among others.

### What are the policies used in MOSIP?

* Data Share Policy
* Authentication Policy



<table data-header-hidden><thead><tr><th width="181"></th><th width="260"></th><th></th></tr></thead><tbody><tr><td>Policy type</td><td>Partners</td><td>Description</td></tr><tr><td>Auth policy</td><td>AP</td><td>Specifies <a href="https://docs.mosip.io/1.2.0/id-authentication#authentication-types">authentication types</a> and <a href="https://docs.mosip.io/1.2.0/id-authentication#kyc-authentication">KYC</a> fields to be shared during authentication.</td></tr><tr><td>Datashare policy</td><td>Online Verification Partner, Credential Partner, Manual Adjudiation, ABIS partner</td><td>Specifies data to be shared with partners</td></tr></tbody></table>

{% hint style="info" %}
**Note:** Policies are not applicable for Device Provider, FTM Provider and MISP Partner as data is not shared with them.
{% endhint %}

Refer to the [default policies](https://github.com/mosip/partner-management-services/blob/release-1.2.0/db\_scripts/mosip\_pms/dml/pms-auth\_policy.csv) loaded while installing MOSIP.

### Partner Policies

Partner policies control the data that needs to be shared with a partner. The policies reside in [`auth_policy` table](https://github.com/mosip/partner-management-services/blob/release-1.2.0/db\_scripts/mosip\_pms/ddl/pms-auth\_policy.sql) of `mosip_pms` DB..

### Partner roles

| **Partner Type**       | **Associated Role**        |
| ---------------------- | -------------------------- |
| Partner Admin          | PARTNER\_ADMIN             |
| Policy Manager         | POLICYMANAGER              |
| Authentication Partner | **AUTH\_PARTNER (new UI)** |
| Credential Partner     | CREDENTIAL\_PARTNER        |
| Device Provider        | DEVICE\_PROVIDER           |
| FTM Provider           | FTM\_PROVIDER              |

## Documentation

[PMS Revamp](broken-reference)

[PMS Legacy](pms-existing/)
