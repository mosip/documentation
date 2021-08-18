This document contains the features that were developed or enhanced as part of MOSIP LTS Pre-release 1.

# Commons

* Reference ID object validator now supports the validation of dynamic field data.
* Web-sub has been upgraded to support multiple ballerina servers
* JCE (Java Cryptography Extension) integration in key-manager service has been added.

# Admin Services

* Using the admin portal, the administrator can now enter master data in multiple languages (more than two). Earlier we had a restriction only to run with two languages.
* For Fetch APIs of some of the non-sensitive master data, authentication has been disabled and caching has been enabled. The master data APIs that are changed: applicant type, blacklisted words, document categories, document types, dynamic fields, exceptional holidays, gender types, id types, individual types, languages, locations, location hierarchy levels, templates, template type codes, title, valid documents, weekdays, working days, and zones.
* Using the admin portal, the administrator can now map or unmap a user in keycloak with a centre and zone.
* Using the admin portal, the administrator can now view the packets that were paused by the registration processor and resume them for further processing.
* Using the admin portal, the administrator can now add or remove dynamic fields data.
* The UI spec and ID schema are now stored separately in different database tables as well new API has been created to store the UI spec for pre-registration and registration client
    * UI spec version and ID schema version are independent.
    * If any new version of UI spec is published then it will not affect the id schema version.
    * If any new version of ID schema is published then the corresponding version of UI spec needs to be republished or updated.
* APIs for adding partner ID, individual ID (UIN and VID), and device (serial number, make or model) in the hotlist has been added.

# Pre-registration

* Using the pre-registration, the resident can provide demographic data in multiple languages (more than two). Earlier there was a restriction for only two languages.
* In the UI spec,
    * “alignmentGroup” property has been added to align multiple UI components in a single row.
    * “changeAction” property has been added to copy data from one attribute to another.
    * “containerStyle” and “headerStyle” properties have been added to override the default CSS.
    * “transliteration“ property has been added to enable or disable transliteration for an attribute.
    * Language-specific validators have been added.
    * Support from a date picker & number spinner has been added for date and ageDate control types.
* The captcha service has been enhanced and is available now.
* The application now gets locked once the appointment is booked. Post booking, the application details cannot be modified but the booking can be cancelled or rescheduled.
* The notification template now supports having parameters like centre name and centre address.
* One single bucket is being created to store all the documents of the resident.
* During application creation, consent is collected from the resident and stored as a JSON object in the audit table.
* Pre-registration packets shared during data sync are now being encrypted with the machine-specific TPM public key.
* Pre-registration packets can be synced to the registration client even if the booking is not performed.

# Registration Client

* Using the registration client, the operator can collect demographic data of residents in multiple languages (more than two). Earlier there was a restriction for only two languages.
* Using the UI spec, 
    * The order of the screens and in which screen what data needs to be captured can be controlled.
    * The subtype can be set to RID, UIN or VID to perform validation for RID, UIN and VID using the in-build validator libraries.
    * Regex based validation for different languages can be added.
    * Support for multiple age groups has been added.
* During operator onboarding, the operator’s VID should be stored in keycloak instead of RID for authentication.
* A control panel has been added in the registration client for biometric devices, non-biometric devices, configurable settings, registration client jobs have been added.
    * If multiple devices are connected we can set a particular device as the default
    * For some of the local configurations can be modified by the operator using the settings page
    * All of the jobs schedules can be locally modified and the jobs can also be triggered individually
    * All operations in the registration client are now performed based on the local time zone.
* Any anti-virus or transliteration implementation can be plugged in during the registration client packaging.
* The GPS and scanner implementation is moved to separate libraries so that countries can customize these implementations.
* The CSS and icon bundles are now moved to the artifactory.
* In the CBEFF, now the below flags are being stored under others section,
    * RETRIES, for number retries for biometric capture
    * FORCE_CAPTURED, to identifying if forced capture was done
    * SDK_SCORE, to store the score of the biometric SDK
    * EXCEPTION, to mark the biometric type as an exception, here BDB will be empty.
    * CONFIGURED, to store the list of configured attributes in the outer BIR (as per the ID schema)
* The link for change and forgot password can be configured, so that, from the UI the user can be redirected to the corresponding IAM page to perform these operations.
* Packets can be auto-uploaded to the server based on a configuration.

# Registration Processor

* Notifications to users are being sent based on the user preferred language set during registration.
* The OSI validator stage has been removed and segregated into multiple stages, i.e,
    * CMD validator stage for verifying centre, machine and device details
    * Operator validator stage to validate the operator details
    * Supervisor validator stage to validate the supervisor details
    * Introducer validator stage to validate the introducer details
