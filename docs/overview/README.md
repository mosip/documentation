# Overview

* e-Signet is envisioned as a thin add-on system to any existing digital ID solution to bring in additional capabilities.
* It implements [OpenID Connect](https://openid.net/connect/) flows, which help the relying party to perform quick and easy integrations using pre-existing libraries for user verification.
* The system supports only the secure options in OpenID connect like `authorization code flow` to ensure the resident data is handled securely.
* It is integrated with [SBI](https://standards.ieee.org/ieee/3167/10925/) (Secure Biometric Interface) to facilitate secure biometrics collection for biometric-based user verification.
* The system supports multiple authentication factors like OTP, Biometrics, etc., to be inclusive for all people.
* All integrations to the ID system are taken as a runtime plug-able library to allow the reuse of official container images that help with easier upgrades.
* Since this is designed especially for country-scale resident verification, we do not support additional features like role management, session management, etc.

Below is a brief demonstration of e-Signet and its offerings.

{% embed url="https://www.youtube.com/watch?v=ZfUPRv71s_0" %}

For more details on e-Signet, please go through the below documentation.

<table data-view="cards"><thead><tr><th></th><th></th><th></th><th data-hidden data-card-target data-type="content-ref"></th><th data-hidden data-card-cover data-type="files"></th></tr></thead><tbody><tr><td>Click here to view the core principles of e-Signet.</td><td></td><td></td><td><a href="principles/">principles</a></td><td><a href="broken-reference">Broken file</a></td></tr><tr><td><strong>Features of e-Signet</strong></td><td></td><td></td><td><a href="features/">features</a></td><td></td></tr><tr><td><strong>Components of e-Signet</strong></td><td></td><td></td><td><a href="components/">components</a></td><td></td></tr><tr><td><strong>Technology Stack Used</strong></td><td></td><td></td><td><a href="technology-stack/">technology-stack</a></td><td></td></tr></tbody></table>
