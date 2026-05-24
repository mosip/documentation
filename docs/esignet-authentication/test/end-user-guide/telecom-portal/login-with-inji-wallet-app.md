# Login with INJI Wallet App

### Prerequisites

* The resident is registered in the national identity system and holds a **valid National ID (UIN)**.
* The resident has the **INJI Wallet app installed** on their mobile device.

{% hint style="info" %}
Note: To download INJI wallet app for your device refer the [guide here](https://app.gitbook.com/s/aY8BQ4hdzhSchZV814Ev/inji-wallet/inji-mobile/functional-overview/end-user-guide#installing-inji-wallet).
{% endhint %}

* The resident has **already downloaded their National ID verifiable credential** into the INJI Wallet.

{% hint style="info" %}
**Note:** Wallet-based authentication requires the National ID credential to be available in the INJI Wallet prior to starting this flow.
{% endhint %}

### Try It Yourself

This demo uses **Fyntel Telecom** as a simulated service provider portal to demonstrate how a telecom operator can securely authenticate a resident using their **National ID** before allocating an **eSIM**.

Click here to navigate to the [**Fyntel eSIM Allocation Portal**](https://esim-mosipid.collab.mosip.net/), and follow the steps below to complete the eSIM allocation flow using **QR code–based authentication via the INJI Wallet app and eSignet**.

#### Step 1: Access the eSIM Allocation Portal <a href="#step-1-access-the-esim-allocation-portal" id="step-1-access-the-esim-allocation-portal"></a>

The resident opens the **eSIM Allocation Portal** and clicks **Get Started** to begin authentication.

<figure><img src="../../../../.gitbook/assets/image (14).png" alt=""><figcaption></figcaption></figure>

#### Step 2: Select INJI Wallet Authentication <a href="#step-2-select-inji-wallet-authentication" id="step-2-select-inji-wallet-authentication"></a>

On the eSignet login screen, the resident selects **Login with INJI Wallet** from the available authentication options.

<figure><img src="../../../../.gitbook/assets/image (15).png" alt=""><figcaption></figcaption></figure>

#### Step 3: QR Code is Displayed <a href="#step-3-scan-the-qr-code" id="step-3-scan-the-qr-code"></a>

A **QR code** is displayed on the portal screen.

<figure><img src="../../../../.gitbook/assets/image (17).png" alt=""><figcaption></figcaption></figure>

#### Step 4: Scan the QR Code <a href="#step-4-select-national-id-credential" id="step-4-select-national-id-credential"></a>

Within the INJI Wallet, the resident is prompted to choose a **verifiable credential**.

* The resident opens the **INJI Wallet app** on their mobile device.
* The resident selects the **Share**, the resident scans the QR code displayed on the portal.
* Authentication is in progress screen is displayed.

<figure><img src="../../../../.gitbook/assets/image (18).png" alt=""><figcaption></figcaption></figure>

#### Step 5: Select MOSIP ID Credential

1. The resident selects the **National ID credential** to be shared for authentication and clicks Verify in INJI wallet App.
2. Before sharing the credential, the INJI Wallet prompts the resident to complete **local face authentication** on the device.
   * This verification happens entirely **within the wallet app**.
   * No biometric data is shared outside the device.
3. After successful wallet authentication, the resident is presented with the **Consent screen**.
   * **Essential claims** required for eSIM allocation are displayed and are mandatory.
   * **Voluntary claims** are shown as optional and can be selected by the resident.
   * The resident selects the required user claims and clicks **Allow** to provide consent.

<div align="center" data-full-width="false"><figure><img src="../../../../.gitbook/assets/image (20).png" alt="" width="188"><figcaption></figcaption></figure> <figure><img src="../../../../.gitbook/assets/image (21).png" alt="" width="188"><figcaption></figcaption></figure> <figure><img src="../../../../.gitbook/assets/Screenshot_20260207_025107_Inji Wallet Collab.jpg" alt="" width="188"><figcaption></figcaption></figure> <figure><img src="../../../../.gitbook/assets/Screenshot_20260207_024044_Inji Wallet Collab.jpg" alt="" width="188"><figcaption></figcaption></figure></div>

#### Step 8: Select eSIM Plan

Once consent is granted, authentication is completed successfully, and the resident is redirected back to the **eSIM Allocation Portal.**

The resident selects the desired eSIM plan from the available options and clicks **Next** to proceed.

<figure><img src="../../../../.gitbook/assets/image (10).png" alt=""><figcaption></figcaption></figure>

#### Step 9: Enter Device Information

The resident provides device-specific details, such as:

* **IMEI number**
* **EID number**

After entering the required information, the resident clicks **Next**.

<figure><img src="../../../../.gitbook/assets/image (11).png" alt=""><figcaption></figcaption></figure>

#### Step 10: Review Pre-filled Personal Details

The user’s personal information is **automatically fetched from the MOSIP ID system** and pre-filled based on the **claims approved during the consent step**.

The resident reviews the details, verifies their accuracy, and clicks **Submit**.

<figure><img src="../../../../.gitbook/assets/image (12).png" alt=""><figcaption></figcaption></figure>

#### Step 11: eSIM Allocation Confirmation

Upon successful submission:

* An **eSIM is allocated** to the resident
* A **success acknowledgment** is displayed on the portal

<figure><img src="../../../../.gitbook/assets/image (13).png" alt=""><figcaption></figcaption></figure>

This completes the **eSIM allocation process using National ID authentication via eSignet**.
