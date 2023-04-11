# Build & Deployment

The developer guide for building and running various components of e-Signet is available in their respective repositories as mentioned below.

## Command to build

### Building and deployment of esignet service

Link to [Repository](https://github.com/mosip/esignet/tree/1.0.0/esignet-service)

**Prerequisite**

```
* Java 11
* Apache Maven 3.8.6
```
We provide two authenticator implementations:

* [esignet mock services](https://github.com/mosip/esignet-mock-services/tree/0.9.0/mock-esignet-integration-impl)
* [id-authentication](https://github.com/mosip/id-authentication/tree/release-1.2.0.1/authentication/esignet-integration-impl)

1. Run `mvn clean install -Dgpg.skip=true` to build the service jar.
2. Add either one of the authenticator implementation to the classpath to start the service.

_Note_: For more information, refer [here](https://docs.esignet.io/integration-guides).


### Building and deployment of esignet UI

Link to [Repository](https://github.com/mosip/esignet/tree/1.0.0/oidc-ui)

**Prerequisite**

```
	 * npm 8.1.2 or higher  
	 * node v16.13.2 or higher
```

To build and run esignet UI, refer [here](https://github.com/mosip/esignet/tree/1.0.0/oidc-ui#build--run-for-developers).


### Building and deployment of mock OIDC portal

Mock OIDC portal comprises of mock-relying-party-ui and mock-relying-party-service.

Link to Repositories:

1. [mock-relying-party-ui](https://github.com/mosip/esignet-mock-services/tree/0.9.0/mock-relying-party-ui)
2. [mock-relying-party-service](https://github.com/mosip/esignet-mock-services/tree/0.9.0/mock-relying-party-service)
 
**Prerequisite**

```
* npm 8.1.2 or higher  
* node v16.13.2 or higher
```

* To build and run mock-relying-party UI, refer [here](https://github.com/mosip/esignet-mock-services/tree/0.9.0/mock-relying-party-ui#build--run-for-developers).

* To build and run mock-relying-party service, refer [here](https://github.com/mosip/esignet-mock-services/tree/0.9.0/mock-relying-party-service#build--run-for-developers).


### Building and deployment of mock-identity-system

Link to [Repository](https://github.com/mosip/esignet-mock-services/tree/0.9.0/mock-identity-system)
 
**Prerequisite**

``` 
* Java 11
* Apache Maven 3.8.6
```

* Run `mvn clean install -Dgpg.skip=true` to build the service jar.


<!--

### Published Artifacts

* [mosipid/idp:0.9.0](https://hub.docker.com/layers/mosipid/idp/0.9.0/images/sha256-855d867c47b87c9722551dfa401140f47722ebbd10f68f77b3115847ca530324?context=explore)
* [mosipid/idp-ui:0.9.0](https://hub.docker.com/layers/mosipid/idp-ui/0.9.0/images/sha256-078d55236bf59a644bfa45f1bcc007c72c3bf6998a9c5ae630a1cd79ae15b0e7?context=explore)
* [mosipid/oidc-ui:0.9.0](https://hub.docker.com/layers/mosipid/oidc-ui/0.9.0/images/sha256-a254796a60098a2aabe6db5b107d85fbd6c6c30cd6a4456e7168160d6762a9da?context=explore)
* [mosipid/oidc-server:0.9.0](https://hub.docker.com/layers/mosipid/oidc-server/0.9.0/images/sha256-ef003475ff3cba9b71f6a17772a011226ba8c885e03081a2b960a8bd487d4790?context=explore)

## Deployment \[TODO]

Prerequisite

Can I use the dockers directly?

How can I run it on my development machine?

How to deploy?

How to scale

How to configure

How to test
-->
