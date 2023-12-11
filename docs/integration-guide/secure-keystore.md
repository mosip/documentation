# Secure Keystore

Secure Keystore is a **React Native library exclusively for Android platform**. The devices which have a [Hardware Keystore](https://source.android.com/docs/security/features/keystore) can use this library to perform encryption, decryption and computation of HMAC on the native side using the Hardware backed security features.

# Installation

The Secure Keystore is an independent module which provides Android APIs for the same on React. On a React Native application this can be installed via

```shell
npm install mosip-react-native-secure-keystore
```

## Usage

1. for RSA based Key Pair

```js
import SecureKeyStore  from "mosip-react-native-secure-keystore";

// ...

if(!SecureKeyStore.deviceSupportsHardware) {
  return
}

const alias = "1234ab";
const data = "any data";

const publicKey = await SecureKeyStore.generateKeyPair(alias);

const signature = await SecureKeyStore.sign(alias, data)

```


2. for symmetric key

```js
import SecureKeyStore  from "mosip-react-native-secure-keystore";

// ...

if(!SecureKeyStore.deviceSupportsHardware) {
  return
}

const alias = "1234ab";
const data = "any data";

await SecureKeyStore.generateKey(alias);

const encryptedData = await SecureKeyStore.encryptData(alias, data)
const decryptedData = await SecureKeyStore.decryptData(alias, encryptedData)

```


# API documentation

### deviceSupportsHardware

`deviceSupportsHardware: boolean`

Check if the device supports hardware key store


### generateKey

`generateKey(alias: string) => void`

generates a symmetric key for encryption and decryption

### generateKeyPair

`generateKey(alias: string) => string`

generates a asymmetric RSA key Pair for signing

### encryptData

`encryptData(alias: string, data: string) => string`

Encrypts the given data using the key that is assigned to the alias. Returns back encrypted data as a string

### decryptData

`decryptData(alias: string, encryptionText: string) => string`

Decrypts the given encryptionText using the key that is assigned to the alias. Returns back the data as a string

### sign

`sign(alias: string, data: string) => string`

Create a signature for the given data using the key that is assigned to the alias. Returns back the signature as a string

### hasAlias

`hasAlias(alias: string) => boolean`

Check if the given alias is present in the key store
