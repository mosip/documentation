# Face SDK Specifications

## Introduction

This is a draft specification that is used to implement the face match in the Inji Wallet or any similar wallets.

### Configure API

This API is asynchronous and can be used for initializing the implementer's SDK. During initialization, the implementers can use this API to build logic to validate the license, download the latest model file if needed, or inform the server about its usage. This API is expected to return errors when there is a critical issue with the initialization process. If the API is called more than once, then the SDK can optionally return based on the current status. The implementation of this API should support offline mode. In offline mode, the implementor should ensure smooth usage. Care should be taken by the implementor to ensure the SDK is lightweight and does not slow down the app.

* The implementation of this API should immediately return if initialization has already been completed.
* The implementation should not attempt to initialize multiple times unless it's necessary.
* The implementation should work in offline mode.
* The implementation should support auto-downloading the latest models or any other configuration/artefacts necessary.
* To enhance logging and traceability, the implementer should accept a parameter known as `traceabilityId`, which helps to trace the logs on the server.

**Signature**

```
  async function configure(config: any): Promise<boolean> {
  if (already initialised & successful) {
   return true;
  }
 Initialise....
 if (successfully initialised) {
   return true;
 }
 return false;
 }
```

| **Name** | **Description**                                     | **Type**   |
| -------- | --------------------------------------------------- | ---------- |
| config   | Configuration with model file and matcher threshold | Any object |

Inji Wallet would initialize the config as a JSON. The JSON would contain the following items

| **Attribute Name** | **Description**                                                                           |
| ------------------ | ----------------------------------------------------------------------------------------- |
| traceabilityId     | Traceability id is used to trace the telemetry data                                       |
| io.inji.sdk.\*     | <p>Any configuration that starts with io.inji.sdk would<br>be sent in the config map.</p> |

_Standard Return Codes (true or false)_

| **Response** | **Status** |
| ------------ | ---------- |
| true         | Success    |
| false        | Error      |

### Face Compare API

An asynchronous API that compares two images, allowing for different image formats such as PNG, JPG, HEIC or Template. Upon completion returns a boolean value. The API has an expected timeout and it is expected that the implementors clear the memory and processing upon timeout.

* To ensure fraud prevention in compliance with [ISO/IEC 30101](https://www.iso.org/standard/83828.html), the faceAuth verification should include passive liveness checks, such as picture-in-picture.
* To enhance logging and traceability, the implementors should send telemetry using `traceabilityId`. The id is set during the configure API call, It is expected that the same is used here. In Inji Wallet, `AppId` is used as `traceabilityId`.
* Timeout is set in seconds.

**Signature**

```
 async function faceCompare(timeout: int ,capturedImage: string, vcImage: string): Promise<boolean> {
 logic to compare capturedImage & vcImage.....
 setTimeout(cancel);
//logic to match
 if (matched) {
   return true;
 }
   return false;
 }
```

**Parameters**

| **Name**      | **Description**                                                     | **Type**                                                                                                                                                                                                                                                                  |
| ------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| timeout       | Timeout in seconds. After this time the SDK should stop processing. | integer                                                                                                                                                                                                                                                                   |
| capturedImage | The image that is captured by the camera                            | <p><a href="https://developer.mozilla.org/en-US/docs/web/http/basics_of_http/data_urls">Data URL</a><br>format: data:image/<a href="https://www.iana.org/assignments/media-types/media-types.xhtml#image">imageformat</a> base64 encoded image<br>eg: data:image/jpeg</p> |
| vcImage       | The image that is given in the VC                                   | <p><a href="https://developer.mozilla.org/en-US/docs/web/http/basics_of_http/data_urls">Data URL</a><br>format: data:image/<a href="https://www.iana.org/assignments/media-types/media-types.xhtml#image">imageformat</a> base64 encoded image<br>eg: data:image/jpeg</p> |

_Standard Return Codes (match or no match)_

| R**esponse** | **Status**  |
| ------------ | ----------- |
| true         | Matched     |
| false        | Not Matched |
| false        | Error       |

## Guidelines

The following guidelines apply to individuals who are developing the face SDK:

* It is prohibited to collect any personally identifiable information (PII) or phone details.
* Inji Wallet includes built-in telemetry, and all telemetry data must be transmitted to the designated system. Telemetry enhances Inji Wallet's observability features by capturing specific events, creating measures, and monitoring various user actions and events.
* Recording or transmitting IP addresses, user details, Phone IMEI, phone numbers, or user photos in telemetry or logs is strictly prohibited
* The use of device fingerprints should be limited to managing the SDK license.
