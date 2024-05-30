# End User Guide

This document serves as a concise user guide for end users, providing comprehensive information on the features and functionalities offered by Inji Mobile.

## Installing Inji Mobile

Please navigate to the Play Store or App Store for iOS, select the **Install** option, and kindly wait for the installation process to complete.

#### On Android device

<figure><img src="../.gitbook/assets/inji-install-android.png" alt=""><figcaption><p>Installation of Inji Mobile on Android mobile device</p></figcaption></figure>

#### On iOS device

<figure><img src="../.gitbook/assets/inji-install-ios (1).png" alt=""><figcaption><p>Installation of Inji Mobile on iOS device</p></figcaption></figure>

### First launch of the app

* Upon launching the app, the MOSIP logo will be displayed before the language filter appears.
* The chosen language will be reflected within the app interface. Subsequently, a five-page tutorial for the Inji Mobile will be presented, followed by the option to secure the app.
* This can be achieved through a PIN or the device's Biometrics (such as fingerprint or facial recognition). Once the setting is done, users will be directed to the app's home page.

**On Android Device**

<figure><img src="../.gitbook/assets/First_launch_of_app_1.png" alt=""><figcaption><p>First Launch</p></figcaption></figure>

<figure><img src="../.gitbook/assets/First_launch_of_app_2.png" alt=""><figcaption><p>First Launch</p></figcaption></figure>

<figure><img src="../.gitbook/assets/First_launch_of_app_3.png" alt=""><figcaption><p>Setting up App Unlock</p></figcaption></figure>

## Downloading VC

Inji Mobile integrates with eSignet as an authorization layer to perform VC downloads based on OpenID4VCI standards. Let us understand how to download a National ID VC and an Insurance VC into the Mobile Wallet through the below sections:

## Download VC via eSignet

* Download National ID (MOSIP VC)&#x20;
* Download Insurance VC

### **1. Download National ID (MOSIP VC)**&#x20;

&#x20;**Download credentials using UIN / VID**:

* On the home page, there will be a plus "+" symbol that displays the list of issuers available to download VCs from.
* Select the issuer that states **National Identity Department** and choose a credential type (MOSIP National ID). Once clicked, the browser will open and take you to the eSignet page.
* On the authorization page (eSignet page), the user has to enter the UIN / VID and provide the OTP sent to the registered mobile number/email.
* Upon successful validation of OTP, the user will be taken back to the application, landing on the loading screen. Following the completion of the download process, the user will be returned to the home page, where the Downloaded Credential will be available.

<figure><img src="../.gitbook/assets/Download_National_ID_1.png" alt=""><figcaption><p>Download National ID </p></figcaption></figure>

<figure><img src="../.gitbook/assets/Download_National_ID_2.png" alt=""><figcaption><p>Download National ID</p></figcaption></figure>

<figure><img src="../.gitbook/assets/Download_NAtional_ID_3.png" alt=""><figcaption><p>Download National ID</p></figcaption></figure>

### 2. Download Insurance VC

**Download credentials using KBI:**

* On the home page, there will be a plus "+" symbol that displays the list of issuers available to download VCs from.
* Select the issuer that states **Veridonia Insurance Company** and choose a credential type (Health Insurance, Life Insurance). Once clicked, the browser will open and take you to the eSignet page.
* On the authorization page (eSignet page), the user has to enter the Policy Number, Full Name and Date Of Birth(D.O.B).
* Upon successful validation, the user will be taken back to the application, landing on the loading screen. Following the completion of the download process, the user will be returned to the home page, where the Downloaded Credential will be available.

<figure><img src="../.gitbook/assets/Download_insurance_1.png" alt=""><figcaption><p>Download Insurance VC</p></figcaption></figure>

<figure><img src="../.gitbook/assets/Download_insurance_2.png" alt=""><figcaption><p>Download Insurance VC</p></figcaption></figure>

<figure><img src="../.gitbook/assets/Download_insurance_3.png" alt=""><figcaption><p>Download Insurance VC</p></figcaption></figure>

## Detailed view of the downloaded VC

Once we click on the downloaded VC on the Home Page, the detailed view opens up for the VC.

### Detailed View of National ID VC

