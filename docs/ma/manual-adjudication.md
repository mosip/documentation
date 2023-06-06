# Manual Adjudication

## Overview

* When biometric duplicates are found in ABIS, the MOSIP system sends a request for manual adjudication to the Manual Adjudication System via a queue. 
* The system integrator can build the Manual Adjudication System, which would be listening to the `MOSIP-to-ManualAdjudication` queue for any manual adjudication requests and sends a response back in the `ManualAdjudication-to-MOSIP` system after verifying the data.
* The data sent to the Manual Adjudication System is driven by a policy defined in MOSIP and the specification is similar to ABIS identify request.

The manual adjudication stage in [registration processor](https://docs.mosip.io/1.2.0/modules/registration-processor) performs the following functions:
* Sends the applicant's demographic and biometric information (via queue + Datashare) to Manual Adjudication System (MAS).
* Receives decision from MAS and accordingly forwards the packets.
* If rejected, notifies the applicant.