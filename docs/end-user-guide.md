# End User Guide

This document serves as a concise user guide for end users, providing comprehensive information on the features and functionalities offered by Inji.

## Installing Inji

Please navigate to the Play Store or App Store for iOS, select the **Install** option, and kindly wait for the installation process to complete.

#### On Android device

<figure><img src=".gitbook/assets/inji-install-android.png" alt=""><figcaption><p>Installation of Inji on Android mobile device</p></figcaption></figure>

#### On iOS device

<figure><img src=".gitbook/assets/inji-install-ios (1).png" alt=""><figcaption><p>Installation of Inji on iOS device</p></figcaption></figure>

### First launch of the app

* Upon launching the app, the MOSIP logo will be displayed before the language filter appears.&#x20;
* The chosen language will be reflected within the app interface. Subsequently, a four-page tutorial for the Inji will be presented, followed by the option to secure the app.
* &#x20;This can be achieved through either a PIN or utilizing the device's Biometrics (such as fingerprint or facial recognition). Once the setting is done, users will be directed to the app's home page.

<figure><img src=".gitbook/assets/first-launch-Page-1.png" alt=""><figcaption><p>First launch </p></figcaption></figure>

<figure><img src=".gitbook/assets/first-launch-Page-2.png" alt=""><figcaption><p>Tooltips </p></figcaption></figure>

<figure><img src=".gitbook/assets/first-launch-Page-3.png" alt=""><figcaption><p>Setting up the app</p></figcaption></figure>

## Downloading VC

To download VC, there are three methods:

* Downloading VC using the UIN/ VID feature
* Downloading VC using the Application ID feature
* Download VC via eSignet

**Downloading VC using UIN/ VID/ AID**

* On the home page, you will find a plus "+" symbol. Clicking on this symbol will display a list of issuers from which you can download VCs.&#x20;
* Look for the issuer that offers the option to download via UIN and VID. Clicking on this option will present you with the option to download VC from AID and VID.&#x20;
* Fill in the required information in the text box according to your needs, and then click on the **Generate Card** button.&#x20;
* You will be prompted to enter an OTP on the next page, and once you do so, the download will begin automatically.

<figure><img src=".gitbook/assets/inji-download-via-uin-Page-1.png" alt=""><figcaption><p>Selecting the <strong>Download via UIN, VID, AID option</strong></p></figcaption></figure>

<figure><img src=".gitbook/assets/inji-download-via-uin-Page-2.png" alt=""><figcaption><p><strong>OTP Verification</strong> and <strong>Requesting for Credential</strong></p></figcaption></figure>

**Downloading VC via eSignet**

* On the home page, there will be a plus "+" symbol that displays the list of issuers available to download VCs from.&#x20;
* Select the issuer that states **Download via eSignet**. Once clicked, the browser will open and take you to the eSignet page.&#x20;
* There will be an option to **Login with OTP**, which should be selected.
* A text box should be filled with your VID and the captcha should be completed in order to enable the **Get OTP** button.&#x20;
* Upon activation, the system will redirect to the One-Time Password (OTP) validation page. After successfully inputting the correct OTP, the user will be taken back to the application, landing on the loading screen. Following the completion of the download process, the user will be returned to the home page.

<figure><img src=".gitbook/assets/inji-download-via-esignet-Page-1.png" alt=""><figcaption><p>Selecting the <strong>Download via eSignet</strong></p></figcaption></figure>

<figure><img src=".gitbook/assets/inji-download-via-esignet-Page-2.png" alt=""><figcaption><p>User opts for <strong>Login with OTP option</strong></p></figcaption></figure>

<figure><img src=".gitbook/assets/inji-download-via-esignet-Page-3.png" alt=""><figcaption><p>Successful download of VC</p></figcaption></figure>

### Detailed view of the downloaded VC

Once we click on the downloaded VC, it will open as a detailed view.

<figure><img src=".gitbook/assets/detailed-vc-view.png" alt=""><figcaption></figcaption></figure>

### Viewing history of the downloaded VC

After we have completed several scenarios, when we navigate to the history page, we can find it by selecting the third icon located in the bottom right corner. This page will display a comprehensive list of all the events that have occurred.

<figure><img src=".gitbook/assets/detailed-viewVC-history.png" alt=""><figcaption><p>History View</p></figcaption></figure>

### Sharing Credentials

Prerequisites:

* Two or more devices with Inji installed are required for sharing credentials.
* All required permissions like Bluetooth, location and camera access are enabled on both the devices.
* The parties involved are usually a Resident (sharing party) who wishes to share their credentials with a Relying party (receiving party), which could be a banker, health worker, or other professional service.

