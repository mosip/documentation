# e-Signet

In today's world, access to information enables us with better quality of living. Access to information quite often needs knowledge/ possession of digital systems. This creates a digital divide in the society where in people with knowledge and digital devices have access to information while the others are left struggling.  **e-Signet** aims to make the ID verification simple and usable by the masses. We aim to get closer to bridging the digital divide by allowing various forms of ID verification.

![](.gitbook/assets/e-signet-qr.jpg)![](.gitbook/assets/e-signet-bio.jpg)

* **Assisted model** - Where an assistant lends his system or uses it on behalf of the user. In this model, it is important not to use a password for user verification.
  * Biometric verification - Password less and making verification equitable for everyone. Biometric capture is based on \[<mark style="color:red;">SBI</mark>]\(https://docs.mosip.io/1.2.0/biometrics/secure-biometric-interface). This specification allows a general purpose biometric device (of course compliant to the specification) to capture any ones biometric and verify them. This allows the usage of biometrics beyond the personal device.&#x20;
  * OTP - Password less but will need access to ones phone. Biometric in rare cases can  reject a valid user. Our OTP solution bridges the divide in these scenarios.&#x20;
* **Self Authentication** - Where an user can verify themselves. This is a well known model and has been in use over the internet.&#x20;
  * QR Code - Using a selfie image in a smart phone, you can authenticate locally to your phone and use the enrolled private key to release a authentication token. This mode allows the usage of a personal smart phone as an authenticator.&#x20;

{% hint style="info" %}
There is a need to support lot more verification methods to be inclusive. Also the current approach solves certain privacy concerns but it does not address all of the privacy concerns. We are constantly looking at ways to bridge the digital divide with better privacy. Please refer to \[Inji]\(TODO: Attach the link) to understand some of the innovative methods that are explored around distributed verifiable credentials.&#x20;
{% endhint %}

### Who can use this?

e-Signet is designed as a simple highly performant system for large scale inclusive digital verification. The solution does not deal with ID Issuance & ID Lifecycle. So it can be adopted by anyone who has an ID repository.&#x20;

### Why should I adopt?

There are multiple benefits of using e-Signet for the residents, government as well as private organisations.

#### How are the residents benefited?

* Easy login to any of the government services using a single credential (as it uses the existing ID repository)
* Providing their `consent` before allowing the relying party for accessing the personal information (inbuilt consent flow).
* Allows the user to identify themselves and reduces the efforts of remembering or storing multiple passwords and account details.

#### How are the adopters (government/ private) benefitted?

* Quick and safe way to expose digital verification across services.
* Ability to verify the residents with the same assurance as given during registration (OTP, Biometric, Cryptographic key)
* Enables government to open up digital verification/ e-kyc as a service and enables better access to financial inclusion
* Ease of integration to the relying parties as it follows standard based protocols. (lower time to market)
* Bridges some of the digital divide and enables multiple modes of verification.

**e-Signet**, which is [OpenID Connect](https://openid.net/connect/) and [OAuth 2.0](https://oauth.net/2/) compliant system and can be used by a relying party to perform quick and simple integration for user verification.

**e-Signet**, also uses \[SBI]\(TODO: add the link to the spec and also ieee) to enable an ecosystem of biometric players. Look at the supported devices [here](https://docs.mosip.io/1.2.0/biometrics/biometric-devices).
