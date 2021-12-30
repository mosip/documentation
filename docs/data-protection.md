# Data Protection

Security of user data is given highest priority in MOSIP.  Data is protected in flight and rest using strong cryptographic techniques.  All operations on decrypted data are done in-memory. The same is illustrated across various data flows below:

## Registration data flow 
![](_images/cryptography-registration-flow.png)

1. Biometrics are signed by private key of device provider. The signature is verified by the registration client.
2. Registration client signs packet using TPM key of the machine, and encrypts packet using MOSIP public key specific to (registration center, machine id) combination.   
3. Registration processor stores received packets "as is" in Object Store.
4. ID Repo encrypts biometrics and documents and stores them in Object Store.
5. The UINs are hashed, encrypted and stored in `uin` table of `mosip_idrepo` DB.
7. Registration processor stores encrypted demographic data in `mosip_regprc` db. 

## Datashare
![](_images/cryptography-datashare.png)
Datashared with all partners is encrypted using partners' public key.  Note that IDA is also a partner, however, a sspecial partner in the sense that in addition data is also zero-knowledge encrypted before sending to IDA (see below section).

## Zero knowledge encryption
ID Authentication module (IDA) is an independent module and may be hosted by several providers. IDA hosts all the biometric templates and demographic data. A unique additional protection is provided here to make sure that mass decryption of user data is very difficult to achieve.  The data can only be decrypted if user's UIN is provided.  Here is the encryption scheme: 

Encryption and share by Credential Service:
1. Generate master symmetric encryption key (ZK-MASTER)
1. Generate 10,000 symmetric keys' pool (ZK-n). Encrypt each ZK-n with ZK-MASTER and store in DB.
1. Randomly select one key from ZK-n, decrypt using ZK-MASTER.
1. Create new key ZK-n' = ZK-n + UIN/VID/APPID.
1. Encrypt biometric templates using ZK-n' (BIO).
1. Encrypt ZK-n with IDA-PUBLIC_KEY (ZK-n-IDA)(this is to share the key with IDA) 
1. Share the following with IDA:
    1. ZK-n-IDA
    1. BIO
    1. Random index (1999) 
    1. Hash of UIN/VID/APPID
1. Share data in step 7 via standard [Datashare mechanism](#Datashare)  (which encrypts entire data with IDA's partner public key (normal datashare mechanims). 

Decryption by IDA:
1. Generate master symmetric encryption key (ZK-IDA-MASTER).
1. Decrypt data in Step 7 above using IDA partner private key.
1. Decrypt ZK-n-IDA to get ZK-n
1. Encrypt ZK-n with ZK-IDA-MASTER and store at random index.
1. BIO data is stored as is.
1. Decrypt BIO by creating key ZK-n' as in step 4 above.

## ID authentication flow
![](_images/cryptopgraphy-ida-flow.png)



