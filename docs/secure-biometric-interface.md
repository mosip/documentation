# Secure Biometric Interface (SBI)

## Revision history

| Version | Status   | Date      |
| ------- | -------- | --------- |
| 0.9.5   | Released | June-2020 |

## Overview

**Secure Biometric Interface (SBI)**, previously called **MOSIP Device Service (MDS)** specification establishes standards/protocols that are necessary for a biometric device to be used in MOSIP. The SBI specification is primarly intented for biometric device manufactures, developers and designers to build MOSIP compliant devices. All devices that collect biometric data should operate within the specification of this document.

## SBI service

SBI service is a software module running on a host that exposes the SBI interface to the host application like a registration client or authentication app. The service must run on any of the ports in the range 4501-4600. The host system could be any operating system - Windows, Android or IOS.

## SBI Request/response specification

The following communication interfaces are defined:

1. Device Discovery
2. Device Info
3. Auth Capture
4. Registration Capture
5. Stream

Refer [SBI Request/Response Specification](https://mosip.github.io/documentation/1.2.0/sbi/schema\_doc.html) for JSON objects of the interface.

Important terms referred in the SBI are given below.

## Device certification levels

### SBI CL 1.0

* The biometric capture, processing and signing is done at the host machine level (for example laptop/mobile).
* Used in controlled environments like [registration](https://docs.mosip.io/1.2.0/id-lifecycle-management#registration-enrollment).

### SBI CL 2.0

* The biometric capture, processing, encryption and signing is done within [FTM](ftm.md).
* Used in uncontrolled environments like [authentication](https://docs.mosip.io/1.2.0/id-authentication)

{% hint style="info" %}
SBI CL 1.0 and SBI CL 2.0 were previously referred to as **L0** and **L1** respectively.
{% endhint %}

## Device physical ID

An identification mark that shows MOSIP compliance and a readable unique device serial number (minimum of 12 digits), make and model. The same information has to be available over a 2D QR Code or Barcode. This is to help field support and validation.

## Device subtype

`deviceSubType`:

* For `Finger`: `Slap`, `Single` or `Touchless`
* For `Iris`: `Single` or `Double`
* For `Face`: `Full face`

## Signed digital ID

For [registered devices](secure-biometric-interface.md) The Digital ID is signed with [DKL0](keys.md#device-specific-keys) in [SBI CL 1.0](secure-biometric-interface.md#sbi-cl-1.0) devices and [DKL1](keys.md#device-specific-keys) in [SBI CL 2.0](secure-biometric-interface.md#sbi-cl-2.0) devices. The signature is represented as [JSON Web Signature RFC 7515](https://datatracker.ietf.org/doc/html/rfc7515):

```
"digitalId": "base64urlencoded(header).base64urlencoded(payload).base64urlencoded(signature)"
```

## Unsigned digital ID

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

## Live stream

* Before start

```
"Content-Type: multipart/x-mixed-replace; " 
"boundary=--BoundaryString\r\n\r\n";
```

* On start of stream

```
"--BoundaryString\r\n" +
"Access-Control-Allow-Origin:*\r\n" +
"Content-Type:image/jpeg\r\n" +
"Content-Length:" + length + "\r\n\r\n"; // there are always 2 new line character before the actual data

<Each frame of JPEG>
```

* Second Frame

```
"--BoundaryString\r\n" +
"Access-Control-Allow-Origin:*\r\n" +
"Content-Type:image/jpeg\r\n" +
"Content-Length:" + length + "\r\n\r\n"; // there are always 2 new line character before the actual data
Each Frame of JPEG
```

## Error codes

| Code | Message                                                                                                  |
| ---- | -------------------------------------------------------------------------------------------------------- |
| 0    | Success                                                                                                  |
| 100  | Device not registered                                                                                    |
| 101  | Unable to detect a biometric object                                                                      |
| 102  | Technical error during extraction                                                                        |
| 103  | Device tamper detected                                                                                   |
| 104  | Unable to connect to management server                                                                   |
| 105  | Image orientation error                                                                                  |
| 106  | Device not found                                                                                         |
| 107  | Device public key expired                                                                                |
| 108  | Domain public key missing                                                                                |
| 109  | Requested number of biometric (Finger/IRIS) not supported                                                |
| 202  | No device connected                                                                                      |
| 5xx  | Custom error codes implemented by [Device Provider](https://docs.mosip.io/1.2.0/partners#partner-types). |
