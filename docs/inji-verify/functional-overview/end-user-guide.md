# Inji Verify End-User Guide

{% hint style="warning" %}
**Important**: We are in the process of updating screenshots and content in the End User Guide to reflect our new branding. These updates will be available soon, thank you for your patience!
{% endhint %}

This document serves as a concise guide for end users, providing comprehensive step-by-step information on the features and functionalities offered by Inji Verify.


## Verify by scanning the QR Code

1. **Initiate Scan Request:** Go to the Inji Verify portal and select the tab "Scan the QR Code" where the Scan QR code section will come up.

2. Click on the Scan button to initiate the scanning process.

<div align="center">

<div style="display: flex; justify-content: center; align-items: center; gap: 10px;">
  <figure style="margin: 0;">
    <img src="../../.gitbook/assets/image1.png" alt="" width="300">
    <figcaption></figcaption>
  </figure>
  <figure style="margin: 0;">
    <img src="../../.gitbook/assets/image2.png" alt="" width="150">
    <figcaption></figcaption>
  </figure>
</div>


<!-- 

earlier one

<figure><img src="../../.gitbook/assets/image1.png" alt="" width="400"><figcaption><p></p></figcaption></figure>, <figure><img src="../../.gitbook/assets/image2.png" alt="" width="100"><figcaption><p></p></figcaption></figure>

-->


3. Camera Permissions: When the scan is initiated, you will be prompted to grant the necessary camera permissions for the Inji Verify portal, Click the Allow button to give the portal access to your device's camera.
<figure><img src="../../.gitbook/assets/image3.png" alt="" width="400"><figcaption><p></p></figcaption></figure>, <figure><img src="../../.gitbook/assets/image4.png" alt="" width="100"><figcaption><p></p></figcaption></figure>

4. If camera access is denied the screen displays a message indicating the camera permission is denied.
<figure><img src="../../.gitbook/assets/image5.png" alt="" width="400"><figcaption><p>Camera Permission Denied</p></figcaption></figure>

5. **Scan the QR Code**
* Scan QR Code
    * Position the device's camera in front of the QR code you wish to
    scan.
    * Capture the QR code by aligning it within the frame displayed on
    your device's screen.
    * Once the QR code is captured, the data is sent to the Inji Verify
    portal for processing.
* **How is QR Code decoded?:**
    * The QR data is passed to the Pixel Pass library for decoding.
    * Pixel Pass returns the decoded data to Inji Verify for further processing.
    * Inji Verify then verifies the decoded data using the Verification SDK.

<figure><img src="../../.gitbook/assets/image6.png" alt="" width="400"><figcaption><p></p></figcaption></figure>, <figure><img src="../../.gitbook/assets/image7.png" alt="" width="100"><figcaption><p>Zoom Slider</p></figcaption></figure>

6. **Display Credential Details:** - On successful verification, Inji Verify retrieves the display 
    properties of the credential from the issuer's configuration. The credential details are displayed on the portal's interface
    using the fetched display properties.
<figure><img src="../../.gitbook/assets/image8.png" alt="" width="400"><figcaption><p></p></figcaption></figure>,  <figure><img src="../../.gitbook/assets/image9.png" alt="" width="100"><figcaption><p></p></figcaption></figure>




## Verify by uploading the QR Code

1. **Upload QR Code:** - Go to the Inji Verify portal and select the tab **Upload QR Code** where the Upload QR code section will come up and click on the **Upload** button to initiate the process.

<figure><img src="../../.gitbook/assets/image10.png" alt="" width="400"><figcaption><p></p></figcaption></figure> , <figure><img src="../../.gitbook/assets/image11.png" alt="" width="100"><figcaption><p></p></figcaption></figure>

2. Click on the **"Upload"** button on the **Upload QR Code** Page as you select the option to upload a file containing the QR code or credential document you wish to verify from your device's (Desktop or Mobile browser) file explorer. Click on the file to proceed.

3. **How is QR Code decoded and verified once you have uploaded it?:** Inji Verify passes the QR data from the uploaded file to the Pixel Pass library for processing.
    * The QR data is passed to the Pixel Pass SDK for decoding.
    * Pixel Pass returns the decoded data to Inji Verify for further processing.
    * Inji Verify then verifies the decoded data using the Verification SDK.

<figure><img src="../../.gitbook/assets/image12.png" alt="" width="400"><figcaption><p></p></figcaption></figure>, <figure><img src="../../.gitbook/assets/image13.png" alt="" width="100"><figcaption><p></p></figcaption></figure>


