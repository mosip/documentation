# Country Implementation

## Overview
This is a guide to implement MOSIP in a country. The steps here are recommendations and it is advised that a System Integrator (SI) and studies them well and work on an appropriate implementation strategy.  The items are in "near-chronological order" and may differ based on worked out strategy. 

## Key decisions
1. Choice of deployment of PreReg.
2. Rate of enrollment desired.
3. Rate of authentication expected.
4. Languages
5. Customsiation and procurement of components given [here](reference-implementations.md).
5. [ID schema](id-schema.md) (in commpliance with legal framework).
6. Hardware requirements estimate. 
    * [Server side](server-hardware-requirements.md)
    * [Devices](biometric-devices.md#devices-calculator)
7. Credential choices. ID Card print design.
8. MOSIP versions
9. MOSIP support (scope)

## Procurement
1. Engagement with an SI. Terms and conditions.
1. Procurement of biometric and other external components.
1. HSM
1. Postgres (external)
1. Compute and storage Hardware

## Country specific data
1. Masterdata 
1. Applicanttype MVEL

## Customisation
1. Customisation of components as decided in [step 5](key-decisions) above.

## Deployment
1. Certifcate/key generation
1. Production grade deployment design. Disaster Recovery strategy.
1. Biometric thresholding
1. Phased implementation 
1. Sandbox, staging, development setups.
1. Production grade deployment
1. IDA installation

## Partners
1. Onboarding of trusted partners
1. Print partner

## Roll out
1. Set up of registration centers
1. Onboarding of officers and supervisors
1. Training

 

