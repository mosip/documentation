# Guide to On-board Biometric Devices

The biometric devices that will be connected to MOSIP's registration machines to perform registrations need to be white-listed by the MOSIP administrator and registered by the device provider's management server.

## White-listing of Devices

White-listing is an activity performed by the MOSIP administrator. As part of this activity, device details are stored in the MOSIP's master data and are mapped to various centers in the MOSIP ecosystem. To white-list a device the following steps are followed:

1. The device type should be available
2. The device specification should be available
3. The device should be created and mapped to a registration center

### Adding Device Types

The device type is a master data which specifies the type of device. Ideally in case of biometrics devices, there would be only three types of devices, i.e. iris scanner, fingerprint slap scanner and a camera. This is an one-time activity that can be performed by the administrator for different types of devices.

The administrator should make sure that, the device type is available for a device, before creating any device specification. If the device type is not available then the administrator can create one.

{% hint style="info" %}
The device type can be created in MOSIP by three ways:

1. By using the device type API.
2. By using the device type screen in MOSIP administrator portal (Login > Master Data > Device Types).
3. By using the bulk upload screen in MOSIP administrator portal (Login > Bulk Upload > Master Data Upload).
{% endhint %}

#### API to Create a Device Type

\*\* API Request Body \*\*

```
POST https://{base_url}/v1/masterdata/devicetypes

{
  "id": "string",
  "metadata": {},
  "request": {
    "code": "Unique Code for Device Type",
    "description": "Description of the Device Type",
    "isActive": true,
    "langCode": "eng",
    "name": "Name of the Device Type"
  },
  "requesttime": "2018-12-10T06:12:52.994Z",
  "version": "string"
}
```

**API Response Body**

```
{
  "errors": null,
  "id": "string",
  "metadata": {},
  "response": {
    "code": "Unique Code for Device Type",
    "langCode": "eng"
  },
  "responsetime": "2018-12-10T06:12:52.994Z",
  "version": "string"
}
```

**Note**:

1. If you have MOSIP set-up with two language then you need to create this record twice with two different language codes.
2. The role for authentication of the API should be Global\_Admin.
3. This needs to be created only if the device type is not available.

### Adding Device Specification

The device specification is meta information about the device that the administrator want to use for registration. This contains basic details about the device like:

* Unique name of the device specification
* Brand name or make of the device
* Model of the device
* Device Type (from the device type created earlier)
* Driver version for the device (optional)

The administrator should make sure that, the specification is available for white-listing a device. If the device specification is not available then the administrator can create one.

{% hint style="info" %}
The device specification can be created in MOSIP by three ways:

1. By using the device specification API.
2. By using the device type screen in MOSIP administrator portal (Login > Master Data > Device Specs).
3. By using the bulk upload screen in MOSIP administrator portal (Login > Bulk Upload > Master Data Upload).
{% endhint %}

#### API to Create a Device Specification

\*\* API Request Body \*\*

```
POST https://{base_url}/v1/masterdata/devicespecifications

{
  "id": "string",
  "metadata": {},
  "request": {
    "brand": "Brand or Model Name",
    "description": "Description of Device Specification",
    "deviceTypeCode": "Device Type Code from Device Type",
    "id": "Unique ID for Device Specification",
    "isActive": true,
    "langCode": "eng",
    "minDriverversion": "Driver Version of the Device",
    "model": "Model of the Device",
    "name": "Name of the Specification"
  },
  "requesttime": "2018-12-10T06:12:52.994Z",
  "version": "string"
}
```

**API Response Body**

```
{
  "errors": null,
  "id": "string",
  "metadata": {},
  "response": {
    "id": "Unique ID for Device Specification",
    "langCode": "eng"
  },
  "responsetime": "2018-12-10T06:12:52.994Z",
  "version": "string"
}
```

**Note**:

1. If you have MOSIP set-up with two language then you need to create this record twice with two different language codes.
2. The role for authentication of the API should be Global\_Admin.
3. This needs to be created only if the device specification is not available.

### Adding Device

After the device specification is available the administrator can white-list a device. Here, the administrator needs to capture the basic details about the device like,

* Serial number of the device
* IP Address of the device (optional)
* MAC Address of the device (optional)
* Validity of the device
* Administrative zone of the device
* Registration Center where the device will be used

{% hint style="info" %}
The device can be created in MOSIP by three ways:

1. By using the device API.
2. By using the device screen in MOSIP administrator portal (Login > Devices).
3. By using the bulk upload screen in MOSIP administrator portal (Login > Bulk Upload > Master Data Upload).
{% endhint %}

