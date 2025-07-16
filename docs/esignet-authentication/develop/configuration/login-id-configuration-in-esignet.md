# Login ID Configuration in eSignet

The eSignet system introduces enhanced flexibility in configuring login ID types to better align with country-specific needs and business requirements. This allows implementation teams to tailor login experiences based on regional standards, supported ID types, and UI preferences.

## Overview

eSignet now supports **dynamic configuration of login identifiers**, giving implementation teams the ability to:

* Enable or disable specific login types (e.g., Mobile Number, NRC ID, Email, VID).
* Display country-specific prefixes dynamically.
* Configure SVG icons to visually represent each login method in the UI.

By default, **VID** is shown as the primary login ID. However, this can be extended and customized through configuration.

## Country-Specific Configuration

Login options available to users can vary depending on the country or deployment region. As for an example:

* A **Mobile Number** login can display country-specific prefixes like +91 (India), +855 (Cambodia), or +1 (USA).
* These prefixes are shown dynamically in the UI based on the selected login ID type.

This ensures a localized and intuitive login experience for users around the world.

## SVG Icon Configuration

Each login ID type can be associated with a **custom SVG icon** that visually represents the identifier in the login interface.

* These icons are displayed next to their corresponding input fields.
* Icons can be configured to match branding and UI themes.

### Configuration Format

All login ID types and their respective properties are defined in the eSignet configuration file:

**File:** application-default.properties\
**Key:** mosip.esignet.ui.config.login-id.options

#### Example Configuration

```
mosip.esignet.ui.config.login-id.options={
  {
    "id": "mobile",
    "svg": "mobile_icon",
    "prefixes": [
      { "label": "IND", "value": "+91", "maxLength": "", "regex": "" },
      { "label": "KHM", "value": "+855" },
      { "label": "USA", "value": "+1" }
    ],
    "postfix": "@phone",
    "maxLength": "",
    "regex": ""
  },
  {
    "id": "nrc",
    "svg": "nrc_id_icon",
    "prefixes": "",
    "postfix": "@NRC",
    "maxLength": "",
    "regex": ""
  },
  {
    "id": "vid",
    "svg": "vid_icon",
    "prefixes": "",
    "postfix": "@ID",
    "maxLength": "",
    "regex": ""
  },
  {
    "id": "email",
    "svg": "email_icon",
    "prefixes": "",
    "postfix": "@email",
    "maxLength": "",
    "regex": ""
  }
}
```

***

### Summary

With the new login ID configuration feature, eSignet allows:

* Full control over which login types to show.
* Custom display of country codes for mobile login.
* Visual customization using SVG icons.
* Easy configuration through application-default.properties.

This level of flexibility makes eSignet highly adaptable for diverse identity systems and regional deployment requirements.