4. **Display Credential Details:** - Upon successful verification, Inji Verify retrieves the display properties of the credential and presents the details on the portal's interface.

<figure><img src="../../.gitbook/assets/image14.png" alt="" width="400"><figcaption><p></p></figcaption></figure>, <figure><img src="../../.gitbook/assets/image9.png" alt="" width="100"><figcaption><p></p></figcaption></figure>





## VP Verification (Cross Device Flow)

**Step 1:** **Initiate VP Request Process**

Initiate VP Request Process by clicking on '**Request Verifiable
Credentials'** to begin the verification process.

<figure><img src="../../.gitbook/assets/image15.png" alt="" width="400"><figcaption><p></p></figcaption></figure>

**Step 2:** **Select Credentials & Generate QR Code**

-   The verifier is presented with a list of verifiable credential types
    with specific credentials already pre-selected(configurable) based
    on a specific usecase.

-   Pre-selected credential types are listed on the top and rest of the
    credentials (non-selected ones) are displayed in alphabetical order.

-   The list of VCs can also be sorted in ascending or descending order
    using Sort option.

-   Each credential type is displayed with a checkbox next to it.

-   The verifier reviews the list and selects the desired credentials by
    clicking the checkboxes provided in the list.

    -   Verifier can also search for a credential by entering the
        credential type (1 or more letters to be entered in the search
        box and filtered results appear in the dropdown).

<figure><img src="../../.gitbook/assets/image16.png" alt="" width="400"><figcaption><p></p></figcaption></figure>

-   Choose the required verifiable credentials from the popup window and
    click '**Generate QR Code'**.

    -   If the verifier does not wish to select any credentials, he can
        click on Go Back Button. Clicking on it navigates to main screen
        of 'VP Verification' tab in Inji Verify portal

<figure><img src="../../.gitbook/assets/image17.png" alt="" width="400"><figcaption><p></p></figcaption></figure>

**Step 3: Scan QR Code from Mobile wallet (Use a Different Device)**

Use a wallet containing verifiable credentials on a different device
with QR code scanning capabilities to scan the QR code.

<figure><img src="../../.gitbook/assets/image18.png" alt="" width="400"><figcaption><p></p></figcaption></figure>

Note: The steps that Inji wallet performs to support this interaction
are:

-   The Wallet interprets the VP request and lists all the matching
    credentials available in the Wallet.

-   The Wallet prompts the user to authenticate and then seeks consent
    to share the requested credential(s).

-   The Wallet sends the VP response via HTTPS POST to the Inji Verify
    portal.

**Step 4: View Verification Results in Inji Verify**

Inji Verify displays the verification results of the verifiable
credentials shared from the wallet which could be either 'Valid', 'Valid
but Expired', 'Invalid\' .

-   **Single VC display- Valid VC**

<figure><img src="../../.gitbook/assets/image19.png" alt="" width="400"><figcaption><p></p></figcaption></figure>

Click on full screen option to view the Verifiable Credentials data as
an enlarged view.

<figure><img src="../../.gitbook/assets/image20.png" alt="" width="400"><figcaption><p></p></figcaption></figure>

Click on download option to download the VC data as a json file.

<figure><img src="../../.gitbook/assets/image21.png" alt="" width="400"><figcaption><p></p></figcaption></figure>

-   **Single VC display- Expired VC**

<figure><img src="../../.gitbook/assets/image22.png" alt="" width="400"><figcaption><p></p></figcaption></figure>

-   **Single VC display- Invalid VC**

<figure><img src="../../.gitbook/assets/image23.png" alt="" width="400"><figcaption><p></p></figcaption></figure>

-   **Multiple VCs display**

<figure><img src="../../.gitbook/assets/image24.png" alt="" width="400"><figcaption><p></p></figcaption></figure>

-   **Partial sharing of requested credentials**

If not all the requested VCs are shared from wallet, then the status of
missing VC result area is displayed as 'Not Shared'

<figure><img src="../../.gitbook/assets/image25.png" alt="" width="400"><figcaption><p></p></figcaption></figure>

As the verifier is informed of the missing credentials in VC result
section, the verifier has to **either Generate Request for Missing
Credentials or Generate a New Request for restarting the VP sharing
flow.** The verifier can request for missing credentials by continuing
the flow by clicking on \' Request Missing Credentials\' to generate
another QR code that requests the missing credentials. Another button-
\' Restart Process\' helps user to re-initiate the VP Request process
all over again (by displaying the popup window to select the credentials
and rest of the process continues to be the same), if required.

