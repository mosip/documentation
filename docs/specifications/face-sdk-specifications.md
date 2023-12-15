# API Specifications

## Introduction


### Configure API

This API is asynchronous and can be used for initializing the given SDK. During initialization, the API can validate the license, download the latest model file if needed, or inform the server about its usage. This API is expected to return errors when there is a critical issue with the initialization process. If the API is called more than once then the SDK can optionally return based on the current status. The API should support offline mode. In offline mode, the API should ensure smooth usage. Care should be taken by the providers to ensure the SDK is lightweight and does not slow down the app.
  
* The implementation of this API should immediately return if initialization has already been completed.
* The implementation should not attempt to initialize multiple times unless it's necessary.
* The implementation should work in offline mode.
* The implementation should support auto-downloading the latest models or any other configuration/artefacts necessary. 
* To enhance logging and traceability, the implementor should accept a parameter known as `traceabilityId`, Which helps to trace the logs on the server.

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


Inji would initialize the config as a JSON. The JSON would contain the following items

 | **Attribute Name** |  **Description**                                     |
 | ------------------ | -----------------------------------------------------|
 | traceabilityId     | Traceability id is used to trace the telemetry data  |
 | io.inji.sdk.*      | Any configuration that starts with io.inji.sdk would <br> be sent in the config map.|                                             |
 

_Standard Return Codes (true or false)_

| **Response** | **Status** |
| ------------ | ---------- |
| true         | Success    |
| false        | Error      |

### Face Compare API

* This API is an asynchronous tool that compares two images, allowing for different image formats such as PNG, JPG, or HEIC. By returning a boolean value, the API confirms a successful match or indicates an unsuccessful one.
* In order to ensure fraud prevention in compliance with [ISO/IEC 30101](https://www.iso.org/standard/83828.html), the faceAuth verification should include passive liveness checks, such as picture in picture.
* To enhance logging and traceability, the API may accept an optional parameter known as traceabilityId. In Inji, AppId is being used.

**Usage**

* Import the [faceCompare](https://github.com/biometric-technologies/biometric-sdk-react-native/blob/master/src/index.tsx#L31) method from module to compare.

```
import { faceCompare } from '@iriscan/biometric-sdk-react-native';
```

**Signature**

```
 async function faceCompare(capturedImage: string, vcImage: string): Promise<boolean> {
 logic to compare capturedImage & vcImage.....
 if (matched) {
   return true;
 }
   return false;
 }
```

**Parameters**

| **Name**      | **Description**                          | **Type**              |
| ------------- | ---------------------------------------- | --------------------- |
| capturedImage | The image that is captured by the camera | base64 encoded string |
| vcImage       | The face image received in VC            | base64 encoded string |

_Standard Return Codes (match or no match)_

| R**esponse** | **Status**  |
| ------------ | ----------- |
| true         | Matched     |
| false        | Not Matched |
| false        | Error       |
