# Inji Verify SDK

### OpenID4VPVerification Component

**The below diagram illustrates the flow in which Relaying party UI is directly fetching the result from verify backend. Which is the current implementation of Inji Verify UI.**

```mermaid
sequenceDiagram
    participant Verify Backend
    participant Relying Party UI
    participant OPENID4VP UI Component
    participant Wallet
    
     Relying Party UI--)OPENID4VP UI Component: Provide : <br> triggerElement? <br> verifyServiceUrl <br> transactionId? <br>  presentationDefinitionId? <br> presentationDefinition? <br> onVpProcessed? (Callback) <br> onQrCodeExpired (Callback) <br> onError (Callback) 
    Relying Party UI--)Relying Party UI: OnClick Trigger Element/upon opening the integrated component
    OPENID4VP UI Component->>Verify Backend: Create a Autherization Request (verifyServiceUrl/vp-request) 
    Verify Backend--)Verify Backend: Process the request,<br> Generate txnId if not provided, <br> create and return Autherization Request response
    Verify Backend->>OPENID4VP UI Component: Autherization Request Response
    OPENID4VP UI Component--)OPENID4VP UI Component: Generate QR Code with response
    OPENID4VP UI Component--)OPENID4VP UI Component: Polling Status verifyServiceUrl/vp-request/${reqId}/status (ACTIVE, VP_SUBMITTED, EXPIRED)
    Wallet--)Wallet: Scan QR Code
    Wallet--)Wallet: Process the QR Data and List the matching VC's
    Wallet->>Verify Backend: Authenticate User & Submitts VP Token <br> (verifyServiceUrl/vp-submission/direct-post)
    Verify Backend->>OPENID4VP UI Component: Status
    OPENID4VP UI Component->>Verify Backend: Status == VP_SUBMITTED and onVpProcessed is passed then fetch result <br> (verifyServiceUrl/vp-result/${txnId})
    Verify Backend->>OPENID4VP UI Component: Using txn_Id the server will fetch the data from DB and validate it using VC-Verifier library and return the response
    OPENID4VP UI Component->>Relying Party UI: Trigger onVpProcessed callback with Result (claims)
    Note over OPENID4VP UI Component,Relying Party UI: flow Ends and controll possesed to Relying Party UI
```

1. **Relying Party UI initiates the process:** The user interacts with the Relying Party's User Interface (UI) and triggers a verification action.
2. **OPENID4VP UI Component communicates with Verify Backend:** Upon the user's action, the Relying Party UI sends a request to Verify Backend. This request contains information needed to initiate the verification.
3. **Verify Backend processes the request:** The Verify Backend receives the request from the UI. It then processes this request. As part of the processing, the Verify Backend creates an Authorization Request.
4. **Verify Backend sends the Authorization Request to the OPENID4VP UI Component:** The generated Authorization Request is then sent back to the Relying Party UI ( OPENID4VP UI Component ).
5. **OPENID4VP UI Component generates a QR Code:** The component receives the Authorization Request and, based on its content, generates a QR code. This QR code will contain information that the user's wallet can scan. The generated QR code is then presented to the user through the Relying Party UI.
6. **OPENID4VP UI Component Starts Status polling a QR Code:** The component starts to poll for the current status of the Authorization request created.
7. **User scans the QR Code with their Wallet:** The user uses their digital wallet application to scan the QR code displayed by the Relying Party UI.
8. **Wallet processes the QR Code and matching VC(s):** The user's wallet application reads the data from the QR code and identifies the Verifiable Credential(s) (VCs) that are relevant to the verification request.
9. **Wallet authenticates the user and submits the VP Token:** The user authenticates themselves within their wallet application. Following authentication, the wallet constructs a Verifiable Presentation (VP) Token containing the necessary VCs and submits it to the Verify Backend (via a direct post to verifyService/vp-submission/direct-post).
10. **Verify Backend sends a Status update to the OPENID4VP UI Component:** Based on the validation result, the Verify Backend sends a status update to the OPENHVP UI Component. This status could indicate success (VP\_SUBMITTED), ongoing processing (ACTIVE), or failure (EXPIRED).
11. **Flow Ends and Control is passed to the Relying Party UI:** The core verification flow concludes, and the Relying Party UI now has the status of the verification.
12. **Relying Party UI passes the transaction result to the Relying Party Backend:** The Relying Party UI communicates the outcome of the verification (including the verifyService/vp-result and potentially the transaction details) to its backend (Relying Party Backend).
13. **Relying Party Backend acts based on the verification result:** The Relying Party Backend receives the verification result and proceeds with the next steps in its application logic based on whether the verification was successful or not.

