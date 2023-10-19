# FAQs

Here are a few of the frequently asked questions (FAQs) on e-Signet:

## About e-Signet

<details>

<summary>What is e-Signet?</summary>



</details>

<details>

<summary>What are the core features of e-Signet?</summary>

The core features of e-Signet are available [here](../overview/features/).

</details>

<details>

<summary>How can I use e-Signet?</summary>

Based on the type of entity, such as an ID system, a relying party, or a digital wallet, you can integrate with e-Signet. For more details, go through our [integration guide](../integration-guides/).

If you looking at trying out e-Signet right away, then you can use our sandbox for testing. Please go through our [Try it out section](../try-it-out/) for more details.

</details>

## Features and Functionality

<details>

<summary>How many types of authentication methods does e-Signet support today?</summary>

The types of authentication methods supported by e-Signet are [available here](../overview/features/#support-for-various-authentication-modalities).

</details>

<details>

<summary>What are the standards followed by e-Signet?</summary>

The standards followed by e-Signet are [listed here](../overview/principles/#open-standards).

</details>

## Configuration and Setup

<details>

<summary>How to configure password authentication in e-Signet?</summary>



</details>

<details>

<summary>How to add a new language in e-Signet?</summary>

**Adding a new language for local e-Signet setup**

1. Go to your e-Signet project and then open the folder:\
   **oidc-ui >> public >> locales**
2. Create a new language JSON file&#x20;
   1. Copy the file _en.json_ and rename it with your new language's code as per ISO 639-1 (for example, if you want to add the language French, then rename the file to _fr.json)_ so that you can have all keys in for your new language.&#x20;
   2. Modify the values in your desired language (for French, the values have to be modified to French in the _fr.json_ file)
3. Update _default.json_ file
   1. Now add the new language’s JSON file detail in _the default.json_ file so that it can be parsed and the new language can be shown in the UI, like below.&#x20;
   2. You have to add the ISO 639-1 (two-lettered language code) language info in languages\_2Letters (which was used to create the new file above) and also put the language value against it.&#x20;
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

For details on ISO 639-1 and ISO 639-2, please follow the [documentation here](https://www.loc.gov/standards/iso639-2/php/English\_list.p).



**Adding a new language in the production setup**

Similar to the local mentioned above, you need to create a new language JSON file (as per ISO 639-1 and then update language configurations in _the **default.json**_ file.

Apart from that, you have to make the above changes in the `develop` branch of your [_**artifactory-ref-impl**_](https://github.com/mosip/artifactory-ref-impl/tree/develop) repository. In order to do so,

1. Clone the repo and switch to the develop branch
2. Go to the folder location: \
   **artifacts >> src >> i18n >> esignet-i18n-bundle**
3. Inside this folder, you can view all language JSON files
4. Create your new language file as mentioned in the local setup guide above and place it in the folder.
5. Modify the _**default.json**_ file as mentioned in the local setup guide above.

Now use this new artifactory in your production setup.

</details>

<details>

<summary>How to remove a language from the e-Signet default setup?</summary>

To remove a language from the default e-Signet setup, you have to remove or delete the language’s JSON file (let's say French _fr.json_) from your language bundle.&#x20;

After that, you need to remove the mapping and details from the _**default.json**_ file of that particular language.

**For local setup,**&#x20;

Go to the folder _**oidc-ui >> public >> locales**_ in the e-Signet project and perform the above steps.

**In production,**

Go to the develop branch of your [_**artifactory-ref-impl**_](https://github.com/mosip/artifactory-ref-impl/tree/develop) and perform the above steps in this location: _**artifacts >>  src >> i18n >> esignet-i18n-bundle**._ Once, the artifactory is modified, then you can deploy the latest version in production.

</details>

<details>

<summary>How to integrate a wallet with e-Signet to provide wallet based authentication? </summary>



</details>

<details>

<summary>How to register or create a Client ID in e-Signet?</summary>



</details>

<details>

<summary>How to configure a VC issuer in e-Signet?</summary>



</details>
