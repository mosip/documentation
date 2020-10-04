# Common Functionality

## Self Registration
Partners in MOSIP are created in a self-service mode. The partner visit the MOSIP partner management portal and requests for collaborating with MOSIP by providing basic details such as organization name & email id, purpose of registration (how they want to collaborate with MOSIP - as a device provider, authentication partner, print partner, etc), basic credentials and performing an OTP based verification.

Once these details are filled by the partner and a request is sent to MOSIP, the Partner Admin verifies the details of the partners and allows the partner to integrate with MOSIP.

## User Management
Once the partner is registered in MOSIP and is able to login to the partner management portal, MOSIP provides basic features such as,

1. Adding more contact information
2. Viewing user details
3. Managing credentials

# Device Provider
The device providers is one who partners with MOSIP to provide MOSIP complaint devices for authentication and registration.

## Upload & Download of Device Certificate

A device provider needs to upload his/her certificate using which he/she would be generating their device keys. These certificates are verified by MOSIP. Once the verification is done the root for these certificates are changed to MOSIP and can be downloaded back by the partner.

A device provider needs to upload a single certificate for all his/her devices.

This certificate needs to be upto date in MOSIP system before anyone performs any authentication using the device. During authentication, MOSIP would verify the device certificate using which the device info in authentication request is signed.

## Manage Device Make and Model

Using the partner management portal a device provider can add, update or view their device model details. Once the device provider registers the model details a request is sent to the partner admin for approval of the model.

During device registration MOSIP verifies the make and model detials. If a model details for a device is not available or approved by the partner admin, then registration for that device would fail.

## Manage Secure Biometric Interface

Using the partner management portal a device provider can add, update or view their device model details. Once the device provider registers the SBI details a request is sent to the partner admin for approval of the SBI.

# Foundational Trust Provider
The foundational trust providers is one who partners with MOSIP to provide MOSIP complaint foundational trust modules (chips) for authentication devices.

## Manage Chip Make and Model

Using the partner management portal a foundational trust provider can add, update or view their chip model details. Once the partner registers the model details a request is sent to the partner admin for approval of the model. As part of registration of the chip model, the partner needs to upload an associated certificate which would be used to generate keys for the particular type of chip.

The chip key will be used to sign the digital id in the authentication request. So, when the auth request reaches MOSIP, MOSIP would verify the certificate using which the digital id is signed.

# Authentication Partner
The authentication partner is one who partners with MOSIP to provide authentication services to individuals.

## Upload & Download of Signature & Encryption Certificates

An authentication partner need to upload an encryption & a signatire certificates using the partner management poratl. The signature certificate will be used in MOSIP to verify the signature when any request is received from the partner; where as, the encryption certificate would be used when any PII data is sent to the partner during e-KYC.

## Manage API Keys

The authentication partner can view associated API keys and request for an API key for against a policy which is available for his/her policy group. Once a requeste is initiated a request is generated but a request is also sent for approval to the partner admin. The partner admin needs to approve the request before it can be used in MOSIP. This API key is one of the manadatory attributes in the authentication request using which MOSIP verifies the partner and policy mapping.

# Credential Partners

## Upload & Download of Signature & Encryption Certificates

An credential partner need to upload an encryption & a signatire certificates using the partner management poratl. The signature certificate will be used in MOSIP to verify the signature when any request is received from the partner; where as, the encryption certificate would be used when any PII data is sent to the partner based on policy to issue a credential.

## Manage API Keys

The authentication partner can view associated API keys and request for an API key for against a policy which is available for his/her policy group. Once a requeste is initiated a request is generated but a request is also sent for approval to the partner admin. The partner admin needs to approve the request before it can be used in MOSIP. This API key is one of the manadatory attributes in the authentication request using which MOSIP verifies the partner and policy mapping.

# MISP (MOSIP Infrastructure Provider)

## View Transaction Logs

A MISP would be providing services to multiple authentication partners. The audit trails on which partner & when used MISP's licence key to perform authentication would be avaialable for the MISP to monitor.

# Partner Admin

## Approvals

The partner admin receives approval requests for various scenarios. The list of scenarios are mentioned below:

1. When a partner registers in MOSIP.
2. When a device model is registered by a device provider.
3. When a secure biometric interface is registered by a device provider.
4. When a chip model is registered by a foundational trust provider.
5. When an authentication partner requests for an API key.
6. When a credential partner requests for an API key.

## Activation or Deactivation

The partner can choose to activate or deactivate various entities in the partner management portal.

1. Activation or deactivation of partner.
2. Activation or deactivation of device model.
3. Activation or deactivation of chip model.
4. Activation or deactivation of SBI.
5. Activition or deactivation of API Keys.

## Hotlisting of Devices

The partner admin can choose to hotlist a device by marking a device as hotlisted.

## Create or Update Partners

The partner admin can create a new partner or update details of a partner in the Partner Management portal.

## Associate & Re-Issue API Keys

The partner admin can associate new API keys to an authentication or crential partner and re-issue their API keys.

# Policy Admin

## Create Policy Group

In order to create a policy we must have a policy group first. The policy admin needs to first create a policy group using the partner management portal.

## Create and Publish Policies

Once the policy group is created the policy admin can create policies and associate these policies to various policy groups. After these policies are created, they would be in draft state. These policies need to be published by the policy admin. Once published these policies can be used by the partners.

## Activate or Deactivate a Policy

The policy can be activated or de-activated anytime by the policy admin.

## Update a Policy

A policy can be updated multiple times when it is in draft state. Only the validity date can be updated once the policy is published.

