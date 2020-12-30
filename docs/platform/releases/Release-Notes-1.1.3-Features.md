This document contains the features that were developed or enhanced as part of MOSIP 1.1.3 release.

# Commons
* Key Manager is now enhanced with the below features,
	* Key Manager now supports encryption and decryption of registration packets using the thumb-print.
	* JWT Sign and JWT Verify APIs have been introduced to support full JWT signature validation with proper header and additional parameters.
	* An API has been added to validate certificate trust path for a certificate and partner domain.
	* We have removed the get public key API, which was used to fetch the public key. We recommend to use our get certificate API to fetch MOSIP’s public certificate.

* Data Share is now enhanced with the below features,
	* The expiry for the data share URL has been added. The data share URL will not be accessible if the expiry time for the URL has exceeded.
	* As the data share policy structure has been changes in partner management, subsequent changes have been incorporated in data share.

# Pre-registration
* Mandatory field labels in Pre-registration UI are now dynamically appended with a red asterisk symbol (<font color="red">*</font>).

# Registration Client
* Direct call to internal authentication API during operator on-boarding has been removed from registration client. This call is now being routed via. Registration Processor.
* Issue with Biometric Stream API (for 0.9.2 MDS) has been fixed - Hence, Registration Client is compatible with MDS 0.9.2 and 0.9.5 specifications.
* User Salt sync has been removed from Registration Client syncs. Now, the salt is being generated on the fly in Registration Client, its not being fetched from the server.
* The client settings (master data) and configurations are now encrypted using the TPM public certificate of the Registration Client and synced.
* Registration Client UI Specification is enhanced with the below features,
	* Support for alignment has been added
	* Support for multiple location hierarchy in case of present and permanent address has been added

# Registration Processor
* APIs have been created in Registration Processor, to delegate the internal authentication request and fetch encryption certificate calls from Registration Client to IDA.
* Print Service has been deprecated from Registration Processor. A new project has been created for Print Service.
* Print Stage in Registration Processor now calls the credential request generator to send print requests via. web sub.
* In our earlier releases all the data captured during registration was sent to ABIS systems, but now, we are reading the policy and sending specific biometrics to the ABIS Partners. This has been bought in after the changes in our data share policy changes in partner management.
* Source and Process details are now added in the registration processor ID mapper, so that the Registration Processor stages can make a call to the packet manager based on the values mentioned in the ID mapper.

# ID Repository
* As part of the credential issuance, we are now sending an additional information to the partner stating which attributes are encrypted and which are not.
* The credentials sent to the new print service will now be encrypted using print partner’s encryption certificate.
* During e-UIN card request, if the user makes a request using a particular VID then the same VID would be sent to the Print Partner.
* As part of credential issuance, MOSIP credential service will share data with partners (IDA Instances or Print Partners) on web sub as per our standard schema. A sample schema would be published so that the partners can easily integrate with MOSIP.
* The entire credential details shared to partners in the web sub response will be encrypted using the partner encryption certificate.
* As the data share policy structure has been changes in partner management, subsequent changes have been incorporated in credential issuance.

# ID Authentication
* Data fetched from Partner management (partner and policy details) and stored in IDA using Spring Cache.
* All the IDA APIs are modified to remove ID Type from them. We would be using the ID value to identify if the input id is a VID or UIN.
* Notification templates and titles were earlier part of IDA configurations. Now they are fetched from master data and stored in IDA using spring cache.

# Partner Management
* APIs have been created to add or retrieve biometric extractor details based on policy.
* The policies (authentication and data share policies) are now generated as per our new policy schema.

# Resident Services
* As the IDA APIs are now modified to remove ID Type from them, the APIs in Resident Services are also modified to remove ID Type from them.
* For features such as request for e-UIN card and QR code the new print service implementation is now being called via credential issuance web sub to generate the e-UIN card and QR code (verifiable credentials).

# Administration
* Key Management UI has been added in Administration Portal.

# Print Service
* A new implementation has been created to receive requests to generate e-UIN card or QR codes using input received from Credential Issuance via. Web Sub.