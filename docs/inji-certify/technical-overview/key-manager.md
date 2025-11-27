# Key Manager

### Overview

The Key Manager in Inji Certify is a critical component which is used as an embedded library responsible for secure cryptographic key lifecycle management. It handles:

* generation of asymmetric and symmetric keys
* storage and encryption of private keys
* certificate management (self-signed and externally signed)
* digital signing operations (e.g., signing Verifiable Credentials)
* key rotation and revocation
* secure integration with hardware-backed key stores (e.g., HSM)

By consolidating these cryptographic operations in one trusted service, Certify ensures the integrity, confidentiality, and long-term security of all cryptographic materials.

#### Capabilities & Responsibilities

Below are the main capabilities and how Key Manager supports them in Inji Certify:

#### Key Generation

* The Key Manager generates various types of keys: root/master keys, module-level keys, and application-specific (base) keys.
* Asymmetric algorithms such as RSA, ECC, Ed25519 etc., are used based on the VC configuration.
* Root and module master keys can be generated at the time of installation of Inji Certify
* Base keys (application-specific) are auto-generated as needed.

#### Secure Storage

* Private keys are stored securely in a key store. In Inji implementation, a Hardware Security Module (HSM) is used to store root and master keys, while base keys are stored in a database encrypted by module keys.
* Key metadata (aliases, identifiers) is maintained in a key-alias table; the encrypted key material resides in a key-store table.
* The Key Manager supports integration with HSMs via PKCS#11 or JCE.

#### Certificate Management

* Self-Signed Certificates: When no external CA is provided, the Key Manager can generate self-signed certificates. For example, root key is self-signed.
* CSR Generation: It supports generating CSR (Certificate Signing Requests) for any key, so that you can obtain a certificate signed by an external CA.
* Uploading Externally-Signed Certificates: Once you obtain a CA-signed certificate, you can upload it to the Key Manager, updating existing certificate with CA signed certificate.

#### Signing & Cryptographic Operations

For signing credential (VC) issuance, the Key Manager uses the appropriate key (module or base) and the associated certificate to sign the VC payload.

#### Key Rotation

* Automatic Rotation: Keys have default validity periods. For example, in MOSIP, root keys are valid for \~5 years, module keys for \~3 years, base keys for \~2 years.
* Forced Rotation: Admins can force key regeneration via APIs (e.g., a generateMasterKeyAPI) with a “force” flag. Existing keys are invalidated and new ones generated.
* On expiry, key manager automatically generates new keys and ensures that cryptographic operations switch over to the new valid keys.
* Duration of key rotation is configurable which is handled through a table named as “key-policy-def“
* Key manager has the capability to pre generate keys before expiry. Duration for the pre generation is a configurable which is handled through a table named as “key-policy-def“

#### Certificate Expiry Handling

In case of externally CA signed certificate is used for key generation, and certificate expires, the system falls back: Key Manager re-generate keys using a self-signed certificate (or whatever default mechanism is configured).

* Mitigation: To avoid lapse in trust or broken signing, users (issuer administrators) must proactively upload a new valid certificate before the current one expires.

#### Integration with Hardware Security Module (HSM)

The Key Manager is designed to work with HSMs, ensuring that root and module keys never leave secure hardware.

* For setups without HSM, the Key Manager also supports other keystore types (PKCS12), configurable via properties. (This option is not recommended during the production environment)
* Role of Key Manager Specifically in VC Signing Workflow (In Certify)
* Putting the above capabilities in the context of Verifiable Credential (VC) issuance in Inji Certify:
* Initial Setup (If PKI is already existing)
* The system admin uses Inji Certify API which internally uses KeyManager service to generate a master signing key pair.
* The admin can request a CSR from Inji Certify API for the generated signing key (via generateCSR), so they can share it to be externally singed by CA
* Once the certificate is signed, they upload the CA certificate to Inji Certify, then upload their signed certificate, binding it to the key.

#### Credential Issuance

When Certify issues a VC, it calls Key Manager to sign the credential payload.

* Key Manager uses the private key associated with the signing key (which is backed by the uploaded certificate) to compute a digital signature.
* The signed VC thus has cryptographic integrity and can be verified by relying parties using the public certificate.

### Key Benefits for Inji Certify

* Security & Trust: All signing keys are managed securely; private keys are never exposed, especially when using HSM.
* Flexibility: Support both self-signed workflows (for simplicity) and externally-CA-signed certificates (for integration into existing PKI).
* Operational Control: Administrators have full control over key lifecycles, rotation, and certificate management.
* Interoperability: By using standard cryptography and certificate formats, Certify’s VCs can be validated by any compliant verifier.
* Resilience: With key-rotation and fallback mechanisms, the system can recover from certificate expiry or compromise.

For deeper technical details about the Key Manager component itself, you can refer to the MOSIP documentation here
