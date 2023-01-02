# Overview

e-Signet allows easy and efforltess Sign on to applications using the country's Digital Foundation ID. This document highlights the various unlerlying priciples that were adopted to build a thin layer around the existing ID authentication system. The actual integration is abstracted and taken as dynamic library dependency.

* Easy relying party integration
* Inclusive approach
* Support of biometric devices
* Support any identity repository.
 
## Design Principles

1. Solution should be able to independently operate without much dependency on existing services of MOSIP platform
2. All integration libraries to ID system should be a runtime plugable to reuse the official container images which helps with easier upgrades
3. Number of containers / runable applications to be kept to a minimum to avoid management overhead
4. Standard interfaces to be used as much as possible for integrations between components
5. Utilize framework abstractions to connect with off-the-shelf tools where ever possible to allow easy technology switching
6. Should manage all the transactional data in expiring cache to increase data retrieval performance
7. UI and backend service should be maintained as separate components and integration should be through REST API
8. The API endpoint exposed should be stateless (avoid stickiness) to support better horizontal scaling
9. IAM based API authorization should have configuration to switched off to allow external network based mechanisms to control authorization and avoid high dependency on IAM system
10. All personally identifiable information (PII) should be kept encrypted in storage and transit

TBD: [Vishwanath V](https://app.gitbook.com/u/Kyda2yhlctS6UJ3XIyT6t6VpEHs1 "mention")

![](\_images/idp_diagrams_updated_2-Page-2.png)

