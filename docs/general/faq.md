---
description: Below are some frequently asked questions (FAQs) about eSignet.
---

# FAQs

## About eSignet

<details>

<summary><strong>What is eSignet?</strong></summary>

**eSignet** is a digital identity verification tool that simplifies access to online services. It allows users to identify themselves using various [authentication methods](../esignet-authentication/features.md#supported-authentication-methods) and supports multiple forms of IDs as handles (e.g. National ID, Phone Number, Email ID, etc.).

In today's era of digital transformation, there has been a global shift towards moving most services online. To facilitate personalized access to these online services, a secure and trusted digital identity is crucial. eSignet strives to provide a user-friendly and effective method for individuals to authenticate themselves and utilize online services while also having the option to share their profile information. Moreover, eSignet supports multiple modes of identity verification to ensure inclusivity and broaden access, thereby reducing potential digital barriers.

To know more eSignet please refer [here](../).

</details>

<details>

<summary><strong>How can I use eSignet?</strong></summary>

You can integrate with eSignet based on the type of entity, such as an ID system, a relying party, or a digital wallet. For more details, please go through our [integration guide](broken-reference/).

If you are interested in trying out eSignet right away, you can use our sandbox for testing. Please go through our [Try it out section](broken-reference/) for more details.

</details>

<details>

<summary><strong>What are the various modes of authentication that eSignet supports?</strong></summary>

eSignet provides multiple authentication methods, as listed below.

1. [OTP Authentication](../esignet-authentication/test/end-user-guide/health-portal/login-with-otp.md)
2. [Biometric Authentication](../esignet-authentication/test/end-user-guide/health-portal/login-with-biometrics.md)
3. [Wallet-based Authentication](../esignet-authentication/test/end-user-guide/health-portal/login-with-qr-code.md)
4. [Password-based Authentication](../esignet-authentication/test/end-user-guide/health-portal/login-with-password.md)
5. [Knowledge Based Identification](../esignet-authentication/test/end-user-guide/health-portal/knowledge-based-authentication.md)

To know more about it click [here](../esignet-authentication/features.md).

</details>

<details>

<summary><strong>Who are the intended users of eSignet</strong>?</summary>

The intended users of eSignet include:

* Government ID Agencies that need secure verification mechanisms, to deliver services to their residents.
* Individuals or residents accessing online services.
* Businesses and or Service Providers that require streamlined methods to authenticate beneficiaries and provide services

</details>

<details>

<summary><strong>How scalable is eSignet? Can it handle a significant increase in user volume?</strong></summary>

eSignet is simple, lightweight, and powerful. It easily integrates with any service provider’s portal, using minimal resources, and can scale effortlessly to handle large user volumes, acting as a middle layer for identity verification.

</details>

<details>

<summary><strong>How does eSignet ensure the security and privacy of user data?</strong></summary>

eSignet minimizes data storage by using access tokens linked to user IDs for login, ensuring identity verification without capturing personal information. The login process occurs exclusively on the eSignet platform, with mandatory user consent through a built-in consent flow that allows users to grant or withhold explicit access to their personal information.

</details>

<details>

<summary><strong>What technologies are used in the development of eSignet?</strong></summary>

* eSignet uses the latest technologies for development.
* To learn more about the technologies eSignet uses click [here](../readme/technology/technology-stack.md)

</details>

<details>

<summary><strong>Why should an entity adopt eSignet?</strong></summary>

eSignet is an open-source, flexible solution that follows [standard](../readme/standards.md) protocols for easy integration and high [security](../readme/principles.md), ensuring no vendor lock-in. As a MOSIP product, it integrates with any trusted ID, offering a secure and adaptable identity verification solution.

</details>

## Features and Functionality

<details>

<summary><strong>What are the core features of eSignet?</strong></summary>

* eSignet offers features such as user-friendly identity verification, flexible login options, and multiple secure authentication methods like OTP, biometrics, wallet, and knowledge-based authentication. It integrates with existing identity databases for eKYC compliance and supports multiple languages. Users can access various services with a single credential, consent must be ensured before sharing personal information. Further, eSignet is compatible with smartphones and feature phones.
* To know more about features, please refer [here](../esignet-authentication/features.md).

</details>

<details>

<summary><strong>What unique features does eSignet offer that others do not?</strong></summary>

eSignet stands out by offering a comprehensive suite of advanced features that ensure seamless integrations and secure user verification. eSignet also incorporates robust authorization code flow to prevent fraud, ensuring a higher level of security. Below are some unique features

* **Enhancing authentication methods through secure standards**\
  This solution leverages OAuth 2.0-based OpenID Connect flows for easy integration, incorporates the Secure Biometric Interface (SBI) for biometric-based verification, and supports secure options like authorization code flow to prevent fraud.
* **User centricity**\
  User-centric features include single identity credential access across government and private services, mandatory user consent for sharing personal information, multiple authentication methods for user preference and enhanced liveness checks, and credential protection through exclusive handling on the eSignet platform to safeguard user data unless explicitly consented.
* **Go digital quickly**\
  Accelerate your digital transformation with eSignet, enabling secure, high-assurance digital verification across services. Leveraging various methods such as OTP, biometric authentication, and cryptographic keys, eSignet empowers governments to offer streamlined e-KYC services, driving financial inclusion. With seamless relying party integration and diverse verification modes, it helps bridge the digital divide effectively and efficiently.

</details>

<details>

<summary><strong>What standards does eSignet follows?</strong></summary>

* eSignet is highly inspired by OpenID Connect and OAuth 2.0 standards for secure authentication and data privacy. It employs a Secure Biometric Interface (SBI) for compatibility with various biometric devices and integrates verifiable credentials to enhance functionality and security.
* To know more about eSignet standards, please refer [here](../readme/standards.md).

</details>

<details>

<summary><strong>How many types of authentication methods does eSignet support today</strong>?</summary>

The types of authentication methods supported by eSignet are [available here](../esignet-authentication/features.md#supported-authentication-methods).

</details>

## Partner Integrations

<details>

<summary><strong>Can you provide examples of successful integrations with potential partners?</strong></summary>

eSignet will be deployed across various platforms, focusing on secure authentication. The solution actively explores integration opportunities with new partners and countries, with proof of concept (POC) completed in multiple countries. Below are some examples of eSignet integrations:

* **Health Management**: The POC for eSignet integration with the Health Management portal is complete, enabling OTP and biometric-based authentication for seamless access to health services, with user verification against migrated ID data.
* **SuperApp Integration:** eSignet will be integrated into a multi-service SuperApp for basic registration, login, and enhanced eKYC. Development is underway, and completion is expected soon.
* **Insurance Portal**: Integration of eSignet with a health insurance portal is underway, using migrated ID data for secure authentication and quick access to insurance services.
* **University Authentication**: eSignet is being implemented for face authentication of students and staff, verified against university ID data for access to services like exams, hostel assignments, and meal identification.
* **Government and Private Services**: A brownfield implementation of MOSIP is in progress, with eSignet integration planned to authenticate users with National ID data across government and private services.
* **Self-Service Portal for Benefits Delivery**: The POC for eSignet integration with OpenG2P is complete, allowing residents to authenticate via National ID data and register for Benefits Delivery.

</details>

## Configuration and Setup

<details>

<summary><strong>Which version of eSignet can be used?</strong></summary>

* Currently, eSignet uses[ v1.4.1](../roadmap-and-releases/versions/v1.4.1/).
* Please refer [here ](../roadmap-and-releases/versions/)for all the latest releases.

</details>

<details>

<summary><strong>Where can I access the source code?</strong></summary>

You can access the source code from our [eSignet GitHub repository](https://github.com/mosip/esignet/tree/master).

</details>

<details>

<summary><strong>Is there documentation available for setting up eSignet locally?</strong></summary>

Yes, comprehensive documentation is available to guide you through setting up eSignet locally. You can find step-by-step instructions in the [eSignet GitHub repository](https://github.com/mosip/esignet/blob/master/docker-compose/README.md)

</details>

<details>

<summary><strong>How is a relying party onboarded to eSignet - integrated with MOSIP?</strong></summary>

Relying parties are considered to be **Auth** partners in MOSIP, and hence should go through authentication partner onboarding steps. The partners can onboard themselves either through self-onboarding or assisted onboarding. Please keep reading for further details.

1. **Self Onboarding**\
   To self-onboard, the partners can register directly on the MOSIP [PMS](https://docs.mosip.io/1.2.0/modules/partner-management-services) portal. Please refer [here](https://docs.mosip.io/1.2.0/modules/partner-management-services/pms-revamp/functional-overview/auth-partner/end-user-guide#authentication-partner-workflow) for a step by step process.
2. **Assisted Onboarding**\
   Alternatively, partners can also initiate the onboarding process by filling out the form [here](https://docs.google.com/forms/d/1YQKcBDR92uqy_0m6oIV5yLmCPQCGOqJYx043ZOWQnX8/closedform). Once submitted, partners will receive their credentials via email shortly.

Please refer [here](../esignet-authentication/test/try-it-out/integrate-with-e-signet.md) for more details.

</details>

<details>

<summary><strong>How to configure password authentication in eSignet?</strong></summary>

To enable password authentication in Signet for a client, you must first set the ACR value as “**mosip:idp:acr:password**” in the _**authContextRefs**_ array during client creation or update.

During local testing follow the below forma&#x74;**:**

You must modify or add a file named "_**amr-acr-mapping.json"**_ in _**esignet-service >> src >> main >> resources,**_ which should contain all ACR and AMR mapping where you can add **“mosip:idp:acr:password”** and **“PWD”** as shown below.

```json
{
 "amr": {
  ...
  "PWD" : [{ "type": "PWD" }],
  ...
 },
 "acr_amr": {
  ...
  "mosip:idp:acr:password" : ["PWD"],
  ...
 }
}
```

Once these properties have been added to the file, you can refer to this file in "_**application-local.properties"**_ in the same folder location.

```properties
mosip.esignet.amr-acr-mapping-file-url=classpath:amr-acr-mapping.json
```

Or

You can directly point to a URL from the deployed version using the _**mosip-config**_ repo where the _**acr\_amr\_mapping**_ configuration is stored for production, as shown below.

```properties
mosip.esignet.amr-acr-mapping-file-url=https://raw.githack.com/mosip/mosip-config/develop-v3/amr-acr-mapping.json
```

Similarly, for production follow the below format:

You have to change _**acr-amr-mapping.json**_ in the _**mosip-config**_ repo; depending on your environment, switch to that branch and add the **“PWD”** property in the _**amr**_ and **“mosip:idp:acr:password”** in the _**acr\_amr**_.

</details>

<details>

<summary><strong>How to add a new language in eSignet?</strong></summary>

To add a new language for the local eSignet setup follow the below step&#x73;**:**

1. Go to your Signet project and then open the folder:\
   **oidc-ui >> public >> locales**
2. Create a new language JSON file
   1. Copy the file _en.json_ and rename it with your new language's code as per ISO 639-1 (for example, if you want to add the language French, then rename the file to _fr.json)_ so that you can have all keys in for your new language.
   2. Modify the values in your desired language (for French, the values have to be modified to French in the _fr.json_ file)
3. Update `default.json` file
   1. Now add the new language’s JSON file detail in _the default.json_ file so that it can be parsed and the new language can be shown in the UI, like below.
   2. You have to add the ISO 639-1 (two-lettered language code) language info in languages\_2Letters (which was used to create the new file above) and also put the language value against it.
   3. If your language follows RTL(right-to-left) then add ISO 639-1 language code in the `rtlLanguages` array.
   4. Finally, create a mapping between ISO 639-2 and ISO 639-1 language codes for your language in `langCodeMapping`.

```json
{
  // Add your new language here
  "languages_2Letters": {
    "en": "English",
    "ar": "عربى",
    "LANGUAGE_CODE_IN_ISO-639-1": "LANGUAGE VALUE"
  },
  // Add your new language in rtlLanguages if it uses RTL
  "rtlLanguages": ["ar"],
  // Add a language mapping for ISO 639-2 & ISO 639-1 format
  "langCodeMapping": {
    "eng": "en",
    "ara": "ar",
    "LANGUAGE_CODE_IN_ISO-639-2": "LANGUAGE_CODE_IN_ISO-639-1"
  }
}
```

For details on ISO 639-1 and ISO 639-2, please follow the [documentation here](https://www.loc.gov/standards/iso639-2/php/English_list.php).

**Adding a new language in the production setup**

Similar to the local mentioned above, you need to create a new language JSON file (as per ISO 639-1 and then update language configurations in _the **default.json**_ file.

Apart from that, you have to make the above changes in the `develop` branch of your [_**artifactory-ref-impl**_](https://github.com/mosip/artifactory-ref-impl/tree/develop) repository. To do so,

1. Clone the repo and switch to the `develop` branch.
2. Go to the folder location:\
   **artifacts >> src >> i18n >> esignet-i18n-bundle**
3. Inside this folder, you can view all language JSON files.
4. Create your new language file as mentioned in the local setup guide above and place it in the folder.
5. Modify the _**default.json**_ file as mentioned in the local setup guide above.

Now, use this new artifactory in your production setup.

</details>

<details>

<summary><strong>How to remove a language from the eSignet default setup?</strong></summary>

To remove a language from the default eSignet setup, you have to remove or delete the language’s JSON file (let's say French _fr.json_) from your language bundle.

After that, you need to remove the mapping and details from the _**default.json**_ file of that particular language.

**For local setup:**

Go to the folder _**oidc-ui >> public >> locales**_ in the e-Signet project and perform the above steps.

**In production:**

Go to the develop branch of your [_**artifactory-ref-impl**_](https://github.com/mosip/artifactory-ref-impl/tree/develop) and perform the above steps in this location: _**artifacts >> src >> i18n >> esignet-i18n-bundle**._ Once the artifactory is modified, then you can deploy the latest version in production.

</details>

<details>

<summary><strong>How to integrate wallets with eSignet to provide wallet-based authentication?</strong></summary>

To integrate a wallet in eSignet:

You have to add wallet details in _**application-local.properties**_ in the _**esignet-service**_ module in your esignet project.

```properties
mosip.esignet.ui.wallet.config={{'wallet.name': 'Inji', 'wallet.logo-url': 'inji_logo.png', 'wallet.download-uri': '#', 'wallet.deep-link-uri': 'inji://landing-page-name?linkCode=LINK_CODE&linkExpireDateTime=LINK_EXPIRE_DT' }}
```

Here, you need to specify the below mentioned properties:

* wallet.name
* wallet.logo-url
* wallet.download-uri
* wallet.deep-link-uri

**Note**: In this property, you can also configure multiple wallets.

After adding the above details you should add this variable in the _**wallet.config**_ properties of _**mosip.esignet.ui.config.key-values**_ configuration as shown below.

```properties
mosip.esignet.ui.config.key-values={…
 'wallet.config': ${mosip.esignet.ui.wallet.config}}
```

Then, restart the eSignet UI and eSignet backend service to view the changes.

</details>

<details>

<summary><strong>How to configure the expected quality score, timeouts, and number of biometric attributes to be captured in eSignet?</strong></summary>

Parameters such as expected quality score, timeouts and the number of biometric attributes to capture are environment variables for eSignet UI.

You can add the below environment variables in the _**.env**_ file in the eSignet project’s _**oidc-ui**_ folder.

```
// expected quality score for various biometrics
REACT_APP_SBI_FACE_CAPTURE_SCORE=70
REACT_APP_SBI_FINGER_CAPTURE_SCORE=70
REACT_APP_SBI_IRIS_CAPTURE_SCORE=70

// number of biometric subtypes to capture
REACT_APP_SBI_FACE_CAPTURE_COUNT=1
REACT_APP_SBI_FINGER_CAPTURE_COUNT=1
REACT_APP_SBI_IRIS_CAPTURE_COUNT=1

// capture timeouts in seconds
REACT_APP_SBI_CAPTURE_TIMEOUT=30
REACT_APP_SBI_DINFO_TIMEOUT=30
REACT_APP_SBI_DISC_TIMEOUT=30
```

</details>

<details>

<summary><strong>How to enable or disable the captcha in eSignet UI?</strong></summary>

To disable the captcha from the e-Signet OTP screen, you have to set the value _false_ in _**application-local.properties**_ for _**mosip.esignet.send-otp.captcha-required**_ variable.

For **local testing**,

Go to _**esignet-service >> src >> main >> resources**_, then open _**application-local.properties**_ then add this.

```properties
mosip.esignet.send-otp.captcha-required=false
```

For enabling captcha you need to set the same property value as **true**.

</details>

<details>

<summary><strong>How to register or create a client ID in eSignet?</strong></summary>

In order to utilize eSignet for authenticating users and obtaining their information, relying parties are required to follow these steps:

1. Register as a **Client** in the eSignet system.
2. Integrate with eSignet APIs, following the guidelines provided by OpenID Connect, on their web or mobile applications.

To know more, click [here](../esignet-authentication/develop/integration/relying-party/).

</details>

<details>

<summary><strong>How to configure a VC issuer in eSignet?</strong></summary>

The VC Issuance plugin interface provides methods to return Verifiable Credentials (VCs) of an individual (here, the holder of the credential) when authorized. Today, this interface supports methods for returning linked data-proof VC (as JSON-LD) and VC as JWT.

**Note:** Verifiable Credentials Issuance (VCI) is now supported by[ Inji Certify](https://docs.mosip.io/inji/inji-certify/overview), to know more about VCI please refer [here.](https://docs.inji.io/inji-certify/overview#segregation-of-esignet-vci-component-to-inji-certify)

</details>

<details>

<summary><strong>How to configure Knowledge Based Identification (KBI) form in eSignet UI?</strong></summary>

KBI form can be configured based on the fields required to identify a user via Knowledge based identification, please refer to the use case [example](../esignet-authentication/test/end-user-guide/health-portal/knowledge-based-authentication.md) here and please find the below properties to be changed to reflect the fields in the KBI form on eSignet UI.

```
Update the below sub properties inside mosip.esignet.ui.config.key-values property
'auth.factor.kba.individual-id-field' : '${mosip.esignet.authenticator.sunbird-rc.auth-factor.kba.individual-id-field}',\
'auth.factor.kba.field-details':${mosip.esignet.authenticator.sunbird-rc.auth-factor.kba.field-details}
```

To know more about how to configure the KBI Form in eSignet please refer [here](https://github.com/mosip/digital-credential-plugins/blob/master/sunbird-rc-esignet-integration-impl/README.md)

</details>

<details>

<summary><strong>How is authenticator plugin implemented for KBI with Sunbird RC?</strong></summary>

The Authenticator plugin allows the user to identify the user with the details provided in the KBI form in the eSignet UI and Identifies the user based on the details from the registry called Sunbird RC.\
\
The fields part of the KBI is completely dependent on the registry schema. Fields configured to be part of the KBI form should identify the end user. Denies the identification if more than one entry is found in the registry.\
\
The current compatible Sunbird RC version is v2.0.0-rc3. Please refer [here](https://github.com/mosip/digital-credential-plugins/blob/master/sunbird-rc-esignet-integration-impl/README.md) for more details.

</details>