Users can see all the details of the National ID in the detailed view. In addition, the user can access the quick access menu (...) on the top right to perform actions such as Pin/Unpin, Share, Share with Selfie, QR Code Login, view Activity Log and Remove from the detailed view of the VC.

<figure><img src="../.gitbook/assets/Detail_view_National_Id.png" alt=""><figcaption><p>Detail View of National ID</p></figcaption></figure>

### Detailed View of Insurance VC

Users can see all the details of the Insurance policy in the detailed view along with the QR Code. The QR Code can be magnified which can be presented to the verifier for scanning. Through the quick access menu (...) on the top right user can also perform other actions like Share, Pin, Remove and Activity log on the VC.

<figure><img src="../.gitbook/assets/Detail_view_Insurance.png" alt=""><figcaption><p>Detail View of Insurance VC</p></figcaption></figure>

### Viewing the history of the downloaded VC

After we have completed several scenarios, when we navigate to the history page, we can find it by selecting the third icon located in the bottom right corner. This page will display a comprehensive list of all the events that have occurred.

<div align="center">

<figure><img src="../.gitbook/assets/History tab.png" alt="" width="188"><figcaption><p>Viewing History</p></figcaption></figure>

</div>

### Activity Log for a VC:

Users can view the activity logs of a VC from the Home Page or the detailed view by choosing the menu option "View Activity Log" from the quick access menu (...).

<figure><img src="../.gitbook/assets/Activity_Log_From_Vc.png" alt=""><figcaption><p>Activity Logs</p></figcaption></figure>

### Sharing Credentials

Prerequisites:

* Two or more devices with Inji Mobile installed are required for sharing credentials. The relying party's phone should be an Android device.
* All required permissions like Bluetooth, location and camera access are enabled on both devices.
* The parties involved are usually a Resident (sharing party) who wishes to share their credentials with a Relying party (receiving party), which could be a banker, health worker, or other professional service.

Users can now share their credentials using any of the methods listed below:

1. Share option from the NavBar.
2. Share or Share with Selfie option from the quick access menu (...) from a VC in the **Home Page**
3. Share or Share with Selfie option from quick access menu (...) in **detailed view** of VC.

Let us understand the process of sharing credentials using an example and see the step-wise process for all the above three methods. Suppose a Resident wishes to share their credentials with a Relying/ Requesting party through the receiver's phone, the following steps outline the procedure for both parties involved:

1. **Share** **from Share Option in NavBar**

&#x20;**On the Sharing Party's phone:**

* The resident opens the QR Code Scanner by clicking on the `Share` button in the NavBar. The application now prompts for permissions.
* Upon granting the necessary permissions, the app opens a camera where the resident can scan the QR code of the recipient's (Verifier/Relying Party) phone.
* Once the QR code is successfully scanned, both phones will establish a Bluetooth connection.
* The resident then needs to choose a downloaded VC and select either the Share or the Share with Selfie option.
* The Share button will solely share the VC, while the Share with Selfie option will verify if the sender's face matches the photo in the VC before proceeding to share.

<figure><img src="../.gitbook/assets/Navbar_share_1 (1).png" alt=""><figcaption><p>Navbar in Sharing Party's</p></figcaption></figure>

<figure><img src="../.gitbook/assets/Navbar_share_2 (1).png" alt=""><figcaption><p>Navbar in Sharing Party's</p></figcaption></figure>

<figure><img src="../.gitbook/assets/Navbar_share_3 (1).png" alt=""><figcaption><p>Navbar in Sharing Party's</p></figcaption></figure>

\
**On the Relying Party's phone**

* This functionality is only available on Android devices. To access it, the receiver needs to navigate to the settings page and locate the `Receive Cards` option.
* On selecting this option, it will open the QR code page. For the relying party to be able to receive a card, the resident needs to scan the QR code using a shared phone. Once the QR code is scanned and shared, the relying party will receive the VC and be able to preview its contents.
* To view the received cards, they would need to access the settings page and find the `Received Cards` section. Clicking on this section will display the received cards. If the receiver has not received any card, this section will be empty.
* Please note that the relying party can only view the received cards and will not be able to share or perform other actions with them.

<figure><img src="../.gitbook/assets/Navbar_relying_1 (1).png" alt=""><figcaption><p>Relying Party's</p></figcaption></figure>

<figure><img src="../.gitbook/assets/Navbar_relying_2 (1).png" alt=""><figcaption><p>Relying Party's</p></figcaption></figure>

2. **Share with Selfie from Home Page Quick Access**

**On the Sharing Party's phone:**

* The resident clicks on the quick access menu (...) from a VC on the Home Page and chooses the Share or Share with Selfie option from the menu.
* &#x20;The application now prompts for permissions if not granted already.
* Upon granting the necessary permissions, the app opens a camera where the resident can scan the QR code of the recipient's (Verifier/Relying Party) phone.
* Once the QR code is successfully scanned, both phones will establish a Bluetooth connection.
* The Share button will solely share the VC, while the Share with Selfie option will verify if the sender's face matches the photo in the VC before proceeding to share.

<figure><img src="../.gitbook/assets/Selfie_sharing_1 (1).png" alt=""><figcaption><p>Selfie on Sharing Party's</p></figcaption></figure>

<figure><img src="../.gitbook/assets/Selfie_sharing_2 (1).png" alt=""><figcaption><p>Selfie on Sharing Party's</p></figcaption></figure>

<figure><img src="../.gitbook/assets/Selfie_sharing_3 (1).png" alt=""><figcaption><p>Selfie on Sharing Party's</p></figcaption></figure>

**On the Relying Party's phone**:

* This functionality is only available on Android devices. To access it, the receiver needs to navigate to the settings page and locate the `Receive Cards` option.
* On selecting this option, it will open the QR code page. For the relying party to be able to receive a card, the resident needs to scan the QR code using a shared phone. Once the QR code is scanned and shared, the relying party will receive the VC and be able to preview its contents.
* To view the received cards, they would need to access the settings page and find the `Received Cards` section. Clicking on this section will display the received cards. If the receiver has not received any card, this section will be empty.
* Please note that the relying party can only view the received cards and will not be able to share or perform other actions with them.

<figure><img src="../.gitbook/assets/selfie_relying_1 (1).png" alt=""><figcaption><p>Selfie on Relying Party's</p></figcaption></figure>

<figure><img src="../.gitbook/assets/selfie_relying_2 (1).png" alt=""><figcaption><p>Selfie on Relying Party's</p></figcaption></figure>

3. **Share with selfie from the detailed view**&#x20;

&#x20;  **On the Sharing Party's phone**

* The resident clicks on the VC on the Home page and clicks on the quick access menu (...) in the detailed view. Resident can choose either Share or Share with Selfie option from the menu.
* &#x20;The application now prompts for permissions if not granted already.
* Upon granting the necessary permissions, the app opens a camera where the resident can scan the QR code of the recipient's (Verifier/Relying Party) phone.
* Once the QR code is successfully scanned, both phones will establish a Bluetooth connection.
* The Share button will solely share the VC, while the Share with Selfie option will verify if the sender's face matches the photo in the VC before proceeding to share.

<figure><img src="../.gitbook/assets/Detailed_view_sharing_1 (1).png" alt=""><figcaption><p>Detail view on Sharing Party's</p></figcaption></figure>

<figure><img src="../.gitbook/assets/Detailed_view_sharing_2 (1).png" alt=""><figcaption><p>Detail view on Sharing Party's</p></figcaption></figure>

<figure><img src="../.gitbook/assets/Detailed_view_sharing_3 (4).png" alt=""><figcaption><p>Detail view on Sharing Party's</p></figcaption></figure>

**On the Relying Party's phone:**

* This functionality is only available on Android devices. To access it, the receiver needs to navigate to the settings page and locate the `Receive Cards` option.
* On selecting this option, it will open the QR code page. For the relying party to be able to receive a card, the resident needs to scan the QR code using a shared phone. Once the QR code is scanned and shared, the relying party will receive the VC and be able to preview its contents.
* To view the received cards, they would need to access the settings page and find the `Received Cards` section. Clicking on this section will display the received cards. If the receiver has not received any card, this section will be empty.
* Please note that the relying party can only view the received cards and will not be able to share or perform other actions with them.

