# Tuvali API Documentation

Firstly, for establishing the secured connection over BLE the connection params which include `name` and `key` needs to be exchanged between the two devices. This exchange of parameters can be accomplished but is not limited to by using a QR code.

For example, use a QR code generator to visually display params and a QR code scanner to get params. A mobile app that displays a QR code can act as an `Verifier` by including its connection params as data in the QR code and another device can act as `Wallet` which scans the QR code, it can extract the connection parameters and initiate a BLE connection with the advertising device.


## Connection parameters exchange

* The device on which the QR code is displayed shall generate connection parameters using the `startAdvertisement()` method:

```
var verifier = Verifier()
var uri = verifier.startAdvertisement()
println(uri)
```

* The device that scans the QR code will extract the connection parameters from the QR code and set its connection parameters using the `startConnection()` method :

```
var wallet = Wallet()
wallet.startConnection(uri)
```

The connection param is a URI with a name & a key. The `name` is the client's name & the `key` is the verfier's public key.

```log
OPENID4VP://connect:?name=OVPMOSIP&key=69dc92a2cc91f02258aa8094d6e2b62877f5b6498924fbaedaaa46af30abb364
```

* The `key` part of the data is the same data that will be advertised by the `verifier` device but in hex-encoded form.

&#x20;  E.g: OVPMOSIP://connect:?name=\<\>&key=\<verifier public key\>


## Establishing connection

The device that displays the QR code will become `Verifier`

```
const uri = verifier.startAdvertisement();
```

and the other device that scans the QR code will become `discoverer` and will attempt to discover the devices based on the pre-exchanged `uri`.

```
wallet.startConnection(uri);
```

## Share data

Once the connection is established, wallet app can send the data

```
wallet.sendData(payload);
```
and verifier app can acknowledge it.

```
verifier.sendVerificationStatus(status);
```

The following sequence of actions should be performed to transfer data over BLE:

1. Verifier must start advertising by calling `verifier.startAdvertisement(name)` method
2. Subscribe to events using `wallet.handleDataEvents`
3. Initiate the secure connection using `wallet.startConnection(uri)`. The Wallet public keys are exchanged with verifier on successful connection.
4. Wallet calls `wallet.sendData(payload)` to transfer requisite data over BLE.
5. Send VC response - Verifier can exchange "Accept/Reject" status to Wallet with the following message type for `verifier.sendVerificationStatus` method

## Subscribe to events

Data received from other apps via BLE can be subscribed to using:
Tuvali sends multiple events to propagate connection status, received data etc. These events can be subscribed to by calling:

on Wallet:

```
wallet.subscribe {
  event  ->
  // Add the code that needs to run once event is received
}
```

on Verifier:

```
verifier.subscribe {
  event  ->
  // Add the code that needs to run once data is received
}
```
Here are the different types of events that can be received

### Common Events
Events which are emitted by both Wallet and Verifier

1. ConnectedEvent
   * on BLE connection getting established between Wallet and Verifier
2. SecureChannelEstablishedEvent
   * on completion of key exchange between Wallet and Verifier
3. ErrorEvent
   * on any error in Wallet or Verifier
4. DisconnectedEvent
   * on BLE disconnection between Wallet and Verifier


### Wallet Specific Events

1. DataSentEvent
   * on completion of Data transfer from the Wallet Side
2. VerificationStatusReceivedEvent
   * on received verification status from Verifier

### Verifier Specific Events

1. DataReceivedEvent
  * on receiving data from the Wallet Side

## Connection closure

The device on which app is running can destroy the connection by calling disconnect() method:

```
wallet.disconnect();
verifier.disconnect();
```

## Tuvali & Inji Integration

```mermaid
sequenceDiagram
    participant Inji Verifier
    participant Tuvali Verifier

    participant Tuvali Wallet
    participant Inji Wallet
    
    rect white
        Inji Verifier ->> Tuvali Verifier: disconnect()
        Inji Verifier ->> Tuvali Verifier: handleDataEvents()
        Tuvali Verifier --) Inji Verifier: "onDisconnected"

        Inji Verifier ->> Tuvali Verifier: startAdvertisement
        Tuvali Verifier ->> Tuvali Verifier: "starts BLE advertisement"

        Tuvali Verifier --) Tuvali Wallet: advertisement
        Inji Wallet ->> Tuvali Wallet: handleDataEvents()

        Inji Wallet ->> Inji Wallet: starts scanning for QR

        Inji Wallet ->> Tuvali Wallet: startConnection(uri)


        Tuvali Wallet -->> Tuvali Verifier: BLE connection
        Tuvali Wallet ->> Inji Wallet: "onConnected"
    end

    rect white
        Inji Wallet ->> Tuvali Wallet: sendData('<VC>')
        Tuvali Wallet -->> Tuvali Verifier: Key exchange & chunked VC transfer over BLE
        Tuvali Verifier --) Inji Verifier: VC_RECEIVED
        Tuvali Wallet --) Inji Wallet: RECEIVED
        Tuvali Wallet --) Tuvali Verifier: disconnect()
        Tuvali Verifier ->> Inji Verifier: "onDisconnected"
        Tuvali Wallet ->> Inji Wallet: "onDisconnected"
    end
```
