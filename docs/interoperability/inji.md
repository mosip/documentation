# Inji

Inji enables the secure issuance, storage, exchange, and verification of data as verifiable credentials. It shifts from physical documents to a digital-first approach, simplifying service access, enhancing security, and supporting the growth of the digital economy.

### Inji Sub-modules

* **Inji Wallet:** Securely store and manage verifiable credentials.
  * **Mobile:** Access and manage digital credentials via the Inji Wallet mobile app.
  * **Web:** Securely interact with verifiable credentials through the web platform.
* **Inji Certify:** Issue and certify trusted digital credentials.
* **Inji Verify:** Confirm the validity of issued credentials.

### How eSignet Integrates with Inji

* **Credential Download:** eSignet authenticates users to download verifiable credentials via their national ID securely.
* **Key Binding:** Links user IDs to public keys, returning a signed Wallet User ID for secure identification.
* **Login & Authentication:** Enables secure login through Inji Wallet or compatible wallets.

eSignet leverages below plugins to achieve credential downloading and sharing:

* **Key Binding API**: Links user IDs with digital wallets.
* **VC Exchange API**: Shares verified credentials (VCs).

### Use Case

#### eSignet Integration with INJI Wallet for Secure Login

eSignet supports the download of user credentials as verifiable credentials (VC) into the INJI wallet after authenticating the user against the MOSIP national ID system. These VCs can then be used for secure login to the [health services portal](https://healthservices-esignet-mock.collab.mosip.net/) by scanning the QR code with the INJI wallet, providing a seamless and verified access experience.

* Learn more about[ Inji](https://docs.inji.io/).

To try it out yourself in our sandbox [Collab](https://collab.mosip.net/) environment, click [here ](../esignet-authentication/test/try-it-out/README.md)to access the eSignet Try It Out section. For step-by-step instructions, refer to our [end user guide](../esignet-authentication/test/end-user-guide/README.md).
