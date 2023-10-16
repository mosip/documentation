# e-Signet

In these times of digital transformation, most services are moving online globally. Personalized access to online services is enabled through the use of a trusted digital identity. **e-Signet** aims to offer a simple yet powerful mechanism for end users to identify themselves to avail of online services and also share their profile information. e-Signet supports multiple modes of identity verification to promote inclusion and increase access, thus narrowing potential digital divides.

e-Signet also provides an elegant and easy way for an existing trusted identity database to make the identity digital and provide identity verification and service access.

{% hint style="info" %}
There is a need to support more verification methods to be inclusive. Current approaches do not address privacy concerns comprehensively. We are constantly looking at ways to bridge the digital divide with better privacy. Here is a short introduction to [identity verification](glossary.md#identity-verification) methods. Also, check out [Inji](https://app.gitbook.com/s/4EyCrLbFom7vj7UcMIUZ/modules/mobile-application) to understand modern approaches to identity using verifiable credentials for decentralized verification.
{% endhint %}

![](\_images/e-signet-qr.jpg) ![](\_images/e-signet-bio.jpg)

**What can e-Signet be used for?**

* e-Signet can be a login provider for a relying party application to enable access to the service without creating yet another set of login credentials (username/password combination).
* e-Signet can be used for assured identity verification of an individual against an identity provider. The identity provider could be a national identity database/ driver's license system/ passport license system or any other trusted identity provider. The assurance level is based on the authentication factor used, with biometric authentication offering user presence assurance.
* e-Signet can be used for consented data sharing for profile creation or eKYC needs of relying parties. Authentication requests from a relying party can be accompanied by a request for a set of attributes suitable for profile creation or meeting eKYC process norms. The requested information is shared after the user provides consent as part of the e-Signet login flow.

**How is e-Signet different from other services?**

e-Signet re-imagines authentication services to factor in emerging trends and the need for assured digital identities. It brings critical capabilities to the authentication process:

* Model to integrate existing identity stores for authentication and KYC needs.
* Support for biometrics authentication.
* Support for wallet-based authentication.
* Support for verifiable credentials in the near future.

### Who can use this?

e-Signet is a modern and scalable digital identity verification system. The solution does not deal with ID issuance and lifecycle management. It is meant for use on top of any ID repository with a simple integration model. Any ID repository that offers authentication and attribute fetching can use e-Signet.

### e-Signet relies on standards

e-Signet implements [**OpenID Connect**](https://openid.net/connect/) and [**OAuth 2.0**](https://oauth.net/2/) flows to work its magic. We have chosen the most secure and trustworthy flow to ensure user privacy and data security.

e-Signet relies on [**SBI (Secure Biometric Interface)**](https://standards.ieee.org/ieee/3167/10925/) to enable an ecosystem of biometric players. To have a look at the supported devices, click [here](https://docs.mosip.io/1.2.0/biometrics/biometric-devices).

e-Signet will leverage emerging standards for using verifiable credentials with OpenID and for wallet integration.

#### User Centricity

Inclusion and access are core objectives of e-Signet. We are mindful of user privacy and data protection. e-Signet simplifies the user's life and offers flexibility and choices to complete identity verification.

* **One ID** to access multiple services. Easy login to any of the integrated government and private sector services using a single identity credential.
* Mandatory **User Consent** before allowing the relying party to access the personal information (inbuilt consent flow).
* **Multiple modes of authentication** to complete identity verification.
* Protection of credentials as the login credentials are not shared with the relying party. The login happens on e-Signet.

#### Go digital quickly

* Quick and safe way to expose digital verification across services.
* Ability to verify the residents with the same assurance as given during registration (OTP, Biometric, Cryptographic key).
* Enables the government to open up digital verification/ e-KYC as a service and enables better access to financial inclusion.
* Ease of integration to the relying parties as it follows standard-based protocols (lower time to market).
* Narrows and bridges the digital divide by enabling multiple modes of verification.
