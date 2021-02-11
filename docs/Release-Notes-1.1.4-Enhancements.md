This document contains the features that were developed or enhanced as part of MOSIP 1.1.4 release.

# Overall Enhancement
* Prepend thumbprint has been added for all the modules where encryption or decryption is used in MOSIP and it is made configurable to make it backward compatible.

# Commons

* Datashare has been upgraded
	* Kernel Auth adapter JAR dependencies are removed.
	* The JWT signature header is now stored as metadata in object store when a data share URL is created.
	* The signature from metadata is added in the response header for get API.
	* Prepend thumbprint support for encryption has been added.
* Kernel ID Generator Service for VID has been modified
	* Assigned VIDs are isolated to a separate table to improve performance.
	* Expired VIDs after the cooling period are deleted instead of adding back to available VID pool to make available VIDs truly random.

# ID Authentication
* Signature verification of the authentication request and biometric data with trust validation has been added.
* Decryption of authentication request and biometric data with certificate thumbprint has been added.
* We are now using HMAC Utils 2
* Authentication Transaction history is now storing the request and response signatures
* The Auth Demo UI has been updated to support,
	* Signature in header.
	* Authentication request and biometric data with certificate thumbprint.
	* Use of HMAC Utils 2.
* Ability to receive web sub notification & update IDA cache has been added for any change in policy or partner details in partner management module.
* Root and CA certificates of the partners are stored now stored in IDA database for trust validation.

# ID Repository
* Credential Service Upgrade
	* We are now fetching the policy details based on issuer details and credential type, previously we used the hard code the policy id.
	* We are now using the new key manager service for encryption with prepend thumbprint.
* ID Object Validator Upgrade
	* The ID object validator now supports master data validation for the dynamic location hierarchy, previously it used to perform validation for the static fields defined in the platform location hierarchy.
* Added certificate thumbprint support for encryption or decryption of data. 

# Partner Management
* The validate partner API when called by IDA now returns the partner certificates in response so that it can be used during encryption for e-KYC response.
* We are now sending web sub notification for IDA when there is a change in policy, partner and API key details.
* We have added multiple APIs in Partner Management for Partner Management UI Screens.

# Registration Processor
* We are now using the get certificate API in registration processor to retrieve the IDA certificate for encryption instead of using the get public key API.
* We are now using Kafka queue as configurable replacement for vertx event bus in registration processor for providing delivery guarantee of all messages in the queue. The approach taken here makes the event bus usage a proper factory implementation and includes vertx and kafka as one implementation.  
* Vertx version in stages has been upgraded to 3.9.1 from 3.5.4 to utilize new capabilities.

# Registration Client
* Feature to hide and show fields has been added using rules in Registration Client UI Specification.
* Support for Logo display in preview and acknowledgement page has been added.
* Document scan pop-up now supports stream, preview, crop and cancel options.
* User details sync in now integrated with the new sync data API; this API (`/userdetails?keyindex=<keyindex>`) now returns encrypted user details.
* Operator details are now added in the EOD action page.
* We are now display date & time in local timezone where the registration client is running.