-   **Re-Generation of VP Request:**

    -   Upon clicking \"Request Missing Credentials\" button, the
        Verifier portal automatically identifies the credentials that
        were not received in the previous transaction.

    -   A new Verifiable Presentation (VP) request is generated,
        containing only the missing credentials.

<figure><img src="../../.gitbook/assets/image26.png" alt="" width="400"><figcaption><p></p></figcaption></figure>

-   **QR Code/Link Display:**

    -   The new VP request is encoded into a QR code.

    -   The QR code is displayed on the Verifier portal and is ready for
        the Holder to scan or access.

<figure><img src="../../.gitbook/assets/image27.png" alt="" width="400"><figcaption><p></p></figcaption></figure>

-   **Holder Interaction:**

    -   The Holder (Inji Wallet) scans the new QR code or accesses the
        link.

    -   The Wallet fetches the new VP request and lists the pending
        credentials (if they are available in the Wallet) along with the
        list of previously verified credentials from our original
        request.

<figure><img src="../../.gitbook/assets/image28.png" alt="" width="400"><figcaption><p></p></figcaption></figure>

-   **Credential Sharing and Verification:**

    -   The process of selecting credentials, providing user consent,
        and sending the VP response follows the standard flow.

    -   The Verifier receives the pending credentials and completes the
        verification process.

<figure><img src="../../.gitbook/assets/image26.png" alt="" width="400"><figcaption><p></p></figcaption></figure>

-   **Final Verification Completion:**

    -   Once all credentials are received and verified, the Verifier
        portal displays a final confirmation message indicating that all
        requested credentials have been successfully verified.

    -   The process is marked as complete.

<figure><img src="../../.gitbook/assets/image29.png" alt="" width="400"><figcaption><p></p></figcaption></figure>

**Note:**

1.  For any VCs displayed after verification, the verifier is provided
    with an option to download the VCs in json format.

2.  For any VCs displayed after verification, the verifier is provided
    with an option to expand the VCs to full view.







## **Error Handling:** 

**Scenario 1:** If Pixel Pass encounters difficulties in decoding the data or encounters an unsupported QR code format, Inji Verify returns to the home screen.

-   An error message stating "**QR code format not supported"** is displayed to the user.

<figure><img src="../../.gitbook/assets/image1.png" alt="" width="400"><figcaption><p></p></figcaption></figure>

**Scenario 2:** If the QR code size or file size exceeds the permissible
limit where the maximum size is 5MB, Inji Verify returns to the home
screen.

-   An error message stating "**File size not supported. The file should be between 10Kb and 5 MB.**"

<figure><img src="../../.gitbook/assets/image31.png" alt="" width="400"><figcaption><p></p></figcaption></figure>

**Scenario 3:** If the QR code is unreadable or blurry then Inji Verify
returns to the home screen.

-   An error message stating **"No multi-format readers were able to read the QR code."**

<figure><img src="../../.gitbook/assets/image32.png" alt="" width="400"><figcaption><p></p></figcaption></figure>


**Scenario 4:** If the user fails to scan the QR code within the 60-second timeframe then Inji Verify returns to the home screen.

-   An error message stating "**The scan session has expired due to inactivity. Please initiate a new scan**."

<figure><img src="../../.gitbook/assets/image33.png" alt="" width="400"><figcaption><p></p></figcaption></figure>


**Scenario 5:** When a PDF containing VC is uploaded and the QR Code is not valid, then the following error message is  displayed- 'Something went wrong with your request. Please check and try again.'

**Scenario 6:** If there is no internet connectivity, the following error message is displayed while using Inji Verify - 'No Internet Connection! Oops! We can't seem to connect. Check your internet connection and try again'

<figure><img src="../../.gitbook/assets/image34.png" alt="" width="400"><figcaption><p></p></figcaption></figure>


**Scenario 7:** When the request in the application url is invalid, the error message displayed- 'The requested resource is invalid'.

<figure><img src="../../.gitbook/assets/image35.png" alt="" width="400"><figcaption><p></p></figcaption></figure>


**Scenario 8:** When the server is down, then the error message displayed is - 'The service is currently unavailable. Please try again later'.

## **Header Section:**

### **Home**

-   The "Home" Screen is not available now so you will be able to see the "Upload QR Code" Page instead.

### **Verify Credentials**

-   The Verify Credentials Page will showcase two main features of Inji Verify that is "Upload QR Code" and "Scan the QR Code".

<figure><img src="../../.gitbook/assets/image36.png" alt="" width="400"><figcaption><p></p></figcaption></figure>


