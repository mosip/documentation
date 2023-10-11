# Features

## One Login 

e-Signet offers a convenient feature called One Login, which allows users to access applications and access various services through a single interface. This feature provides a Single Sign-on (SSO) experience, eliminating the need for multiple logins. Additionally, e-Signet enables seamless login to any government service by utilizing a single credential through the existing ID repository.

## Passwordless Authentication

e-Signet implements a Passwordless login method that leverages authentication factors supported by our system. This approach enhances security by mitigating the potential risks associated with password-related security vulnerabilities, such as weak passwords, password reuse, and phishing attacks.

## Support for Multiple Authentication

### OTP Authentication

OTP authentication offers an additional level of security due to the short validity period of the OTP. In the case of logging in to e-Signet with OTP as the chosen method, our system generates a unique OTP and delivers it to the user via a registered communication channel, such as SMS or email. Upon receiving the OTP, the user can input it into the login interface. The system then compares the entered OTP with the generated one. If they match, the user is granted access to the system.

### Biometric Authentication

e-Signet can connect to any biometric device which complies to IEEE P3167 SBI 2.0 standards and perform secure biometric capture and enable authentication against an underlying ID system has capability to perform biometric authentication.

### Wallet-Based Authentication

Mobile wallet-based authentication can be utilized to scan a QR code and finalize the authentication process using the previously activated credentials for online login. Additionally, a facial authentication can happen on the wallet to make sure the presence is verified.

## Verifiable Credentials Issuance

VC refers to a set of claims about an authorized end-user that have been signed by an OAuth 2.0 credential issuer. This allows the VC to be securely presented to a relying party without involving the credential issuer. Our e-Signet platform supports the use of VC issuance through OAuth 2.0 authorization. Our system is able to issue VCs to digital credential wallets by utilizing OAuth 2.0 authorization. We implement OpenID4VCI for VC issuance, allowing us to issue VCs using the plugged-in credential issuer. Currently, we support the authorization-code flow to authorize the end-user, and support for the pre-authorize code flow will be available in the near future. Any digital credential wallets that adhere to the OpenID4VCI specification will be able to download the VC.

## Consent 

The Consent Registry is intended for the storage of user consent regarding claims and scopes requested during the login process to a relying party application. This can be done through either the e-Signet or the Wallet application (Inji).

Some key aspects to note about this feature are as follows:

* The user consent will be stored in the database in relation to the requested claims and scopes.
* If the consent has already been provided, the consent screen will be bypassed when the user logs in using e-Signet.
* In situations where there are changes to the requested claims or scopes, the user will be prompted to provide consent again.

## Language Support for e-Signet

The e-Signet user interface (UI) offers comprehensive language support to facilitate effective communication. By default, e-Signet includes language bundles for Arabic, English, Hindi, Kannada, and Tamil. Moreover, it can be easily customized to incorporate additional languages as necessary to accommodate specific country requirements. 

Furthermore, e-Signet has undergone meticulous testing to ensure seamless compatibility with right-to-left (RTL) languages. This means that users can rely on e-Signet to confidently navigate and interact with RTL content.