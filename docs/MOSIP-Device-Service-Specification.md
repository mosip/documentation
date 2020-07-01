**Aug 2019 | Version: 0.9.5**

**Status: Draft**

**Last updated date: 13th June 2020**

# Table of Contents 

* [Introduction & Background](#introduction-and-background)
* [Glossary of Terms](#glossary-of-terms)
* [Device Specification](#device-specification)
* [Device Trust](#device-trust)
	* [Foundational Trust Module](#foundational-trust-module-ftm)
	* [Device](#device)
	* [Keys](#keys)
* [Device Service - Communication Interfaces](#device-service-communication-interfaces)
	* [Device Discovery](#device-discovery) 
	* [Device Info](#device-info) 
	* [Capture](#capture) 
	* [Device Stream](#device-stream) 
	* [Device Registration Capture](#device-registration-capture) 
* [Device Server](#device-server)
	* [Registration](#registration)
	* [De-Register](#de-register)
	* [Certificates](#certificates)
* [Management Server and Client](#management-server-and-management-client)
	* [Management Server Functionalities and Interactions](#management-server-functionalities-and-interactions)
	* [Management Client](#management-client)
* [Compliance](#compliance)
* [Cryptography](#cryptography)
* [Error Codes](#error-codes)

---

# Introduction & Background 

## Objective
The objective of this specification document is to establish the technical and compliance standards/ protocols that are necessary for a biometric device to be used in MOSIP solutions.

## Target Audience
This is a biometric device specification document and aims to help the biometric device manufactures, their developers, and their designers in building MOSIP compliant devices.
This document assumes that the readers are familiar with MOSIP registration and authentication services.

## MOSIP Devices
All devices that collect biometric data for MOSIP should operate within the specification of this document.

---

# Glossary of Terms
* Device Provider - An entity that manufactures or imports the devices in their name. This entity should have legal rights to obtain an organization level digital certificate from the respective authority in the country.
* Foundational Trust Provider - An entity that manufactures the foundational trust module.
* Device - A hardware capable of capturing biometric information.
* L1 Certified Device / L1 Device - A device certified as capable of performing encryption in line with this spec in its trusted zone.
* L0 Certified Device / L0 Device - A device certified as one where the encryption is done on the host machine device driver or the MOSIP device service.
* Foundational Trust Provider Certificate - A digital certificate issued to the "Foundational Trust Provider". This certificate proves that the provider has successfully gone through the required Foundational Trust Provider evaluation. The entity is expected to keep this certificate in secure possession in an HSM. All the individual trust certificates are issued using this certificate as the root. This certificate would be issued  by the countries in conjunction with MOSIP.
* Device Provider Certificate - A digital certificate issued to the "Device Provider". This certificate proves that the provider has been certified for L0/L1 respective compliance. The entity is expected to keep this certificate in secure possession in an HSM. All the individual trust certificates are issued using this certificate as the root. This certificate is issued by the countries in conjunction with MOSIP.
* Registration - The process of applying for a Foundational Id.
* KYC - Know Your Customer. The process of providing consent to perform profile verification and update.
* Auth - The process of verifying one’s identity.
* FPS - Frames Per Second
* Management Server - A server run by the device provider to manage the life cycle of the biometric devices.
* Device Registration - The process of registering the device with MOSIP servers.
* Signature - All signature should be as per RFC 7515.
* header in signature - Header in signature means the attribute with "alg" set to RS256 and x5c set to base64encoded certificate.
* payload is the byte array of the actual data, always represented as base64urlencoded.
* signature - base64urlencoded signature bytes
* ISO Format Time - ISO 8601 with format yyyy-mm-dd HH:MM:ssZ

---

# Device Specification
The MOSIP device specification provides compliance guidelines to devices for them to work with MOSIP. The compliance is based on device capability, trust and communication protocols. A MOSIP compliant device would follow the standards established in this document. It is expected that the devices are compliant to this specification and tested and validated. The details of each of these are outlined in the subsequent sections.

## Device Capability
The MOSIP compliant device is expected to perform the following:
* Should have the ability to collect one or more biometric
* Should have the ability to sign the captured biometric image or template.
* Should have the ability to protect secret keys
* Should have no mechanism to inject the biometric

## Base Specifications for Devices

### Fingerprint Capture
Refer ISO 19794-4:2011

Factor | Registration Devices | Authentication Devices
-------|----------------------|-----------------------
Minimum Resolution | > 500 native dpi. Bare minimum recommended. Higher densities are preferred | > 500 native dpi. Bare minimum recommended. Higher densities are preferred
FRR\*\* | < 2% FRR in respective country | < 2% FRR in respective country
FAR\*\*	| 0.01%	| 0.01%
DPI	| 500\* | 500
Image Specification | ISO 19794-4 B.1 AFIS Normative | ISO 19794-4 B.2 Personal Verification
ESD | >= 8kv | >= 8kv
EMC compliance | FCC class A or equivalent | FCC class A or equivalent
Operating Temperature\*\* |	0 - 50 C | -30 -to 50 C
Liveness detection\*\*\* | As per IEEE 2790 | As per IEEE 2790
Preview | > 3 FPS JPEG lossless frames with NFIQ 2 score superimposed | None
Image Format | JPEG 2000 lossless | JPEG 2000 lossless, WSQ (Compression upto 10:1)\*\*
Quality Score | NFIQ 2 | NFIQ 1
FTM | L0 - Use host based security, L1 - FTM supported security | L1 - FTM supported security, L2 - with tamper protection.

{% hint style="info" %}
\*  Sufficiency to be validated for registration <br>
\*\*  MOSIP adopters can change this if needed <br>
\*\*\*  MOSIP adopters to decide on the availability of this feature
{% endhint %}

### IRIS Capture
Refer ISO 19796-6:2011 Part 6 Specifications.

Factor | Registration Devices | Authentication Devices
-------|----------------------|-----------------------
Rotation angle | Before compression, the Iris image will have to be preprocessed to calculate rotation angle. Refer section 6.3.1 of ISO 19794-6 for rotation angle calculation for rectilinear images.| 
Rotation Uncertainty | Refer ISO 19794-6 | 
Minimum Diameter | As per ISO 19794-6:2011 medium and higher quality images are only acceptable,. Hence for this Standard, minimum acceptable Iris diameter will be 150 pixels | Same
Margin | Same as ISO |	
Color | The iris images shall be captured and stored in gray scale with pixel depth of 8 bits/pixel | 	
Illumination | The eye should be illuminated using infrared or any other source that could produce high quality gray scale image | 
Image Format | JPEG 2000 lossless | JPEG 2000 lossless
Aspect Ratio | 1:1 | 
Image Quality | ISO/IEC 29794-6 | ISO/IEC 29794-6
Operation Temperature\* | -30 C to +50 C | -30 C to +50 C
EMC compliance | FCC Class A or equivalent | FCC Class A or equivalent
Preview | > 3 FPS Jpeg lossless frames with quality score superimposed | Not Applicable
Image Specification | ISO 19794-6 | ISO 19794-6
ISO Format | K3 | K7
FTM | L0 - Use host based security, L1 - FTM supported security | L1 - FTM supported security, L2 - with tamper protection.

{% hint style="info" %}
\*  MOSIP adopters to decide and finalize
{% endhint %}

### Face Capture
Refer ISO 19794-5:2011

Factor | Registration Devices | Authentication Devices
-------|----------------------|-----------------------
Minimum Resolution | 1080 Pixels at 2.8 mm with 110 degree view | 1080 Pixels at 2.8 mm
Skin Tone | All | All
Operation Temperature\* | -30 C to +50 C | -30 C to +50 C
EMC compliance | FCC Class A or equivalent | FCC Class A or equivalent
Image Specification | ISO/IEC 19794-5 | ISO/IEC 19794-5
Exception Image Specification | Full Frontal with FACE features, two palms next to the face, waist up photo. 6X4 mm	| NA
Image quality | ICAO - Full frontal image, +/- 5 degrees rotation, 24 bit RGB, white background, 35 mm width, 45 mm height | 
Image format | JPEG 2000 lossless | JPEG 2000 lossless
FTM | L0 - Use host based security, L1 - FTM supported security | L1 - FTM supported security, L2 - with tamper protection.

{% hint style="info" %}
\* MOSIP adopters to decide and finalize
{% endhint %}

We recommend that countries look at ergonomics, accessibility, ease of usage, and common availability of devices while choosing devices for use in registration and authentication scenarios.

---

# Device Trust
MOSIP compliant devices provide a trust environment for the devices to be used in registration, KYC and AUTH scenarios. The trust level is established based on the device support for trusted execution.

* L1 - The trust is provided by a secure chip with secure execution environment.
* L2 - The trust is provided by a secure chip with secure execution environment and complete tamper protection and responsive across the entire device.
* L0 - The trust is provided at the software level. No hardware related trust exist. This type of compliance is used in controlled environments.  

## Foundational Trust Module (FTM)
The foundational trust module would be created using a secure microprocessor capable of performing all required biometric processing and secure storage of keys. The foundational device trust would satisfy the below requirements.

1. The module has the ability to securely generate, store and process cryptographic keys.
1. Generation of asymmetric keys and symmetric keys with TRNG.
1. The module has the ability to protect keys from extraction.
1. The module has to protect the keys from physical tampering, temperature, frequency and voltage related attacks.
1. The module could withstand against Hardware cloning.
1. The module could withstand probing attacks
1. The module provides memory segregation for cryptographic operations and protection against buffer over flow attacks
1. The module provides ability to withstand cryptographic side channel attacks like Differential Power analysis attacks, Timing attacks.
1. CAVP validated implementation of the cryptographic algorithm.
1. The module has the ability to perform a cryptographically validatable secure boot.
1. The module has the ability to run trusted applications.

The foundational device trust derived from this module is used to enable trust-based computing for biometric capture.
The foundational device trust module provides for a trusted execution environment based on the following:

1. Secure Boot
	1. Ability to cryptographically verify code before execution.
	1. Ability to check for integrity violation of the module/device.
	1. Halt upon failure.
	1. Ability to securely upgrade and perform forward only upgrades, to thwart downgrade attacks. 
	1. SHA256 hash equivalent or above should be used for all hashing requirements
	1. All root of trust is provisioned upon first boot or before.
	1. All upgrades would be considered success only after the successful boot with proper hash and signature verification. 
	1. The boot should fail upon hash/signature failures and would never operate in a intermediary state. 
	1. Maximum of 10 failed attempts should lock the upgrade process and brick the device. However chip manufactures can decide to be less than 10.
1. Secure application
	1. Ability to run applications that are trusted.
	1. Protect against downgrading of applications.
	1. Isolated memory to support cryptographic operations. 
	1. All trust are anchored during the first boot and not modifiable.

### Certification
The FTM should have a at least one of the following certifications in each category to meet the given requirement.

#### Category: Cryptographic Algorithm Implementation
* CAVP (RSA, AES, SHA256, TRNG (DRBGVS), ECC)

{% hint style="info" %}
The supported algorithm and curves are listed [here](#cryptography)
{% endhint %}

#### Category: FTM Chip
* FIPS 140-2 L3 or above
* PCI PTS 5 or above (Pre-certified)
* Common Criteria (EAL4 and above)
	* TODO:FILL IN

#### Category: Tamper
* For L1 level compliance the FTM should support tamper evidence.
* For L2 level compliance the FTM should support all of L1 and capabilities to adopt tamper responsiveness.

### Threats to Protect
The FTM should protect against the following threats.

1. Hardware cloning attacks - Ability to protect against attacks that could result in a duplicate with keys.
1. Hardware Tamper attacks
	1. Physical tamper - No way to physically tamper and obtain it secrets. 
	1. Voltage & frequency related attacks - Should shield against voltage leaks and should prevent against low voltage. The FTM should always be in either of the state operational normally or inoperable. The FTM should never be operable when its input voltages are not met.
	1. Temperature attacks on crypto block - Low or High the FTM is expected to operate or reach inoperable state. No state in between.
1. Differential Power Analysis attack. 
1. Probing attacks - FTM should protect its surface area against any probe related attacks.
1. Segregation of memory for execution of cryptographic operation (crypto block should be protected from buffer overflow type attacks).
1. Vulnerability of the cryptographic algorithm implementation.
1. Attacks against secure boot & secure upgrade.
1. TEE/Secure processor OS attack.

### Foundational Trust Module Identity
Upon an FTM provider approved by the MOSIP adopters, the FTM provider would submit a self signed public certificate to the adopter. Let us call this as the FTM root.

The adopter would use this certificate to seed their device trust database.The FTM root and their key pairs should be generated and stored in FIPS 140-2 Level 3 or more compliant devices with no possible mechanism to extract the keys.

The foundational module upon its first boot is expected to generate a random asymmetric key pair and provide the public part of the key to obtain a valid certificate. 

The FTM provider would validate to ensure that the chip is unique and would issue a certificate with the issuer set to FTM root. 

The entire certificate issuance would be in a secured provisioning facility. Auditable upon notice by the adopters or its approved auditors.

The certificate issued to the module will have a defined validity period as per the MOSIP certificate policy document defined by the MOSIP adopters.

This certificate and private key within the FTM chip is expected to be in it permanent memory.

{% hint style="info" %}
The validity for the chip certificate can not exceed 20 years from the date of manufacturing.
{% endhint %}

## Device 
Mosip devices are most often used to collect biometrics. The devices are expected to follow the specification for all level of compliance and its usage. The mosip devices fall under the category of Trust Level 3 (TL3) as defined in MOSIP architecture. At TL3 device is expected to be whitelisted with a fully capable PKI and secure storage of keys at the hardware. 

* L0 - A device can obtain L0 certification when it uses software level cryptographic library with no secure boot or FTM.  These devices will follow different device identity and the same would be mentioned as part of exception flows.
* L1 - A device can obtain L1 certification when its built in secure facility with one of the certified FTM.
* L2 - A device can obtain L2 certification when its build in secure facility with one of the certified FTM with tamper responsiveness. Also the device should be capable of demonstrating tamper responsiveness during its entire life time.

### Device Identity
It is imperative that all devices that connect to MOSIP are identifiable. MOSIP believes in cryptographic Identity as its basis for trust.

#### Physical ID
An identification mark that shows MOSIP compliance and a readable unique device serial number (minimum of 12 digits), make and model. The same information has to be available over a 2D QR Code or Barcode. This is to help field support and validation. 

#### Digital ID
A digital device ID in MOSIP would be a signed JSON (RFC 7515) as follows:
```JSON
{
  "serialNo": "Serial number",
  "make": "Make of the device",
  "model": "Model of the device",
  "type": "Type of the biometric device",
  "deviceSubType": "Subtypes of the biometric device",
  "deviceProvider": "Device provider name",
  "deviceProviderId": "Device provider id",
  "dateTime": "Datetime in ISO format with timezone. Identity request time"
}
```

Signed with the JSON Web Signature (RFC 7515) using the "Foundational Trust Module" Identity key, this data is the fundamental identity of the device. Every MOSIP compliant device will need the foundational trust module. 

The only exception to this rule is for the L0 compliant devices that have the purpose (explained below during device registration) as "Registration". L0 devices would sign the Digital Id with the device key.

Signed Digital ID would look as follows:
```
"digitalId": "base64urlencoded(header).base64urlencoded(payload).base64urlencoded(signature)"
```

The header in the digital id would have:
```
"alg": "RS256",
"type": "JWT",
"x5c": "<Certificate of the FTM chip, If in case the chain of certificates are sent then the same will be ignored">
```

MOSIP assumes that the first certificate in the x5c is the FTM's chip public certificate issued by the FTM root certificate.

Unsigned digital ID would look as follows:
```
"digitalId": "base64urlencoded(payload)"
```
Payload is the Digital ID JSON object.

{% hint style="info" %}
For a L0 unregistered device the digital id will be unsigned. In all other scenarios, except for a discovery call, the digital ID will be signed either by the chip key (L1) or the device key (L0).
{% endhint %}

#### Accepted Values for Digital ID
* serialNo - Serial number of the device. This value should be same as printed on the device (Refer [Physical ID](#physical-id))
* make - Brand name. This value should be same as printed on the device (Refer [Physical ID](#physical-id))
* model - Model of the device. This value should be same as printed on the device (Refer [Physical ID](#physical-id))
* type - ["Finger", "Iris", "Face"], //More types can be added based on Adoptor's implementation
* deviceSubType - Subtype is based on the type 
	* For Finger - "Slap", "Single", "Touchless"
	* For Iris - "Single", "Double",
    * For Face - "Full face"
* deviceProvider - Device provider name - This would be a legal entity in the country.
* deviceProviderId - Device provider Id issued by MOSIP adopters
* dateTime - ISO format with timezone. The time during the issuance of this identity.

## Keys
List of keys used in the device and their explanation.

* **Device Key** 

	Each biometric device would contain an authorized private key after the device registration. This key is rotated frequently based on the requirement from the respective adopter of MOSIP. By default MOSIP recommends 30 days key rotation policy for the device key. The device keys are created by the device providers inside the FTM during a successful registration.

	The device keys are used for signing the biometric. More details of the signing and its usage will be [here](#device-service-communication-interfaces).

	This key is issued by the device provider and the certificate of the device key is issued by the device provider key which in turn is issued by the MOSIP adopter after approval of the device providers specific model.

* **FTM Key**

	The FTM key is the root of the identity. This key is created by the FTM provider during the manufacturing/provisioning stage. This is a permanent key and would never be rotated. This key is used to sign the Digital ID.

* **MOSIP Key**

	The MOSIP key is the public key provided by the MOSIP adopter. This key is used to encrypt the biometric biometric. Details of the encryption is listed below. We recommend to rotate this key every 1 year. 

---

# Device Service - Communication Interfaces
The section explains the necessary details of the biometric device connectivity, accessibility, discover-ability and protocols used to build and communicate with the device.

The device should implement only the following set of APIs.  All the API’s are independent of the physical layer and the operating system, with the invocation being different across operating systems. While the operating system names are defined in this spec a similar technology can be used for unspecified operating systems.

It is expected that the device service ensures that the device is connected  locally to the host.

## Device Discovery
Device discovery would be used to identify MOSIP compliant devices in a system by the applications. The protocol is designed as simple plug and play with all the necessary abstraction to the specifics.

### Device Discovery Request
```JSON
{
  "type": "type of the device"
}
```

### Accepted Values for Device Discovery Request
* type - "Biometric Device", "Finger", "Face", "Iris"

{% hint style="info" %}
"Biometric Device" - is a special type and used in case if you are looking for any biometric device.
{% endhint %}

### Device Discovery Response
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

### Accepted Values for Device Discovery Response
* deviceStatus - Allowed values are "Ready" | "Busy" | "Not Ready" | "Not Registered".
* certification - Allowed values are "L0" | "L1" | "L2" based on level of certification.
* serviceVersion - Version of the MDS specification that is supported.
* deviceId - Internal ID to identify the actual biometric device within the device service.
* deviceSubId - [1,2,3]; The device sub id could be used to enable a specific module in the scanner appropriate for a biometric capture requirement. Device sub id is a simple index which always starts with 1 and increases sequentially for each sub device present. In case of Finger/Iris its 1 for left slap/iris, 2 for right slap/iris and 3 for two thumbs/irises. The device sub id should be set to 0 if we don't know any specific device sub id. 
* callbackId - This differs as per the OS. In case of Linux and windows operating systems it is a HTTP URL. In the case of android, it is the intent name. In IOS it is the URL scheme. The call back URL takes precedence over future request as a base URL.
* digitalId - Digital ID as per the Digital ID definition but it will not be signed.  
* deviceCode - A unique code given by MOSIP after successful registration.
* specVersion - Array of supported MDS specification version.
* purpose - Purpose of the device in the MOSIP ecosystem. Allowed values are "Auth" | "Registration".
* errorCode - Standardized error code defined in the [error code section].
* errorInfo - Description of the error that can be displayed to end user. Multi lingual support. 

{% hint style="info" %}
The response is an array that we could have a single device enumerating with multiple biometric options.<br>
The service should ensure to respond only if the type parameter matches the type of device or the type parameter is a "Biometric Device".<br>
This response is a direct JSON as show in the response.
{% endhint %}

### Windows/Linux
All the device API will be based on the HTTP specification. The device always binds to 
with any of the available ports ranging from 4501 - 4600.  The IP address used for binding has to be 127.0.0.1 and not localhost.

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
The pay loads are JSON in both the cases and are part of the body.<br>
CallbackId would be set to the `http://127.0.0.1:<device_service_port>`. So, the caller will use the respective HTTP verb/method and the URL to call the service.
{% endhint %}

### Android
All devices on an android device should listen to the following intent io.mosip.device

Upon invocation of this intent the devices are expected to respond back with the json response filtered by the respective type.

{% hint style="info" %}
CallbackId would be set to the appId. So, the caller will create the intent appId.Info or appId.Capture
{% endhint %}

### IOS
All device on an IOS device would respond to the URL schema as follows:
```
MOSIPDISC://<call-back-app-url>?ext=<caller app name>&type=<type as defined in mosip device request>
```

If a MOSIP compliant device service app exist then the URL would launch the service. The service in return should respond back to the caller using the call-back-app-url with the base64 encoded json as the URL parameter for the key data.

{% hint style="info" %}
In IOS there are restrictions to have multiple apps registering to the same URL schema.<br>
CallbackId would be set to the device service appname. So, the caller has to call appnameInfo or appnameCapture as the URL scheme.
{% endhint %}

## Device Info
The device information API would be used to identify the MOSIP compliant devices and their status by the applications.

### Device Info Request
NA

### Accepted Values for Device Info Request
NA

### Device Info Response
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

The final JSON is Signed with the JSON Web Signature using the "Foundational Trust Module" Identity key, this data is the fundamental identity of the device. Every MOSIP compliant device will need the foundational trust module.

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

### Allowed values for Device Info Response
* deviceInfo.deviceStatus - Allowed values are "Ready" | "Busy" | "Not Ready" | "Not Registered". This is the status of the device.
* deviceInfo.deviceId - Internal Id to identify the actual biometric device within the device service.
* deviceInfo.firmware - Exact version of the firmware, In case of L0 this is same as serviceVersion.
* deviceInfo.certification - Allowed values are "L0", "L1" based on the level of certification.
* deviceInfo.serviceVersion - Version of the current service.
* deviceInfo.deviceSubId - [1,2,3]; The device sub id could be used to enable a specific module in the scanner appropriate for a biometric capture requirement. Device sub id is a simple index which always starts with 1 and increases sequentially for each sub device present. In case of Finger/Iris its 1 for left slap/iris, 2 for right slap/iris and 3 for two thumbs/irises. The device sub id should be set to 0 if we don't know any specific device sub id. 
* deviceInfo.callbackId - Base URL to communicate.
* deviceInfo.digitalId - As defined under the digital id section. The digital id will be unsigned if the device is L0 and the the status of the device is "Not Registered".
* deviceInfo.env - "None" if not registered. If registered, then send the registered enviornment "Staging" | "Developer" | "Pre-Production" | "Production".
* deviceInfo.purpose - Allowed values are "Auth" or "Registration" or empty in case the status is "Not Registered".
* deviceInfo.specVersion - "Array of MDS specification version".
* error - Relevant errors as defined under the "[error section](#error-codes)" of this document.

{% hint style="info" %}
The response is an array that we could have a single device enumerating with multiple biometric options.<br>
The service should ensure to respond only if the type parameter matches the type of device or the type parameter is a "Biometric Device".
{% endhint %}

### Windows/Linux
The applications that require more details of the MOSIP devices could get them by sending the HTTP request to the supported port range.

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

### Android
On an android device should listen to the following intent appId.Info

Upon invocation of this intent the devices are expected to respond back with the JSON response filtered by the respective type.

### IOS
On an IOS device would respond to the URL schema as follows:
```
APPIDINFO://<call-back-app-url>?ext=<caller app name>&type=<type as defined in mosip device request>
```

If a MOSIP compliant device service app exist then the URL would launch the service. The service in return should respond back to the called using the call-back-app-url with the base64 encoded JSON as the URL parameter for the key data.

{% hint style="info" %}
In IOS there are restrictions to have multiple app registering to the same URL schema.
{% endhint %}

## Capture
The capture request would be used to capture a biometric from MOSIP compliant devices by the applications.  The capture call will respond with success to only one call at a time. So in case of a parallel call the device info details are sent with status as "Busy".

### Capture Request
```
{
  "env": "Target environment",
  "purpose": "Auth  or Registration",
  "specVersion": "Expected version of the MDS spec",
  "timeout" : "Timeout for capture",
  "captureTime": "Time of capture request in ISO format including timezone",
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

### Allowed Values for Capture Request
* env - Allowed values are "Staging" | "Developer" | "Pre-Production" | "Production"
* purpose - Allowed values are "Auth" | "Registration"
* specVersion - Version of the biometric block as specified in the authentication or customer registration specification.
* timeout - Max time the app will wait for the capture. Its expected that the api will respond back before timeout with the best frame. All timeouts are in milliseconds.
* captureTime - Time of capture in ISO format with timezone. The time is as per the requesting application.
* domainUri - Unique URI per auth providers. This can be used to federate across multiple providers or countries or unions.
* transactionId - Unique Id of the transaction. This is an internal Id to the application thats providing the service. Use different id for every successful auth. So even if the transaction fails after auth we expect this number to be unique.
* bio.type - Allowed values are "Finger" | "Iris" | "Face".
* bio.count - Number of biometric data that is collected for a given type. The device should validate and ensure that this number is in line with the type of biometric that's captured.
* bio.bioSubType - 
	* For Finger: ["Left IndexFinger", "Left MiddleFinger", "Left RingFinger", "Left LittleFinger", "Left Thumb", "Right IndexFinger", "Right MiddleFinger", "Right RingFinger", "Right LittleFinger", "Right Thumb", "UNKNOWN"] 
	* For Iris: ["Left", "Right", "UNKNOWN"]
	* For Face: No bioSubType
* bio.requestedScore - Upon reaching the quality score the biometric device is expected to auto capture the image.
* bio.deviceId - Internal Id to identify the actual biometric device within the device service.
* bio.deviceSubId  - Specific sub id of the device that is responsible to capture the data. The device sub id could be used to enable a specific module in the scanner appropriate for a biometric capture requirement. Device sub id is a simple index which always starts with 1 and increases sequentially for each sub device present. In case of Finger/Iris its 1 for left slap/iris, 2 for right slap/iris and 3 for two thumbs/irises. The device sub id should be set to 0 if we don't know any specific device sub id.
* bio.previousHash - For the first capture the previousHash is hash of empty utf8 string. From the second capture the previous captures hash (as hex encoded) is used as input. This is used to chain all the captures across modalities so all captures have happened for the same transaction and during the same time period. 
* customOpts - If in case the device vendor has additional parameters that they can take and act accordingly then those values can be sent by the application developers to the device service.

### Capture Response
```
{
  "biometrics": [
    {
      "specVersion": "MDS spec version",
      "data": {	
        "digitalId": "digital Id as described in this document",
        "deviceCode": "A unique code given by MOSIP after successful registration",
        "deviceServiceVersion": "Service version",
        "bioType": "Finger",
        "bioSubType": "UNKNOWN",
        "purpose": "Auth  or Registration",
        "env": "Target environment",
        "domainUri": "URI of the auth server",
        "bioValue": "Encrypted with session key and base64urlencoded biometric data",
        "transactionId": "Unique transaction id",
        "timestamp": "ISO format datetime with time zone",
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
        "deviceServiceVersion": "Service version",
        "bioType": "Finger",
        "bioSubType": "Left IndexFinger",
        "purpose": "Auth  or Registration",
        "env": "target environment", 
        "domainUri": "uri of the auth server",          
        "bioValue": "encrypted with session key and base64urlencoded biometric data",
        "transactionId": "unique transaction id",
        "timestamp": "ISO Format date time with timezone",
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

### Accepted Values for Capture Response
* data.bioType - Allowed values are "Finger" | "Iris" | "Face".
* data.bioSubType - 
	* For Finger: ["Left IndexFinger", "Left MiddleFinger", "Left RingFinger", "Left LittleFinger", "Left Thumb", "Right IndexFinger", "Right MiddleFinger", "Right RingFinger", "Right LittleFinger", "Right Thumb", "UNKNOWN"] 
	* For Iris: ["Left", "Right", "UNKNOWN"]
	* For Face: No bioSubType
* data.purpose - Allowed values are "Auth" | "Registration".
* data.bioValue - Encrypted and Encoded to base64urlencode biometric value. AES GCM encryption with a random key. The IV for the encryption is set to last 16 digits of the timestamp. ISO formatted bioValue. Look at the Authentication document to understand more about the encryption.
* data.timestamp - Time as per the biometric device. Note: The biometric device is expected to sync its time from the management server at regular intervals so accurate time could be maintained on the device.
* data.requestedScore - Floating point number to represent the minimum required score for the capture.
* data.qualityScore - Floating point number representing the score for the current capture.
* hash - The value of the previousHash attribute in the request object or the value of hash attribute of the previous data block (used to chain every single data block) concatenated with the hex encode sha256 hash of the current data block before encryption.  
* sessionKey - Random AES key used for the encryption of the bioValue. The encryption key is encrypted using the public key with recommended algorithm. Sent as base64urlencoded
* thumbprint - SHA256 representation of thumbprint of the certificate that was used for encryption of session key. All texts to be treated as uppercase without any spaces or hyphens
* error - Relevant errors as defined under the "[error section](#error-codes)" of this document.

The entire data object is sent as a JWT format. So the data object will look like:
```
"data" : "base64urlencode(header).base64urlencode(payload).base64urlencode(signature)
payload - is defined as the entire byte array of data block. 
```

### Windows/Linux
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

### Android
All device on an android device should listen to the following intent appid.capture

Upon this intend the devices are expected to respond back with the JSON response filtered by the respective type.

### IOS
All device on an IOS device would respond to the URL schema as follows.
```
APPIDCAPTURE://<call-back-app-url>?ext=<caller app name>&type=<type as defined in mosip device request>
```

If a MOSIP compliant device service app exist then the URL would launch the service. The service in return should respond back to the called using the call-back-app-url with the base64 encoded json as the URL parameter for the key data.

## Device Stream
The device would open a stream channel to send the live video streams. This would help when there is an assisted operation to collect biometric. Please note the stream API’s are available only for registration environment.

Used only for the registration module compatible devices. This API is visible only for the devices that are registered for the purpose as "Registration".

### Device Stream Request
```
{
  "deviceId": "Internal Id",
  "deviceSubId": "Specific device sub Id"
}
```

### Allowed Values for device Stream Request
* deviceId - Internal Id to identify the actual biometric device within the device service.
* deviceSubId - Specific sub id of the device thats responsible to stream the data. The device sub id could be used to enable a specific module in the scanner appropriate for a biometric capture requirement. Device sub id is a simple index which always starts with 1 and increases sequentially for each sub device present. In case of Finger/Iris its 1 for left slap/iris, 2 for right slap/iris and 3 for two thumbs/irises. The device sub id should be set to 0 if we don't know any specific device sub id.

### Device Stream Response
Live Video stream with quality of 3 frames per second or more using [M-JPEG](https://en.wikipedia.org/wiki/Motion_JPEG).

{% hint style="info" %}
Preview should have the quality markings and segment marking. The preview would also be used to display any error message to the user screen. All error messages should be localized.
{% endhint %}

### Error Response for Device Stream
```
{
  "error": {
    "errorCode": "202",
    "errorInfo": "No Device Connected."
  }
}
```

### Windows/Linux
The applications that require more details of the MOSIP devices could get them by sending the HTTP request to the supported port range.

**_HTTP Request:_**
```
STREAM   http://127.0.0.1:<device_service_port>/stream
HOST: 127.0.0.1: <apps port>
EXT: <app name>
```

**_HTTP Response:_**
HTTP Chunk of frames to be displayed. Minimum frames 3 per second.

### Android
No support for streaming

### IOS
No support for streaming

## Registration Capture
The registration client application will discover the device. Once the device is discovered the status of the device is obtained with the device info API. During the registration the registration client sends the RCAPTURE API and the response will provide the actual biometric data in a digitally signed non encrypted form. When the Device Registration Capture API is called the frames should not be added to the stream. The device is expected to send the images in ISO format.

The requestedScore is in the scale of 1-100. So, in cases where you have four fingers the average of all will be considered for capture threshold. The device would always send the best frame during the capture time even if the requested score is not met.

The API is used by the devices that are compatible for the registration module. This API should not be supported by the devices that are compatible for authentication.

### Registration Capture Request
```
{
  "env":  "Target environment",
  "purpose": "Auth  or Registration",
  "specVersion": "Expected MDS spec version",
  "timeout": "Timeout for registration capture",
  "captureTime": "Time of capture request in ISO format including timezone",
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

### Accepted Values for Registration Capture Request
* env - Allowed values are "Staging" | "Developer" | "Pre-Production" | "Production".
* purpose - Allowed values are "Auth" | "Registration".
* specVersion - Version of the biometric block as specified in the registration specification.
* timeout - Max time the app will wait for the capture.
* captureTime - Time of capture in ISO format with timezone, This is time as per the request application.
* transactionId - Unique transaction Id for the current capture request
* bio.type - Allowed values are "Finger" , "Iris", "Face".
* bio.count - Number of biometric data that is collected for a given type. The device should validate and ensure this number is in line with the type of biometric that's captured.
* bio.bioSubType - Array of bioSubType for respective biometric type.
	* For Finger: ["Left IndexFinger", "Left MiddleFinger", "Left RingFinger", "Left LittleFinger", "Left Thumb", "Right IndexFinger", "Right MiddleFinger", "Right RingFinger", "Right LittleFinger", "Right Thumb"]
	* For Iris: ["Left", "Right"]
	* For Face: No bioSubType
* bio.exception - This is an array and all the exceptions are marked. In case of an empty element assume there is no exception. In case exceptions are sent for face then follow the exception photo specification above.
	* For Finger: ["Left IndexFinger", "Left MiddleFinger", "Left RingFinger", "Left LittleFinger", "Left Thumb", "Right IndexFinger", "Right MiddleFinger", "Right RingFinger", "Right LittleFinger", "Right Thumb"] 
	* For Iris: ["Left", "Right"]
* bio.requestedScore - Upon reaching the requested quality score the biometric device is expected to auto capture the image.
* bio.deviceId - Internal Id to identify the actual biometric device within the device service.
* bio.deviceSubId  - Specific sub id of the device that is responsible to capture the data. The device sub id could be used to enable a specific module in the scanner appropriate for a biometric capture requirement. Device sub id is a simple index which always starts with 1 and increases sequentially for each sub device present. In case of Finger/Iris its 1 for left slap/iris, 2 for right slap/iris and 3 for two thumbs/irises. The device sub id should be set to 0 if we don't know any specific device sub id.
* bio.previousHash - For the first capture the previousHash is hash of empty utf8 string. From the second capture the previous captures hash (as hex encoded) is used as input. This is used to chain all the captures across modalities so all captures have happened for the same transaction and during the same time period.

### Registration Capture Response
```
{
  "biometrics": [
    {
      "specVersion": "MDS Spec version",
      "data": {	
        "digitalId": "Digital id of the device as per the Digital Id definition..",
        "bioType": "Biometric type",
        "deviceCode": "A unique code given by MOSIP after successful registration",
        "deviceServiceVersion": "Device service version",
        "bioSubType": "Left IndexFinger",
        "purpose": "Auth  or Registration",
        "env": "Target environment",
        "bioValue": "base64urlencoded biometrics (ISO format)",
        "transactionId": "Unique transaction id sent in request",
        "timestamp": "2019-02-15T10:01:57.086+05:30",
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
        "deviceServiceVersion": "Device service version",
        "bioSubType": "Left MiddleFinger",
        "purpose": "Auth  or Registration",
        "env":  "Target environment",             
        "bioValue": "base64urlencoded extracted biometric (ISO format)",
        "transactionId": "Unique transaction id sent in request",
        "timestamp": "2019-02-15T10:01:57.086+05:30",
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

### Allowed Values for Registration Capture Response
* data - base64urlencode(header).base64urlencode(payload).base64urlencode(signature)
* data.bioType - "Finger" , "Iris", "Face"
* data.bioSubType - 
	* For Finger: ["Left IndexFinger", "Left MiddleFinger", "Left RingFinger", "Left LittleFinger", "Left Thumb", "Right IndexFinger", "Right MiddleFinger", "Right RingFinger", "Right LittleFinger", "Right Thumb", "UNKNOWN"] 
	* For Iris: ["Left", "Right", "UNKNOWN"]
	* For Face: No bioSubType
* data.timestamp - Time as per the biometric device. Note: The biometric device is expected to sync its time from the management server at regular intervals so accurate time could be maintained on the device.
* error - Relevant errors as defined under the "[error section](#error-codes)" of this document.

### Windows/Linux 
The applications that require more details of the MOSIP devices could get them by sending the HTTP request to the supported port range.

**_HTTP Request:_**
```
RCAPTURE  http://127.0.0.1:<device_service_port>/capture
HOST: 127.0.0.1: <apps port>
EXT: <app name>
```

**_HTTP Response:_**
HTTP response.

### Android
No support for Registration Capture

### IOS
No support for Registration Capture

---

# Device Server
The device server exposes two external device APIs to manage devices. These will be consumed from Management Server created by the device provider. Refer to the subsequent section in this document.

## Registration
The MOSIP server would provide the following device registration API which is white-listed to the management servers of the device provider or their partners.

{% hint style="info" %}
This API is exposed by the MOSIP server to the device providers.
{% endhint %}

**Version:** v1

### Device Registration Request URL
`POST https://{base_url}/v1/masterdata/registereddevices`

### Device Registration Request
```
{
  "id": "io.mosip.deviceregister",
  "request": {
    "deviceData": "JWT of the below device data"
  },
  "requesttime": "Current timestamp in ISO format from management server",
  "version": "Registration server api version as defined above"
}
```

### Decoded Device Data
```
"deviceData": { 
  "deviceId": "Unique Id to identify a biometric capture device",
  "purpose": "Auth or Registration. Can not be empty.",
  "deviceInfo": {
    "deviceSubId": "An array of sub Ids that are available",
    "certification":  "certification level",
    "digitalId": "Signed digital id of the device",
    "firmware": "Firmware version",
    "deviceExpiry": "Device expiry date",
    "timestamp":  "ISO format datetime with timezone from device"
  },
  "foundationalTrustProviderId" : "Foundation trust provider Id, in case of L0 this is empty"
}
```

### Accepted Values for Device Data
* deviceId - Unique device id that the device provider uses to identify the device. (This can also be serial no if the device provider is sure of maintaining the uniqueness across all their devices)
* digitalId - Digital id is signed by the FTM chip key in L1. In case of L0 the digital id is signed by the device key. 

{% hint style="info" %}
During the registration of L0 devices please sign using the key thats generated inside the device and send the public key in x509 encoded spec form. <br>
After successful registration the management server should issue a certificate against the same public key as a response to the registration call.
{% endhint %}

* The entire device data is sent as a JWT format. So the it will look like:
```
"deviceData" : base64urlencode(header).base64urlencode(payload).base64urlencode(signature)
```
* Payload is the object in deviceData.
* The request is signed with the device provider key at the management server.

### Device Registration Response
```
{
  "id": "io.mosip.deviceregister",
  "version": "Registration server API version as defined above",
  "responsetime": "ISO time format",
  "response": "JWT of the below device data",
  "error": [
    { 
      "errorCode": "Error code if registration fails. Remaining keys above are dropped in case of errors.",
   	  "message": "Description of the error code"
    }
  ]
}
```

### Definition of Device Registration Response
```
"response": {
  "status":  "Registration status",
  "digitalId": "Digital id of the device a sent by the request", 
  "deviceCode": "UUID RFC4122 Version 4 for the device issued by the mosip server",
  "timestamp": "Timestamp in ISO format",
  "env": "prod/development/stage"
}
```

The entire response is sent as a JWT format. So the final response will look like:
```
"response" : base64urlencode(header).base64urlencode(payload).base64urlencode(signature)
```

The response should be sent to the device. The device is expected to store the deviceCode within its storage in a safe manner. This device code is used during the capture stage.

{% hint style="info" %}
The device once registered for a specific purpose can not be changed after successful registration. The device can only be used for that specific mosip process.
{% endhint %}

## De-Register
The MOSIP server would provide the following device de-registration API which is whitelisted to the management servers of the device provider or their partners.

**Version:** v1

### Device De-Registration Request URL
`POST https://{base_url}/v1/masterdata/device/deregister`

### Device De-Registration Request
```
{
  "id": "io.mosip.devicederegister",
  "version": "de-registration server api version as defined above",
  "request": { 
    "device": {
      "deviceCode": "<device code>",
      "env": "<environment>"
    }
  }
  "requesttime": "current timestamp in ISO format"
}
```

The entire request is sent as a JWT format. So the final request will look like:
```
"request": {
  "device" : "base64urlencode(header).base64urlencode(payload).base64urlencode(signature)"
}
```

### Device De-Registration Response
```
{
  "id": "io.mosip.devicederegister",
  "version": "de-registration server api version as defined above",
  "responsetime": "iso time format",
  "response": {
    "status": "Success",
    "deviceCode": "<device code>",
    "env": "<environment>",
    "timestamp": "timestamp in ISO format",
    "error": [
	  {
        "errorCode" : "<error code if de-registration fails>",
        "message" : "<human readable description of the error code>"
      }
	
  }       
}
```

The entire response is sent as a JWT format. So the final response will look like:

```
"response" : "base64urlencode(header).base64urlencode(payload).base64urlencode(signature)"
```

---

## Certificates
The MOSIP server would provide the following retrieve encryption certificate API which is white-listed to the management servers of the device provider or their partners.

### Retrieve Encryption Certificate Request URL
`GET https://{base_url}/v1/masterdata/device/encryptioncertficates`

**Version:** v1

### Retrieve Encryption Certificate Request
```
{
  "id": "io.mosip.auth.country.certificate",
  "version": "certificate server api version as defined above",
  "request": {
    "data": {
      "env":  "target environment", 
      "domainUri": "uri of the auth server"
    }
  },
  "requesttime": "current timestamp in ISO format"
}
```

The request is sent as a JWT format. So the final request will look like:
```
"request": {
  "data": "base64urlencode(header).base64urlencode(payload).base64urlencode(signature)"
}
```

### Accepted Values for Retrieve Certificate Request
```
env - Allowed values are Staging| Developer| Pre-Production | Production
domainUri - unique uri per auth providers. This can be used to federate across multiple providers or countries or unions.
```

### Encryption Certificate Response
```
{
  "id": "io.mosip.auth.country.certificate",
  "version": "certificate server api version as defined above",
  "responsetime": "iso time format",
  "response": [
    {
      "certificate": "base64encoded certificate as x509 V3 format"
    }
  ]
}
```

The entire response is sent as a JWT format. So the final response will look like:
```
"response" : "base64urlencode(header).base64urlencode(payload).base64urlencode(signature)"
```

---

# Management Server and Management Client

## Management Server Functionalities and Interactions
The management server has the following objectives.

1. Validate the devices to ensure its a genuine device from the respective device provider. This can be achieved using the device info and the certificates for the Foundational Trust Module.
1. Register the genuine device with the MOSIP device server.
1. Manage/Sync time between the end device the server. The time to be synced should be the only trusted time accepted by the device.
1. Ability to issue commands to the end device for
    1. De-registration of the device (Device Keys)
    1. Collect device information to maintain, manage, support and upgrade a device remotely.
1. A central repository of all the approved devices from the device provider.
1. Safe storage of keys using HSM FIPS 140-2 Level 3. These keys are used to issue the device certificate upon registration.
The Management Server is created and hosted by the device provider outside of MOSIP software. The communication protocols between the MDS and the Management Server can be decided by the respective device provider. Such communication should be restricted to the above specified interactions only. No transactional information should be sent to this server.
1. Should have the ability to push updates from the server to the client devices.

## Management Client
Management client is the interface that connects the device with the respective management server. Its important that the communication between the management server and its clients are designed with scalability, robustness, performance and security. The management server may add many more capabilities than what is described here, But the basic security objectives should be met at all times irrespective of the offerings. 

1. For better and efficient handling of device at large volume, we expect the devices to auto register to the Management server.
1. All communication to the server and from the server should follow that below properties.
	1. All communication are digitally signed with the approved algorithms 
	1. All communication to the server are encrypted using one of the approved public key cryptography.
	1. All request has timestamps attached in ISO format to the milliseconds inside the signature.
	1. All communication back and fourth should have the signed digital id as one of the attribute.
1. Its expected that the auto registration has an absolute way to identify and validate the devices.
1. The management client should be able to detect the devices in a plug and play model.
1. All key rotation should be triggered from the server.
1. Should have the ability to detect if its speaking to the right management server.
1. All upgrades should be verifiable and the client should have ability to verify software upgrades. 
1. Should not allow any downgrade of software.
1. Should not expose any API to capture biometric. The management server should have no ability to trigger a capture request.
1. No logging of biometric data is allowed. (Both in the encrypted and unencrypted format)

---

# Compliance
**L2 Certified Device / L2 Device** - A device certified as capable of performing encryption on the device inside its trusted zone with tamper responsive features. <br>
**L1 Certified Device / L1 Device** - A device certified as capable of performing encryption on the device inside its trusted zone. <br>
**L0 Certified Device / L0 Device** - A device certified as one where the encryption is done on the host inside its device driver or the MOSIP device service.

## Secure Provisioning
Secure provisioning is applicable to both the FTM and the Device providers.

1. The devices and FTM should have a mechanism to protect against fraudulent attempts to create or replicate.
1. The device and FTM trust should be programmed in a secure facility which is certified by the respective MOSIP adopters. 
1. Organization should have mechanism to segregate the FTM's and Devices built for MOSIP using cryptographically valid and repeatable process.
1. All debug options within the FTM or device should be disabled permanently
1. All key creations need for provisioning should happen automatically using FIPS 140-2 Level 3 or higher devices. No individual or a group or organization should have mechanism to influence this behavior.
1. Before the devices/FTM leaving the secure provisioning facility all the necessary trust should be established and should not be re-programmable. 

## Compliance Level
API	| Compatible
----|-----------
Device Discovery | L0/L1/L2
Device Info | L0/L1/L2
Capture | L1/L2
Registration Capture | L0/L1/L2

---

# Cryptography
Supported algorithms:

Usage | Algorithm | Key Size | Storage
------|-----------|----------|---------
Encryption of biometrics - Session Key | AES | >=256 | No storage, Key is created with TRNG/DRBG inside FTM
Encryption session key data outside of FTM | RSA OAEP | >=2048 | FTM trusted memory
Encryption session key data outside of FTM | ECC curve 25519 | >=256 | FTM trusted memory
Biometric Signature | RSA | >=2048 | Key never leaves FTM created and destroyed
Biometric Signature | ECC curve 25519 | >=256 | Key never leaves FTM created and destroyed
Secure Boot | RSA | >=256 | FTM trusted memory
Secure Boot | ECC curve 25519 | >=256 | FTM trusted memory

{% hint style="info" %}
No other ECC curves supported.
{% endhint %}

# Error Codes
Code | Message
-----|--------
0 | Success
100	| Device not registered
101	| Unable to detect a biometric object
102	| Technical error during extraction.
103	| Device tamper detected
104	| Unable to connect to management server
105	| Image orientation error
106	| Device not found
107	| Device public key expired
108	| Domain public key missing
109	| Requested number of biometric (Finger/IRIS) not supported
5xx	| Custom errors. The device provider is free to choose his error code and error messages.
