# Digital signatures

#### Background

Digital signatures are needed in various places of the MOSIP system. Few example can be, in the Registration client, the operator like to digitally sign the packet. Or, every request from the server can be digitally once again signed by the server. 

#### Solution



**The key solution considerations are**

- Following are the steps to digitally sign the services in the system, 

1. Create a hash for the web service response using cryptomanager APIs. 

2. Encrypt the hash using the existing "/cryptomanager/v1.0/encrypt" service can be used. In the "referenceId", the value as "HASH" can be passed.

3. Once the has is encrypted, the encrypted hash is sent as part of the header. 

4. The client is supposed to have the latest public key which is active on that date. 

5. Signature have to be enforced in the all the API's which the server hosts. 

- Create a common utility java project which creates the signature. 

- Use this common utility project, attach the signature in all the response. 



**Module diagram**



![Module Diagram](_images/kernel-cryptography-digitalsignature.jpeg)



## Implementation


**kernel-crypto-signature** [README](../../../kernel/kernel-crypto-signature/README.md)


