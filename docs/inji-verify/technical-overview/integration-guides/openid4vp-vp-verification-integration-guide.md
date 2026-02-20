# OpenID4VP Verification Integration Guide

### Introduction: Inji Verify SDK

The Inji Verify SDK is a library that exposes React components for seamlessly integrating Inji Verify features into any relying party or verifier application.

#### Features

* The **OpenID4VP component** is responsible for generating a QR code and managing the backend flow for credential sharing using the OpenID4VP protocol.
  * This enables a **cross-device flow**, where users can scan the QR code on a different device (e.g., mobile wallet) to securely present their credentials.
  * The detailed steps for performing this flow are available in the [End User Guide](../../functional-overview/end-user-guide/).
* The **QRCodeVerification component** allows verifiers to validate verifiable credentials by either:
  * **Scanning** a QR code, or
  * **Uploading** an image containing the QR code.
  * This enables flexible verification flows for both in-person and remote use cases.
  * The detailed steps for using this component are provided in the [End User Guide](../../functional-overview/end-user-guide/).

#### Usage

`npm i @mosip/react-inji-verify-sdk`

[npm](https://www.npmjs.com/package/@mosip/react-inji-verify-sdk)

#### Peer Dependencies

| Name       | Version |
| ---------- | ------- |
| React      | 18.2.0  |
| Typescript | 4.9.5   |

### Local NPM Publishing Steps

1. Install the dependencies `npm install`
2. Build the project`npm run build`
3. Publish the npm package using Verdaccio, We use [verdaccio](https://verdaccio.org/docs/what-is-verdaccio). npm link or yarn link won't work as we have peer dependencies. Follow the docs to setup Verdaccio. Then run npm publish `--registry <http://localhost:<VERADACCIO_PORT>>`

## Integration Guide

#### OpenID4VP Verification

This guide walks you through integrating the **OpenID4VP verification component** into your React TypeScript project. It facilitates Verifiable Presentation (VP) verification using the OpenID4VP protocol and supports flexible workflows, including client-side and backend-to-backend verification.

#### Prerequisites

* React Project Setup
* Proper permissions for camera access (mobile/web) (QRCodeVerification)

{% hint style="warning" %}
**Note**\
The component is written in **React** + **TypeScript**. The component does not support other frontend frameworks like Angular, Vue, or React Native.
{% endhint %}

#### Backend Requirements

To use the component, you must host a verification backend that implements the OpenID4VP protocol. This backend is referred to as the inji-verify-service. It also needs to adhere to the OpenAPI spec defined here in case the backend service is not inji-verify-service.

{% hint style="success" %}
**Important**:

* The component expects these endpoints to be accessible via a base URL (verifyServiceUrl).
{% endhint %}

**Example**

If you deploy the inji-verify/verify-service at:[https://injiverify-service.example.com](https://injiverify-service.example.com)\ Then use this as the verifyServiceUrl in the component:\ verifyServiceUrl="[https://injiverify-service.example.com/v1/verify](https://injiverify-service.example.com/v1/verify)"

### Installation

`npm i @mosip/react-inji-verify-sdk`

### Component Props

**Exclusive Verification Flows**\
Exactly one of the following props must be provided (mutually exclusive):

| Prop                                         | Description                                       |
| -------------------------------------------- | ------------------------------------------------- |
| onVpReceived(txnId: string)                  | Use when your backend fetches the VP result later |
| onVpProcessed(vpResult: VerificationResults) | Use when the frontend needs the result directly   |

**Presentation Definition Options**

Only one of the following should be provided:

| Prop                     | Description                                         |
| ------------------------ | --------------------------------------------------- |
| presentationDefinitionId | Fetch a predefined definition from the backend      |
| presentationDefinition   | Provide the full definition inline as a JSON object |

**Example — Inline presentationDefinition Usage**

If you want to directly provide a Presentation Definition instead of fetching it by ID, you can pass it like this:

```js
presentationDefinition = {
  id: "c4822b58-7fb4-454e-b827-f8758fe27f9a",
  purpose:
    "Relying party is requesting your digital ID for the purpose of Self-Authentication",
  format: {
    ldp_vc: {
      proof_type: ["Ed25519Signature2020"],
    },
  },
  input_descriptors: [
    {
      id: "id card credential",
      format: {
        ldp_vc: {
          proof_type: ["Ed25519Signature2020"],
        },
      },
      constraints: {
        fields: [
          {
            path: ["$.type"],
            filter: {
              type: "object",
              pattern: "LifeInsuranceCredential",
            },
          },
        ],
      },
    },
  ],
};
```

**Tips**:\
If you use presentationDefinition, **do not** pass `presentationDefinitionId`, and vice versa.

**Required Props**

| Prop             | Type                 | Description                                     |
| ---------------- | -------------------- | ----------------------------------------------- |
| verifyServiceUrl | string               | Base URL for your verification backend          |
| protocol         | string               | Protocol for QR (e.g.: "openid4vp://")          |
| clientId         | string               | Unique client identifier for the relaying party |
| onQrCodeExpired  | () => void           | Callback when QR expires                        |
| onError          | (err: Error) => void | Error handler callback                          |

**Note:**\
`clientId` can be provided in either of the following formats:

* **DID-based identifier:**\
  Example: `did:web:verifier.example.com`
* **Standard URL or string:**\
  Example: `https://verifier.example.com` or `my-relaying-party`

**Optional Props**

| Prop                    | Type            | Description                                         |
| ----------------------- | --------------- | --------------------------------------------------- |
| triggerElement          | React.ReactNode | Element that triggers verification (e.g., a button) |
| transactionId           | string          | Optional external tracking ID                       |
| qrCodeStyles            | object          | Customize QR appearance (size, color, margin, etc.) |
| isSameDeviceFlowEnabled | boolean         | Enables Same-Device flow if true (default: true)    |

### Same Device Flow Support

If `isSameDeviceFlowEnabled={true}` (default):

* **On Mobile or Tablet:**\
  The component automatically redirects the user to the OpenID4VP URL.
  * If multiple compatible wallet apps are installed, the OS prompts the user to select one.
  * If only one wallet app is available, it opens directly.
* **On Desktop or when `isSameDeviceFlowEnabled={false}`:**\
  The component displays a QR code for cross-device scanning. Users can scan the QR code with a wallet app on a separate device to complete verification.

### Integration Examples

#### VP Result via UI (frontend receives result)

```jsx
<OpenID4VPVerification
  triggerElement={<button>Start VP Verification</button>}
  protocol="openid4vp://"
  verifyServiceUrl="<https://verifier.example.com/v1/verify>"
  presentationDefinitionId="example-definition-id"
  onVpProcessed={(vpResult) => {
    console.log("VP Verified:", vpResult);
  }}
  onQrCodeExpired={() => alert("QR expired")}
  onError={(err) => console.error("Verification error:", err)}
/>
```

#### VP Result via Backend (frontend just gets txnId)

```jsx
<OpenID4VPVerification
  triggerElement={<button>Verify using Wallet</button>}
  protocol="openid4vp://"
  verifyServiceUrl="<https://verifier.example.com/v1/verify>"
  presentationDefinition={{
    id: "custom-def",
    input_descriptors: [/* your PD here */],
  }}
  onVpReceived={(txnId) => {
    // Send txnId to your backend to fetch the result later
    console.log("VP submission received, txn ID:", txnId);
  }}
  onQrCodeExpired={() => alert("QR expired")}
  onError={(err) => console.error("Verification error:", err)}
/>
```

#### Component Testing & Edge Case Validation

* **Simulate Wallet Scan**
  * Use a mobile wallet app that supports **OpenID4VP**, or mock tools, to scan the generated QR code.
* **Trigger Expiry**
  * Do not scan the QR code and wait until it expires.
  * Confirm that the `onQrCodeExpired` event is triggered.
* **Force Error Scenarios**
  * Stop the backend service or simulate a **500 Internal Server Error**.
  * Test with missing required props or by providing both exclusive callbacks, and verify that validation handles these cases correctly.

## QR Code Verification

This guide explains how to integrate the **QR Code Verification** component into your React TypeScript project. The component enables two main verification flows:

* **QR Code Scanning** – Allow users to scan a QR code for credential verification.
* **Image Upload** – Let users upload an image containing a QR code for verification.

It supports both **client-side verification** and **backend-to-backend verification**, making it flexible for different application needs.

### Component Props

#### Required Props

| Prop                          | Type                   | Description                                            |
| ----------------------------- | ---------------------- | ------------------------------------------------------ |
| verifyServiceUrl              | string                 | Backend service URL for VC submission or verification. |
| onError                       | (error: Error) => void | Callback triggered on errors during scanning/upload.   |
| onVCReceived or onVCProcessed | See below              | Only one of these callbacks should be provided.        |

### Callback Types

The `QRCodeVerification` component supports two mutually exclusive callback types. You must use **only one** of the following:

**1. onVCReceived**

```ts
onVCReceived: (txnId: string) => void;
```

* Triggered when a Verifiable Presentation (VP) is **received and submitted** to the backend.
* Returns the **transaction ID** for tracking purposes.

**2. onVCProcessed**

```ts
onVCProcessed: (vpResult: VerificationResults) => void;
```

* Triggered when the VP is **fully verified**.
* Returns an **array of verification results** with the status of each VC:

```ts
type VerificationResult = {
  vc: unknown;
  vcStatus: "SUCCESS" | "INVALID" | "EXPIRED";
};

type VerificationResults = VerificationResult[];
```

⚠️ **Note:** `onVCReceived` and `onVCProcessed` **cannot be used** simultaneously

### Optional Props

| Prop              | Type                | Default                 | Description                                                             |
| ----------------- | ------------------- | ----------------------- | ----------------------------------------------------------------------- |
| triggerElement    | React.ReactNode     | null                    | Optional trigger to initiate the scan/upload (e.g., a button or label). |
| transactionId     | string              | null                    | Optional external tracking ID                                           |
| uploadButtonId    | string              | "upload-qr"             | Custom ID for upload button.                                            |
| uploadButtonStyle | React.CSSProperties | "upload-button-default" | Inline style object to apply custom styling to the upload button.       |
| isEnableUpload    | boolean             | true                    | Enables/disables QR-CODE image upload.                                  |
| isEnableScan      | boolean             | true                    | Enables/disables camera scanning.                                       |
| isEnableZoom      | boolean             | true                    | Enables camera zoom on mobile devices.                                  |

### Upload Support

Upload supports the following image types:

* PNG
* JPEG
* JPG
* PDF

You can customize the upload button’s style using uploadButtonStyle, and control its placement with uploadButtonId.

### Callback Behaviour

* onVCReceived: Used when you want the VC sent to a backend and just need a txnId response.
* onVCProcessed: Used for apps that handle VC verification client-side and want full VC + status.
* onError: Handles all runtime, parsing, and scanning errors.

The component will clean up camera streams and timers on unmount.

#### Example with onVCProcessed

```jsx
<QRCodeVerification 
    verifyServiceUrl="https://your-api/verify"
    onVCProcessed={(vpResult) => { console.log("VC + Status:", vpResult)}}
    onError={(e) => console.error("Error:", e.message)} 
    triggerElement={<div className="btn-primary">Verify Now</div>} 
/>
```

### Basic Usage

```ts
import {QRCodeVerification} from "@mosip/react-inji-verify-sdk";
const App = () => {
  const handleVCReceived = (txnId: string) => {
    console.log("txnId received from VC submission:", txnId);
  };
  const handleError = (error: Error) => {
    console.error("Verification Error:", error.message);
  };
  return (
    <QRCodeVerification
      verifyServiceUrl="https://your-backend/verify"
      onVCReceived={handleVCReceived}
      onError={handleError}
      triggerElement={<button>Start Verification</button>}
    />
  );
};
```

### Redirect Behavior

When using **Online Share QR Code**, the user is redirected to the client (issuer) server for processing, and then sent **back to the RP’s root path (**/**)** with the vp\_token in the **URL fragment**:

```
https://your-rp-domain.com/#vp_token=<base64url-encoded-token> 
```

## Compatibility & Scope

**Supported**

* ReactJS (with TypeScript)
* Modern React projects (17+)

**Not Supported**

* React Native
* Angular, Vue, or other frontend frameworks
* SSR frameworks like Next.js without customization
