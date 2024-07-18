# Data Protection

The security of user data is given the highest priority in MOSIP. Data is protected in flight and rest using strong cryptographic techniques. All operations on decrypted data are done in memory.

Various flows with encryption are illustrated below. Refer to [Keys](keys.md) for all references of the type 'Kx' and 'KPx'.

## Registration data flow

![](\_images/cryptography-registration-flow.png)

1. [Biometrics](biometrics.md) are signed by the private key of the device provider (PK2). The signature is verified by the Registration Client.
2. [Registration Client](registration-client.md) signs the packet using the TPM key of the machine (K10) and encrypts the packet using MOSIP public key specific to (the registration centre, machine id) combination (K11).
3. [Registration processor](registration-processor.md) stores packets created in (2) "as is" in [Object Store](object-store.md).
4. [ID Repository](id-repository.md) encrypts biometrics, demographics and documents and stores them in Object Store. (K7.1,K7.2,K7.3)
5. The UINs are hashed, encrypted and stored in `uin` the table of `mosip_idrepo` DB. (K7.4)
6. Biometrics are shared and encrypted with the ABIS partner's key (PK1).
7. Registration processor stores encrypted demographic data in `mosip_regprc` DB. (K11)

## Datashare

![](\_images/cryptography-datashare.png)

Data shared with all partners like ABIS, Print, Adjudication, IDA etc. is encrypted using partners' public key. Note that IDA is also a partner, however, a special partner in the sense that data is additionally zero-knowledge encrypted before sending to IDA (see the section below).

## Zero-knowledge encryption

The [ID Authentication](id-authentication.md) module (IDA) is an independent module and may be hosted by several providers. IDA hosts all the biometric templates and demographic data. Unique additional protection is provided here to make sure that mass decryption of user data is very difficult to achieve. The data can only be decrypted if the user's UIN is provided. Here is the encryption scheme:

### Encryption and sharing by Credential Service

1. Generate master symmetric encryption key K9.
2. Generate a 10,000 symmetric keys pool (ZKn). Encrypt each ZKn with K9 and store it in DB. (K12)
3. Randomly select one key from ZKn, and decrypt using K9.
4. Derive new key ZKn' = ZKn + UIN/VID/APPID.
5. Encrypt biometric templates and demographics.
   * BIO = encrypt(bio/demo with ZKn').
6. Encrypt ZKn (this is done to share ZKn with IDA).
   * ZKn-IDA = encrypt(ZKn with K22)
7. Share the following with IDA:
   1. ZKn-IDA
   2. BIO
   3. Random index (0 - 9999)
   4. SHA-256 hash of UIN/VID/APPID
8. Share data in step 7 via standard [Datashare encryption](data-protection.md#datashare) (which encrypts entire data with PK8).

### Decryption by IDA

1. Generate master symmetric encryption key K18.
2. Decrypt data in Step 8 above using PK8.
3. Decrypt ZKn-IDA with K22 to get ZKn.
4. Encrypt ZKn with K18 and store it at a random index.
5. Bio-data is stored as is.

## ID authentication flow

![](\_images/cryptography-ida-flow.png)

1. L1 devices contain [FTM](ftm.md) to encrypt (DE1, K21) and sign (FK1) biometrics at the source and send them to the authentication client.
2. The authentication client further encrypts the auth request with IDA-PARTNER public key.
3. IDA decrypts zero-knowledge data as given in [Step 4](data-protection.md#encryption-and-share-by-credential-service) and then performs a demographic and/or biometric authentication.
4. The match result is returned to Auth client. In the case of KYC, the KYC attributes are encrypted with the Partner's public key (as in [Datashare](datashare.md)).
