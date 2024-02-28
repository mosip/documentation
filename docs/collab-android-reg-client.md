# Android Registration Client

**Android Registration Client (ARC)** is a tablet application that serves as portable version of the existing desktop [Registration Client](https://docs.mosip.io/1.2.0/modules/registration-client). Users can access ARC from Android devices and further, ARC meets mobility requirements of countries adopting MOSIP Identity.

The primary objective of the tablet version is to facilitate the registration process for residents who are not able to physically visit registration centres and also serve remote locations where setting up Registration centre is not feasible. To address this challenge, the ARC was developed enabling Operators / Supervisors to easily reach out the remote areas and maximise resident registrations across the country.

Android Registration Client Demonstration Setup guide serves as a tool to demonstrate the impressive capabilities of MOSIP's system. Let's embark on this journey together to explore the potential of ARC.

**Note**: For developers setting up ARC locally, refer [Developers Guide](https://docs.mosip.io/1.2.0/modules/android-registration-client/android-registration-client-developer-guide).


## Pre-requisites ##

* Reliable and consistent Internet connectivity

* Tablets running Android version 10 to 13

* Tablets with a minimum of 4 GB RAM

* The tablets should be capable of capturing fingerprints, IRIS, and face (photo) biometrics. Additionally, they should also have the ability to scan documents. However, if the tablets do not support these capabilities, MOCK SBI can be used as an alternative.

**Note**: For Mock MDS, click [here](https://drive.google.com/drive/folders/14q7E5pZtfj0eimF3JGzlVfU4eV-MRPCQ) to download the Mock MDS in your system folder, which will enable you to simulate biometric capture (without real biometric devices).

* Following setup is required to access ARC in Collab environment:

   * UIN or a VID

   * Upon installing ARC APK from [Collab](https://collab.mosip.net/) environment, you need to long press on the MOSIP logo to view the machine details

* To obtain your UIN credentials for Collab environment, follow the below steps:

   * The provision of a Unique Identification Number(UIN) as a demonstration credential will enable you to have a firsthand experience of the ARC's capabilities and explore its various features.

   * Please fill the [form](https://docs.google.com/forms/d/e/1FAIpQLScq-HoYkbx37iKtm_v17dn8UZTih-Xv_P93Ew3GEl8H-vH-qA/viewform) with correct details and successfully submit the form. Upon receiving the form, we will generate a demo credential for you. We will also register you as an Operator on Keycloak and map your device to the center to which your credential is required to be mapped.

## Step-by-Step Process ##

Mentioned below are the steps to download, install, and use ARC.

  **Step 1**: Download and install the APK on Android tablet. Visit [Android Registration Client](https://collab.mosip.net/#/dashboard) to access ARC in Collab environment.
  
   **Step 2**: Upon installing ARC, launch ARC, and long press on the logo to copy the machine details.

   **Step 3**: Fill this [form](https://docs.google.com/forms/d/e/1FAIpQLScq-HoYkbx37iKtm_v17dn8UZTih-Xv_P93Ew3GEl8H-vH-qA/viewform) and wait for us to reach out to you with your credentials to login as an Operator.

   **Step 4**: Once you receive the Operator credentials (Username and password) from us, launch Android Registration Client, enter your credentials to login and wait for synchronization to complete.

   **Step 5**: You can refer to our comprehensive [User Guide](https://docs.mosip.io/1.2.0/modules/android-registration-client/android-registration-client-user-guide) document to learn how to register and use ARC.

**Note**: Please be advised that if the Android Registration Client is uninstalled and then re-installed, the aforementioned steps will need to be repeated from the start.

## Additional Resources ##

* To know more about features of the Android Registration Client, click [here](https://docs.mosip.io/1.2.0/modules/android-registration-client).

* To learn more about the configurations, click [here](https://docs.mosip.io/1.2.0/modules/android-registration-client/android-registration-client-configuration).
  
## Get in Touch ##

If you require any assistance, or encounter any issues during the testing and integration process, kindly reach out to  support as mentioned below.

* Navigate to [Community](https://community.mosip.io/).

* Provide a detailed description about the support you require or provide complete information about the issue you have encountered, including steps to reproduce, error messages, logs and any other required details.

*Thank you. Wishing you a pleasant experience!*

## Generating Operator’s Credential in Collab Environment

Please provide the requested information, to help us initiate the process of generating a demonstration UIN and subsequently the Operator’s Credential for you, in our sandbox Collab environment.

You can find details about our sandbox environments [here](https://docs.mosip.io/1.2.0/sandbox-details).

## Instructions

1. Fill out the required fields marked with an asterisk (*).
2. Provide accurate and up-to-date information to avoid any discrepancies.
3. For any queries, reach out to us on [MOSIP Community](https://community.mosip.io/).

## Information Required

1. Full name*
2. DOB*
3. Email Id*
4. Upload your face photograph, which will be used to generate demo credentials for you, i.e UIN(PNG/JPEG)*
5. Preferred Username
6. Machine details:*
   
   a. Enter the signPublicKey*: Mentioned below is sample signPublicKey.


      ``MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAydZPy8M-prpqZWhDsT3hbvdBgwdSAGaELPrd0k4QlqlSdR-BHBxdZ4RxABDWY54q- 
        saQQfFZFlxSY7hin7u5PGcbVRzCtAL24YRptIaj-XXm7I_ia_unQHJpLrrmJTj1MzoNTqVGOtiU68fV0VkJGEtvbiUnxvjWIuMJbDT88GN- 
        s0KLm48QPUKKLKC2E-XJKYg5qzYLYwvo_FgccmUmy8NWbo- 
        O7S98iKQXrMuXm58qS7SZsnu_jfSZub0azw84VnhQTKzjYjdJFPupW5UoPBb3QE34opcxmrW2Tlo2cqaMq7UmByk0QcboPj0EvWw-2- 
        FQI0R4fvB3FWF5pBeDhwIDAQAB``

   b. Enter the name*: Mentioned below is sample name.
  
      ``69EMbYHObOwI``

   c. Enter the publicKey*: Mentioned below is sample publicKey.

      `` MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAyZMTh_VYFpVm-D7xCMFa-Jg6o35i-k_soZCqeBSupEi- 
            Dr6IlqNslUhvkGuErH3YXzRA- 
            Cyzoh3NV7TKc6DqHNJvYB4rBf5x7FupnIQrG5fsLT1dY8QtMmTYTx_xPexdwRJz_5AL15Ly6vkdHjX9YttHhLOK0qtYvwXPMsi6rjVi5k0TbiH- 
            odSIked5qW8rU_guHBMjtdH7DCp2TPvLdlDbMO_fG7gL5yjZO7kuwTWuakfurdGMB4_ew64PrBbKdjoaFsB9cy7om9LSZkGZPWVin32w1zKpyP- 
            yAvzZ2rAyaynUdqq8kEKctcCZG0zLx2DeRS2Pu531aTa5D4jqmQIDAQAB ``

   d. Enter the version*: Mentioned below is sample version.

      ``Alpha``

8. Declaration*
