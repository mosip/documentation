# Purpose-Based UI Rendering in eSignet

eSignet now supports **dynamic UI rendering based on the purpose defined** by the relying party (client) during client registration. This enhancement ensures that the user experience is tailored and context-aware across different workflows such as **Login**, **Verify**, or **Link**.

## Why Purpose-Based Rendering?

Different service interactions require different messaging and UI contexts. For instance:

* **Login**: Accessing a service using verified credentials.
* **Verify**: Authenticating user identity to validate a claim.
* **Link**: Associating a digital ID with another identity or account.

With this feature, eSignet dynamically adjusts the **UI text and flow** based on the configured purpose, providing users with a more intuitive and relevant experience.

## How It Works

During **client registration**, the relying party defines the intended purpose for the authentication request. Based on this configuration, eSignet dynamically renders the login interface accordingly.

### Configuration Parameters

| Parameter        | Type   | Description                                                                           |
| ---------------- | ------ | ------------------------------------------------------------------------------------- |
| purpose.type     | String | Defines the purpose of the UI rendering. Acceptable values: verify, login, link, none |
| purpose.title    | Object | (Optional) Custom title text displayed on the UI. Supports internationalization.      |
| purpose.subTitle | Object | (Optional) Custom subtitle text shown below the title. Supports internationalization. |

***

### Valid Values for purpose.type

* login – Default login interface
* verify – Verification flow (e.g., claim validation)
* link – Linking identity or accounts
* none – No specific UI context; defaults to standard login behavior

{% hint style="info" %}
Note: If the purpose.type is **missing or invalid**, the system **defaults to** login **behavior**.
{% endhint %}

### Localization Support

The title and subTitle fields support **language-specific values** using locale keys. For example:

```
"purpose": {
  "type": "login",
  "title": { "eng": "Login using eSignet", "@none": "" },
  "subTitle": { "eng": "Please choose the login option", "@none": "" }
}
```

### Example OIDC Request Payload

```
"purpose": {
  "type": "verify",
  "title": {
    "eng": "Verify your identity",
    "@none": ""
  },
  "subTitle": {
    "eng": "Authenticate using your preferred method",
    "@none": ""
  }
}
```

### Summary

With purpose-based UI rendering, eSignet enables:

* A personalized user experience for different authentication flows
* Clear context provided via customizable titles and subtitles
* Seamless integration using OIDC request payloads

This feature is especially valuable for deployments with multiple service touch points that require tailored messaging across workflows.
