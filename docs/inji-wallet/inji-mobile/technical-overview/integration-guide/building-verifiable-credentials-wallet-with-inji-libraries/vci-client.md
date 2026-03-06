# VCI-Client

## VCI-Client

vci-client library enables to carry out the credential request from the consumer application (mobile wallet or web) and download the VC.

## Features:

* Request credentials from OID4VCI-compliant credential issuers
* Supports both the Verifiable Credential download flows defined in the OID4VCI specification:
  * Issuer Initiated Flow (Credential Offer Flow).
  * Wallet Initiated Flow (Trusted Issuer Flow).
* Authorization server discovery for both download flows
* PKCE-compliant OAuth 2.0 Authorization Code flow (RFC 7636)
  * PKCE session is managed internally by the library
* Well-defined exception handling with VCI-XXX error codes (see more on this)
* Support for multiple Credential formats:
  * ldp_vc
  * mso_mdoc
  * vc+sd-jwt / dc+sd-jwt
* Presentation During Issuance (PDI) support for both download flows
> ⚠️ Consumer of this library is responsible for processing and rendering the credential after it is downloaded.
* Kotlin and Swift artifacts are available to integrate with the native mobile applications.

Below sections details on the steps for integrating the Kotlin and Swift packages into the app.

## Kotlin package for vci-client:

### Repository

* inji-vci-client repo is [here](https://github.com/inji/inji-vci-client)

## Supported platforms

* Android (via aar)
* JVM (via jar)

### Installation

Snapshot builds are available [here](https://central.sonatype.com/artifact/io.inji/inji-vci-client-aar).

{% hint style="info" %}
Note: implementation "io.inji:inji-vci-client:0.7.0"
{% endhint %}


<!--
### APIs

**1. Request Credential**

Request for credential from the providers (credential issuer), and receive the credential.

```
val credentialResponse: CredentialResponse? = VCIClient().requestCredential(
                        IssuerMetaData( CREDENTIAL_AUDIENCE, CREDENTIAL_ENDPOINT, DOWNLOAD_TIMEOUT, CREDENTIAL_TYPE, CREDENTIAL_FORMAT ),
                        proofJwt,
                        accessToken
                    )

```

**Parameters**

| Name           | Type           | Description                                                                | Sample                                                                                                    |
| -------------- | -------------- | -------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------- |
| issuerMetaData | IssuerMetaData | Data object of the issuer details                                          | IssuerMetaData(credentialAudience, credentialEndpoint, downloadTimeout, credentialType, credentialFormat) |
| proofJwt       | Proof          | The proof used for making credential request. Supported proof types : JWT. | JWTProof(jwtValue)                                                                                        |
| accessToken    | String         | token issued by providers based on auth code                               | ""                                                                                                        |

### **Exceptions**

* DownloadFailedException is thrown when the credential issuer did not respond with credential response
* NetworkRequestTimeoutException is thrown when the request is timedout

### **More details**

An example app is added under /example folder which can be referenced for more details.

* For kotlin refer [here](https://github.com/inji/inji-vci-client/tree/master/kotlin/example)
* For ios refer [here](https://github.com/inji/inji-vci-client-ios-swift/tree/master/SwiftExample)
-->

## iOS: Swift package for vci-client:

### Repository

- [inji-vci-client-ios-swift repository](https://github.com/inji/inji-vci-client-ios-swift/)

### Installation

Add VCIClient to your Swift Package Manager dependencies:

```shell
.package(url: "https://github.com/inji/inji-vci-client-ios", from: "0.7.0")
```

<!--
### APIs

**1. Request Credential**

Request for credential from the issuer, and receive the credential response back in string.

```
let requestCredential = try await VCIClient().requestCredential(issuerMeta: IssuerMeta, proofJwt: Proof, accessToken: String)
```

**Parameters**

| Name        | Type       | Description                                                                    | Sample                                                                                                |
| ----------- | ---------- | ------------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------------------- |
| issuerMeta  | IssuerMeta | struct of the issuer details like audience, endpoint, timeout, type and format | IssuerMeta(credentialAudience, credentialEndpoint, downloadTimeout, credentialType, credentialFormat) |
| proofJwt    | Proof      | The proof type ProofJwt ex jwt                                                 | JWTProof(jwt: proofJWT)                                                                               |
| accessToken | String     | token issued by providers based on auth code                                   | ""                                                                                                    |

**Exceptions**

* DownloadFailedError is thrown when the credential issuer did not respond with credential response
* NetworkRequestTimeOutError is thrown when the request is timedout

**More details**

An example app is added under /SwiftExample folder which can be referenced for more details. Extract the swift example app out of the library and then follow the installation steps.
-->

## APIs

The library provides the following APIs for credential issuance:

| Use Case                                | Method Name                              | Description                                                     |
|-----------------------------------------|------------------------------------------|-----------------------------------------------------------------|
| **Obtain Issuer Metadata**              | `getIssuerMetadata()`                    | Retrieve issuer metadata from well-known endpoint               |
| **Get Supported Credentials**           | `getCredentialConfigurationsSupported()` | Get supported credential configurations from issuer             |
| **Fetch Credential (Credential Offer)** | `fetchCredentialUsingCredentialOffer()`  | Request credential using credential offer (Pre-Auth/Auth flows) |
| **Fetch Credential (Trusted Issuer)**   | `fetchCredentialFromTrustedIssuer()`     | Request credential from a trusted issuer (Auth flow)            |

> **Note:** For detailed API documentation including parameters, return types, and usage examples, refer to the [Kotlin API Reference](https://github.com/inji/inji-vci-client/tree/master/kotlin#-api-overview) or [Swift implementation documentation](https://github.com/inji/inji-vci-client-ios-swift/tree/master/#-api-overview).

### VCI-Client and Inji Wallet integration:

The below diagram shows how Inji Wallet utilises vci-client library.

<figure><img src="../../../../../.gitbook/assets/inji_mobile_wallet_integration_guides_vci-client-inji-interaction.png" alt=""><figcaption></figcaption></figure>