#### API to Create a Device

\*\* API Request Body \*\*

```
POST https://{base_url}/v1/masterdata/devices

{
  "id": "string",
  "metadata": {},
  "request": {
    "deviceSpecId": "Specification ID from Device Specification",
    "id": "Unique ID for Device",
    "ipAddress": "IP Address of Device",
    "isActive": true,
    "langCode": "eng",
    "macAddress": "MAC Address of Device",
    "name": "Name of the Device",
    "regCenterId": "Mapped Center for the Device",
    "serialNum": "Serial Number of Device",
    "validityDateTime": "Validity Time for Device in format - yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
    "zoneCode": "Zone code for the device"
  },
  "requesttime": "2018-12-10T06:12:52.994Z",
  "version": "string"
}
```

**API Response Body**

```
{
  "errors": null,
  "id": "string",
  "metadata": {},
  "response": {
    "createdBy": "created by in DB",
    "deviceSpecId": "Device Specification ID",
    "id": "Unique ID for the device",
    "ipAddress": "IP Address of the Device",
    "isActive": true,
    "isDeleted": true,
    "langCode": "eng",
    "macAddress": "MAC Address of the Device",
    "name": "Name of the Device",
    "regCenterId": "Mapped Center ID",
    "serialNum": "Serial Number of the Device",
    "updatedBy": "updated by in DB",
    "validityDateTime": "Validity Time for Device in format - yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
    "zoneCode": "Mapped Zone Code"
  },
  "responsetime": "2018-12-10T06:12:52.994Z",
  "version": "string"
}
```

**Note**:

1. If you have MOSIP set-up with two language then you need to create this record twice with two different language codes.
2. The role for authentication of the API should be Global\_Admin.
3. Make sure the center and device are mapped to same administrative zone.

## Registering Devices in MOSIP

All the devices using which biometrics would be captured in MOSIP, need to be registered in MOSIP via. the management server before use. Before the management server makes a call to MOSIP for device registration various pre-requisites need to be performed,

* Policy group for device providers should be available
* Device provider should self-register in MOSIP as Partner using the Partner Management Portal
* Device provider must register the device make & model for which device registration request will reach MOSIP
* Request for device make & model should be approved by the Partner administrator
* Device provider must register the device's secure biometric interface
* Request for device's secure biometric interface should be approved by the Partner administrator

After the above mentioned steps, the device registration request can come from the device management server when the device is connected with the SBI.

### Adding a Policy Group

A single policy group should be created for all the device vendors so that they can register into the MOSIP's partner management portal. Creation of policy group is an administrative activity which would be performed by the Policy administrator.

{% hint style="info" %}
The policy group can be created using the policy group API.
{% endhint %}

#### API to Create a Policy Group

\*\* API Request Body \*\*

```
POST https://{base_url}/partnermanagement/v1/policies/policies/policyGroup

{
  "id": "string",
  "metadata": {},
  "request": {
    "desc": "description of policy group",
    "name": "policy group name"
  },
  "requesttime": "2018-12-10T06:12:52.994Z",
  "version": "string"
}
```

**API Response Body**

```
{
  "errors": null,
  "id": "string",
  "response": {
    "cr_by": "created by",
    "cr_dtimes": "2020-10-23T07:30:27.674Z",
    "desc": "description from request",
    "id": "unique ID",
    "is_Active": true,
    "name": "Policy Group Name from request",
    "up_by": "updated by",
    "upd_dtimes": "2020-10-23T07:30:27.674Z"
  },
  "responsetime": "2020-10-23T07:30:27.674Z",
  "version": "string"
}
```

**Note**:

1. The role for authentication of the API should be POLICYMANAGER.
2. This needs to be created if the policy is not available for device providers.

### Registering Device Provider

The device provider needs to self register into the MOSIP system. During self registration we collect basic information from the partner, such as,

* Partner ID
* Organization Name
* Contact Number
* Postal Address
* Email Address
* Partner Type (for device providers its, Device\_Provider which comes from the Master Data)
* Policy Group ID (from the policy group created earlier)

{% hint style="info" %}
The device provider can be registered in MOSIP using the partner self-registration API.
{% endhint %}

#### API to Create a Device Provider

\*\* API Request Body \*\*

