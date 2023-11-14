# Overview

eSignet is envisioned as a thin add-on system to any existing digital ID solution to bring in additional capabilities.

* It implements [OpenID Connect](https://openid.net/connect/) flows, which helps the relying party perform quick and easy integrations using pre-existing libraries for user verification.
* The system supports only the secure options in OpenID Connect, like authorization code flow to ensure the resident data is handled securely.
* It is integrated with [SBI](https://standards.ieee.org/ieee/3167/10925/) (Secure Biometric Interface) to facilitate secure biometric collection for biometric-based user verification.
* The system supports multiple authentication factors, like OTP, biometrics, etc., to be inclusive for all people.
* All integrations to the ID system are taken as a runtime plug-able library to allow the reuse of official container images that help with easier upgrades.
* Since this is designed especially for country-scale resident verification, eSignet does not support additional features like role management, session management, etc.

Watch the informative video below to gain insights into eSignet and its offerings.

{% embed url="https://www.youtube.com/watch?v=ZfUPRv71s_0" %}

Now, let us understand the key objectives of eSignet:

### User Centricity

At eSignet, our core goals are to prioritize inclusion and accessibility. We place a strong emphasis on user privacy and data protection. Our platform, eSignet, aims to simplify users' lives by offering flexibility and choices when it comes to identity verification.

* **One ID**: Gain access to multiple services with ease. Users can log in to integrated government and private sector services using a single identity credential.
* **Mandatory User Consent**: Before allowing access to personal information, we require users to provide explicit consent. Our platform incorporates a built-in consent flow.
* **Multiple modes of authentication**: We offer various methods for identity verification to accommodate individual preferences.
* **Credential protection**: We ensure that login credentials are not shared with relying parties. The login process takes place exclusively on the eSignet platform.

### Go digital quickly

* Fast and secure digital verification across services.
* Ability to verify residents with the same level of assurance as during registration (OTP, Biometric, Cryptographic key).
* Empower the government to offer digital verification and e-KYC as a service, enabling improved access to financial inclusion.
* Easy integration with relying parties, as we follow standard-based protocols, reducing time to market.
* Narrow and bridge the digital divide by enabling multiple modes of verification.

For more details on eSignet, please go through the below documentation.

<table data-view="cards"><thead><tr><th></th><th data-hidden></th><th data-hidden></th><th data-hidden data-card-target data-type="content-ref"></th><th data-hidden data-card-cover data-type="files"></th></tr></thead><tbody><tr><td><strong>Core principles that govern eSignet</strong></td><td></td><td></td><td><a href="principles/">principles</a></td><td><a href="../.gitbook/assets/principles.png">principles.png</a></td></tr><tr><td><strong>Key eSignet features</strong></td><td></td><td></td><td><a href="features/">features</a></td><td><a href="../.gitbook/assets/features.png">features.png</a></td></tr><tr><td><strong>Core components of eSignet</strong></td><td></td><td></td><td><a href="components/">components</a></td><td><a href="../.gitbook/assets/componenets (1).png">componenets (1).png</a></td></tr><tr><td><strong>eSignet technology stack</strong></td><td></td><td></td><td><a href="technology-stack/">technology-stack</a></td><td><a href="../.gitbook/assets/tech-stack.png">tech-stack.png</a></td></tr><tr><td><strong>Use and experience eSignet</strong></td><td></td><td></td><td><a href="../try-it-out/">try-it-out</a></td><td><a href="../.gitbook/assets/try-it-out.png">try-it-out.png</a></td></tr><tr><td><strong>Integration Guides</strong></td><td></td><td></td><td><a href="../integration/">integration</a></td><td><a href="../.gitbook/assets/inetgrate.png">inetgrate.png</a></td></tr></tbody></table>
