# Patch 1.1.5.5

## Overview

The 1.1.5.5 version of MOSIP is a patch release on top of MOSIP's earlier intermediate patches released. This patch has many important bug and performance fixes which are backported from our LTS release.&#x20;

This release also contains includes some new features such as the alpha version of MOSIP's first mobile application for residents and anonymous profile which are also backported from our LTS release.

## Repository Released

| **Repositories** | **Tags Released** |
|------------------|-------------------|
| admin-services | [v1.1.5.3](https://github.com/mosip/admin-services/tree/v1.1.5.3) |
| audit-manager | [v1.1.5.6](https://github.com/mosip/audit-manager/tree/v1.1.5.6) |
| keymanager | [v1.1.5.5](https://github.com/mosip/keymanager/tree/v1.1.5.5) |
| khazana | [v1.1.5.4](https://github.com/mosip/khazana/tree/v1.1.5.4) |
| packet-manager | [v1.1.5.5](https://github.com/mosip/packet-manager/tree/v1.1.5.5) |
| commons | [v1.1.5.5](https://github.com/mosip/commons/tree/v1.1.5.5) |
| mosip-openid-bridge | [v1.1.5.5](https://github.com/mosip/mosip-openid-bridge/tree/v1.1.5.5) |
| durian | [v1.1.5.3](https://github.com/mosip/durian/tree/v1.1.5.3) |
| websub | [v1.1.5.3](https://github.com/mosip/websub/tree/v1.1.5.3) |
| pre-registration-ui | [v1.1.5.3](https://github.com/mosip/pre-registration-ui/tree/v1.1.5.3) |
| pre-registration | [v1.1.5.3](https://github.com/mosip/pre-registration/tree/v1.1.5.3) |
| mosip-ref-impl | [v1.1.5.5](https://github.com/mosip/mosip-ref-impl/tree/v1.1.5.5) |
| registration-client | [v1.1.5.5](https://github.com/mosip/registration-client/tree/v1.1.5.5) |
| registration | [v1.1.5.6](https://github.com/mosip/registration/tree/v1.1.5.6) |
| id-repository | [v1.1.5.5](https://github.com/mosip/id-repository/tree/v1.1.5.5) |
| partner-management-services | [v1.1.5.4](https://github.com/mosip/partner-management-services/tree/v1.1.5.4) |
| id-authentication | [v1.1.5.5](https://github.com/mosip/id-authentication/tree/v1.1.5.5) |
| resident-services | [v1.1.5.3](https://github.com/mosip/resident-services/tree/v1.1.5.3) |
| print | [v1.1.5.3](https://github.com/mosip/print/tree/v1.1.5.3) |
| artifactory-ref-impl | [v1.1.5.5](https://github.com/mosip/artifactory-ref-impl/tree/v1.1.5.5) |
| mosip-infra | [v1.1.5.5](https://github.com/mosip/mosip-infra/tree/v1.1.5.5) |
| mosip-config | [v1.1.5.4](https://github.com/mosip/mosip-config/tree/v1.1.5.4) |

## Modules

### Registration Processor

* Bug Fix: In some of the stages in the registration processor, we were using class-level variables due to which packets marked as “supervisor rejected”, were getting processed. Hence, we have removed the use of class-level variables in the registration processor.
* Upgrade: The maximum number of landing zones that can be added by an implementor has been increased from three to ten. _#MOSIP-15978_
* Performance Fix: In the registration processor, now we are creating a rest template only once and reusing it for every request to avoid performance issues. #_MOSIP-15712_
* Bug Fix: It was observed that the ABIS Handler stage is getting multiple requests for the same RID. Hence, we have added a fix to ignore duplicate requests coming for the same RID in the ABIS handler stage. _#MOSIP-16638_
* Bug Fix: In the case of an insert request, if ABIS sends an error stating that the reference ID is already existing in its gallery, then we are considering it to be a successful response. _#MOSIP-14191_
* Bug Fix: During packet processing, if a packet is missing in the landing zone we were throwing an error stating that the packet was not found, but if a packet is being reprocessed from the beginning of the militarized zone (from the secure zone notification stage) then the packet might be available in the object store and is deleted from the landing zone. Hence, before throwing the error we are now checking if the packet also exists in the object-store. _#MOSIP-17290_
* Bug Fix: In demo deduplication, now we have added a check to filter out potential duplicates without biometric reference IDs when we go for bio-match in ABIS. In scenarios where a resident is updating only demographic data there is no record for ABIS, hence, if demo duplicates for such records, then, we wouldn’t be able to perform bio-match in ABIS. _#MOR-133_
* Performance Fix: The performance of the reprocessor query has been improved by removing the use of DISTINCT in the query. _#MOSIP-17860_
* Bug Fix: When packets are getting reprocessed in the UIN generator stage, then the system is generating a new perpetual VID and revokes the old one (if VID is already generated). Hence, we have added a check to verify if a perpetual VID is existing before generating a new one. _#MOSIP-14704_
* Upgrade: An option to enable and disable packet processing from the secure zone notification stage based on a configuration has been added. This would help us throttle the records coming from the field using the reprocessor. _#MOSIP-12276_
* Upgrade: An option has been added to stop the processing of packets at any stage based on the configured bus out the address. This would help MOSIP implementors to throttle records based on their desired stage. _#MOSIP-18534_
* Bug Fix: Proper error handling in the packet receiver has been provided to avoid errors due to database null pointer constraint in the registration transaction table. #_MOSIP-20110_
* Bug Fix: A new configuration has been added to disable audit in the registration status service library to avoid VertX thread block. #_MOSIP-19982_
* Bug Fix: It was observed that digital signature validation was failing for child and update packets. A fix was provided for the same (after updating to the latest IDA). #_MOSIP-20580 #MOSIP-20615_
* Bug Fix: Packets with fingerprint authentication of operators were getting stuck. A solution has been added for this. #_MOSIP-20867_
* Upgrade: Health check endpoints have been enabled for printing, packet validator and abis middleware stages. _#MOSIP-15842_
* Bug Fix: Unnecessary storage of temporary files has been removed in the packet receiver stage. _#MOSIP-12261_
* Bug Fix: The child packet was getting rejected when the parent/guardian packet was in the queue for manual verification. Code has been modified to reject child packet only when parent/guardian packet is rejected. _#MOSIP-20634_
* Bug Fix: The request for kernel notification service from the registration processor notification service has been modified to prevent URL encoding errors. _#MOSIP-21070_
* Bug Fix: Code changes have been added to retrieve documents from data share while performing manual adjudication. _#MOSIP-20837_

### Registration Client

* Bug Fix: In the 1.1.5.4 version of the registration client, the operator was not able to complete the registration when the applicant had a biometric exception as in some scenarios the operator is not able to see the exception photo capture. _#MOSIP-15873_
* Bug Fix: In the 1.1.5.4 version of the registration client, the operator was not able to complete the registration when the applicant has a biometric exception even though all the biometrics and exception photo was captured. _#MOSIP-15871_
* Bug Fix: In the 1.1.5.4 version of the registration client, the label for any attribute having a “date” and “ageDate“ control type was not visible. _#MOSIP-15910 #MOSIP-15909_
* Bug Fix: In the 1.1.5.4 version of the registration client, the operator was not able to move to the packet upload screen in offline mode, hence, he/she was not able to perform packet export. _#MOSIP-16356_
* New Feature: Support for multiple user logins in the registration client from different windows user accounts has been added. So, if two users are using the same windows, and the registration client is placed in a shared location, now both the user can log in to the registration client but please note that the same application cannot run simultaneously in two accounts. _#MOR-113_
* Upgrade: The data type for the value\_json field in the dynamic fields table has been updated to CLOB so that we don’t have size limitations for dynamic fields. _#MOR-134_
* Bug Fix: Multiple fixes were made on the document scanner page to resolve performance issues while scanning documents. The features related to resource(webcam) handling, closing stream, and releasing webcam after capture were fixed.
* Upgrade: Taking max and min heap size as command-line arguments
* Bug Fix: Unable to launch registration client when upgrading from 1.1.5.4 to 1.1.5.5 as some of the new columns were missing. Hence 1.1.5.5 DB upgrade scripts were added. _#MOSIP-20825_
* Bug Fix: On restart of the registration client the local manifest was not replaced with the server manifest if the local and server version was the same. Hence the minor upgrade in the registration client was not working as expected. _#MOR-148 #MOSIP-20824_
* Bug Fix: If the registration client was failing to identify any document scanning devices or failing to load morena manager, the operator was not able to proceed further from the demographics page. This has been fixed - the operator would be able to proceed to the document scanning page.
* Bug Fix: Local dedupe check was working during registration because of a code issue. The fix has been provided.
* Bug Fix: Demographics and document page were getting overlapped when navigating back from preview page to documents page. _#MOSIP-20474_
* Bug Fix: In the biometrics details page the captured 'exception photo' disappears if navigating back to the previous screen due to which the operator had to recapture the exception photo. This has been fixed. _#MOSIP-20868_

### Commons

* Performance Fix: We have modified the current base64 encoding and decoding implementation to JAVA’s native base64 codec because it performs better than the Apache base64 codec (the current implementation). _#MOSIP-17298_
* Performance Fix: The “exists()” method in the Khazana S3Adaptor implementation has been modified to be more performant. _#MOSIP-17290_
* Performance Fix: JAXB Context is instantiated every time in kernel core. And it is observed that 10% of the time is spent on instantiating the JAXBContext for BIRType class in IDA e-KYC. As JAXBContext is thread-safe, we are now initializing it once and reuse to avoid performance issues. And this fix is implemented in all the methods of the CbeffValidator class. _#MOSIP-17991_
* Upgrade: A health check has been added for the ID generator service
* Upgrade: A health check has been added for PRID generator _#MOSIP-15845_
* Upgrade: The notification service is updated by adding HTML support in the body of the email which is default by true and can be turned off by making “_mosip.kernel.mail.content.html.enable”_ property to false.

### Audit Manager

* Bug Fix: The reference ID type and reference ID in the kernel audit manager service were made mandatory whereas in the database these columns were optional leading to frequent errors in the service while storing the audit transactions. This has been fixed by modifying the audit manager. _#MOSIP-18878_
* Performance Fix: “The validation factory in audit manager is built for every request and it uses 70% of the processing time for audit calls”. Hence, we are now creating a single instance of the validation factory during the start-up of the audit manager and we are using it for all the audit calls. _#MOSIP-17565_

### Open-ID-Bridge

* Upgrade: The kernel core dependency in kernel-auth-adaptor has been updated.
* Performance Fix: The config server health check from the kernel auth adapter has been disabled because every time the health check for the config server was called it was downloading some of the configuration files and was taking around 2 seconds to respond. _#MOSIP-18380_
* Performance Fix: In the validate token API of kernel-auth-service, JWT token decoding is performed in three different places which consume 10% of the time, we have restructured the code to decode the token only once to improve the response time by 6%. _#MOSIP-17980_
* Upgrade: Removed DB properties need for auth manager application. Auth manager is not using any database but due to the old configuration, it needs the database properties to start the application.
* Upgrade: RestIntercepter @component annotation removed to create a manual bean to not let it register to all RestTemplates. Authmanager was using two tokens in a single request which was creating auth failures.

### WebSub

* Upgrade: Websub design is modified to a new Kafka based implementation.
* Upgrade: The web-sub client has been upgraded - for the Kafka based web-sub implementation.

### Key Manager

* Database Update: In “keymgr-key\_alias” table a new column cert\_thumbprint character varying(100) has been added.
* Bug Fix: Added functionality to get individual id by user id to resolve the issue in performing user onboard in registration client._#MOSIP-20748_
* Upgrade: Added support to decrypt using the master key in the key manager
* Performance Fix: Fixed performance issues in decryption & trust store creation.

### Admin Services

* Upgrade: Fix for identity schema in admin service has been added for backward compatibility with 1.1.4 identity schema related to changes in language code attribute in the validator.
* Upgrade: Sync of gender and resident status was enabled in the sync data service to provide backward compatibility with the 1.1.4 version of MOSIP. _#MOSIP-17282_
* Performance Fix: Cache has been added for the sync data service due to the high response time observed for a few APIs. #MOSIP-17554
* Upgrade: The download of device details has been added in sync for backward compatibility with the 1.1.4 registration client.
* Upgrade: Websub client version has been updated for connecting with the Kafka based WebSub. _#MOSIP-17735_
* Upgrade: Kernel core version has been updated for the apache base64 codec library used in the kernel has performance issues. _#MOSIP-18392_
* Bug Fix: Error in pre-registration booking appointment when the registration centre selected has location hierarchy!= 5. _#MOSIP-17754_
* Bug Fix: Issue when we create a location with the same name with different parents in the same hierarchy level. _#MOSIP-19954_

### Artifactory Reference Implementation

* Upgrade: Added a new artifact to docker file cache-provider-redis
* Upgrade: The latest mock-SDK is now being used for the latest bioSDK server
* Upgrade: The latest auth adapter is now being used for the 1.1.5.5 services
* Upgrade: The latest bioSDK client is now being used for internal mock bioSDK server implementation

### Durian

* Bug Fix: Token expiration issue was resolved by deleting the expired token from the cache and fetching the new token and storing it in case of authentication failure. #MOSIP-17599

### ID Authentication

* Upgrade: The thumbprint sent in the e-KYC response would be now HEX encoded and upper case. _#MOSIP-16654_
* Bug Fix: In the 1.1.5.4 version of IDA, when multiple fingerprints were sent to IDA for authentication it was found the system was throwing a hash validation error, which has been fixed. _#MOSIP-17106_
* Performance Fix: The e-KYC endpoint has been moved to the authentication service to make the e-KYC service more performant. _#MOSIP-16870_
* Performance Fix: Started using the JAVA’s native base64 codec encoder and decoder for base64URL encoding and decoding throughout IDA. Base64 URL safe encoding is used for all the API calls except encoding of BDB value inside the CBEFF file where Base64-Plain encoding is used. _#MOSIP-16784_
* Performance Fix: Added fixes to avoid repeated instantiation of WebClient in RestHelper implementation.
* Upgrade: Websub client version has been updated for connecting with the Kafka based web sub. _#MOSIP-17735_
* Performance Fix: Until the 1.1.5.4 version of MOSIP, all the biometrics were decrypted and decoded for biometric authentication leading to a higher response time. Now, we are encrypting all the modalities separately and storing - them so that only specific biometric types can be decrypted and decoded during authentication. #MOSIP-17300
* Performance Fix: Until the 1.1.5.4 version of MOSIP, all the demographic attributes were decrypted for demographic authentication and e-KYC leading to a higher response time. Now, only the required attributes are decrypted and decoded. #MOSIP-17302
* Performance Fix: In 1.1.5.4 we were storing the biometric data in IDA we were storing double encoded biometrics leading to double decoding during authentication. Now we have stopped doing double encoding in credential issuance for better performance.
* Bug Fix: Fix has been provided to allow attributes missing in the IDA mapping JSON file for authentication and e-KYC.
* Bug Fix: Fix for issue in returning auth token in response based on partner policy.
* Upgrade: We have moved to the latest key manager is IDA. _#MOSIP-17523_
* Performance Fix: We have optimized database calls during OTP authentication.
* Performance Fix: MOSIP-18523 - Added Caching for Salt during Auth
* Performance Fix: The logic for getting the salt key from the UIN/VID is optimized
* Database Update: We have added a few indexes in the IDA database for better performance.
* Database Update: In “ida-key\_alias” table a new column cert\_thumbprint character varying(100) has been added.

### Partner Management Services

* Upgrade: Websub client version has been updated for connecting with the Kafka based web sub.
* Security fix: log4j dependencies have been removed.

### Pre-registration services

* Bug Fix: Captcha Service is not working in 1.1.5.x version of MOSIP. _#MOSIP-16977_
* Performance Fix: We were observing high response times for the "/preregistration/v1/applications/config'" API. _#MOSIP-16660_
* Performance FIx: In the pre-registration application service, a new RestTemplate was created for every request. This has been fixed, only one rest templated is created and it is re-used. _#MOSIP-18156_
* Security Fix: In preregistration, the authorization tokens are being received from the server for even Wrong OTPs. _#MOSIP-18903_

### Pre-registration booking service (reference implementation)

* Security Fix: Delete Appointment endpoint is not checking if the PRID belongs to the user in the token or not. #MOSIP-20309

### Pre-registration UI service

* Bug Fix: In 1.1.5, the edit demographics page was not working in pre-registration when we did not have fullName in ID Schema. #MOSIP-15872
* Bug Fix: In 1.1.5 pre-registration, dynamic fields were not called using pagination. #MOSIP-15317
* Bug Fix: Captcha Service was not working in 1.1.5.x version of MOSIP. #MOSIP-16977

### Print Service

* Upgrade: Websub client version has been updated for connecting with the Kafka based web sub.

### ID Repository

* New Feature: Ability to generate verifiable credentials as part of MOSIP credential issuance #MOSIP-19079
* New Feature: Support for Anonymous Profiling #MOSIP-18179
* Bug Fix: Support for resident services to update the status of VID
* Performance Fix: Instead of publishing biometric data of individuals in a single CBEFF file, data is split and sent to IDA #MOSIP-17300
* Performance Fix: Primary key constraint error seen for few requests in ID repository add identity API #MOSIP-19422
* Performance Fix: Caching of salt tables in IDRepo
* Performance Fix: To compute a salt key, instead of performing modulo operation, substring operation has been done #MOSIP-18522
* Upgrade: The WebSub client version has been updated for connecting with the Kafka based WebSub.
* Upgrade: kernel-biometrics-api version has been upgraded to the latest version.
* DB Change: Added anonymous\_profile and channel\_info tables.

### Resident Services

* Bug Fix: The “individual ID” and “individual ID Type” were taken twice as input for revoking a VID. #MOSIP-15969
* Bug Fix: Fixed update of resident data which not working as expected. #MOSIP-19917
* Bug Fix: Fixed issue while revoking VID. #MOSIP-19916
* Bug Fix: Fixed issues related to jackson dependency.
* Bug Fix: Encrypted HMAC IDA internal auth in resident should be base64-URL-safe encoded. #MOSIP-17931
* Performance Fix: Started using the JAVA’s native base64 codec encoder and decoder for base64URL encoding and decoding throughout Resident. #MOSIP-18026

### Mobile ID Application (alpha-version)

* [Functional documentation](https://docs.mosip.io/1.2.0/modules/mobile-application)
* [User Guide](https://docs.mosip.io/1.2.0/modules/mobile-application/mobile-id-app-user-guide)
* Open bugs:
  * If resident data is captured in multiple languages and in the data share policy, if the language filter is not specified for language-dependent attributes, the same is not displayed properly in the application. The impact of this issue is that the current version of the app displays credential data only in the language specified in the filter attribute set in the policy.
  * The set of resident attributes shown in the credential is not easily customizable and a change would require code modification.
  * While downloading a credential if an error is thrown in the UIN/VID selection page, the dropdown selection does not work properly and does not clear previously entered values.
