# FAQs

Here are a few of the frequently asked questions (FAQs) on eSignet:

## About eSignet

<details>

<summary>What is eSignet?</summary>

In today's era of digital transformation, there has been a global shift towards moving most services online. To facilitate personalized access to these online services, a secure and trusted digital identity is crucial. **eSignet** strives to provide a user-friendly and effective method for individuals to authenticate themselves and utilize online services while also having the option to share their profile information. Moreover, eSignet supports multiple modes of identity verification to ensure inclusivity and broaden access, thereby reducing potential digital barriers.

To know more, click [here](../).

</details>

<details>

<summary>What are the core features of eSignet?</summary>

The core features of eSignet are available [here](../overview/features/).

</details>

<details>

<summary>How can I use eSignet?</summary>

Based on the type of entity, such as an ID system, a relying party, or a digital wallet, you can integrate with eSignet. For more details, go through our [integration guide](../integration/).

If you are looking at trying out eSignet right away, then you can use our sandbox for testing. Please go through our [Try it out section](../try-it-out/) for more details.

</details>

## Features and Functionality

<details>

<summary>How many types of authentication methods does eSignet support today?</summary>

The types of authentication methods supported by eSignet are [available here](../overview/features/#support-for-various-authentication-modalities).

</details>

<details>

<summary>What are the standards followed by eSignet?</summary>

The standards followed by eSignet are listed [here](../overview/Standards/).

</details>

## Configuration and Setup

<details>

<summary>How to configure password authentication in eSignet?</summary>

To enable password authentication in Signet for a client, you must first set the ACR value as “**mosip:idp:acr:password**” in the _**authContextRefs**_ array during client creation or update.

Then, **during local testing**,

You must modify or add a file _**amr-acr-mapping.json**_ in _**esignet-service >> src >> main >> resources,**_ which should contain all ACR and AMR mapping where you can add **“mosip:idp:acr:password”** and **“PWD”** as shown below.

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

Once these properties have been added to the file, you can refer to this file in _**application-local.properties**_ in the same folder location.

```properties
mosip.esignet.amr-acr-mapping-file-url=classpath:amr-acr-mapping.json
```

Or

You can directly point to a URL from the deployed version using the _**mosip-config**_ repo where the _**acr\_amr\_mapping**_ configuration is stored for production, as shown below.

```properties
mosip.esignet.amr-acr-mapping-file-url=https://raw.githack.com/mosip/mosip-config/develop-v3/amr-acr-mapping.json
```

Similarly, **for** **production**,

You have to change _**acr-amr-mapping.json**_ in the _**mosip-config**_ repo; depending on your environment, switch to that branch and add the **“PWD”** property in the _**amr**_ and **“mosip:idp:acr:password”** in the _**acr\_amr**_.

</details>

<details>

<summary>How to add a new language in eSignet?</summary>

**Adding a new language for local eSignet setup**

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

For details on ISO 639-1 and ISO 639-2, please follow the [documentation here](https://www.loc.gov/standards/iso639-2/php/English\_list.php).

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

<summary>How to remove a language from the eSignet default setup?</summary>

To remove a language from the default eSignet setup, you have to remove or delete the language’s JSON file (let's say French _fr.json_) from your language bundle.

After that, you need to remove the mapping and details from the _**default.json**_ file of that particular language.

**For local setup,**

Go to the folder _**oidc-ui >> public >> locales**_ in the e-Signet project and perform the above steps.

**In production,**

Go to the develop branch of your [_**artifactory-ref-impl**_](https://github.com/mosip/artifactory-ref-impl/tree/develop) and perform the above steps in this location: _**artifacts >> src >> i18n >> esignet-i18n-bundle**._ Once the artifactory is modified, then you can deploy the latest version in production.

</details>

<details>

<summary>How to integrate wallets with eSignet to provide wallet-based authentication?</summary>

To integrate a wallet in eSignet, first, you have to add wallet details in _**application-local.properties**_ in the _**esignet-service**_ module in your esignet project.

```properties
mosip.esignet.ui.wallet.config={{'wallet.name': 'Inji', 'wallet.logo-url': 'inji_logo.png', 'wallet.download-uri': '#', 'wallet.deep-link-uri': 'inji://landing-page-name?linkCode=LINK_CODE&linkExpireDateTime=LINK_EXPIRE_DT' }}
```

Here, you need to specify the

* wallet.name
* wallet.logo-url
* wallet.download-uri
* wallet.deep-link-uri

_**Note**_: In this property, you can also configure multiple wallets.

After adding the above details you should add this variable in _**wallet.config**_ properties of _**mosip.esignet.ui.config.key-values**_ configuration as shown below.

```properties
mosip.esignet.ui.config.key-values={…
 'wallet.config': ${mosip.esignet.ui.wallet.config}}
```

Then, restart the eSignet UI and eSignet backend service to view the changes.

</details>

<details>

<summary>How to configure the expected quality score, timeouts, and number of biometric attributes to be captured in eSignet?</summary>

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

<summary>How to enable or disable the captcha in eSignet UI?</summary>

To disable the captcha from the e-Signet OTP screen, you have to set the value _false_ in _**application-local.properties**_ for _**mosip.esignet.send-otp.captcha-required**_ variable.

For **local testing**,

Go to _**esignet-service >> src >> main >> resources**_, then open _**application-local.properties**_ then add this.

```properties
mosip.esignet.send-otp.captcha-required=false
```

For enabling captcha you need to set the same property value as **true**.

</details>

<details>

<summary>How to register or create a client ID in eSignet?</summary>

In order to utilize eSignet for authenticating users and obtaining their information, relying parties are required to follow these steps:

1. Register as a **Client** in the eSignet system.
2. Integrate with eSignet APIs, following the guidelines provided by OpenID Connect, on their web or mobile applications.

To know more, click [here](../integration/relying-party.md).

</details>

<details>

<summary>How to configure a VC issuer in eSignet?</summary>

The VC Issuance plugin interface provides methods to return Verifiable Credentials (VCs) of an individual (here, the holder of the credential) when authorized. Today, this interface supports methods for returning linked data-proof VC (as JSON-LD) and VC as JWT.

To know more, click [here](../integration/vc-issuance.md).

</details>

<details>

<summary>How to configure Knowledge Based Identification Form?</summary>

#### Configuration required to display KBI form.

```
#individual-id-field is set with field id which should be considered as an individual ID in the authenticate request.
#form-details holds the list of field details like below:
#id -> unique field Id, type -> holds datatype, format -> only supported for date fields, regex -> pattern to validate the input value, maxLength -> number of allowed characters
#Example: mosip.esignet.authenticator.default.auth-factor.kba.field-details={{'id': '${mosip.esignet.authenticator.default.auth-factor.kba.individual-id-field}', 'type':'text', 'format':'', 'maxLength': 50, 'regex': '^\s*[+-]?(\d+|\d*\.\d+|\d+\.\d*)([Ee][+-]?\d*)?\s*$'},{'id':'fullName', 'type':'text', 'format':'', 'maxLength': 50, 'regex': '^[A-Za-z\s]{1,}[\.]{0,1}[A-Za-z\s]{0,}$'},{'id':'dob', 'type':'date', 'format':'dd/mm/yyyy'}}
mosip.esignet.authenticator.default.auth-factor.kba.field-details={{'id':'policyNumber', 'type':'text', 'format':'', 'maxLength': 50, 'regex': '^\s*[+-]?(\d+|\d*\.\d+|\d+\.\d*)([Ee][+-]?\d*)?\s*$'},{'id':'fullName', 'type':'text', 'format':'', 'maxLength': 50, 'regex': '\S*'},{"id":"dob", "type":"date", "format":"dd/mm/yyyy"}} 
mosip.esignet.authenticator.default.auth-factor.kba.individual-id-field=policyNumber
```



</details>

<details>

<summary>How to configure KBI form in eSignet UI</summary>

KBI form can be configured based on the fields required to identify a user via Knowledge based identification, please refer to the use case [example](https://docs.esignet.io/end-user-guide/knowledge-based-authentication) here and please find the below properties to be changed to reflect the fields in the KBI form on eSignet UI.

```
Update the below sub properties inside mosip.esignet.ui.config.key-values property
'auth.factor.kba.individual-id-field' : '${mosip.esignet.authenticator.sunbird-rc.auth-factor.kba.individual-id-field}',\
'auth.factor.kba.field-details':${mosip.esignet.authenticator.sunbird-rc.auth-factor.kba.field-details}
```

To know more about how to configure the KBI Form in eSignet please refer [here](https://github.com/mosip/digital-credential-plugins/blob/master/sunbird-rc-esignet-integration-impl/README.md)

</details>