### **Help**

The Help section includes three sub-sections or sub-menus:

    -   **Contact Us**: This directs you to our MOSIP Community where you can write to us with any queries related to Inji  Verify or general inquiries.

    -   **Documentation**: This directs you to the Inji Verify documentation page for detailed information about Inji Verify.

    -   **FAQ**: This section is still under development.

<figure><img src="../../.gitbook/assets/image37.png" alt="" width="400"><figcaption><p></p></figcaption></figure>

### **Language Selection**

Language dropdown is provided for verifier to select a language of his interest for better readability . The languages currently supported are: Portuguese, Spanish, French, English, Arabic, Tamil, Khmer, Hindi and Kannada.

<figure><img src="../../.gitbook/assets/image38.png" alt="" width="400"><figcaption><p></p></figcaption></figure>


## **Credential Display Capability**

**Valid Credentials**

-   These credentials are currently active and verified using the Inji Verify Portal.

<figure><img src="../../.gitbook/assets/image14.png" alt="" width="400"><figcaption><p></p></figcaption></figure>


**Invalid Credentials**:

-   These credentials are currently active but invalid.

<figure><img src="../../.gitbook/assets/image39.png" alt="" width="400"><figcaption><p></p></figcaption></figure>

**Expired Credentials**

-   These credentials have passed their validity period and are no longer active.

<figure><img src="../../.gitbook/assets/image40.png" alt="" width="400"><figcaption><p></p></figcaption></figure>



<!--

# End User Guide

{% hint style="warning" %}
**Important**: We are in the process of updating screenshots and content in the End User Guide to reflect our new branding. These updates will be available soon, thank you for your patience!
{% endhint %}



This document serves as a concise guide for end users, providing comprehensive step-by-step information on the features and functionalities offered by Inji Verify.

### **Feature 1 Flow: Scan QR Code**

**Step 1: Initiate Scan Request:**

* Begin by accessing the Inji Verify portal and selecting the tab “Scan the QR Code” where the Scan QR code section will come up and click on the “Scan” button to initiate the scanning process.

**Desktop View**

<figure><img src="../../.gitbook/assets/Inji-verify-Desktop-view.png" alt="" width="563"><figcaption><p>Scan QR Code Desktop View</p></figcaption></figure>

**Mobile View**

<figure><img src="../../.gitbook/assets/inji-verify-mobile-view.png" alt="" width="210"><figcaption><p>Scan QR Code Mobile View</p></figcaption></figure>

**Step 2: Camera Permissions:**

When the scan is initiated, you will be prompted to grant the necessary camera permissions for the Inji Verify portal. Please click the "Allow" button to give the portal access to your device's camera.

**Desktop View**

<figure><img src="../../.gitbook/assets/inji-verify-camera-permissions-desktop-view.png" alt="" width="563"><figcaption><p>Camera Permission Desktop View</p></figcaption></figure>

**Mobile View**

<figure><img src="../../.gitbook/assets/inji-verify-camera-permissions-mobile-view.png" alt="" width="212"><figcaption><p>Camera Permission Mobile View</p></figcaption></figure>

**Step 3: Scan QR Code:**

* Position the device's camera in front of the QR code you wish to scan.
* Capture the QR code by aligning it within the frame displayed on your device's screen.
* Once the QR code is captured, the data is sent to the Inji Verify portal for processing.

{% hint style="info" %}
- **Decoding and Verification:**
  * The QR data is passed to the Pixel Pass library for decoding.
  * Pixel Pass returns the decoded data to Inji Verify for further processing.
  * Inji Verify then verifies the decoded data using the Verification SDK.
{% endhint %}

**Desktop View**

<figure><img src="../../.gitbook/assets/inji-verify-scan-qr-code-desktop-view.png" alt="" width="563"><figcaption><p>Scan QR Code Desktop View</p></figcaption></figure>

**Mobile View**

<figure><img src="../../.gitbook/assets/inji-verify-scan-qr-code-mobile-view.png" alt="" width="215"><figcaption><p>Scan QR Code Mobile View</p></figcaption></figure>

**Step 4: Display Credential Details:**

* After successful verification, Inji Verify retrieves the display properties of the credential from the issuer's configuration.
* The credential details are displayed on the portal's interface using the fetched display properties.

**Desktop View**

<figure><img src="../../.gitbook/assets/inji-verify-display-credential-details-desktop-view.png" alt="" width="563"><figcaption><p>Display Credential Details Desktop View</p></figcaption></figure>

**Mobile View**

