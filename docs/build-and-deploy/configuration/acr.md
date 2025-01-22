# ACR

ACR, which stands for **Authentication Context Class Reference**, is a parameter used in authentication and identity systems to define the context or level of assurance associated with an authentication event.

ACR values are used to convey information about how a user was authenticated and the strength of that authentication. ACR values are typically defined by identity providers and relying parties to communicate the level of trust and security associated with an authentication event. These values can vary from one system to another but are often used to indicate different levels of assurance.

The specific meaning and usage of ACR values may vary depending on the context and the identity system in use. They provide a way to communicate the security and assurance level associated with an authentication event, allowing relying parties to make access control decisions based on this information.

The assurance level is then shared with the relying party as one of the claims in the ID token.

## Supported ACRs

eSignet currently supports the below ACR values:

* **mosip:idp:acr:generated-code**\
  For OTP authentication.
* **mosip:idp:acr:biometrics**\
  For biometric authentication use a MOSIP SBI 2.0-compliant device.
* **mosip:idp:acr:linked-wallet**\
  For wallet-based authentication, which requires the wallet to be bound to the server. Thereafter, the binding key could be used to sign the JWT with the server-signed certificate in the header as an authentication factor.
* **mosip:idp:acr:password**\
  For password-based authentication.
* **mosip:idp:acr:knowledge**\
  For Knowledge Based identification(KBI), demographic data based authentication.&#x20;

{% hint style="info" %}
**Note:** acr\_values request parameter in the `/authorize` request takes the above values as a space-separated list in any combination.
{% endhint %}

{% hint style="info" %}
**Note:** Wallet binding is a separate process where the RSA public key and the individual ID are shared with the server, and the server then returns the signed certificate to the wallet.
{% endhint %}
