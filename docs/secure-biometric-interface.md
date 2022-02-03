# Secure Biometric Inteface (SBI)

## Revision history
|Version|Status|Date|
|---|---|---|
|0.9.5|Released|June-2020|

## Overview
**Secure Biometric Interface (SBI)**, previously called **MOSIP Device Service (MDS)** specification establishes standards/protocols that are necessary for a biometric device to be used in MOSIP. The MDS specification is primarly intented for biometric device manufactures, developers and designers to build MOSIP compliant devices. All devices that collect biometric data should operate within the specification of this document.

## SBI Service
SBI service is a software module running on a host that exposes the SBI interface to the host application like a registration client or authentication app. The service must run on any of the ports in the range 4501-4600.

## Device standards
### SBI 1.0 
* The biometric capture, processing and signing is done at the host machine level (for example laptop/mobile). 
* Used in controlled environments like [registration](https://docs.mosip.io/1.2.0/id-lifecycle-management#registration-enrollment).
### SBI 2.0
* The biometric capture, processing, encryption and signing is done within [FTM](ftm.md). 
* Used in uncontrolled environments like [authentication](https://docs.mosip.io/1.2.0/id-authentication)

{% hint style="info" %}
SBI 1.0 and SBI 2.0 were previously referred to as **L0** and **L1** respectively.
{% endhint %}

## Device Physical ID
An identification mark that shows MOSIP compliance and a readable unique device serial number (minimum of 12 digits), make and model. The same information has to be available over a 2D QR Code or Barcode. This is to help field support and validation.

## Device Digital ID
A Digital ID is represented as JSON:
```JSON
{
  "serialNo": "string",
  "make": "string",
  "model": "string",
  "type": "string",
  "deviceSubType": "string",
  "deviceProvider": "string",
  "deviceProviderId": "string",
  "dateTime": "string",
}
```
|Parameters|Description|
|---|---|
|`serialNo`|As printed on [Physical ID](#physical-id)
|`make`|Brand name as printed on [Physical ID](#physical-id)|
|`model`|Model of the device as printed on [Physical ID](#physical-id)|
|`type`|`Finger`, `Iris`, or `Face`|
|`deviceSubType`|Based on `type`. See note below|
|`deviceProvider` | Name of the device provider|
|`dateTime`| Time during the issuance of the request. This is in ISO format.|

`deviceSubType`:
* For `Finger`: `Slap`, `Single` or `Touchless`
* For `Iris`: `Single` or `Double`
* For `Face`: `Full face`

### Signed digital ID
For [registered devices]()
The Digital ID is signed with the [JSON Web Signature RFC 7515](https://datatracker.ietf.org/doc/html/rfc7515) using the [DKL0](keys.md#device-specific-keys) in SBI 1.0 devices and [DKL1](keys.md#device-specific-keys) in SBI 2.0 devices and would look like this:
```
"digitalId": "base64urlencoded(header).base64urlencoded(payload).base64urlencoded(signature)"
```
### Unsigned digital ID
Just base64 encoded:
```
"digitalId": "base64urlencoded(payload)"
```

## Biometric subtype
The `bioSubType` have following values:
* For Finger: 
    * Left IndexFinger 
    * Left MiddleFinger
    * Left RingFinger
    * Left LittleFinger
    * Left Thumb
    * Right IndexFinger
    * Right MiddleFinger 
    * Right RingFinger
    * Right LittleFinger
    * Right Thumb
    * UNKNOWN
* For Iris
    * Left
    * Right
    * UNKNOWN
* For Face: No subtype

## Device subID
`deviceSubId` is used to enable a specific sensor in the device. It can have following values:
* 0: Unknown device
* 1: Left iris/slap 
* 2: Right iris/slap
* 3: Two thumbs/irises
* 4(onwards): Any other sensors

## Error codes
Code | Message
-----|--------
0   | Success
100 | Device not registered
101 | Unable to detect a biometric object
102 | Technical error during extraction
103 | Device tamper detected
104 | Unable to connect to management server
105 | Image orientation error
106 | Device not found
107 | Device public key expired
108 | Domain public key missing
109 | Requested number of biometric (Finger/IRIS) not supported
202 | No device connected
5xx | Custom error codes implemented by Device Provider. 

## API

### Device discovery
Device discovery would be used to identify MOSIP compliant devices in a system by the applications. The protocol is designed as simple plug and play with all the necessary abstraction to the specifics.

#### Device Discovery Request
```JSON
{
  "type": "type of the device"
}
```

#### Accepted Values for Device Discovery Request
* type - "Biometric Device", "Finger", "Face", "Iris"

{% hint style="info" %}
"Biometric Device" - is a special type and used in case if you are looking for any biometric device.
{% endhint %}

#### Device Discovery Response
```JSON
[
  {
    "deviceId": "Internal ID",
    "deviceStatus": "Device status",
    "certification": "Certification level",
    "serviceVersion": "Device service version",
    "deviceSubId": ["Array of supported device sub Ids"],
    "callbackId": "Base URL to reach to the device",
    "digitalId": "Unsigned Digital ID of the device",
    "deviceCode": "A unique code given by MOSIP after successful registration",
    "specVersion": ["Array of supported MDS specification version"],
    "purpose": "Auth  or Registration or empty if not registered",
    "error": {
      "errorCode": "101",
      "errorInfo": "Invalid JSON Value Type For Discovery.."
    }
  },
  ...
]
```

#### Accepted Values for Device Discovery Response
Parameters | Description
-----------|-------------
deviceStatus | Allowed values are "Ready", "Busy", "Not Ready" or "Not Registered".
certification | Allowed values are "L0" or "L1" based on level of certification.
serviceVersion | Version of the MDS specification that is supported.
deviceId | Internal ID to identify the actual biometric device within the device service.
deviceSubId | <ul><li>Allowed values are 1, 2 or 3.</li><li>The device sub id could be used to enable a specific module in the scanner appropriate for a biometric capture requirement.</li><li>Device sub id is a simple index which always starts with 1 and increases sequentially for each sub device present.</li><li>In case of Finger/Iris its 1 for left slap/iris, 2 for right slap/iris and 3 for two thumbs/irises.</li><li>The device sub id should be set to 0 if we don't know any specific device sub id (0 is not applicable for fingerprint slap).</li><ul>
callbackId | <ul><li>This differs as per the OS.</li><li>In case of Linux and windows operating systems it is a HTTP URL.</li><li>In the case of android, it is the intent name.</li><li>In IOS, it is the URL scheme.</li><li>The call back URL takes precedence over future request as a base URL.</li></ul>
digitalId | Digital ID as per the Digital ID definition but it will not be signed.
deviceCode | A unique code given by MOSIP after successful registration.
specVersion | Array of supported MDS specification version.
purpose | Purpose of the device in the MOSIP ecosystem. Allowed values are "Auth" or "Registration".
error | Relevant errors as defined under the [error section](#error-codes) of this document.
error.errorCode | Standardized error code defined in the [error code section](#error-codes).
error.errorInfo | Description of the error that can be displayed to end user. Multi lingual support.

{% hint style="info" %}
* The response is an array that we could have a single device enumerating with multiple biometric options.
* The service should ensure to respond only if the type parameter matches the type of device or the type parameter is a "Biometric Device".
* This response is a direct JSON as show in the response.
{% endhint %}

#### Windows/Linux
All the device API will be based on the HTTP specification. The device always binds to with any of the available ports ranging from 4501 - 4600. The IP address used for binding has to be 127.0.0.1 and not localhost.

The applications that require access to MOSIP devices could discover them by sending the HTTP request to the supported port range. We will call this port as the device_service_port in the rest of the document.

**_HTTP Request:_**
```
MOSIPDISC http://127.0.0.1:<device_service_port>/device
HOST: 127.0.0.1: <device_service_port>
EXT: <app name>
```

**_HTTP Response:_**
```
HTTP/1.1 200 OK
CACHE-CONTROL:no-store
LOCATION:http://127.0.0.1:<device_service_port>
Content-Length: length in bytes of the body
Content-Type: application/json
Connection: Closed
```

{% hint style="info" %}
* The pay loads are JSON in both the cases and are part of the body.
* CallbackId would be set to the `http://127.0.0.1:<device_service_port>`. So, the caller will use the respective HTTP verb / method and the URL to call the service.
{% endhint %}

#### Android
All devices on an android device should listen to the following intent "io.mosip.device".

Upon invocation of this intent the devices are expected to respond back with the json response filtered by the respective type.

{% hint style="info" %}
In Android, the CallbackId would be set to the appId. So, the caller will create the intent "appId.Info" or "appId.Capture".
{% endhint %}

#### IOS
All device on an IOS device would respond to the URL schema as follows:
```
MOSIPDISC://<call-back-app-url>?ext=<caller app name>&type=<type as defined in mosip device request>
```

If a MOSIP compliant device service app exist then the URL would launch the service. The service in return should respond back to the caller using the call-back-app-url with the base64 encoded json as the URL parameter for the key data.

{% hint style="info" %}
* In IOS there are restrictions to have multiple apps registering to the same URL schema.
* CallbackId would be set to the device service appname. So, the caller has to call appnameInfo or appnameCapture as the URL scheme.
{% endhint %}

### Device Info
The device information API would be used to identify the MOSIP compliant devices and their status by the applications.

#### Device Info Request
NA

#### Accepted Values for Device Info Request
NA

#### Device Info Response
```
[
  {
    "deviceInfo": {
      "deviceStatus": "Current status",
      "deviceId": "Internal ID",
      "firmware": "Firmware version",
      "certification": "Certification level",
      "serviceVersion": "Device service version",
      "deviceSubId": ["Array of supported device sub Ids"],
      "callbackId": "Baseurl to reach to the device",
      "digitalId": "Signed digital id as described in the digital id section of this document.",
      "deviceCode": "A unique code given by MOSIP after successful registration",
      "env": "Target environment",
      "purpose": "Auth  or Registration",
      "specVersion": ["Array of supported MDS specification version"],
    },
    "error": {
      "errorCode": "101",
      "errorInfo": "Invalid JSON Value "
    }
  }
  ...
]
```

The final JSON is signed with the JSON web signature using the "Foundational Trust Module" Identity key, this data is the fundamental identity of the device. Every MOSIP compliant device will need the foundational trust module.

So the API would respond in the following format.
```
[
  {
    "deviceInfo": "base64urlencode(header).base64urlencode(payload).base64urlencode(signature)"
    "error": {
      "errorCode": "100",
      "errorInfo": "Device not registered. In this case the device info will be only base64urlencode(payload)"
    }
  }
]
```

#### Allowed values for Device Info Response
Parameters | Description
-----------|-------------
deviceInfo | <ul><li>The deviceInfo object is sent as JSON Web Token (JWT).</li><li>For device which is not registered, the deviceInfo will be unsigned.</li><li>For device which is registered, the deviceInfo will be signed using the device key.</li></ul>
deviceInfo.deviceStatus | <ul><li>This is the status of the device.</li><li>Allowed values are "Ready", "Busy", "Not Ready" or "Not Registered".</li></ul>
deviceInfo.deviceId | Internal Id to identify the actual biometric device within the device service.
deviceInfo.firmware | <ul><li>Exact version of the firmware.</li><li>In case of L0 this is same as serviceVersion.</li></ul>
deviceInfo.certification | <ul><li>Allowed values are "L0" or "L1" based on the level of certification.</li></ul>
deviceInfo.serviceVersion | Version of the MDS specification that is supported.
deviceInfo.deviceId | Internal ID to identify the actual biometric device within the device service.
deviceSubId | <ul><li>Allowed values are 1, 2 or 3.</li><li>The device sub id could be used to enable a specific module in the scanner appropriate for a biometric capture requirement.</li><li>Device sub id is a simple index which always starts with 1 and increases sequentially for each sub device present.</li><li>In case of Finger/Iris its 1 for left slap/iris, 2 for right slap/iris and 3 for two thumbs/irises.</li><li>The device sub id should be set to 0 if we don't know any specific device sub id (0 is not applicable for fingerprint slap).</li><ul>
deviceInfo.callbackId | <ul><li>This differs as per the OS.</li><li>In case of Linux and windows operating systems it is a HTTP URL.</li><li>In the case of android, it is the intent name.</li><li>In IOS, it is the URL scheme.</li><li>The call back URL takes precedence over future request as a base URL.</li></ul>
deviceInfo.digitalId | <ul><li>The digital id as per the digital id definition.</li><li>For L0 devices which is not registered, the digital id will be unsigned.</li><li>For L0 devices which is registered, the digital id will be signed using the device key.</li><li>For L1 devices, the digital id will be signed using the FTM key.</li></ul>
deviceInfo.env | <ul><li>The target enviornment.</li><li>For devices that are not registered the enviornment is "None".</li><li>For device that is registered, then send the enviornment in which it is registered.</li><li>Allowed values are "Staging", "Developer", "Pre-Production" or "Production".</li></ul>
deviceInfo.purpose | <ul><li>The purpose of the device in the MOSIP ecosystem.</li><li>For devices that are not registered the purpose is empty.</li><li>Allowed values are "Auth" or "Registration".</li></ul>
deviceInfo.specVersion | Array of supported MDS specification version.
error | Relevant errors as defined under the [error section](#error-codes) of this document.
error.errorCode | Standardized error code defined in the [error code section](#error-codes).
error.errorInfo | Description of the error that can be displayed to end user. Multi lingual support.

{% hint style="info" %}
* The response is an array that we could have a single device enumerating with multiple biometric options.
* The service should ensure to respond only if the type parameter matches the type of device or the type parameter is a "Biometric Device".
{% endhint %}

#### Windows/Linux
The applications that require more details of the MOSIP devices could get them by sending the HTTP request to the supported port range. The device always binds to with any of the available ports ranging from 4501 - 4600. The IP address used for binding has to be 127.0.0.1 and not localhost.

**_HTTP Request:_**
```
MOSIPDINFO http://127.0.0.1:<device_service_port>/info
HOST: 127.0.0.1:<device_service_port>
EXT: <app name>
```

**_HTTP Response:_**
```
HTTP/1.1 200 OK
CACHE-CONTROL:no-store
LOCATION:http://127.0.0.1:<device_service_port>
Content-Length: length in bytes of the body
Content-Type: application/json
Connection: Closed
```

{% hint style="info" %}
The pay loads are JSON in both the cases and are part of the body.
{% endhint %}

#### Android
On an android device should listen to the following intent "appId.Info".

Upon invocation of this intent the devices are expected to respond back with the JSON response filtered by the respective type.

#### IOS
On an IOS device would respond to the URL schema as follows:
```
APPIDINFO://<call-back-app-url>?ext=<caller app name>&type=<type as defined in mosip device request>
```

If a MOSIP compliant device service app exist then the URL would launch the service. The service in return should respond back to the called using the call-back-app-url with the base64 encoded JSON as the URL parameter for the key data.

{% hint style="info" %}
In IOS there are restrictions to have multiple app registering to the same URL schema.
{% endhint %}

### Capture
The capture request would be used to capture a biometric from MOSIP compliant devices by the applications. The capture call will respond with success to only one call at a time. So, in case of a parallel call the device info details are sent with status as "Busy".

#### Capture Request
```
{
  "env": "Target environment",
  "purpose": "Auth  or Registration",
  "specVersion": "Expected version of the MDS spec",
  "timeout" : "Timeout for capture",
  "captureTime": "Capture request time in ISO format",
  "domainUri": "URI of the auth server",
  "transactionId": "Transaction Id for the current capture",
  "bio": [
    {
      "type": "Type of the biometric data",
      "count":  "Finger/Iris count, in case of face max is set to 1",
      "bioSubType": ["Array of subtypes"],
      "requestedScore": "Expected quality score that should match to complete a successful capture",
      "deviceId": "Internal Id",
      "deviceSubId": "Specific Device Sub Id",
      "previousHash": "Hash of the previous block"
    }
  ],
  customOpts: {
    //Max of 50 key value pair. This is so that vendor specific parameters can be sent if necessary. The values cannot be hard coded and have to be configured by the apps server and should be modifiable upon need by the applications. Vendors are free to include additional parameters and fine-tuning parameters. None of these values should go undocumented by the vendor. No sensitive data should be available in the customOpts.
  }
}
```

{% hint style="info" %}
Count value should be driven by the count of the bioSubType for Iris and Finger. For Face, there will be no bioSubType but the count should be "1".
{% endhint %}

#### Allowed Values for Capture Request
Parameters | Description
-----------|-------------
env | <ul><li>The target environment.</li><li>Allowed values are "Staging", "Developer", "Pre-Production" or "Production".</li></ul>
purpose | <ul><li>The purpose of the device in the MOSIP ecosystem.</li><li>For devices that are not registered the purpose is empty.</li><li>Allowed values are "Auth" or "Registration".</li></ul>
specVersion | Expected version of MDS specification.
timeout | <ul><li>Max time the app will wait for the capture.</li><li>Its expected that the API will respond back before timeout with the best frame.</li><li>All timeouts are in milliseconds.</li></ul>
captureTime | <ul><li>Time of capture in ISO format.</li><li>The time is as per the requesting application.</li></ul>
domainUri | <ul><li>URI of the authentication server.</li><li>This can be used to federate across multiple providers or countries or unions.</li></ul>
transactionId | <ul><li>Unique Id of the transaction.</li><li>This is an internal Id to the application thats providing the service.</li><li>Different id should be used for every successful auth.</li><li>So even if the transaction fails after auth we expect this number to be unique.</li></ul>
bio.type | Allowed values are "Finger", "Iris" or "Face".
bio.count | <ul><li>Number of biometric data that is collected for a given type.</li><li>The device should validate and ensure that this number is in line with the type of biometric that's captured.</li></ul>
bio.bioSubType | <ul><li>For Finger: ["Left IndexFinger", "Left MiddleFinger", "Left RingFinger", "Left LittleFinger", "Left Thumb", "Right IndexFinger", "Right MiddleFinger", "Right RingFinger", "Right LittleFinger", "Right Thumb", "UNKNOWN"]</li><li>For Iris: ["Left", "Right", "UNKNOWN"]</li><li>For Face: No bioSubType</li></ul>
bio.requestedScore | Upon reaching the quality score the biometric device is expected to auto capture the image.
bio.deviceId | Internal Id to identify the actual biometric device within the device service.
bio.deviceSubId | <ul><li>Allowed values are 1, 2 or 3.</li><li>The device sub id could be used to enable a specific module in the scanner appropriate for a biometric capture requirement.</li><li>Device sub id is a simple index which always starts with 1 and increases sequentially for each sub device present.</li><li>In case of Finger/Iris its 1 for left slap/iris, 2 for right slap/iris and 3 for two thumbs/irises.</li><li>The device sub id should be set to 0 if we don't know any specific device sub id (0 is not applicable for fingerprint slap).</li><ul>
bio.previousHash | <ul><li>For the first capture the previousHash is hash of empty UTF-8 string.</li><li>From the second capture the previous captures hash (as hex encoded) is used as input.</li><li>This is used to chain all the captures across modalities so all captures have happened for the same transaction and during the same time period.</li></ul>
customOpts | <ul><li>In case, the device vendor wants to send additional parameters they can use this to send key value pair if necessary.</li><li>The values cannot be hard coded and have to be configured by the apps server and should be modifiable upon need by the applications.</li><li>Vendors are free to include additional parameters and fine-tuning the process.</li><li>None of these values should go undocumented by the vendor.</li><li>No sensitive data should be available in the customOpts.</li></ul>

#### Capture Response
```
{
  "biometrics": [
    {
      "specVersion": "MDS spec version",
      "data": {
        "digitalId": "digital Id as described in this document",
        "deviceCode": "A unique code given by MOSIP after successful registration",
        "deviceServiceVersion": "MDS version",
        "bioType": "Finger",
        "bioSubType": "UNKNOWN",
        "purpose": "Auth  or Registration",
        "env": "Target environment",
        "domainUri": "URI of the auth server",
        "bioValue": "Encrypted with session key and base64urlencoded biometric data",
        "transactionId": "Unique transaction id",
        "timestamp": "Capture datetime in ISO format",
        "requestedScore": "Floating point number to represent the minimum required score for the capture",
        "qualityScore": "Floating point number representing the score for the current capture"
      },
      "hash": "sha256(sha256 hash in hex format of the previous data block + sha256 hash in hex format of the current data block before encryption)",
      "sessionKey": "encrypted with MOSIP public key (dynamically selected based on the uri) and encoded session key biometric",
      "thumbprint": "SHA256 representation of thumbprint of the certificate that was used for encryption of session key. All texts to be treated as uppercase without any spaces or hyphens",
      "error": {
        "errorCode": "101",
        "errorInfo": "Invalid JSON Value"
      }
    },
    {
      "specVersion" : "MDS spec version",
      "data": {
        "digitalId": "Digital Id as described in this document",
        "deviceCode": "A unique code given by MOSIP after successful registration",
        "deviceServiceVersion": "MDS version",
        "bioType": "Finger",
        "bioSubType": "Left IndexFinger",
        "purpose": "Auth  or Registration",
        "env": "target environment",
        "domainUri": "uri of the auth server",
        "bioValue": "encrypted with session key and base64urlencoded biometric data",
        "transactionId": "unique transaction id",
        "timestamp": "Capture datetime in ISO format",
        "requestedScore": "Floating point number to represent the minimum required score for the capture",
        "qualityScore": "Floating point number representing the score for the current capture"
      },
      "hash": "sha256(sha256 hash in hex format of the previous data block + sha256 hash in hex format of the current data block before encryption)",
      "sessionKey": "encrypted with MOSIP public key and encoded session key biometric",
      "thumbprint": "SHA256 representation of thumbprint of the certificate that was used for encryption of session key. All texts to be treated as uppercase without any spaces or hyphens",
      "error": {
        "errorCode": "101",
        "errorInfo": "Invalid JSON Value"
      }
    }
  ]
}
```

#### Accepted Values for Capture Response
Parameters | Description
-----------|------------- 
specVersion | Version of the MDS specification using which the response was generated.
data | <ul><li>The data object is sent as JSON Web Token (JWT).</li><li>The data block will be signed using the device key.</li></ul>
data.digitalId | <ul><li>The digital id as per the digital id definition in JWT format.</li><li>For L0 devices, the digital id will be signed using the device key.</li><li>For L1 devices, the digital id will be signed using the FTM key.</li></ul>
data.deviceCode | A unique code given by MOSIP after successful registration
data.deviceServiceVersion | MDS version
data.bioType | Allowed values are "Finger", "Iris" or "Face".
data.bioSubType | <ul><li>For Finger: ["Left IndexFinger", "Left MiddleFinger", "Left RingFinger", "Left LittleFinger", "Left Thumb", "Right IndexFinger", "Right MiddleFinger", "Right RingFinger", "Right LittleFinger", "Right Thumb", "UNKNOWN"]</li><li>For Iris: ["Left", "Right", "UNKNOWN"]</li><li>For Face: No bioSubType</li></ul>
data.purpose | <ul><li>The purpose of the device in the MOSIP ecosystem.</li><li>Allowed values is "Auth".</li></ul>
data.env | <ul><li>The target environment.</li><li>Allowed values are "Staging", "Developer", "Pre-Production" or "Production".</li></ul>
data.domainUri | <ul><li>URI of the authentication server.</li><li>This can be used to federate across multiple providers or countries or unions.</li></ul>
data.bioValue | <ul><li>Biometric data is encrypted with random symmetric (AES GCM) key and base-64-URL encoded.</li><li>For symmetric key encryption of bioValue, (biometrics.data.timestamp XOR transactoinId) is computed and the last 16 bytes and the last 12  bytes of the results are set as the aad and the IV(salt) respectively.</li><li>Look at the Authentication document to understand more about the encryption.</li></ul>
data.transactionId | Unique transaction id sent in request
data.timestamp | <ul><li>Time as per the biometric device.</li><li>Note: The biometric device is expected to sync its time from the management server at regular intervals so accurate time could be maintained on the device.</li></ul>
data.requestedScore | Floating point number to represent the minimum required score for the capture.
data.qualityScore | Floating point number representing the score for the current capture.
hash | The value of the previousHash attribute in the request object or the value of hash attribute of the previous data block (used to chain every single data block) concatenated with the hex encode sha256 hash of the current data block before encryption.
sessionKey | The session key (used for the encrypting of the bioValue) is encrypted using the MOSIP public certificate with RSA/ECB/OAEPWITHSHA-256ANDMGF1PADDING algorithm and then base64-URL-encoded.
thumbprint | <ul><li>SHA256 representation of thumbprint of the certificate that was used for encryption of session key.</li><li>All texts to be treated as uppercase without any spaces or hyphens.</li></ul>
error | Relevant errors as defined under the [error section](#error-codes) of this document.
error.errorCode | Standardized error code defined in the [error code section](#error-codes).
error.errorInfo | Description of the error that can be displayed to end user. Multi lingual support.

The entire data object is sent in JWT format. So, the data object will look like:
```
"data" : "base64urlencode(header).base64urlencode(payload).base64urlencode(signature)
payload - is defined as the entire byte array of data block.
```

#### Windows/Linux
The applications that requires to capture biometric data from a MOSIP devices could do so by sending the HTTP request to the supported port range.

**_HTTP Request:_**
```
CAPTURE [http://127.0.0.1:<device_service_port>/capture](http://127.0.0.1/capture)
HOST: 127.0.0.1: <apps port>
EXT: <app name>
```

**_HTTP Response:_**
```
HTTP/1.1 200 OK
CACHE-CONTROL:no-store
LOCATION:[http://127.0.0.1](http://127.0.0.1):<device_service_port>
Content-Length: length in bytes of the body
Content-Type: application/json
Connection: Closed
```

{% hint style="info" %}
The pay loads are JSON in both the cases and are part of the body.
{% endhint %}

#### Android
All device on an android device should listen to the following intent appid.capture.  Upon this intend the devices are expected to respond back with the JSON response filtered by the respective type.

#### IOS
All device on an IOS device would respond to the URL schema as follows.
```
APPIDCAPTURE://<call-back-app-url>?ext=<caller app name>&type=<type as defined in mosip device request>
```

If a MOSIP compliant device service app exist then the URL would launch the service. The service in return should respond back to the called using the call-back-app-url with the base64 encoded json as the URL parameter for the key data.

### Device Stream
The device would open a stream channel to send the live video streams. This would help when there is an assisted operation to collect biometric. Please note the stream API’s are available only for registration environment.

Used only for the registration module compatible devices. This API is visible only for the devices that are registered for the purpose as "Registration".

#### Device Stream Request
```
{
  "deviceId": "Internal Id",
  "deviceSubId": "Specific device sub Id",
  "timeout": "Timeout for stream"
}
```

#### Allowed Values for device Stream Request
Parameters | Description
-----------|--------------
deviceId | Internal Id to identify the actual biometric device within the device service.
deviceSubId | <ul><li>Allowed values are 1, 2 or 3.</li><li>The device sub id could be used to enable a specific module in the scanner appropriate for a biometric capture requirement.</li><li>Device sub id is a simple index which always starts with 1 and increases sequentially for each sub device present.</li><li>In case of Finger/Iris its 1 for left slap/iris, 2 for right slap/iris and 3 for two thumbs/irises.</li><li>The device sub id should be set to 0 if we don't know any specific device sub id (0 is not applicable for fingerprint slap).</li><ul>
timeout | <ul><li>Max time after which the stream should close.</li><li>This is an optional paramter and by default the value will be 5 minutes.</li><li>All timeouts are in milliseconds.</li></ul>

#### Device Stream Response
Live Video stream with quality of 3 frames per second or more using [M-JPEG](https://en.wikipedia.org/wiki/Motion_JPEG).

{% hint style="info" %}
Preview should have the quality markings and segment marking. The preview would also be used to display any error message to the user screen. All error messages should be localized.
{% endhint %}

#### Error Response for Device Stream
```
{
  "error": {
    "errorCode": "202",
    "errorInfo": "No Device Connected."
  }
}
```

#### Windows/Linux
The applications that require more details of the MOSIP devices could get them by sending the HTTP request to the supported port range.

**_HTTP Request:_**
```
STREAM   http://127.0.0.1:<device_service_port>/stream
HOST: 127.0.0.1: <apps port>
EXT: <app name>
```

**_HTTP Response:_**
HTTP Chunk of frames to be displayed. Minimum frames 3 per second.

#### Android
No support for streaming

#### IOS
No support for streaming

### Registration Capture
The registration client application will discover the device. Once the device is discovered the status of the device is obtained with the device info API. During the registration the registration client sends the RCAPTURE API and the response will provide the actual biometric data in a digitally signed non encrypted form. When the Device Registration Capture API is called the frames should not be added to the stream. The device is expected to send the images in ISO format.

The requestedScore is in the scale of 1-100. So, in cases where you have four fingers the average of all will be considered for capture threshold. The device would always send the best frame during the capture time even if the requested score is not met.

The API is used by the devices that are compatible for the registration module. This API should not be supported by the devices that are compatible for authentication.

#### Registration Capture Request
```
{
  "env":  "Target environment",
  "purpose": "Auth  or Registration",
  "specVersion": "Expected MDS spec version",
  "timeout": "Timeout for registration capture",
  "captureTime": "Time of capture request in ISO format",
  "transactionId": "Transaction Id for the current capture",
  "bio": [
    {
      "type": "Type of the biometric data",
      "count":  "Finger/Iris count, in case of face max is set to 1",
      "bioSubType": ["Array of subtypes"], //Optional
      "exception": ["Finger or Iris to be excluded"],
      "requestedScore": "Expected quality score that should match to complete a successful capture.",
      "deviceId": "Internal Id",
      "deviceSubId": "Specific device Id",
      "previousHash": "Hash of the previous block"
    }
  ],
  customOpts: {
    //max of 50 key value pair. This is so that vendor specific parameters can be sent if necessary. The values cannot be hard coded and have to be configured by the apps server and should be modifiable upon need by the applications. Vendors are free to include additional parameters and fine-tuning parameters. None of these values should go undocumented by the vendor. No sensitive data should be available in the customOpts.
  }
}
```

#### Accepted Values for Registration Capture Request
Parameters | Description
-----------|-------------
env | <ul><li>The target environment.</li><li>Allowed values are "Staging", "Developer", "Pre-Production" or "Production".</li></ul>
purpose | <ul><li>The purpose of the device in the MOSIP ecosystem.</li><li>For devices that are not registered the purpose is empty.</li><li>Allowed values are "Auth" or "Registration".</li></ul>
specVersion | Expected version of MDS specification.
timeout | <ul><li>Max time the app will wait for the capture.</li><li>Its expected that the API will respond back before timeout with the best frame.</li><li>All timeouts are in milliseconds.</li></ul>
captureTime | <ul><li>Time of capture in ISO format.</li><li>The time is as per the requesting application.</li></ul>
transactionId | <ul><li>Unique Id of the transaction.</li><li>This is an internal Id to the application thats providing the service.</li><li>Different id should be used for every successful auth.</li><li>So even if the transaction fails after auth we expect this number to be unique.</li></ul>
bio.type | Allowed values are "Finger", "Iris" or "Face".
bio.count | <ul><li>Number of biometric data that is collected for a given type.</li><li>The device should validate and ensure that this number is in line with the type of biometric that's captured.</li></ul>
bio.bioSubType | <ul><li>Array of bioSubType for respective biometric type.</li><li>For Finger: ["Left IndexFinger", "Left MiddleFinger", "Left RingFinger", "Left LittleFinger", "Left Thumb", "Right IndexFinger", "Right MiddleFinger", "Right RingFinger", "Right LittleFinger", "Right Thumb", "UNKNOWN"]</li><li>For Iris: ["Left", "Right", "UNKNOWN"]</li><li>For Face: No bioSubType</li><li>This is an optional parameter.</li></ul>
bio.exception | <ul><li>This is an array and all the exceptions are marked.</li><li>In case exceptions are sent for face then follow the exception photo specification above.</li><li>For Finger: ["Left IndexFinger", "Left MiddleFinger", "Left RingFinger", "Left LittleFinger", "Left Thumb", "Right IndexFinger", "Right MiddleFinger", "Right RingFinger", "Right LittleFinger", "Right Thumb"]</li><li>For Iris: ["Left", "Right"]</li></ul>
bio.requestedScore | Upon reaching the quality score the biometric device is expected to auto capture the image.
bio.deviceId | Internal Id to identify the actual biometric device within the device service.
bio.deviceSubId | <ul><li>Allowed values are 1, 2 or 3.</li><li>The device sub id could be used to enable a specific module in the scanner appropriate for a biometric capture requirement.</li><li>Device sub id is a simple index which always starts with 1 and increases sequentially for each sub device present.</li><li>In case of Finger/Iris its 1 for left slap/iris, 2 for right slap/iris and 3 for two thumbs/irises.</li><li>The device sub id should be set to 0 if we don't know any specific device sub id (0 is not applicable for fingerprint slap).</li><ul>
bio.previousHash | <ul><li>For the first capture the previousHash is hash of empty UTF-8 string.</li><li>From the second capture the previous captures hash (as hex encoded) is used as input.</li><li>This is used to chain all the captures across modalities so all captures have happened for the same transaction and during the same time period.</li></ul>
customOpts | <ul><li>In case, the device vendor wants to send additional parameters they can use this to send key value pair if necessary.</li><li>The values cannot be hard coded and have to be configured by the apps server and should be modifiable upon need by the applications.</li><li>Vendors are free to include additional parameters and fine-tuning the process.</li><li>None of these values should go undocumented by the vendor.</li><li>No sensitive data should be available in the customOpts.</li></ul>

#### Registration Capture Response
```
{
  "biometrics": [
    {
      "specVersion": "MDS Spec version",
      "data": {
        "digitalId": "Digital id of the device as per the Digital Id definition..",
        "bioType": "Biometric type",
        "deviceCode": "A unique code given by MOSIP after successful registration",
        "deviceServiceVersion": "MDS version",
        "bioSubType": "Left IndexFinger",
        "purpose": "Auth  or Registration",
        "env": "Target environment",
        "bioValue": "base64urlencoded biometrics (ISO format)",
        "transactionId": "Unique transaction id sent in request",
        "timestamp": "2019-02-15T10:01:57.086Z",
        "requestedScore": "Floating point number to represent the minimum required score for the capture. This ranges from 0-100.",
        "qualityScore": "Floating point number representing the score for the current capture. This ranges from 0-100."
      },
      "hash": "sha256(sha256 hash in hex format of the previous data block + sha256 hash in hex format of the current data block)",    
      "error": {
        "errorCode": "101",
        "errorInfo": "Invalid JSON Value Type For Discovery.. ex: {type: 'Biometric Device' or 'Finger' or 'Face' or 'Iris' } "
      }
    },
    {
      "specVersion" : "MDS Spec version",
      "data": {
        "deviceCode": "A unique code given by MOSIP after successful registration",
        "bioType" : "Finger",
        "digitalId": "Digital id of the device as per the Digital Id definition.",
        "deviceServiceVersion": "MDS version",
        "bioSubType": "Left MiddleFinger",
        "purpose": "Auth  or Registration",
        "env":  "Target environment",
        "bioValue": "base64urlencoded extracted biometric (ISO format)",
        "transactionId": "Unique transaction id sent in request",
        "timestamp": "2019-02-15T10:01:57.086Z",
        "requestedScore": "Floating point number to represent the minimum required score for the capture. This ranges from 0-100",
        "qualityScore": "Floating point number representing the score for the current capture. This ranges from 0-100"
      },
      "hash": "sha256(sha256 hash in hex format of the previous data block + sha256 hash in hex format of the current data block before encryption)",
      "error": {
        "errorCode": "101",
        "errorInfo": "Invalid JSON Value Type For Discovery.. ex: {type: 'Biometric Device' or 'Finger' or 'Face' or 'Iris' }"
      }
    }
  ]
}
```

#### Allowed Values for Registration Capture Response
Parameters | Description
-----------|-------------
specVersion | Version of the MDS specification using which the response was generated.
data | <ul><li>The data object is sent as JSON Web Token (JWT).</li><li>The data block will be signed using the device key.</li></ul>
data.bioType | Allowed values are "Finger", "Iris" or "Face".
data.digitalId | <ul><li>The digital id as per the digital id definition in JWT format.</li><li>For L0 devices, the digital id will be signed using the device key.</li><li>For L1 devices, the digital id will be signed using the FTM key.</li></ul>
data.bioSubType | <ul><li>For Finger: ["Left IndexFinger", "Left MiddleFinger", "Left RingFinger", "Left LittleFinger", "Left Thumb", "Right IndexFinger", "Right MiddleFinger", "Right RingFinger", "Right LittleFinger", "Right Thumb", "UNKNOWN"]</li><li>For Iris: ["Left", "Right", "UNKNOWN"]</li><li>For Face: No bioSubType</li></ul>
data.deviceServiceVersion | MDS Version
data.env | <ul><li>The target environment.</li><li>Allowed values are "Staging", "Developer", "Pre-Production" or "Production".</li></ul>
data.purpose | <ul><li>The purpose of the device in the MOSIP ecosystem.</li><li>Allowed values are "Auth" or "Registration".</li></ul>
data.bioValue | Base64-URL-encoded biometrics (in ISO format)
data.transactionId | Unique transaction id sent in request
data.timestamp | <ul><li>Time as per the biometric device.</li><li>Note: The biometric device is expected to sync its time from the management server at regular intervals so accurate time could be maintained on the device.</li></ul>
data.requestedScore | Floating point number to represent the minimum required score for the capture.
data.qualityScore | Floating point number representing the score for the current capture.
hash | The value of the previousHash attribute in the request object or the value of hash attribute of the previous data block (used to chain every single data block) concatenated with the hex encode sha256 hash of the current data block before encryption.
error | Relevant errors as defined under the [error section](#error-codes) of this document.
error.errorCode | Standardized error code defined in the [error code section](#error-codes).
error.errorInfo | Description of the error that can be displayed to end user. Multi lingual support.

#### Windows/Linux
The applications that require more details of the MOSIP devices could get them by sending the HTTP request to the supported port range.

**_HTTP Request:_**
```
RCAPTURE  http://127.0.0.1:<device_service_port>/capture
HOST: 127.0.0.1: <apps port>
EXT: <app name>
```

**_HTTP Response:_**
HTTP response.

#### Android
No support for Registration Capture

#### IOS
No support for Registration Capture

