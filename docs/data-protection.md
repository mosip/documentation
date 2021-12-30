# Data Protection

Security of user data is given highest priority in MOSIP.  Data is protected in flight and rest using strong cryptographic techniques.  The same is illustrated across various data flows below:

## Registration data flow 
![](_images/cryptography-registration-flow.png)

1. Biometrics are signed by private key of device provider. The signature is verified by the registration client.
2. Registration client signs packet using TPM key of the machine, and encrypts packet using MOSIP public key specific to (registration center, machine id) combination.   
3. Registration processor stores received packets "as is" in Object Store.
4. ID Repo encrypts biometrics and documents and stores them in Object Store.
5. The UINs are hashed, encrypted and stored in `uin` table of `mosip_idrepo` DB.
7. Registration processor stores encrypted demographic data in `mosip_regprc` db. 

## Datashare

## Zero knowledge encryption

## ID authentication flow