**The below diagram illustrates the flow in which a authorization request gets expired.**

```mermaid

sequenceDiagram
    participant Verify Backend
    participant Relying Party UI
    participant OPENID4VP UI Component
    participant Wallet


    Verify Backend->>OPENID4VP UI Component: Status
    OPENID4VP UI Component->>Relying Party UI: Status == EXPIRED then onQrCodeExpired callback triggered.
```

1. **OPENID4VP UI Component sends a Status update:** The Verify Backend sends a Status update to the OPENID4VP UI Component. At this point, the status is something like EXPIRED or PENDING, indicating that the QR code is currently valid.
2. **Time passes and the QR code expires:** The Verify Backend sends a Status update to the OPENID4VP UI Component. At this point, the status is EXPIRED, indicating that the authorization request is currently expired valid.
3. **OPENID4VP UI Component triggers the** onQrCodeExpired **callback:** Upon detecting the expiration, the OPENID4VP UI Component triggers a callback function onQrCodeExpired .

**The below diagram illustrates the flow in which an error occurs**

```mermaid
sequenceDiagram
    participant Verify Backend
    participant Relying Party UI
    participant OPENID4VP UI Component
    participant Wallet
    OPENID4VP UI Component--)OPENID4VP UI Component: If any error occurs before successful verification <br> (e.g., during QR code decoding, redirect issues, backend communication errors)
    OPENID4VP UI Component->>Relying Party UI: Trigger onError callback with error details.
```

1. **An error occurs at OPENID4VP UI Component :** An error occurs at OPENID4VP UI Component due to some response error, exceptions or expected errors.
2. **OPENID4VP UI Component triggers the** onError **callback:** Upon detecting the\
   error, the OPENID4VP UI Component triggers a callback function onError .

**There is an alternate flow available to implement if the Relaying party has a backend and the results needs to be fetched in the backend. The below diagram illustrates the flow in which Relaying party backend is directly fetching the result from verify backend.**

```mermaid
sequenceDiagram
    participant Relying Party Backend
    participant Verify Backend
    participant Relying Party UI
    participant OPENID4VP UI Component
    participant Wallet


    Relying Party UI--)OPENID4VP UI Component: Provide : <br> triggerElement? <br> verifyServiceUrl <br> transactionId? <br>  presentationDefinitionId? <br> presentationDefinition? <br> onVpReceived? (Callback) <br> onQrCodeExpired (Callback) <br> onError (Callback) 
    Relying Party UI--)Relying Party UI: OnClick Trigger Element/upon opening the integrated component
    OPENID4VP UI Component->>Verify Backend: Create a Autherization Request (verifyServiceUrl/vp-request) 
    Verify Backend--)Verify Backend: Process the request,<br>Generate txnId if not provided<br> create and return Autherization Request response
    Verify Backend->>OPENID4VP UI Component: Autherization Request Response
    OPENID4VP UI Component--)OPENID4VP UI Component: Generate QR Code with response
    OPENID4VP UI Component--)OPENID4VP UI Component: Polling Status verifyServiceUrl/vp-request/${reqId}/status (ACTIVE, VP_SUBMITTED, EXPIRED)
    Wallet--)Wallet: Scan QR Code
    Wallet--)Wallet: Process the QR Data and List the matching VC's
    Wallet->>Verify Backend: Authenticate User & Submitts VP Token <br> (verifyServiceUrl/vp-submission/direct-post)
    Verify Backend->>OPENID4VP UI Component: Status
    OPENID4VP UI Component->>Relying Party UI: Status == VP_SUBMITTED and onVpReceived is passed <br>Trigger onVPReceived callback with transactionId
    Note over OPENID4VP UI Component,Relying Party UI: flow Ends and controll possesed to Relying Party UI
    Relying Party UI->>Relying Party Backend: Pass the transactionId to the relying party backend
    Relying Party Backend->>Verify Backend: verifyServiceUrl/vp-result/${transactionId}
    Note over Relying Party Backend,Relying Party UI: flow continues 
```

