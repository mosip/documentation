
# Secure Keystore (Android & iOS)

Secure Keystore is a cross-platform cryptographic key management library for **Android** and **iOS**, supporting secure key generation, encryption/decryption, HMAC, and digital signatures using native platform security features (Android Keystore and iOS Keychain/Secure Enclave).

## Platforms Supported
- Android 6.0+ (Hardware-backed keystore)
- iOS 13.0+ (Secure Enclave + Keychain)

---

## Artifacts

  *  Maven Snapshots are available [here](https://repo1.maven.org/maven2/io/mosip/secure-keystore/)

## 📦 Installation



### iOS (Swift)

Using Swift Package Manager:

1. Open Xcode
2. Go to `File > Swift Packages > Add Package Dependency`
3. Use the URL: https://github.com/mosip/secure-keystore-ios-swift.git


### Android (Kotlin)

Add the following in your `settings.gradle.kts`:

```kotlin
dependencyResolutionManagement {
  repositories {
    google()
    mavenCentral()
    maven("https://oss.sonatype.org/content/repositories/snapshots/")
  }
}
```

In `build.gradle.kts`:

```kotlin
dependencies {
  implementation("io.mosip:secure-keystore:0.3.0")
}
```

---


## 📘 API Documentation

- `deviceSupportsHardware() => boolean`  
   Checks if the device supports secure hardware-backed keystore.

- `generateKey(alias, isAuthRequired, authTimeout?)`  
   Generates a symmetric key for encryption/decryption with optional biometric auth.

- `generateKeyPair(type, alias, isAuthRequired, authTimeout?)`  
   Creates a public-private key pair (RSA or EC) with optional authentication.

- `encryptData(alias, data, onSuccess, onFailure)`  
   Encrypts data using a symmetric key associated with the given alias.

- `decryptData(alias, encryptedText, onSuccess, onFailure)`  
   Decrypts previously encrypted data using the associated key alias.

- `sign(signAlgorithm, alias, data, onSuccess, onFailure)`  
   Signs data using the specified key and signature algorithm (RSA, ECDSA are supported).

- `generateHmacSha(alias, data, onSuccess, onFailure)`  
   Generates an HMAC signature using the specified alias and data.

- `generateHmacSha256Key(alias)`  
   Creates a symmetric key suitable for HMAC-SHA256 operations.

- `hasAlias(alias) => boolean`  
   Checks if a key exists for the specified alias.

- `removeKey(alias)`  
   Deletes the key associated with the given alias from the keystore.

- `removeAllKeys()`  
   Clears all keys stored in the keystore.

- `retrieveKey(alias)`  
   Retrieves the public key for the specified alias.

- `storeGenericKey(publicKey, privateKey, account)`  
   Stores a custom key pair in the keychain/keystore linked to an account.

- `retrieveGenericKey(account)`  
   Retrieves the stored key pair associated with the specified account.
---
