# Credential Requestor Stage

## Rename - “Print Stage” to “Credential Requestor Stage”

**Note**: The change in nomenclature from 'Print Stage' to 'Credential Requestor Stage' was implemented to enhance clarity and better reflect its expanded functionality.

## History of Print Stage in MOSIP

In MOSIP 0.9.0, the "print stage" was primarily designed to facilitate the submission of printing requests. The core functionality of print stage revolved around initiating a request for the physical printing of credentials. However, as the system evolved and incorporated additional features, the scope of the print stage expanded beyond its original purpose.

In the evolved approach, at the print stage, apart from processing a print request, the application enables partner-specific print capabilities. Contrary to its initial purpose, the print stage no longer serves the singular function of printing credentials. Instead, it has transformed into a multifaceted component with enhanced set of responsibilities.

In the current system, the print stage's role extends beyond traditional printing activities. Its primary function now revolves around initiating a request for credential generation once a Unique Identification Number (UIN) is generated. This request is not aimed at physical printing but serves as a mechanism to gather additional information for specific partners. These partners may require supplementary data beyond what is initially generated with the UIN.

Therefore, in the evolved approach, the print stage has transitioned from being a straightforward printing request to a more versatile component that manages the initiation of credential requests tailored to partner-specific information needs. This adaptation reflects the system's responsiveness to changing requirements and the dynamic nature of credentialing processes. This reason led us to re-name the “Print Stage” to the “Credential Requestor Stage” as this name serves the purpose of the work executed by this stage.

## Introduction

The Credential Requestor Stage in MOSIP, formerly known as the Print Stage, is a crucial component used to request credentials for configurable partners after the UIN is generated. This stage enables countries to share information with multiple partners, each with specific needs after UIN generation. Partners, such as Print Partners and Digital Card Partners, may require demographic or biometric information to perform operations.

## What is the credential requestor stage?

The Credential Requestor Stage plays a crucial role in the MOSIP system, serving as a mechanism to solicit credentials from configurable partners post-UIN generation. In this context, partners, previously registered with MOSIP, require demographic and biometric data to execute their respective operations. For instance, a Print Partner necessitates specific demographic details for the purpose of printing cards. Similarly, digital card partners seek demographic information to generate digital cards. Additionally, DPGs might seek confirmation of successful UIN generation to integrate this information into their systems. The Credential Requestor Stage facilitates various use cases where the country aims to share pertinent information with multiple partners subsequent to UIN generation.

## What are the latest changes done in the credential requestor stage?

### Partner Profile Configuration

MOSIP has introduced a new partner profile for the Credential Requestor Stage. The partner profiles are maintained [here](https://github.com/mosip/mosip-config/blob/develop/registration-processor-credential-partners.json). 

**Sample Partner Profile**:

```
jsonCopy code{
  "partners": [
    {
      "id": "digitalcardPartner",
      "partnerId": "mpartner-default-digitalcard",
      "credentialType": "PDFCard",
      "template": "RPR_UIN_CARD_TEMPLATE",
      "appIdBasedCredentialIdSuffix": ".pdf",
      "process": null,
      "metaInfoFields": null
    },
    {
      "id": "printPartner",
      "partnerId": "mpartner-default-print",
      "credentialType": "euin",
      "template": "RPR_UIN_CARD_TEMPLATE",
      "appIdBasedCredentialIdSuffix": null,
      "process": null,
      "metaInfoFields": null
    },
    {
      "id": "opencrvsPartner",
	  "partnerId": "opencrvs-partner",
      "type": "opencrvs",
      "template": "RPR_UIN_CARD_TEMPLATE",
      "process": ["OPENCRVS_NEW"],
      "metaInfoFields": ["opencrvsBRN"]
    }
  ]
}
```

**Field Description**

* ``id``: Logical unique identifier
* ``partnerId``: Partner identifier configured in MOSIP
* ``credentialType``: Type of credential configured in MOSIP
* ``template``: Template used for generating the credential
* ``appIdBasedCredentialIdSuffix``: Applicable for special conditions where the credential ID is the application ID itself, 
    with an optional suffix (for example, ``.pdf``). Currently, this is applicable for digital card credentials.
* ``process``: If applicable for a particular process. If applicable for all processes, value is ``null``
* ``metaInfoFields``: Meta information fields to be sent as additional information while generating the credential

**Configuration Changes**

Once the partner profile is configured, the System Integrator (SI) should make changes to the following configurations:

* ``mosip.registration.processor.credential.partner-profiles``: Specify the file name for the partner profiles. By default its → ``registration-processor-credential-partners.json``. If a country intends to change the file name only then this configuration should be updated otherwise default configuration can be used
* ``mosip.registration.processor.credential.default.partner-ids``: Specify default partner IDs for which credentials will be created automatically
* ``mosip.registration.processor.credential.conditional.partner-id-map``: Define conditions for conditional partners. Credentials for these partners will be requested only if the conditions are met. Use ``MVEL`` expressions for conditions
* ``mosip.registration.processor.credential.conditional.no-match-partner-ids``: Specify a partner ID to be used when no conditions are met for conditional partners

**Conditional Partner Requests**

* The stage will create credentials for default partner IDs by default
* For conditional partners, credentials will be requested only if they match a particular ``MVEL`` expression
* ``MVEL`` expressions can be written on any identity field as well as meta info field
* If there is no condition match for conditional partners, SI can configure a no-match partner, which will be used when no conditional partner match is found

**Configuration File Locations**

1. **Credential Requestor Stage Configuration**: Click [here](https://github.com/mosip/mosip-config/blob/develop1-v3/registration-processor-default.properties#L479) to view credential requestor stage configuration details.
2. **Partner Profile Configuration**: Click [here](https://github.com/mosip/mosip-config/blob/develop1-v3/registration-processor-credential-partners.json) to view partner profile configuration details.

### Conclusion

The Credential Requestor Stage configuration is an essential part of MOSIP's functionality, enabling seamless communication with partners and ensuring the secure exchange of information post-UIN generation.

**Note**: Ensure that configured IDs are logically unique and consistent across future configurations.
