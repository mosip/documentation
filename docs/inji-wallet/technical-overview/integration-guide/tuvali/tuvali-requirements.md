# Permissions & Requirements

## Permissions

### Android

Following permissions are required to be included in the `AndroidManifest.xml` to access Bluetooth Low Energy on Android.

**Permissions required for Central (Wallet) when target is Android 12 or higher**

```
<uses-permission android:name="android.permission.BLUETOOTH_SCAN" />;
<uses-permission android:name="android.permission.BLUETOOTH_CONNECT" />;
```

**Permissions required for Central (Wallet) when target is Android 11 or lower**

```
<uses-permission android:name="android.permission.BLUETOOTH" />;
<uses-permission android:name="android.permission.BLUETOOTH_ADMIN" />;
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />;
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />;
```

**Permissions required for Peripheral (Verifier) when target is Android 12 or higher**

```
<uses-permission android:name="android.permission.BLUETOOTH_ADVERTISE" />;
<uses-permission android:name="android.permission.BLUETOOTH_CONNECT" />;
```

**Permissions required for Peripheral (Verifier) when target is Android 11 or lower**

```
<uses-permission android:name="android.permission.BLUETOOTH" />;
<uses-permission android:name="android.permission.BLUETOOTH_ADMIN" />;
```

### iOS

Following permissions are required to be included in `info.plist` to access the Core Bluetooth APIs on iOS.

```
<key>NSBluetoothAlwaysUsageDescription</key>
<string>Bluetooth is used to allow sharing VCs with another device</string>

<key>NSBluetoothPeripheralUsageDescription</key>
<string>Bluetooth is used to allow sharing VCs with another device</string>
```

## Minimum Version Requirements

**BLE version**: BLE 4.2 and above.

**Android version**: Android version 9 (API level 28) and above.

**iOS version**: The SDK requires iOS minimum deployment target version as **13.0**.

## Capabilities

* **Wallet**: In this role, Tuvali can discover Verifier devices over BLE and can connect and share data. This role is supported on both, Android and iOS devices meeting minimum version requirement.
* **Verifier**: In this role, Tuvali can advertise itself to Wallets and receive data. This role is supported only on Android devices at the moment. iOS doesn't support being a Verifier.
