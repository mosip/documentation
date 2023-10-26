# Principles

eSignet is designed with the architectural principles mentioned below. These architecture principles are core to developing the system's features and greatly influence how and why specific software design patterns are used.


## Data Privacy

* As the user enters the ID directly on the eSignet page, the relying party does not have to store the ID, which could otherwise be used for profiling in case of data leaks. The relying party gets a privacy-enabled token that is unique to the relying party and the user and is called the PSUT (Partner Specific User Token).
* Sensitive data is protected (not stored or logged in clear form).
* Consent support: the user decides what data can be shared with the relying party.

## No Vendor Lock-in

* eSignet is vendor-neutral
* Any biometric device compatible with the IEEE P3167 SBI 2.0 specification can connect with eSignet

## Commodity Computing

eSignet backend services are designed to run as containers, which do not depend on any specialized hardware or specific cloud solutions. It can run on any general-purpose VM that supports Docker containers. This also helps in avoiding vendor lock-in.

## Secure By Default

* Encryption of data in flight or at rest.
* Integration with trusted applications only.
* Fraud avoidance: association of authentication only with specific transactions
* All data that goes out or that comes in is digitally signed by the respective sender.
* Any data sent to a relying party is encrypted.
* Protection against internal attacks: Every record in DB is protected with integrity.
* Centralized key management.
* All APIs are protected with OAUTH 2.0.
