# Android Registration Client

## Overview

The Android Registration Client is a tablet application that serves as a portable version of the existing desktop [Registration Client](https://docs.mosip.io/1.2.0/modules/registration-client). It has been developed to support accessibility on all Android devices. The creation of the Android Registration Client was driven by the need to meet the mobility requirements of countries adopting MOSIP.

The primary objective of the tablet version is to facilitate the registration process for residents, especially those who are unable to physically visit registration centers. It also serves remote locations where setting up registration centers is not feasible. To address this challenge, the Android Registration Client was created, enabling operators and supervisors to easily reach remote areas and maximize resident registrations across the country.

To have a glance at the features, refer to the video below!

{% embed url="https://www.youtube.com/watch?v=DrBB5IJnS0Y&t=9s&ab_channel=MOSIP-IIITBangalore" %}

## **Features**

The first developer release of the Android Registration Client offers the following key features:

1. **Operator/ Supervisor Login (offline and online)**: Operators can securely login using their credentials, whether in offline or online mode, to carry out various registration transactions. To enable offline login, the operator must have previously logged in and synchronized their data over a network.
2. **Multi-language Support**: The Android Registration Client supports multiple languages for content display and data entry.

* **Display Language**: Display Language refers to the language used for rendering UI elements such as labels and headings. With the Android Registration Client, Operators have the option to choose their preferred language for UI display. This language selection can be made on the login screen. Currently, the supported display languages include Arabic, French, and English.
* New languages can be added by following the below steps:
* Additional languages can be configured by adding localization files in lib/l10n folder present in the root project directory("android\_registration\_client").
* The languages that are rendered on the UI will be based on the country configuration (after master data sync). The default display language is English. Other languages will be available in the UI after the master data sync.

&#x20;      To know more, refer to [Flutter doc-Internationalizing Flutter apps](https://docs.flutter.dev/ui/accessibility-and-localization/internationalization).

* **Data Entry Language**: The Data Entry Language refers to the specific language utilized by the Operator while gathering data, which is then stored on the server in that selected language. During the registration process, the Operator can choose the language preference for the data collected, allowing applicants to provide information in their desired language. This language selection option becomes available upon initiating a new registration. The responsibility for managing the data entry language lies within the UI Spec, and any modifications or changes can be made through that specification.

3. **Auto-Sync/ manual sync**: On launching the Android Registration Client and logging in for the first time, the system automatically syncs the following data:

* **Configuration sync**: Sync of properties which drives in deciding the ARC UI functionality. For example: Invalid login attempts, idle timeout, thresholds, etc.
* **Masterdata sync**: As a part of this sync, supporting information like Dynamic field data, templates, locations, screen authorization, blocklisted words, etc. are pulled in.
* **UserDetails sync**: userID, along with their status is synced. Only the user details belonging to machine mapped center will be synced.
* **Certificate sync**: Certificates used to validate the server signatures, device CA certificates, and public key (specific to a center and machine, also called policy key) used to encrypt the registration packet will be synced.

4. **New Registrations**: Operators can register a resident using the `New Registration` feature. The registration process can be customized through the [UI specification](https://docs.mosip.io/1.2.0/modules/registration-client/registration-client-ui-specifications). The required data for registering an applicant are as follows:
   * **Consent**: Before the registration process, applicants must provide consent to the terms and conditions presented on the consent screen. This explicitly asks the applicant to grant permission for storing and using their Personally Identifiable Information (PII).
   * **Demographic Details**: Once the consent is obtained, the Operator will enter the demographic data of the applicant in the language preferred by the applicant. This includes details such as their name, gender, date of birth, and residential address.
   * **Documents Upload**: Following the completion of the demographic details, the Operator can select the document type, input the reference, and upload the supporting documents provided by the applicant. Supporting documents may include Proof of Address, Proof of Identity, and Proof of Birth, based on the country-specific requirements.
   *   **Biometrics**: After the documents have been uploaded, the Operator will proceed to capture the applicant's biometrics. The biometrics captured are as follows:

       ```
       - Fingerprints
       - Iris 
       - Photograph
       - Exception photograph
       ```

The acquisition of biometric data is regulated by the country. The country has control over the capture of each type of biometric (fingerprint, iris, or face) through the global configuration. When the Operator selects the **Capture** button, the biometric SBI application is accessed to capture the biometrics.

Once the biometrics are obtained, the data and control are returned to the Android Registration Client. To obtain the resident's biometrics, the quality of the captured image must exceed the threshold specified by the country. The biometrics can be captured a set number of times if necessary to meet the quality threshold. In situations where none of the captured images meet the threshold, the image with the highest quality score will be saved.

If the resident has a biometric exception (such as a missing finger/eye or very poor finger/iris quality), the Operator can designate that particular biometric as an exception. However, the Operator must still capture the resident's exception photo.

* **Preview section**: The Operator can review the data entered by the applicant, including demographic information, uploaded documents, and captured biometrics. This preview allows the Operator to ensure the accuracy of the entered data. If any mistakes are found, the Operator can easily go back to the corresponding section and make the necessary corrections. If the data is correct, the Operator can proceed to the next step, which is to authenticate themselves.
* **Operator authentication**: Once both the Operator and applicant have confirmed that the data is accurately filled, the Operator is required to authenticate themselves using their credentials. After a successful authentication, the data packets are created and only then the sync and upload operations can be performed.
* **Packet sync**: After the applicant's registration form has been completed and the Operator has authenticated themselves, a packet sync must be performed. This can be done either manually or as a background job(auto sync and upload of packets). Packet sync ensures that the packet is prepared for uploading and the status of the uploaded packet is synchronized with the server.
* **Packet Upload**: Once the packet sync is completed, the system will proceed to upload the packet to the server when an internet connection is available. If there is no network access, the system will attempt to upload the packet as soon as connectivity is established.
* **Acknowledgment section**: Following the completion of the new registration process, an acknowledgment receipt is generated. This receipt includes the AID(Application ID), captured demographic data in the selected language, a photograph of the resident, and a ranking of each finger from 1 to 10, with 1 representing the finger with the best quality. The receipt is designed to be easily printed.

**exceptionalBiometrics exceptions:** If the resident has a biometric exception (such as a missing finger/eye or very poor finger/iris quality), the Operator can designate that particular biometric as an exception. However, the Operator must still capture the resident's exception photo.

* **Preview section**: The Operator can review the data entered by the applicant, including demographic information, uploaded documents, and captured biometrics. This preview allows the Operator to ensure the accuracy of the entered data. If any mistakes are found, the Operator can easily go back to the corresponding section and make the necessary corrections. If the data is correct, the Operator can proceed to the next step, which is to authenticate themselves.
* **Operator authentication**: Once both the Operator and applicant have confirmed that the data is accurately filled, the Operator is required to authenticate themselves using their credentials. After a successful authentication, the data packets are created and only then the sync and upload operations can be performed.
* **Packet sync**: After the applicant's registration form has been completed and the Operator has authenticated themselves, a packet sync must be performed. This can be done either manually or as a background job(auto sync and upload of packets). Packet sync ensures that the packet is prepared for uploading and the status of the uploaded packet is synchronized with the server.
* **Packet Upload**: Once the packet sync is completed, the system will proceed to upload the packet to the server when an internet connection is available. If there is no network access, the system will attempt to upload the packet as soon as connectivity is established.
* **Acknowledgment section**: Following the completion of the new registration process, an acknowledgment receipt is generated. This receipt includes the AID(Application ID), captured demographic data in the selected language, a photograph of the resident, and a ranking of each finger from 1 to 10, with 1 representing the finger with the best quality. The receipt is designed to be easily printed.

5. **Operator onboarding**: To log in to the Android Registration Client, the operator must complete the onboarding process. This functionality is available only during the first online login. The operator will need to onboard by capturing their fingerprints, thumbprints, iris, and face. Once these are duly captured, the operator can start registering residents and using other services.
6. **Update Operator onboarding**: The Operators can also update their biometrics. In this scenario, the Operator will have to capture all their biometrics. By doing this, the previous biometrics captured during Operator Onboarding will be overridden by the newly captured biometrics.
7. **Dashboard:** The Operator can access the dashboard where he can view the following:
   1. **Packets created:** This will show the total number of packets created from the time the Android Registration Client was installed.
   2. **Packets Synced:** This will show the total number of packets synced from the time the Android Registration Client was installed.
   3. **Packets Uploaded:** This will show the total number of packets uploaded from the time the Android Registration Client was installed.
   4. **User details:**
      1. **User ID:** This will show the list of User IDs of the Users mapped to the device.
      2. **Username:** This will show the list of usernames of the Users mapped to the device.
      3. **Status:** This will show the status of Users mapped to the device. This can take values such as onboarded, active, inactive, etc.

### Configuration Guide

To read through the comprehensive list of configurable properties for the Android Registration Client, refer [Android Registration Client Configuration Guide](https://docs.mosip.io/1.2.0/android-registration-client/android-registration-client-configuration).

### UI Specifications

For more details on UI specifications for the Android Registration Client, refer [here](https://docs.mosip.io/1.2.0/android-registration-client/registration-client/registration-client-ui-specifications).

### Compatibility

The Android Registration Client is compatible with the following MOSIP platform versions:

1. 1.1.5.x
2. LTS 1.2.0 and above
