# Roadmap

MOSIP Platforms and Initiatives

### MOSIP

| Focus                                    | Priority 1                 | Priority 2                         |
| ---------------------------------------- | -------------------------- | ---------------------------------- |
| Migration to 1.2                         | Managing Grants            | ID issuance in Registration Client |
| Brownfield implementation                | Tooling and manageability  | Accessibility                      |
| Reference for making existing ID digital | Inclusion issues           | Manual adjudication                |
|                                          | Update and lost card flows |                                    |
|                                          | Packet prioritization      |                                    |
|                                          | Resident Portal            |                                    |

### Inji

| Focus                                   | Priority 1                                      | Priority 2           |
| --------------------------------------- | ----------------------------------------------- | -------------------- |
| Beta customer                           | Modular wallet compatible with OWF architecture | Cloud wallet         |
| Reference integrations to other issuers | Issuance flow as per OpenID standard            | USSD support         |
|                                         | Biometric Authenticator                         | SIM based wallet     |
|                                         | e-Signet integration                            | Voice authentication |

### e-Signet

| Focus                  | Priority 1                                 | Priority 2       |
| ---------------------- | ------------------------------------------ | ---------------- |
| Beta customer          | VC support in e-Signet                     | Android APK      |
| Reference integrations | Single window consent                      | iOS APK          |
|                        | Consent registry                           | Multiple issuers |
|                        | Management of consent registry by end user | Custom handles   |

### Compliance Tool Kit (CTK)

| Coverage        | Priority 1                                                                     | Priority 2                             |
| --------------- | ------------------------------------------------------------------------------ | -------------------------------------- |
| Devices         | Testing kit for Android SBI                                                    | Testing kit for Adjudication           |
| ABIS            | Testing kit for ABIS                                                           | Archival                               |
| Matcher SDK     | Certificate Issuance                                                           | Security Testing                       |
| Capture Quality | Multi-language Support                                                         | Performance Testing                    |
|                 | <p>Spec Review<br>* ABIS<br>* Manual Adjudication<br>* Manual Verification</p> | Integration with multiple quality SDKs |

### Automation

| Focus                                                                 | Priority 1                                                       | Priority 2                       |
| --------------------------------------------------------------------- | ---------------------------------------------------------------- | -------------------------------- |
| Dockerize the DSL                                                     | Enhance the functional test rigs to reduce manual testing effort | Test Rig to handle upgrade flows |
| Increase the DSL coverage for production scenarios                    | Revamp old test rigs                                             |                                  |
| Enhance the Mocks to simulate real time scenarios                     | Reduce test rig execution time (DSL)                             |                                  |
| Registration Processor Stage level verification of negative scenarios | UI automation for Resident Portal                                |                                  |

### Collaborations

| Community Projects                       | Open Source Integrations                                                                                                                                                                                        |
| ---------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Android Registration Client for Ethiopia | <p>Integrations<br>* OpenCRVS (updated architecture)<br>* Mojaloop (Identity mapper)<br>* OpenG2P (Inji, e-Signet usage)<br>* DHIS by CMU<br><br>Showcases<br>* GovStack<br>* DCI<br>* G2P Connect<br>* MEC</p> |

### Research

| Inclusion                                                                | Biometrics                                                                                           | Privacy and Security                                                                                                               |
| ------------------------------------------------------------------------ | ---------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------- |
| SIMple ID: Using SIM as identity and integrate with USSD (Alan Turing)   | Liveness: FP, Iris (IIITB / Community)                                                               | Making MOSIP’s analytics pipeline satisfy a formal differential privacy guarantee- Metrics Report (CMU Africa)                     |
| Assisting Countries with USSD integration. e.g. Ethiopia (Sanath & team) | Biometrics data generation for evaluation & testing (ABIS/SDK): Real data, Synthetic data (TBA)      | Anomaly detection: Identifying irregular patterns during E2E flow. e.g. packet uploaded through an irregular channel (Alan Turing) |
|                                                                          | Enhanced evaluation algorithms of biometrics: Minutiae-based matcher vs. texture-based matcher (TBA) | Privacy preserving identity using homomorphic encryption: Map it back to MOSIP’s production code (IIITB)                           |

### Ecosystem

| Standards                                                                                                                                                                                                                                                    | Biometrics                                                                                                                                                                                       |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| <p>Reference implementations of<br>* SBI IEEE - Draft 1, 2<br>* OpeNID4VP over BLE - Draft 1, 2<br>* Specifications for SDK and ABIS<br>* Global ID Credentials Specifications- Draft1<br>* Credential Issuance and Wallet Onboarding Protocol - Draft 2</p> | <p>Benchmarking tools for<br>* Capture quality<br>* Matcher accuracy<br>* Bias in matchers<br>* Performance and scalability of matcher and ABIS<br>* Match accuracy for contactless captures</p> |
