# Test Report

### 1. Introduction

The eSignet 2.0.0 testing scope includes the validation of authentication, authorization, consent management, token generation, OpenID Connect (OIDC) flows, client management and partner (PMS) integration across supported authentication methods and identity systems (Mock ID, MOSIP ID and Sunbird). eSignet is a modular and standards-based digital identity authentication solution that supports secure and configurable login journeys using OTP, password, biometrics, KBI and trusted identity providers.

#### 1.1 Overview and Scope

The scope of testing defines the boundaries, functionalities, and features that will be tested for the eSignet platform. This ensures comprehensive validation of critical authentication, authorization, consent, and identity verification workflows while clearly identifying what is included and excluded from testing.

**Functional features covered:**

Login with eSignet (end-to-end OIDC flow on the Go/Thunder build — authorize, flow/execute, callback, token, userinfo), auth factors rendered as per the configured ACR values, login with OTP, password, biometrics and KBI (Knowledge-Based Identification), multiple login ID types (UIN/VID/handle) with input validations (regex, length, prefix and postfix), Mock ID, MOSIP ID and Sunbird plugin integration, client (RP) name in multiple languages, regex pattern support for `redirect_uri`, UserInfo and ID token as JWE, FAPI 2.0 compliance (PAR, DPoP), OIDC authorization flow with PKCE, branding (client logo, client name, theme) and UI alignment, consent service and consent page (`prompt=consent`), captcha in authenticate requests, Redis cache, client management endpoints and PMS integration (`additionalConfig`), keystore support (PKCS12/SoftHSM), claims management, audit logging, and deployment testing for eSignet Go.

**Cross-platform support:**

* Multilingual: eSignet with 6 languages (English/Khmer/Hindi/Kannada/Arabic/Tamil)
* Multi-browser: Edge, Firefox, Chrome
* Devices: Windows, Mac, Tablet, Mobile
* Testing types: Sanity, Regression Testing and Integration Testing
* Cross-browser and cross-device compatibility testing

### 2. Test Approach

The scope of testing is to verify fitment to the specification from the perspective of:

* Functionality
* Combination
* UI Automation
* API Automation
* Library verification

### 3. Test Organization

This part lists the team members involved in the testing process and their responsibilities. It clarifies who is accountable for which roles.

| Name           | Functional Role | Responsibilities                                                                                                                                                                                                                                                                                                        |
| -------------- | --------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Ragini Krishna | Manager         | Defining test strategy, managing QA activities, and ensuring overall product quality.                                                                                                                                                                                                                                   |
| Santosh        | Test Engineer   | Designing and executing test cases, performing functional and regression testing, validating eSignet authentication workflows, verifying login and identity verification functionalities, logging and tracking defects, validating fixes, and ensuring overall application quality, security, and compliance standards. |

### 4. Test Planning

This Test Plan outlines the testing approach, scope, resources, and schedule for the eSignet 2.0.0 platform. The objective is to ensure that all functional, integration, security, and non-functional requirements are validated with high quality before release.

* Validate end-to-end functionality of eSignet authentication and authorization workflows.
* Ensure system stability across supported browsers, operating systems, plugins, and environments.
* Verify integrations with dependent systems, identity providers, and authentication services.
* Validate OIDC, DPoP, PAR, and FAPI 2.0 compliance workflows.
* Identify and mitigate risks early through functional, regression, integration, and deployment testing.
* Ensure compatibility of Docker Compose setup across Windows, macOS, and Linux operating systems.
* Verify secure login mechanisms including OTP, Password, Biometrics, and KBI authentication methods.

#### 4.1 Sanity Scenarios Verified

Sanity testing will be performed to ensure basic application stability before detailed test execution. The following high-level sanity scenarios will be verified:

* Application accessibility and successful login across supported authentication methods and environments.
* Login validation using OTP (Phone Number, UIN/VID, and Email).
* Login validation using Password authentication.
* Basic biometric authentication validation using Mock ID and MOSIP ID.
* KBI (Knowledge-Based Identification) login validation.

Only upon successful completion of sanity testing will the build be accepted for full regression and integration testing.

#### 4.2 Test Environment

