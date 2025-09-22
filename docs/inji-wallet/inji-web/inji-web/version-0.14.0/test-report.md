# Test Report

Testing Scope

The scope of testing is to verify fitment to the specification from the perspective of &#x20;

* Functionality &#x20;
* Deployability &#x20;
* Configurability &#x20;
* Customizability

Verification is performed not only from the end user perspective but also from the System Integrator (SI) point of view. Hence, the Configurability and Extensibility of the software are also assessed. This ensures the readiness of the software for use in multiple countries. MOSIP is an “API First” product platform.&#x20;

The testing scope has been focused on the following features:\


* Inji Home page
* Issuer and Credential selection&#x20;
* Authenticating with user credentials
* PDF Generation and Auto Download
* Success/Failure notification after downloading the VC PDF
* Retrieve Issuers and Credential list
* Downloading VC
* Multi-language support
* Error Handling
* Theme update
* PDF View
* Issuers support
* Responsive view of the web
* Access violations
* QR Code
* Durian data storage integration
* PDF and CBOR
* Log in with Google
* OpenID4VP Implementation
* Latest draft changes support for OpenID4VCI
* FAQ Support&#x20;
* UI UX Design updates
* Swagger update
* Secure Time-Bound Storage
* Locale Support
* PDF Template Support
* Authorization endpoint discovery through the auth server well-known
* SD JWT support
* Passcode Reset

### Test Approach

A personal-based approach has been adopted to perform the IV\&V by simulating test scenarios that resemble a real-time implementation.&#x20;

A Persona is a fictional character/user profile created to represent a user type that might use a product/or a service in a similar way. Persona-based testing is a software testing technique that puts software testers in the customer's shoes, assesses their needs from the software and thereby determines use cases/scenarios that the customers will execute. The persona's needs may be addressed through any of the following.&#x20;

* Functionality &#x20;
* Deployability &#x20;
* Configurability &#x20;
* Customizability

The verification methods may differ based on how the need was addressed.&#x20;

### Verified configuration&#x20;

Verification is performed on various configurations as mentioned below&#x20;

* Default configuration - with 7 Lang&#x20;
* English
* French
* Arabic
* Hindi
* Tamil
* Kannada
* Portuguese

The UI will render in all the above languages but the PDF file after download will only be in English language as certify is currently only supporting English. When any language is selected in UI, as a fall back the pdf will be in Eng.&#x20;

### Feature Health

<figure><img src="../../../../.gitbook/assets/image.png" alt=""><figcaption></figcaption></figure>

### Test execution statistics&#x20;

#### Functional test results

Below are the test metrics by performing functional testing. The process followed was black box testing which based its test cases on the specifications of the software component under test. Functional test was performed in combination of individual module testing as well as integration testing. Test data were prepared in line with the user stories. Expected results were monitored by examining the user interface. The coverage includes GUI testing, System testing, and End-To-End flows across multiple configurations. The testing cycle included simulation of multiple identity schema and respective UI schema configurations.\


\


