# Sonar Scan Report

## Purpose

SonarCloud is used as a tool for deep code analysis, to explore all source files, whether in branches or pull requests, to reach a green Quality Gate and promote the build.

* SonarCloud URL: `https://sonarcloud.io/organizations/mosip/projects`
* Git Branch: **1.2.0-rc2**

## LTS Release gates

* Code coverage: to be maintained greater than or equal to 80%
* Bugs: There should be no critical bugs open
* Security Vulnerability: 0
* Security Hotspot: 0
* Code Duplications to be maintained below 3%

### Code Coverage

**Target :** Code coverage to be maintained greater than or equal to 80%

![Module Wise Code Coverage](../../.gitbook/assets/modulewise\_code\_coverage.png)

| **Module Name**                 | **Code Coverage** |
| ------------------------------- | ----------------- |
| **Commons**                     | 84.10%            |
| **Admin**                       | 80.00%            |
| **Pre Registration**            | 80.40%            |
| **Registration client**         | 65.80%            |
| **Registration Processor**      | 80.00%            |
| **ID Authentication**           | 80.80%            |
| **ID Repository**               | 62%               |
| **Resident Services**           | 64.70%            |
| **Partner Management Services** | 81%               |

### Reliability: Bugs

**Target:** There should be no critical bugs open

![Module Wise Bugs and Target](../../.gitbook/assets/modulewise\_bugs\_and\_target.png)

| **Module Name**                 | **Bugs Count** |
| ------------------------------- | -------------- |
| **Commons**                     | 0              |
| **Admin**                       | 20             |
| **Pre Registration**            | 0              |
| **Registration client**         | 46             |
| **Registration Processor**      | 12             |
| **ID Authentication**           | 0              |
| **ID Repository**               | 0              |
| **Resident Services**           | 0              |
| **Partner Management Services** | 0              |

### Security Vulnerabilities and Security Hotspots

**Target:** There should be no security vulnerabilities and hotspots

![Module Wise Secury Vulnerabbilities and Hotspots](../../.gitbook/assets/modulewise\_securiy\_vulnerabilities\_hotspots.png)

| **Module Name**                 | **Vulnerabilities** | **Hotspots** |
| ------------------------------- | ------------------- | ------------ |
| **Commons**                     | 0                   | 0            |
| **Admin**                       | 5                   | 0            |
| **Pre Registration**            | 0                   | 0            |
| **Registration client**         | 0                   | 3            |
| **Registration Processor**      | 1                   | 2            |
| **ID Authentication**           | 0                   | 0            |
| **ID Repository**               | 0                   | 0            |
| **Resident Services**           | 0                   | 0            |
| **Partner Management Services** | 0                   | 0            |

### Code Duplications

**Target:** Code duplications should be less than 3%

![Module Wise Duplicate Code](../../.gitbook/assets/modulewise\_duplicate\_code.png)
