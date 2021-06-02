# Crypto Services

## Cryptography Services
Crypto service encrypts or decrypts data across MOSIP with the help of Public/Private Keys.

### For Encryption
The Crypto Service receives a request from an application with input parameters – Application ID, Reference ID, Timestamp, and the Data which needs to be encrypted. 
The service then calls the Key Generator API to get a symmetric Key and encrypts the data using that symmetric Key. 

The service then calls the Key Manager Service with the Application ID and timestamp received in the input parameters and gets the public key. 

The service then encrypts the symmetric key using the Public key and joins the Encrypted data and Encrypted Symmetric Key using a Key splitter and responds to the source with the joined data.

### For Decryption
The Crypto Service will receive a request from an application with input parameters – Application ID, Reference ID, Timestamp, and Data that needs to be decrypted. 

The Application ID received will be the one, which was sent for encryption of data in the above flow. 

The Crypto Service then splits the received data into Encrypted Content and Encrypted Symmetric Key using the Key Splitter and then calls the Key Manager Service with the Encrypted Symmetric Key, Application ID and Timestamp to decrypt the data using private key.

The Key Manager instead of responding with the private key, decrypts the symmetric itself and send it back to the crypto service. The service then uses this symmetric key to decrypt data and send the decrypted data back to the source.

## Key Generator

### Generate a Symmetric Key

Upon receiving a request to generate symmetric key pair the system generates a key pair (public and private key) as defined below and responds with the symmetric key
* The symmetric key generated supports AES algorithm
* The symmetric key generated is of 256 bit size
* The symmetric will be returned as a byte array

### Generate an Asymmetric Key

Upon receiving a request to generate asymmetric key pair the system generates a key pair (public and private key) as defined below and responds with the Asymmetric key
* The asymmetric key pair is generated using the RSA encryption
* The asymmetric key pair generated is of 2048 bit size
* The asymmetric is returned as a byte array

## Key Management

1. The Key Manager Service works together with the Crypto Service. 
1. It receives a request from Crypto Service from Public Key with the Application ID and Timestamp. 
1. Key Manager Service then sends a valid Public key against the application ID received to Crypto Service. 
1. In case, the public key is expired against that Application ID, it will generate a new Public Key and respond with it.
1. When there is a request to decrypt data, the private key of the application id or reference id is used. The Key manager will not respond with Private Key but instead takes the encrypted data from the source and decrypts it itself and responds with decrypted content

## Crypto Utility

The crypto utility is supports encryption and decryption. It provides a utility called as key splitter which performs following functions:

1. It combines the encrypted data and encrypted the symmetric key while sending encrypted content to the source
2. It also splits the encrypted data and encrypted the symmetric key while receiving the content for decryption
 
## Hash Utility 

1. Identifies hash util methods
1. Creates wrapper class for methods defined in apache-commons hash util
1. Raises an alert in case of listed

## HMAC Utility/Checksum Utility

A HMAC/checksum function is a way to create a compact representation of an arbitrarily large amount of data 
