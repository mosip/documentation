# Integrate with e-Signet

If you are a relying party looking to integrate with **e-Signet,** you can connect with us by completing the [form](https://forms.gle/sHteZEsKvPRXbUNw7) here. This will assist us in facilitating a seamless integration on [collab](https://collab.mosip.net/).

Here are some FAQs on the Google form.

<details>

<summary>What are redirect URIs?</summary>

The redirect URIs are the list of URIs the relying party provides where the authorization code needs to be sent after successful authentication by e-Signet.

</details>

<details>

<summary>Why do you need a public key?</summary>

The public key shared by the relying party is used to verify the digital signature when there is an authorization request. It is also used to encrypt the user\_info and send it to the relying party.

</details>

<details>

<summary>What is JWK format?</summary>

JWK (JSON Web Key) is a JSON data structure that represents a set of public keys utilizing either the Elliptic Curve or RSA families of algorithms (public key cryptography).&#x20;

Learn more about JWK [here](https://openid.net/specs/draft-jones-json-web-key-03.html).

</details>

<details>

<summary>How can I convert a public key to JWK format?</summary>

Here is the  easiest way to convert your public key (a `.PEM` file) to JWK format for testing.

* Go to the link [https://russelldavies.github.io/jwk-creator/](https://russelldavies.github.io/jwk-creator/)
* Select **Public Key Use** as **Signing**
* Select **Algorithm** as **RS256**
* Select **Key ID** as **alpha-numeric-random-string**
* Paste the public key PEM file content in **PEM encoded key**&#x20;
* Click on the **convert** button

<img src="../.gitbook/assets/image.png" alt="" data-size="original">

</details>

Once you receive the e-Signet credentials at the email address provided on the form, please go through our integration guide on [relying party integration](../integration-guides/relying-party/) to complete the integration.