# Architecture

\
Inji Certify leverages the following components (from existing building blocks/products):

1. eSignet (v1.4.0): VCI microservice and Authentication microservice
   1. **eSignet service**:
      1. Implements OpenID Connect flows that help the relying party perform quick and easy integrations using pre-existing libraries for user verification.
      2. Exposes API for VCI Issuance which internally connects with credential service and sends the Verifiable Credential (VC) issued by the service as a response
   2. **OIDC UI:**
      1. The user interface component of eSignet, Manages user authentication and user consent. Integrates with the REST endpoints provided by esignet-service.&#x20;
   3. **VCI Plugin:**
      1. Provides support to generate credentials from existing Sunbird registry
2. Sunbird RC (v2.0.0): Identity microservice, Schema microservice, and Cred microservice
   1. **Identity Service :**&#x20;
      1. The central lynchpin to maintain identities across the system. All identities in Sunbird-RC are DID-compliant and are web-resolvable. The other microservices (Credential Schema Service and Credential Service) depend on this for generating any identity.&#x20;
         1. Docker Image: [http://ghcr.io/sunbird-rc/sunbird-rc-identity-service:v2.0.0-rc1](http://ghcr.io/sunbird-rc/sunbird-rc-identity-service:v2.0.0-rc1) &#x20;
         2. Depends on the vault (healthy), database.&#x20;
   2. **Credential Schema service:**&#x20;
      1. Stores the schema of the Verifiable Credential along with the associated view template.&#x20;
         1. Docker Image: [http://ghcr.io/sunbird-rc/sunbird-rc-credential-schema:v2.0.0-rc1](http://ghcr.io/sunbird-rc/sunbird-rc-credential-schema:v2.0.0-rc1) &#x20;
         2. Depends on identity service, and database.&#x20;
   3. **Credential service:**&#x20;
      1. Core issuance service. Called with the payload, which is then transformed into a W3C-compliant Verifiable Credential in JSON-LD format. The payload is then signed using the private key which was generated as part of the original Issuer creation.&#x20;
         1. Docker Image: [http://ghcr.io/sunbird-rc/sunbird-rc-credentials-service:v2.0.0-rc1](http://ghcr.io/sunbird-rc/sunbird-rc-credentials-service:v2.0.0-rc1) &#x20;
         2. Depends on identity service, schema service, and database.
   4. **Vault Service:**&#x20;
      1. &#x20;to be included as a dependency along with the pg.
      2. Hashi Corp vault is the Keystore which acts as the vault service.&#x20;
      3. Identity service is dependent on the vault service.&#x20;
      4. Stores key pairs and secrets for the issuers
