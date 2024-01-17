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


