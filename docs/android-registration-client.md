# Android Registration Client

## Overview

The Android Registration Client is a mobile and tablet application that serves as a portable version of the existing desktop [Registration Client](https://docs.mosip.io/1.2.0/modules/registration-client). It has been developed to support accessibility on all Android devices. The introduction of the Android Registration Client came about in order to meet the mobility requirements of countries adopting MOSIP. 

The primary objective of the mobile version is to facilitate the registration process for residents, specifically those who are unable to physically visit registration centres and also serve remote locations where setting up Registration centres is not feasible. To address this challenge, the Android Registration Client was created, enabling operators and supervisors to easily reach remote areas and maximise resident registrations across the country.

### How to install Android Registration Client(ARC)

1. Download and install the APK on Android tablet.

2. Once ARC is installed, long press on the logo to copy the machine details.

3. On the [Admin Portal](https://docs.mosip.io/1.2.0/modules/administration/admin-portal-user-guide), using admin credentials, login and perform the following to add the device:

    * Go to resources/ machine and click on “Create machine”

    * Add a new machine and enter the machine details:

      * Add the specs as “Android”

      * Map it to a center and zone

      * Machine spec ID as “Android”

      * Enter Device name

      * Enter Public Key

      * Enter Sign Public Key

   * Create the role `Default` in KeyCloak with all the other roles.

   * Create the operator’s user account in KeyCloak and set the password and assign the role as “Default”, “REGISTRATION_OFFICER”, 
     “Registration Operator”, “REGISTRATION_SUPERVISOR”, 

   * Login into Admin Portal to perform the following and add the user:

      * After login into Admin Portal, go to `User Zone Mapping` and add the zone for the user and activate the zone.

      * Go to `User Center Mapping` and add the center for the user and activate the center.

Note: The user should be mapped to the same Zone and Center to which the device was mapped to.


### Features

The first developer release of Android Registration Client offers the following key features:

1. **Operator/Supervisor Login (offline and online)**: Operators can securely log in using their personal credentials, whether in offline or online mode, to carry out various transactions. To enable offline login, the Operator must have previously logged in and synchronized their data over a network.

2. **Multi language support**: The Android Registration Client supports multiple languages for content display and data entry.

     * **Display Language**: Display Language refers to the language used for rendering UI elements such as labels and headings. With 
        the Android Registration Client, Operators have the option to choose their preferred language for UI display. This language 
        selection can be made on the login screen. Currently, the supported display languages include Arabic, French, English, Hindi, 
         Kannada, and Tamil.

      New languages can be added by following the below steps:

        i. Additional languages can be added by adding localisation files in this folder. 

           `lib/l10n`
  
        ii. The languages that are rendered on the UI will be based on the country configuration (after master data sync). The default 
           display language is English. The other languages will be available in the UI after master data sync.
   
      To know more, refer [Flutter doc-Internationalizing Flutter apps](https://docs.flutter.dev/ui/accessibility-and-localization/internationalization).
   
   * **Data Entry Language**: The Data Entry Language refers to the specific language utilized by the Operator when gathering data, 
      which is then stored on the server in that selected language. During the registration process, the Operator can choose the 
      language preference for the data collected, allowing applicants to provide information in their desired language. This language 
      selection option becomes available upon initiating a new registration. The responsibility for managing the data entry language 
     lies within the UI Spec, and any modifications or changes can be made through that specification.

4. **Auto-Sync/ manual sync**: On launching the Android Registration Client and logging in for the first time, the system automatically syncs the following data:

 * **Configuration sync**: Sync of properties which drives in deciding the ARC UI functionality. For example: Invalid login attempts, idle timeout, thresholds, etc.

 * **Masterdata sync**: As a part of this sync, supporting information like Dynamic fields data, templates, locations, screen authorization, blocklisted words, etc. are pulled in.

* **UserDetails sync**: userID, along with their status is synced. Only the user details belonging to machine mapped center will be synced.

 * **Certificate sync**: Certificates used to validate the server signatures, device CA certificates, public key (specific to a center and machine, also called as policy key) used to encrypt the registration packet will be synced.

  
4. **New Registrations** : Operators have the ability to register a resident using the "New Registration" feature. The registration process can be customized through the user interface specification. The required data for registering an applicant are as follows:

* **Consent**: Prior to the registration process, applicants must provide consent to the terms and conditions presented on the consent screen. This explicitly asks the applicant to grant permission to MOSIP for storing and using their Personally Identifiable Information (PII).

* **Demographics**: Once the consent is obtained, the operator will enter the demographic data of the applicant. This includes details such as their name, gender, date of birth, and residential address.

* **Documents**: Following the completion of the demographic screen, the operator can select the document type, input the reference, and upload the supporting documents provided by the applicant. Supporting documents may include Proof of Address, Proof of Identity, and Proof of Birth, based on the country-specific requirements.

* **Biometrics**: After the documents have been uploaded, the operator will proceed to capture the applicant's biometrics. The biometrics captured are as follows:

  - Fingerprints
  - Iris scan
  - Photograph
  - Exception photograph

    The acquisition of biometric data is regulated by the country. The country has control over the capture of each type of biometric 
    (fingerprint, iris, or face) through the global configuration. When the operator selects the **Capture** button, the biometric SBI 
    application is accessed to capture the biometrics. Once the biometrics are obtained, the data and control are returned to the 
    Android Registration Client. To obtain the resident's biometrics, the quality of the captured image must exceed the threshold 
    specified by the country. The biometrics can be captured multiple times if necessary to meet the quality threshold. In situations 
    where none of the captured images meet the threshold, the image with the highest quality score will be saved.

    If the resident has a biometric exception (such as a missing finger/eye or very poor finger/iris quality), the operator can d 
    designate that particular biometric as an exception. However, the operator must still capture the resident's exception photo.

* **Preview section**: The Operator has the ability to review the data entered by the applicant, including demographic information, uploaded documents, and captured biometrics. This preview allows the Operator to ensure the accuracy of the entered data. If any mistakes are found, the Operator can easily go back to the corresponding section and make the necessary corrections. If the data is correct, the Operator can proceed to the next step, which is to authenticate themselves.

* **Operator authentication**: Once both the Operator and applicant have confirmed that the data is accurately filled out, the Operator is required to authenticate themselves using their credentials. After a successful authentication, the data packets are uploaded to the server as soon as a network connection becomes available.

* **Packet sync**: After the applicant's registration form has been completed and the Operator has authenticated themselves, a packet sync must be performed. This ensures that the packet is prepared for uploading and the status of the uploaded packet is synchronized with the server.

* **Packet Upload**: Once the packet sync is successfully completed, the system will proceed to upload the packet to the server when an internet connection is available. If there is no network access, the system will attempt to upload the packet as soon as connectivity is established.

* **Acknowledgment section**: Following the completion of the new registration process, an acknowledgment receipt is generated. This receipt includes the captured demographic data in the selected language, a photograph of the resident, and a ranking of each finger from 1 to 10, with 1 representing the finger with the best quality. The receipt is designed to be easily printed using any printer.


