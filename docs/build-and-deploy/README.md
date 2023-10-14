# Build & Deployment

The latest and greatest released codebase can be found under "master" branch. All the ongoing bug fixes or feature development are usually on the "develop" or on a specific feature branch.

Note: It is recommended to either use master or released tags for the local deployment and testing.

## Build Backend services
	
e-Signet core and service modules use maven as build tool. esignet-service is a spring boot application which hosts all the REST endpoints.

**Prerequisite**

``` 
* Java 11
* Apache Maven 3.8.6
```

* Run `mvn clean install -Dgpg.skip=true` to build.

Note: Use -DskipTests=true to skip test case execution


## Build UI

e-Signet UI is a React application which is built using npm.

**Prerequisite**

```
	 * npm 8.1.2 or higher  
	 * node v16.13.2 or higher
```

* Run `npm install`
* Run `npm run build`


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
