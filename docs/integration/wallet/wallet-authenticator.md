# Wallet Authenticator

A digital wallet which wants to work as an authenticator using eSignet needs to have the credentials of the user and the user's ID in the credential should be bounded with eSignet.

{% hint style="info" %}
For details on how to get the user's credentials downloaded on eSignet, go through our document on - [How a digital wallet can be used as credential holder?](credential-holder.md)

For details on how binding is performed in e-Signet, go through the document on - [eSignet's Key Binding Plugin](../key-binder.md).
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

To use the wallet having a bounded credential for authentication, the user needs to do the following,

* The user needs to navigate to a relying party website where eSignet authentication via. the wallet is enabled.
* The user should scan the QR code using the wallet to connect and perform authentication. The wallet application should find a link-code in the QR code.
* The link-code would be used for initiating the authentication. In order to do so, the wallet sends the link-code to the eSignet server using the "_**/linked-authorization/v2/link-transaction**_" endpoint.

{% swagger src="../../.gitbook/assets/eSignet (1).yml" path="/linked-authorization/v2/link-transaction" method="post" %}
[eSignet (1).yml](<../../.gitbook/assets/eSignet (1).yml>)
{% endswagger %}

* Once, the transaction is initiated successfully, the eSignet server responds back with list of authentication factors called, WLA (Wallet Local Authentication).
* The wallet now authenticates the user locally. May be with a selfie against the credentials available on the phone.
* Once local authentication on the wallet is successful, the wallet should create a JWT signed with the signed certificate which was shared during wallet binding. The signed JWT is sent to the eSignet server with WLA as the challenge using the "_**/link-authorization/v2/authenticate**_" endpoint.

{% swagger src="../../.gitbook/assets/eSignet (1).yml" path="/linked-authorization/v2/authenticate" method="post" %}
[eSignet (1).yml](<../../.gitbook/assets/eSignet (1).yml>)
{% endswagger %}

* &#x20;After authentication is successful, the eSignet server sends the consent action, where consent action can have values, CAPTURE or NO CAPTURE, indicating the user to capture or not capture the consent.
* If the authentication response has consent action as CAPTURE, then the wallet requests the user to provide consent and share the captured consent to the eSignet server using the "_**/link-authorization/v2/consent**_" endpoint.

{% swagger src="../../.gitbook/assets/eSignet (1).yml" path="/linked-authorization/v2/consent" method="post" %}
[eSignet (1).yml](<../../.gitbook/assets/eSignet (1).yml>)
{% endswagger %}

* eSignet UI now automatically detects that the consent has been provided by the user and sends the authentication code to the redirect URI of the relying party.

## Appendix - Wallet Local Authentication

The below diagram shows how wallet local authentication is performed in eSignet using a digital wallet.

<figure><img src="../../.gitbook/assets/activity-diagrams-wallet-authentication.png" alt=""><figcaption></figcaption></figure>
