# ACR

## **What is ACR?**

ACR, which stands for **Authentication Context Class Reference**, is a parameter used in authentication and identity systems to define the context or **level of assurance** associated with an authentication event.

## **Why ACR Matters**

ACR values convey **how a user was authenticated** and the **strength of that authentication**, enabling relying parties to assess the trustworthiness of the authentication event.

## **Usage:**

* ACR values are typically defined by **identity providers** and **relying parties** to communicate the **level of trust and security** associated with an authentication event.
* These values can vary between systems but are often used to indicate **different levels of assurance**.
* The **assurance level** is shared with the relying party as one of the **claims in the ID token**.

{% hint style="info" %}
**Note:** The specific meaning and usage of ACR values may vary depending on the context and the identity system in use.

Relying parties can make access control decisions based on the ACR values provided.
{% endhint %}

## Supported ACRs

eSignet currently supports the below ACR values:

* **mosip:idp:acr:generated-code**\
  For OTP authentication.
* **mosip:idp:acr:biometrics**\
  For biometric authentication use a MOSIP SBI 2.0-compliant device.
* **mosip:idp:acr:linked-wallet**\
  For wallet-based authentication, which requires the wallet to be bound to the server. Thereafter, the binding key could be used to sign the JWT with the server-signed certificate in the header as an authentication factor.

{% hint style="info" %}
**Note:** Wallet binding is a separate process where the RSA public key and the individual ID are shared with the server, and the server then returns the signed certificate to the wallet.
{% endhint %}

* **mosip:idp:acr:password**\
  For password-based authentication.
* **mosip:idp:acr:knowledge**\
  For Knowledge Based identification(KBI), demographic data based identity authentication.

{% hint style="info" %}
**Note:**&#x20;

* acr\_values request parameter in the `/authorize` request takes the above values as a space-separated list in any combination.
* Wallet binding is a separate process where the RSA public key and the individual ID are shared with the server, and the server then returns the signed certificate to the wallet.
{% endhint %}
