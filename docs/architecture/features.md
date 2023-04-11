# Features

### Login using the Foundation ID

* e-Signet allows easy login to any of the government services using a single credential (as it uses the existing ID repository)
* Passwordless login using the supported authentication factors

### Support for multiple authentication factors

* This release focuses on the following two authentication factors:
  * OTP
  * Biometric

### Wallet based authentication

* With e-Signet version 1.0, mobile wallet based authentication can be used to scan a QR code and complete the authentication based on the credential already activated for online login. It also performs a local face authentication before using the activated credential.

### Quick integrations

* `OpenID` being a standard, we get a lot of Client libraries for intergrations. Hence, avoid custom code building for integration.

### Seamless inclusion of new authentication mechanisms

* Since the relying party redirects to the e-Signet page, inclusion of new authentication factor can be introduced without any changes to the integration from the relying party end.

### Avoids unwanted profiling

* As the user enters the ID directly on the e-Signet page, the relying party does not have to store the ID which could otherwise be used for profiling incase of data leaks.

### Collects explicit user consent

* In our login flows, we collect the user's consent before sharing their private information to the relying party. The user therefore has the privilege for selective sharing of data.

### Support for various assurance levels

* We support the relying party to specify an assurance level based on the usecase of the relying party.

### Captcha validation

With e-Signet version 1.0, the OTP-based authentication is now secured with captcha.

### Multi-language support

In version 1.0, the e-Signet UI supports multiple languages. By default, e-Signet comes with the following language bundles: 

* Arabic
* English
* Hindi
* Kannada
* Tamil 

Additionally, it can be customized to support other languages as per a country's requirement.

* e-Signet is also verified for RTL (right-to-left) support.