* [Mock ID environment](https://esignet-go.esqa.mosip.net/)
* [MOSIP ID environment](https://esignet-go-mosipid1.esqa.mosip.net/)
* [Sunbird environment](https://esignet-go-sunbird.esqa.mosip.net/)

### 5. Docker Versions in 131GA Environment

```
docker.io/library/busybox:1.36
docker.io/istio/operator:1.22.0
docker.io/istio/pilot:1.22.0
docker.io/istio/proxyv2:1.22.0
docker.io/kennethreitz/httpbin:latest
docker.io/library/mongo:6.0.13
docker.io/minio/mc:RELEASE.2025-05-21T01-59-54Z
docker.io/minio/mc:latest
docker.io/mosipdev/esignet-with-plugins:release-1.8.x
docker.io/mosipdev/oidc-ui:release-1.8.x
docker.io/mosipdev/partner-onboarder:develop
docker.io/mosipdev/postgres-init:develop
docker.io/mosipid/captcha-validation-service:0.1.0-beta.1
docker.io/mosipid/kafka:3.2.1-debian-11-r9
docker.io/mosipid/keycloak-init:1.2.0.2
docker.io/mosipid/kibana:7.17.2-debian-10-r0
docker.io/mosipid/minio:2022.2.7-debian-10-r0
docker.io/mosipid/mosip-artemis-keycloak:1.2.0.2
docker.io/mosipid/os-shell:12-debian-12-r46
docker.io/mosipid/partner-onboarder:1.3.0-beta.1
docker.io/mosipid/postgresql:14.2.0-debian-10-r70
docker.io/mosipid/redis:7.0.5-debian-11-r25
docker.io/mosipid/softhsm:v2
docker.io/mosipid/zookeeper:3.8.0-debian-11-r30
docker.io/mosipint/elasticsearch:7.17.2-debian-10-r4
docker.io/mosipqa/apitest-esignet:2.0.x
docker.io/mosipqa/esignet:2.0.x
docker.io/mosipqa/mock-identity-system:0.14.x
docker.io/mosipqa/mock-identity-system:develop
docker.io/mosipqa/mock-relying-party-service:0.14.x
docker.io/mosipqa/mock-relying-party-ui:0.14.x
docker.io/mosipqa/oidc-ui:2.0.x
docker.io/mosipqa/uitest-esignet:2.0.x
docker.io/provectuslabs/kafka-ui:v0.4.0
docker.io/rancher/fleet-agent:v0.7.0
docker.io/rancher/hardened-calico:v3.27.3-build20240423
docker.io/rancher/hardened-cluster-autoscaler:v1.8.10-build20240124
docker.io/rancher/hardened-coredns:v1.11.1-build20240305
docker.io/rancher/hardened-etcd:v3.5.9-k3s1-build20240418
docker.io/rancher/hardened-flannel:v0.25.1-build20240423
docker.io/rancher/hardened-k8s-metrics-server:v0.7.1-build20240401
docker.io/rancher/hardened-kubernetes:v1.28.9-rke2r1-build20240416
docker.io/rancher/klipper-helm:v0.8.3-build20240228
docker.io/rancher/mirrored-banzaicloud-fluentd:v1.14.6-alpine-5
docker.io/rancher/mirrored-fluent-fluent-bit:2.2.0
docker.io/rancher/mirrored-grafana-grafana:9.1.5
docker.io/rancher/mirrored-jimmidyson-configmap-reload:v0.4.0
docker.io/rancher/mirrored-kiwigrid-k8s-sidecar:1.24.6
docker.io/rancher/mirrored-kube-logging-logging-operator:4.4.0
docker.io/rancher/mirrored-kube-state-metrics-kube-state-metrics:v2.10.1
docker.io/rancher/mirrored-library-busybox:1.31.1
docker.io/rancher/mirrored-library-nginx:1.24.0-alpine
docker.io/rancher/mirrored-prometheus-adapter-prometheus-adapter:v0.10.0
docker.io/rancher/mirrored-prometheus-alertmanager:v0.26.0
docker.io/rancher/mirrored-prometheus-node-exporter:v1.3.1
docker.io/rancher/mirrored-prometheus-operator-prometheus-config-reloader:v0.65.1
docker.io/rancher/mirrored-prometheus-operator-prometheus-operator:v0.65.1
docker.io/rancher/mirrored-prometheus-prometheus:v2.45.0
docker.io/rancher/mirrored-sig-storage-snapshot-controller:v6.2.1
docker.io/rancher/mirrored-sig-storage-snapshot-validation-webhook:v6.2.2
docker.io/rancher/pushprox-client:v0.1.0-rancher2-client
docker.io/rancher/pushprox-proxy:v0.1.0-rancher2-proxy
docker.io/rancher/rancher-agent:v2.7.5
docker.io/rancher/rancher-webhook:v0.3.5
docker.io/rancher/rke2-cloud-provider:v1.29.3-build20240412
docker.io/rancher/shell:v0.1.20
docker.io/yauritux/busybox-curl:latest
```

### 6. Test Execution Report

Below are the test metrics from performing functional testing. The process followed was black box testing, basing its test cases on the specifications of the software component under test. The functional test was performed in combination with individual module testing as well as integration testing. Test data were prepared in line with the user stories. Expected results were monitored by examining the user interface. The coverage includes GUI testing, System testing, and End-to-End flows across multiple languages and configurations.

Verification is performed on various configurations, including:

* Default configuration with verified configuration for 3 languages (English/Arabic/French)

#### 6.1 Test Case Execution Summary

The Test Case Execution Summary section provides a detailed overview of the total test cases executed across platforms, including pass, fail, and skip counts. It includes a table summarizing results and observations on execution and pass rates.

**Test Case — UI based verification**

| Total | Passed | Failed | Skipped (N/A) |
| ----- | ------ | ------ | ------------- |
| 378   | 327    | 51     | 0             |

Test Rate: 100% with Pass Rate: 86.72%

**Test Case — API based verification (API)**

| Total | Passed | Failed | Skipped (N/A) |
| ----- | ------ | ------ | ------------- |
| 735   | 683    | 52     | 0             |

Test Rate: 100% with Pass Rate: 92.32%

#### 6.2 Automation Results

This section provides a summary of the automated test execution. It shows the pass, fail, and known issues from the automated test suite.

**Automation Execution Result — API Testrig — Mock ID environment**

| Module  | Total | Passed | Failed | Skipped (N/A) | Ignored | Known Issues |
| ------- | ----- | ------ | ------ | ------------- | ------- | ------------ |
| eSignet | 220   | 177    | 0      | 0             | 0       | 43           |

Test Rate: 100% with Pass Rate: 100%

**Automation Execution Result — API Testrig — MOSIP ID environment**

| Module  | Total | Passed | Failed | Skipped (N/A) | Ignored | Known Issues |
| ------- | ----- | ------ | ------ | ------------- | ------- | ------------ |
| eSignet | 219   | 175    | 0      | 0             | 0       | 43           |

Test Rate: 100% with Pass Rate: 62.10%

**Automation Execution Result — API Testrig — Sunbird environment**

| Module  | Total | Passed | Failed | Skipped (N/A) | Ignored | Known Issues |
| ------- | ----- | ------ | ------ | ------------- | ------- | ------------ |
| eSignet | 212   | 169    | 0      | 0             | 0       | 43           |

Test Rate: 100% with Pass Rate: 100%

**Automation Execution Result — UI Automation — Mock ID environment**

| Total | Passed | Failed | Skipped (N/A) | Ignored | Known Issues |
| ----- | ------ | ------ | ------------- | ------- | ------------ |
| 36    | 30     | 0      | 3             | 0       | 3            |

Test Rate: 91.67% with Pass Rate: 100%

**Automation Execution Result — UI Automation — MOSIP ID environment**

| Total | Passed | Failed | Skipped (N/A) | Ignored | Known Issues |
| ----- | ------ | ------ | ------------- | ------- | ------------ |
| 36    | 30     | 0      | 3             | 0       | 3            |

Test Rate: 91.67% with Pass Rate: 100%

**Automation Execution Result — UI Automation — Sunbird environment**

| Total | Passed | Failed | Skipped (N/A) | Ignored | Known Issues |
| ----- | ------ | ------ | ------------- | ------- | ------------ |
| 36    | 10     | 0      | 24            | 0       | 2            |

Test Rate: 33.33% with Pass Rate: 100%

#### 6.3 Detailed Test Metrics

Below are the detailed test metrics from performing manual/automation testing. The project metrics are derived from defect density, test coverage, test execution coverage, test tracking and efficiency.

The various metrics that assist in test tracking and efficiency are as follows:

1. **Passed Test Cases Coverage** — measures the percentage of passed test cases. (Number of passed tests / Total number of tests executed) x 100
2. **Failed Test Case Coverage** — measures the percentage of all failed test cases. (Number of failed tests / Total number of test cases executed) x 100

#### 6.4 Browser Compatibility Evaluations

**Browser versions tested on desktop/laptop**

| Sl. No | Browser | Versions                       |
| ------ | ------- | ------------------------------ |
| 1      | Chrome  | Version 153.0 and above        |
| 2      | Firefox | Version 118.0 and above        |
| 3      | Edge    | Version 153.0 and above        |
| 4      | Safari  | Version 26.5 (20621.3.11.11.3) |

### 7. Feature Health

**Pass/fail counts by feature area:**

| Feature                                         | Pass | Fail |
| ----------------------------------------------- | ---- | ---- |
| Login ACRs                                      | 368  | 38   |
| Create & update OIDC with additional config     | 231  | 24   |
| DPoP & PAR                                      | 138  | 6    |
| Consent                                         | 77   | 11   |
| Multi-language & UI usability                   | 69   | 10   |
| Discovery, issuer identification & UserInfo JWE | 35   | 1    |
| Deployment & configuration                      | 92   | 13   |

#### 7.1 Known Issues Metrics

This section focuses on a separate category of issues that are known but not addressed in the current release. It provides a count and severity distribution for these defects across releases.

**Defect Metrics for the known issues**

| Blocker | Critical | Major | Minor | Total |
| ------- | -------- | ----- | ----- | ----- |
| 0       | 1        | 32    | 34    | 67    |

### 8. Sonar Report

Static code analysis summary for `esignet-esignet-service` (branch `release-2.0.x`, commit `db628423`) — 27k lines of code, last analysis run 3 days prior to this report, with 1 analysis warning and 2 quality gate conditions failed.

| Metric            | Result                                    | Requirement        |
| ----------------- | ----------------------------------------- | ------------------ |
| Security Rating   | **B** — 3 open issues (Failed)            | Rating required: A |
| Reliability       | **A** — 10 open issues                    | —                  |
| Maintainability   | **A** — 54 open issues                    | —                  |
| Accepted Issues   | 0 (valid issues that were not fixed)      | —                  |
| Coverage          | **76.7%** on 7.8k lines to cover (Failed) | Required ≥ 80.0%   |
| Duplications      | 1.0% on 33k lines                         | Required ≤ 3.0%    |
| Security Hotspots | 0 (Deprecated)                            | Required = 100%    |

### 9. Conclusion

The eSignet 2.0.0 application has been validated in the esqa environment with the Mock ID, MOSIP ID and Sunbird plugins; core functionalities perform as expected and the open issues are tracked as known issues.

Sanity, regression, and integration testing were completed within the defined scope.

* Based on the test execution and results, QA approves the build for the Go release with the known issues listed in the Known Issues Metrics section.

#### 9.1 QA Approval

The build has met the defined exit criteria and is recommended for the Go release based on the following:

* **Test Case Execution:** All planned test cases (1113) have been executed; 1010 passed and 103 failed.
* **Story and Defect Closure:** In-scope user stories are verified; 64 open issues (1 Critical, 37 Major, 17 Minor, 9 not set) are tracked as known issues.
* **Automation Reports:** API-Testrig and UI automation execution reports have been reviewed and approved.
* **Documentation Sign-off:** All required test and release documentation has been reviewed and signed off.
* **Test Environment Stability:** The Mock ID and Sunbird environments remained stable.

Refer [**here**](https://github.com/mosip/test-management/tree/master/e-signet/2.0.0) to get more details on reports.

