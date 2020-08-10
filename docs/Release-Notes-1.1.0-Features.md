This document contains the features that were developed or enhanced as part of MOSIP 1.1 release.

# Commons
* Auth Manager implementation has changed. The design for the kernel auth manager implementation change is available [here](https://github.com/mosip/commons/blob/v1.1.0/design/kernel/kernel-authn.md).
* Similar kernel services have been merged
	* UIN generator and VID generator are merged
	* Email and SMS services are merged
	* Master data and applicant type services are merged
	* Crypto manager, key manager, license key manager, signature and token id generator services are merged
* Kernel CBEFF utility has been updated to load XSD only once during application initialization. The design for the kernel CBEFF utility is available [here](https://github.com/mosip/commons/blob/v1.1.0/design/kernel/kernel-cbeffutil.md).
* Partner manager has been integrated with Keycloak.
* "Preregistration" realm has been created in Keycloak to store Pre-registration users.
* The design for UIN generator has been changed to move assigned UINs to a new table. The design for the kernel UIN generator implementation is available [here](https://github.com/mosip/commons/blob/v1.1.0/design/kernel/kernel-idgenerator-service.md).
* The SMS implementation has changed to allow integration with any vendor. The design for the SMS implementation is available [here](https://github.com/mosip/commons/blob/v1.1.0/design/kernel/kernel-notification-service.md#sms-notification-service).
* New APIs have been created,
	* For creating, updating and fetching dynamic master data.
	* Dynamic master data has been added as part of registration client master data sync

# Administration
* New fetch APIs are added as part of Administration, so that drop-downs can be created for UI features.
	* Fetch a list of modules based on language code and id
	* Fetch a list of modules based on language code and id
	* Fetch a list of template types based on language code and code
	* Fetch a list of modules based on language code
	* Fetch a list of template file format based on language code
	* Fetch a list of template types based on language code
	* Fetch a list of location hierarchy list based on language code and hierarchy_level
	* Fetch a list of location hierarchy based on language code
* Some create APIs are upgraded to support multi-language
	* Create an individual type
	* Create a holiday
	* Create a machine type

# Pre-registration
* Captcha has been implemented as part of login in pre-registration.
* Pre-registration UI now can be dynamically created using ID schema and UI specification. The guide to create   pre-registration UI Specifications is available [here](UI-Specification-for-Pre-Registration.md).

# Registration Client
* "Save to Device" feature has been disabled from registration client UI and will be added back when packet upload portal will be developed.
* Registration client is now sending the registration client version number as part of packet meta information.
* Login for user with role "Default" has been added, so that this user can skip on-boarding and register as the 1st user in MOSIP system.
* Client setting sync has been updated to fetch data only when key index and center id is sent. The updated API specification for client setting sync is available [here](Kernel-APIs.md#sync-data-public).
* Machine master table has been updated to store public key and key index. Validation for public key to machine for TPM and non-TPM machines has been added.
* Support for generic master data sync has been added. For details on generic master data sync API find the API specification [here](Generic-Master-Data-Sync-API.md).
* Registration Client UI and flow now can be dynamically created using ID schema and UI specification. The guide to create the registration client UI specification is available [here](UI-Specification-for-Registration-Client.md). The APIs to create and publish MOSIP ID Schema is available [here](ID-Schema-APIs.md).
* Registration Packet structure has changed to store id, evidence and optional data separately in different folders. 
* Implementation has been changed to support [MDS 0.9.5 specification](MOSIP-Device-Service-Specification.md).
* Implementation has been changed to support [SDK 0.9.0 specification](Biometric-SDK-API-Specification.md).

# Registration Processor
* Secure zone notification stage has been added when a request comes from DMZ to MZ in Registration Processor.
* Implementation has been changed to integrate with [ABIS 0.9.0 specification](ABIS-APIs.md).
* In-memory virus scan of decrypted packets in DMZ has been removed due to security concerns.
* Feature to retrieve UIN card using UIN or VID has been implemented, so that resident services can provide e-UIN card to residents.
* Device validation for registered devices using which biometrics of resident were captured has been added in OSI Stage.
* Registration Processor integration with IDA internal authentication to perform officer, supervisor and introducer authentication has been added.
* Digital signature has been added to the UIN card.
* Packet processing is stopped for a packet which is marked as "Rejected" by the supervisor in packet validator stage.
* Registration client audit logs are now being sent to audit table after packet is decrypted in registration processor.
* Packet reader utility has been created to read the data in the new packet structure.

# Authentication
* Feature for multi-factor authentication is now added.
* Implementation has been changed to support [SDK 0.9.0 specification](Biometric-SDK-API-Specification.md).
* Implementation has been changes to support [MDS 0.9.5 specification](MOSIP-Device-Service-Specification.md).
* Device validation for devices used for biometric authentication has been added.
* Authentication Transaction History table has been upgraded to support capture of entity ID and name of partners.
* Auto-revocation has been added for perpetual VIDs when regeneration is called.
* Audit logs for IDA events and ID Repository has been added for all failure and transactions.
* The design for IDA has been changed to make it Monolithic. Details about the design are available [here](https://github.com/mosip/id-authentication/blob/v1.1.0/design/authentication/Id-Authentication-Monolothic-Design.md).
    * Authentication as a separate module
    * Performance changes to IDA - Combining services for reduced network calls
    * Separate database for Authentication from the ID Repository
    * Zero knowledge storage
    * Caching for validations

# Partner Management
* APIs related to CRUD operations for MISP (MOSIP Infrastructure Service Provider) ([API Specification](Partner-Management-Service-APIs.md#misp-management-service))
* APIs related to CRUD operations for Policy ([API Specification](Partner-Management-Service-APIs.md#policy-management-service))
* APIs related to CRUD operations for Partner ([API Specification](Partner-Management-Service-APIs.md#partner-service))
* APIs related to CRUD operations for Partner Manager ([API Specification](Partner-Management-Service-APIs.md#partner-management-service))
