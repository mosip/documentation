The biometric devices that will be connected to MOSIP's registration machines to perform registrations need to be white-listed by the MOSIP administrator and registered by the device provider's management server. 

# White-listing of Devices
White-listing is an activity performed by the MOSIP administrator. As part of this activity, device details are stored in the MOSIP's master data and are mapped to various centers in the MOSIP ecosystem. To white-list a device the following steps are followed:

1. The device type should be available
2. The device specification should be available
3. The device should be created and mapped to a registration center

## Adding Device Types
The device type is a master data which specifies the type of device. Ideally in case of biometrics devices, there would be only three types of devices, i.e. iris scanner, fingerprint slap scanner and a camera. This is an one-time activity that can be performed by the administrator for different types of devices.

The administrator should make sure that, the device type is available for a device, before creating any device specification. If the device type is not available then the administrator can create one.

{% hint style="info" %}

The device type can be created in MOSIP by three ways:

1. By using the device type API.
2. By using the device type screen in MOSIP administrator portal (Login > Master Data > Device Types).
3. By using the bulk upload screen in MOSIP administrator portal (Login > Bulk Upload > Master Data Upload).

{% endhint %}

## Adding Device Specification
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

## Adding Device
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

# Registering Devices in MOSIP
All the devices using which biometrics would be captured in MOSIP, need to be registered in MOSIP via. the management server before use. Before the management server makes a call to MOSIP for device registration various pre-requisites need to be performed,

* Policy group for device providers should be available
* Device provider should self-register in MOSIP as Partner using the Partner Management Portal
* Request for registration should be approved by the Partner administrator
* Device provider must upload a CA signed certificate
* Device provider must register the device make & model for which device registration request will reach MOSIP
* Request for device make & model should be approved by the Partner administrator
* Device provider must register the device's secure biometric interface
* Request for device's secure biometric interface should be approved by the Partner administrator

After the above mentioned steps, the device registration request can come from the device management server when the device is connected with the SBI.

## Adding a Policy Group
A single policy group should be created for all the device vendors so that they can register into the MOSIP's partner management portal. Creation of policy group is an administrative activity which would be performed by the Policy administrator.

{% hint style="info" %}

The policy group can be created using the policy group API.

{% endhint %}

## Registering Device Provider
The device provider needs to self register into the MOSIP system. During self registration we collect basic information from the partner, such as,
* Partner ID
* Organization Name
* Contact Number
* Postal Address
* Email Address
* Partner Type (for device providers its, Device_Provider which comes from the Master Data)
* Policy Group ID (from the policy group created earlier)

{% hint style="info" %}

The device provider can be registered in MOSIP using the partner self-registration API.

{% endhint %}

## Approving Device Provider Registration
The device provider needs to be approved by the MOSIP's Partner administrator. 

{% hint style="info" %}

The device provider details can be approved by the partner administrator using the partner approval API.

{% endhint %}

## Registering Device's Make and Model
Once the device provider is approved, he/she needs to register his/her device's make and model information in the partner management portal. The make and model is basic device meta information that will be collected as part of device registration request. Here are the details that are captured as part of registering the device's make and model,
* Device provider's organization name and ID
* Brand Name or Make
* Model
* Device Type and Sub-Type (this is master data available in MOSIP for various types of devices)

{% hint style="info" %}

The device provider can register the make and model details using the device make and model API.

{% endhint %}

## Approving Device's Make and Model Registration
The device's make and model details needs to be approved by the MOSIP's Partner administrator. 

{% hint style="info" %}

The device's make and model details can be approved by the partner administrator using the device make and model approval API.

{% endhint %}

## Registering Device's Secure Biometric Interface (SBI)
Once the device's make and models are approved, the device provider needs to register his/her device's secure biometric interface in the partner management portal. The secure biometric interface is the software which would be interfacing with the devices and the registration client application. The below details would be collected when the device provider tries to register a SBI,
* Device details (from the device's make and model)
* Software creation time
* Software binary hash
* Software expiry time
* Software version

{% hint style="info" %}

The device provider can register the Secure biometric in details using the device make and model API.

{% endhint %}

## Approving Device's Secure Biometric Interface Registration
The device's Secure Biometric Interface details needs to be approved by the MOSIP's Partner administrator. 

{% hint style="info" %}

The device's secure biometric interface details can be approved by the partner administrator using the device's make and model approval API.

{% endhint %}

## Registering the Device
The devices would be registered in MOSIP by the Device Provider's Management server. The management server can send a device registration request using the device registration API provided by MOSIP. Details about the API is available [here](MOSIP-Device-Service-Specification.md#registration).