# Country Implementation

## Overview
This is a guide to implement MOSIP for a country. It is advised that Government and System Integrators (SI) study the recommended steps to work out an appropriate implementation strategy. The items are in "near-chronological order" and may differ for an implementation.

## Key decisions
1. Choice of deployment of [Pre-registration](id-lifecycle-management.md#pre-registration).
2. Rate of enrollment desired.
3. Rate of authentication expected.
4. [Languages](module-configuration.md#languages).
5. Customsiation and procurement of components as given [here](reference-implementations.md).
5. [ID schema](id-schema.md) (as prescribed by the Government's regulatory authoritory)
6. Hardware requirements estimate. 
    * [Server side](server-hardware-requirements.md)
    * [Devices](biometric-devices.md#devices-calculator)
7. [Credential choices](id-repository.md#credential-types)
9. ID Card print design
9. MOSIP versions
10. MOSIP support (scope)
11. Disaster recovery strategy
12. Phased approach for rollout.

## Procurement
1. Engagement with an SI. Terms and conditions.
1. Procurement of biometric and other external components.
1. HSM
1. [Postgres](storage.md#postgres-db)
1. [Object store](storage.md#object-store)
1. Compute hardware

## Country specific data
1. [Masterdata](masterdata-guide.md)
1. [Applicanttype MVEL](https://github.com/mosip/mosip-config/blob/develop3-v3/applicanttype.mvel)


## Customisation
1. Customisation of components as decided in [step 5](key-decisions) above.

## Deployment
1. [Certifcate/key generation](keys.md)
1. Production grade deployment design. 
1. Disaster recover set up
1. Biometric thresholding
1. Phased implementation 
1. Sandbox, staging, development setups.
1. Production grade deployment
1. IDA installation

## Partners
1. Onboarding of trusted partners
1. Print partner

## Rollout
1. Set up of registration centers
1. Onboarding of officers and supervisors
1. Training

 

