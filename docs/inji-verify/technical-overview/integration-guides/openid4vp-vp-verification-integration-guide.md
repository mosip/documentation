# OpenID4VP-VP Verification Integration Guide

## Inji Verify SDK

Inji Verify SDK is a library which exposes **React** components for integrating Inji Verify features seamlessly into any relaying party application.

### Features

* OpenId4VP component that creates QR code and performs OpenId4Vp sharing backend flow. OpenID4VP cross device flow can be performed by following the steps provided in [End User Guide](https://mosip.atlassian.net/wiki/spaces/PROD/pages/1297285260)

### Usage

`npm i @mosip/react-inji-verify-sdk`

[npm](https://www.npmjs.com/package/@mosip/react-inji-verify-sdk)

### Peer Dependencies

| Name       | Version |
| ---------- | ------- |
| React      | 18.2.0  |
| Typescript | 4.9.5   |

### Local Publishing Guide

Install the dependencies\
`npm install`

Build the project`npm run build`

Publish the npm package using Verdaccio, We use [verdaccio](https://verdaccio.org/docs/what-is-verdaccio). npm link or yarn link won't work as we have peer dependencies. Follow the docs to setup Verdaccio.\
Then run npm publish `--registry <http://localhost:<VERADACCIO_PORT>>`

### Integration Guide

#### OpenID4VPVerification

This guide walks you through integrating the OpenID4VP verification component into your React TypeScript project. It facilitates Verifiable Presentation (VP) verification using the OpenID4VP protocol and supports flexible workflows, including client-side and backend-to-backend verification.

**Prerequisites**

* React Project Setup

{% hint style="warning" %}
**Note**\
The component is written in **React** + **TypeScript**, The component does not support other frontend frameworks like Angular, Vue, or React Native.
{% endhint %}

**Backend Requirements**

To use the component, you must host a verification backend that implements the OpenID4VP protocol. This backend is referred to as the inji-verify-service. It also needs to adhere to the OpenAPI spec defined here in case if the backend service is not inji-verify-service.

{% hint style="success" %}
**Important**:

* The component expects these endpoints to be accessible via a base URL (verifyServiceUrl).
{% endhint %}

**Example**:

If you deploy the inji-verify/verify-service at:[https://injiverify-service.example.com](https://injiverify-service.example.com)\
Then use this as the verifyServiceUrl in the component:\
verifyServiceUrl="[https://injiverify-service.example.com/v1/verify](https://injiverify-service.example.com/v1/verify)"

**Installation**

`npm i @mosip/react-inji-verify-sdk`

**Component Props**

**Exclusive Verification Flows**

Only one of the following should be provided:

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

Tips:\
If you use presentationDefinition, **do not** pass presentationDefinitionId, and vice versa.

**Required Props**

| Prop             | Type                 | Description                            |
| ---------------- | -------------------- | -------------------------------------- |
| verifyServiceUrl | string               | Base URL for your verification backend |
| protocol         | string               | Protocol for QR (e.g.: "openid4vp://") |
| onQrCodeExpired  | () => void           | Callback when QR expires               |
| onError          | (err: Error) => void | Error handler callback                 |

**Optional Props**

| Prop           | Type            | Description                                         |
| -------------- | --------------- | --------------------------------------------------- |
| triggerElement | React.ReactNode | Element that triggers verification (e.g., a button) |
| transactionId  | string          | Optional external tracking ID                       |
| qrCodeStyles   | object          | Customize QR appearance (size, color, margin, etc.) |

**Integration Examples**

**VP Result via UI (frontend receives result)**

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

**VP Result via Backend (frontend just gets txnId)**

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

**Testing the Component (for QA)**

* **Simulate Wallet Scan** : Use a mobile wallet app that supports OpenID4VP, or use mock tools to scan the QR code.
* **Trigger Expiry** : Don’t scan the QR and wait for expiry to ensure onQrCodeExpired fires.
* **Force Errors** :
  * Stop the backend or simulate a 500 error.
  * Try missing required props or using both callbacks to see validation.

#### Compatibility & Scope

**Supported**

* ✅ ReactJS (with TypeScript)
* ✅ Modern React projects (17+)

**Not Supported**

* ❌ React Native
* ❌ Angular, Vue, or other frontend frameworks
* ❌ SSR frameworks like Next.js without customization
