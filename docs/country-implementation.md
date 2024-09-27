# 🌍 Country Implementation

## Overview

This is a guide to implement MOSIP for a country. It is advised that Government and System Integrators (SI) study the recommended steps to work out an appropriate implementation strategy. The items are in "near-chronological order" and may differ for an implementation.

## Key decisions

1. Choice of deployment of [Pre-registration](id-lifecycle-management/#pre-registration).
2. Rate of enrolment desired.
3. Rate of authentication expected.
4. [Languages](modules/module-configuration.md#languages).
5. Customisation and procurement of components as given [here](modules/reference-implementations.md).
6. [ID schema](id-lifecycle-management/id-schema.md) (as prescribed by the country's regulatory authority).
7. Hardware requirements estimate.
   * [Server side](https://github.com/mosip/documentation/tree/develop/docs/\_files)
   * [Devices](\_files/mosip-devices-calculator.xlsx)
8. [Credential choices](modules/id-repository/#credential-types).
9. ID Card print design.
10. MOSIP versions.
11. MOSIP support (scope).
12. Disaster recovery strategy.
13. Phased approach for rollout.

## Procurement

1. Engagement with an SI - terms and conditions.
2. Procurement of biometric and other external components.
3. HSM
4. [Postgres](https://docs.mosip.io/1.2.0/modules/persistence/postgres-db))
5. [Object store](https://docs.mosip.io/1.2.0/modules/persistence/object-store)
6. Compute hardware

## Country specific data

1. [Masterdata](https://docs.mosip.io/1.2.0/modules/administration/masterdata-guide)
2. [Applicanttype MVEL](https://github.com/mosip/mosip-config/blob/develop3-v3/applicanttype.mvel)

## Customisation

1. Customisation of components as decided in [step 5 of Key decisions](country-implementation.md#key-decisions) above.

## Deployment

1. [Certifcate/key generation](modules/keymanager/keys.md)
2. [Deployment design](https://docs.mosip.io/1.2.0/deploymentnew/getting-started).
3. Disaster recover set up
4. Biometric thresholding
5. Phased implementation
6. [Sandbox](https://docs.mosip.io/1.2.0/sandbox-details), staging, development setups.
7. IDA installation

## Partners

1. Onboarding of trusted partners
2. Print partner

## Rollout

1. Set up of registration centers
2. Onboarding of officers and supervisors
3. Training
