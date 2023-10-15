# Build & Deployment

The latest stable released codebase can be found under the "master" branch of the e-Signet codebase. All the ongoing bug fixes or feature development are usually on the "develop" or on a specific feature branch.

{% hint style="info" %}
It is recommended to either use master or released tags for local deployment and testing.
{% endhint %}

## Build backend services

[esignet-core](https://github.com/mosip/esignet/tree/master/esignet-core) and [esignet-service](https://github.com/mosip/esignet/tree/master/esignet-service) modules use Maven as the build tool. [esignet-service](https://github.com/mosip/esignet/tree/master/esignet-service) is a spring-boot application that hosts all the REST endpoints.

**Prerequisite**

* Java 11
* Apache Maven 3.8.6

**Build**

Run the below command to build e-Signet backend services.

```
mvn clean install -Dgpg.skip=true
```

{% hint style="info" %}
Use -DskipTests=true to skip test case execution
{% endhint %}

## Build UI

[e-Signet UI](https://github.com/mosip/esignet/tree/master/oidc-ui) is a react application that is built using npm.

**Prerequisite**

* npm 8.1.2 or higher
* node v16.13.2 or higher

**Build**

* Run the below command to install all the required dependencies

```
npm install
```

* Run the below command to build the UI application

```
npm run build
```
