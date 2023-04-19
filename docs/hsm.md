# Hadware Security Module (HSM)

## Overview

Hardware Security Module (HSM) is a highly secure physical device specifically designed and used for crypto processing and strong authentication. It encrypts, decrypts, creates, stores and manages digital keys, and is used for signing and authentication. HSMs may be accessed via PKCS11 and JCE interfaces.

To simulate HSM, default sandbox installation uses [SoftHSM](https://github.com/mosip/mosip-infra/tree/release-1.2.0/deployment/v3/external/hsm/softhsm). SoftHSM supports PKCS11, but not JCE.

## JCE

JCE is Java keystore class implementation that connects to HSMs. JCE support is provided by HSM vendors.

## Specification

MOSIP highly recommends the following specifications for HSM:

1. Must support cryptographic offloading and acceleration.
2. Should provide Authenticated multi-role access control.
3. Must have strong separation of administration and operator roles.
4. Capability to support client authentication.
5. Must have secure key wrapping, backup, replication and recovery.
6. Must support 2048, 4096 bit RSA Private Keys, 256 bit AES keys on FIPS 140-2 Level 3 Certified Memory of Cryptographic Module.
7. Must support at least 10000+ 2048 RSA Private Keys on FIPS 140-2 Level 3 Certified Memory of Cryptographic Module.
8. Must support clustering and load balancing.
9. Should support cryptographic separation of application keys using logical Partitions.
10. Must support M of N multi-factor authentication.
11. PKCS#11, OpenSSL, Java (JCE), Microsoft CAPI and CNG.
12. Minimum Dual Gigabit Ethernet ports (to service two network segments) and 10G Fibre port should be available.
13. Asymmetric public key algorithms: RSA, DiffieHellman, DSA, KCDSA, ECDSA, ECDH, ECIES.
14. Symmetric algorithms: AES, ARIA, CAST, HMAC, SEED, Triple DES, DUKPT, BIP32.
15. Hash/message digest: SHA-1, SHA-2 (224, 256, 384, 512 bit).
16. Full Suite B implementation with fully licensed ECC including Brainpool, custom curves and safe curves.
17. Safety and environmental compliance    &#x20;
18. Compliance to UL, CE, FCC part 15 class B.
19. Compliance to RoHS2, WEEE.
20. Management and monitoring
21. Support Remote Administration —including adding applications, updating firmware, and checking the status— from NoC.
22. Syslog diagnostics support.
23. Command line interface (CLI)/graphical user interface (GUI).
24. Support SNMP monitoring agent.
25. Physical characteristics
26. Standard 1U 19in. rack mount with integrated PIN ENTRY Device.
27. Performance
28. RSA 2048 Signing performance – 10000 per second.
29. RSA 2048 Key generation performance – 10+ per second.
30. RSA 2048 encryption/decryption performance - 20000+ per second.
31. RSA 4096 Signing performance - 5000 per second.
32. RSA 4096 Key generation performance - 2+ per second.
33. RSA 4096 encryption/decryption performance - 20000+ per second.
34. Should have the ability to backup keys, replicate keys, store keys in offline locker facilities for DR. The total capacity is inline with the total number of keys prescribed.
35. Clustering minimum of 20 HSMs.
36. Less than 30 seconds for key replication across the cluster.
37. A minimum of 30 logical partitions and their license should be included in the cost.

## Guide to integrate HSM

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
