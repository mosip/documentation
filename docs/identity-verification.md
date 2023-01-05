**What is ID verification?**

ID verification is the process that allows to confirm one's identity and confirm the validity of details to avail various government and private sector services.

Let us understand the different models with their pros and cons.

* **Assisted model** - Where an assistant lends his system or uses it on behalf of the user. In this model, it is important not to use a password for user verification.
  * Biometric verification - Passwordless and making verification equitable for everyone. Biometric capture is based on [SBI](https://app.gitbook.com/s/-M1R77ZUwR6XwtPjJIVm/biometrics/mosip-device-service-specification). This specification allows a general-purpose biometric device (of course compliant with the specification) to capture anyone's biometrics and verify them. This allows the usage of biometrics beyond the personal device.
  * OTP - Passwordless but will need access to one's phone. Biometrics in rare cases can reject a valid user. Our OTP solution bridges the divide in these scenarios.
* **Self Authentication** - Where a user can verify themselves. This is a well-known model and has been in use over the internet.
  * QR Code - Using a selfie image in a smartphone, you can authenticate locally to your phone and use the enrolled private key to release an authentication token. This mode allows the usage of a personal smartphone as an authenticator.

