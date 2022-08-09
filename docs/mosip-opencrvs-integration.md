# MOSIP OpenCRVS

## Overview

This document describes plan & scope of integration of MOSIP and OpenCRVS.

## Integration plan

* Phase 1: Technical Proof Of Concept integration (v0.5)
* Phase 2: Detailed design of production implementation (v1.0)
* Phase 3: Implementation of v1.0.
* Phase 4: Installing on MEC.

## Scope

The following is a list of possible scenarios to be covered in this integration.

1. A birth is certified by OpenCRVS. MOSIP receives event data, creates UIN for the birth.
2. A death is certified by OpenCRVS. MOSIP receives event data, deactivates the particular UIN.
3. A birth is corrected on OpenCRVS. MOSIP receives event data, corrects the particular details of that person.
4. A death is corrected on OpenCRVS. MOSIP receives event data, corrects the particular details of that person.
5. Upon birth certification, once MOSIP generates UIN, MOSIP issues the relevant details/credentials back to OpenCRVS.
6. Upon birth certification, if MOSIP encounters a problem while generating UIN, MOSIP issues back an error to OpenCRVS.
7. TBD

## Phase 1: Technical Proof Of Concept integration (v0.5)

{% embed url="https://www.youtube.com/watch?t=3s&v=1dtM5ve0qA8" %}

* In this phase, v0.5 POC, only 1,2,5 scopes are handled.
* The following new components are added:
  * OpenCRVS Side Mediator. (Maintained and deployed by OpenCRVS)
  * MOSIP Side Mediator.
  * OpenCRVS Stage - Registration Processor.

### Design

![Opencrvs Integration v0.5](\_images/opencrvs\_integration\_v0.5.png)

### OpenCRVS Side Mediator

* Runs on OpenCRVS cluster. Maintained by OpenCRVS.
* Subscribes to OpenCRVS Webhooks for `BIRTH_REGISTERED` and `DEATH_REGISTERED` events.
* Receive data from webhooks, for the above events. Encrypts that data. Sends it over to MOSIP Side Mediator on private/internal MOSIP channel.
* Receives UIN from MOSIP Side Mediator when uin generation is successful.
  * For the purposes of this phase, it was decided that MOSIP would send the UIN back. TBD whether this can continue in later phases.

### MOSIP Side Mediator

* Runs on MOSIP Cluster. Maintained by MOSIP.
* Subscribes to MOSIP WebSub, for `CREDENTIAL_ISSUED` event.
* Receives data from OpenCRVS.
  * On Birth:
    * Puts the birth data to Kafka.
    * Reads data from Kafka asynchronously. Creates a _registration packet_ with the data from OpenCRVS, using _packetmanager_ library, with _process type_ as `OPENCRVS_NEW` and source as `OPENCRVS`.
    * Uploads the packet to _regproc-packetreceiver_ service.
    * Syncs the packet with _regproc-status_ service.
    * Updates _rid_, and _status_ in `mosip-opencrvs/birth_transactions` database table.
    * For the purposes of this phase, this birth process is just emulating the way _Registration Client_ would make a registration.
    * A better procedure for creating registrations through partners is TBD.
  * On Death: WIP
* Receives data from _WebSub_, upon credential being issued. Proxies the data, off to OpenCRVS Side Mediator.

### Registration Processor

Only the following stages are included in the registration processor route (in the same order) for the packet with `OPENCRVS_NEW` process type:

* Packet Receiver
* Securezone Notifier
* Packet Uploader
* Packet Validator
* Packet Classifier
* Introducer Validator
* UIN Generator
* Finalization
* Print Stage
* OpenCRVS Stage
  * This is a new stage, that just issues the credential to `opencrvs` partner.

The following stages are omitted:

* CMD Validator
* Operator Validator
* Supervisor Validator
* Quality Classifier
* Demographic Deduplication
* Biometric Deduplication
* ABIS Handler
* ABIS Middleware
* Verification
* Manual Adjudication
* Biometric Extraction.

### Installation Instructions

* For MOSIP Side Components installation, refer to [mosip-opencrvs deployment instructions](https://github.com/mosip/mosip-opencrvs/tree/develop/deployment).

## Phase 2: Detailed design of production implementation (v1.0)

### Birth registration

![Opencrvs Integration for new birth](\_images/opencrvs\_birth-registration\_v1.2.png)

### Death registration

![Opencrvs Integration for death](\_images/opencrvs\_death-registration\_v1.2.png)

### Death reversal&#x20;

![Opencrvs Integration for death reversal](\_images/opencrvs\_death-reversal\_v1.2.png)

### Data modification

![Opencrvs Integration for data modification](\_images/opencrvs\_data-modification\_v1.2.png)

### Specification for MOSIP Mediator (TBD)

## Source code

* For MOSIP Side Components (Mediator and Regproc Stage), refer to [mosip-opencrvs](https://github.com/mosip/mosip-opencrvs/tree/develop) repository.
* For OpenCRVS Side Mediator , refer to [opencrvs's mosip-mediator](https://github.com/opencrvs/mosip-mediator) repository.