```
POST https://{base_url}/partnermanagement/v1/partners/partners

{
  "id": "string",
  "metadata": {},
  "request": {
    "address": "Address of device provider",
    "contactNumber": "Contact Number of Device Provider",
    "emailId": "Email ID of Device Provider",
    "organizationName": "Organization Name of Device Provider",
    "partnerId": "Partner ID of the Device Provider",
    "partnerType": "Partner Type comes from Master Data for Device Providers - Device_Provider",
    "policyGroup": "Policy Group Name"
  },
  "requesttime": "2020-10-23T07:30:27.674Z",
  "version": "string"
}
```

**API Response Body**

```
{
  "errors": null,
  "id": "string",
  "metadata": {},
  "response": {
    "partnerId": "Partner ID set in Request",
    "status": "Active"
  },
  "responsetime": "2020-10-23T07:30:27.674Z",
  "version": "string"
}
```

**Note**:

1. The role for authentication of the API should be PARTNER.
2. This needs to be created if the partner is not available.

### Registering Device's Make and Model

Once the device provider is approved, he/she needs to register his/her device's make and model information in the partner management portal. The make and model is basic device meta information that will be collected as part of device registration request. Here are the details that are captured as part of registering the device's make and model,

* Device provider's organization name and ID
* Brand Name or Make
* Model
* Device Type and Sub-Type (this is master data available in MOSIP for various types of devices)

{% hint style="info" %}
The device provider can register the make and model details using the device make and model API.
{% endhint %}

#### API to Create a Device Make & Model

\*\* API Request Body \*\*

```
POST https://{base_url}/partnermanagement/v1/partners/devicedetail

{
  "id": "string",
  "metadata": {},
  "request": {
    "deviceProviderId": "Partner ID for the Device Provider",
    "deviceSubTypeCode": "Device Sub-Type Code comes from Device Type & Sub Type master Data",
    "deviceTypeCode": "Device Sub-Type Code comes from Device Type & Sub Type master Data",
    "id": "ID for the Device Details",
    "isItForRegistrationDevice": true,
    "make": "Make or Brand of the Device",
    "model": "Model of the Device",
    "partnerOrganizationName": "Organization Name of the Device Provider"
  },
  "requesttime": "2020-10-23T07:30:27.674Z",
  "version": "string"
}
```

**API Response Body**

```
{
  "errors": null,
  "id": "string",
  "metadata": {},
  "response": {
    "id": "ID for the Device Details"
  },
  "responsetime": "2020-10-23T07:30:27.674Z",
  "version": "string"
}
```

**Note**:

1. The role for authentication of the API should be DEVICE\_PROVIDER.
2. This needs to be created if the device make and model is not listed earlier.

### Approving Device's Make and Model Registration

The device's make and model details needs to be approved by the MOSIP's Partner administrator.

{% hint style="info" %}
The device's make and model details can be approved by the partner administrator using the device make and model approval API.
{% endhint %}

#### API to Approve a Device Make & Model

\*\* API Request Body \*\*

```
PATCH https://{base_url}/partnermanagement/v1/partners/devicedetail

{
  "id": "string",
  "metadata": {},
  "request": {
    "approvalStatus": "Activate",
    "id": "ID of the Device Details",
    "isItForRegistrationDevice": true
  },
  "requesttime": "2020-10-23T07:30:27.674Z",
  "version": "string"
}
```

**API Response Body**

```
{
  "errors": null,
  "id": "ID of the Device Details",
  "metadata": {},
  "response": "string",
  "responsetime": "2020-10-23T07:30:27.674Z",
  "version": "string"
}
```

**Note**:

1. The role for authentication of the API should be PARTNER\_ADMIN.
2. This needs to be done if the device make and model is pending approval.

### Registering Device's Secure Biometric Interface (SBI)

Once the device's make and models are approved, the device provider needs to register his/her device's secure biometric interface in the partner management portal. The secure biometric interface is the software which would be interfacing with the devices and the registration client application. The below details would be collected when the device provider tries to register a SBI,

