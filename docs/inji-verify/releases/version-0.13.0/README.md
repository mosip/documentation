# Version 0.13.0

**Release Name**: Inji Verify v0.13.0

**Support**: Developer Release

**Release Date**: 24th July, 2025

### Overview

We are thrilled to announce the release of Inji Verify 0.13.0 that enhances Verifiable Credential (VC) verification capabilities and streamlines ease of integration with relying party applications.

### New Features

**1. Inji Verify SDK- Scan & Upload component:** Inji Verify provides modular SDK components that empower verifier (relying party) applications to seamlessly integrate Verifiable Credential (VC) verification workflows—without relying on the full Inji Verify reference application.

* **Modular NPM Package:** The Scan & Upload component is available as a standalone NPM module, promoting modularity and simplifying integration. Developers can incorporate it into their projects without depending on the full Inji Verify repository.​​
* **Comprehensive Integration Guide:** A detailed [integration guide](../../technical-overview/integration-guides/openid4vp-vp-verification-integration-guide.md) is provided, explaining the setup and usage to ensure a smooth integration process. The steps are also available in the [SDK's README](https://github.com/mosip/inji-verify/blob/release-0.13.x/inji-verify-sdk/Readme.md).​
* **Framework Compatibility:** Currently, this component is compatible exclusively with verifier applications built using React and TypeScript. Support for additional frameworks and languages is planned for upcoming releases.

**Note:** The Inji Verify UI is provided as a reference implementation to demonstrate how the SDK components can be orchestrated in a full-fledged verifier application. It is not required for adoption. Developers are encouraged to selectively embed only the components relevant to their business and technical needs.

**Note:** Inji Verify SDK- Scan / Upload component supports React version- 18.2.0

**2. Server Setup for VC and VP Proof Verification in vc-verifier library**

The vc-verifier library has been integrated into Inji Verify to enable server-side verification of both Verifiable Credentials (VCs) and Verifiable Presentations (VPs).

Originally designed for credential-level cryptographic and schema validation, the library has now been enhanced to support VP proof verification as per OpenID4VP specifications, ensuring end-to-end trust and compliance.

**Key Capabilities:**

* VP Proof Verification for OpenID4VP flows
* VC Proof Verification for OpenID4VCI flows
* Support for key types: Ed25519VerificationKey2018, Ed25519VerificationKey2020, and RSAVerificationKey2018
* Verification Methods: did:key and did:jwk
* Credential & Presentation Expiry Checks
* Robust Error Reporting for failed verifications. This enhancement ensures the verifier backend meets security and interoperability standards while maintaining extensibility for evolving DID-based ecosystems.

### Additional Enhancements:

**1. Support for JsonWebSignature2020 with Ed25519 algorithm type for VP verification :** VC-Verifier library supports JsonWebSignature2020 with Ed25519 algorithm for Verifiable Presentation (VP) verification, so that we can process VPs secured with this cryptographic standard and ensure broader interoperability for presentation flows.

**2. Configuration of DB Parameters:** Database parameters like DB Name, DB Schema, and JDBC URL which were hardcoded earlier, are now dynamically configurable, so that deployments can be made more flexible, environment-specific, and manageable through configuration.

**3. Integration of Swagger** locally with the Inji Verify API service so that developers can easily access and test the API documentation without relying solely on the published Stoplight documentation.

**4. Migration all the JSONB fields to TEXT** in Inji Verify database so that we can improve database performance, as we are not utilizing JSON-based filtering and TEXT will better suit our use case.

**OpenID4VP Draft 21 enhancement** by streamlining the authorization response structure and eliminating unnecessary metadata.

### Repositories: Released/Dependent

| Repositories        | Tags: Released/Dependent                                     |
| ------------------- | ------------------------------------------------------------ |
| Inji Verify         | [v0.13.0](https://github.com/mosip/inji-verify/tree/v0.13.0) |
| vc-verifier library | [v1.3.0](https://github.com/mosip/vc-verifier/tree/v1.3.0)   |

### Projects: Released

Inji Verify Repositories: 4 projects (all these projects are of same version) as below:

1. inji-verify-service - [0.13.0 Inji Verify service](https://github.com/mosip/inji-verify/tree/release-0.13.x/verify-service)
2. inji-verify-ui (ref implementation) - [https://github.com/mosip/inji-verify/tree/release-0.12.x/verify-ui](https://github.com/mosip/inji-verify/tree/release-0.13.x/verify-ui)
3. SDK - [https://github.com/mosip/inji-verify/tree/release-0.12.x/inji-verify-sdk](https://github.com/mosip/inji-verify/tree/release-0.12.x/inji-verify-sdk)
4. API-Test - [https://github.com/mosip/inji-verify/tree/release-0.12.x/api-test](https://github.com/mosip/inji-verify/tree/release-0.12.x/api-test)

### Compatible modules

The following table outlines the tested and certified compatibility of Inji Verify 0.13.0 with other modules.

<table><thead><tr><th width="228.04827880859375">Module</th><th>Version</th></tr></thead><tbody><tr><td>Inji Mobile Wallet</td><td><a href="https://github.com/mosip/inji-wallet/tree/v0.17.0">0.17.0</a></td></tr><tr><td>Inji Web Wallet</td><td><a href="https://github.com/mosip/inji-web/tree/v0.12.0">0.12.0</a></td></tr><tr><td>Pixel-Pass library</td><td><a href="https://github.com/mosip/pixelpass/tree/v0.6.0">v0.6.0</a></td></tr></tbody></table>

### Known Issues

Below is a list of some key known issues. For a detailed overview and the complete list of issues related to Inji Verify, please click [here.](https://mosip.atlassian.net/issues/?jql=project%20%3D%20%22INJIVER%22%20AND%20status%20not%20in%20%28Closed%2C%20Canceled%29%20AND%20type%20%3D%20Bug%20ORDER%20BY%20created%20DESC)

<table><thead><tr><th width="223.069580078125">Jira ID</th><th>Description</th></tr></thead><tbody><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1061">INJIVER-1061</a></td><td>In OpenID4VP (Cross device)component, after scanning the health insurance QR code in the injiwallet app, it is displaying the life insurance VC.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1131">INJIVER-1131</a></td><td>The OpenID4VP (Cross device) component in Inji Verify currently validates a presentation as successful even when a wrong Verifiable Credential (VC) is submitted. As a temporary workaround, implement credential type validation on the Relaying Party (RP) side, by verifying that the received VC matches the expected type defined in the original presentation_definition.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1062">INJIVER-1062</a></td><td>We are uploading an invalid QR code, and while it displays an error message stating that the QR code is invalid, the credential details are still visible.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1063">INJIVER-1063</a></td><td>On iPhone 8 and iPhone 7, uploading the Injiweb QR code PDF shows an error message.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-625">INJIVER-625</a></td><td>Inji Verify - Upload not functioning on Mac Safari Browser Versions 16 and below.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1194">INJIVER-1194</a></td><td>INJI Verify SDK should be able to support integration with applications built on platforms beyond React (Typescript) applications, such as Angular, PHP, and others.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1181">INJIVER-1181</a></td><td>NPM warnings are preventing the Sonar analysis from being triggered./td></td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1069">INJIVER-1069</a></td><td>The MOSIP UIN VCs generated via reg-client are currently not verifiable through INJI Verify.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-979">INJIVER-979</a></td><td>Long-polling listeners are implemented within the service layer, preventing the backend from scaling effectively in a multi-pod (distributed) environment.</td></tr></tbody></table>

### User Stories

<table><thead><tr><th width="222.37713623046875">Jira ID</th><th>Description</th></tr></thead><tbody><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1039">INJIVER-1039</a></td><td>Inji Verify SDK- Scan &#x26; Upload component.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1123">INJIVER-1123</a></td><td>Publish Scan &#x26; Upload component as a separate NPM module.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-943">INJIVER-943</a></td><td>VP Proof Verification in VC- Verifier library.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-991">INJIVER-991</a></td><td>Add support for JSON Web Signature 2020 using Ed25519 algorithm for Verifiable Presentation (VP) verification.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-991">INJIVER-991</a></td><td>Add support for JSON Web Signature 2020 using Ed25519 algorithm for Verifiable Presentation (VP) verification.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1073">INJIVER-1073</a></td><td>Configure database parameters.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1120">INJIVER-1120</a></td><td>Integrate Swagger for API documentation in the Inji Verify backend.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1122">INJIVER-1122</a></td><td>Migrate all JSONB fields to TEXT data type.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1144">INJIVER-1144</a></td><td>OpenID4VP Draft 21: Update Authorization Response to remove unnecessary metadata.</td></tr></tbody></table>

### Bug Fixes

Below is the list of fixes as part of the 0.13.0 release:

<table><thead><tr><th width="222.41973876953125">Jira ID</th><th>Description</th></tr></thead><tbody><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-940">INJIVER-940</a></td><td>Implement Docker Compose setup for Inji Verify Service.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1171">INJIVER-1171</a></td><td>The online sharing VCs- OpenID4VP flow remains stuck in the loading state for both Upload and Scan methods.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1172">INJIVER-1172</a></td><td>Inji Verify remained unstable for a certain duration.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-148">INJIVER-148</a></td><td>Multi-language support is not available (enhancement).</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-156">INJIVER-156</a></td><td>After uploading and verifying the QR code, the retrieved data should display the full name as the first field in the VC result area.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-237">INJIVER-237</a></td><td>Unable to scan the Sunbird QR code on Mobile, Windows, or Mac devices.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-282">INJIVER-282</a></td><td>On Windows, users do not receive an appropriate error message when uploading a file in an unsupported format.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-310">INJIVER-310</a></td><td>Users occasionally face difficulty scanning valid Sunbird RC QR codes on mobile devices.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-640">INJIVER-640</a></td><td>A 502 error is encountered after uploading a PDF file.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-715">INJIVER-715</a></td><td>Tapping the 'Scan' button on iOS devices makes the scan screen unexpectedly scrollable.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-910">INJIVER-910</a></td><td>The ‘Download’ button of verified VC is not properly aligned on the UI.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-934">INJIVER-934</a></td><td>VC sorting functionality in the VP verification- Credential Selection panel is not working correctly.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1188">INJIVER-1188</a></td><td>API tests are failing following the VC Verifier integration.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1189">INJIVER-1189</a></td><td>UI tests are failing after integrating the Scan and Upload SDK.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1197">INJIVER-1197</a></td><td>VP Request QR code generation is failing.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1199">INJIVER-1199</a></td><td>Verification of Datashare VCs is slower than expected.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1185">INJIVER-1185</a></td><td>The API automation report indicates a failure in the 'GetVpTokenForRequest' method.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1192">INJIVER-1192</a></td><td>VC verification fails when the credential is downloaded from the Inji Web application.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1161">INJIVER-1161</a></td><td>VP verification is not compatible with Inji Mobile version 0.17.0 as the sprint build did not have the entire design in place to be compatible.</td></tr></tbody></table>

### Documentation

* [Feature documentation](../../overview/features/)
* [Integration Guide](../../../inji-wallet/inji-mobile/technical-overview/integration-guide/building-verifiable-credentials-wallet-with-inji-libraries/openid4vp.md)
* [API Documentation](https://mosip.stoplight.io/studio/inji-verify)
* [Collab Guide](../../functional-overview/releases-1/inji-verify-collab-guide.md)
* [QA Report](test-report.md)
