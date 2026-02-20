# Verify by uploading the QR Code

## Verify by uploading the QR Code

1. **Upload QR Code:** - Go to the Inji Verify portal and select the tab **Upload QR Code** where the Upload QR code section will come up and click on the **Upload** button to initiate the process.

<figure><img src="../../../.gitbook/assets/image10.png" alt="" width="500"><figcaption><p>Desktop View</p></figcaption></figure>

<figure><img src="../../../.gitbook/assets/image11.png" alt="" width="150"><figcaption><p>Mobile View</p></figcaption></figure>

2. Click on the **"Upload"** button on the **Upload QR Code** Page as you select the option to upload a file containing the QR code or credential document you wish to verify from your device's (Desktop or Mobile browser) file explorer. Click on the file to proceed.
3. **How is QR Code decoded and verified once you have uploaded it?:** Inji Verify passes the QR data from the uploaded file to the Pixel Pass library for processing.
   * The QR data is passed to the Pixel Pass SDK for decoding.
   * Pixel Pass returns the decoded data to Inji Verify for further processing.
   * Inji Verify then verifies the decoded data using the Verification SDK.

<figure><img src="../../../.gitbook/assets/image12.png" alt="" width="500"><figcaption><p>Desktop View</p></figcaption></figure>

<figure><img src="../../../.gitbook/assets/image13.png" alt="" width="150"><figcaption><p>Mobile View</p></figcaption></figure>

4. **Display Credential Details:** - Upon successful verification, Inji Verify retrieves the display properties of the credential and presents the details on the portal's interface.

<figure><img src="../../../.gitbook/assets/image14.png" alt="" width="500"><figcaption><p>Desktop View</p></figcaption></figure>

<figure><img src="../../../.gitbook/assets/image9.png" alt="" width="150"><figcaption><p>Mobile View</p></figcaption></figure>

## VP Verification (Cross Device Flow)

1. **Initiate VP Request Process**

* Initiate VP Request Process by clicking on '**Request Verifiable Credentials'** to begin the verification process.

<figure><img src="../../../.gitbook/assets/image15.png" alt="" width="500"><figcaption></figcaption></figure>

2. **Select Credentials & Generate QR Code**: The verifier is presented with a list of verifiable credential types with specific credentials already pre-selected(configurable) based on a specific usecase.

* Pre-selected credential types are listed on the top and rest of the credentials (non-selected ones) are displayed in alphabetical order.
* The list of VCs can also be sorted in ascending or descending order using Sort option.
* Each credential type is displayed with a checkbox next to it.
* The verifier reviews the list and selects the desired credentials by clicking the checkboxes provided in the list.
* Verifier can also search for a credential by entering the credential type (1 or more letters to be entered in the search box and filtered results appear in the dropdown).

<figure><img src="../../../.gitbook/assets/image16.png" alt="" width="500"><figcaption></figcaption></figure>

* Choose the required verifiable credentials from the popup window and click '**Generate QR Code'**, If the verifier does not wish to select any credentials, he can click on Go Back Button. Clicking on it navigates to main screen of 'VP Verification' tab in Inji Verify portal

<figure><img src="../../../.gitbook/assets/image17.png" alt="" width="500"><figcaption></figcaption></figure>

3. **Scan QR Code from Mobile wallet (Use a Different Device)**: Use a wallet containing verifiable credentials on a different device with QR code scanning capabilities to scan the QR code.

<figure><img src="../../../.gitbook/assets/image18.png" alt="" width="500"><figcaption></figcaption></figure>

Note: The steps that Inji wallet performs to support this interaction are:

* The Wallet interprets the VP request and lists all the matching credentials available in the Wallet.
* The Wallet prompts the user to authenticate and then seeks consent to share the requested credential(s).
* The Wallet sends the VP response via HTTPS POST to the Inji Verify portal.

4. **View Verification Results in Inji Verify**: Inji Verify displays the verification results of the verifiable credentials shared from the wallet which could be either 'Valid', 'Valid\
   but Expired', 'Invalid'.

* **Single VC display**
  * **Valid VC**

<figure><img src="../../../.gitbook/assets/image19.png" alt="" width="500"><figcaption></figcaption></figure>

* Click on full screen option to view the Verifiable Credentials data as an enlarged view.

<figure><img src="../../../.gitbook/assets/image20.png" alt="" width="500"><figcaption></figcaption></figure>

* Click on download option to download the VC data as a json file.

<figure><img src="../../../.gitbook/assets/image21.png" alt="" width="500"><figcaption></figcaption></figure>

* **Expired VC**

<figure><img src="../../../.gitbook/assets/image22.png" alt="" width="500"><figcaption></figcaption></figure>

* **Invalid VC**

<figure><img src="../../../.gitbook/assets/image23.png" alt="" width="500"><figcaption></figcaption></figure>

* **Multiple VCs display**

<figure><img src="../../../.gitbook/assets/image24.png" alt="" width="500"><figcaption></figcaption></figure>

#### **Partial sharing of requested credentials**

If not all the requested VCs are shared from wallet, then the status of missing VC result area is displayed as 'Not Shared'

<figure><img src="../../../.gitbook/assets/image25.png" alt="" width="500"><figcaption></figcaption></figure>

As the verifier is informed of the missing credentials in VC result section, the verifier has to **either Generate Request for Missing Credentials or Generate a New Request for restarting the VP sharing flow.** The verifier can request for missing credentials by continuing the flow by clicking on 'Request Missing Credentials' to generate another QR code that requests the missing credentials.

Another button - 'Restart Process' helps user to re-initiate the VP Request process\
all over again (by displaying the popup window to select the credentials and rest of the process continues to be the same), if required.

**Re-Generate VP Request for missing VPs**

