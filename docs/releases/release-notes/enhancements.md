# Enhancements

### Commons

* The reference ID object validator now supports the validation of dynamic field data.
* The [WebSub](../../release/1.2.0/websub.md) has been upgraded
  * to support multiple ballerina servers.
  * to have authentication and authorization for all subscribers and publishers.
  * it also has a health check feature now.
* JCE (Java Cryptography Extension) integration in Key Manager Service has been added.
* The open ID authentication adaptor has been created to integrate with any open-ID compliant IAM solution.

### Admin Services

* Using the [Admin portal](../../release/1.2.0/admin-portal-user-guide.md), the administrator can now enter master data in multiple languages (more than two). Earlier, we had a restriction to run only with two languages.
* For Fetch APIs of some of the non-sensitive master data, authentication has been disabled and caching has been enabled. The master data APIs that are changed: applicant type, blocklisted words, document categories, document types, dynamic fields, exception holidays, gender types, id types, individual types, languages, locations, location hierarchy levels, templates, template type codes, title, valid documents, weekdays, working days, and zones.
* Using the admin portal, the administrator can
  * map or unmap a user in Keycloak with a center and zone.
  * view the packets that were paused by the registration processor and resume them for further processing.
  * add or remove dynamic field data.
  * retrieve an individual's lost RID or misplaced RID.
  * control the levels of location hierarchy they require while creating the registration centers. The level of the hierarchy can be configured through configuration property value.
  * map the users to a registration center and to a zone.
  * create and update dynamic fields such as Gender, Blood Type, Residence Status, Marital Status etc.
  * configure the number of kiosks in a particular registration center during the process of creating the registration center.
* The [UI specification](../../release/1.2.0/pre-registration-ui-specifications.md) and [ID schema](../../release/1.2.0/id-schema.md) are now stored separately in different database tables as well new API has been created to store the UI spec for pre-registration and registration client
  * UI spec version and ID schema version are independent.
  * If any new version of UI spec is published, then it will not affect the ID schema version.
  * If any new version of ID schema is published, the corresponding version of UI spec needs to be republished or updated.
* APIs for adding partner ID, individual ID (UIN and VID), and device (serial number, make or model) in the hotlist has been added.

### Pre-registration

* Using the pre-registration, the resident can provide demographic data in multiple languages (more than two). Earlier there was a restriction for only two languages.
* In the [UI specifications](../../release/1.2.0/pre-registration-ui-specifications.md),
  * “alignmentGroup” property has been added to align multiple UI components horizontally.
  * “changeAction” property has been added to handle custom change actions between two or more UI components.
  * “containerStyle” and “headerStyle” properties have been added to override the default CSS.
  * “transliteration“ property has been added to enable or disable transliteration of an attribute.
  * Language-specific validators have been added.
  * Support from a date picker and number spinner has been added for date and ageDate control types.
  * The document upload screen is now rendered from UI spec.
* The captcha service has been enhanced and is available now.
* The application now gets locked once the appointment is booked. Post booking, the application details cannot be modified, but the booking can be cancelled or rescheduled.
* The notification template now supports having parameters like centre name and center address.
* One single bucket is being created to store all the documents of the resident.
* During application creation, consent is collected from the resident and stored as a JSON object in the audit table.
* Pre-registration packets shared during data sync are now being encrypted with the machine-specific TPM public key.
* Pre-registration packets can be synced to the registration client even if the booking is not performed.
* Created an error handling framework to handle technical errors thrown from service in the UI.
* Added support for displaying custom validation messages in UI components. For example, instead of just displaying 'Invalid email' or 'Invalid phone', it can be made more specific like 'Invalid email format' or 'Phone number cannot exceed 10 digits'.
* The Send OTP button on the login page will be disabled till the OTP expiry time elapses.
* A pre-registration application will be locked and no further modifications will be allowed on it once an appointment is booked for the same.
* Registration Client will be able to perform an on-demand fetch for pre-registration application irrespective of its booking status.
* Encryption of pre-registration data during data sync with Registration Client.
* The structure of how the documents were stored in MinIO has been changed. Now we will have a single bucket with different folders for each PRID.
* The resident's consent is captured as part of the audit table.

### Registration Client \[RC]

* Using the [Registration Client](../../release/1.2.0/registration-client.md), the operator can collect demographic data of residents in multiple languages (more than two). Earlier there was a restriction for only two languages.
* Using the [UI specifications](../../release/1.2.0/registration-client-ui-specifications.md), the order of the screens and in which screen what data needs to be captured can be controlled.
* In the UI spec,
  * the sub-type can be set to RID, UIN or VID to perform validation for RID, UIN and VID using the in-build validator libraries.
  * regex validation for different languages can be added.
  * support for multiple age groups has been added.
* During [operator onboarding](../../release/1.2.0/operator-onboarding.md), the operator’s VID should be stored in Keycloak instead of RID for authentication.
* A control panel has been added in the registration client for biometric devices, non-biometric devices, configurable settings, registration client jobs have been added.
  * If multiple devices are connected, we can set a particular device as the default.
  * For some of the local configurations, they can be modified by the operator using the [Settings](../../release/1.2.0/registration-client-settings-page.md) page.
  * All of the job schedules can be locally modified and the jobs can also be triggered individually.
