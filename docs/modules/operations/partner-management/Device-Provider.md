
# Device Provider

## Upload & Download of Device Certificate
* A device provider needs to upload his/her certificate using which he/she would be generating their device keys. These certificates are verified by MOSIP. Once the verification is done the root for these certificates are changed to MOSIP and can be downloaded back by the partner.
A device provider needs to upload a single certificate for all his/her devices.
This certificate needs to be upto date in MOSIP system before anyone performs any authentication using the device. During authentication, MOSIP would verify the device certificate using which the device info in authentication request is signed.

## Manage Device Make and Model
* Using the partner management portal a device provider can add, update or view their device model details. Once the device provider registers the model details a request is sent to the partner admin for approval of the model.
During device registration MOSIP verifies the make and model detials. If a model details for a device is not available or approved by the partner admin, then registration for that device would fail.

## Manage Secure Biometric Interface
* Using the partner management portal a device provider can add, update or view their device model details. Once the device provider registers the SBI details a request is sent to the partner admin for approval of the SBI.


## To Do
## API Details
 * [API Documentation](PMS-API-Documentation.md)

* Configuration Parameters
    * List of parameters and how they alter the behaviour of the API

## Links to related content
* Links to design documentation
* Links to How To articles


