#### Aug 2019 | Version: 0.9.2 
#### Status: Draft 

## Table of Contents 

1. [Introduction & Background](#1-introduction--background)
1. [Glossary of Terms](#2-glossary-of-terms)
1. [Device Specification](#3-device-specification)
1. [Device Trust](#4-device-trust)
1. [Device Service - Communication Interfaces](#5-device-service---communication-interfaces)

    5.1. [Device Discovery](#51-device-discovery) 

    5.2. [Device Info](#52-device-info) 
 
    5.3 [Capture](#53-capture) 

    5.4 [Device Stream](#54-device-stream) 
 
    5.5 [Device Registration Capture](#55-device-registration-capture) 
 
1. [Device Server](#6-device-server)

    6.1 [Registration](#61-registration)

    6.2. [De-Register](#62-de-register)
1. [Management Server](#7-management-server)
1. [Compliance](#8-compliance)
---
## 1. Introduction & Background 

### Objective

The objective of this specification document is to establish the technical and compliance standards/ protocols that are necessary for a biometric device to be used in MOSIP solutions.

### Target Audience

This is a biometric device specification document and aims to help the biometric device manufactures, their developers, and their designers in building MOSIP compliant devices.
This document assumes that the readers are familiar with MOSIP registration and authentication services.

### MOSIP Devices

All devices that collect biometric data for MOSIP should operate within the specification of this document.

---
## 2. Glossary of Terms
* Device Provider - An entity that manufactures or imports the devices in their name. This entity should have legal rights to obtain an organization level digital certificate from the respective authority in the country.
* Foundational Trust Provider - An entity that manufactures the foundational trust module.
* Device - A hardware capable of capturing biometric information.
* L1 Certified Device / L1 Device - A device certified as capable of performing encryption in line with this spec in its trusted zone.
* L0 Certified Device / L0 Device - A device certified as one where the encryption is done on the host machine device driver or the MOSIP device service.
* Foundational Trust Provider Certificate - A digital certificate issued to the “Foundational Trust Provider”. This certificate proves that the provider has successfully gone through the required Foundational Trust Provider evaluation. The entity is expected to keep this certificate in secure possession in an HSM. All the individual trust certificates are issued using this certificate as the root. This certificate would be issued  by the countries in conjunction with MOSIP.
* Device Provider Certificate - A digital certificate issued to the “Device Provider”. This certificate proves that the provider has been certified for L0/L1 respective compliance. The entity is expected to keep this certificate in secure possession in an HSM. All the individual trust certificates are issued using this certificate as the root. This certificate is issued by the countries in conjunction with MOSIP.
* Registration - The process of applying for a Foundational Id.
* KYC - Know Your Customer. The process of providing consent to perform profile verification and update.
* Auth - The process of verifying one’s identity.
* FPS - Frames Per Second
* Management Server - A server run by the device provider to manage the life cycle of the biometric devices.
* Device Registration - The process of registering the device with MOSIP servers.
* Signature - All signature are formated as per RFC 7515.
* header in signature - Header in signature means the attribute with "type" set to "MDSSign" "alg" set to RS256 and x5c set to base64encoded certificate.
* payload is the byte array of the actual data, always represented as base64urlencoded.
* signature - base64urlencoded signature bytes
---
## 3. Device Specification

The MOSIP device specification provides compliance guidelines to devices for them to work with MOSIP. The compliance is based on device capability, trust and communication protocols. A MOSIP compliant device would follow the standards established in this document. It is expected that the devices are compliant to this specification and tested and validated. The details of each of these are outlined in the subsequent sections.

**Device Capability:**
The MOSIP compliant device is expected to perform the following:
*   Should have the ability to collect one or more biometric
*   Should have the ability to sign the captured biometric image or template.
*   Should have the ability to protect secret keys
*   Should have no mechanism to inject the biometric

**Base Specifications for Devices:**
1. Fingerprint Capture
<table>
  <tr>
   <td><strong>Factor</strong>
   </td>
   <td><strong>Registration Devices</strong>
   </td>
   <td><strong>Authentication Devices</strong>
   </td>
  </tr>
  <tr>
   <td>Minimum Resolution
   </td>
   <td>> 500 native dpi. Bare minimum recommended. Higher densities are preferred
   </td>
   <td>> 500 native dpi. Bare minimum recommended. Higher densities are preferred
   </td>
  </tr>
  <tr>
   <td>Extractor Quality
   </td>
   <td>MINEX compliance
<p>
Number of Minutiae generated by extractor to be in conformance to ISO Specification. Tested for at least 12 Minutiae points generated under test conditions
   </td>
   <td>MINEX compliance
<p>
Number of Minutiae generated by extractor to be in conformance to ISO Specification. Tested for at least 12 Minutiae points generated under test conditions
   </td>
  </tr>
  <tr>
   <td>FRR **
   </td>
   <td>< 2% FRR in respective country
   </td>
   <td>< 2% FRR in respective country
   </td>
  </tr>
  <tr>
   <td>FAR **
   </td>
   <td>0.01%
   </td>
   <td>0.01%
   </td>
  </tr>
  <tr>
   <td>DPI
   </td>
   <td>500 *
   </td>
   <td>500
   </td>
  </tr>
  <tr>
   <td>Image Specification
   </td>
   <td>ISO 19794-4
   </td>
   <td>ISO 19794-4 and ISO 19794-2
   </td>
  </tr>
  <tr>
   <td>ESD
   </td>
   <td>>= 8kv
   </td>
   <td>>= 8kv
   </td>
  </tr>
  <tr>
   <td>EMC compliance
   </td>
   <td>FCC class A or equivalent
   </td>
   <td>FCC class A or equivalent
   </td>
  </tr>
  <tr>
   <td>Operating Temperature**
   </td>
   <td>0 - 50 C
   </td>
   <td>-30 -to 50 C
   </td>
  </tr>
  <tr>
   <td>Liveness detection***
   </td>
   <td>As per IEEE 2790
   </td>
   <td>As per IEEE 2790
   </td>
  </tr>
  <tr>
   <td>Preview
   </td>
   <td>> 3 FPS Jpeg lossless frames with NFIQ 2 score superimposed
   </td>
   <td> None
   </td>
  </tr>
  <tr>
   <td>Image Format
   </td>
   <td>JPEG 2000 lossless
   </td>
   <td>JPEG2000 lossless
   </td>
  </tr>
  <tr>
   <td>Quality Score
   </td>
   <td>NFIQ 2
   </td>
   <td>NFIQ 2
   </td>
  </tr>
</table>

```
* Sufficiency to be validated for registration
** MOSIP adapters can change this if needed 
*** MOSIP adapters to decide on the availability of this feature
```

2. IRIS Capture

Refer ISO 19796-6:2011 Part 6 Specifications.
<table>
  <tr>
   <td><strong>Factor</strong>
   </td>
   <td><strong>Registration Devices</strong>
   </td>
   <td><strong>Authentication Devices</strong>
   </td>
  </tr>
  <tr>
   <td>Rotation angle
   </td>
   <td>Before compression, the Iris image will have to be pre-processed to calculate rotation angle. Refer section 6.3.1 of ISO 19794-6 for rotation angle calculation for rectilinear images.
   </td>
   <td>
   </td>
  </tr>
  <tr>
   <td>Rotation Uncertainty
   </td>
   <td>Refer ISO 19794-6
   </td>
   <td>
   </td>
  </tr>
  <tr>
   <td>Minimum Diameter
   </td>
   <td>As per ISO 19794-6:2011 medium and higher quality images are only acceptable,. Hence for this Standard, minimum acceptable Iris diameter will be 150 pixels
   </td>
   <td>Same
   </td>
  </tr>
  <tr>
   <td>Margin
   </td>
   <td>50% left and right of Iris diameter 25% top and bottom of Iris diameter
   </td>
   <td>
   </td>
  </tr>
  <tr>
   <td>Color
   </td>
   <td>The iris images shall be captured and stored in grey scale with pixel depth of 8 bits/pixel.
   </td>
   <td>
   </td>
  </tr>
  <tr>
   <td>Illumination
   </td>
   <td>The eye should be illuminated using infrared or any other source that could produce high quality grayscale image.
   </td>
   <td>
   </td>
  </tr>
  <tr>
   <td>Image Format
   </td>
   <td>JPEG 2000 lossless
   </td>
   <td>JPEG 2000 lossless
   </td>
  </tr>
  <tr>
   <td>Aspect Ratio
   </td>
   <td>1:1
   </td>
   <td>
   </td>
  </tr>
  <tr>
   <td>Image Quality
   </td>
   <td>76-100  IREXII - IQCE
   </td>
   <td>
    76-100  IREXII - IQCE
   </td>
  </tr>
  <tr>
   <td>Operation Temperature*
   </td>
   <td>-30 C to +50 C
   </td>
   <td>-30 C to +50 C
   </td>
  </tr>
  <tr>
   <td>EMC compliance
   </td>
   <td>FCC Class A or equivalent
   </td>
   <td>FCC Class A or equivalent
   </td>
  </tr>
  <tr>
   <td>Preview
   </td>
   <td>> 3 FPS Jpeg lossless frames with quality score superimposed
   </td>
   <td>Not Applicable
   </td>
  </tr>
  <tr>
   <td>Image Specification
   </td>
   <td>ISO 19794-6
   </td>
   <td>ISO 19794-6
   </td>
  </tr>
  <tr>
   <td>ISO Format
   </td>
   <td>K3
   </td>
   <td>K7
   </td>
  </tr>
</table>

```
* MOSIP adopters to decide and finalize
```

3. Face Capture

Refer ISO 19794-5:2011

<table>
  <tr>
   <td><strong>Factor</strong>
   </td>
   <td><strong>Registration Devices</strong>
   </td>
   <td><strong>Authentication Devices</strong>
   </td>
  </tr>
  <tr>
   <td>Minimum Resolution
   </td>
   <td>1080 Pixels at 2.8 mm with 110 degree view
   </td>
   <td>1080 Pixels at 2.8 mm
   </td>
  </tr>
  <tr>
   <td>Skin Tone
   </td>
   <td>All
   </td>
   <td>All
   </td>
  </tr>
  <tr>
   <td>Operation Temperature*
   </td>
   <td>-30 C to +50 C
   </td>
   <td>-30 C to +50 C
   </td>
  </tr>
  <tr>
   <td>EMC compliance
   </td>
   <td>FCC Class A or equivalent
   </td>
   <td>FCC Class A or equivalent
   </td>
  </tr>
  <tr>
   <td>Image Specification
   </td>
   <td>ISO/IEC 19794 - 5
   </td>
   <td>ISO/IEC 19794 - 5
   </td>
  </tr>
  <tr>
   <td>Image quality
   </td>
   <td>ICAO - Full frontal image, +/- 5 degrees rotation, 24 bit RGB, white background, 35 mm width, 45 mm height
   </td>
   <td>
   </td>
  </tr>
  <tr>
   <td>Image format
   </td>
   <td>JPEG 2000 lossless
   </td>
   <td>JPEG 2000 lossless
   </td>
  </tr>
</table>


We recommend that countries look at ergonomics, accessibility, ease of usage, and common availability of devices while choosing devices for use in registration and authentication scenarios.

---

## 4. Device Trust

MOSIP compliant devices provide a trust environment for the devices to be used in registration, KYC and auth scenarios. The trust level is established based on the device support for trusted execution.

### Foundational Trust Module (FTM):

The foundational trust module would be created using a secure microprocessor capable of performing all required biometric processing and secure storage of keys. The foundational device trust would satisfy the below requirements.
1. The module has the ability to securely generate, store and process cryptographic keys.
2. Generation of asymmetric keys and symmetric keys in random.
3. The module has the ability to protect keys from extraction.
4. The module has to protect the keys from physical tampering, temperature, frequency and voltage related attacks.
5. The module has the ability to perform a cryptographically validatable secure boot.
6. The module has the ability to run trusted applications.
The foundational device trust derived from this module is used to enable trust-based computing for biometric capture.
The foundational device trust module provides for a trusted execution environment based on the following.
1. Secure Boot
    1. Ability to cryptographically verify code before execution.
    2. Ability to check for integrity violation of the module/device
    3. Halt upon failure.
    4. Ability to securely upgrade and perform forward only upgrades, to thwart downgrade attacks. 
1. Secure application
    1. Ability to run applications that are trusted.
    2. Protect against downgrading of applications.

**Foundational Trust Module Identity:**

The foundational module upon its first boot is expected to generate a random asymmetric key pair and provide the public part of the key to obtain a valid certificate. The entire certificate issuance would be in a secured provisioning facility. The certificate issued to the module will have a defined validity period as per the MOSIP certificate policy document defined by the MOSIP adopters.

**Device Identity:**

As MOSIP deals with biometrics it is imperative that all devices that connect to MOSIP are identifiable. MOSIP believes in cryptographic Identity as its basis for trust.

**Physical Id:** An identification mark that shows MOSIP compliance and a readable unique device serial number (minimum of 12 digits), make and model. The same information has to be available over a 2D QR Code or Barcode.

**Digital Id:** A digital device Id in MOSIP would be a signed JSON (RFC 7515) as follows:
```
{
    “serialNo”: "Serial number",

    “make”: "Make of the device",

    “model” : "Model of the device",

    “type”: [“Fingerprint”, “Iris”, “Face"], //More types will be added.

    “subType”: "subtypes of the biometric device",

    “deviceProvider”: "Device provider name",

    “deviceProviderId”: "Device provider Id",

    “dateTime”: "Datetime in ISO format with timezone.  Identity request time"

}
```
Signed with the JSON Web Signature (RFC 7515) using the “Foundational Trust Module” Identity key, this data is the fundamental identity of the device.  Every MOSIP compliant device will need the foundational trust module. 

The only exception to this rule is for the devices that have the purpose (explained below during device registration)  as "Registration". Those devices are called as L0 where there is not FTM. These devices would sign the request with device key.

Signed Digital Id would look as follows.
```
"digitalId": "base64urlencoded(header).base64urlencoded(payload).base64urlencoded(signature)"
```
Unsigned digital Id would look as follows.
```
"digitalId": "base64urlencoded(payload)"
```
payload is the Digital ID json object.

**Accepted Values**:
```
    serialNo - Same as the Physical Id

    make - Brand name

    model - Model of the device

    type - [“Fingerprint”, “Iris”, “Face’’], //More types will be added.
    
    subType - subtype is based on the type.

	Finger - “Slab”, “Single”, “Touchless”

                Iris - “Single”, “Double”,

               Face - Full face

    deviceProvider - Device provider name, This would be a legal entity in the country,

    deviceProviderId: Device provider Id issued by MOSIP
    
    dateTime:  ISO format with timezone.  Identity request time 
```
---
## 5. Device Service - Communication Interfaces

The section explains the necessary details of the biometric device connectivity, accessibility, discoverability and protocols used to build and communicate with the device.

The device should implement only the following set of APIs.  All the API’s are independent of the physical layer and the operating system, with the invocation being different across operating systems. While the operating system names are defined in this spec a similar technology can be used for unspecified operating systems.

It is expected that the device service ensures that the device is connected  locally to the host.

### 5.1 Device Discovery:
#### Specifications for Windows and Linux

Device discovery would be used to identify MOSIP compliant devices in a system by the applications. The protocol is designed as simple plug and play with all the necessary abstraction to the specifics.
Discovery Request:

**Request:**
```
{

“type”: "type of the device"

}
```
**Accepted Values **
```
type: “Biometric Device”, “Fingerprint”, “Face”, “Iris”

Note: “Biometric Device” - is a special type and used in case if you are looking for any biometric device.
```
**Response:**
```
[
    {    
    “deviceId”: "internal Id",
    “deviceStatus”: "device status",
    “certification”: "certification level",
    “serviceVersion”: "device service version",
    “deviceSubId”: "device sub Id’s",
    “callbackId”: "baseurl to reach to the device“,
    "digitalId": "unsigned digital id of the device",
    "deviceCode": "A unique code given by MOSIP after successful registration",
    "specVersion": ["Array of supported MDS specification version"],
    "purpose": "Auth  or Registration or empty if not registered",
    "error": {
        "errorcode": "101",
        "errorinfo": "Invalid JSON Value Type For Discovery.. 
        }
    },
    ...
]
```
**Accepted values:**
```

deviceStatus - “Active”, “Inactive or Not Registered”

certification - “L0”, “L1” - Level of certification

serviceVersion - Version of the MDS specification that is supported.

deviceId - Internal Id to identify the actual biometric device within the device service.

deviceSubId - is the internal Id of the device. For example in case of iris capture, the device can have two modules in a single device, it is possible to address each device with a sub Id so we can identify or command each of it in isolation. Sub Id is a simple index which always starts with 1 and increases sequentially for each sub device present.

callbackId - this differs as per the OS. In case of Linux and windows operating systems it is a http URL. In the case of android, it is the intent name. In IOS it is the URL scheme. The call back url takes precedence over future request as a base URL.

digitalId - unsigned digital id as per the Digital Id definition.  

deviceCode: A unique code given by MOSIP after successful registration,

specVersion - Array of supported MDS specification version",

purpose - Purpose of the device in the MOSIP ecosystem.

errorCode - standardized error code.
errorInfo - description of the error that can be displayed to end user. Multi lingual support. 

```
Note: The response is an array that we could have a single device enumerating with multiple biometric options.

Note: The service should ensure to respond only if the type parameter matches the type of device or the type parameter is a “Biometric Device”.


#### Windows/Linux:

All the device API will be based on the HTTP specification. The device always binds to 127.0.0.1 with any of the available ports ranging from 4501 - 4600.  The IP address used for binding has to be 127.0.0.1 and not localhost.
The applications that require access to MOSIP devices could discover them by sending the http request to the supported port range.

**_HTTP Request:_**

```
MOSIPDISC http://127.0.0.1:<device_service_port>/device
HOST: 127.0.0.1: <apps port>
EXT: <app name>
```

**_HTTP Response:_**

```
HTTP/1.1 200 ok
CACHE-CONTROL:no-store
LOCATION:http://127.0.0.1:<device_service_port>
Content-Length: length in bytes of the body
Content-Type: application/json
Connection: Closed
```

Note: the pay loads are json in both the cases and are part of the body.

*callbackId would be set to the [http://127.0.0.1](http://127.0.0.1):<device_service_port>. So, the caller will use the respective verb and the url to call the service.


#### Android:
All devices on an android device should listen to the following intent io.mosip.device
Upon invocation of this intent the devices are expected to respond back with the json response filtered by the respective type.

*callbackId would be set to the appId. So, the caller will create the intent appId.Info or appId.Capture

#### IOS:
All device on an IOS device would respond to the url schema as follows.
MOSIPDISC://<call-back-app-url>?ext=<caller app name>&type=<type as defined in mosip device request>
If a MOSIP compliant device service app exist then the url would launch the service. The service in return should respond back to the caller using the call-back-app-url with the base64 encoded json as the url parameter for the key data.

Note: In IOS there are restrictions to have multiple apps registering to the same URL schema.

*callbackId would be set to the device service appname. So, the caller has to call appnameInfo or appnameCapture as the url scheme.

### 5.2 Device Info:
The device information API would be used to identify the MOSIP compliant devices and their status by the applications.

Device Info Request:

**Request:**

NONE

**Accepted Values**

**Response:**
```
[
    {
        deviceInfo: { 
        “status”: "current status",
        “deviceId”: "internal Id",
        “deviceStatus”: "device status",
        “firmware”: "firmware version",
        “certification”: "certification level",
        “serviceVersion”: "device service version",
        “deviceSubId”: "device sub Id’s",
        “callbackId”: "baseurl to reach to the device“,
        "digitalId": "signed digital id as described in the digital id section of this document",
        "deviceCode": "A unique code given by MOSIP after successful registration",
        "purpose": "Auth  or Registration",
        "specVersion": ["Array of supported MDS specification version"],
         },
        "error": {
            "errorcode": "101",
            "errorinfo": "Invalid JSON Value "
        }
    }
    ...
]
```

The final JSON is Signed with the JSON Web Signature using the “Foundational Trust Module” Identity key, this data is the fundamental identity of the device.  Every MOSIP compliant device will need the foundational trust module.

So the API would respond in the following format.
```
[
 {
  "deviceInfo": "base64urlencode(header).base64urlencode(payload).base64urlencode(signature)"
  "error": {
     "errorcode": "100",
      "errorinfo": "Device not registered. In this case the device info will be only base64urlencode(payload)"
   }
 }
]
```

**Allowed values:**

```

deviceInfo.status - “Ready”, “Busy”, “Not Ready”, "Not Registered" 
deviceInfo.deviceId - Internal Id to identify the actual biometric device within the device service.
deviceInfo.deviceStatus - "Active" or "InActive"
deviceInfo.firmware - Exact version of the firmware
deviceInfo.certification - “L0”, “L1” - Level of certification
deviceInfo.serviceVersion - Version of the current document.
deviceInfo.biometric device within the device service.
deviceInfo.deviceSubId - is the internal id of the device. In case of iris when we have two iris capture modules in a single device, it is possible to address each device with a sub Id so we can identify or command each of it in isolation. This in an index that always starts with 1 and increments sequentially.
deviceInfo.callbackId - base URL to communicate
deviceInfo.digitalId - as defined under the digital id section for unsigned digital id.
deviceInfo.purpose - "Auth" or "Registration" or empty in case the status is "Not Registered"
deviceInfo.specVersion: "Array of MDS specification version",
error - relevant errors as defined under the "Error section" of this document

```
**_Note_**: The response is an array that we could have a single device enumerating with multiple biometric options.

**_Note_**: The service should ensure to respond only if the type parameter matches the type of device or the type parameter is a “Biometric Device”.

#### Windows/Linux:
The applications that require more details of the MOSIP devices could get them by sending the http request to the supported port range.

**_HTTP Request:_**
```
MOSIPDINFO http://127.0.0.1:4501/info
HOST: 127.0.0.1: <apps port>
EXT: <app name>
```

**_HTTP Response:_**
```
HTTP/1.1 200 ok
CACHE-CONTROL:no-store
LOCATION:http://127.0.0.1:<device_service_port>
Content-Length: length in bytes of the body
Content-Type: application/json
Connection: Closed
```

Note: the pay loads are json in both the cases and are part of the body.

#### Android:
On an android device should listen to the following intent appId.Info
Upon invocation of this intent the devices are expected to respond back with the json response filtered by the respective type.

#### IOS:
On an IOS device would respond to the url schema as follows.
APPIDINFO://<call-back-app-url>?ext=<caller app name>&type=<type as defined in mosip device request>
If a MOSIP compliant device service app exist then the url would launch the service. The service in return should respond back to the called using the call-back-app-url with the base64 encoded json as the url parameter for the key data.

Note: In IOS there are restrictions to have multiple app registering to the same URL schema.

### 5.3 Capture:
The capture request would be used to capture a biometric from MOSIP compliant devices by the applications.  The capture call will respond with success to only one call at a time. So in case of a parallel call the device info details are sent with status as “Busy”

Capture Request:

**Request:**

```
{
    “env”:  "target environment",
    "purpose": "Auth  or Registration",
    "specVersion": "expected version of the biometric element",
    "timeout" : <timeout for capture>,
    “captureTime”: <time of capture request in ISO format including timezone>,
    "domainUri": <uri of the auth server>,
    “transactionId”: <transaction Id for the current capture>,

    “bio”: [
        {
            “type”: <type of the biometric data>,
            “count”:  <fingerprint/Iris count, in case of face max is set to 1>,

            “requestedScore”: <expected quality score that should match to complete a successful capture>,
            “deviceId”: <internal Id>,
            “deviceSubId”: <specific device Id>,
            “previousHash”: <hash of the previous block>
        }
    ],
    customOpts:
    {
        //max of 50 key value pair. This is so that vendor specific parameters can be sent if necessary. The values cannot be hardcoded and have to be configured by the apps server and should be modifiable upon need by the applications. Vendors are free to include additional parameters and fine-tuning parameters. None of these values should go undocumented by the vendor. No sensitive data should be available in the customOpts.
    }

}
```

**Allowed Values:**

```

env - Allowed values are Staging| Developer| Pre-Production | Production

purpose - Allowed values are Auth| Registration

version - version of the biometric block as specified in the authentication or customer registration specification.

timeout - Max time the app will wait for the capture. Its expected that the api will respond back before timeout with the best frame. All timeouts are in milliseconds

captureTime - time of capture in ISO format with timezone.

domainUri - unique uri per auth providers. This can be used to federate across multiple providers or countries or unions.

transactionId - unqiue Id of the transaction. This is an internal Id to the application thats providing the service. Use different id for every successfull auth. So even if the trnsaction fails after auth we expect this number to be unique.

bio.type -  “FIR” , “IIR”, “Face”

bio.count - number of biometric data that is collected for a given type. The device should validate and ensure that this number is in line with the type of biometric that's captured.

bio.requestedScore - what is the expected quality? Upon reaching the necessary quality the biometric device is expected to auto capture the image.

bio.deviceId - a unique Id per device service. In case a single device handles both face and iris the device Id will identify iris and camera uniquely. In case the Id is sent as 0 then the device is expected to capture biometric from both the devices.

bio.deviceSubId  - a specific device sub Id.  Should be set to 0 if we don't know any specific device sub Id.

bio.previousHash - For the first capture the previousHash is hash of empty utf8 string. From the second capture the previous captures hash (as hex encoded) is used as input. This is used to chain all the captures across modalities so all captures have happened for the same transaction and during the same time period. 

customOpts - If in case the device vendor has additional parameters that they can take and act accordingly then those values can be sent by the application developers to the device service.
```

**Response:**

```
[

        {
          "specVersion" : "MDS spec version",
          "data": {	

            "digitalId" : "unsigned digital Id as described in this document",

            "deviceCode": "A unique code given by MOSIP after successfull registration",

            "deviceServiceVersion": "Service version",

            "bioType": "FIR",

            "bioSubType": "UNKNOWN",
            
            "purpose": "Auth  or Registration",

            "env":  "target environment",

            "domainUri": "uri of the auth server",

            "bioValue": "encrypted with session key and base64urlencoded biometric data",

            "transactionId": "unique transaction id",

            "timestamp": "ISO format datetime with time zone",

            "requestedScore": "floating point number to represent the minimum required score for the capture",

            "qualityScore": "floating point number representing the score for the current capture"

          },

          "hash": "sha256(sha256 hash in hex format of the previous data block + sha256 hash in hex format of the current data block before encryption)",

          "sessionKey": "encrypted with MOSIP public key (dynamically selected based on the uri) and encoded session key biometric",

          "error": {

        "errorcode": "101",

        "errorinfo": "Invalid JSON Value"

    }

    },

        {
          "specVersion" : "MDS spec version",
          "data": {

            "digitalId": "unsigned digital Id as described in this document",
 
            "deviceCode": "A unique code given by MOSIP after successfull registration",

            "deviceServiceVersion": "Service version",

            "bioType": "FIR",

            "bioSubType": "LEFT",

            "purpose": "Auth  or Registration",
            
            "env":  "target environment", 
            
            "domainUri": "uri of the auth server",          

            "bioValue": "encrypted with session key and base64urlencoded biometric data",

            "transactionId": "unique transaction id",

            "timestamp": "ISO Format date time with timezone"

          },

          "hash": "sha256(sha256 hash in hex format of the previous data block + sha256 hash in hex format of the current data block before encryption)",

          "sessionKey": "encrypted with MOSIP public key and encoded session key biometric",

          "error": {

             "errorcode": "101",

              "errorinfo": "Invalid JSON Value"

         }

    }

]
```

**Accepted values:**

data.bioValue - Encrypted and Encoded to base64urlencode biometric value. AES GCM encryption with a random key. The IV for the encryption is set to last 16 digits of the timestamp. ISO formated bioValue. Look at the Authentication document to understand more about the encryption.  

data - The entire data object is stored as follows. 
```
"data" : "base64urlencode(header).base64urlencode(payload).base64urlencode(signature)

payload is defined as the entire byte array of data block. The data block
```

hash - the value of the previousHash atribute in the request object or the value of hash atribute of the previous data block (used to chain every single data block) concatenated with the hex encode sha256 hash of the current data block before encryption.  
sessionKey - Random AES key used for the encryption of the bioValue. The encryption key is encrypted using the public key with RSA OAEP. Sent as base64urlencoded

#### Windows/Linux:

The applications that requires to capture biometric data from a MOSIP devices could do so by sending the http request to the supported port range.

**_HTTP Request:_**

CAPTURE [http://127.0.0.1](http://127.0.0.1):<device service port>/capture

HOST: 127.0.0.1: <apps port>

EXT: <app name>

**_HTTP Response:_**

```
HTTP/1.1 200 ok

CACHE-CONTROL:no-store

LOCATION:[http://127.0.0.1](http://127.0.0.1):<device service port>

Content-Length: length in bytes of the body

Content-Type: application/json

Connection: Closed
```

Note: the pay loads are json in both the cases and are part of the body.

#### Android:

All device on an android device should listen to the following intent appid.capture

Upon this intend the devices are expected to respond back with the json response filtered by the respective type.

#### IOS:

All device on an IOS device would respond to the url schema as follows.

APPIDCAPTURE://<call-back-app-url>?ext=<caller app name>&type=<type as defined in mosip device request>

If a MOSIP compliant device service app exist then the url would launch the service. The service in return should respond back to the called using the call-back-app-url with the base64 encoded json as the url parameter for the key data.

### 5.4 Device Stream
The device would open a stream channel to send the live video streams. This would help when there is an assisted operation to collect biometric.  Please note the stream API’s are available only for registration environment.

**Device Stream Request:**

Used only for the registration module compatible devices. This api is visible only for the devices that are registered for the purpose as "Registration".

**Request:**

```
{
    “deviceId”: "internal Id",
    “deviceSubId”: "device sub Id’s",
}
```

**Accepted Values **

```
deviceId - Internal Id
deviceSubId - The sub id of the device thats responsoible to stream the data.
```

**Response:**

Live Video stream with quality of 3 frames per second or more using M-JPEG2000 https://en.wikipedia.org/wiki/Motion_JPEG

**_Note:_** Preview should have the quality markings and segement marking. The preview would also be used to display any error message to the user screen. All error messages should be localizable.

**Accepted values:**

#### Windows/Linux:

The applications that require more details of the MOSIP devices could get them by sending the http request to the supported port range.

**_HTTP Request:_**

STREAM   http://127.0.0.1:4501/stream

HOST: 127.0.0.1: <apps port>

EXT: <app name>

**_HTTP Response:_**

HTTP Chunk of frames to be displayed. Minimum frames 3 per second

#### Android:

No support for streaming

#### IOS:

No support for streaming

### 5.5 Device Registration Capture:
The registration client application will send sample API. The sample API’s response will provide the actual biometric data in a digitally signed non encrypted form.   When the Device Registration Capture API is called the frames should not be added to the stream. The device is expected to send the images as well as its extraction values. For e.g. the segmented JPEG image is in the bioValue and the segmented and extracted will fit into the bioExtract.

The requestedScore is in the scale of 1-100.  In case the requestedScore is for all the count as average. So, in cases where you have four fingers the average of all will be considered for capture threshold.

Device Registration Capture Request:

The API is used by the devices that are compatible for the registration module.

**Request:**

```
{

“env”:  "target environment",

"specVersion": "expected MDS spec version",

"timeout": "timeout for registration capture",

“captureTime”: "time of capture request in ISO format including timezone",

“registrationId”: "registration Id for the current capture",

“bio”: [

  	{

     		“type”: "type of the biometric data",

			“count”:  "fingerprint/Iris count, in case of face max is set to 1",

			“exception”: ["finger or iris to be excluded"],


			“requestedScore”: "expected quality score that should match to complete a successful capture.",

			“deviceId”: "internal Id",

			“deviceSubId”: "specific device Id",

			“previousHash”: "hash of the previous block"

  	}

],

customOpts:

{

    //max of 50 key value pair. This is so that vendor specific parameters can be sent if necessary. The values cannot be hardcoded and have to be configured by the apps server and should be modifiable upon need by the applications. Vendors are free to include additional parameters and fine-tuning parameters. None of these values should go undocumented by the vendor. No sensitive data should be available in the customOpts.

 }

}
```

**Accepted Values**

```
env - Allowed values are Staging| Developer| Pre-Production | Production

version - version of the biometric block as specified in the registration specification.

timeout - Max time the app will wait for the capture.

captureTime - time of capture in ISO format with timezone.

bio.type - “FMR”,  “FIR” , “IIR”, “Face”

bio.count - number of biometric data that is collected for a given type. The device should validate and ensure this number is in line with the type of biometric that's captured.

bio.exception: “LF_INDEX”, “LF_MIDDLE”, “LF_RING”, “LF_LITTLE”,  “LF_THUMB” “RF_INDEX”, “RF_MIDDLE”, “RF_RING”, “RF_LITTLE”,  “RF_THUMB”, “L_IRIS”, “R_IRIS”. This is an array and all the exceptions are marked. In case of an empty element assume there is no exception.

bio.requestedScore - what is the expected quality? Upon reaching the necessary quality the biometric device is expected to auto capture the image.

bio.deviceId - a unique Id per device service. In case a single device handles both face and iris the device Id will identify iris and camera uniquely. In case the Id is sent as 0 then the device is expected to capture biometric from both the devices.

bio.deviceSubId  - a specific device sub Id.  Should be set to 0 if we don't know any specific device sub Id. In case of Fingerprint/IRIS its 1 for left and 2 for right fingerprint/iris. 3 for thumb/two iris.

bio.previousHash - The previous hash for the image captured by this device per registration. For the first capture (per registration) use the hash of empty string.
```

**Response:**

```
{"biometrics": [

        {
          "specVersion" : "MDS Spec version",
          
          "data": {	

            "digitalId": "Unsigned digital id of the device as per the Digital Id definition..",

            "deviceCode": "A unique code given by MOSIP after successfull registration",

            "deviceServiceVersion": "",

            "bioSubType": "Middle Finger",

            "purpose": "Auth  or Registration",
            "env":  "target environment",

            "bioValue": "<base64urlencoded biometric data (raw image)>",

            "bioExtract": "<base64urlencoded extracted biometric (ISO format)",

            "registrationId": "1234567890",

            "timestamp": "2019-02-15T10:01:57.086+05:30",

            "requestedScore": "<floating point number to represent the minimum required score for the capture. This ranges from 0-100>",

            "qualityScore": "<floating point number representing the score for the current capture. This ranges from 0-100>"

          },

          "hash": "sha256(sha256 hash in hex format of the previous data block + sha256 hash in hex format of the current data block)",         

         "error": {

        "errorcode": "101",

        "errorinfo": "Invalid JSON Value Type For Discovery.. ex: {type: “Biometric Device” or “Fingerprint” or “Face” or “Iris” or “Vein”} "

    }

        },

        {
          "specVersion" : "MDS Spec version",
          "data": {

            "deviceCode": "",

            "digitalId": "Unsigned digital id of the device as per the Digital Id definition.", 

            "deviceServiceVersion": "",

            "bioSubType": "LEFT",

            "purpose": "Auth  or Registration",
            "env":  "<target environment>",             

            "bioValue": "<base64urlencoded biometric data (raw image)>",

            "bioExtract": "<base64urlencoded extracted biometric (ISO format)",

            "registrationId": "1234567890",

            "timestamp": "2019-02-15T10:01:57.086+05:30"

          },

          "hash": "sha256(sha256 hash in hex format of the previous data block + sha256 hash in hex format of the current data block before encryption)",

    "error": {

            "errorcode": "101",

            "errorinfo": "Invalid JSON Value Type For Discovery.. ex: {type: “Biometric Device” or “Fingerprint” or “Face” or “Iris” or “Vein”} "

        }

        }

      ]
}
```

**Accepted values:**
data - base64urlencode(header).base64urlencode(payload).base64urlencode(signature)

#### Windows/Linux: 

The applications that require more details of the MOSIP devices could get them by sending the http request to the supported port range.

**_HTTP Request:_**

RCAPTURE  http://127.0.0.1:4501/capture

HOST: 127.0.0.1: <apps port>

EXT: <app name>

**_HTTP Response:_**

HTTP response.

#### Android:

No support for Registration Capture

#### IOS:

No support for Registration Capture

---

## 6. Device Server

The device server exposes two external device APIs to manage devices. These will be consumed from Management Server created by the device provider. Refer to the subsequent section in this document.

### 6.1 Registration:
The MOSIP server would provide the following device registration API which is whitelisted to the management servers of the device provider or their partners.
Note: This API is exposed by the MOSIP server to the device providers.
http://device.mosip.io /device/register
HTTP Request
Type: POST

```
{

“deviceData”: { 

“deviceId”: "unique Id to identify a biometric capture device",

"purpose": "Auth  or Registration. Can not be empty",

“deviceInfo”: {
    “deviceSubId”: "an array of sub Ids that are available",
    
    “certification”:  "certification level",

    "digitalId": "signed digital id of the device",

    “firmware”: "firmware version",

    “deviceExpiry”: "device expiry date",

    “timestamp”:  "ISO format datetime with timezone"
    },
“foundationalTrustProviderId” : "foundation trust provider Id, in case of L0 this is empty"

}

}
```
Accepted Values:
device data is sent in the following format.

"deviceData" : base64urlencode(header).base64urlencode(payload).base64urlencode(signature)

payload is the object in deviceData.

Response:

```
{

"response": {

    “status”:  "registration status",

    “error”: {

   	 "code": "error code if registration fails",

   	 "message": "description of the error code",

    }

    "deviceCode": "UUID RFC4122 Version 4 for the device issued by the mosip server",

    "timestamp": "timestamp in ISO format",

    "env": "prod/development/stage"

    }

}

```
The response is of the following format

"response" : base64urlencode(header).base64urlencode(payload).base64urlencode(signature)

The response should be sent to the device. The device is expected to store the deviceCode within its storage in a safe manner. This device code is used during the capture stage.

<b>Note</b>: The device once registered for a specific purpose can not be changed after successfull registration. The device can only be used for that specific mosip process.

### 6.2 De-Register:
http://device.mosip.io /device/deregister
Request:

```
{
 device: {
“deviceCode”: <device code>,
“env”: <environment>
 “timestamp”: <iso format time of successful registration of the device>
}
 “signature”: “signature of the device element using the device provider certificate”
}
```

---

## 7. Management Server

The management server has the following objectives.
1. Validate the devices to ensure its a genuine device from the respective device provider. This can be achieved using the device info and the certificates for the Foundational Trust Module.
1. Register the genuine device with the MOSIP device server.
1. Manage/Sync time between the end device the server. The time to be synced should be the only trusted time accepted by the device.
1. Ability to issue commands to the end device for
    1. Key rotation of the end device
    1. De-registration of the device
    1. Collect device info
1. A central repository of all the approved devices from the device provider.
1. Safe storage of keys using HSM FIPS 140-2 Level 3. These keys are used to issue the device certificate upon registration.
The Management Server is created and hosted by the device provider outside of MOSIP software. The communication protocols between the MDS and the Management Server can be decided by the respective device provider. Such communication should be restricted to the above specified interactions only. No transactional information should be sent to this server.

---

## 8. Compliance
L1 Certified Device / L1 Device - A device certified as capable of performing encryption on the device inside its trusted zone.
L0 Certified Device / L0 Device - A device certified as one where the encryption is done on the host inside its device driver or the MOSIP device service.

<table>
  <tr>
   <td>API
   </td>
   <td>Compatible
   </td>
  </tr>
  <tr>
   <td>Device Discovery
   </td>
   <td>L0/L1
   </td>
  </tr>
  <tr>
   <td>Device Info
   </td>
   <td>L0/L1
   </td>
  </tr>
  <tr>
   <td>Capture
   </td>
   <td>L1
   </td>
  </tr>
  <tr>
   <td>Registration Capture
   </td>
   <td>L0/L1
   </td>
  </tr>
</table>

---

## 9. Error Codes

<table>
<tr> <td>0</td> <td> Success </td> </tr>
<tr> <td>100</td> <td> Device not registered </td> </tr>
<tr> <td>101</td> <td> Unable to detect a biometric object </td> </tr>
<tr> <td>102</td> <td> Technical error during extraction. </td> </tr>
<tr> <td>103</td> <td> Device tamper detected </td> </tr>
<tr><td>104</td> <td> Unable to connect to management server </td> </tr>
<tr><td>105</td> <td> Image orientation error </td> </tr>
<tr><td>106</td> <td> Device not found </td> </tr>
<tr><td>107</td> <td> Device public key expired </td> </tr>
<tr><td>108</td> <td> Domain public key missing </td> </tr>
<tr> <td>5xx</td> <td> Custom errors. The device provider is free to choose his error code and error messages. </td> </tr>
</table>