<figure><img src="../../.gitbook/assets/inji-verify-display-credential-details-mobile-view.png" alt="" width="201"><figcaption><p>Display Credential Details Mobile View</p></figcaption></figure>

### **Feature 2 Flow: Upload QR Flow:**

**Step 1: Upload QR Code:**

* Begin by accessing the Inji Verify portal and selecting the tab “Upload QR Code” where the Upload QR code section will come up and click on the “Upload” button to initiate the process.

**Desktop View**

<figure><img src="../../.gitbook/assets/inji-verify-upload-qr-code-desktop-view.png" alt="" width="563"><figcaption><p>Upload QR Code Desktop View</p></figcaption></figure>

**Mobile View**

<figure><img src="../../.gitbook/assets/Inji-verify-upload-qr-code-mobile-view.png" alt="" width="199"><figcaption><p>Upload QR Code Mobile View</p></figcaption></figure>

* Click on the **“Upload”** button on the “Upload QR Code” Page as you select the option to upload a file containing the QR code or credential document you wish to verify from your device's file explorer. Click on the file to proceed.
* Inji Verify passes the QR data from the uploaded file to the Pixel Pass library for processing.

{% hint style="info" %}
- **Decoding and Verification:**
  * The QR data is passed to the Pixel Pass SDK for decoding.
  * Pixel Pass returns the decoded data to Inji Verify for further processing.
  * Inji Verify then verifies the decoded data using the Verification SDK.
{% endhint %}

**Desktop View**

<figure><img src="../../.gitbook/assets/inji-verify-upload-qr-file-desktop-view.png" alt="" width="563"><figcaption><p>Upload QR file Desktop View</p></figcaption></figure>

**Mobile View**

<figure><img src="../../.gitbook/assets/inji-verify-qr-file-upload-mobile-view.png" alt="" width="194"><figcaption><p>Verify Document Mobile View</p></figcaption></figure>

**Step 2: Display Credential Details:**

* Upon successful verification, Inji Verify retrieves the display properties of the credential and presents the details on the portal's interface.

**Desktop View**

<figure><img src="../../.gitbook/assets/image-20240503-135440 (1) (1).png" alt="" width="563"><figcaption><p>Display Credentials Desktop View</p></figcaption></figure>

**Mobile View**

<figure><img src="../../.gitbook/assets/inji-verify-display-credentials-mobile-view.png" alt="" width="196"><figcaption><p>Display Credentials Mobile View</p></figcaption></figure>

### **Error Handling:**

**Scenario 1:** If Pixel Pass encounters difficulties in decoding the data or encounters an unsupported QR code format, Inji Verify returns to the home screen.

* An error message stating "**QR code format not supported"** is displayed to the user.

**Desktop View**

<figure><img src="../../.gitbook/assets/inji-verify-error-handling-desktop-view.png" alt="" width="563"><figcaption><p>QR Code not supported Desktop View</p></figcaption></figure>

**Scenario 2:** If the QR code size or file size exceeds the permissible limit where the maximum size is 5MB, Inji Verify returns to the home screen.

* An error message stating "**File size not supported. The file should be between 10Kb and 5 MB.**"

**Desktop View**

<figure><img src="../../.gitbook/assets/inji-verify-error-handling-file-exceeds-desktop-view.png" alt="" width="563"><figcaption><p>File Size Not Supported Desktop View</p></figcaption></figure>

**Scenario 3:** If the QR code is unreadable or blurry then Inji Verify returns to the home screen.

* An error message statin&#x67;**"No multi-format readers were able to read the QR code."**

**Desktop View**

<figure><img src="../../.gitbook/assets/inji-verify-error-handling-unreadable-desktop-view.png" alt="" width="563"><figcaption><p>Unreadable QR Code Desktop View</p></figcaption></figure>

**Scenario 4:** If the user fails to scan the QR code within the 60-second timeframe then Inji Verify returns to the home screen.

* An error message stating "**The scan session has expired due to inactivity. Please initiate a new scan**."

**Desktop View**

<figure><img src="../../.gitbook/assets/inji-verify-error-handling-expired-seesion-desktop-view.png" alt="" width="563"><figcaption><p>Scan Session Expired Desktop View</p></figcaption></figure>

**Scenario 5:** When a PDF containing VC is uploaded and the QR Code is not valid, then the following error message is displayed- ‘Something went wrong with your request. Please check and try again.’

<figure><img src="../../.gitbook/assets/inji-verify-error-handling_scenario_5.png" alt=""><figcaption></figcaption></figure>