Let us understand the process of sharing credentials using an example. Suppose a Resident wishes to share their credentials with a Relying/ Requesting party through the receiver's phone. The following steps outline the procedure for both parties involved:

**On the Sharing Party' phone:**

* The resident opens the Scanner by clicking on the `Scan` button, the application now prompts for permission.
* &#x20;Upon granting the necessary permissions, the app opens a camera where the resident can scan the QR code of the recipient's phone.&#x20;
* Once the QR code is successfully scanned, both phones will establish a connection.
* The resident then needs to choose a downloaded VC and select either the **Share** option or the **Share with Selfie** option.&#x20;
* The **Share** button will solely share the VC, while the **Share with Selfie** option will verify if the sender's face matches the photo in the VC before proceeding to share.

<figure><img src=".gitbook/assets/sharing-Page-1.png" alt=""><figcaption></figcaption></figure>

<figure><img src=".gitbook/assets/sharing-Page-2.png" alt=""><figcaption></figcaption></figure>

**On the Relying Party' phone**:

* This functionality is only available on Android devices. To access it, the receiver needs to navigate to the settings page and locate the `Receive Cards` option.&#x20;
* On selecting this option, it will open the QR code page. For the relying party to be able to receive a card, the resident needs to scan the QR code using a sharing phone. Once the QR code is scanned and shared, the relying party will receive the VC and be able to preview its contents.
* To view the received cards, they would need to access the settings page and find the `Received Cards` section. Clicking on this section will display the received cards. If the receiver has not received any card, this section will be empty.&#x20;
* Please note that the relying party can only view the received cards and will not be able to share or perform other actions with them.

<figure><img src=".gitbook/assets/sharing-Page-3.png" alt=""><figcaption></figcaption></figure>

<figure><img src=".gitbook/assets/sharing-Page-4.png" alt=""><figcaption></figcaption></figure>

### Pinning a VC

After clicking on the ellipsis button on the downloaded VC, a button will appear allowing for the VC to be pinned. Selecting this option will pin the specific VC to the top of the screen.

<figure><img src=".gitbook/assets/detailed-vc-view-pin.png" alt=""><figcaption><p>Pin a VC</p></figcaption></figure>

<figure><img src=".gitbook/assets/sharing-Page-4.png" alt=""><figcaption></figcaption></figure>

### Activating a VC

There are two ways to activate the VC:

* &#x20;The second option is to click on the activate button found in the detailed view.&#x20;
* Upon clicking the **Activate** button, a confirmation alert message will be prompted. Once permission is granted, the user will be directed to an OTP screen. After entering the correct OTP, the VC will be activated and projected on the screen with the same message.

<figure><img src=".gitbook/assets/activate-vc-new-Page-1.png" alt=""><figcaption><p>User clicks on <strong>Activate button</strong></p></figcaption></figure>

<figure><img src=".gitbook/assets/activate-vc-new-Page-2.png" alt=""><figcaption><p>VC activated for online login</p></figcaption></figure>

### Deleting a VC

* The process of removing a VC involves locating the three-dot menu on the downloaded VC.&#x20;
* From there, the option to remove the card will be available. Select the option **Remove from Wallet**. Upon clicking this option, a confirmation prompt will appear asking for confirmation.&#x20;
* If the confirmation is selected, the VC will be successfully removed from the system.

<figure><img src=".gitbook/assets/activate-vc-new-deleteVC.png" alt=""><figcaption><p>Remove a VC</p></figcaption></figure>

## GenderMag

GenderMag methodology is designed to examine and address gender biases in users' problem-solving interactions with software. During software dessign, gender differences in Human-Computer Interaction (HCI) are addressed with GenderMag methodology.

**Process**

1. We identified three personas based on their familiarity with technology and their ability to embrace technological progress. The personas are:
   
     a. Abi, who is either Abigail or Abishek, is 45 years old. He works as a homemaker, is literate, but not very tech- 
      savvy. His internet connectivity is moderate, and he does not have a personal phone.
  
     b. Tim , who is either Timothy or Timara, a 24-year-old financial consultant, is literate, tech-savvy, and boasts 
      excellent internet connectivity. Additionally, he owns the latest phone.
  
2. Examine the feature, systematically walk through the process, assess their information handling, and pinpoint any problems.

During the walkthrough, we pinpointed inclusivity concerns in the Inji mobile app’s user interface and experience. Subsequently, we took steps to mitigate these issues, aiming to eliminate digital entry barriers.

As part of Phase1, below P1 items are fixed in the v0.11.0-Inji release: