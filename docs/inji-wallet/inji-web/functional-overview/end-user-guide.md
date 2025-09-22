# End User Guide

## End User Guide

### Overview

Inji Wallet (Web) End User Guide is structured as below:

* Interface Overview
* Downloading VCs as PDF
* Preference
  * Change Language

#### Interface Overview

Inji Wallet (Web) offers a browser-based interface similar to Inji Wallet, designed to be fully responsive across desktops, tablets, and mobile browsers. This section provides a high-level overview of the interface (Desktop View), labeling each key component to help you quickly locate items referred to throughout this guide.

#### Interface Elements

* **Login**\
  Use Google or any configured OpenID-compliant Identity Provider (IdP) to log in and store credentials securely in the web wallet.
* **Main Menu**\
  Access navigation options for Dashboard, Issuers, Preferences, and more.
* **Language Selector**\
  Change the interface language using the dropdown in the header.
* **Workspace**\
  The main content area where you interact with the wallet, issuers, and credentials.
* **Search Bar**\
  Search for available credential types or issuers.
*   **Issuers Section**\
    Browse through a list of trusted credential issuers. Each issuer displays supported credential types.

    <figure><img src="../../../.gitbook/assets/inji-web-interface-overview.png" alt=""><figcaption><p>Interface Overview</p></figcaption></figure>

### Download VCs

#### Downloading National ID VC as PDF

You can download your National ID, here we will see how to do it when we use eSignet for Authentication; using OTP.

**Q**. **What details I need to provide to download my credential**?

**A**. The credential issuer would have provided details such as UIN/VID in case of MOSIP National ID, You need to enter these information to be able to download Insurance VC.

To download a National ID VC using eSignet as authentication layer (OTP method)

* Launch the Inji Wallet (Web) in your web browser, The home page presents you with the list of Issuers. You can also use the 'Search' box to search for and quickly find the Issuer (Credential Issuer) you are looking for.
  * Locate and click an '**Issuer**' on the Workspace, Or
  * Search for an issuer by its name in **Search** box and click to proceed,\
    **Note**: On selecting an **Issuer** from '**list of Issuers**' it takes you to next page where you select a '**Credential Type**' (National Id here) to download it as PDF.

<figure><img src="../../../.gitbook/assets/inji-web-download-national-id-as-pdf-1.png" alt=""><figcaption><p>Inji Web in Web Browser</p></figcaption></figure>

* On 'List of Credential Types' screen, select the '**Credential Type**', It opens '**Share** **Validity Screen**' as popup.

<figure><img src="../../../.gitbook/assets/inji-web-download-national-id-as-pdf-2.png" alt=""><figcaption><p>List Of Credential Type</p></figcaption></figure>

* On '**Share Validity**' popup you can choose to decide the number of times a credential can be used, choose from drop down (Once, Twice, Unlimited or Custom ). Click ok and proceed, It takes you to next page for authentication (eSignet).

<figure><img src="../../../.gitbook/assets/inji-web-download-national-id-as-pdf-0.png" alt=""><figcaption><p>Share Validity</p></figcaption></figure>

* On eSignet authentication page enter UIN/VID and click on '**Get OTP**', a next screen will appear asking you to enter OTP.

<figure><img src="../../../.gitbook/assets/inji-web-download-national-id-as-pdf-4.png" alt=""><figcaption><p>Authentication page</p></figcaption></figure>

* Enter the OTP you received and click **Verify**.

<figure><img src="../../../.gitbook/assets/inji-web-download-national-id-as-pdf-6.png" alt=""><figcaption><p>Enter OTP</p></figcaption></figure>

* A download progress screen appears.

<figure><img src="../../../.gitbook/assets/inji-web-download-national-id-as-pdf-7.png" alt=""><figcaption><p>Verify Progress</p></figcaption></figure>

* PDF will be generated and stored in the **Downloads** folder of the system.

<figure><img src="../../../.gitbook/assets/inji-web-download-national-id-as-pdf-8.png" alt=""><figcaption><p>Download Success</p></figcaption></figure>

* You can view the PDF of the downloaded VC (National ID) from download folder.

<figure><img src="../../../.gitbook/assets/inji-web-download-national-id-as-pdf-9.png" alt="" width="318"><figcaption><p>Downloaded National ID VC as PDF</p></figcaption></figure>

#### Downloading Insurance VC as PDF

You can download your Insurance VC, here we will see how to do it when we use eSignet for Authentication; using OTP.

**Q - What details do I need to provide to download my credential?**

**A** - The credential issuer must have provided details such as **Policy Number**, **Name** and **DOB** for an Insurance card. This information has to be fed to the authentication system to enable download.

To download an Insurance ID VC using eSignet for authentication (KBI method), follow the step below:

* Launch the Inji Web application in your web browser. The application home page presents you with the **list of Issuers**. You can also use the '**Search**' box to quickly find an Issuer (Insurance provider).
  * Click-select a particular 'Issuer' (Insurance provider) which issued you the Insurance (Insurance VC Issuer), you will land to its **Credential Types** selection page.

<figure><img src="../../../.gitbook/assets/inji-web-download-insurance-vc-as-pdf-1.png" alt=""><figcaption><p>Launch application</p></figcaption></figure>

* On the **Credentials Types** page, choose a credential type from the List of Credentials section, '**Share Validity**' popup will appear.

<figure><img src="../../../.gitbook/assets/inji-web-download-insurance-vc-as-pdf-2.png" alt=""><figcaption><p>List Of Issuers</p></figcaption></figure>

* On '**Share Validity**' screen you can choose to decide the number of times a credential can be used, choose from tyhe dropdown (Once, Twice, Unlimited or Custom). Click Ok and proceed, It takes you to next page for authentication (eSignet).

<figure><img src="../../../.gitbook/assets/inji-web-download-insurance-vc-as-pdf-3.png" alt=""><figcaption><p>VC Validity</p></figcaption></figure>

* On eSignet authentication page enter **Policy Number**, **Name** and **DOB** (KBI Method) and click on '**Login**'. **Note**: All the fields are mandatory.

<figure><img src="../../../.gitbook/assets/inji-web-download-insurance-vc-as-pdf-4.png" alt=""><figcaption><p>Authentication page</p></figcaption></figure>

* Credential is downloaded in the background and PDF will be generated and stored in the **Downloads** folder of the system (A download progress screen is also seen when the credential is being downloaded).

<figure><img src="../../../.gitbook/assets/inji-web-download-insurance-vc-as-pdf-5.png" alt=""><figcaption><p>Download Progress</p></figcaption></figure>

* The generated pdf is stored in the Downloads folder of the system. You can view the PDF of the downloaded VC (Insurance) from download folder.

<figure><img src="../../../.gitbook/assets/inji-web-download-insurance-vc-as-pdf-6.png" alt="" width="319"><figcaption><p>Downloaded Insurance VC as PDF</p></figcaption></figure>

### Preference

#### Language Selection

You can choose your preferred language using '**language Selection**' options available on the **Main-Menu**. Inji Web now supports 4 International Language (English, French and Arabic) and 3 Indian Languages (Tamil, Hindi and Kannada).

<figure><img src="../../../.gitbook/assets/inji-web-language-change.png" alt=""><figcaption><p>Language Preference</p></figcaption></figure>

## Login to Save Credentials in the Web Wallet or Download Credentials

**Note:** Screenshots will be added soon to enhance the user experience and better explain the steps shown below.

You can now log in to Inji Web using Google or any other supported Identity Provider (IDP) to:

* **Add and securely store your credentials** in Inji's Web Wallet
* **Download credentials** directly to your device

In this section, you'll learn how to:

* Log in to Inji Web Wallet
* Save credentials for future access
* Download credentials as needed

### Login with Google or any other IDP

1.  **Launch Inji Web Wallet in Browser**\
    Navigate to the wallet URL in any browser.

    ![landing-page-inji-web-login](../../../.gitbook/assets/iww-eug-landing-page-inji-web-login.png)
2.  **Click "Login with Gmail"**\
    Select the Google login option on the homepage.

    ![login-via-gmail-inji-web-wallet](../../../.gitbook/assets/iww-eug-login-via-gmail-inji-web-wallet.png)
3.  **Select Google Account**\
    Choose your Google account or enter login credentials.

    ![login-via-gmail-confirmation-from-google](../../../.gitbook/assets/iww-eug-login-via-gmail-confirmation-from-google.png)
4.  **Post-login Welcome Page**\
    You will land on the dashboard showing issuer and credential options.

    ![post-login-welcome-page-(home)](../../../.gitbook/assets/iww-eug-post-login-welcome-page-\(home\).png)
5.  **Set Passcode (First-Time Only)**\
    You'll be prompted to set a local passcode to secure your web wallet.

    ![set-passcode-for-inji-web-](../../../.gitbook/assets/iww-eug-set-passcode-for-inji-web-.png)

    ![set-passcode-by-entering-during-first-time-login](../../../.gitbook/assets/iww-eug-set-passcode-by-entering-during-first-time-login.png)

### Download VCs (Login)

**Note:** A few example issuers are listed below. You can explore more issuers in the **Collab environment** via the UI or configure additional issuers as needed to test and explore this feature further.

#### Download National ID VC

**Q. What details are needed?**

You’ll need your **UIN/VID**as provided by the credential issuer.

1. Login to Inji Web Wallet
2. Search or Select 'Republic of Veridonia National ID Department'
3. Choose 'Veridonia National ID' Credential Type

![credential-type-page](../../../.gitbook/assets/iww-eug-credential-type-page.png)

