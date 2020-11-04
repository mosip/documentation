HSM stands for Hardware Security Module and is an incredibly secure physical device specifically designed and used for crypto processing and strong authentication. It can encrypt, decrypt, create, store and manage digital keys, and be used for signing and authentication. The purpose is to safeguard and protect keys.

MOSIP highly recommends the following specifications for HSM:

1. Must support cryptographic offloading and acceleration.
1. Should provide Authenticated multi-role access control.
1. Must have strong separation of administration and operator roles.
1. Capability to support client authentication.
1. Must have secure key wrapping, backup, replication and recovery.
1. Must support 2048, 4096 bit RSA Private Keys, 256 bit AES keys on FIPS 140-2 Level 3 Certified Memory of Cryptographic Module.
1. Must support at least 10000+ 2048 RSA Private Keys on FIPS 140-2 Level 3 Certified Memory of Cryptographic Module.
1. Must support clustering and load balancing.
1. Should support cryptographic separation of application keys using logical Partitions.
1. Must support M of N multi-factor authentication.
1. PKCS#11, OpenSSL, Java (JCE), Microsoft CAPI and CNG.
1. Minimum Dual Gigabit Ethernet ports (to service two network segments) and 10G Fibre port should be available.
1. Asymmetric public key algorithms: RSA, DiffieHellman, DSA, KCDSA, ECDSA, ECDH, ECIES.
1. Symmetric algorithms: AES, ARIA, CAST, HMAC, SEED, Triple DES, DUKPT, BIP32.
1. Hash/message digest: SHA-1, SHA-2 (224, 256, 384, 512 bit).
1. Full Suite B implementation with fully licensed ECC including Brainpool, custom curves and safe curves.
1. Safety and environmental compliance   	  
  1. Compliance to UL, CE, FCC part 15 class B.
  1. Compliance to RoHS2, WEEE.
1. Management and monitoring
  1. Support Remote Administration —including adding applications, updating firmware, and checking the status— from NoC.
  1. Syslog diagnostics support.
  1. Command line interface (CLI)/graphical user interface (GUI).
  1. Support SNMP monitoring agent.
1. Physical characteristics
  1. Standard 1U 19in. rack mount with integrated PIN ENTRY Device.
1. Performance
  1. RSA 2048 Signing performance – 10000 per second.
  1. RSA 2048 Key generation performance – 10+ per second.
  1. RSA 2048 encryption/decryption performance - 20000+.
  1. RSA 4096 Signing performance - 5000 per second.
  1. RSA 4096 Key generation performance - 2+ per second.
  1. RSA 4096 encryption/decryption performance - 20000+.
1. Should have the ability to backup keys, replicate keys, store keys in offline locker facilities for DR. The total capacity is inline with the total number of keys prescribed.
1. Clustering minimum of 20 HSMs.
1. Less than 30 seconds for key replication across the cluster.
1. A minimum of 30 logical partitions and their license should be included in the cost.