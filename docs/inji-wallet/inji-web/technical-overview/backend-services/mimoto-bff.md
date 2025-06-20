# Mimoto - Backend for Frontend (BFF) for Inji Wallet

**Mimoto** serves as a Backend for Frontend (BFF) for Inji Wallet, handling secure retrieval of default configurations, user profile management, and downloading Verifiable Credentials (VCs). It exposes essential APIs to Inji Web, enforces validations, and securely forwards requests to relevant services.

### Security & Storage Enhancements:
All sensitive endpoints are now protected using session-based authentication. Only authenticated users (those who sign up via Google OAuth2) can access user-specific APIs.
User data, wallet information, and credentials are securely stored in PostgreSQL. This ensures persistence, reliability, and compliance with enterprise security standards.
User accounts created via Google are fully supported, with their metadata and credentials managed in the database.

### Onboarding Mimoto as an OIDC Client:
To support credential issuance from any issuer compatible with the **OpenID4VCI** protocol, Mimoto must be onboarded as an OIDC client. Refer [here](https://docs.mosip.io/inji/inji-mobile-wallet/customization-overview/credential\_providers#onboarding-mimoto-as-oidc-client-for-new-issuer) for more details on how to onboard Mimoto (BFF) as an OIDC client.

###  API Documentation:
Detailed API documentation for Mimoto is accessible [here](https://mosip.stoplight.io/docs/mimoto).

{% hint style="info" %}
Configuration details to set up a new provider that can issue VC, can be found in the `mimoto-issuers-config.json` property file. Refer to [mimoto-issuers-config.json](https://github.com/mosip/mosip-config/blob/collab-old/mimoto-issuers-config.json) of Collab environment.

In `mimoto-issuers-config.json`, new providers can be added as per the well-known schema.
{% endhint %}