# MOSIP External Dependencies

External Dependencies are set of external requirements that are needed for functioning of MOSIP’s core services like DB, Object Store, and HSM etc.

List of external dependencies:

* [Postgres](https://www.postgresql.org/): Relational Database system used for storing data in MOSIP.
* IAM: IAM tool is for authentication and authorization. Reference implementation here uses [Keycloak](https://www.keycloak.org/) for the  same purpose.
* [HSM](https://en.wikipedia.org/wiki/Hardware_security_module): Hardware Security Module (HSM) stores the cryptographic keys used in MOSIP. Reference implementation is provided as SoftHSM here.
* [Object Store](https://en.wikipedia.org/wiki/Object_storage): MOSIP uses S3 API compliant object store for storing biometric and other data. Reference implementation here uses [MinIO](https://min.io/).
* Anti-virus: Used for document scanning and packets scanning throughout MOSIP modules. Reference implementation uses dockerised version of [ClamAV](https://www.clamav.net/).
* Queuing tool: Tool used for queuing messages to external MOSIP components. Reference implementation used [Artemis ActiveMQ](https://activemq.apache.org/components/artemis/).
* Event Publisher/ streamer: MOSIP uses Kafka for publishing events to it's internal as well as external partners modules.
* BioSDK: Biometric SDK for quality check and authentication purpose using biometrics.
* [ABIS](https://docs.mosip.io/1.2.0/biometrics/abis): Performs the de-duplication of a resident's biometric data.
* Message Gateway: This is for notifying residents about different OTPs and other information.

## Installation

### Postgres

* Install Postgres:

~~~
cd $INFRA_ROOT/deployment/v3/external/postgres
./install.sh
~~~

* Initialise Postgres DB:

~~~
cd $INFRA_ROOT/deployment/v3/external/postgres
./init_db.sh
~~~

Opt for yes and enter **Y**.

### Keycloak