**Scenario 6:** If there is no internet connectivity, the following error message is displayed while using Inji Verify - ‘No Internet Connection! Oops! We can’t seem to connect. Check your internet connection and try again'

<figure><img src="../../.gitbook/assets/inji-verify-error-handling_scenario_6.png" alt=""><figcaption></figcaption></figure>

**Scenario 7:** When the request in the application url is invalid, the error message displayed- ‘The requested resource is invalid’.



<figure><img src="../../.gitbook/assets/inji-verify-error-handling_scenario_7.png" alt=""><figcaption></figcaption></figure>

**Scenario 8:** When the server is done, then the error message displayed is- ‘The service is currently unavailable. Please try again later’.

<figure><img src="../../.gitbook/assets/inji-verify-error-handling_scenario_8.png" alt=""><figcaption></figcaption></figure>

### **Header Section:** <a href="#header-section" id="header-section"></a>

#### **Home** <a href="#home" id="home"></a>

* The “Home” Screen is not available now so you will be able to see the “Upload QR Code” Page instead.

#### **Verify Credentials** <a href="#verify-credentials" id="verify-credentials"></a>

* The Verify Credentials Page will showcase two main features of Inji Verify that is “Upload QR Code” and “Scan the QR Code”.

**Desktop View**

<figure><img src="../../.gitbook/assets/inji-verify-end-user-guide-header.png" alt="" width="563"><figcaption><p>Verify Credentials Desktop View</p></figcaption></figure>

#### **Help** <a href="#help" id="help"></a>

* The Help section includes three sub-sections or sub-menus:
  * **Contact Us**: This directs you to our MOSIP Community where you can write to us with any queries related to Inji Verify or general inquiries.
  * **Documentation**: This directs you to the Inji Verify documentation page for detailed information about Inji Verify.
  * **FAQ**: This section is still under development.

**Desktop View**

<figure><img src="../../.gitbook/assets/inji-verify-end-user-guide-help.png" alt="" width="563"><figcaption><p>Help Desktop View</p></figcaption></figure>

### **Credential Display Capability** <a href="#credential-display-capability" id="credential-display-capability"></a>

**Valid Credentials**

* These credentials are currently active and verified using the Inji Verify Portal.

**Desktop View**

<figure><img src="../../.gitbook/assets/inji-verify-end-user-guide-valid.png" alt="" width="563"><figcaption><p>Valid Credentials Desktop View</p></figcaption></figure>

**Invalid Credentials**:

* These credentials are currently active but invalid.

**Desktop View**

<figure><img src="../../.gitbook/assets/inji-verify-end-user-guide-invalid-creds.png" alt="" width="563"><figcaption><p>Invalid Credentials Desktop View</p></figcaption></figure>

**Expired Credentials**

* These credentials have passed their validity period and are no longer active.

**Desktop View**

<figure><img src="../../.gitbook/assets/inji-verify-end-user-guide-expired-creds.png" alt="" width="563"><figcaption><p>Expired Credentials Desktop View</p></figcaption></figure>

-->







...





<!-- 

Comment Note: This is very old content

Overview

The End-User-Guide for Inji Verify helps you to understand:

- Upload and Verify a VC (Verifiable Credential). 
- Scan and Verify a Verifiable Credential (PDF / Image with QR code).


 - Scan and Verify a Verifiable Credential (PDF / Image with QR code, Print copy of VC having a QR code).

**Step 1: Initiate Scan Request:**

* Launch / Access the Inji Verify portal and select the “Scan the QR Code” tab
* Click on the “Scan” button to initiate the scanning process.

**Desktop View**

<figure><img src="../../.gitbook/assets/Inji-verify-Desktop-view.png" alt="" width="563"><figcaption><p>Scan QR Code Desktop View</p></figcaption></figure>

**Mobile View**

<figure><img src="../../.gitbook/assets/inji-verify-mobile-view.png" alt="" width="210"><figcaption><p>Scan QR Code Mobile View</p></figcaption></figure>

**Step 2: Camera Permissions:**

When the scan is initiated, you will be prompted to grant the necessary camera permissions for the Inji Verify portal. Please click the "Allow" button to give the portal access to your device's camera.

**Desktop View**

<figure><img src="../../.gitbook/assets/inji-verify-camera-permissions-desktop-view.png" alt="" width="563"><figcaption><p>Camera Permission Desktop View</p></figcaption></figure>

**Mobile View**

<figure><img src="../../.gitbook/assets/inji-verify-camera-permissions-mobile-view.png" alt="" width="212"><figcaption><p>Camera Permission Mobile View</p></figcaption></figure>