<figure><img src="../.gitbook/assets/Detailed_view_Relying_1 (1).png" alt=""><figcaption><p>Detail view on Relying Party's</p></figcaption></figure>

<figure><img src="../.gitbook/assets/Detailed_view_Relying_2 (1).png" alt=""><figcaption><p>Detail view on Relying Party's</p></figcaption></figure>

### Pinning a VC

After clicking on the ellipsis button on the downloaded VC, a button will appear allowing for the VC to be pinned. Selecting this option will pin the specific VC to the top of the screen.

<figure><img src="../.gitbook/assets/Pinning Vc.png" alt=""><figcaption><p>pinning a VC</p></figcaption></figure>



<figure><img src="../.gitbook/assets/Activating_vc2.png" alt=""><figcaption><p>Pinning a VC</p></figcaption></figure>

### Activating a VC

There are two ways to activate the VC:

* The first option is to click on the "Activate for online login" menu option by clicking on the quick access menu (...) of the card from the Home Page.
* The second option is to click on the "Activate for online login" menu option by clicking on the quick access menu (...) of the card from the detailed view of the VC.
* Upon clicking the "**Activate for online login**" option, a confirmation alert message will be prompted. Once permission is granted, the user will be directed to an OTP screen. After entering the correct OTP, the VC will be activated and projected on the screen with the same message.

<figure><img src="../.gitbook/assets/Activating_vc1.png" alt=""><figcaption><p>Activating a VC</p></figcaption></figure>

<figure><img src="../.gitbook/assets/Activating_vc2 (1).png" alt=""><figcaption><p>Activating a VC</p></figcaption></figure>

### Deleting a VC

* The process of removing a VC involves locating the three-dot menu on the downloaded VC.
* From there, the option to remove the card will be available. Select the option **Remove from Wallet**. Upon clicking this option, a confirmation prompt will appear asking for confirmation.
* If the confirmation is selected, the VC will be successfully removed from the system.

<figure><img src="../.gitbook/assets/Deleting_vc.png" alt=""><figcaption><p>Deleting a </p></figcaption></figure>

## Search

Users can now search for a VC by providing a search string in the search bar. VCs that match the search criteria will be displayed.

<figure><img src="../.gitbook/assets/Search.png" alt=""><figcaption></figcaption></figure>

## Data backup and restore

### Backup

To backup VCs, the user has to choose their preference for the cloud based on the device they are using.

1. Firstly, the user has to go to settings and click on the Backup and Restore menu options.
2. The User should consent for the app to use the drive, and once consented, the application displays a backup and restore screen.
3. In this screen, the user can manually take a backup by clicking on the Backup button and this asynchronously happens allowing the user to use the application.
4. Users will be notified of success or failure.

### Data backup - Android

<figure><img src="../.gitbook/assets/Untitled design (1) (5).png" alt=""><figcaption><p>Data Backup on Android</p></figcaption></figure>

<figure><img src="../.gitbook/assets/Untitled design (11).png" alt=""><figcaption><p>Data Backup on Android</p></figcaption></figure>

### Data backup- ios

<figure><img src="../.gitbook/assets/Databackup_iOS_1.png" alt=""><figcaption><p>Data Backup iOS</p></figcaption></figure>

<figure><img src="../.gitbook/assets/Databackup_iOS_2.png" alt=""><figcaption><p>Data Backup iOS</p></figcaption></figure>

### Restore

To restore backed-up VCs, the user has to choose their preference of the cloud based on the device and use the same Google/apple ID which they used for taking backups.

1. Firstly, the user has to go to settings and click on the Backup and Restore menu options.
2. The user should consent for the app to use the drive, and once consented, the application displays a backup and restore screen.
3. Users find the details of latest backup details in the Last Backup Details section.
4. In this screen, the user can manually restore a backup by clicking on the Restore button and this asynchronously happens allowing the user to use the application.
5. Users will be notified of success or failure.

### Restore - Android

<figure><img src="../.gitbook/assets/Untitled design (12).png" alt=""><figcaption><p>Restore on Android</p></figcaption></figure>

### Restore - ios

<figure><img src="../.gitbook/assets/Untitled design (1) (7).png" alt=""><figcaption><p>Restore on iOS</p></figcaption></figure>
