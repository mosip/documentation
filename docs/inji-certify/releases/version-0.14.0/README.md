# Version 0.14.0

**Release Version**: v0.14.0

**Release Type:** Developer Release

**Release Date:** 25th March, 2026

#### Overview

Inji Certify v0.14.0 introduces key enhancements to credential issuance workflows, interoperability, and user experience. This release focuses on strengthening OpenID4VCI flows, expanding support for emerging credential formats, and improving system usability and integration capabilities.

Major updates include support for presentation during issuance, mDoc/mDL credentials, Pre-Authorized Code flow, enhanced error handling, QR code embedding in credentials, and seamless integration with MOSIP for data-driven credential generation.

#### Major Highlights / Features

* [**Presentation during Issuance**](https://docs.inji.io/inji-certify/overview/features#id-13.-presentation-during-issuance)**:** Introduced a new issuance mode enabling residents to present an existing Verifiable Credential to obtain another credential.
* [**Pre-Authorized Code Flow**](https://docs.inji.io/inji-certify/overview/features#id-15.-vc-issuance-with-pre-authorised-code-pre-auth-code-flow)**:** Enabled a simplified issuance flow where users can securely download credentials using a pre-authorized and transaction code.
* [**Support for Issuance in mDoc/mDL Format**](https://docs.inji.io/inji-certify/overview/features#id-4.-support-for-multiple-credential-formats)**:** Added support for issuing Verifiable Credentials in standardized mDoc/mDL formats.
* **Error Message Revamp:** Improved the error handling framework with clearer, more structured, and developer-friendly messages.
* [**MOSIP Identity Plugin Integration**](https://docs.inji.io/inji-certify/overview/features#data-provider-plugins)**:** Integrated with MOSIP APIs to fetch identity data and generate Verifiable Credentials within Certify.
* [**Embedding Data in QR Code for VC Issuance**](https://docs.inji.io/inji-certify/overview/features#id-14.-issuance-of-verifiable-credentials-with-qr-code)**:** Enabled [**169 - QR Code Specifications 1.1.0**](https://docs.mosip.io/1.2.0/readme/standards-and-specifications/mosip-standards/169-qr-code-specification-1) compliant data embedding within QR codes for secure credential download and verification.

#### User Stories Released

<table><thead><tr><th width="171.21875">Feature</th><th width="410.73828125">Description</th><th>JIRA</th></tr></thead><tbody><tr><td>Pre Authorized Code Flow</td><td>Enables credential issuance without login using a pre-authorized code.</td><td><a href="https://mosip.atlassian.net/browse/INJICERT-976">INJICERT-976</a></td></tr><tr><td>Support for mDoc VC Format</td><td>Issuing VC in mDoc/mDL format.</td><td><a href="https://mosip.atlassian.net/browse/INJICERT-981">INJICERT-981</a></td></tr><tr><td>Presentation During Issuance</td><td>Enables credential issuance by requiring the user to present an existing Verifiable Credential as proofs.</td><td><a href="https://mosip.atlassian.net/browse/INJICERT-990">INJICERT-990</a></td></tr><tr><td>Issuance of Verifiable Credentials with QR code</td><td>Issuing VC with QR code in compliant of claim 169 specification.</td><td><a href="https://mosip.atlassian.net/browse/INJICERT-1223">INJICERT-1223</a></td></tr><tr><td>Enhance Error Message</td><td>Improve Error Message Handling for System Integration and Automation.</td><td><a href="https://mosip.atlassian.net/browse/INJICERT-1257">INJICERT-1257</a></td></tr><tr><td>Enable certify to Issue MOSIP UIN as VC</td><td>Enable certify to convert and issue MOSIP UIN as verifiable credentials.</td><td><a href="https://mosip.atlassian.net/browse/INJICERT-1295">INJICERT-1295</a></td></tr></tbody></table>

#### Bug Fixes

<table><thead><tr><th width="193.1328125">JIRA</th><th>Description</th></tr></thead><tbody><tr><td><a href="https://mosip.atlassian.net/browse/INJICERT-1275">INJICERT-1275</a></td><td>Getting 401 error when /issuance/credential API is hit pointing to esignet-1.7.0V.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJICERT-1282">INJICERT-1282</a></td><td>Remove claims validation for mDoc request as claims are optional.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJICERT-1297">INJICERT-1297</a></td><td>Issuer and verification method value is pointing to mosip repo instead of inji in status list credential response.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJICERT-1110">INJICERT-1110</a></td><td>Error message should be user friendly when invalid request is passed - add credential config API.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJICERT-1098">INJICERT-1098</a></td><td>Error code and error messages to be different.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJICERT-1075">INJICERT-1075</a></td><td>VC fetch with VID is failing in Mosipid Usecase.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJICERT-852">INJICERT-852</a></td><td>Error message is not proper when render template id is mismatch in DB and config.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJICERT-840">INJICERT-840</a></td><td>Error messages are not user friendly when {{url}}/issuance/credential API is executed without context value.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJICERT-819">INJICERT-819</a></td><td>Error message is not proper for sunbird and Mosipid use case with 2.0 model context.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJICERT-681">INJICERT-681</a></td><td>Error messages difference in few scenarios in Sunbird and MOCK Use cases.</td></tr></tbody></table>

### Known Issues

Below is the list of known issues related to the release v0.13.0. To access all known issues related to Inji Certify please click [**here**](https://mosip.atlassian.net/issues/INJICERT-852?filter=11419\&jql=project%20%3D%20%22Inji%20Certify%22%20AND%20issuetype%20%3D%20Bug%20%20AND%20labels%20not%20in%20%28API_Automation%2C%20AWSdevicefarm%2C%20device_specific%2C%20qa-inji-UI-auto%29%20%20and%20status%20NOT%20IN%20%28Closed%2C%20Fixed%2C%20Canceled%2CCancelled%29%20%20ORDER%20BY%20created%20DESC%2C%20updated%20DESC)

<table><thead><tr><th width="201.7890625">JIRA</th><th>Description</th></tr></thead><tbody><tr><td><a href="https://mosip.atlassian.net/browse/INJICERT-1319">INJICERT-1319</a></td><td>Error messages mismatch in mdoc-mdl usecase(PDI).</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJICERT-1290">INJICERT-1290</a></td><td>CSR Certificate Upload via Automation Causes DID kid Mismatch and VC Verification Failures.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJICERT-1265">INJICERT-1265</a></td><td>Upload ca cert for ecck1 signalgo is failing.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJICERT-1260">INJICERT-1260</a></td><td>Improper Validation in Status Update Endpoints.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJICERT-1324">INJICERT-1324</a></td><td>Generate token API is failing with unkown_error.</td></tr></tbody></table>

### Repository Released

<table><thead><tr><th width="208.9765625">Repositories</th><th>Tags</th></tr></thead><tbody><tr><td>inji-certify</td><td><a href="https://github.com/inji/inji-certify/tree/v0.14.0">v0.14.0</a></td></tr><tr><td>inji-config</td><td><a href="https://github.com/inji/inji-config/tree/v0.15.0">v0.14.0</a></td></tr><tr><td>keymanager</td><td><a href="https://github.com/mosip/keymanager/tree/v1.4.0">v1.4.0</a></td></tr><tr><td>digital-credential-plugin</td><td><a href="https://github.com/inji/digital-credential-plugins/tree/v0.6.0">v0.6.0</a></td></tr><tr><td>mosip-functional-tests</td><td><a href="https://github.com/mosip/mosip-functional-tests/tree/v1.5.0">v1.5.0</a></td></tr></tbody></table>

### Compatible Modules

<table><thead><tr><th width="216.73828125">Modules</th><th>Version</th></tr></thead><tbody><tr><td>eSignet</td><td><a href="https://github.com/mosip/esignet/tree/v1.6.2">1.6.2</a></td></tr><tr><td>IDA</td><td><a href="https://github.com/mosip/id-authentication/tree/v1.3.0">1.3.0</a></td></tr><tr><td>pixelpass</td><td><a href="https://www.npmjs.com/package/@injistack/pixelpass/v/0.8.0">0.8.0</a></td></tr><tr><td>Sunbird C</td><td><a href="https://github.com/Sunbird-RC/sunbird-rc-core/releases/tag/v2.0.0-rc3">v2.0.0</a></td></tr><tr><td>esignet-mock-services</td><td><a href="https://github.com/mosip/esignet-mock-services/tree/v0.11.2">v0.11.2</a></td></tr><tr><td>commons</td><td><a href="https://github.com/mosip/commons/tree/v1.3.0">1.3.0</a></td></tr><tr><td>mimoto</td><td><a href="https://github.com/inji/mimoto/releases">0.20.0</a></td></tr><tr><td>inji-web</td><td><a href="https://github.com/inji/inji-web/releases/tag/v0.15.0">0.15.0</a></td></tr></tbody></table>

### Documentation

* [Feature Documentation](https://docs.mosip.io/inji/inji-certify/functional-overview/features)
* [Local Setup](https://docs.mosip.io/inji/inji-certify/build-and-deploy/local-setup)
* [API Documentation](https://mosip.stoplight.io/docs/inji-certify/25f435617408e-inji-certify)
* [Test Report](test-report.md)