1. **Relying Party UI initiates the process:** The user interacts with the Relying Party's User Interface (UI) and triggers a verification action.
2. **OPENID4VP UI Component communicates with Verify Backend:** Upon the user's action, the Relying Party UI sends a request to Verify Backend. This request contains information needed to initiate the verification.
3. **Verify Backend processes the request:** The Verify Backend receives the request from the UI. It then processes this request. As part of the processing, the Verify Backend creates an Authorization Request.
4. **Verify Backend sends the Authorization Request to the OPENID4VP UI Component:** The generated Authorization Request is then sent back to the Relying Party UI ( OPENID4VP UI Component ).
5. **OPENID4VP UI Component generates a QR Code:** The component receives the Authorization Request and, based on its content, generates a QR code. This QR code will contain information that the user's wallet can scan. The generated QR code is then presented to the user through the Relying Party UI.
6. **OPENID4VP UI Component Starts Status polling a QR Code:** The component starts to poll for the current status of the Authorization request created.
7. **User scans the QR Code with their Wallet:** The user uses their digital wallet application to scan the QR code displayed by the Relying Party UI.
8. **Wallet processes the QR Code and matching VC(s):** The user's wallet application reads the data from the QR code and identifies the Verifiable Credential(s) (VCs) that are relevant to the verification request.
9. **Wallet authenticates the user and submits the VP Token:** The user authenticates themselves within their wallet application. Following authentication, the wallet constructs a Verifiable Presentation (VP) Token containing the necessary VCs and submits it to the Verify Backend (via a direct post to verifyService/vp-submission/direct-post).
10. **Verify Backend sends a Status update to the OPENID4VP UI Component:** Based on the validation result, the Verify Backend sends a status update to the OPENHVP UI Component. This status could indicate success (VP\_SUBMITTED), ongoing processing (ACTIVE), or failure (EXPIRED).
11. **OPENID4VP UI Component triggers 'onProcessed' callback with the result:** When the status indicates VP\_SUBMITTED and the onProcessed callback is passed, the OPENID4VP UI Component triggers this callback, providing the result of the initial submission.
12. **Relying Party UI receives the final result via the 'onProcessed' callback:** The Relying Party UI receives the final verification result through the onProcessed callback, which now includes the validated claims.
13. **Flow Ends and Control is passed to the Relying Party UI:** The complete verification flow concludes, and the Relying Party UI can now use the validated claims to proceed with the application logic.

### Scan/Upload Component

**The below diagram illustrates the flow in which Relaying party UI is directly fetching the result from verify backend. Which is the current implementation of Inji Verify UI.**

```mermaid
sequenceDiagram
    participant Verify Backend
    participant Relying Party UI
    participant QR Code Handler
    note right of QR Code Handler: (Scan/Upload UI Component)
    participant Online VC Provider
    actor User



    Relying Party UI --) QR Code Handler: Provide: <br> triggerElement? <br> verifyServiceUrl <br> onVcProcessed? (Callback) <br> onError (Callback) <br> isEnableZoom? <br> isEnableScan? <br> isEnableUpload?     
    Relying Party UI --) Relying Party UI: OnClick triggerElement/upon opening the component
    alt isEnableScan and isEnableUpload
        QR Code Handler ->> Relying Party UI: Triggers onError("Either scan or upload must be enabled.")
        Note over QR Code Handler, Relying Party UI: Error returned immediately
    else 
    end
    alt User Chooses to Upload and isEnableScan
            User ->> QR Code Handler: Upload QR Code <br> formats - PNG/JPEG/JPG/PDF <br> Size - 10KB to 5MB
    else User Chooses to Scan and isEnableUpload
            User ->> QR Code Handler: Scan QR Code
    end
    alt QRCODE = Embedded vc
        QR Code Handler --) QR Code Handler: Decode QR Data using Pixelpass Library <br> (QR Code == Embedded VC)
    else QRCODE = Datashare URL
        QR Code Handler --) QR Code Handler: Decode QR Data using Pixelpass Library <br> (QR Code == Datashare URL)
        QR Code Handler ->> Online VC Provider: Redirect to Datashare URL <br> (with parameters)
       Online VC Provider --) Online VC Provider: Validate Data Share, Signature, etc.
        Online VC Provider ->> QR Code Handler: Redirect to `redirect_uri` <br> (with vp_token & presentation_submission)
    end
    QR Code Handler ->> Verify Backend: request for vc verification result <br> `verifyServiceUrl/vc-verification`
    Verify Backend --) Verify Backend: Validate VC using VC-Verifier Library
    Verify Backend ->> QR Code Handler: Return verification status <br> (valid, invalid, expired)
    QR Code Handler ->> Relying Party UI: Triggers onVcProcessed with the verification result(vc,status)
    Note over QR Code Handler, Relying Party UI: Flow ends and passes control to Relying Party UI
```

