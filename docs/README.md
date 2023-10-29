# eSignet

In today's era of digital transformation, there has been a global shift towards moving most services online. To facilitate personalized access to these online services, a secure and trusted digital identity is crucial. **eSignet** strives to provide a user-friendly and effective method for individuals to authenticate themselves and utilize online services while also having the option to share their profile information. Moreover, eSignet supports multiple modes of identity verification to ensure inclusivity and broaden access, thereby reducing potential digital barriers.

Additionally, eSignet offers a seamless and straightforward solution for incorporating an existing trusted identity database into the digital realm. By enabling digital identities and providing identity verification and service access, e-Signet delivers a sophisticated and user-friendly experience.

{% hint style="info" %}
There is a need to expand the range of verification methods to be more inclusive. The current approaches to verification do not adequately address privacy concerns. We are continually exploring ways to address the digital divide while also prioritizing privacy. Here is a short introduction to [identity verification](glossary.md#identity-verification) methods. Additionally, read through [Inji](https://docs.mosip.io/inji/) to gain insight into contemporary approaches to identity verification through the use of verifiable credentials for decentralized verification.
{% endhint %}

![](\_images/e-signet-qr.jpg) ![](\_images/e-signet-bio.jpg)

**What can eSignet be used for?**

* eSignet is a reliable login provider for a relying party application that allows access to the service without the need for additional login credentials.
* eSignet also offers a secure method for verifying an individual's identity against trusted identity providers such as national identity databases, driver's license systems, passport systems, or other reputable sources. The level of assurance is determined by the authentication factor utilized, with biometric authentication providing an added layer of user presence confirmation.
* Additionally, eSignet facilitates consented data sharing for the purpose of profile creation or meeting electronic Know Your Customer (eKYC) requirements for relying parties. When a relying party requests authentication, they can also request a specific set of attributes needed for profile creation or compliance with eKYC norms. The user's requested information is shared only after they have provided consent during the eSignet login process.

**How is eSignet different from other services?**

eSignet re-imagines authentication services to factor in emerging trends and the need for assured digital identities. It brings critical capabilities to the authentication process:

* Framework to seamlessly integrate existing identity stores for authentication and KYC (Know Your Customer) requirements.
* Robust support for biometric authentication.
* Comprehensive support for wallet-based authentication.
* Support for issuance of [Verifiable credentials](integration/vc-issuer.md).

**Who is the intended user of this product?**

eSignet is a contemporary and adaptable system for verifying digital identities. This solution is not involved with the issuance and management of IDs. It is designed to be compatible with any ID repository through a straightforward integration model. Any ID repository that provides authentication and attribute retrieval capabilities can utilize e-Signet.
