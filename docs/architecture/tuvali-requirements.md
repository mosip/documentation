# TUVALI PERMISSIONS and REQUIREMENTS

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
<key&gt;NSBluetoothAlwaysUsageDescription&lt;/key>
<string&gt;Bluetooth is used to allow sharing VCs with another device&lt;/string>

<key&gt;NSBluetoothPeripheralUsageDescription&lt;/key&gt;
<string&gt;Bluetooth is used to allow sharing VCs with another device&lt;/string&gt;
```

## Requirements

**BLE version**:
Data transfer on tuvali will work on certain bounds that devices should satisfy the minimum BLE version as 4.2 and above.

**Android version**:
The SDK will work with apps that have a minimum version of **28.0**.

Android API: Minimum 28 - Target 30

**iOS version**:
The SDK requires iOS minimum deployment target version as **13.0**.

## Capabilities

* **Wallet**: Device can send data to another device.
* **Verifier**: Device that can receive data from another device.
* **Android SDK**: The SDK has the capability of acting as a wallet and verifier.
* **iOS SDK**: Currently the SDK has the capability of being a wallet but not able to act as Verifier.

## Unsupported device combinations 

Few device combinations that are not supported are as follows:

| **Transfer Type**     | **Sender Device**          | **Receiver Device**  |
| ----------------- | ----------------------- | --------------------------- |
| Android - Android | Vivo Y73 v12.0 BLE v5.0 | Redmi K20 Pro v11.0 BLEv5.0 |
| Android - Android | Redmi 9i v11.0 BLE v5.0 | Oneplus 6T v11.0 BLE v5.0   |