* Device details (from the device's make and model)
* Software creation time
* Software binary hash
* Software expiry time
* Software version

{% hint style="info" %}
The device provider can register the Secure biometric in details using the device make and model API.
{% endhint %}

#### API to Approve a Device Make & Model

\*\* API Request Body \*\*

```
POST https://{base_url}/partnermanagement/v1/partners/securebiometricinterface

{
  "id": "string",
  "metadata": {},
  "request": {
    "deviceDetailId": "Device Details ID",
    "isItForRegistrationDevice": true,
    "swBinaryHash": "Hash of the SBI",
    "swCreateDateTime": "Creation date & time in the format - yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
    "swExpiryDateTime": "Expiry date & time in the format - yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
    "swVersion": "Software version number"
  },
  "requesttime": "2020-10-23T07:30:27.674Z",
  "version": "string"
}
```

**API Response Body**

```
{
  "errors": null,
  "id": "string",
  "metadata": {},
  "response": {
    "id": "Unique ID for the SBI"
  },
  "responsetime": "2020-10-23T07:30:27.674Z",
  "version": "string"
}
```

**Note**:

1. The role for authentication of the API should be DEVICE\_PROVIDER.
2. This needs to be created if the device SBI is not registered.

### Approving Device's Secure Biometric Interface Registration

The device's Secure Biometric Interface details needs to be approved by the MOSIP's Partner administrator.

{% hint style="info" %}
The device's secure biometric interface details can be approved by the partner administrator using the device's make and model approval API.
{% endhint %}

#### API to Approve a Device Make & Model

\*\* API Request Body \*\*

```
PATCH https://{base_url}/partnermanagement/v1/partners/securebiometricinterface

{
  "id": "string",
  "metadata": {},
  "request": {
    "approvalStatus": "Activate",
    "id": "ID of the SBI",
    "isItForRegistrationDevice": true
  },
  "requesttime": "2020-10-23T07:30:27.674Z",
  "version": "string"
}
```

**API Response Body**

```
{
  "errors": null,
  "id": "ID of the SBI",
  "metadata": {},
  "response": "string",
  "responsetime": "2020-10-23T07:30:27.674Z",
  "version": "string"
}
```

**Note**:

1. The role for authentication of the API should be PARTNER\_ADMIN.
2. This needs to be done if the device SBI is pending approval.

### Registering the Device

The devices would be registered in MOSIP by the Device Provider's Management server. The management server can send a device registration request using the device registration API provided by MOSIP. Details about the API is available [here](MOSIP-Device-Service-Specification.md#registration).

#### API to Register Devices in MOSIP

\*\* API Request Body \*\*

```
POST https://{base_url}/partnermanagement/v1/partners/registereddevices

{
  "id": "string",
  "metadata": {},
  "request": {
    "deviceData": { //The Device Data block is a JWT Toke signed using the Device Provider's Key
      "deviceId": "Unique ID coming from device",
      "purpose": "REGISTRATION",
      "deviceInfo": {  //The Device Info block is a JWT Token signed using Device Key
	  "deviceSubId": "Sub-ID of Device",
	  "certification": "Certification level of Device - L0",
	  "digitalId": { //The Digital ID block is a JWT Token signed using Device Key
	    "serialNo": "Serial Number in the Device",
	    "deviceProvider": "Device Provider Name",
	    "deviceProviderId": "Device Provider ID",
	    "make": "Brand or Make Name",
	    "model": "Model",
	    "dateTime": "2020-10-09T08:48:31.158Z", // Digital ID creation time (should be with in 5 mins when request is sent)
	    "type": "Device Type",
	    "deviceSubType": "Device Sub Type"
          },
	  "deviceExpiry": "2021-12-16T09:06:38.161Z",
	  "timestamp": "2020-10-09T08:48:31.158Z"
      },
      "foundationalTrustProviderId": ""
    }
  }
  "requesttime": "2020-10-09T08:48:31.158Z",
  "version": "string"
}
```

**API Response Body**

```
{
  "errors": null,
  "id": "string",
  "metadata": {},
  "response": { //The Response block is a JWT Token signed by MOSIP
    "status": "Registered",
    "digitalId":{ //The Digital ID block is a JWT Token signed using Device Key
	  "serialNo": "Serial Number in the Device",
	  "deviceProvider": "Device Provider Name",
	  "deviceProviderId": "Device Provider ID",
	  "make": "Brand or Make Name",
	  "model": "Model",
	  "dateTime": "2020-10-09T08:48:31.158Z",
	  "type": "Device Type",
	  "deviceSubType": "Device Sub Type"
    },
    "deviceCode": "unique device code for the device",
    "env": "Developer",
    "timestamp": "2020-10-06T07:01:30.374Z"
  },
  "responsetime": "2020-10-09T08:48:31.158Z",
  "version": "string"
}
```

**Note**:

1. This needs to be done if the device is not registered.
2. The Device Type & Device Sub Type Codes:
   1. Sub Types for Device Type "Finger" are "Slap", "Single" or "Touchless"
   2. Sub Types for Device Type "Iris" are "Single" or "Double"
   3. Sub Types for Device Type "Face" are "Full face"
3. Device Sub IDs for Finger/Iris is
   1. 1 - for left slap/iris
   2. 2 - for right slap/iris
   3. 3 - for two thumbs/irises
   4. 0 - if we don't know any specific device sub id
