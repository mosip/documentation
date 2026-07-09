# Login with OTP

### Try It Yourself

This demo uses **Fyntel Telecom** as a **simulated service provider portal** to demonstrate how a telecom operator can securely authenticate a resident using their National ID before allocating an eSIM.

Click **here** to navigate to the [**Fyntel eSIM Allocation Portal**](https://esim-mosipid.collab.mosip.net/), and follow the steps below to complete the eSIM allocation flow using **OTP-based authentication via eSignet**.

### Step-by-Step Flow

#### Step 1: Access the eSIM Portal

The resident opens the [**Fyntel Portal**](https://esim-mosipid.collab.mosip.net/) and clicks **Get Started** to begin the authentication process.

<figure><img src="../../../../.gitbook/assets/image (2).png" alt=""><figcaption></figcaption></figure>

#### Step 2: Choose an Authentication Method

The eSignet login screen is displayed with available authentication options.To proceed with OTP-based authentication, the resident selects **Login with OTP**.

<figure><img src="../../../../.gitbook/assets/image (3).png" alt=""><figcaption></figcaption></figure>

#### Step 3: Enter National ID Details

The resident enters a valid **UIN**/**VID** in the _Enter UIN/VID_ field.

<figure><img src="../../../../.gitbook/assets/image (5).png" alt=""><figcaption></figcaption></figure>

#### Step 4: Request OTP

The resident clicks **Get OTP**. An OTP is sent to the resident’s registered mobile number or email address.

{% hint style="info" %}
**Note: OTP Delivery Update for eSignet Login**\
Previously, the eSignet login flow in the MOSIP Collab (Sandbox) environment used a static OTP (`111111`) for easy self-experience by the community. As per the latest MOSIP platform deployment, OTP delivery now works as follows:

* If you registered with a **valid, accessible email address**, the **OTP will be sent to that email**. Please ensure you use a valid, accessible email ID during self-registration to receive it directly.
* If you did not add a valid email during registration, **you can still get an OTP!** Go to [smtp.collab.mosip.net](http://smtp.collab.mosip.net) **(public mailbox) to get the OTP.**  (**Important:** You must refresh/reload the public mailbox ([smtp.collab.mosip.net](http://smtp.collab.mosip.net)) to clear any previous OTPs and then click Get OTP and use the newly received one to complete login.
{% endhint %}

<figure><img src="../../../../.gitbook/assets/image (6).png" alt=""><figcaption></figcaption></figure>

#### Step 5: Verify OTP

The resident enters the received OTP and clicks **Verify** to complete authentication.

<figure><img src="../../../../.gitbook/assets/image (7).png" alt=""><figcaption></figcaption></figure>

#### Step 6: Provide Consent

After successful authentication, the resident is redirected to the **Consent screen**.

* **Essential claims** required for eSIM allocation are mandatory
* **Voluntary claims** are optional and may be selected by the resident
* A **master toggle** allows selecting all voluntary claims at once
* The consent screen is shown only if consent has not been previously granted
* A timer is enforced; if no action is taken within the allowed time, the resident is redirected back to the eSIM portal

<figure><img src="../../../../.gitbook/assets/image (8).png" alt=""><figcaption></figcaption></figure>

#### Step 7: Confirm and Proceed

The resident reviews and selects the claims to be shared, then clicks _Allow_ to provide consent. Upon approval, the resident is redirected back to the eSIM Allocation Portal to continue the eSIM allocation process.

<figure><img src="../../../../.gitbook/assets/image (9).png" alt=""><figcaption></figcaption></figure>

#### Step 8: Select eSIM Plan

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
