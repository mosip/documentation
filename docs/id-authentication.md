# ✅ ID Authentication

## Overview

MOSIP offers identity verification services that enable the usage of identity in various contexts. After the successful issue of the ID, identity verification services become available for the resident. Online identity verification is enabled through MOSIP's [ID Authentication (IDA)](id-authentication-services.md) module. As MOSIP is a foundational ID system, different services (both government and private) may rely on the foundational ID system to validate the identity of a resident rather than implementing multiple authentication systems. A typical authentication flow is illustrated below:

![](\_images/ida-process.png)

Refer to the video below to learn more!

{% embed url="https://www.youtube.com/watch?v=kBJ_l6043Pw&list=PLF83tgjxrJvh6QVM27lxIYq5nlZx8rY8Z&index=7" %}

## Authentication types

### Yes/No Authentication

MOSIP offers a _yes/no_ API that can be used for the verification of attributes supplied along with authentication factors. The API verifies the identifier and the provided demographic attributes and also validates other authentication factors such as the OTP or biometrics and responds with a _yes_ or a _no_. Successful verification of the data results in a _yes_. This kind of API can be typically used to support the verification of a limited set of demographic data about the person or for simple presence verification when biometrics are used.

### KYC Authentication

MOSIP additionally offers a KYC API, which can be used to get an authorized set of attributes for the resident in the response of the API. This API is intended for use by authorized relying parties to perform KYC requests. The authentication includes an identifier along with authentication factors such as OTP and biometrics. The information returned is governed by a policy. Different relying parties can be provided with different KYC data based on their needs. The policy helps implement selective disclosure as part of the KYC data. The data thus returned is digitally signed by the server and can be used by the relying party with confidence.

### Multifactor authentication

The authentication APIs support multiple factors. These can be:

* Biometric: Finger, face, iris
* Demographic: Name, date of birth, age, gender etc.
* OTP: One-Time Password Based on the level of assurance needed for the transaction, the relying party can decide which factors are sufficient for identity verification.
* Password-based authentication.

Biometric authentication is performed using third-party matcher SDK that performs 1:1 matches on a given modality. Each biometric modality is treated as an independent factor in authentication.

## VID

All authentications in MOSIP essentially perform 1:1 matches. This essentially requires the authentication call to specify an identifier of the person and the authentication factors to perform the match on the individual referred to by the identifier. MOSIP supports the usage of multiple identifiers for a person. This promotes anonymity and also acts as a deterrent to profiling the individual. The individual can be identified in the authentication transaction by the UIN or other alias identifiers/ VIDs. When a VID is used there are additional checks to see if the VID has not expired or has not been revoked. The expiry of the VID is governed by the policy chosen at the time of its creation of the VID.

For understanding VIDs and their characteristics, read more about [VID](identifiers.md#vid).

## Tokenization

In one-off usage contexts, identity verification can be anonymous. In cases where identity verification is linked to transactions that need identity assurance, there is a need to tie the user identity of the user to the transaction. This is achieved by way of providing such relying parties with a "sticky" token identifier that can be used as a reference ID for the individual in their system. The authentication APIs return a token when the authentication is successful. Based on the type of relying party and their policy, the token is either random or sticky. The expected usage is for the relying party to remember the token returned by the authentication API for referring to their customer and for audit/redressal purposes.

Learn more about the [Token ID](identifiers.md#token).

## Relying parties and policies

Read more about [parties and policies](partner-policies.md).

## Consent

MOSIP has a provision for specifying the user consent associated with an authentication transaction. This can be stored for audit purposes and the authentication flow can be extended to verify the consent if needed.

## Hotlisting

MOSIP has a provision to help protect against the misuse of identity. For any report of lost identity or detection of fraudulent activity by fraud, the module can require the temporary suspension of authentication activities on a user. This is enabled by the hotlisting feature. The authentication service checks if the identifier used is hotlisted and if so, the authentication process is aborted and fails. The hotlisting service can be used by helpdesk and fraud solutions to list and delist the identifiers that need to be blocked temporarily.
