# Overview

Partners are external entities or organisations who offer products or services to ensure the effective implementation and operation of MOSIP-based identity systems. PMS Portal is a web based application that is designed to facilitate the collaboration and integration of external partners in the MOSIP ecosystem. This portal serves as a central platform to onboard all types of MOSIP partners, manage their details and build partner specific functionalities for seamless interaction.

### Who are the partners in MOSIP?

<table><thead><tr><th width="135.01922607421875">Partner Type</th><th width="221.8956298828125">What do they do in MOSIP?</th><th>Why do they need PMS portal?</th></tr></thead><tbody><tr><td>Device Provider</td><td>Provide devices for Registration and Authentication</td><td><ul><li>Shares partner certificate which would be used to build a trust store in MOSIP to cryptographically validate that the biometric data was captured by a device issued by the device provider.</li><li>Provide make &#x26; model details of devices for book keeping.</li><li>Provide SBI information for book keeping.</li></ul></td></tr><tr><td>FTM Chip Provider</td><td>Provide secure chip for Authentication devices</td><td><ul><li>Shares partner certificate which would be used to build a trust store in MOSIP to cryptographically validate that the biometric data was captured by a device integrated with a chip issued by the FTM chip provider.</li><li>Provide chip model details for book keeping.</li></ul></td></tr><tr><td>ABIS Partner</td><td>Provide ABIS engine to deduplicate biometrics</td><td><ul><li>Shares partner certificate which would be used for encryption the biometric data that is shared during deduplication.</li><li>The request for a policy based on which data is shared with them for deduplication</li></ul></td></tr><tr><td>Manual Adjudication System</td><td>Manual Adjudication system helps a biometric expert to compare two sets of biometric data and few demographic data, so that, the adjudicator can take the final decision that the identified record is actually a duplicate.</td><td><ul><li>Shares partner certificate which would be used for encryption the biometric and demographic data that is shared during deduplication.</li><li>The request for a policy based on which data is shared with them for adjudication</li></ul></td></tr><tr><td>SDK Partner</td><td>Provides SDKs that are used for performing matching of two records, checking the quality of the biometrics or generating biometric templates.</td><td><ul><li>They don’t need Partner Management Portal</li></ul></td></tr><tr><td>Authentication Partner</td><td>They are also called Relying Party or Service Providers who use MOSIP authentication services for delivering services</td><td><ul><li>Shares partner certificate which would be used to build a trust store in MOSIP to cryptographically validate that they were the ones who were authenticating the citizens also this certificate is used to encrypt the response shared in e-KYC.</li><li>They choose a policy which they want to use and request for approval for the policy from the partner admin.</li><li>Once a policy is approved, they can perform eSignet (OIDC Client) and/or API based authentication.</li><li>They can create OIDC client for an approved policy which is used in eSignet authentication.</li><li>They can generate API Keys against the policy in order to use it during citizen authentication.</li><li>They can also deactivate an OIDC Client or API Key if it is compromised</li></ul></td></tr><tr><td>MISP (MOSIP Infrastructure Service Providers)</td><td>They provide infrastructure services to MOSIP and help relying parties (authentication partners) access the authentication endpoints exposed by MOSIP</td><td><ul><li>Share partner certificate which helps verify that the ISP is a genuine partner, the certificate uploaded is generally not used in MOSIP.</li><li>Generate License Keys which would be used for during citizen authentication.</li></ul></td></tr><tr><td>ID Authentication Module / Online Verification Partner</td><td><p>Module that stores ID data used for authenticating the citizens</p><p>This is an internal module</p></td><td><ul><li>Generally added from the backend by the administrator</li></ul></td></tr><tr><td>Printing/ Credential Partner</td><td>They provide print solution</td><td><ul><li>Shares partner certificate which would be used for encryption the face and demographic data that is shared for printing the ID card.</li><li>The request for a policy based on which data is shared with them for printing</li></ul></td></tr></tbody></table>

### What are the policies used in MOSIP?

* Data Share Policy
* Authentication Policy
* MISP Policy

Partner policies control the data that needs to be shared with a partner. The policies reside in auth\_policy table of mosip\_pms DB.

### Policy types

|                  |                                                                                   |                                                                                                                                                                                                                             |
| ---------------- | --------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Policy type      | Partners                                                                          | Description                                                                                                                                                                                                                 |
| Auth policy      | AP                                                                                | Specifies [authentication types](https://docs.mosip.io/1.2.0/id-authentication#authentication-types) and [KYC](https://docs.mosip.io/1.2.0/id-authentication#kyc-authentication) fields to be shared during authentication. |
| Datashare policy | Online Verification Partner, Credential Partner, Manual Adjudiation, ABIS partner | Specifies data to be shared with partners                                                                                                                                                                                   |
| MISP Policy      | MISP                                                                              | Specifies                                                                                                                                                                                                                   |

Policies are not applicable for Device Provider, FTM Provider.

<figure><img src="../../../../.gitbook/assets/temp-pms-overview-image-1.png" alt=""><figcaption></figcaption></figure>


### Partner roles

| Partner Admin          | PARTNER\_ADMIN      |
| ---------------------- | ------------------- |
| Policy Manager         | POLICYMANAGER       |
| Authentication Partner | AUTH\_PARTNER       |
| Credential Partner     | CREDENTIAL\_PARTNER |
| Device Provider        | DEVICE\_PROVIDER    |
| FTM Provider           | FTM\_PROVIDER       |

gitcheck-1
