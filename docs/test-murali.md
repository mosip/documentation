# Credential Requestor Stage

## History of Print Stage in MOSIP

<p>In the initial version of MOSIP (0.9.0), the "print stage" was primarily designed to facilitate the submission of printing requests. Its core functionality revolved around initiating a request for the physical printing of credentials. However, as the system evolved and incorporated additional features, the scope of the print stage expanded beyond its original purpose.</p>

<p>In the evolved version, particularly after the integration of new features, the print stage underwent significant enhancements. Contrary to its initial purpose, the print stage no longer serves the singular function of printing credentials. Instead, it has transformed into a multifaceted component with a broader set of responsibilities.</p>

<p>In the current system, the print stage's role extends beyond traditional printing activities. Its primary function now revolves around initiating a request for credential generation once a <b>Unique Identification Number (UIN)</b> is generated. This request is not aimed at physical printing but serves as a mechanism to gather additional information for specific partners. These partners may require supplementary data beyond what is initially generated with the UIN.</p>

<p>Therefore, in the evolved approach, the print stage has transitioned from being a straightforward printing request to a more versatile component that manages the initiation of credential requests tailored to partner-specific information needs. This adaptation reflects the system's responsiveness to changing requirements and the dynamic nature of credentialing processes. This reason led us to rename the “Print Stage” to the “Credential Requestor Stage” as this name serves the purpose of the work executed by this stage.</p>


## Introduction

<p>The Credential Requestor Stage in MOSIP, formerly known as the Print Stage, is a crucial component used to request credentials for configurable partners after the Unique Identification Number (UIN) is generated. This stage enables countries to share information with multiple partners, each with specific needs after UIN generation. Partners, such as Print Partners and Digital Card Partners, may require demographic or biometric information to perform operations.</p>


## What is the credential requestor stage?

<p>The Credential Requestor Stage plays a crucial role in the MOSIP system, serving as a mechanism to solicit credentials from configurable partners post-UIN generation. In this context, partners, previously registered with MOSIP, require demographic and biometric data to execute their respective operations. For instance, a Print Partner necessitates specific demographic details for the purpose of printing cards. Similarly, digital card partners seek demographic information to generate digital cards. Additionally, DPGs might seek confirmation of successful UIN generation to integrate this information into their systems. The Credential Requestor Stage facilitates various use cases where the country aims to share pertinent information with multiple partners subsequent to UIN generation.</p>

## What are the latest changes done in the credential requestor stage?

### Partner Profile Configuration

<p>MOSIP has introduced a new partner profile for the Credential Requestor Stage. The partner profiles are maintained in the [https://github.com/mosip/mosip-config/blob/develop-v3/registration-processor-credential-partners.json] (https://github.com/mosip/mosip-config/blob/develop-v3/registration-processor-credential-partners.json) file.</p>

### Sample Partner Profile:


   <code> jsonCopy code{
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
} </code>


### <ins>Explanation of Fields:</ins>

<ul><li><code>id:</code> Logical unique identifier.</li>
  
<li><code>partnerId:</code> Partner identifier configured in MOSIP</li>

<li><code> credentialType:</code>Type of credential configured in MOSIP.</li>

<li><code>template:</code> Template used for generating the credential.</li>

<li><code>appIdBasedCredentialIdSuffix:</code> Applicable for special conditions where the credential ID is the application ID itself, with an optional suffix (e.g., <code> .pdf </code>). This is applicable for digital card credentials as of now.</li> 

  <li><code> process:</code> If applicable for a particular process. If applicable for all processes, it can be left as <code>null </code>. </li>
  
  <li><code>metaInfoFields: </code> Meta information fields to be sent as additional information while generating the credential.</li>
</ul>

## <ins>Configuration Changes </ins>

<p>Once the partner profile is configured, the System Integrator (SI) needs to make changes to the following configurations:</p>
<ul><li><code>mosip.registration.processor.credential.partner-profiles:</code> Specify the file name for the partner profiles. By default its → <code> registration-processor-credential-partners.json </code>. If a country wants to change the file name only then this configuration need to be updated otherwise use default configuration.</li>
  
<li><code>mosip.registration.processor.credential.default.partner-ids:</code> Specify default partner IDs for which credentials will be created automatically.</li>

<li><code>mosip.registration.processor.credential.conditional.partner-id-map:</code> Define conditions for conditional partners. Credentials for these partners will be requested only if the conditions are met. Use MVEL expressions for conditions.</li>

<li><code>mosip.registration.processor.credential.conditional.no-match-partner-ids:</code> Specify a partner ID to be used when no conditions are met for conditional partners.</li>
</ul>

### <ins>Configuration File Locations </ins>

<ol>
  <li><b>Credential Requestor Stage Configuration:</b>
  <ul>
    <li>File: [https://github.com/mosip/mosip-config/blob/develop1-v3/registration-processor-default.properties#L479] (https://github.com/mosip/mosip-config/blob/develop1-v3/registration-processor-default.properties#L479)</li>
  </ul></li>

  <li><b>Partner Profile Configuration:</b><ul><li>File: [https://github.com/mosip/mosip-config/blob/develop1-v3/registration-processor-credential-partners.json] (https://github.com/mosip/mosip-config/blob/develop1-v3/registration-processor-credential-partners.json) </li></ul>
  </li>
</ol>

### Conclusion

<p>The Credential Requestor Stage configuration is an essential part of MOSIP's functionality, enabling seamless communication with partners and ensuring the secure exchange of information post-UIN generation.</p>

<p><b><ins>Notes:</ins></b> Ensure that configured IDs are logically unique and consistent across future configurations.</p>

