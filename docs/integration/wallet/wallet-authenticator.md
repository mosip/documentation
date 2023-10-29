# Wallet Authenticator

A digital wallet which wants to work as an authenticator using eSignet needs to have the credentials of the user and the user's ID in the credential should be bounded with eSignet.

{% hint style="info" %}
For details on how to get the user's credentials downloaded on eSignet, go through our document on - [How a digital wallet can be used as credential holder?](credential-holder.md)

For details on how binding is performed in e-Signet, go through the document on - [eSignet's Key Binding Plugin](../../integration-guides/key-binder.md).
{% endhint %}

In this document we will be discussing about the APIs that needs to be called by the wallet application for performing binding and then performing wallet local authentication.

## Wallet Binding APIs

As mentioned above before the authentication is initiated in eSignet the ID of the user should be bounded with the public key of the wallet.

eSignet provides endpoints to requesting an OTP for binding and then another API to bind the wallet's public key to an user's ID.

{% swagger src="../../.gitbook/assets/eSignet (1).yml" path="/binding/binding-otp" method="post" %}
[eSignet (1).yml](<../../.gitbook/assets/eSignet (1).yml>)
{% endswagger %}

{% swagger src="../../.gitbook/assets/eSignet (1).yml" path="/binding/wallet-binding" method="post" %}
[eSignet (1).yml](<../../.gitbook/assets/eSignet (1).yml>)
{% endswagger %}

Here, the challenge can be OTP or any other authentication type supported by eSignet, like biometrics.

Once, binding is performed, the wallet would received a unique Wallet User ID, Signed Certificate from eSignet and an expire time of the certificate, so that, the user needs to retrigger the wallet binding at a regular interval. The wallet should store the certificate securely and map it against the Wallet User ID.

{% hint style="info" %}
Binding multiple VIDs with a public key through a particular type of wallet will always return the same Wallet User ID. However, only the latest certificate signed by eSignet would be valid.

Hence, if the user is changing the device and performing wallet binding from a new device then the signed certificates stored in the old device will not be valid anymore. &#x20;
{% endhint %}

## Wallet Authentication APIs

