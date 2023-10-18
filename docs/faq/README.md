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

1. Go to your e-Signet project and then open the folder\
   `oidc-ui >> public >> locales`
2. Create a new language JSON file \
   Copy the file _en.json_ and rename it with your new language's code as per ISO 639-1 (for example, if you want to add the language French then rename the file as _fr.json)_ so that you can have all keys in for your new language. Modify the values in your desired language (for French, the values have to be modified to French in the new file)
3. Update `default.json` file\
   Now add the new language’s JSON file detail in _the default.json_ file so that it can be parsed and the new language can be shown in the UI, like below. You have to add the 2-letter code of the language in languages\_2Letters, similar to the filename, with the name of the language in that language. After that, if your language is written from right to left then add 2 letter language code in the `rtlLanguages` array, in the end, map your 3 letter language code with two-letter language code in langCodeMapping.

```json
{
  "languages_2Letters": {
    "en": "English",
    "ar": "عربى",
    "LANGUAGE_CODE_IN_ISO-639-1": "LANGUAGE VALUE"
  },
  // Add the language as per ISO 639 in rtlLanguages for RTL
  "rtlLanguages": ["ar"],
  "langCodeMapping": {
    "eng": "en",
    "ara": "ar",
    "LANGUAGE_CODE_IN_ISO-639-2": "LANGUAGE_CODE_IN_ISO-639-1"
  }
}
```

\


Please follow the 2 letter & 3 letter code of any language given in the below link

[https://www.loc.gov/standards/iso639-2/php/English\_list.p](https://www.loc.gov/standards/iso639-2/php/English\_list.php)

</details>

<details>

<summary>How to remove a language from the e-Signet default setup?</summary>



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