* Based on tagging of packets in the packet classifier stage, rules have been added in the workflow configuration for different age groups (Infant, minor and adult). For example, introducer validation is made mandatory for Infants and minors based on camel workflow.
* In the quality check stage, the packets having poor quality scores are not being rejected, instead, these packets are tagged for having poor, average or good quality biometrics based on configured thresholds. The final decision to process these packets can be made by the camel workflow.
* The external integration stage has been moved to reference implementation and is removed from default camel routes and registration processor deployment.
* A separate status API has been created for the registration client to send the RID status as processed once the packet is stored in MinIO.
* Trust validation of devices has been added in the registration processor
* The mandatory check, master data validation and biometric check have been removed as these checks are done by the id object validator.
* The stages do not make the final decision instead the final decision is made by the workflow and these are the workflow actions set by the stages,
    * MARK_AS_PAUSED, when the stage requests the workflow to pause the packet processing
    * COMPLETE_AS_PROCESSED, when the packet is verified and UIN is issued or user data is updated.
    * COMPLETE_AS_REJECTED, when a duplicate is found or rejected by a manual adjudicator or supervisor.
    * COMPLETE_AS_FAILED, when a packet fails to process and is not marked for reprocessing
    * MARK_AS_REPROCESS, when a packet is marked for reprocessing.
* Based on the above workflow action set by a stage or tags configured a packet can now be paused during processing and it can be resumed by the administrator. A default time elapse has also been added to auto-resume the packet processing.
* The verticles are grouped to optimize the CPU usage and are executed as a single-stage using the stage executor. The various stage groups and associated verticles are,
    * Stage group 1: packet receiver stage
    * Stage group 2: quality classifier, secure zone notification, and message sender stage
    * Stage group 3: abis handler, abis middleware, bio deduplication, and manual verification stage
    * Stage group 4: biometric authentication, and demo deduplication stage 
    * Stage group 5: cmd validator, operator validator, supervisor validator, introducer validator, and packet validator stage
    * Stage group 6: packet uploader, and packet classifier stage
    * Stage group 7: uin generator, and printing stage
* XSD and biometric signature validations have been added in the packet validator stage.
* The internal data share URL for registration processor integration components (i.e. ABIS and manual adjudication system) can be configured from registration processor configurations. The data share for credential issuance can now be different from the data share for the registration processor.

# ID Repository

* APIs for creating, updating, retrieving and publishing drafts have been added. But these are not used in the current version for LTS.
* A job to re-seed all the credentials for a new ID authentication instance or change in data share policy has been added.

# ID Authentication

* IDA can retrigger the issuance of the credential for the missing active UIN or VID in IDA during startup.
* IDA can pull the failed web-sub messages and process them during startup.
* IDA can send notifications to residents based on the preferred language set by the resident during registration.
* The dependency for sending only primary and secondary language-based e-KYC responses has been removed. Now in e-KYC, we need to specify the language codes in the partner policy.
* Different configuration properties files have been created for IDA internal auth, external auth, e-KYC, OTP services for the web sub callback URL.
* Validation of the domain and environment values have been added. These are validated against a list of values added in the configuration.
* Validations apart from length and checksum have been removed for UIN and VID.
* Certificate data from partner management is now retrieved via data share URL.
* A new internal authentication API has been build with a different endpoint. This API doesn’t support, encryption, HMAC and biometric hash validation. It only performs signature validation of the header. This API is not being used by any module in the current release.
* Now we can configure the authentication types for children or adults. For example, If a resident is less than 15 years, he/she would not be able to perform OTP or biometric authentication.
* Now we enable or disable hotlist validation for various attributes like partner ID, individual ID (UIN and VID), and device (serial number, make or model) based on configurations.
* All the authentication transaction responses are published to a web-sub topic for resident services. But this is not being consumed by the resident services as part of this release.
* All the master data, partner details and policy information is now being synced to IDA via. web-sub. IDA consumes this information from its database after the sync, hence it is now independent of all MOSIP modules.
* The demographic authentication with normalization is now externalized via an API. The implementation for the same is done in a separate library (which is part of our reference implementation) and can be configured easily in IDA.
* IDA is publishing events for any fraud management system for,
    * Validation failures
    * Authentication failures
    * Multiple OTP or authentication requests

# Partner Management

* When the partner uploads his/her certificate, the full chain of certificates is shared with various trust stores through web-sub.
* For any change in the partner details, staus or mapped API keys, the partner is being notified.

# Resident Services

* The unlock authentication type API has been modified to support auto-lock after x seconds. When time is passed the auth type will be auto-locked after the time elapses.
* Notifications are being sent to the residents based on the prefered language set during registration.