1. **Initial Component Trigger and State (Relying Party UI):**

* **Provider triggers component display:** The Relaying Party initiates the process by initializing the QRCodeVerification component. This call includes several parameters:
  * triggerElement: The HTML element that triggers the component.
  * verifyServiceUrl: The backend service URL.
  * onVcReceived: A callback function for when the VC is received.
  * onError: A callback function for error handling.
  * isEnableZoom: A boolean to enable the zoom option.
  * isEnableUpload: A boolean to enable the upload option.
  * isEnableScan: A boolean to enable the scan option.
* **On-click trigger opens component (Relying Party UI):** An onClick event on the Relying Party UI opens the component.

2. **Handling Initial Errors (Relying Party UI):**
   1. **Error returned immediately:** If both isEnableScan and isEnableUpload are enabled (meaning neither scan nor upload is allowed), the component immediately returns an error.
3. **User Interaction and QR Code Handling (User, Relying Party UI, QR Code Handler):**
   1. **User chooses to upload and disable scan:** The User makes a choice within the Relying Party UI to upload a QR code and disables the scan option.
   2. **Upload QR code:** The Relying Party UI then handles the upload of the QR code, specifying accepted formats (PNG, JPEG, JPG, PDF).
   3. **User chooses to scan and disable upload:** Alternatively, the User can choose to scan a QR code and disable the upload option.
   4. **Scan QR Code:** The Relying Party UI proceeds with scanning the QR code.
   5. **QR Code Handler processes:** In both upload and scan scenarios, the QR Code Handler receives the QR code data.
4. **Decoding QR Code Data (QR Code Handler, Online VC Provider):**
   1. **Decode QR data (Embedded VC):** If the QR code contains an embedded Verifiable Credential (VC), the QR Code Handler decodes the QR data using the Pixelpass Library. This results in an embedded VC.
   2. **Decode QR data (Datashare URL):** If the QR code contains a URL for the Online VC Provider, the QR Code Handler decodes the QR data using the Pixelpass Library to extract the Datashare URL.
5. **Interaction with Online VC Provider and Redirection (QR Code Handler, Online VC Provider, Relying Party UI):**
   1. **Redirect to Datashare URL:** If an Datashare URL was obtained, the QR Code Handler redirects to this Datashare URL, passing along relevant parameters.
   2. **Validate data (Online VC Provider):** The Online VC Provider validates data such as the signature.
   3. **Redirect to** redirect\_ur&#x6C;**:** The Online VC Provider then redirects back to a redirect\_url, including the vp\_token and presentation\_submission.
6. **Verification (QR Code Handler,** **Relying Party UI, Verify Backend):**
   1. **Request for VC verification result (QR Code Handler to Verify Backend):** The component requests the Verifiable Credential verification result from the Verify Backend using the decoded VC (verifyServiceUrl/vc-verification).
   2. **Validate VC using VC Verifier Library (Verify Backend):** The Verify Backend validates the Verifiable Credential (VC) using the internal VC Verifier Library.
   3. **Triggers** onVcProcessed **with the verification result (Relying Party UI):** The onVcProcessed callback on the Relying Party UI is triggered with the vc and status.

