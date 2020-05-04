## Table Of Contents
* [1. Single factor Authentication](#1-single-factor-authentication)
  * [1.1 Biometric Authentication](#1-1-biometric-authentication)
  * [1.2 Demographic Authentication](#1-2-demographic-authentication)
  * [1.3 OTP Authentication](#1-3-otp-authentication)
  * [1.4 Common Features for all Authentication Types](#1-4-common-features-for-all-authentication-types)
* [2. Multi-factor Authentication](#2-multi-factor-authentication)
* [3. Offline Authentication](#3-offline-authentication)
  * [3.1 QR Code based Authentication (WIP)](#3-1-qr-code-based-authentication-wip)
* [4. KYC Service](#4-kyc-service)
  * [4.1 Profile Sharing based on Policy](#4-1-profile-sharing-based-on-policy)
* [5. Partners Authentication and Authorization](#5-partners-authentication-and-authorization)
    * [5.1 MISP License Authentication](#5-1-misp-license-authentication)
    * [5.2 Partner Policy Authentication](#5-2-partner-policy-authentication)
* [6. Lock/Unlock Authentication Types](#6-lock-unlock-authentication-types)
    * [6.1 Lock Authentication Types](#6-1-lock-authentication-types)
    * [6.2 Unlock Authentication Types](#6-2-unlock-authentication-types)
* [7. Authentication Device Support](#7-authentication-device-support)
  * [7.1 Registered Devices and Open Devices](#7-1-registered-devices-and-open-devices)
* [List of Configurable Parameters and Processes](#list-of-configurable-parameters-and-processes)
* [Authentication Services API](#authentication-services-api)
* [Process View](#process-view)

# 1. Single factor Authentication [**[↑]**](#table-of-contents)

## 1.1 Biometric Authentication [**[↑]**](#table-of-contents)

### A. MOSIP system can evaluate the Individual's photo match with the corresponding photo in the Auth server [**[↑]**](#table-of-contents)
Upon receiving an authentication request, the system evaluates the Individual's photo match with the corresponding photo in the Auth server as per the following steps:

1. The authentication service request should have a defined set of parameters. Please refer to [data definition](_files/ida/data_definition.zip) for more details on required parameters.
1. The biometric data is sent in [base-64 encoded format](https://en.wikipedia.org/wiki/Base64)
1. System validates if the time period between the current time stamp and the request time stamp is <= time period. Refer to the features related to [time stamp validation](#a-validate-the-timestamp-of-the-authentication-request).
1. System validates that total number of face record(s) should not exceed 1
1. The face record in the input parameter against the mapped UIN/VID of the individual in the auth database is matched. Refer to the features related to [map VID to UIN](#c-map-vid-to-uin-of-the-individual-in-the-auth-database-so-that-the-individual-can-be-authenticated).
1. The system then generates a match score based on the level of the match of the face
1. 1:1 mapping is performed by the SDK and match score is provided. The system then proceeds to execute compare against the face threshold.
   * NOTE: Biometric Authentication match score generation is stubbed. The actual integration with SDK will be covered in forthcoming implementation.
1. The system proceeds to send Notification SMS and Notification E-mail. Refer to features related to [trigger SMS](#e-trigger-sms-to-the-individuals-mobile-for-every-authentication-request) and [trigger e-mail](#f-trigger-e-mail-to-the-individuals-e-mail-id-for-every-authentication-request).
1. Alerts and warning messages for data type violation are sent as per data definition.

Please refer to the [Biometric Authentication API](ID-Authentication-APIs.md#authentication-service-public)
for more details.

### B. Authenticate the face of the Individual by comparing the match score of the photo against the threshold [**[↑]**](#table-of-contents)
Upon receiving an authentication service request, the system authenticates the face of the Individual by comparing the match score of the photo against the threshold as per the following steps:

1. The authentication service request should have a defined set of parameters. Please refer to [data definition](_files/ida/data_definition.zip) for more details on required parameters.
1. The biometric data is sent in [base-64 encoded format](https://en.wikipedia.org/wiki/Base64).
1. Validates if the time period between the current time stamp and the request time stamp is <= time period (n - admin config). Refer to the features related to [time stamp validation](#a-validate-the-timestamp-of-the-authentication-request).
1. The system retrieves the threshold level configured which is acceptable for a match and then validates if the match score is equal to greater than the threshold level and sets the status as 'Y' for authentication
1. Constructs the authentication response based on validation results
1. Integrates the response with the static token generated for the authentication request. Refer to features related to generate a [static token](#d-generate-a-static-token-id-for-each-mosip-authentication-request-to-facilitate-authentication). 
1. The system proceeds to send Notification SMS and Notification E-mail. Refer to features related to [trigger SMS](#e-trigger-sms-to-the-individuals-mobile-for-every-authentication-request) and [trigger e-mail](#f-trigger-e-mail-to-the-individuals-e-mail-id-for-every-authentication-request).
1. Alerts and warning messages for data type violation are sent as per data definition.

Please refer to the [Biometric Authentication API](ID-Authentication-APIs.md#authentication-service-public)
for more details.

### C. Evaluate the Individual's fingerprints with the corresponding fingerprint in the Auth server [**[↑]**](#table-of-contents)
Upon receiving an authentication request, the system evaluates the Individual's fingerprints with the corresponding fingerprint in the Auth server as per the following steps:

1. The authentication service request should have a defined set of parameters. Please refer to [data definition](_files/ida/data_definition.zip) in Git for more details on required parameters.
1. The biometric is sent in [base-64 encoded format](https://en.wikipedia.org/wiki/Base64).
1. The system then validated the following:
   * Validates if the time period between the current time stamp and the request time stamp is <= time period (n is an admin configuration). Refer to the features related to [time stamp validation](#a-validate-the-timestamp-of-the-authentication-request).
   * Validates if duplicate fingers are used in input
   * Validates if total number of finger print records exceed 2
4. The system then matches finger print records in the input parameter against the mapped UIN/VID of the individual in the auth database. Refer to the features related to [map VID to UIN](#f-trigger-e-mail-to-the-individuals-e-mail-id-for-every-authentication-request).
1. The system then generates a match score based on the level of the match of the fingerprints and proceeds to execute compare against fingerprint threshold 
1. The system proceeds to send Notification SMS and Notification E-mail. Refer to features related to [trigger SMS](#e-trigger-sms-to-the-individuals-mobile-for-every-authentication-request) and [trigger e-mail](#f-trigger-e-mail-to-the-individuals-e-mail-id-for-every-authentication-request).
1. Alerts and warning messages for data type violation are sent as per data definition.
 
Please refer to the [Biometric Authentication API](ID-Authentication-APIs.md#authentication-service-public)
for more details.

### D. Authenticate the fingerprints of the Individual by comparing the match score of the fingerprint against the threshold (BioAuthService) [**[↑]**](#table-of-contents)
Upon receiving an authentication request, the system authenticates the fingerprints of the Individual by comparing the match score of the fingerprint against the threshold. The system can integrate with Fingerprint scanner and generate match score as per the following steps:
1. The authentication service request should have a defined set of parameters. Please refer to [data definition](_files/ida/data_definition.zip) for more details on required parameters.
1. The biometric is sent in [base-64 encoded format](https://en.wikipedia.org/wiki/Base64).
1. Validates if the time period between the current time stamp and the request time stamp is <= time period (n - admin config). Refer to the features related to [time stamp validation](#a-validate-the-timestamp-of-the-authentication-request).
1. The system retrieves the threshold level configured which is acceptable for a match
1. The system then validates  if the match score is equal to greater than the threshold level and sends a response
1. Integrates the response with the static token generated for the authentication request. Refer to features related to generate a [static token](#d-generate-a-static-token-id-for-each-mosip-authentication-request-to-facilitate-authentication). 
1. The system proceeds to send Notification SMS and Notification E-mail. Refer to features related to [trigger SMS](#e-trigger-sms-to-the-individuals-mobile-for-every-authentication-request) and [trigger e-mail](#f-trigger-e-mail-to-the-individuals-e-mail-id-for-every-authentication-request).
1. Alerts and warning messages for data type violation are sent as per data definition.

Please refer to the [Biometric Authentication API](ID-Authentication-APIs.md#authentication-service-public)
for more details.


### E. Support two-finger authentication so that the quality of incoming fingerprints is better [**[↑]**](#table-of-contents)
Upon receiving an authentication request, the system supports two-finger authentication so that the quality of incoming fingerprints gets better as per the below process:

1. The authentication service request should have a defined set of parameters. Please refer to [data definition](_files/ida/data_definition.zip) for more details on required parameters.
1. The biometric is sent in [base-64 encoded format](https://en.wikipedia.org/wiki/Base64)
1. The system validated the following:
   * Validates if the time period between the current time stamp and the request time stamp is <= time period (n is an admin configuration). Refer to the features related to [time stamp validation](#a-validate-the-timestamp-of-the-authentication-request).
   * Validates if duplicate fingers are used in input, if duplicate encoded value is used in the input for fingers - updated logic
   * Validates if single finger print record contains more than one finger
   * Validates if total number of finger print records exceed 2
4. The system then matches first finger print record in the input parameter against the mapped UIN/VID of the individual in the auth database. Refer to the features related to [map VID to UIN](#f-trigger-e-mail-to-the-individuals-e-mail-id-for-every-authentication-request).
1. The system will integrate with BioAPI compositeMatch function logic which returns composite match score. 
   * NOTE: The logic of average or sum, etc. will be part of BioAPI implementation. The current stubbed implementation of BioAPI performs an average.
1. The system retrieves the composite finger threshold configured which is acceptable for a match
1. The system validates if the composite match score is equal to greater than the composite finger threshold
1.  Constructs the authentication response based on validation results
1. Integrates the response with the static token generated for the authentication request. Refer to features related to generate a [static token](#d-generate-a-static-token-id-for-each-mosip-authentication-request-to-facilitate-authentication).
1. The system proceeds to send Notification SMS and Notification E-mail. Refer to features related to [trigger SMS](#e-trigger-sms-to-the-individuals-mobile-for-every-authentication-request) and [trigger e-mail](#f-trigger-e-mail-to-the-individuals-e-mail-id-for-every-authentication-request).
1. Alerts and warning messages for data type violation are sent as per data definition.

Please refer to the [Biometric Authentication API](ID-Authentication-APIs.md#authentication-service-public) for more details.

### F. Evaluate the Individual's IRIS match with the corresponding IRIS in the Auth server [**[↑]**](#table-of-contents)
Upon receiving an authentication request, the system evaluates the Individual's IRIS match with the corresponding IRIS in the Auth server as per the following steps:

1. The authentication service request should have a defined set of parameters. Please refer to [data definition](_files/ida/data_definition.zip) for more details on required parameters.
2. The biometric is sent in [base-64 encoded format](https://en.wikipedia.org/wiki/Base64)
3. The system validated the following:
   * Validates if the time period between the current time stamp and the request time stamp is <= time period (n is an admin configuration). Refer to the features related to [time stamp validation](#a-validate-the-timestamp-of-the-authentication-request).
   * Validates if duplicate irises are used in input 
   * Validates if total number of Iris records exceeds 2
   * Validates if single iris record is present in the input
   * The system matches iris record in the input parameter against the mapped UIN/VID of the individual in the auth database. Refer to the features related to [map VID to UIN](#f-trigger-e-mail-to-the-individuals-e-mail-id-for-every-authentication-request).
4. The system then generates a match score based on the level of the match of the Irises. The SDK will provide the match score.
   * NOTE: Biometric Authentication match score generation is stubbed. The actual integration with SDK will be covered in forthcoming implementation.
1. The system validates if two iris records are present in the input
1. The system matches each of the iris records in the input parameter against the corresponding records of the mapped UIN/VID of the individual in the auth database and then generates a match score based on the level of the match of the Irises. Refer to the features related to [map VID to UIN](#f-trigger-e-mail-to-the-individuals-e-mail-id-for-every-authentication-request).
1. Match score 1 and Match score 2 are generated for each images. The SDK provides the match score
   * NOTE: Biometric Authentication match score generation is stubbed. The actual integration with SDK will be covered in forthcoming implementation.
1. The system generates a composite match score by summing up the match scores for the first and the second iris Images
1. The system proceeds to execute compare against Iris threshold
1. The system proceeds to send Notification SMS and Notification E-mail. Refer to features related to [trigger SMS](#e-trigger-sms-to-the-individuals-mobile-for-every-authentication-request) and [trigger e-mail](#f-trigger-e-mail-to-the-individuals-e-mail-id-for-every-authentication-request).
1. Alerts and warning messages for data type violation are sent as per data definition.

Please refer to the [Biometric Authentication API](ID-Authentication-APIs.md#authentication-service-public) for more details.

### G. Authenticate the IRIS of the Individual by comparing the match score of the IRIS against the threshold [**[↑]**](#table-of-contents)

1. The authentication service request should have a defined set of parameters. Please refer to [data definition](_files/ida/data_definition.zip) for more details on required parameters.
1. The system retrieves generated score match
1. The biometric is sent in [base-64 encoded format](https://en.wikipedia.org/wiki/Base64).
1. Validates if the time period between the current time stamp and the request time stamp is <= time period (n - admin config). Refer to the features related to [time stamp validation](#a-validate-the-timestamp-of-the-authentication-request).
1. The system then validated the following:
   * Validates if single iris records are present in the input
   * Retrieves the threshold level configured which is acceptable for a match
   * Validates if the match score is equal to greater than the threshold level
   * Validates if two iris records are present in the input
   * Retrieves the composite threshold level configured which is acceptable for a match
   * Validates if the composite match score is equal to greater than the composite threshold
6.  Constructs the authentication response based on validation results 
1. The system proceeds to execute compare against Iris threshold
1. Integrates the response with the static token generated for the authentication request. Refer to features related to generate a [static token](#d-generate-a-static-token-id-for-each-mosip-authentication-request-to-facilitate-authentication).  
1. The system proceeds to send Notification SMS and Notification E-mail. Refer to features related to [trigger SMS](#e-trigger-sms-to-the-individuals-mobile-for-every-authentication-request) and [trigger e-mail](#f-trigger-e-mail-to-the-individuals-e-mail-id-for-every-authentication-request).
1. Alerts and Warning messages for data type violation are sent as per data definition.

Please refer to the [Biometric Authentication API](ID-Authentication-APIs.md#authentication-service-public) for more details.

[**Link to design**](https://github.com/mosip/id-authentication/tree/master/design/authentication/Bio_Auth_Request_REST_Service.md)

## 1.2 Demographic Authentication [**[↑]**](#table-of-contents)

### A. Strategy for Authentication [**[↑]**](#table-of-contents)

MOSIP supports only exact match for the demographic authentication of the individual and does not perform any validations related to partial match and phonetics match. No error messages related to partial match and phonetics match are triggered.

### B. Demographic (Address) Authentication [**[↑]**](#table-of-contents)
No weightage is provided to any field\s but exact match strategy is adopted for demographic address.

1. The authentication service request should have a defined set of parameters. Please refer to [data definition](_files/ida/data_definition.zip) for more details on required parameters.
1. Upon receiving an authentication request the system validates if the time period between the current time stamp and the request time stamp is <= time period (n - admin config). Refer to the features related to [time stamp validation](#a-validate-the-timestamp-of-the-authentication-request).
1. The system validates if each of the address line items  in the input parameter is same as the address line items against the mapped UIN/VID of the individual in the auth database in the respective language for each address element. Refer to the features related to [map VID to UIN](#f-trigger-e-mail-to-the-individuals-e-mail-id-for-every-authentication-request).
1.  Constructs the authentication response based on validation results
1. Integrates the response with the static token generated for the authentication request. Refer to features related to generate a [static token](#d-generate-a-static-token-id-for-each-mosip-authentication-request-to-facilitate-authentication).
1. The system proceeds to send Notification SMS and Notification E-mail. Refer to features related to [trigger SMS](#e-trigger-sms-to-the-individuals-mobile-for-every-authentication-request) and [trigger e-mail](#f-trigger-e-mail-to-the-individuals-e-mail-id-for-every-authentication-request).

Please refer to the [Demographic Authentication API](ID-Authentication-APIs.md#authentication-service-public) for more details.

{% hint style="info" %}
1. The address attributes are generalized as location 1, location 2 and location 3 
1. The SI has to define and map the address specific attributes against addressLine2, addressLine3,  and location specific attributes against location1, location2, location3 of a country. For example: addrLine1 means House No, addrLine2 means Street No, and addrLine3 means Locality; similarly loc1 means Local Administrative Authority, loc2 means Province and loc3 means Region.
{% endhint %}


Please refer Git for the address based [Normalization Rules](_files/ida/Address_Normalization_BR.docx)

### C. Verify the Age of the individual so that the individual is authenticated [**[↑]**](#table-of-contents)

1. The authentication service request should have a defined set of parameters. Please refer to [data definition](_files/ida/data_definition.zip) in Git for more details on required parameters.
1. Upon receiving an authentication request the system validates if the time period between the current time stamp and the request time stamp is <= time period (n - admin config). Refer to the features related to [time stamp validation](#a-validate-the-timestamp-of-the-authentication-request).
1. The system retrieves the DOB of the individual in the auth database based on the mapped UIN/VID. Refer to the features related to [map VID to UIN](#f-trigger-e-mail-to-the-individuals-e-mail-id-for-every-authentication-request).
1. The system calculates the age of the individual based on the DOB.
4. Validates if the Age of the individual is greater than or equal to the Age in the input parameter
5.  Constructs the authentication response based on validation results
1. Integrates the response with the static token generated for the authentication request. Refer to features related to generate a [static token](#d-generate-a-static-token-id-for-each-mosip-authentication-request-to-facilitate-authentication).
1. The system proceeds to send Notification SMS and Notification E-mail. Refer to features related to [trigger SMS](#e-trigger-sms-to-the-individuals-mobile-for-every-authentication-request) and [trigger e-mail](#f-trigger-e-mail-to-the-individuals-e-mail-id-for-every-authentication-request).

Please refer to the [Demographic Authentication API](ID-Authentication-APIs.md#authentication-service-public) for more details.

### D. Match Name of the individual in the database so that the individual is authenticated [**[↑]**](#table-of-contents)

1. The authentication service request should have a defined set of parameters. Please refer to [data definition](_files/ida/data_definition.zip) in Git for more details on required parameters.
1. Upon receiving an authentication request the system validates if the time period between the current time stamp and the request time stamp is <= time period (n - admin config). Refer to the features related to [time stamp validation](#a-validate-the-timestamp-of-the-authentication-request).
2. The system compares the name in the input parameter with the Name saved in the respective language in the auth database
3.  Constructs the authentication response based on validation results
1. Integrates the response with the static token generated for the authentication request. Refer to features related to generate a [static token](#d-generate-a-static-token-id-for-each-mosip-authentication-request-to-facilitate-authentication).
1. The system proceeds to send Notification SMS and Notification E-mail. Refer to features related to [trigger SMS](#e-trigger-sms-to-the-individuals-mobile-for-every-authentication-request) and [trigger e-mail](#f-trigger-e-mail-to-the-individuals-e-mail-id-for-every-authentication-request).

Please refer to the [Demographic Authentication API](ID-Authentication-APIs.md#authentication-service-public) for more details.

### E. Match phone number of the individual in the database so that the individual is authenticated [**[↑]**](#table-of-contents)

1. The authentication service request should have a defined set of parameters. Please refer to  [data definition](_files/ida/data_definition.zip) in Git for more details on required parameters.
1. Upon receiving an authentication request the system validates if the time period between the current time stamp and the request time stamp is <= time period (n - admin config). Refer to the features related to [time stamp validation](#a-validate-the-timestamp-of-the-authentication-request).
2. The system matches the phone number in the input parameter with the phone number of the individual in the auth database based on the mapped UIN/VID. Refer to the features related to [map VID to UIN](#f-trigger-e-mail-to-the-individuals-e-mail-id-for-every-authentication-request).
3.  Constructs the authentication response based on validation results
1. Integrates the response with the static token generated for the authentication request. Refer to features related to generate a [static token](#d-generate-a-static-token-id-for-each-mosip-authentication-request-to-facilitate-authentication).
1. The system proceeds to send Notification SMS and Notification E-mail. Refer to features related to [trigger SMS](#e-trigger-sms-to-the-individuals-mobile-for-every-authentication-request) and [trigger e-mail](#f-trigger-e-mail-to-the-individuals-e-mail-id-for-every-authentication-request).

Please refer to the [Demographic Authentication API](ID-Authentication-APIs.md#authentication-service-public) for more details.

### F. Match e-mail ID of the individual in the database so that the individual is authenticated [**[↑]**](#table-of-contents)

1. The authentication service request should have a defined set of parameters. Please refer to  [data definition](_files/ida/data_definition.zip) in Git for more details on required parameters.
1. Upon receiving an authentication request the system validates if the time period between the current time stamp and the request time stamp is <= time period (n - admin config). Refer to the features related to [time stamp validation](#a-validate-the-timestamp-of-the-authentication-request).
1. The system matches the e-mail id in the input parameter with the phone number of the individual in the auth database based on the mapped UIN/VID. Refer to the features related to [map VID to UIN](#f-trigger-e-mail-to-the-individuals-e-mail-id-for-every-authentication-request).
1.  Constructs the authentication response based on validation results
1. Integrates the response with the static token generated for the authentication request. Refer to features related to generate a [static token](#d-generate-a-static-token-id-for-each-mosip-authentication-request-to-facilitate-authentication).
1. The system proceeds to send Notification SMS and Notification E-mail. Refer to features related to [trigger SMS](#e-trigger-sms-to-the-individuals-mobile-for-every-authentication-request) and [trigger e-mail](#f-trigger-e-mail-to-the-individuals-e-mail-id-for-every-authentication-request).

Please refer to the [Demographic Authentication API](ID-Authentication-APIs.md#authentication-service-public) for more details.

### G. Match gender of the individual in the database so that the individual is authenticated [**[↑]**](#table-of-contents)

1. The authentication service request should have a defined set of parameters. Please refer to  [data definition](_files/ida/data_definition.zip) in Git for more details on required parameters.
1. Upon receiving an authentication request the system validates if the time period between the current time stamp and the request time stamp is <= time period (n - admin config). Refer to the features related to [time stamp validation](#a-validate-the-timestamp-of-the-authentication-request).
1. The system matches the Gender in the input parameter with the Gender of the individual in the auth database based on the mapped UIN/VID. Refer to the features related to [map VID to UIN](#f-trigger-e-mail-to-the-individuals-e-mail-id-for-every-authentication-request).
1.  Constructs the authentication response based on validation results
1. Integrates the response with the static token generated for the authentication request. Refer to features related to generate a [static token](#d-generate-a-static-token-id-for-each-mosip-authentication-request-to-facilitate-authentication).
1. The system proceeds to send Notification SMS and Notification E-mail. Refer to features related to [trigger SMS](#e-trigger-sms-to-the-individuals-mobile-for-every-authentication-request) and [trigger e-mail](#f-trigger-e-mail-to-the-individuals-e-mail-id-for-every-authentication-request). 

Please refer to the [Demographic Authentication API](ID-Authentication-APIs.md#authentication-service-public) for more details.


### H. Match DOB of the individual in the database so that the individual is authenticated [**[↑]**](#table-of-contents)

1. The authentication service request should have a defined set of parameters. Please refer to  [data definition](_files/ida/data_definition.zip) in Git for more details on required parameters.
1. Upon receiving an authentication request the system validates if the time period between the current time stamp and the request time stamp is <= time period (n - admin config). Refer to the features related to [time stamp validation](#a-validate-the-timestamp-of-the-authentication-request).
1. The system matches the DOB in the input parameter with the DOB of the individual in the auth database based on the mapped UIN/VID. Refer to the features related to [map VID to UIN](#f-trigger-e-mail-to-the-individuals-e-mail-id-for-every-authentication-request).
1.  Constructs the authentication response based on validation results
1. Integrates the response with the static token generated for the authentication request. Refer to features related to generate a [static token](#d-generate-a-static-token-id-for-each-mosip-authentication-request-to-facilitate-authentication).
1. The system proceeds to send Notification SMS and Notification E-mail. Refer to features related to [trigger SMS](#e-trigger-sms-to-the-individuals-mobile-for-every-authentication-request) and [trigger e-mail](#f-trigger-e-mail-to-the-individuals-e-mail-id-for-every-authentication-request).

Please refer to the [Demographic Authentication API](ID-Authentication-APIs.md#authentication-service-public) for more details.

[**Link to design**](https://github.com/mosip/id-authentication/tree/master/design/authentication/Demo_Auth_Request_REST_Service.md)
  
## 1.3 OTP Authentication [**[↑]**](#table-of-contents)

### A. Trigger OTP to an individual so that the individual can be authenticated based on OTP [**[↑]**](#table-of-contents)

1. The authentication service request should have a defined set of parameters. Please refer to [data definition](_files/ida/data_definition.zip) in Git for more details on required parameters.
1. Upon receiving an authentication request the system validates if the Timestamp of OTP generation request is older than 20 min. Refer to the features related to [time stamp validation](#a-validate-the-timestamp-of-the-authentication-request).
1. The system generates the OTP for the request
1. Retrieves the mode of communication (i.e) e-mail or phone number configured for sending the OTP
1. The system validates if the configured mode of communication is also registered and triggers and OTP 
1. Constructs the authentication response based on validation results with masked mobile and masked e-mail
1. The system proceeds to validate OTP as per the defined standards
1. The system proceeds to send Notification SMS and Notification E-mail. Refer to features related to [trigger SMS](#e-trigger-sms-to-the-individuals-mobile-for-every-authentication-request) and [trigger e-mail](#f-trigger-e-mail-to-the-individuals-e-mail-id-for-every-authentication-request).

Please refer to the [OTP Authentication API](ID-Authentication-APIs.md#otp-request-service-public) for more details.


### B. Trigger SMS to the Individual's mobile for OTP Trigger request [**[↑]**](#table-of-contents)

1. The authentication service request should have a defined set of parameters. Please refer to [data definition](_files/ida/data_definition.zip) in Git for more details on required parameters.
1. The system retrieves the mode of communication (i.e) e-mail or phone number configured for sending the notification
1. Validates if the configured mode of communication is also registered
1. The system fetches the notification template as per admin configuration
1. Triggers notification as per the defined and configured template and in the default language.

Please refer to the [OTP Authentication API](ID-Authentication-APIs.md#otp-request-service-public) for more details.

### C. Respond with masked e-mail and masked phone number for OTP trigger request [**[↑]**](#table-of-contents)

The system follows the following steps to include masked e-mail and phone in the OTP request response
1. Retrieves the mode to which OTP will be sent as per the below logic
   * If the configured mode of communication is also registered sends OTP to the configured and registered mode
   * If the configured mode = e-mail and Registered Mode is Mobile; then sends OTP to Mobile
   * If the configured mode = phone and Registered Mode is e-mail; then sends OTP to e-mail
   * If registered mode is none, then send error code. 

2. If the communication mode = mobile
1. Mask the mobile no of the individual as per logic below and include the masked mobile in the OTP request response
1. If the communication mode = e-mail
1. Mask the e-mail of the individual as per the logic below and include the masked e-mail in the OTP request response
1. If the communication mode = mobile and e-mail
1. Mask both the mobile no and the email as per the logic below and include the both in the OTP request response
 
### Logic for masking mobile [**[↑]**](#table-of-contents)

1. No of digits in the mobile number to be retrieved – say n
1. Mask first {(50% of the n digits) + 1} digits of the mobile number
{% hint style="info" %}
50% in case of decimal means rounded to the greatest whole number
{% endhint %}
{% hint style="info" %}
Example:

* Original phone number: 8347899201
* Masked phone number: XXXXXX9201
{% endhint %}

**Logic for masking e-mail**

1. Consider the characters prior to the symbol ‘@’
1. Assign a position to each character
1. Mask every alternate 2 characters starting from position 1
{% hint style="info" %}
Example:

* Original e-mail: umamahesh@gmail.com
* Masked e-mail: XXaXXhXXh@gmail.com
{% endhint %}

### D. Trigger e-mail to the Individual's mail-ID for OTP Trigger request [**[↑]**](#table-of-contents)

1. The authentication service request should have a defined set of parameters. Please refer to [data definition](_files/ida/data_definition.zip) in Git for more details on required parameters.
1. The system then retrieves the mode of communication (i.e) e-mail or phone number configured for sending the notification
1. Validates if the configured mode of communication is also registered
1. Fetches the notification template as per admin configuration
1. Triggers notification as per the defined and configured template and in the default language English

Please refer to the [OTP Authentication API](ID-Authentication-APIs.md#otp-request-service-public) for more details.

### E. Validate OTP provided by an Individual so that the individual can be authenticated based on OTP [**[↑]**](#table-of-contents)

1. The authentication service request should have a defined set of parameters. Please refer to [data definition](_files/ida/data_definition.zip) in Git for more details on required parameters.
1. Upon receiving an authentication request with required parameters a the system validates if the transaction id matches with transaction id value of OTP Generation Request
1. Validates if the time period between the current time stamp and the request time stamp is <= time period (n - admin config). Refer to the features related to [time stamp validation](#a-validate-the-timestamp-of-the-authentication-request).
1. Validates if the OTP in the input parameter is same as the OTP triggered for the individual to the registered phone number and/or e-mail
1. The system checks the validity of the OTP 
1. Constructs the authentication response based on validation results
1. The system proceeds to send Notification SMS and Notification E-mail. Refer to features related to [trigger SMS](#e-trigger-sms-to-the-individuals-mobile-for-every-authentication-request) and [trigger e-mail](#f-trigger-e-mail-to-the-individuals-e-mail-id-for-every-authentication-request).

Please refer to the [OTP Authentication API](ID-Authentication-APIs.md#otp-request-service-public) for more details.

## 1.4 Common Features for all Authentication Types [**[↑]**](#table-of-contents)

### A. Validate the timestamp of the authentication request [**[↑]**](#table-of-contents)

1. The authentication service request should have a defined set of parameters. Please refer to [data definition](_files/ida/data_definition.zip) in Git for more details on required parameters.
1. The system then validates the following:
   * Validates if the time period between the current time stamp and the request time stamp is <= 20 min
   * Validates if the time period between the current time stamp and the request time stamp is <= time period (n - admin config)---> Default value-24 hrs
   * The system validates the mode of authentication as per the defined standards
   * Then triggers error messages as configured.
3. MOSIP supports standard time for timestamps of authentication requests and responses
   * The timestamp of the Authentication, e-KYC, OTP trigger requests and responses will support IS0-8601 standard.
   * The partners in a country are expected to send the timestamp  in the request in UTC with time zone
   * MOSIP returns the timestamp in the response in UTC with Time zone

### B. Locate the UIN of the individual in the Auth database so that the individual can be authenticated [**[↑]**](#table-of-contents)

1. The authentication service request should have a defined set of parameters. Please refer to [data definition](_files/ida/data_definition.zip) in Git for more details on required parameters.
1. The system matches the input UIN from the individual with the UIN in the auth database (Complete match) and sends an error message in case of any mismatch

### C. Map VID to UIN of the individual in the Auth database so that the individual can be authenticated [**[↑]**](#table-of-contents)
The authentication service request should have a defined set of parameters. Please refer to [data definition](_files/ida/data_definition.zip) in Git for more details on required parameters.

1. The system then validates if the VID is mapped to an UIN in the database and retrieve the UIN
1. The system proceeds to Match UIN as per defined standards

### D. Generate a static token ID for each MOSIP authentication request, to facilitate authentication [**[↑]**](#table-of-contents)
The authentication service request should have a defined set of parameters. Please refer to [data definition](_files/ida/data_definition.zip) in Git for more details on required parameters.

The system then performs the following steps to generate a static token ID

The system retrieves the UIN and Partner ID for token Id generation

1. Generates tokenID based on the defined standards
1. The tokenID is unique for a UIN and partnerId combination. The same id should be returned if any auth request is received from the same UIN and partnerId combination
1. The tokenID is generated for every authentication request
1. The length of tokenID is configurable by the ADMIN (the default length of 36 digits)
1. The UIN and partner id are not be derivable from the tokenId
1. The tokenID is a random number generated
1. The tokenId does not contain any alphanumeric characters and should contain only numeric characters
1. The number does not contain the restricted numbers defined by the ADMIN
1. The generated token id is integrated to the authentication response along with other parameters.
1. The system then captures and stores the transaction details for audit purpose.

{% hint style="info" %}
The Authentication is integrated for both successful and failure authentications (i.e) in all cases where authentication notifications are triggered.
{% endhint %}

### E. Trigger SMS to the Individual's mobile for every authentication request [**[↑]**](#table-of-contents)
The authentication service request should have a defined set of parameters. Please refer to [data definition](_files/ida/data_definition.zip) in Git for more details on required parameters.

The system then performs the following steps to Trigger SMS to the Individual's mobile for every authentication request

1. Retrieves the mode of communication (i.e) mobile configured for sending the notification
1. Validates if the configured mode of communication is also registered
1. Fetches the notification template as per admin configuration and triggers notification as per the defined and configured template and in the default language English

### F. Trigger e-mail to the Individual's e-mail ID for every authentication request [**[↑]**](#table-of-contents)
The authentication service request should have a defined set of parameters. Please refer to [data definition](_files/ida/data_definition.zip) in Git for more details on required parameters.

1. The system retrieves the mode of communication (i.e) e-mail configured for sending the notification
1. The system validates if the configured mode of communication is also registered
1. Fetches the notification template as per admin configuration and triggers notification as per the defined and configured template and in the default language English

[**Link to design**](https://github.com/mosip/id-authentication/tree/master/design/authentication/OTP_Auth_Request_REST_Service.md)

[**Link to design**](https://github.com/mosip/id-authentication/tree/master/design/authentication/OTP_Request_REST_service.md)

# 2. Multi-factor Authentication [**[↑]**](#table-of-contents)
We can perform various combinations of authentication using various modalities as listed for [**Single Factor Authentication**](#1-single-factor-authentication).

# 3. Offline Authentication 

## 3.1 QR Code based Authentication (WIP) [**[↑]**](#table-of-contents)

> This is factored for future releases and is not part of current implementation.

# 4. KYC Service 

## 4.1 Profile Sharing based on Policy [**[↑]**](#table-of-contents)

**KYC Service is offered based on the individual’s consent using OTP or Biometric (Fingerprint/IRIS/Face) Authentication in the authentication request.**

The authentication service request should have a defined set of parameters. Please refer to [data definition](_files/ida/data_definition.zip) in Git for more details on required parameters.

The system then validates the following:

1. Validates digital signature in the certificate
1. Validates the certificate
1. Validates if the partnerID belongs to a registered partner
1. Validates if the partner status is active
1. Retrieves the policy constituting for the partnerID and partner api key
1. Validates if the auth type specified in the request is one of the policies retrieved.
1. Validates if the auth type specified in the request is one of the permissible auth types for e-KYC for the country as per the set configuration
1. Validates if the retrieved policy contains one e-KYC policy (the policy containing demographic attributes to be returned)
1. The system performs all the validation of the "auth" as per standards and encodes the auth response
1. Validate the status of the auth response and proceed only if the status is successful
1. The system proceeds to construct the e-KYC response element, which will be encoded and encrypted.
1. The system integrates the response with the static token generated for the authentication request 
1.  Constructs the authentication response based on validation results
1. Validate e-KYC permissions for e-KYC partner as per the e-KYC policies retrieved and identify the demo fields configured to be part of the response
1. Appends the response with the demographic and id fields as per the policy
1. The system validates the sec_language attribute in the request and appends the response with the demographic fields in language requested.
1. The system proceeds to send Notification SMS 
1. Alerts and Warning messages for data type violation are sent as per [data definition](_files/ida/data_definition.zip)

{% hint style="info" %}
(For points 3, 4 and 5) **Partners Authentication and Authorisation** is only a proxy implementation due to pending integration with Partner Management services.
{% endhint %}

Please refer to the [eKYC API](ID-Authentication-APIs.md#ekyc-service-public) for more details.

[**Link to design**](https://github.com/mosip/id-authentication/tree/master/design/authentication/eKYC_Auth_Request_REST_service.md)

# 5. Partners Authentication and Authorisation
NOTE: **Partners Authentication and Authorisation** is only a proxy implementation due to pending integration with Partner Management services

## 5.1 MISP License Authentication [**[↑]**](#table-of-contents)

**Authenticate and authorise the MOSIP Infrastructure Service Provider (MISP)**

MOSIP can authenticate and authorise the MOSIP Infrastructure Service Provider (MISP) as per the following steps listed below:

1. The authentication service request should have a defined set of parameters. Please refer to [data definition](_files/ida/data_definition.zip) in Git for more details on required parameters.
1. Validates if the MISP-license key has not expired
1. Validates if the MISP-license key belongs to a registered MISP (Note: All the MISPs will be registered through MOSIP admin portal and the MISP-license key should belong to one of the registered MISP entities)
1. Validates if the MISP-license key status is active
1. Proceeds to execute e-KYC/Auth partner authentication and authorisation as per defined standards
1. Captures and stores the transaction details for audit purpose.
1. Alerts and warning messages for data type violation are sent as per [data definition](_files/ida/data_definition.zip).

Please refer to the [Authentication Service API](ID-Authentication-APIs.md#users-of-authentication-service--) for more details.


## 5.2 Partner Policy Authentication [**[↑]**](#table-of-contents)

**Authenticate and authorise Auth Partner - proxy implementation**

The authentication service request should have a defined set of parameters. Please refer to [data definition](_files/ida/data_definition.zip) in Git for more details on required parameters.

The system then validates the following:

1. Validates the digital signature in the certificate
1. Validates the certificate
1. Validates if the partnerID belongs to a registered partner
1. The system also validates if the partner status is active
1. Retrieves all the policies constituting the partnerID and partner api key
1. Validates if the auth type specified in the request is one of the policies retrieved for the partner
1. Validates if the time period between the current time stamp and the request time stamp is <= time period (n - admin config)
1. Validates if the "authvalue" in the input parameter is same "authval" stored in the database for the mapped UIN and VID
1. The system constructs the authentication response based on validation results and sets the authentication status as 'Y' only if the pinval matches.
1. The system then integrates the response with the static token generated for the authentication request  
1.  Constructs the authentication response based on validation results
1. The system proceeds to send Notification SMS 
1. Alerts and Warning messages for data type violation are sent as per [data definition](_files/ida/data_definition.zip)

Please refer to the [Authentication Service API](ID-Authentication-APIs.md#users-of-authentication-service--) for more details.

# 6. Lock/Unlock Authentication Types [**[↑]**](#table-of-contents)

## 6.1 Lock Authentication Types
When an individual wants to lock a particular authentication type using resident services, for example, locking demographic and/or biometric authentication, the system locks the requested authentication type after certain validations. After the requested authentication type is locked for the individual, then he/she will not be able to authenticate himself/herself by using locked authentication type. 

## 6.2 Unlock Authentication Types
When an individual’s particular authentication type is locked and wants to unlock using resident services, for example, unlocking demographic and/or biometric authentication, the system unlocks the requested authentication type after certain validations. After the requested authentication type is unlocked for the individual, then he/she will be able to authenticate himself/herself by using unlocked authentication type. 

# 7. Authentication Device Support 

## 7.1 Registered Devices and Open Devices [**[↑]**](#table-of-contents)
The authentication services can be utilized only by a trusted partner and a registered set of devices. A device can be registered in the MOSIP ecosystem by the device provider through the device register API exposed by MOSIP. For details related to Device Registration and De-Registration features please refer this [link](Admin-Services-Functionality.md#device-provider-management).

### List of Configurable Parameters and Processes [**[↑]**](#table-of-contents)

[**Link to Configurable Parameters of Authentication Services**](https://github.com/mosip/mosip-config/blob/master/config-templates/id-authentication-env.properties)

 
### Authentication Services API [**[↑]**](#table-of-contents)
[**Refer to Wiki for more details on Authentication Services API**](ID-Authentication-APIs.md)

### Process View [**[↑]**](#table-of-contents)
[**Link to Process View of Authentication Services**](ID-Authentication.md#process-flow)