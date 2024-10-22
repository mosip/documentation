# Overview

### What is Inji Web?

Inji Web, akin to the [Inji Wallet](https://docs.mosip.io/inji/inji-mobile-wallet/overview), is a user-friendly web portal designed to facilitate the process of **securely downloading**, **storing**, **managing** and **sharing Verifiable Credentials** through a web interface. This easy-to-use platform enables users to access and store their credentials, ensuring confident presentation to service providers for verification and service access, with ease and reliability. Rooted by the principles of inclusivity, Inji Web endeavors to empower individuals to access benefits or services even without smartphones.

With its simple and intuitive interface, Inji Web offers features similar to the mobile wallet, catering to a variety of use cases. Whether you are a resident needing VCs for identity verification, a student seeking academic credentials, a professional verifying employment, or an organization enhancing business operations, Inji Web provides easy access to your credentials tailored to your specific needs.

By facilitating the issuance, verification and sharing of credentials in a secure and efficient manner, Inji Web plays a pivotal role in fostering trust amongst the service providers.

{% hint style="info" %}
_Inji Web application is built using the_ [_React framework_](https://react.dev) _and utilizes Mimoto as the BFF (Backend for Frontend). The digital verifiable credentials produced by the application adhere to the_ [_Verifiable Credentials (VC) Data Model_](https://www.w3.org/TR/vc-data-model/)_._
{% endhint %}

### How does Inji web work?

* Users can simply visit the Inji web portal, where they can select an issuer from the list of trusted options and choose the desired credential for download
* To proceed, users are required to authenticate themselves by providing relevant information such as National ID, Registration Number, Name, Date of Birth, etc., enabling them to securely manage, store, and share the credential
* Upon successful validation, the Verifiable credential is promptly downloaded as a PDF, along with a QR code issued by the Issuer
* Once downloaded, users have the flexibility to share the Verifiable credential with relying parties either as a physical copy or by facilitating QR code **scanning** or **uploading** the PDF on the verifier site
* As we progress, additional features are planned to be seamlessly integrated into Inji Web
* Inji ensures the integrity of digital signatures provided by issuers for each ID before Verifiable Credentials are downloaded as PDFs within the system
* Furthermore, Inji Web is designed to be compatible with the [OpenID](https://openid.net/developers/how-connect-works/) protocol, offering the flexibility to onboard various Identity Providers (IdP). This empowers users with multiple options for Verifiable Credential (VC) issuers

**Backend systems**

Inji Web interacts with:

* [Mimoto APIs](https://mosip.stoplight.io/docs/mimoto/5bf5a1n68g4tq-mimoto) for managing issuers details, facilitate VC download and generate PDF
* [eSignet APIs](https://mosip.stoplight.io/docs/identity-provider/jlmszj6dlxigw-e-signet) for authentication

### More on Inji Web:

To learn more about the **Features** provided by Inji Web, click [here](https://docs.mosip.io/inji/inji-web/functional-overview/features)

For information on the **Roadmap** for Inji Web, click [here](../../roadmap-2024.md).
