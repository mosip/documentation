# Face Match SDK

* This is a `react native component library` created to perform face match in Inji.
* The library takes two images as base64 encoded strings and returns a boolean match or no match.

### Repositories

{% embed url="https://github.com/mosip/mosip-mobileid-sdk/tree/IrisScan" %}

## Installation

* Add dependency in package.json
  
  `"mosip-mobileid-sdk": "git://github.com/mosip/mosip-mobileid-sdk.git#IrisScan"`

## Usage

* Download the model file
```
import {init} from 'mosip-mobileid-sdk';

## refer to /src/index.tsx init method for usage
```

* Compare images to verify face matches or not
```
import { faceAuth } from "mosip-mobileid-sdk";

## refer to /src/index.tsx faceAuth method for usage
```

### API Specification

The SDK will be used by Inji for biometric authentication. An SDK system that integrates with Inji should support the following operations:

### **Init**

The init function is used for loading the model. It accepts the secure URL of the model, downloads it and saves it locally.

**Signature**

```
export async function init(path: string): Promise<boolean> {
  // logic here
}
```

**Parameters**

| **Name**      | **Description**                              | **Type**   |
| ------------- | -------------------------------------------- | ---------- |
| url           | Secure url of the model                      | Secure url |

_Standard Return Codes (true or false)_

| **Response** | **Status** |
|--------------|------------|
| true         | Success    |
| false        | Error      |

### **Face Matching**

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

| **response** | **Status**  |
|--------------| ----------- |
| true         | Matched     |
| false        | Not Matched |
| false        | Error       |
