# Commercial Partner FAQs
******

This set of Frequently Asked Questions responds to queries by System Integrators, Biometrics and Device Providers and other interested Service Providers. A more general [FAQ](https://www.mosip.io/resources-faq.php) is also available on our website.

### Scope and Technology
------------------------------
**What will be the minimum scope guaranteed for the first release? Can we have access to this scope?**

MOSIP core platform is country agnostic. Any country is advised to take the latest stable release of the platform. [Please check our Roadmap](Roadmap.md) for future development.  

**What are the main technologies and programming languages involved in MOSIP platform?**

Please refer to the [Technology Stack](Technology-Stack.md)

**Will there be a business rules and decisions management engine included?**

There is no business rule decision management in MOSIP as of now. It has to be procured by the country.

**Can MOSIP deliver a mobile identity?**

MOSIP is compatible to build a mobile identity on top of its current offering. However the same is not provided currently. 

**What are the communication channels to the population available in MOSIP?**

Email and SMS in case the mobile number and email address is provided.

**What are the different form factors of devices compatible with MOSIP? (Smartphone, PC, tablets, etc.)**

MOSIP is API first implementation. Thus aplications of various platforms such as PC, tablet etc. can be built to consume the MOSIP APIs and deliver the service. 

**What are the MOSIP functions and modules related to financial inclusion?**

MOSIP Provides authentication (YES/NO) and eKYC services.

**Is MOSIP planning to deliver external modules to extend on some key sectors? Payment? Health? Social Benefits?**

We have no plans currently but it can be developed by the growing open source community.

**In the event of absence of network connectivity, can MOSIP delivers its identity verification services?**

MOSIP Registration client works both online and offline. MOSIP is providing both Online and Offline QR based auth service.

**Is there an external interface for producing statistics? What will be the standard? Is there any reporting or business intelligence tool provided or recommended?**

Business Intelligence and Analytics are not included in MOSIP but can be procured and integrated by a country.

**What is the technology to be used for Supervision and for Monitoring? Is there a recommended tool?  Is MOSIP instrumented for it?**

MOSIP recommends dockerized deployments, any tools to monitor & supervise docker components may be used.


### Support
------------------------------
**What level of support will be planned for the System Integrator? Is there any SLA for it?**

Level 3 MOSIP SLA will be available for at least 5 years.

**Is there a duration whereby MOSIP organization will guarantee its Open Source?**

MOSIP updates will always be free under MPL 2.0. The additional functionalities built by  partners on MOSIP may or may not be free.

**How is the MOSIP community composed? Paid developers, independent developers?**

MOSIP is taking steps to build a open source community across the globe. Currently this is in early stage and is showing promising response. 

### Privacy and Security
------------------------------

**What is the design architecture of MOSIP privacy by design?**

Please refer to our documentation on [privacy and security](Privacy-and-Security.md)

**Knowing that MOSIP is Open Source, what is MOSIP's recommendation on counter-measure in the event of hackers?**

By design MOSIP has multiple protections which has come out of our learnings from other successful projects.  Further, being open source, MOSIP is subject to scrutiny by public and experts.  Any recommendations shall be incorporated with highest priority.  We are already engaging with Alan Turing Institute, Carnegie Mellon and others to improve security of MOSIP.  However, it is the SIs responsibility to incorporate the best evolving industry practices for security for any IT system deployment - eg Firewalls, DMZ Zone, HSM, good password policy, Antivirus, Encryption,PKI infrastructure etc.

**Will MOSIP be publishing Security patches regularly?**

How the personal data are protected from deviant usage by Services providers?


### Testing
------------------------------

**Is MOSIP functionally tested in a generic use case, Is this test suite delivered together with it?**

Yes. MOSIP has hired the services of independent IV&V partner for  testing. The test report will be available once testing has been completed. Tentatively Scheduled for Dec 2019.  The automation tests scripts are also part of open source in Github.

**Is MOSIP tested for performance? Can we access the tests reports? Can the tools be delivered togther with the platform?**

MOSIP is undergoing performance testing and the results will become available by early 2020. The report will be available on Github for all to access.

**Is MOSIP tested for High Availability and at which level? Can we have access to the tests reports? Is there documentation explaining how to set-up MOSIP in High Availability?**

MOSIP is undergoing performance testing. MOSIP is getting tested for 150m registrations and sub-second Auth response. The reports will be made available on Github once the test results are completed. Scheduled currently for early 2020. 

**Was MOSIP subject to penetration and security tests? Can we have access to the tests reports? Can we have access to the tools?**

MOSIP is undergoing security testing and the results will become available by early 2020. The report will be available on Github for all to access.

### Biometrics
------------------------------
**Will MOSIP be able to assign a Unique Identity Number to a person without capturing Biometrics?**

If a country decides to allow this, MOSIP is configurable in that way.

**What are the MOSIP compatible Biometrics solutions (ABIS, SDK, Scanners)?**

A continuously updated list of vendors that have integrated with MOSIP is [available on our website](https://www.mosip.io/resource-partners/mosip-integrations). We are working with more companies to get integrations up and running in accordance with our [Biometric Data Specifications](MOSIP-Biometric-Data-Specifications) and [Device Integration Specifications](https://github.com/mosip/mosip-docs/wiki/Device-Integration-Specifications). 

**Is MOSIP robust to disconnection with external systems like ABIS?**

 The integration is over a persistent queue. This provides a measure of resilience.

**Does MOSIP use an ABIS or a SDK for 1:1 biometrics comparison?**

MOSIP recommends use of SDK for 1:1 biometric comparison. However the SDK needs to be procured by the Country and integrated with MOSIP. MOSIP platform does not come with any SDKs.

**In the absence of biometrics for a person, can MOSIP delivers its Identity Verification services?**

Multi-factor authentication in MOSIP supports non-biometric factors also.
In addition, MOSIP has provisions for exception handling in cases where a person is unable to provide biometrics due to a disability.  

## Enrollment
------------------------------
**Does MOSIP always consider that the Enrollment data has been checked in term of completeness and quality of capture or is it done by MOSIP?**

There are validations on the both Reg Client and backend to check for validity and completeness of data captured. However, validity and completeness is subject to the ID definition of a country. With regards to biometrics data quality, SI has to create the quality check components and MOSIP design has provision to add these into the platform.

**How MOSIP manage interaction with population in case of incomplete or unclear enrollment?**

Process exceptions from an inclusion perspective have to be defined by each country. MOSIP can be configured accordingly.

**What MOSIP can support in term of physical credential? (which is always necessary at least to deliver the Unique Identity Number)**

MOSIP's print and post stage allows specification of a template to create input for printing the UIN/VID.

**Can enrollment be performed offline?**

Yes. Enrollment can be done offline where there is no internet connectivity

**Is MOSIP permissive in term of data to be enrolled? (Can any identity creation be refused except for duplicate biometrics found reason?)**

Country decision and subsequent customisation will be required which is possible in MOSIP.

### Integrations
------------------------------

**What are the Identity Interoperability standard supported by MOSIP?**

MOSIP is using ISO/Open standards. Details available on Github. MOSIP is constantly evaluating other ID interoperable standards (eg eIDAS) and will support others when the case requires such after thorough evaluation. 

**Can MOSIP leverage on existing country identity assets like Population Database, Biometric systems, existing enrollment means? Does MOSIP have APIs to support migration from existing Identity systems? Civil Data, Breeder documents, Biometrics data?**

Yes. MOSIP design has factored in the idea of integrating with a country's existing population or biometrics database.

**What is the standard to be followed for interfacing with enrolment points?**

We have published the [MOSIP Device Service (MDS) Specifications](MOSIP-Device-Service-Specification). MOSIP has a packet sync API that defines the interface between the registration client and the server	

**Will MOSIP be supporting other Open Standard APIs defined by the key technology providers of identity market?**

MOSIP is evolving and we are open to embrace any efforts that are in line with MOSIP's fundatmental principles	

**What are the main external API available in MOSIP?**

[APIs are listed in our documentation](APIs)

**Will there be an external interface for producing identity documents externally?**

Yes.

**Will MOSIP provides an API to a Civil Registration system to receive birth and death notifications? Does MOSIP has push notifications to external functional systems about birth and death?**

MOSIP offers integration hook points for other modules. The APIs/modules to connect to other systems is to be developed by SI as part of MOSIP customization. MOSIP currently does not have a provision to create or delete identities based on birth or death registry entries of a country.	

### Customisation
------------------------------

**Does MOSIP define customization points in order for SI to not change MOSIP root source code and can manage MOSIP upgrades in the future?**

Yes, if components are build in addition to MOSIP standard modules. If MOSIP platform code is changed, then the change request should be sent to MOSIP -- and if the change is generic enough, shall be incorporated in the next release. Changes to the platform code will be governed by the [Mozilla Public License 2.0](License)	

**Is it possible to switch a sub-component by another software provider, i.e. workflow engine, population database?**

A population database outside MOSIP can be integrated, but requires customization.	

**Are there any documentation on the customization points? Are there sample implementations available?**

MOSIP is providing reference UI implementations for Pre-Reg & Reg Client. Also sample stages are available that can be used as references.	

**Will there a workflow engine to customize the business workflows without updating the code?**

Each module of MOSIP runs as a separate micro-service or stage in VertX.	


