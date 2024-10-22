# Tuvali

This is the module that supports transferring verifiable credentials (VC) over Bluetooth Low Energy (BLE).

Let's have a look at how BLE communication works in general between the two devices A & B.

## Repository:

* [tuvali](https://github.com/mosip/tuvali) presents the kotlin library for tuvali
* [tuvali-ios-swift](https://github.com/mosip/tuvali-ios-swift) to get details on swift artifact.
* [tuvali](https://repo1.maven.org/maven2/io/mosip/tuvali/) contains the artefacts in maven.

## Installation:

### Usage as a Kotlin library (for native android)

1. In build.gradle.kts add the following:

```kotlin
    dependencies {
        implementation("io.mosip:tuvali:0.5.0-SNAPSHOT")
    }
```

The kotlin library has been added to your project.

### Usage as a Swift library (for native ios)

1. Download swift artifact (ios-tuvali-library) from the repository.
2. Open your project in XCode.
3. Goto File > Add Package Dependencies.
4. Select Add Local option.
5. Add the artifact folder.

The swift library has been added to your project.

Before we understand how Tuvali works, let's go through BLE communication.

## How does BLE Communication work?

![BLE Communication](../../../../../.gitbook/assets/ble-high-level-comm-generic.png)

In BLE communication, one device is designated as Peripheral and another one designated as Central.

Peripheral can perform advertisement which can be read by a Central device and connected to it, if the advertisement is connectable.

Once the connection is made, Central can perform further actions on the device like

* discovering services and characteristics
* subscribing to notifications on characteristics
* write/ read data from characteristics
* disconnect from device

While peripheral can perform actions like

* sending notifications to subscribed characteristics
* respond to read requests from Central

The above diagram explains the sequence of actions for BLE communication in general.

1. Advertisement from Peripheral
2. Connection establishment & additional data exchange
3. Service & Characteristic discovery from Central
4. The characteristic subscription on Peripheral
5. Write with response to characteristic
6. Write without response to the characteristic
7. Send Notification from GATT Server
8. Disconnection from GATT Server/ Client

More details about other BLE terminology used here can be found in standard BLE specifications of 4.2 and above.

## How Tuvali works with BLE to transfer VC from Central to Peripheral

![OpenID for VP over BLE Implementation](../../../../../.gitbook/assets/openid-for-vp-over-ble-spec-impl.png)

> Note: Tuvali is supposed to implement OpenID for VP over BLE specification. As part of it, both VP request and response transfer should be implemented. However the current version of Tuvali only transfers VC from Central to Peripheral.

In the case of Tuvali, the entire VC transfer flow can be divided into the following stages

1. Connection Setup & Cryptographic key exchange
2. Data transfer
3. Connection Closure

### 1. Connection Setup & Cryptographic key exchange

Steps 1 to 6 mentioned in the above diagram explain how the first stage is achieved. Before even the advertisement is started, the peripheral generates a 32-byte public key. This public key is sent to Central in two parts. The first part will have 5 bytes of the public key sent as part of the advertisement payload and while the second part is sent as part of SCAN\_RESP.

Since the advertisement from Peripheral is of connectable type, Central would send out a SCAN\_REQ on receiving the advertisement and gets the remaining 27 bytes of the peripheral public key. Post that, Central would derive a public key pair and send its 32 bytes public key on Identify characteristic of Peripheral.

Once the public keys are exchanged between Central and Peripheral, a set of keys are derived on both sides which would be used for encryption and decryption of data on the wire.

> Cryptographic Algorithm usage:
>
> * Ephemeral Key Pair is generated from X25519 curve
> * Key Agreement uses ECKA-DH (Elliptic Curve Key Agreement Algorithm – Diffie-Hellman) as defined in BSI TR-03111
> * Wallet and Verifier derives respective keys using HKDF as defined in RFC5869
> * Encryption/Decryption uses AES-256-GCM (192) (GCM: Galois Counter Mode) as defined in NIST SP 800-38D

### 2. Data transfer

Steps 7 to 11 mentioned in the above diagram explain how the second stage is achieved. Before VC is transferred, Central performs encryption and compression and communicates the resultant data size by writing to Response Size characteristic to Peripheral. The actual data transfer would happen on `Submit Response` characteristic.

Since the maximum allowed write value for a characteristic is limited to 512 bytes. The actual VC data is split by a component called Chunker into multiple smaller chunks. After the split, the data is transferred on the `Submit response`characteristics one after another until all chunks are completely sent.

Peripheral on the other hand, receives data on the `Submit response` characteristic. The received chunks are collected and the final VC is assembled by a component called Assembler.

At the end of sending one frame of data from Central. It would request a transfer report via `Transfer report request` characteristic. Peripheral response with a summary of missing/corrupted chunks sequence numbers via another `Transfer report summary` characteristic.

Central would read the Transfer report summary to understand if the Peripheral received all the chunks properly. If the summary report has at least one chunk sequence number. Central would send those specific chunks to the Peripheral which is called the Failure frame.

The failure frame will be sent from Central repeatedly until the Transfer report summary is successful. If during the process, Central reached the maximum allowed failure frame retry limit, the transfer is halted, devices will be disconnected and an error is generated (Please refer to API documentation on how this error can be read).

> * Gzip is the Compression algorithm used with default compression level
> * Each chunk have 2 bytes of CRC-16/Kermit added. Parameters for the same are: width=16 poly=0x1021 init=0x0000 refin=true refout=true xorout=0x0000 check=0x2189 residue=0x0000 name="CRC-16/KERMIT"

### 3. Connection closure

#### Disconnect initiated by Peripheral:

* On a successful data transfer
* On non-recoverable error occurred on Peripheral

Peripheral notify Central to perform disconnection via `Disconnect` characteristic mentioned in Step 12 of the above diagram.

#### Disconnect initiated by Central

Central also performs disconnect in the following scenarios:

* On a successful data transfer
* Non-recoverable error on Central
* Peripheral is out of range/ disconnected
* Destroy Connection API

As part of connection closure, both central and peripheral clean the held resources, cryptographic keys, and Bluetooth resources, to ensure that the subsequent transfer happens smoothly.

> **Note**: All the cryptographic keys generated/ derived are used only for a single VC transfer session. The library strictly ensures they are not re-used in subsequent VC transfers post connection closure.

## Error Codes And Error Scenarios:

**Error Code Format:** \<Component(2 Character)Role(1 Character)>-\<Stage(3 Character)>-\<Number(3 Character)>

Current Supported Stages: CON(Connection) | KEX(Key Exchange) | ENC(Encryption) | TRA(Transfer) | REP(Report) | DEC(Decryption) | UNK (Stage is unknown) Current Component+ Role Combinations: TVW(Tuvali+Wallet) | TVV(Tuvali+Verifier) | TUV(Tuvali where role is unknown)

**List of Supported Error Codes:**

* UnknownException: TUV\_UNK\_001
* WalletUnknownException: TVW\_UNK\_001
* CentralStateHandlerException: TVW\_UNK\_002
* WalletTransferHandlerException: TVW\_UNK\_003
* VerifierUnknownException: TVV\_UNK\_001
* PeripheralStateHandlerException: TVV\_UNK\_002
* VerifierTransferHandlerException: TVV\_UNK\_003
* InvalidURIException: TVW\_CON\_001
* MTUNegotiationException: TVW\_CON\_002
* ServiceNotFoundException: TVW\_CON\_003
* TransferFailedException: TVW\_REP\_001
* UnsupportedMTUSizeException: TVV\_CON\_001
* CorruptedChunkReceivedException: TVV\_TRA\_001
* TooManyFailureChunksException: TVV\_TRA\_002

### Error Scenario 1: The verifier receives a `Failed to transfer` message and wallet receive a `Disconnected` message on the screen.

**Possible error scenarios:**

* During VC transfer, if there is a failure in the transfer of more than 70% of the data we get an exception on the verifier side and it disconnects from the wallet.
* After the verifier and wallet establish a connection, the wallet initiates an MTU negotiation with the verifier. If the negotiated MTU is less than 64 Bytes, then the verifier throws an exception and disconnects from the wallet.
* If the verifier receives the size of the VC as 0, it raises an exception and disconnects from the wallet.

### Error Scenario 2: The wallet receives a `Failed to transfer` message and the verifier receives a `Disconnected` message on the screen.

**Possible error scenarios:**

* After the verifier and wallet establish a connection, the wallet initiates an MTU negotiation with the verifier. If the wallet is unable to negotiate the MTU with the verifier, it raises an exception and disconnects from the verifier.
* During VC transfer, if the transfer cannot be completed within the specified limit of retries, the wallet raises an exception and disconnects from the verifier.
* After the wallet sends all the chunks, it requests a transfer report. If the wallet is not able to send the request, it raises an exception and disconnects from the verifier.

Below are the exception message and the disconnect message which appears on the screen during the error.

![Exception Message](../../../../../.gitbook/assets/failedToTransferError.jpeg)

> This message is displayed on the device throwing the exception.

> <img src="../../../../../.gitbook/assets/disconnect-message.png" alt="" data-size="original">
>
> This message is displayed whenever a device gets disconnected.

## Retry scenarios

*   **Backoff Strategy**: Exponential Backoff is a technique that retries a failing operation, with an exponentially increasing wait time, up to a maximum retry count(MAX\_RETRY\_LIMIT) or maximum backoff time(MAX\_ELAPSE\_TIME).

    Initially, it starts with 2 ms as wait time (INITIAL\_WAIT\_TIME) and increases exponentially with each failure until the count reaches MAX\_EXPONENT after which the wait time becomes constant (INITIAL\_WAIT\_TIME ^ MAX\_EXPONENT).

    * **BLE Service Discovery**: After the connection is established, the central attempts to discover all the services hosted by the peripheral. If it fails to discover our service, then the exponential backoff-based retry will kick in. Here are the values:
      * MAX\_RETRY\_LIMIT is 5 for Android and 10 for IOS
      * MAX\_ELAPSE\_TIME is 100 ms
      * MAX\_EXPONENT is 5
    * **Request Transfer Report** \[only for iOS]: After the wallet writes all the chunks to the verifier, it requests the transfer report. If the transfer report request write fails, then the exponential backoff-based retry will kick in. Here are the values:
      * MAX\_RETRY\_LIMIT is 5
      * MAX\_ELAPSE\_TIME is 100 ms
      * MAX\_EXPONENT is 5
* **Dynamic MTU negotiation**:
  * **Android**: After the connection is established, the wallet initiates an MTU negotiation with an initial value of 512 bytes. If it fails, it retries with 185 and 100 bytes subsequently with a wait time of 500 ms each. If the negotiation fails after all retries, it throws an exception and disconnects from the wallet.
  * **iOS**: iOS kicks off an MTU exchange automatically upon connection

## Constants

* MAX\_ALLOWED\_DATA\_LEN (509 Bytes): Maximum data length allowed for one write for both wallet and verifier.
* MIN\_MTU\_REQUIRED (64 Bytes): Minimum number of bytes required to share public key transfer of the wallet is 46. In order not to operate in edges, we chose the nearest value in the power of 2 i.e., 64.
* MAX\_FAILURE\_FRAME\_RETRY\_LIMIT (15): Maximum limit to retry sending failure chunks to the verifier.

## Characteristics UUID

* IDENTIFY\_REQUEST\_CHAR\_UUID (00000006-5026-444A-9E0E-D6F2450F3A77): Characteristic for sending the public key of the wallet.
* REQUEST\_SIZE\_CHAR\_UUID (00000004-5026-444A-9E0E-D6F2450F3A77): Characteristic for requesting VC size by wallet from verifier.
* REQUEST\_CHAR\_UUID (00000005-5026-444A-9E0E-D6F2450F3A77): Characteristic for requesting the VC by the verifier.
* RESPONSE\_SIZE\_CHAR\_UUID (00000007-5026-444A-9E0E-D6F2450F3A77): Characteristic for sending VC size to the verifier.
* SUBMIT\_RESPONSE\_CHAR\_UUID (00000008-5026-444A-9E0E-D6F2450F3A77): Characteristic for sending the entire VC.
* TRANSFER\_REPORT\_REQUEST\_CHAR\_UUID (00000009-5026-444A-9E0E-D6F2450F3A77): Characteristic for requesting for transfer report from the verifier.
* TRANSFER\_REPORT\_RESPONSE\_CHAR\_UUID (0000000A-5026-444A-9E0E-D6F2450F3A77): Characteristic for sending transfer report to the wallet
* VERIFICATION\_STATUS\_CHAR\_UUID (00002037-0000-1000-8000-00805f9b34fb): Characteristic for informing the wallet if the VC is accepted or rejected.
* DISCONNECT\_CHAR\_UUID (0000000B-5026-444A-9E0E-D6F2450F3A77): Characteristic for notifying the wallet to initiate the disconnection between the devices.

## Service UUID

* SERVICE\_UUID (00000001-0000-1000-8000-00805f9b34fb): Service UUID of the verifier
* SCAN\_RESPONSE\_SERVICE\_UUID (00000002-0000-1000-8000-00805f9b34fb): Service UUID for uniquely identifying the scan response data to the wallet's SCAN\_REQ