1. **Request Missing Credentials**: Upon clicking "Request Missing Credentials" button, the Verifier portal automatically identifies the credentials that were not received in the previous transaction. A new Verifiable Presentation (VP) request is generated, containing only the missing credentials.

<figure><img src="../../../.gitbook/assets/image26.png" alt="" width="500"><figcaption></figcaption></figure>

2. **QR Code/Link Display:**

* The new VP request is encoded into a QR code.
* The QR code is displayed on the Verifier portal and is ready for the Holder to scan or access.

<figure><img src="../../../.gitbook/assets/image27.png" alt="" width="500"><figcaption></figcaption></figure>

3. **Holder Interaction:**

* The Holder (Inji Wallet) scans the new QR code or accesses the link.
* The Wallet fetches the new VP request and lists the pending credentials (if they are available in the Wallet) along with the list of previously verified credentials from our original request.

<figure><img src="../../../.gitbook/assets/image28.png" alt="" width="500"><figcaption></figcaption></figure>

4. **Credential Sharing and Verification:**

* The process of selecting credentials, providing user consent, and sending the VP response follows the standard flow.
* The Verifier receives the pending credentials and completes the verification process.

<figure><img src="../../../.gitbook/assets/image26.png" alt="" width="500"><figcaption></figcaption></figure>

5. **Final Verification Completion:**

* Once all credentials are received and verified, the Verifier portal displays a final confirmation message indicating that all requested credentials have been successfully verified.
* The process is marked as complete.

<figure><img src="../../../.gitbook/assets/image29.png" alt="" width="150"><figcaption></figcaption></figure>

**Note:**

1. For any VCs displayed after verification, the verifier is provided with an option to download the VCs in json format.
2. For any VCs displayed after verification, the verifier is provided\
   with an option to expand the VCs to full view.

## VP Verification (Same Device Flow)

### Step 1: Initiate VP Request Process

Navigate to the **VP Verification** tab in Inji Verify on your mobile device.\
Click **Request Verifiable Credentials** to begin.

<figure><img src="../../../.gitbook/assets/eug-iv-vpv-sdf-1.png" alt="" width="200"><figcaption></figcaption></figure>

### Step 2: Select Credential Types

A popup titled **Verifiable Credential Selection Panel** appears.\
You can search, sort, and select the required credential types.\
Some credentials may be pre-selected based on configuration.

<figure><img src="../../../.gitbook/assets/eug-iv-vpv-sdf-2.png" alt="" width="200"><figcaption></figcaption></figure>

### Step 3: Open Wallet on Same Device

After selecting credentials, a **Wallet Selection Panel** appears listing available wallets on your mobile device.\
Select your preferred wallet. If only one wallet is available, you will be redirected automatically.

<figure><img src="../../../.gitbook/assets/eug-iv-vpv-sdf-3-1.png" alt="" width="200"><figcaption></figcaption></figure>

<figure><img src="../../../.gitbook/assets/eug-iv-vpv-sdf-3-2.jpg" alt="" width="200"><figcaption></figcaption></figure>

### Step 4: Deep Link to Wallet

The system invokes your wallet via deep link (e.g., `injiwallet://vp-request?...`).\
The wallet receives the authorization request with credential requirements.

### Step 5: Wallet Authentication & Consent

The wallet checks which credentials match the request.\
You are prompted to authenticate and provide consent to share the selected credentials.

<figure><img src="../../../.gitbook/assets/eug-iv-vpv-sdf-5-1.jpg" alt="" width="200"><figcaption></figcaption></figure>

<figure><img src="../../../.gitbook/assets/eug-iv-vpv-sdf-5-2.jpg" alt="" width="200"><figcaption></figcaption></figure>

### Step 6: Wallet Sends VP Response

The wallet prepares the Verifiable Presentation (VP) and returns the `vp_token` in an authorization response via redirect.

<figure><img src="../../../.gitbook/assets/eug-iv-vpv-sdf-6.jpg" alt="" width="200"><figcaption></figcaption></figure>

### Step 7: View Results in Inji Verify

Inji Verify parses the `vp_token`, validates claims, and displays the results.\
Credential status may be **Valid**, **Expired**, or **Invalid**.\
For multiple VCs, results are shown as expandable cards with tabular view for multi-attribute values.\
Options are provided to **Download JSON** or **Expand View**.

<figure><img src="../../../.gitbook/assets/eug-iv-vpv-sdf-7-1.jpg" alt="" width="200"><figcaption></figcaption></figure>

<figure><img src="../../../.gitbook/assets/eug-iv-vpv-sdf-7-2.png" alt="" width="200"><figcaption></figcaption></figure>

#### Credential Status Examples

* **Invalid VC display:**\
  \&#xNAN;_Shows the credential marked as invalid._

<figure><img src="../../../.gitbook/assets/eug-iv-vpv-sdf-invalid-vc-display.png" alt="" width="400"><figcaption></figcaption></figure>

* **Expired VC:**\
  \&#xNAN;_Shows the credential marked as expired._

<figure><img src="../../../.gitbook/assets/eug-iv-vpv-sdf-expired-vc.png" alt="" width="200"><figcaption></figcaption></figure>

### Same Device Flow Scenarios

* **Scenario 1:** All credentials shared → List of credentials with status.

<figure><img src="../../../.gitbook/assets/eug-iv-vpv-sdf-scenario-1-all-credentials-shared.png" alt="" width="200"><figcaption></figcaption></figure>

* **Scenario 2:** Partial sharing → Display missing credentials with options to **Request Missing Credentials** or **Restart Process**.

<figure><img src="../../../.gitbook/assets/eug-iv-vpv-sdf-scenario-2-all-credentials-shared.png" alt="" width="200"><figcaption></figcaption></figure>
