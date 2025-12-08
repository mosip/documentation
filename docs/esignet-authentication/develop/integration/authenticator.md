# Authenticator Plugin

The Authenticator plugin is the main interface for eSignet, which provides methods to authenticate the end-user with control of the supported authentication factors and a method to fetch consented user information from the Identity system.

The two main functionalities of the authenticator interface, **KYC Auth** and **KYC Exchange,** are depicted in the below diagram

<figure><img src="../../../.gitbook/assets/activity-diagrams-authenticator (1).png" alt=""><figcaption></figcaption></figure>

For eSignet Authentication Interface refer to the [Link](https://github.com/mosip/esignet/blob/master/esignet-integration-api/src/main/java/io/mosip/esignet/api/spi/Authenticator.java)

## Who should implement the Authenticator plugin interface?

The authenticator plugin is implemented by any organization - public or private, that wishes to integrate its identity system with eSignet to enable digital identity usage

An Identity system can be as simple as a table in a database or an Excel file storing user identity data or it can be a complex Identity System.

## How to implement this plugin?

Any organization intending to integrate eSignet with an [identity system](https://docs.esignet.io/general/glossary) of its choice must make necessary customizations to the authenticator plugin. These modifications ensure that the plugin can seamlessly interface with the target identity system and support its specific authentication and verification workflows. This approach enables eSignet to integrate efficiently with a wide range of identity systems. Please keep reading for further details.

"Authenticator = bridge between eSignet and the Identity Registry"

#### **Authenticator Interface Overview**

The **Authenticator interface** defines a set of methods that must be implemented:

1. doKycAuth
2. doKycExchange
3. sendOtp
4. isSupportedOtpChannel
5. getAllKycSigningCertificates
6. doVerifiedKycExchange

#### **Before You Implement**

Consider the authentication scenario and the type of identity system you are using.\
For example, assume your identity system supports **only OTP and password-based login**. For any other authentication factor, you can return an error.

#### **Flow and Method Details**

**1. OTP Sending (sendOtp)**

* When a user initiates authentication to **eSignet** from a relying-party application, they provide an \`individualId\`.
* If the user selects **OTP** for verification:
  * A request for sendOtp will be triggered.
  * Your implementation should:
    * Validate that the given individualId exists in the identity system.
    * Determine how to send the OTP (email or SMS).
    * Optionally, use a hardcoded OTP for testing.
    * Implement isSupportedOtpChannel to return the supported OTP channels.

**2. Authentication (doKycAuth)**

* After OTP verification or if the user chooses **password-based authentication**, they will call the **authenticate API**.
* The request includes:
  * individualId
  * A challenge list containing the auth factor and actual challenge.
* Your implementation should:
  * Validate individualId in the identity system.
  * Check for valid auth factors (OTP and password only).
    * If any other factor is present, throw invalid\_auth\_factor.
  * Generate:
    * **kyc\_token** (e.g., hash of a random UUID).
    * **PSUT** (Partner Specific User Token) by hashing individualId + relyingPartyId.
  * Return these values in kycAuthResult.

**3. KYC Exchange (doKycExchange)**

* After authentication, the user gives consent for claims.
* These claims are included in the **auth-code API call**, which returns an authCode.
* When the user exchanges authCode for an OAuth token:
  * Implement doKycExchange:
    * Fetch details using the kyc\_token generated earlier.
    * Since a simple identity system may not manage signing certificates:
      * Generate your own signing certificate.
      * Store it in **eSignet’s SoftHSM** or your custom keystore.
    * Create a JWT containing accepted claims for the individualId.
    * Sign the JWT with the generated certificate.
    * Return this JWT as the OAuth token.

**4. Verified KYC Exchange (doVerifiedKycExchange)**

* If claims include **verified claims**, implement this method to handle verification before token issuance.

{% hint style="warning" %}
**Note**:

* OTP and password are the only supported auth factors in this scenario
* For unsupported factors, return an error.
* Token generation and signing depend on your implementation strategy.
* Certificates must be managed securely (SoftHSM or custom keystore).
{% endhint %}

{% hint style="success" %}
**Important**:

Reference implementations of the Authenticator Plugin for MOCK ID and MOSIP ID are available. Please see the details below.

1. Please refer to how our [mock-plugin](https://github.com/mosip/esignet-plugins/blob/master/mock-plugin/src/main/java/io/mosip/esignet/plugin/mock/service/MockAuthenticationService.java) implements the eSignet Authenticator plugin to integrate eSignet with the mock identity system.
2. Also, look at the [MOSIP plugin](https://github.com/mosip/esignet-plugins/blob/master/mosip-identity-plugin/src/main/java/io/mosip/esignet/plugin/mosipid/service/IdaAuthenticatorImpl.java) reference implementation enabling the eSignet integration with the MOSIP identity system.
{% endhint %}



