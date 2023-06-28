# Permissions & Requirements

## Permissions

**Android**

To use Bluetooth Low Energy (BLE) features, should declare several permissions in the manifest file. (AndroidManifest.xml)

**Permissions required for Central (Wallet) of target Android 12 or higher**

```
<uses-permission android:name="android.permission.BLUETOOTH_SCAN" />;
<uses-permission android:name="android.permission.BLUETOOTH_CONNECT" />;
```

**Permissions required for Central (Wallet) of target Android 11 or lower**

```
<uses-permission android:name="android.permission.BLUETOOTH" />;
<uses-permission android:name="android.permission.BLUETOOTH_ADMIN" />;
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />;
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />;
```

**Permissions required for Peripheral (Verifier) of target Android 12 or higher**

```
<uses-permission android:name="android.permission.BLUETOOTH_ADVERTISE" />;
<uses-permission android:name="android.permission.BLUETOOTH_CONNECT" />;
```

**Permissions required for Peripheral (Verifier) of target Android 11 or lower**

```
<uses-permission android:name="android.permission.BLUETOOTH" />;
<uses-permission android:name="android.permission.BLUETOOTH_ADMIN" />;
```

**iOS**

To access Core Bluetooth APIs on iOS, below are the permissions included in `info.plist`.

```
<key>NSBluetoothAlwaysUsageDescription</key>
<string>Bluetooth is used to allow sharing VCs with another device</string>

<key>NSBluetoothPeripheralUsageDescription</key>
<string>Bluetooth is used to allow sharing VCs with another device</string>
```

## Requirements

**BLE version**: Data transfer on Tuvali will work on certain bounds that devices should satisfy the minimum BLE version as 4.2 and above.

**Android version**: The library will work with apps that run on devices with Android version 9 (API level 28) and above.

**Android API version**: Minimum 28 - Target 30

**iOS version**: The SDK requires iOS minimum deployment target version as **13.0**.

## Capabilities

* **Wallet**: The device can send data to another device.
* **Verifier**: A device that can receive data from another device.
* **Android SDK**: The SDK has the capability of acting as a wallet and verifier.
* **iOS SDK**: Currently the SDK has the capability of being a wallet but is not able to act as Verifier.

