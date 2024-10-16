# Integrate with eSignet

If you are a relying party looking to integrate with **eSignet,** you can connect with us by completing the [form](https://docs.google.com/forms/d/1YQKcBDR92uqy\_0m6oIV5yLmCPQCGOqJYx043ZOWQnX8/edit) here. This will assist us in facilitating a seamless integration on [collab](https://collab.mosip.net/).

Here are some FAQs on the Google form.

<details>

<summary>What are redirect URIs?</summary>

The redirect URIs are the list of URIs the relying party provides where the authorization code needs to be sent after successful authentication by eSignet.

</details>

<details>

<summary>Why do you need a public key?</summary>

The public key shared by the relying party is used to verify the digital signature when there is an authorization request. It is also used to encrypt the `user_info` and send it to the relying party.

</details>

<details>

<summary>What is JWK format?</summary>

JWK (JSON Web Key) is a JSON data structure that represents a set of public keys utilizing either the Elliptic Curve or RSA families of algorithms (public key cryptography).

Learn more about JWK [here](https://openid.net/specs/draft-jones-json-web-key-03.html).

</details>

<details>

<summary>How can I convert a public key to JWK format?</summary>

Here is the easiest way to convert your public key (a `.PEM` file) to JWK format for testing.

* Go to the link [https://russelldavies.github.io/jwk-creator/](https://russelldavies.github.io/jwk-creator/)
* Select **Public Key Use** as **Signing**
* Select **Algorithm** as **RS256**
* Select **Key ID** as **alpha-numeric-random-string**
* Paste the public key PEM file content in **PEM encoded key**
* Click on the **convert** button

<img src="../.gitbook/assets/image (1).png" alt="" data-size="original">

</details>

Once you receive the eSignet credentials at the email address provided on the form, please go through our integration guide on [relying party integration](../integration/relying-party.md) to complete the integration.
