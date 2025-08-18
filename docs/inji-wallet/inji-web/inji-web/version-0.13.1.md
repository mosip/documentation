# Version 0.13.1

**Release Notes:** Inji Web Wallet 0.13.1 (Patch)

**Release Type:** Developer  

**Release Date:** Coming Soon  

### Overview
The Inji Web 0.13.1 (Patch) release delivers key improvements in configuration and mimoto session handling. The patch enhances Docker and inji-config setup for smoother local development and trusted verifier update. On the backend, mimoto now leverages Spring Security for session management, resolving logout errors, while automation has been improved to address case sensitivity issues in test assertions.

### Key Highlights

#### Docker & Configuration
- **Docker Changes**: Enhancements in Docker setup to streamline local setup.  
- **Inji-Config Changes**: Updates made to inji-configuration files to ensure compatibility with the latest mimoto changes.  
- **Trusted Verifiers Update**: Redirect and Response URIs in `inji-config` updated to:  
  - `https://${mosip.injiverify.host}/`  
  - `https://${mosip.injiverify.host}/v1/verify/vp-submission/direct-post`  

#### Mimoto Enhancements
**Code change**  
- Removed custom code that explicitly deleted the session.  
- Now relying on **Spring Security** to handle session invalidation automatically.  
- Prevents `IllegalStateException: Session was invalidated` error during `/logout`.  

**Automation change**  
- Enhance automation stability by removing case sensitivity comparison for issuer and credential types 

### Features Released
NA

### Bug Fixes
As part of the **0.13.1 patch**, the following issue has been addressed:

| Jira ID       | Description                                                        |
|---------------|--------------------------------------------------------------------|
| [INJIWEB-1685](https://mosip.atlassian.net/browse/INJIWEB-1685)  | `/logout` API of mimoto is giving 401 in the released environment |

### Known Open Bugs
The list of known issues can be found [here](https://mosip.atlassian.net/issues/?jql=project%3D%22Inji%20Web%22%20and%20type%20in%20%28bug%29%20and%20status%20not%20in%20%28closed%2C%20canceled%29%20order%20by%20created%20DESC).

### Repositories Released
| Module     | Version |
|------------|---------|
| Inji-web   | v0.13.1 |
| mimoto     | v0.18.1 |
| inji-config| v0.9.1  |

### Compatible Modules
| Module             | Version |
|--------------------|---------|
| Inji Wallet (Mobile) | [0.17.0](https://github.com/mosip/inji-wallet/tree/v0.17.0) |
| Inji Certify         | [0.11.0](https://github.com/mosip/inji-certify/tree/v0.11.0) |
| Inji Verify          | [0.13.1]()|
| eSignet              | [1.5.1](https://github.com/mosip/esignet/tree/v1.5.1)  |
| VC Verifier          | [1.3.0](https://github.com/mosip/vc-verifier/tree/v1.3.0)  |

### Documentation
- [Technical Documentation](https://docs.inji.io/inji-wallet/inji-web/technical-overview)  
- [Feature Documentation](https://docs.inji.io/inji-wallet/inji-web/overview/features)  
- [End-User Guide](https://docs.inji.io/inji-wallet/inji-web/functional-overview/end-user-guide)  
- QA Report(Coming Soon) 