* All operations on the registration client are now performed based on the local time zone.
* Any anti-virus or transliteration implementation can be plugged in during the registration client packaging.
* The GPS and scanner implementation is moved to separate libraries so that countries can customize these implementations.
* The CSS and icon bundles are now moved to the artifactory.
* In the CBEFF, now the below flags are being stored under the others section,
  * RETRIES, for number retries for biometric capture
  * FORCE\_CAPTURED, to identify if forced capture was done
  * SDK\_SCORE, to store the score of the biometric SDK
  * EXCEPTION, to mark the biometric type as an exception, here BDB will be empty.
  * CONFIGURED, to store the list of configured attributes in the outer BIR (as per the ID schema)
* The link for change and forgot password can be configured, so that, from the UI, the user can be redirected to the corresponding IAM page to perform these operations.
* Packets can be auto-uploaded to the server based on a configuration.
* There is a regular expression validation in place for multiple languages (earlier the system was able to validate data only for English).
* We now have a configurable antivirus that is being used during registration client packaging. This virus scanner will be able to run based on the configuration frequency in the background.
* There is a [Settings page](../../release/1.2.0/registration-client-settings-page.md) in Registration Client which can be treated as a control panel window page that manages various kinds of settings such as:
  1. Device selection settings
  2. Sync Settings
  3. Global configuration settings
* The registration client is now capable of handling multiple time zones, including the local time zone and the UTC.
* The RC is now capable of having multiple themes based on the country's choice. This is possible because now there is separate CSS and icons based on the configuration.
* In the RC, the ID schema and UI specs are created and stored separately for each flow (like new registration, UIN update, lost ID) which makes sure that in future if any other flow needs to be added, it can be added with zero code change.
* The RC now has the dynamic layouts and dynamic screens as a single screen that supports all Demographic/Documents/Biometrics captured which essentially means that the order of occurrence of the screen is now configurable.
* When the password of an operator/supervisor is changed in Keycloak, the operator will be automatically be logged out if he/she is already logged in (in online mode) using the old password. In offline mode, the old password can still be used for creating packets, unless the client application has not synced with the server.
* The RC works with both SBI v1.0 and MDS v0.9.5.

### Registration Processor

* Notifications to users are being sent based on the user preferred language set during registration.
* The OSI validator stage has been removed and segregated into multiple stages, i.e,
  * CMD validator stage for verifying centre, machine and device details.
  * Operator validator stage to validate the operator details.
  * Supervisor validator stage to validate the supervisor details.
  * Introducer validator stage to validate the introducer details.
* Based on tagging of packets in the packet classifier stage, rules have been added in the workflow configuration for different age groups (Infant, minor and adult). For example, introducer validation is made mandatory for Infants and minors based on camel workflow.
* In the quality check stage, the packets having poor quality scores are not being rejected, instead, these packets are tagged for having poor, average or good quality biometrics based on configured thresholds. The final decision to process these packets can be made by the camel workflow.
* The external integration stage has been moved to reference implementation and is removed from default camel routes and registration processor deployment.
* Once the packet is uploaded to MinIO, the registration processor notifies the registration client so that it can delete the packet.
* Trust validation of devices has been added to the registration processor.
* The mandatory check, master data validation and biometric check have been removed as these checks are done by the id object validator.
* The stages do not make the final decision instead the final decision is made by the workflow and these are the workflow actions set by the stages,
  * MARK\_AS\_PAUSED, when the stage requests the workflow to pause the packet processing
  * COMPLETE\_AS\_PROCESSED, when the packet is verified and UIN is issued or user data is updated.
  * COMPLETE\_AS\_REJECTED, when a duplicate is found or rejected by a manual adjudicator or supervisor.
  * COMPLETE\_AS\_FAILED, when a packet fails to process and is not marked for reprocessing
  * MARK\_AS\_REPROCESS, when a packet is marked for reprocessing.
* Based on the above workflow action set by a stage or tags configured a packet can now be paused during processing and it can be resumed by the administrator. A default time elapse has also been added to auto-resume the packet processing.
* The verticles are grouped together to optimize the CPU usage and are executed as a single-stage using the stage executor. The various stage groups and associated verticles are,
  * Stage group 1: packet receiver stage
  * Stage group 2: quality classifier, secure zone notification, and message sender stage
  * Stage group 3: ABIS handler, ABIS middleware, bio deduplication, and manual verification stage
  * Stage group 4: biometric authentication, and demo deduplication stage
  * Stage group 5: cmd validator, operator validator, supervisor validator, introducer validator, and packet validator stage
  * Stage group 6: packet uploader, and packet classifier stage
  * Stage group 7: uin generator, and printing stage
