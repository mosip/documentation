# Glossary

This section mainly comprises a list of terms in the identity domain along with their definitions.

<details>

<summary>Digital ID Wallet</summary>

A digital ID wallet is a tool that stores and manages personal information and identity credentials securely in a digital format. It helps people keep their information organized and protected. This wallet ensures the safety of personal data and makes it easily accessible when needed.

</details>

<details>

<summary>Good ID</summary>

Good ID refers to a set of principles and practices that encompass secure, inclusive, and privacy-respecting methods for digital identity. It emphasizes the following key attributes:

1. **Secure**: Good ID systems should prioritize security, ensuring that individuals' identities are protected from theft and unauthorized access. This involves robust authentication methods and data encryption.
2. **Inclusive**: Good ID systems should be accessible to all, regardless of socio-economic status, location, or personal circumstances. They should not exclude or discriminate against any group.
3. **Privacy-Respecting**: Good ID systems should respect individuals' privacy by minimizing the collection and use of personal data to only what is necessary and by implementing strong data protection measures.
4. **User-Centric**: Good ID focuses on user control and consent, allowing individuals to manage and control their digital identities.
5. **Interoperable**: It's essential that different ID systems can work together, fostering compatibility and reducing the need for individuals to manage multiple, fragmented identities.
6. **Open Standards**: Open, transparent standards should underpin Good ID systems to ensure they can be independently reviewed and are not controlled by a single entity.
7. **Sustainability**: Good ID systems should be sustainable in the long term, considering the environmental impact, cost, and resource requirements.

These principles are essential for building trustworthy and ethical digital identity systems that benefit both individuals and the organizations and services that rely on them.

</details>

<details>

<summary>Identity Systems</summary>

Identity systems, in the context of digital identity and access management, refer to the infrastructure, processes, and technologies used to manage and verify the identities of individuals or entities in the digital realm. These systems play a crucial role in ensuring secure and controlled access to various online services, platforms, and resources.

</details>

<details>

<summary>Identity Verification</summary>

Identity verification is the important process of ensuring that a person is who they claim to be to avail of various government and private sector services.

This process allows one to confirm one's identity and confirm the validity of details shared on the relying party's online portal.

Let us understand the different models and their pros and cons.

* **Assisted model:** In this model, an assistant lends his system or uses it on behalf of the user. While using this model, it is important not to use a password for user verification.
  * Biometric verification is passwordless, making verification equitable for everyone. Biometric capture is based on [SBI](https://app.gitbook.com/s/-M1R77ZUwR6XwtPjJIVm/biometrics/mosip-device-service-specification). This specification allows a general-purpose biometric device (of course compliant with the specification) to capture anyone's biometrics and verify them. This allows the use of biometrics beyond the personal device.
  * OTP: Passwordless, but will require access to one's phone. Biometrics, in rare cases, can reject a valid user. Our OTP solution bridges the divide in these scenarios.
* **Self-authentication** - In this model, a user can verify themselves. This is a well-known model and has been in use over the internet.
  * QR Code - By using a selfie image in a smartphone, one can authenticate locally on their phone and use the enrolled private key to release an authentication token. This mode allows the usage of a personal smartphone as an authenticator.

</details>

<details>

<summary>Relying Party</summary>

A relying party is a service provider that depends on an identity provider for authentication and identity verification, enabling users to access their services securely and conveniently.&#x20;

They are typically online services, websites, or applications that need to verify the identity of users for access control, personalization, or other purposes.&#x20;

The identity provider, often utilizing protocols like [OpenID Connect](https://openid.net/connect/), provides authentication and identity information to the relying party, allowing users to access the service without having to create a new account or authenticate separately for each relying party.

</details>
