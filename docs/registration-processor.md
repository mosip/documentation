# Overview

Registration Processor (Regproc) is a backend processing engine to enable the ID Lifecycle management. The diagram below shows the Registration Processor along with the other modules that contribute in generating an Unique Identification Number(UIN) for an individual. Internally, Regproc follows the [SEDA](https://en.wikipedia.org/wiki/Staged_event-driven_architecture) architecture where data flows via multiple stages till the UIN is issued.

![](_images/reg-proc.png)

The relationship of Regproc with other services is explained here. _NOTE: The numbers do not signify sequence of operations or control flow_

1. Registration packets are uploaded by [Registration Client](registration-client.md) to [Packet Receiver](https://github.com/mosip/registration/tree/1.2.0-rc2/registration-processor/init/registration-processor-packet-receiver-stage).
2. User pre-registration data is downloaded using the pre-registration datasync service.
3. Quality of biometrics is checked using an external biometric SDK. This is done in Regproc's [Quality Classifier stage](https://github.com/mosip/registration/blob/1.2.0-rc2/registration-processor/pre-processor/registration-processor-quality-classifier-stage/README.md).
4. Regproc shares biometric data with [ABIS](abis.md) and Manual adjudication System. The policy for sharing this data is fetched from [PMS](partner-management.md).
5. The above data is shared by providing a URL that partners use to fetch data.  This URL is obtained from [Datashare](data-share.md) service.
6. Regproc's [ABIS Middleware stage](https://github.com/mosip/registration/tree/1.2.0-rc2/registration-processor/core-processor/registration-processor-abis-middleware-stage) communicates with [ABIS](abis.md) via [Activemq](https://activemq.apache.org/). The ABIS performs deduplication and sends back result to the Q.  
7.
8.

## Stages and services
The Registration Processor contains several [stages and services](https://github.com/mosip/registration/tree/1.2.0-rc2#registration-stages-and-pipeline). 

The registration packet flows through the various stages depending on the type of flow. Refer [flows](https://github.com/mosip/registration/blob/1.2.0-rc2/docs/flows.md) 

# Build and deploy
Refer to [repo](https://github.com/mosip/registration/tree/1.2.0-rc2)

# APIs

# Configurations
Refer to [Configuration Guide](https://github.com/mosip/registration/blob/1.2.0-rc2/docs/configuration.md)

