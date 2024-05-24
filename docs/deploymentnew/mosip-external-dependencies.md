# MOSIP External Dependencies

External Dependencies are set of external requirements that are needed for functioning of MOSIP’s core services like DB, Object Store, and HSM etc.

List of external dependencies:

* [Postgres](https://www.postgresql.org/): Relational Database system used for storing data in MOSIP.
* IAM: IAM tool is for authentication and authorization. Reference implementation here uses [Keycloak](https://www.keycloak.org/) for the same purpose.
* [HSM](https://en.wikipedia.org/wiki/Hardware\_security\_module): Hardware Security Module (HSM) stores the cryptographic keys used in MOSIP. Reference implementation is provided as SoftHSM here.
* [Object Store](https://en.wikipedia.org/wiki/Object\_storage): MOSIP uses S3 API compliant object store for storing biometric and other data. Reference implementation here uses [MinIO](https://min.io/).
* Anti-virus: Used for document scanning and packets scanning throughout MOSIP modules. Reference implementation uses dockerised version of [ClamAV](https://www.clamav.net/).
* Queuing tool: Tool used for queuing messages to external MOSIP components. Reference implementation used [Artemis ActiveMQ](https://activemq.apache.org/components/artemis/).
* Event Publisher/ streamer: MOSIP uses Kafka for publishing events to it's internal as well as external partners modules.
* BioSDK: Biometric SDK for quality check and authentication purpose using biometrics.
* [ABIS](https://docs.mosip.io/1.2.0/biometrics/abis): Performs the de-duplication of a resident's biometric data.
* Message Gateway: This is for notifying residents about different OTPs and other information.

## Installation

### Postgres

* Install Postgres

```
cd $INFRA_ROOT/deployment/v3/external/postgres
./install.sh
```

* Initialize Postgres DB

```
cd $INFRA_ROOT/deployment/v3/external/postgres
./init_db.sh
```

Opt for yes and enter **Y**.

### Keycloak

* Install Keycloak

```
cd $INFRA_ROOT/deployment/v3/external/iam
./install.sh
```

* Initialize Keycloak

```
cd $INFRA_ROOT/deployment/v3/external/iam
./keycloak_init.sh
```

### Setup SoftHSM

```
cd $INFRA_ROOT/deployment/v3/external/hsm/softhsm
./install.sh
```

### Setup Object store

* Opt **1** for MinIO
* Opt **2** for S3 (incase you are not going with MinIO installation and want s3 to be installed)
  * Enter the prompted details.

#### MinIO installation

```
cd $INFRA_ROOT/deployment/v3/external/object-store/minio
./install.sh
```

#### S3 Credentials setup

```
cd $INFRA_ROOT/deployment/v3/external/object-store/
./cred.sh
```

### ClamAV setup

```
cd $INFRA_ROOT/deployment/v3/external/antivirus/clamav
./install.sh
```

### ActiveMQ setup

```
cd $INFRA_ROOT/deployment/v3/external/activemq
./install.sh
```

### Kafka setup

```
cd $INFRA_ROOT/deployment/v3/external/kafka
./install.sh
```

### BioSDK Server setup

Reference implementation of Biometric SDK server will be installed separately in MOSIP service installation section as the same is dependent on artifactory which is a MOSIP component.

### ABIS

ABIS is needed to be up and running outside the MOSIP cluster and should be able to connect to the activeMQ. For testing purpose, MOSIP has provided a mock stimulator for the same named as mock-abis which will be deployed as part of the MOSIP services installation.

### MSG Gateway

```
cd $INFRA_ROOT/deployment/v3/external/msg-gateway
./install.sh
```

* MOSIP provides `mock smtp server` which will be installed as part of default installation, opt for Y.

### Docker Secrets

```
cd $INFRA_ROOT/deployment/v3/external/docker-secrets
./install.sh
```

Incase the images are getting pulled from private repositories.

### Captcha

```
cd $INFRA_ROOT/deployment/v3/external/captcha
./install.sh
```

To setup the captcha for pre-reg and resident domains.

### Landing page setup

```
cd $INFRA_ROOT/deployment/v3/external/landing-page
./install.sh
```
