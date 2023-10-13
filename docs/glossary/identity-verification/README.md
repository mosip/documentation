# ID Verification

**What is ID verification?**

Identity verification is the important process of ensuring that a person is who they claim to be to avail various government and private sector services.

This process allows to confirm one's identity and confirm the validity of details shared on the relying parties online portal.

Let us understand the different models with their pros and cons.

* **Assisted model** - In this model, an assistant lends his system or uses it on behalf of the user. While using this model, it is important not to use a password for user verification.

  * Biometric verification - Passwordless and making verification equitable for everyone. Biometric capture is based on [SBI](https://app.gitbook.com/s/-M1R77ZUwR6XwtPjJIVm/biometrics/mosip-device-service-specification). This specification allows a general-purpose biometric device (of course compliant with the specification) to capture anyone's biometrics and verify them. This allows the usage of biometrics beyond the personal device.
  
  * OTP - Passwordless but will need access to one's phone. Biometrics in rare cases can reject a valid user. Our OTP solution bridges the divide in these scenarios.
  
* **Self authentication** - In this model, a user can verify themselves. This is a well-known model and has been in use over the internet.

  * QR Code - By using a selfie image in a smartphone, one can authenticate locally on their phone and use the enrolled private key to release an authentication token. This mode allows the usage of a personal smartphone as an authenticator.

