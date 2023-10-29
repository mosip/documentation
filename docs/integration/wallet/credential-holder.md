# Credential Holder

A digital wallet which want to work as a credential holder application, in eSignet needs to be onboarded as a relying party. This document details the steps how a wallet can use eSignet to download credentials issued by a VC Issuer using [OpenID4CVI](https://openid.github.io/OpenID4VCI/openid-4-verifiable-credential-issuance-wg-draft.html) wallet-initiated flow.

{% hint style="info" %}
To know more about how the VC Issuance flow works in eSignet, go through the [activity diagram ](../../integration-guides/vc-issuance.md#appendix-vc-issuance-flow)available in [VC Issuance Plugin](../../integration-guides/vc-issuance.md) document.&#x20;
{% endhint %}

Below are the steps for on-boarding a digital wallet as a relying party and using the eSignet APIs for downloading a verifiable credentials.

### 1. Get a valid redirect deep link

eSignet follows the OpenID4VCI wallet-initiated flow, hence, once authentication is successful, eSignet will be sharing an auth-code to the wallet. Hence, for the integration, the wallet would need to create a valid redirect deep link first.

### 2. Get an OAuth client credentials

The relying party (here, the wallet) can use the eSignet client management APIs to register as an OAuth client and get the client credentials which would help them connect with eSignet.

{% swagger src="../../.gitbook/assets/e-Signet.yml" path="/client-mgmt/oidc-client" method="post" %}
[e-Signet.yml](../../.gitbook/assets/e-Signet.yml)
{% endswagger %}

### 3. Call the authorize endpoint

In order to initiate the credential issuance flow the credential holder needs to authenticate and provide consent. Hence, the wallet needs to create a button to initiate authentication using eSignet by call the "_**/authorize**_" endpoint.

{% swagger src="../../.gitbook/assets/e-Signet.yml" path="/authorize" method="get" %}
[e-Signet.yml](../../.gitbook/assets/e-Signet.yml)
{% endswagger %}

This would redirect the holder to a web view of eSignet's authentication screen where the holder needs to authenticate and provide consent to share the credentials.

Once the holder successfully authenticates and provides consent, the authorization code is returned to the wallet app via the configured **redirect deep link.**

### 4. Retrieving the access token and c\_nonce

The wallet app now needs to extract the authorization code (auth-code) parameter in the redirected deep link and exchange **authorization code** to get the **access token and c\_nonce** from the eSignet server.

{% swagger src="../../.gitbook/assets/eSignet (1).yml" path="/oauth/v2/token" method="post" %}
[eSignet (1).yml](<../../.gitbook/assets/eSignet (1).yml>)
{% endswagger %}

{% swagger src="../../.gitbook/assets/e-Signet.yml" path="/authorization/auth-code" method="post" %}
[e-Signet.yml](../../.gitbook/assets/e-Signet.yml)
{% endswagger %}

{% hint style="info" %}
Many OAuth 2.0 client libraries are available in most programming languages to perform this action.
{% endhint %}

### 5. Generate key pair

The wallet now needs to generate a key pair for the wallet holder, and use the private key from the key pair to sign the _**c\_nonce**_. This will be used to determine that the prove of possession (PoP) of the private key is the wallet holder.

### 6. Get the credential using VCI credential API

Now the wallet can invoke the "_**/vci/credential**_" endpoint of eSignet with PoP (Prove of Possession) and share the credential format metadata to get the Verifiable Credential in the requested format.

{% swagger src="../../.gitbook/assets/eSignet (1).yml" path="/vci/credential" method="post" %}
[eSignet (1).yml](<../../.gitbook/assets/eSignet (1).yml>)
{% endswagger %}

Once the credential is received the wallet needs to securely store it.
