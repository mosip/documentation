# Country Implementation

## Overview

This is a guide to implement MOSIP for a country. It is advised that Government and System Integrators (SI) study the recommended steps to work out an appropriate implementation strategy. The items are in "near-chronological order" and may differ for an implementation.

## Key decisions

1. Choice of deployment of [Pre-registration](id-lifecycle-management.md#pre-registration).
2. Rate of enrollment desired.
3. Rate of authentication expected.
4. [Languages](module-configuration.md#languages).
5. Customisation and procurement of components as given [here](reference-implementations.md).
6. [ID schema](id-schema.md) (as prescribed by the country's regulatory authority).
7. Hardware requirements estimate.
   * [Server side](broken-reference)
   * [Devices](biometric-devices.md#devices-calculator)
8. [Credential choices](id-repository.md#credential-types).
9. ID Card print design.
10. MOSIP versions.
11. MOSIP support (scope).
12. Disaster recovery strategy.
13. Phased approach for rollout.

## Procurement

1. Engagement with an SI - terms and conditions.
2. Procurement of biometric and other external components.
3. HSM
4. [Postgres](broken-reference/)
5. [Object store](broken-reference/)
6. Compute hardware

## Country specific data

1. [Masterdata](https://docs.mosip.io/1.2.0/modules/administration/masterdata-guide)
2. [Applicanttype MVEL](https://github.com/mosip/mosip-config/blob/develop3-v3/applicanttype.mvel)

## Customisation

1. Customisation of components as decided in [step 5 of Key decisions](country-implementation.md#key-decisions) above.

## Deployment

1. [Certifcate/key generation](keys.md)
2. Production grade deployment design.  Refer [Production Deployment](broken-reference).
3. Disaster recover set up
4. Biometric thresholding
5. Phased implementation
6. Sandbox, staging, development setups.
7. Production grade deployment
8. IDA installation

## Partners

1. Onboarding of trusted partners
2. Print partner

## Rollout

1. Set up of registration centers
2. Onboarding of officers and supervisors
3. Training
