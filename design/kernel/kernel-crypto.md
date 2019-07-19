# Encryption and Decryption

#### Background

This library can be used to encrpyt and decrypt data based on defined set of algorithms. It contains several methods that accept symmetric key and asymmetric key pairs for encryption and decryption.

- Symmetric key


- Asymmetric public key


- Asymmetric private key



#### Solution



**The key solution considerations are**


- Create an interface for encryptor and decryptor having required method declaration, which will be exposed to the other applications.


- Create a project which implements encryptor and decryptor with set of algorithms based on Java Crypto Extension (JCE) API.


- Encryptor and Decryptor can be used in any MOSIP module for encryption and decryption after adding crypto implementation to their class path



** Class Diagram**



![Class Diagram](_images/kernel-crypto-cd.png)




## Implementation


**kernel-crypto-jce** [README](../../../kernel/kernel-crypto-jce/README.md)