**The below diagram illustrates the flow in which an error occurs**

```mermaid

sequenceDiagram
    participant Verify Backend
    participant Relying Party UI
    participant QR Code Handler
    note right of QR Code Handler: (Scan/Upload UI Component)
    actor User



    QR Code Handler --) QR Code Handler: Error Encountered (anywhere before successful verification)
    QR Code Handler ->> Relying Party UI: Trigger onError callback <br> (with error details)
```

1. **Initiation of Scan/Upload UI Component (User, QR Code Handler):**

* **Scan/Upload UI Component:** The User interacts with a "Scan/Upload UI Component." This component is likely facilitated or provided by the QR Code Handler as suggested by the previous diagrams where the QR Code Handler was responsible for scanning/uploading.

2. **Error :**

* **Error Encountered (anywhere before successful verification):** An error occurs at some point in the process _before_ a successful verification can be achieved. This implies that the error can originate from various points:
  * Within the QR Code Handler (e.g., failed scan, invalid QR code format, network issues during OVP URL redirection).
  * Within the Relying Party UI (e.g., issues with component rendering, user input validation failures).
  * During communication between the Relying Party UI and QR Code Handler.
  * During communication between Relying Party UI and Verify Backend, or Relying Party Backend and Verify Backend.

3. **Error Handling and Callback (QR Code Handler, Relying Party UI):**

* **Trigger** onError callback (with error details): When the error is encountered, the component or module where the error occurred is responsible for triggering an onError callback function. This callback is directed towards the Relying Party UI.

**There is an alternate flow available to implement if the Relaying party has a backend and the results needs to be fetched in the backend. The below diagram illustrates the flow in which Relaying party backend is directly fetching the result from verify backend.**

```mermaid

sequenceDiagram
    participant Relying Party Backend
    participant Verify Backend
    participant Relying Party UI
    participant QR Code Handler
    note right of QR Code Handler: (Scan/Upload UI Component)
    participant Online VC Provider
    actor User

   Relying Party UI --) QR Code Handler: Provide: <br> triggerElement? <br> verifyServiceUrl <br> onVcProcessed? (Callback) <br> onError (Callback) <br> isEnableZoom? <br> isEnableScan? <br> isEnableUpload?     
    Relying Party UI --) Relying Party UI: OnClick triggerElement/upon opening the component
    alt isEnableScan and isEnableUpload
        QR Code Handler ->> Relying Party UI: Triggers onError("Either scan or upload must be enabled.")
        Note over QR Code Handler, Relying Party UI: Error returned immediately
    else 
    end
    alt User Chooses to Upload and isEnableScan
            User ->> QR Code Handler: Upload QR Code <br> formats - PNG/JPEG/JPG/PDF <br> Size - 10KB to 5MB
    else User Chooses to Scan and isEnableUpload
            User ->> QR Code Handler: Scan QR Code
    end
    alt QRCODE = Embedded vc
        QR Code Handler --) QR Code Handler: Decode QR Data using Pixelpass Library <br> (QR Code == Embedded VC)
    else QRCODE = Datashare URL
        QR Code Handler --) QR Code Handler: Decode QR Data using Pixelpass Library <br> (QR Code == Datashare URL)
        QR Code Handler ->> Online VC Provider: Redirect to Datashare URL <br> (with parameters)
        Online VC Provider --) Online VC Provider: Validate Data Share, Signature, etc.
        Online VC Provider ->> QR Code Handler: Redirect to `redirect_uri` <br> (with vp_token & presentation_submission)
    end
    QR Code Handler ->> Verify Backend: Send VC  <br> `verifyServiceUrl/vc-submission`
    Verify Backend ->> QR Code Handler: sends uuid in response
    QR Code Handler --) QR Code Handler: onVcReceived is passed then then trigger the Callback with uuid
    QR Code Handler ->> Relying Party UI: Triggers onVcReceived with the verification result(vc,status)
    Note over QR Code Handler, Relying Party UI: Flow ends and passes control to Relying Party UI
    Relying Party UI ->> Relying Party Backend: Pass the uuid to the relying party backend
    Relying Party Backend ->> Verify Backend: request for vp verification result <br> `verifyServiceUrl/vc-verification/uuid`
    Verify Backend --) Verify Backend: Validate VC using VC-Verifier Library
    Verify Backend ->> Relying Party Backend: Return verification status <br> (valid, invalid, expired)
```

