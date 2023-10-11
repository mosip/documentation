# Architectural Principles

e-Signet follows a microservice-based architecture.

e-Signet is designed with the architectural principles mentioned below. These architecture principles are core to developing the system's features and greatly influence how and why specific software design patterns are used.

## Open Standards

e-Signet flows open standards such as,

* OAuth 2.0: <brief description>
* OpenID Connect: <brief description>
* OpenID4VCI: <brief description>
* IEEE P3167 SBI 2.0: <brief description>

As e-Signet follows OpenID Connect, it gets a lot of client libraries for integration. Hence, avoid custom code building for integration.

## Data Privacy

* As the user enters the ID directly on the e-Signet page, the relying party does not have to store the ID, which could otherwise be used for profiling in case of data leaks. The relying party gets a privacy-enabled token that is unique to the relying party and the user and is called the PSUT (Partner Specific User Token).
* Sensitive data is protected (not stored or logged in clear form).
* Consent support: the user decides what data can be shared with the relying party.

## No Vendor Lock-in
* e-Signet is vendor-neutral
* Any biometric device compatible with the IEEE P3167 SBI 2.0 specification can connect with e-Signet

## Commodity Computing

## Fault-tolerant

## Manageable

## Secure By Default

* Encryption of data in flight or at rest.
* Integration with trusted applications only.
* Fraud avoidance: association of authentication only with specific transactions.
* All data that goes out or that comes in is digitally signed by the respective sender.
* Any data sent to a relying party is encrypted.
* Protection against internal attacks: Every record in DB is protected with integrity.
* Centralized key management.
* All APIs are protected with OAUTH 2.0.