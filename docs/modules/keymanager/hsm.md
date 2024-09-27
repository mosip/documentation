# Hadware Security Module (HSM)

## Overview

The Hardware Security Module (HSM) is a highly secure physical device specifically designed and used for cryptographic processing and strong authentication. It encrypts, decrypts, creates, stores, and manages digital keys and is used for signing and authentication. HSMs may be accessed via PKCS11 and JCE interfaces.

To simulate HSM, the default sandbox installation uses [SoftHSM](https://github.com/mosip/mosip-infra/tree/release-1.2.0/deployment/v3/external/hsm/softhsm). SoftHSM supports PKCS11 but not JCE.

## JCE

JCE is a Java keystore class implementation that connects to HSMs. HSM vendors should provide JCE support.

## Specification

MOSIP highly recommends the following specifications for HSM:

1. Must support cryptographic offloading and acceleration.
2. Should provide authenticated multi-role access control.
3. Must have a strong separation of administration and operator roles.
4. Capability to support client authentication.
5. Must have secure key wrapping, backup, replication, and recovery.
6. Must support 2048, 4096-bit RSA private keys, and 256-bit AES keys on the FIPS 140-2 Level 3 Certified Memory of the Cryptographic Module.
7. Must support at least 10000+ 2048 RSA private keys on FIPS 140-2 Level 3 Certified Memory of the Cryptographic Module.
8. Must support clustering and load balancing.
9. Should support the cryptographic separation of application keys using logical partitions.
10. Must support M of N multi-factor authentication.
11. PKCS#11, OpenSSL, Java (JCE), Microsoft CAPI, and CNG
12. Minimum dual Gigabit Ethernet ports (to service two network segments) and, optionally, 10G Fibre ports could be available.
13. Asymmetric public key algorithms: RSA, Diffie-Hellman, DSA, KCDSA, ECDSA, ECDH, and ECIES
14. Symmetric algorithms: AES, ARIA, CAST, HMAC, SEED, Triple DES, DUKPT, and BIP32
15. Hash/message digest: SHA-1, SHA-2 (224, 256, 384, 512 bits).
16. Full Suite B implementation with fully licensed ECC, including Brainpool, custom curves, and safe curves
17. Safety and environmental compliance
    1. Compliance with UL, CE, and FCC Part 15 Class B.
    2. Compliance with RoHS2 and WEEE.
18. Management and monitoring
    1. Support remote administration —including adding applications, updating firmware, and checking the status— from NoC.
    2. Syslog diagnostics support
    3. Command Line Interface (CLI) or Graphical User Interface (GUI)
    4. Support the SNMP monitoring agent.
19. Physical characteristics
    1. Standard 1U 19-inch rack mount with integrated PIN ENTRY Device or Smart Card or any equivalent security.
20. Performance
    1. RSA 2048 signing performance: 10,000 per second.
    2. RSA 2048 key generation performance: 10+ per second.
    3. RSA 2048 encryption or decryption performance: 20000+ per second.
    4. RSA 4096 signing performance: 2000+ per second.
    5. RSA 4096 key generation performance: 2+ per second.
    6. RSA 4096 encryption or decryption performance: 20000+ per second.
21. Should be able to backup keys, replicate keys, and store keys in offline locker facilities for DR. The total capacity is in line with the total number of keys prescribed.
22. Clustering minimum of 20 HSMs.
23. Less than 30 seconds for key replication across the cluster.
24. A minimum of 30 logical partitions and their license should be included in the cost.

## Guide to Integrate HSM

## Configuration

* Keystore
  * `mosip.kernel.keymanager.hsm.keystore-type`
  * `mosip.kernel.keymanager.hsm.config-path`
  * `mosip.kernel.keymanager.hsm.keystore-pass`
* JCE
  * `mosip.kernel.keymanager.hsm.jce.className`
  * `mosip.kernel.keymanager.hsm.jce.keyStoreType`
  * `mosip.kernel.keymanager.hsm.jce.keyStoreFile`
  * `mosip.kernel.keymanager.hsm.jce.<ANY_OTHER_PARAM_01>`
  * `mosip.kernel.keymanager.hsm.jce.<ANY_OTHER_PARAM_02>`
