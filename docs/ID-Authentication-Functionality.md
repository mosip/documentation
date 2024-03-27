# ID Authentication Functionality

Authentication is the process of verifying an identity claim against the registered identity information. Such information could be a personal identification information (PII) such as demographic details, biometric data such as a fingerprint, iris or face and OTP on the registered email or phone number. MOSIP provides APIs using which an individual can perform such authentications after registering in MOSIP.

Authentication can be performed in MOSIP by a registered authentication partner over a secure network provided by MOSIP Infrastructure Service Provider (MISP). You can know more about these MOSIP partners on MOISP's Partner Management.

## Authentication Service

MOSIP's authentication service allows a registered MOSIP authentication partner to perform various types of authentications. The types of authentications that can are currently allowed are mentioned below and the API specification for services is available in [ID Authentication API Specification](ID-Authentication-APIs.md#authentication-service-public) document.

### Biometric Authentication

Using the MOSIP's authentication service a registered authentication partner can request for biometric authentication. Currently, we support biometrics authentication using face, finger and iris. MOSIP adopters can choose to add more biometric types to perform biometric authentication.

MOSIP connects with a biometric SDK, to perform biometric authentication. Refer our page on [Biometric SDK](Biometric-SDK.md) for various interfaces using which adopters can connect their biometric SDKs with MOSIP.

### Demographic Authentication

Using the MOSIP's authentication service a registered authentication partner can request for demographic authentication. Currently, we support demographic authentication for the following id attributes - Name, DOB, Age, Gender, Address and FullAddress.

1. Name - the name received in authentication request is compared with the individual's name saved in the authentication database
2. DOB - the DOB received in authentication request is compared with the individual's date of birth saved in the authentication database
3. Age - the age received in authentication request is compared with the age of the individual which is derived from the date of birth stored in the authentication database
4. Gender - the gender received in authentication request is compared with the individual's gender saved in the authentication database
5. Address - the address attributes received in authentication request is compared with the individual's address attributes saved in the authentication database

MOSIP supports only exact match for the demographic authentication of the individual and does not perform any validations related to partial match and phonetics match. No error messages related to partial match and phonetics match are triggered.

{% hint style="info" %}
1. The address attributes are generalized as location 1, location 2 and location 3
2. The adopter has to define and map the address specific attributes against addressLine2, addressLine3, and location specific attributes against location1, location2, location3 of a country. For example: addrLine1 means House No, addrLine2 means Street No, and addrLine3 means Locality; similarly loc1 means Local Administrative Authority, loc2 means Province and loc3 means Region.
{% endhint %}

### OTP Based Authentication

Using the MOSIP's authentication service a registered authentication partner can request for OTP authentication. Before performing OTP based authentication the Partner needs to request for an OTP using the individual's ID and use it for OTP based authentication.

For details about the OTP request service go through the [OTP request API specification](ID-Authentication-APIs.md#otp-request-service-public).

### Multi-factor Authentication

Using various combination of above authentication modalities (fingerprint, face, iris, demographics or OTP based authentication) we can also perform authentication using the same authentication service.

The partner who is requesting for these authentications must make sure that all the below mentioned rules are taken into account before sending an authentication request to MOSIP.

### Rules for using MOSIP's Authentication API

1. The authentication request should have a defined set of parameters as mentioned in the [Authentication API Specification](ID-Authentication-APIs.md#authentication-service-public).
2. The authentication request should have signature of the request in the header signed by the authentication partner.
3. The biometric data should be sent in as a JWT token where the payload [base64URL encoded](https://en.wikipedia.org/wiki/Base64) and the signature is signed using the device key. More details of the biometric data block is available in the [Secure Biometric Interface](broken-reference) document.
4. The request should be sent to the authentication server, within a set time period in the configurations (i.e. time period between the current time stamp and the request time stamp is <= time period set in configurations).

## e-KYC Service

Based on the policy linked to a MOSIP authentication partner, a partner can be eligible to perform e-KYC. In an e-KYC request, the MOSIP authentication partner can request to fetch the KYC details of the individual based on a pre-defined policy. KYC details in MOSIP is only provided to the partners after the individual's consent using OTP or biometric authentication.

The request for e-KYC service is similar to that of authentication service, you can view the details about the API specification in our [ID Authentication API Specification](ID-Authentication-APIs.md#e-kyc-service-public) document.

## Internal Authentication Service

Various internal MOSIP modules for need to use the authentication services. The scenarios where authentication of biometrics are needed are,

1. Authenticating an officer or supervisor when they on-board into the registration client.
2. Processing of packets in registration processor where,
   1. The officer or supervisor has performed biometric authentication.
   2. The introducer's biometrics are collected for authentication in the server side.
   3. The individual's biometrics are collected for authentication when he/she is trying to update his/her demographic details.

The internal authentication service supports authentication for all the modalities mentioned as part of authentication service but is only accessible bby the internal modules post authorization. The details about the internal authentication API specification is available in our [ID Authentication API Specification](ID-Authentication-APIs.md#e-kyc-service-public) document.

## Common Features in Authentication

### Validations in MOSIP's Authentication API

Below are the various validations that are performed in the authentication server when MOSIP's authentication service receives an authentication or e-KYC request from a Partner.

1. Verify if the Partner ID, MISP ID and Partner API Key is valid
2. Verify if the signature of the request is valid
3. Verify if the request has reached the authentication server with in the time period configured
4. Verify if the environment details, domain URI & consent token is valid
5. Verify if the authentication request has data as per the authentication mode selected
6. Verify if the partner is eligible for performing the authentication as per the partner's policy linked to the Partner API key
7. Verify if the VID or UIN details received is valid
8. In case of biometric data,
   1. Verify if the biometric block is signed using the device key
   2. Verify if the digital ID block is signed using the foundational trust module's key
   3. Verify if the timestamp in the digital ID block has reached the authentication server within the configured time period
   4. Once all the above validations are completed the biometrics are sent to the SDK for finding the match

### Generation of Authentication Token

After every authentication performed in MOSIP, an authentication token is generated in MOSIP. This token is generated based on policy defined for the partner. The token is basically a random id which can be unique per authentication transaction, unique per partner and individual or unique per partner policy group and individual.

### Trigger of Notification

After every authentication a notification is trigger to the registered email id or phone number of the individual based on the configuration defined for mode of communication. The notification to be sent to the individual can also be single or bi-lingual based on the configurations and template used.
