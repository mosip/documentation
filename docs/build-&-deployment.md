# Build & Deployment

The developer guide for building and running various components of e-Signet is available in their respective repositories as mentioned below.

## Command to build

### Building [IdP-service](https://github.com/mosip/idp/tree/0.9.0)

**Prerequisite**

```
* Java 11
* Apache Maven 3.8.6
```

* Run the command `mvn clean install -Dgpg.skip=true` to build the project (skipping the building signing).
* After a successful build, the below artifacts will be available under the target folder of each module:
  * idp-core/target
  * idp-service/target
  * authentication-wrapper/target

> Note: `authentication-wrapper` is a runtime dependency and it must be available in the classpath when running the `idp-service`.

### Building [IdP-UI](https://github.com/mosip/idp-ui/tree/0.9.0)

**Prerequisite**

```
 * npm 8.1.2 or higher  
 * node v16.13.2 or higher
```

* Run command `npm run build` to build the project.
* After a successful build, the complete JS bundle with public files will be available under `idp-ui/build` the folder.

### Building [Mock OIDC client](https://github.com/mosip/oidc-demo-portal/tree/0.9.0)

**Prerequisite**

```
* npm 8.1.2 or higher
* node v16.13.2 or higher
```

* Run command `npm run build` to build the project.
* After a successful build, the complete JS bundle with public files will be available under `oidc-demo-portal/build` the folder.

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
