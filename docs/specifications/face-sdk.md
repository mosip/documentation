# Face SDK

* This is a `react native component library` created to perform face match in Inji.
* The library takes two images as base64 encoded strings and returns a boolean match or no match.
* This library supports only ANDROID currently. IOS is not supported.

## Installation

* Using npm
  * `npm install mosip-inji-face-sdk`
* Using yarn
  * `yarn add mosip-inji-face-sdk`

## Usage

```
import { faceAuth } from "mosip-inji-face-sdk";

## refer to /example/src/Auth.tsx for usage
```

## Latest stable version

`"0.1.1"`

### API Specification

The SDK will be used by Inji for biometric authentication. An SDK system that integrates with MOSIP should support the following operations:

### **Init**

The init function is used for loading the model. It accepts the secure URL of the model, downloads it and saves it locally.

**Signature**

```
export async function init(url: string, overrideCache: boolean) {
  // logic here
}
```

**Parameters**

| **Name**      | **Description**                              | **Type**   |
| ------------- | -------------------------------------------- | ---------- |
| url           | Secure url of the model                      | Secure url |
| overrideCache | boolean indicator to override existing model | boolean    |

_Standard Return Codes (match or no match)_

| **response** | **Status** |
| ------------ | ---------- |
| throws error | Error      |

### **Face Matching**&#x20;

Face matching is used to match two faces. It returns a boolean true or false in case of match or no match.

**Signature**

```
export function faceAuth(
      capturedImage: string,
      vcImage: string
    ): Promise<boolean> {
  // logic here
}
```

**Parameters**

| **Name**      | **Description**                          | **Type**              |
| ------------- | ---------------------------------------- | --------------------- |
| capturedImage | The image that is captured by the camera | base64 encoded string |
| vcImage       | The face image received in VC            | base64 encoded string |

_Standard Return Codes (match or no match)_

| **response**  | **Status**  |
| ------------- | ----------- |
| true          | Matched     |
| false         | Not Matched |
| error message | Error       |