**Step 3: Scan QR Code:**

* Position the device's camera in front of the QR code you wish to scan (It can be a pdf on your phone or a paper based printed copy of your VC).
* Capture the QR code by aligning it within the frame displayed on your device's screen.
* Once the QR code is captured, the data is sent to the Inji Verify portal for processing.

{% hint style="info" %}
- **Decoding and Verification:**
  * The QR data is passed to the Pixel Pass library for decoding.
  * Pixel Pass returns the decoded data to Inji Verify for further processing.
  * Inji Verify then verifies the decoded data using the Verification SDK.
{% endhint %}

**Desktop View**

<figure><img src="../../.gitbook/assets/inji-verify-scan-qr-code-desktop-view.png" alt="" width="563"><figcaption><p>Scan QR Code Desktop View</p></figcaption></figure>

**Mobile View**

<figure><img src="../../.gitbook/assets/inji-verify-scan-qr-code-mobile-view.png" alt="" width="215"><figcaption><p>Scan QR Code Mobile View</p></figcaption></figure>

**Step 4: Display Credential Details:**

* After successful verification, Inji Verify retrieves the display properties of the credential from the issuer's configuration.
* The credential details are displayed on the portal's interface using the fetched display properties.

**Desktop View**

<figure><img src="../../.gitbook/assets/inji-verify-display-credential-details-desktop-view.png" alt="" width="563"><figcaption><p>Display Credential Details Desktop View</p></figcaption></figure>

**Mobile View**

<figure><img src="../../.gitbook/assets/inji-verify-display-credential-details-mobile-view.png" alt="" width="201"><figcaption><p>Display Credential Details Mobile View</p></figcaption></figure>







## Upload and Verify a VC (Verifiable Credential)

**Step 1: Upload QR Code:**

* Access/ launch the Inji Verify portal and select the “Upload QR Code” tab where the Upload QR code section will come up and click on the “Upload” button to initiate the process.

**Desktop View**

<figure><img src="../../.gitbook/assets/inji-verify-upload-qr-code-desktop-view.png" alt="" width="563"><figcaption><p>Upload QR Code Desktop View</p></figcaption></figure>

**Mobile View**

<figure><img src="../../.gitbook/assets/Inji-verify-upload-qr-code-mobile-view.png" alt="" width="199"><figcaption><p>Upload QR Code Mobile View</p></figcaption></figure>

* Click on the **“Upload”** button on the “Upload QR Code” Page as you select the option to upload a file containing the QR code or credential document you wish to verify from your device's file explorer. Click on the file to proceed.
* Inji Verify passes the QR data from the uploaded file to the Pixel Pass library for processing.

{% hint style="info" %}
- **Decoding and Verification:**
  * The QR data is passed to the Pixel Pass SDK for decoding.
  * Pixel Pass returns the decoded data to Inji Verify for further processing.
  * Inji Verify then verifies the decoded data using the Verification SDK.
{% endhint %}

**Desktop View**

<figure><img src="../../.gitbook/assets/inji-verify-upload-qr-file-desktop-view.png" alt="" width="563"><figcaption><p>Upload QR file Desktop View</p></figcaption></figure>

**Mobile View**

<figure><img src="../../.gitbook/assets/inji-verify-qr-file-upload-mobile-view.png" alt="" width="194"><figcaption><p>Verify Document Mobile View</p></figcaption></figure>

**Step 2: Display Credential Details:**

* Upon successful verification, Inji Verify retrieves the display properties of the credential and presents the details on the portal's interface.

**Desktop View**

<figure><img src="../../.gitbook/assets/image-20240503-135440 (1) (1).png" alt="" width="563"><figcaption><p>Display Credentials Desktop View</p></figcaption></figure>

**Mobile View**

<figure><img src="../../.gitbook/assets/inji-verify-display-credentials-mobile-view.png" alt="" width="196"><figcaption><p>Display Credentials Mobile View</p></figcaption></figure>





### **Error Handling:**

**Scenario 1:** If Pixel Pass encounters difficulties in decoding the data or encounters an unsupported QR code format, Inji Verify returns to the home screen.

* An error message stating "**QR code format not supported"** is displayed to the user.

**Desktop View**

<figure><img src="../../.gitbook/assets/inji-verify-error-handling-desktop-view.png" alt="" width="563"><figcaption><p>QR Code not supported Desktop View</p></figcaption></figure>

**Scenario 2:** If the QR code size or file size exceeds the permissible limit where the maximum size is 5MB, Inji Verify returns to the home screen.

