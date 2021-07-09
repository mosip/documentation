This document contains the defect fixes and features that were released as part of various patch versions on top of MOSIP v1.1.5 release.

# MOSIP v1.1.5.1

## Bux fixes and features released

### Registration Client
* Fix for removal of user role not getting reflected in registration client has been provided
* A new datatype called “date” has been added in the registration client UI specification
* Fix for issues in multi-lingual drop downs due to visibility has been provided
* The flag for skipping trust validation has been removed from the registration client

### Partner Management
* Fix for MOSIP signed certificate to be updated in the master.ca_cert_store table instead of the CA-signed certificate has been provided.

### Commons
* Issues related to the thumbprint has been resolved. The key manager will handle both scenarios where a thumbprint is passed or not passed for decryption.

### ID Authentication
* Now in demographic authentication & e-KYC, all the demographic attributes in id schema can be passed (if available in the id-authentication database).
* Integration with the latest key manager done, this had the thumbprint fix.

# MOSIP v1.1.5.2

## Bux fixes and features released

### Across Modules
* The jaxb-api library dependency was updated for most of the repositories.

### Admin Services
* The sync API has been modified for making sure that all the certificates are getting uploaded to the registration client certificate trust store.

# MOSIP v1.1.5.3

## Bux fixes and features released

### Commons
* Fix has been provided for packet priority based fetch when there is more than one packet. Earlier we had observed that if there is more than one packet being used then correct data was not sent.
* Fix has been provided so that certificates can get downloaded and stored in the registration client trust validation irrespective of timezone difference in server and client.

### ID Authentication
* Photo is now being sent in e-KYC response

### Registration Client
* Fix for the registration client not able to detect the devices when started before the SBI has been provided
* Fix has been provided to stay on the acknowledgement page after printing so that the user can reprint the acknowledgement. Earlier after the print button was clicked the user was automatically redirected to the home screen hence reprinting was not possible.
* The issue in age calculation in the registration client due to different windows region formats has been fixed

# MOSIP V1.1.5.4

## Bux fixes and features released

### ID Authentication
* Due to recent MDS specification changes we have modified the below sections in IDA.
    * Thumbprint in IDA now supports both hex and base64URL encoding
    * Hash validation for biometrics has changed with an option to disable it

* Registration Client
    * Document Scanner
        * Fix for creation of low-resolution image due to cropping has been resolved
        * Zoom in and zoom out feature has been added in preview in document screen
        * Document Scanner screen now has a horizontal and vertical scroll
        * An option to change the crop area by dragging after crop selection has been added
        * JPEG compression is done on the scanned or cropped image before converting it into a PDF, which decreases the document size
    * Biometric Capture Screen
        * Post capture of Iris and Face we are now showing the captured biometric image in the UI (not the last frame)
        * Display issue related to good quality image replacing a lower-quality image during multiple capture attempts in biometric capture screen has been fixed
        * Display issue related to the warning symbol not getting removed after a proper capture has been resolved
        * The forced capture limit is now, same as the capture limit (it was earlier hardcoded to three)

* Registration Processor
    * Adjudication Stage
        * The stage can now handle multiple technical failures and redirects them for reprocessing. Scenarios,
            * Any technical failures sent by the adjudication system, i.e. when return code is sent as 2
            * When an invalid reference ID is sent from the adjudication system
            * When there is a count mismatch between the count value and reference IDs
        * The stage also handles a scenario where multiple responses are received from the adjudication system, by just logging the response and not processing it
        * The adjudication response now supports the modalities section for each reference ID
    * Readiness Probe for registration processor stages
        * The readiness probe details in all registration processor VertX stages have been modified to remove the null pointer exception during the restart of the VertX stages
        * Prometheus endpoints have been added for all the stages
    * Option to have multiple landing zone folders has been added
    * Issues in stage level packet priority-based fetch for biometrics has been fixed for uin-generator-stage
    * Issues related to packet validation failure to reprocessing of multi-source packets has been fixed 

* Commons
    * Packet manager has been modified to fetch proper biometric data during reprocessing of multiple packets
    * A flag has been added for the UIN validator for disabling the validation for “repeating numbers for 2 or more than 2 digits”. Due to this change dependency in the below modules has been updated.
        * registration-client: 1.1.5.4
        * id-authentication: 1.1.5.4
        * id-repository: 1.1.5.3
        * resident-services: 1.1.5.1
* ID Repository
    * Aspect logs have been added
    * The column bio_ref_id in the idrepo.uin table has been deprecated