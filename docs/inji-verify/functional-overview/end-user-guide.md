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
* **Decoding and Verification:**
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
* **Decoding and Verification:**
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

* An error message stating**"No multi-format readers were able to read the QR code."**

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