* An error message stating "**File size not supported. The file should be between 10Kb and 5 MB.**"

**Desktop View**

<figure><img src="../../.gitbook/assets/inji-verify-error-handling-file-exceeds-desktop-view.png" alt="" width="563"><figcaption><p>File Size Not Supported Desktop View</p></figcaption></figure>

**Scenario 3:** If the QR code is unreadable or blurry then Inji Verify returns to the home screen.

* An error message statin&#x67;**"No multi-format readers were able to read the QR code."**

**Desktop View**

<figure><img src="../../.gitbook/assets/inji-verify-error-handling-unreadable-desktop-view.png" alt="" width="563"><figcaption><p>Unreadable QR Code Desktop View</p></figcaption></figure>

**Scenario 4:** If the user fails to scan the QR code within the 60-second timeframe then Inji Verify returns to the home screen.

* An error message stating "**The scan session has expired due to inactivity. Please initiate a new scan**."

**Desktop View**

<figure><img src="../../.gitbook/assets/inji-verify-error-handling-expired-seesion-desktop-view.png" alt="" width="563"><figcaption><p>Scan Session Expired Desktop View</p></figcaption></figure>

**Scenario 5:** When a PDF containing VC is uploaded and the QR Code is not valid, then the following error message is displayed- ‘Something went wrong with your request. Please check and try again.’

<figure><img src="../../.gitbook/assets/inji-verify-error-handling_scenario_5.png" alt=""><figcaption></figcaption></figure>

**Scenario 6:** If there is no internet connectivity, the following error message is displayed while using Inji Verify - ‘No Internet Connection! Oops! We can’t seem to connect. Check your internet connection and try again'

<figure><img src="../../.gitbook/assets/inji-verify-error-handling_scenario_6.png" alt=""><figcaption></figcaption></figure>

**Scenario 7:** When the request in the application url is invalid, the error message displayed- ‘The requested resource is invalid’.

<figure><img src="../../.gitbook/assets/inji-verify-error-handling_scenario_7.png" alt=""><figcaption></figcaption></figure>

**Scenario 8:** When the server is done, then the error message displayed is- ‘The service is currently unavailable. Please try again later’.

<figure><img src="../../.gitbook/assets/inji-verify-error-handling_scenario_8.png" alt=""><figcaption></figcaption></figure>

### **Header Section:** <a href="#header-section" id="header-section"></a>

#### **Home** <a href="#home" id="home"></a>

* The “Home” Screen is not available now so you will be able to see the “Upload QR Code” Page instead.

#### **Verify Credentials** <a href="#verify-credentials" id="verify-credentials"></a>

* The Verify Credentials Page will showcase two main features of Inji Verify that is “Upload QR Code” and “Scan the QR Code”.

**Desktop View**

<figure><img src="../../.gitbook/assets/inji-verify-end-user-guide-header.png" alt="" width="563"><figcaption><p>Verify Credentials Desktop View</p></figcaption></figure>





## **Help** <a href="#help" id="help"></a>

* The Help section includes three sub-sections or sub-menus:
  * **Contact Us**: This directs you to our MOSIP Community where you can write to us with any queries related to Inji Verify or general inquiries.
  * **Documentation**: This directs you to the Inji Verify documentation page for detailed information about Inji Verify.
  * **FAQ**: This section is still under development.

**Desktop View**

<figure><img src="../../.gitbook/assets/inji-verify-end-user-guide-help.png" alt="" width="563"><figcaption><p>Help Desktop View</p></figcaption></figure>

### **Credential Display Capability** <a href="#credential-display-capability" id="credential-display-capability"></a>

**Valid Credentials**

* These credentials are currently active and verified using the Inji Verify Portal.

**Desktop View**

<figure><img src="../../.gitbook/assets/inji-verify-end-user-guide-valid.png" alt="" width="563"><figcaption><p>Valid Credentials Desktop View</p></figcaption></figure>

**Invalid Credentials**:

* These credentials are currently active but invalid.

**Desktop View**

<figure><img src="../../.gitbook/assets/inji-verify-end-user-guide-invalid-creds.png" alt="" width="563"><figcaption><p>Invalid Credentials Desktop View</p></figcaption></figure>

**Expired Credentials**

* These credentials have passed their validity period and are no longer active.

**Desktop View**

<figure><img src="../../.gitbook/assets/inji-verify-end-user-guide-expired-creds.png" alt="" width="563"><figcaption><p>Expired Credentials Desktop View</p></figcaption></figure>

-->