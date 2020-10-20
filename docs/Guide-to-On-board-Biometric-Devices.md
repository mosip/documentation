The biometric devices that will be connected to MOSIP's registration machines to perform registrations need to be white-listed by the MOSIP administrator and registered by the device provider's management server. 

# White-listing of Devices
White-listing is an activity performed by the MOSIP administrator. As part of this activity, device details are stored in the MOSIP's master data and are mapped to various centers in the MOSIP ecosystem. To white-list a device the following steps are followed:

1. The device type should be available
2. The device specification should be available
3. The device should created and mapped to the center where it would be used

## Adding Device Types
The device type is the type of device that we one to create. Ideally in case of biometrics devices, we would be using only three types of devices, i.e. iris scanner, finger print slap scanner and a camera. This is an one type activity for the administrator.

Make sure the device type is available for a device, before we create any device specification. If the device type is not available then create one.

{% hint style="info" %}

The device type can be created in MOSIP by three ways:

1. By using the device type API.
2. By using the device type screen in MOSIP administrator portal (Login > Master Data > Device Types).
3. By using the bulk upload screen in MOSIP administrator portal (Login > Bulk Upload > Master Data Upload).

{% endhint %}

## Adding Device Specification
The device specification is the meta information about the device that we want to use for registration. This contains basic details about the device like:
* Unique name of the device specification
* Brand name or make of the device
* Model of the device
* Device Type (from the device type created earlier)
* Driver version for the device (optional)

Make sure the specification is available for white-listing the device. If the device specification is not available then create one.

{% hint style="info" %}

The device specification can be created in MOSIP by three ways:

1. By using the device specification API.
2. By using the device type screen in MOSIP administrator portal (Login > Master Data > Device Specs).
3. By using the bulk upload screen in MOSIP administrator portal (Login > Bulk Upload > Master Data Upload).

{% endhint %}

## Adding Device
This is the step to white-list a device. Here, we need to capture the basic details about the device like,
* Serial Number of the device
* IP of the device (optional)
* MAC Address of the device (optional)
* Validity of the device
* Administrative zone of the device
* Center to which the device will be mapped to

{% hint style="info" %}

The device can be created in MOSIP by three ways:

1. By using the device API.
2. By using the device screen in MOSIP administrator portal (Login > Devices).
3. By using the bulk upload screen in MOSIP administrator portal (Login > Bulk Upload > Master Data Upload).

{% endhint %}

# Registering Devices in MOSIP
All the devices using which biometrics would be captured for registration or authentication need to be registered via. the management server before use. Before the management server makes a call to MOSIP for device registration various pre-requisites need to be performed,
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
A policy group needs to be created for all the device vendors so that they can register into the MOSIP's partner management portal. Creation of policy group is an administrative activity which would be performed by the Policy administrator.

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