4. **Authenticate via eSignet (OTP method)**
   * Enter UIN/VID → Click 'Get OTP'
   * Enter OTP → Click 'Verify'
5. **Download Starts Automatically**\
   Verifiable Credential is stored in your web wallet in the "stored cards" page.

#### Download Insurance VC

**Q. What details are needed?**

You’ll need **Policy No., Name, and Date of Birth** as shared by the issuer.

**Steps:**

1. Login to Inji Web Wallet
2. Search or Select 'StayProtected Insurance'
3. Choose 'Health Insurance' or 'Life Insurance' as Credential Type
4. Authenticate via eSignet (KBI method)
   * Enter required fields
5. Download Starts Automatically\
   Verifiable Credential is stored in your web wallet in the "stored cards" page.

### Manage Stored Credentials

![stored-cards-dropdown-options(view,download,delete)](../../../.gitbook/assets/iww-eug-stored-cards-dropdown-options\(view,download,delete\).png)

![stored-card-page-with-credentials](../../../.gitbook/assets/iww-eug-stored-card-page-with-credentials.png)

![stored-cards-view-option](../../../.gitbook/assets/iww-eug-stored-cards-view-option.png)

![delete-card](../../../.gitbook/assets/iww-eug-delete-card.png)

#### View Credentials (Login Mode)

1. Navigate to the **Stored Cards** section in the Inji Web Wallet.

![stored-cards-empty-page](../../../.gitbook/assets/iww-eug-stored-cards-empty-page.png)

2. If your wallet has been created but no credentials have been downloaded yet, the **Stored Cards** section will appear empty.
   * Click on the **Add Cards** option to initiate the credential download flow.
   * Follow the steps outlined in the [Download VCs (Login)](end-user-guide.md#download-vcs-login) section to retrieve your credentials.
3. Once credentials are downloaded, they will appear in a mini card view within the **Stored Cards** section.
4. For each stored credential, you can click on the **three-dot menu (⋮)** to explore additional actions:
   * **View** – Preview the credential within the wallet.
   * **Download** – Download the VC as a PDF with an embedded QR code.
   * **Delete** – Remove the credential from your web wallet.

#### Profile & Language Preferences

**Access Profile Options**

1. Click on the **Profile Icon** in the top-right corner of the page (next to the language selector).
2. Upon clicking, a dropdown will appear with the following options:
   * `FAQs` – View frequently asked questions
   * `Profile` – View or manage your account
   * `Logout` – Securely log out of your session
3. To change your preferred language:
   * Click on the **Language Icon** (globe) next to your profile
   * A list of supported languages will appear
   * Select your preferred language from the dropdown

![dropdown-(profile,faq,logout)](../../../.gitbook/assets/iww-eug-dropdown-\(profile,faq,logout\).png)

![profile-page](iww-eug-profile-page.png)

#### Passcode Reset Flow

If you forget your passcode during login, you can click **“Forgot Passcode”** to set up a new one.

1. On the **"Enter Your Passcode"** screen, click "**Forgot Passcode"** to reset your wallet.
2. Enter and confirm your new passcode.
3. Click **Submit** to save.
4. Log in again with your new passcode and re-download your credentials.

{% hint style="success" %}
**What happens when you forget your passcode?**

* Your wallet will be securely **reset**.
* All previously stored credentials will be **deleted** from your wallet.
* You’ll be guided to create and confirm a **new passcode**.
* The new passcode will remain tied to your same **Google login (Gmail ID)**.
* You will need to **re-download your credentials** from the original issuers.
{% endhint %}

#### Lockout Rules

* ❌ 5 wrong attempts → Wallet locked temporarily for **1 hour**.
* After 1 hour → You can try again (Round 2).
* ❌ 5 wrong attempts again → Wallet locked temporarily for **1 more hour**.
* On the **last round (3rd attempt)**:
  * You will see a **warning message** (“Last attempt left before permanent lock”).
  * ❌ If entered incorrectly again, your wallet will be **permanently locked**.

#### Permanent Lock

* Once locked permanently, the **only option** is to reset your wallet.
* Resetting your wallet means:
  * All previously stored credentials will be **deleted**.
  * You will need to **set a new passcode**.
  * The new passcode will stay tied to your Google login (Gmail ID).
  * You must **re-download all your credentials** from the issuers.

{% hint style="info" %}
**Note:**&#x20;

* No passcode recovery mechanism is available.
* Passcode change after login is not supported yet.
{% endhint %}

<figure><img src="../../../.gitbook/assets/Screenshot 2025-09-17 at 10.51.59 AM.png" alt=""><figcaption></figcaption></figure>



<figure><img src="../../../.gitbook/assets/image (11).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../../../.gitbook/assets/image (12).png" alt=""><figcaption></figcaption></figure>

### Quick Notes

* Credentials stored in the web wallet are **only accessible post-login**.
* Guest users can download directly to the device, but **credentials are not stored in the web wallet.**
