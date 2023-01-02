# e-Signet

In today's world, access to information enables us with better quality of life. Access to information quite often needs knowledge/ possession of digital systems. This creates a digital divide in a society where in people with knowledge and digital devices have access to information while others are left struggling. **e-Signet** aims to make ID verification simple and usable by the masses. We aim to get closer to bridging the digital divide by allowing various forms of ID verification.

![](.gitbook/assets/e-signet-qr.jpg) ![](.gitbook/assets/e-signet-bio.jpg)

**What is ID verification?**

ID verification is the process that allows to confirm one's identity and confirm the validity of details to avail various government and private sector services.

Let us understand the different models with their pros and cons.

* **Assisted model** - Where an assistant lends his system or uses it on behalf of the user. In this model, it is important not to use a password for user verification.
  * Biometric verification - Passwordless and making verification equitable for everyone. Biometric capture is based on [SBI](https://app.gitbook.com/s/-M1R77ZUwR6XwtPjJIVm/biometrics/mosip-device-service-specification). This specification allows a general-purpose biometric device (of course compliant with the specification) to capture anyone's biometrics and verify them. This allows the usage of biometrics beyond the personal device.
  * OTP - Passwordless but will need access to one's phone. Biometrics in rare cases can reject a valid user. Our OTP solution bridges the divide in these scenarios.
* **Self Authentication** - Where a user can verify themselves. This is a well-known model and has been in use over the internet.
  * QR Code - Using a selfie image in a smartphone, you can authenticate locally to your phone and use the enrolled private key to release an authentication token. This mode allows the usage of a personal smartphone as an authenticator.

{% hint style="info" %}
There is a need to support lot more verification methods to be inclusive. Also, the current approach solves certain privacy concerns but it does not address all of the privacy concerns. We are constantly looking at ways to bridge the digital divide with better privacy. Please refer to [Inji](https://app.gitbook.com/s/4EyCrLbFom7vj7UcMIUZ/modules/mobile-application) to understand some of the innovative methods that are explored around distributed verifiable credentials.
{% endhint %}

### Who can use this?

e-Signet is designed as a simple highly performant system for large-scale inclusive digital verification. The solution does not deal with ID Issuance & ID Lifecycle. Therefore, it can be adopted by anyone who has an ID repository.

### Why should I adopt?

There are multiple benefits of using e-Signet for the residents, government as well as private organisations.

#### How are the residents benefited?

* Easy login to any of the government services using a single credential (as it uses the existing ID repository)
* Providing their `consent` before allowing the relying party for accessing the personal information (inbuilt consent flow).
* Allows the user to identify themselves and reduces the efforts of remembering or storing multiple passwords and account details.

#### How are the adopters (government/ private) benefitted?

* Quick and safe way to expose digital verification across services.
* Ability to verify the residents with the same assurance as given during registration (OTP, Biometric, Cryptographic key)
* Enables government to open up digital verification/ e-KYC as a service and enables better access to financial inclusion
* Ease of integration to the relying parties as it follows standard-based protocols. (lower time to market)
* Bridges some of the digital divide and enables multiple modes of verification.

**e-Signet**, which is [OpenID Connect](https://openid.net/connect/) and [OAuth 2.0](https://oauth.net/2/) compliant system and can be used by a relying party to perform quick and simple integration for user verification.

**e-Signet** also uses [SBI (Secure Biometric Interface)](https://standards.ieee.org/ieee/3167/10925/) to enable an ecosystem of biometric players. To have a look at the supported devices, click [here](https://docs.mosip.io/1.2.0/biometrics/biometric-devices).
