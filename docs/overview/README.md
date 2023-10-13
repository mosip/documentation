# Overview

* e-Signet is envisioned as a thin add-on system to any existing digital ID solution to bring in additional capabilities.
* It implements [OpenID Connect](https://openid.net/connect/) flows, which help the relying party perform quick and easy integrations using pre-existing libraries for user verification.
* The system supports only the secure options in OpenID connect, like `authorization code flow` to ensure the resident data is handled securely.
* It is integrated with [SBI](https://standards.ieee.org/ieee/3167/10925/) (Secure Biometric Interface) to facilitate secure biometric collection for biometric-based user verification.
* The system supports multiple authentication factors, like OTP, biometrics, etc., to be inclusive for all people.
* All integrations to the ID system are taken as a runtime plug-able library to allow the reuse of official container images that help with easier upgrades.
* Since this is designed especially for country-scale resident verification, we do not support additional features like role management, session management, etc.

Below is a brief demonstration of e-Signet and its offerings.

{% embed url="https://www.youtube.com/watch?v=ZfUPRv71s_0" %}

For more details on e-Signet, please go through the below documentation.

<table data-view="cards"><thead><tr><th></th><th></th><th></th><th data-hidden data-card-target data-type="content-ref"></th><th data-hidden data-card-cover data-type="files"></th></tr></thead><tbody><tr><td><strong>View the core principles that govern e-Signet.</strong></td><td></td><td></td><td><a href="principles/">principles</a></td><td><a href="../.gitbook/assets/banners-principles.png">banners-principles.png</a></td></tr><tr><td><strong>The key e-Signet features are available here.</strong></td><td></td><td></td><td><a href="features/">features</a></td><td><a href="../.gitbook/assets/banners-features.png">banners-features.png</a></td></tr><tr><td><strong>View the e-Signet core components here.</strong></td><td></td><td></td><td><a href="components/">components</a></td><td><a href="../.gitbook/assets/banners-components.png">banners-components.png</a></td></tr><tr><td><strong>The e-Signet technology stack is available here.</strong></td><td></td><td></td><td><a href="technology-stack/">technology-stack</a></td><td><a href="../.gitbook/assets/banners-tech-stack.png">banners-tech-stack.png</a></td></tr></tbody></table>
