# 🔐 Privacy and Security

MOSIP's fundamental architecture and design incorporate the highest levels of privacy and security.

## Security by design

Key security features:

* Encryption of data in-flight or rest. (See [Data Protection](data-protection.md))
* Integration with trusted applications only.
* Fraud avoidance - association of authentication only with specific transactions.
* Misuse prevention - user can lock or unlock their authentication.
* Virtual ID and Tokens to prevent identity theft.
* All data sent out of MOSIP will be digitally signed.
* All incoming data will be signed by the respective entity.
* Any data sent to a relying party will be encrypted.
* Protection against internal attacks with every record in DB protected with integrity.
* Centralized key management.
* All API's are protected with OAUTH 2.0.

## Privacy by intent

Key privacy features:

* Minimal data with selective disclosure on a need-to-know basis.
* Sensitive data protected (not stored or logged in clear form).
* Consent support – the user decides who can receive what credentials & what attributes.
* No search on the database (You can find a record only if you know the ID).
* Clear segregation of Biometric & Demographic data.
* De-centralised ID usage and data (cannot profile based on usage).
* Users are not limited to one permenant ID - Virtual ID.
* All relying party gets a privacy enabled tokens to prevent profiling across transactions. Permenant ID is never shared.
* Supports Wallet based decentralized ID issuance and usage.
* Face data is not sent to ABIS for deduplication.