1. **Initial Component Trigger and State (Relying Party UI):**

* **Provider triggers component display:** The Relaying Party initiates the process by initializing the QRCodeVerification component. This call includes several parameters:
  * triggerElement: The HTML element that triggers the component.
  * verifyServiceUrl: The backend service URL.
  * onVcReceived: A callback function for when the VC is received.
  * onError: A callback function for error handling.
  * isEnableZoom: A boolean to enable the zoom option.
  * isEnableUpload: A boolean to enable the upload option.
  * isEnableScan: A boolean to enable the scan option.
* **On-click trigger opens component (Relying Party UI):** An onClick event on the Relying Party UI opens the component.

2. **Handling Initial Errors (Relying Party UI):**
   1. **Error returned immediately:** If both isEnableScan and isEnableUpload are enabled (meaning neither scan nor upload is allowed), the component immediately returns an error.
3. **User Interaction and QR Code Handling (User, Relying Party UI, QR Code Handler):**
   1. **User chooses to upload and disable scan:** The User makes a choice within the Relying Party UI to upload a QR code and disables the scan option.
   2. **Upload QR code:** The Relying Party UI then handles the upload of the QR code, specifying accepted formats (PNG, JPEG, JPG, PDF).
   3. **User chooses to scan and disable upload:** Alternatively, the User can choose to scan a QR code and disable the upload option.
   4. **Scan QR Code:** The Relying Party UI proceeds with scanning the QR code.
   5. **QR Code Handler processes:** In both upload and scan scenarios, the QR Code Handler receives the QR code data.
4. **Decoding QR Code Data (QR Code Handler, Online VC Provider):**
   1. **Decode QR data (Embedded VC):** If the QR code contains an embedded Verifiable Credential (VC), the QR Code Handler decodes the QR data using the Pixelpass Library. This results in an embedded VC.
   2. **Decode QR data (Datashare URL):** If the QR code contains a URL for the Online VC Provider, the QR Code Handler decodes the QR data using the Pixelpass Library to extract the Datashare URL.
5. **Interaction with Online VC Provider and Redirection (QR Code Handler, Online VC Provider, Relying Party UI):**
   1. **Redirect to Datashare URL:** If an Datashare URL was obtained, the QR Code Handler redirects to this Datashare URL, passing along relevant parameters.
   2. **Validate data (Online VC Provider):** The Online VC Provider validates data such as the signature.
   3. **Redirect to** redirect\_ur&#x6C;**:** The Online VC Provider then redirects back to a redirect\_url, including the vp\_token and presentation\_submission.
6. **Verification and Submission (Relying Party UI, Verify Backend, Relying Party Backend):**
   1. **Send VC (Relying Party UI to Verify Backend):** The Relying Party UI sends the Verifiable Credential (VC) to the Verify Backend for verifyServiceUrl/vc-submission
   2. **Sends UUID in response (Verify Backend to Relying Party UI):** The Verify Backend sends a UUID back to the Relying Party UI in response.
   3. **Trigger** onVcReceived **(Relying Party UI):** The onVcReceived callback function on the Relying Party UI is triggered, passing the vc\_status (verification result).
   4. **Flow ends and passes control to Relying Party UI:** The main flow concludes, and control is passed back to the Relying Party UI.
   5. **Pass UUID to Relying Party Backend:** The Relying Party UI passes the received UUID to the Relying Party Backend.
   6. **Request for VP verification result (Relying Party Backend to Verify Backend):** The Relying Party Backend requests the Verifiable Presentation (VP) verification result from the Verify Backend using the UUID (verifyServiceUrl/vc-verification/{uuid}).
   7. **Validate VC using VC Verifier Library (Verify Backend):** The Verify Backendvalidates the Verifiable Credential (VC) using a VC Verifier Library.
   8. **Return verification status (Verify Backend to Relying Party Backend):** Finally, the Verify Backend returns the verification status (e.g., valid, invalid, expired) to the Relying Party Backend.
