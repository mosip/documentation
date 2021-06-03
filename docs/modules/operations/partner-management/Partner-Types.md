
# Types of Partners in MOSIP

## Foundational Trust Provider
* The foundational trust providers is one who partners with MOSIP to provide MOSIP complaint foundational trust modules (chips) for authentication devices.
### Manage Chip Make and Model
* Using the partner management portal a foundational trust provider can add, update or view their chip model details. Once the partner registers the model details a request is sent to the partner admin for approval of the model. As part of registration of the chip model, the partner needs to upload an associated certificate which would be used to generate keys for the particular type of chip.
The chip key will be used to sign the digital id in the authentication request. So, when the auth request reaches MOSIP, MOSIP would verify the certificate using which the digital id is signed.

## Authentication Partner
* The authentication partner is one who partners with MOSIP to provide authentication services to individuals.
### Upload & Download of Signature & Encryption Certificates
* An authentication partner need to upload an encryption & a signatire certificates using the partner management poratl. The signature certificate will be used in MOSIP to verify the signature when any request is received from the partner; where as, the encryption certificate would be used when any PII data is sent to the partner during e-KYC.

### Manage API Keys
* The authentication partner can view associated API keys and request for an API key for against a policy which is available for his/her policy group. Once a requeste is initiated a request is generated but a request is also sent for approval to the partner admin. The partner admin needs to approve the request before it can be used in MOSIP. This API key is one of the manadatory attributes in the authentication request using which MOSIP verifies the partner and policy mapping.

## Credential Partners
### Upload & Download of Signature & Encryption Certificates
* An credential partner need to upload an encryption & a signatire certificates using the partner management poratl. The signature certificate will be used in MOSIP to verify the signature when any request is received from the partner; where as, the encryption certificate would be used when any PII data is sent to the partner based on policy to issue a credential.

### Manage API Keys
* The authentication partner can view associated API keys and request for an API key for against a policy which is available for his/her policy group. Once a requeste is initiated a request is generated but a request is also sent for approval to the partner admin. The partner admin needs to approve the request before it can be used in MOSIP. This API key is one of the manadatory attributes in the authentication request using which MOSIP verifies the partner and policy mapping.

## MISP (MOSIP Infrastructure Provider)
### View Transaction Logs(License Key Management)
* A MISP would be providing services to multiple authentication partners. The audit trails on which partner & when used MISP's licence key to perform authentication would be avaialable for the MISP to monitor.

## To Do
## API Details
 * [API Documentation](PMS-API-Documentation.md)

* Configuration Parameters
    * List of parameters and how they alter the behaviour of the API

## Links to related content
* Links to design documentation
* Links to How To articles