* XSD and biometric signature validations have been added in the packet validator stage.
* The internal data share URL for registration processor integration components (i.e. ABIS and manual adjudication system) can be configured from registration processor configurations. The data share for credential issuance can now be different from the data share for the registration processor.
* The pause and resume feature was decoupled from hotlisting feature and modified to support any configured tag.
* Tagging feature has been enhanced to support more tags on a packet.
* Certificate thumbprint will be shared as a part of authentication requests for all internal authentications from the registration processor.
* The registration officer/supervisors userId can now be mapped to VID/UIN in Keycloak
* An API has been added to the registration processor to find the resident’s lost RID.
* Readiness and liveliness probes have been created as part of registration processor service discovery and load-balancing features
* A new flow has been added to the registration processor to support and initiate correction. As a reference implementation, we have added a biometric correction flow.
* Virus scanner was made as a runtime dependency in the registration processor.

### ID Repository

* APIs for creating, updating, retrieving and publishing drafts have been added.
* A job to re-seed all the credentials for a new ID Authentication instance or change in Datashare policy has been added.

### ID Authentication \[IDA]

* IDA is able to re-trigger the issuance of the credential for the missing active UIN or VID in IDA during startup.
* IDA is able to pull the failed web-sub messages and process them during startup.
* IDA is able to send notifications to residents based on the preferred language set by the resident during registration.
* The dependency for sending only primary and secondary language-based e-KYC responses have been removed. Now in e-KYC, the relying party needs to specify the language codes in the partner policy.
* Different configuration properties files have been created for IDA internal authentication, external authentication, e-KYC, OTP services for the web sub callback URL.
* Validation of the domain and environment values have been added. These are validated against a list of values added in the configuration.
* All validations apart from length and checksum have been removed for UIN and VID in IDA APIs.
* The certificate data from partner management is now retrieved via the data share URL.
* A new internal authentication API has been built with a different endpoint. This API doesn’t support, encryption, HMAC and biometric hash validation. It only performs signature validation of the header.
* IDA now has MOSIP authentication filter interfaces in place which has the capability of controlling the authentication type that will be applicable to the resident on a case basis(since an infant biometric is not captured, the system will only allow demographic authentication for infants).
* The hotlist validation can be enabled or disabled for various attributes like partner ID, individual ID (UIN and VID), and device (serial number, make or model) using configurations.
* All the master data, partner details and policy information is now being synced to IDA via. web-sub. IDA consumes this information from its database after the sync, hence it is now independent of all MOSIP modules.
* The demographic authentication with normalization is now externalized via an API. The implementation for the same is done in a separate library (which is part of our reference implementation) and can be configured easily in IDA.
* IDA is publishing events for any fraud management system for,
  * Validation failures
  * Authentication failures
  * Multiple OTP or authentication requests
* IDA is now capable of pulling the missing data (data that has been lost since the maximum retry limit has been exceeded once the IDA comes up after being down) such as credentials from the web sub-message store for all the records with the failed delivery status. For other data, such as partner data and master data, pulling of missing data will be done by Kafka.
* All the credential requests of UINs/VIDs that are updated/deactivated/revoked/blocked will be invalidated by the system.
* IDA database will now store the partner details which include data like partner ID, policy ID, MISP ID and API keys to authenticate the above entities directly from IDA.
* IDA can now validate whether the UIN, devices, partners or VIDs are hot listed or not when trying to perform an authentication.
* The CBEFF utility has been deprecated and the new implementation has been added.
* IDA can now authenticate identity details of the individual corresponding to the UIN in the request with dynamic demographic JSON and ID Schema hence the need to map ID attributes will not be required.
* IDA will now send notifications to the residents in the case of events like authentication failed/successful, authentication type lock/unlocked notification is sent to resident service and credential details stored successfully/failed notification is sent to the credential request service.
* Every time there is any changes made to the template or title in master data, it will be notified to IDA using web-sub hence updating the cache in IDA.
* IDA will now verify the device details when the biometric authentication request is received. It will validate the trust of the device provider & FTM partner, the timestamp in the digital ID, and the status of the device (whether it is active, de-active or hot listed).
* The system (IDA/ID repo) will have the ability to set an expiry date on a resident's identity record. This expiry date will control if the resident can perform authentication or not.
* An ID issuer will now be able to store the anonymous profile information of a resident in the [ID repository](../../release/1.2.0/id-repository.md). This data will be stored in JSON format. No PII resident data will be stored as a part of this.

### Resident Services

* The unlock authentication type API has been modified to support auto-lock after x seconds. When the time has passed the authentication type will be auto-locked after the time elapses.
* Resident services will now support multiple languages. There will be a list of mandatory languages as well as a list of optional languages for the resident to choose from.
* The notifications are being sent to the residents based on the preferred language set during registration.

### Partner Management

* In this release partner management portal is available. This portal can be used by partner admin, policy admin and various MOSIP partners like authentication partners, device providers, FTM providers, and credential partners.
* The partner portal has the below features
  * Self-registration of partners
  * Partner specific certificate upload
  * Partner can add device models, FTM models, policy mapping, SBI details
  * Partner and policy admins can approve/reject partner requests, create policies and can add MOSIP compliant CA (certificate authorities)
